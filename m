Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914D76E3A42
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 18:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521608.810417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po56r-0004gO-Ox; Sun, 16 Apr 2023 16:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521608.810417; Sun, 16 Apr 2023 16:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po56r-0004fJ-L0; Sun, 16 Apr 2023 16:20:13 +0000
Received: by outflank-mailman (input) for mailman id 521608;
 Sun, 16 Apr 2023 16:20:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1po56q-0004eQ-9M
 for xen-devel@lists.xenproject.org; Sun, 16 Apr 2023 16:20:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po56q-0007lo-29; Sun, 16 Apr 2023 16:20:12 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po56p-0004lY-Qz; Sun, 16 Apr 2023 16:20:11 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=XSFsE8Hx/H0JzDaGHFB89rfXOYgq2FdVCM6+zj35iNc=; b=fgbb5B5QC8oKcI1VMOqfAclb6G
	1ZAjKahbaQpkvawYY/E2Vz8BsdH1uIbnCFDM3Y170JwOLyZMHhhvfh5slByszHlkRWCao4AH3IdIr
	fZi21OVdml4usCq0uDGxnulDSV8+sFYCHWD2+inQW0gtBZqRZp4bMXh/tKtJB8syhsVo=;
Message-ID: <b9374174-37b8-9bd1-2e2d-55efd22f8a14@xen.org>
Date: Sun, 16 Apr 2023 17:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v4 0/3] Memory region overlap check in device tree
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230201021513.336837-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230201021513.336837-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 01/02/2023 02:15, Henry Wang wrote:
> As we are having more and more types of memory region defined in the
> device tree, it is necessary to add the overlap check of these memory
> regions in Xen, because such check will help user to identify the
> misconfiguration in the device tree at the early stage of boot time.
> 
> The first patch introduces the basic memory overlap check mechanism,
> and does the memory check for memory regions in bootinfo.reserved_mem.
> Following patches extend the overlap check to include bootmodules and
> EfiACPIReclaimMemory.
> 
> v3 -> v4:
> 1. Correct printk error message, end should be exclusive.
> 2. Add comment explaining the unhandled case where '*_end' could be 0
>     if the module/region is at the end of the physical address space.
> 3. Add Stefano's reviewed-by tag.
> 
> v2 -> v3:
> 1. Use "[start, end]" format in printk error message.
> 2. Change the return type of helper functions to bool.
> 3. Use 'start' and 'size' in helper functions to describe a region.
> 
> v1 -> v2:
> - Split original `overlap_check()` to `meminfo_overlap_check()` and
>    `bootmodules_overlap_check()`.
> - Rework commit message.
> 
> Henry Wang (3):
>    xen/arm: Add memory overlap check for bootinfo.reserved_mem
>    xen/arm: Extend the memory overlap check to include bootmodules
>    xen/arm: Extend the memory overlap check to include
>      EfiACPIReclaimMemory

I have committed the series. Sorry for the late.

Cheers,

-- 
Julien Grall

