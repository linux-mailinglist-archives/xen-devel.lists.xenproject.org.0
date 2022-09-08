Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A95B19CE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 12:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403062.645030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWEby-0007th-7y; Thu, 08 Sep 2022 10:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403062.645030; Thu, 08 Sep 2022 10:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWEby-0007rk-56; Thu, 08 Sep 2022 10:18:18 +0000
Received: by outflank-mailman (input) for mailman id 403062;
 Thu, 08 Sep 2022 10:18:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWEbw-0007re-WE
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 10:18:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWEbw-0004Z7-JM; Thu, 08 Sep 2022 10:18:16 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.18.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWEbw-0001ZQ-CG; Thu, 08 Sep 2022 10:18:16 +0000
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
	bh=nH9t/iXYZt7N17b6QYfrk5GCuSi131Omz97+6UBSeSw=; b=ShNryuk+UnNr+9LI9AcLvPEqaI
	FpERzB04mfpLtaoaVwfrfqGqS17ksk8hraxYWQYlTPgTBqJdlBWpCd4Q0kbnt0eidoBbLbvwZ04E8
	BRZQogl0KMqSThODSdFWwYUz6eZtu9MfR9FgK6spbG4MgwpZtrukRRFEZb8AMMzAL0Y0=;
Message-ID: <3c34c287-62f7-1f5d-0b4f-011303fd5a5c@xen.org>
Date: Thu, 8 Sep 2022 11:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v5 2/4] docs, xen/arm: Introduce static heap memory
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20220908042538.27076-1-Henry.Wang@arm.com>
 <20220908042538.27076-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220908042538.27076-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 08/09/2022 05:25, Henry Wang wrote:
> This commit introduces the static heap memory, which is parts of RAM
> reserved in the beginning of the boot time for heap.
> 
> Firstly, since a new type of memory bank is needed for marking the
> memory bank solely as the heap, this commit defines `enum membank_type`
> and use this enum in function device_tree_get_meminfo(). Changes of
> code are done accordingly following the introduction of this enum.
> 
> Also, this commit introduces the logic to parse the static heap
> configuration in device tree. If the memory bank is reserved as heap
> through `xen,static-heap` property in device tree `chosen` node, the
> memory will be marked as static heap type.
> 
> A documentation section is added, describing the definition of static
> heap memory and the method of enabling the static heap memory through
> device tree at boot time.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

With Michal's comments addressed:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

