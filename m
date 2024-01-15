Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7D82E0AA
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 20:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667557.1038942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPSf7-0005sq-8L; Mon, 15 Jan 2024 19:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667557.1038942; Mon, 15 Jan 2024 19:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPSf7-0005qd-5l; Mon, 15 Jan 2024 19:30:21 +0000
Received: by outflank-mailman (input) for mailman id 667557;
 Mon, 15 Jan 2024 19:30:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rPSf4-0005qU-S1
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 19:30:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPSf4-0002NJ-E8; Mon, 15 Jan 2024 19:30:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPSf4-0001l8-58; Mon, 15 Jan 2024 19:30:18 +0000
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
	bh=EdCsos4Y20o+AcER+dtgG8EPIIzby5DRvTAwOvQ9aAE=; b=qS+HejuoPnek084gGPVB2wA7+O
	mABXlb5I2ymmm+0umJsJGF2b99e6PvW+BfV6+my2eJ5y2yegEQogH9/jyN7QBOUIjiiLkpiVBse1F
	+7KYoL5kH7Iytli4yStMg1W+K+PSeIdzr986+uDpCcLlwgryIi67HFjQM1FjQ9S7S4fg=;
Message-ID: <e3103572-6355-434e-ad61-4d85707d613d@xen.org>
Date: Mon, 15 Jan 2024 19:30:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm64: head: Allow to use early printk while on
 1:1 mapping
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240115124859.89218-1-michal.orzel@amd.com>
 <20240115124859.89218-3-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240115124859.89218-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 15/01/2024 12:48, Michal Orzel wrote:
> Take an example from commit 1ec3fe1f664f ("xen/arm32: head: Improve
> logging in head.S") to add support for printing early boot messages
> while running on identity mapping:
>   - define PRINT_SECT() macro to be able to specify a section for storing
>     a string. PRINT() will use .rodata.str and PRINT_ID() - .rodata.idmap.
>     This is necessary, because when running on identity mapping, the
>     strings need to be part of the first page that is mapped,
>   - move loading a runtime virtual UART address right after enabling MMU
>     (the corresponding steps repeated in {primary,secondary}_switched are
>     now consolidated in a single place),
>   - move early printk 'hex' string into .rodata.idmap and replace 'adr'
>     instruction in asm_putn with 'adr_l' to extend the addressable range,
>   - remove RODATA_STR() macro given no use.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

I have tested with my upcoming series to get all pre-MMU code in a 
single page.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

