Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DC1528B48
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 18:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330162.553488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqe1S-0001SS-R3; Mon, 16 May 2022 16:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330162.553488; Mon, 16 May 2022 16:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqe1S-0001Q2-OH; Mon, 16 May 2022 16:56:42 +0000
Received: by outflank-mailman (input) for mailman id 330162;
 Mon, 16 May 2022 16:56:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqe1R-0001Pw-L8
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 16:56:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqe1R-0006px-Dv; Mon, 16 May 2022 16:56:41 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.22.38]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqe1R-000585-7Y; Mon, 16 May 2022 16:56:41 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=u2QP62T1xpkDX3PrIFZc6oYC8SvERz6aJBQLz3/IAKg=; b=gyngPXFy/WZIIy32WQUAI0FBYV
	o2MUSTPnE9Th8a20PjdqA+iggYCYWhduSobFW02voR0BK+Zq6jXfyC7V6YiFc/4f19F6vAWCeYRjW
	+4FojADzqh4Dnt7MhSJDpZ+qLze10yLpG4Lsx5xKVSskD7bSZMrRbbe8Qhh0dO9TM5iI=;
Message-ID: <beffb616-855d-8b5b-feca-f9fdec5d6865@xen.org>
Date: Mon, 16 May 2022 17:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
From: Julien Grall <julien@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220516084517.76071-1-julien@xen.org>
 <2E233152-FF46-42CF-B2CD-62E0BBE793C3@arm.com>
 <d6457564-d29b-9dc5-7338-b06808bd7a6c@xen.org>
In-Reply-To: <d6457564-d29b-9dc5-7338-b06808bd7a6c@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/05/2022 10:50, Julien Grall wrote:
>>> @@ -381,6 +410,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
>>> int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
>>> {
>>>      unsigned int nr_lpi_ptrs;
>>> +    int rc;
>>>
>>>      /* We rely on the data structure being atomically accessible. */
>>>      BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
>>> @@ -413,7 +443,14 @@ int gicv3_lpi_init_host_lpis(unsigned int 
>>> host_lpi_bits)
>>>
>>>      printk("GICv3: using at most %lu LPIs on the host.\n", 
>>> MAX_NR_HOST_LPIS);
>>>
>>> -    return 0;
>>> +    /* Register the CPU notifier and allocate memory for the boot 
>>> CPU */
>>> +    register_cpu_notifier(&cpu_nfb);
>>> +    rc = gicv3_lpi_allocate_pendtable(smp_processor_id());
>>> +    if ( rc )
>>> +        printk(XENLOG_ERR "Unable to allocate the pendtable for 
>>> CPU%u\n",
>>> +               smp_processor_id());
>>
>> On secondary cores nothing equivalent will be printed and in the cal 
>> path there
>> will be nothing printed at all which could make debugging complex.
>> Can you move this print into gicv3_lpi_allocate_pendtable ?
> 
> Good point. I will do that in the next version.

I decided to duplicate the error message in the notifier instead. I felt 
it was better over adding goto in gicv3_lpi_allocate_pendtable(). I am 
fine to use goto if that's preferred.

Cheers,

-- 
Julien Grall

