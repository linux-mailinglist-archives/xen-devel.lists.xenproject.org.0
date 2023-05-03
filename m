Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CF76F522D
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 09:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528984.822830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7E8-00035z-PX; Wed, 03 May 2023 07:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528984.822830; Wed, 03 May 2023 07:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7E8-00033J-MD; Wed, 03 May 2023 07:48:40 +0000
Received: by outflank-mailman (input) for mailman id 528984;
 Wed, 03 May 2023 07:48:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pu7E7-00033D-D5
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 07:48:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pu7E6-0002zq-O0; Wed, 03 May 2023 07:48:38 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pu7E6-0006SL-H6; Wed, 03 May 2023 07:48:38 +0000
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
	bh=yj+e1ojIhHwufSuyLSUso4b/P3PcU7U9UvJs47xRsIU=; b=dH+FJbRwaeuaH0NjrkQa91XgU4
	bWUxDnN3om/arSYfa08X2l9tl4WL0XFPKENF8tjk7DJ1V6macCncSwzlMLeIIZRcWFKs5x9uXjWkl
	nASqC68QL7mZVy6R0b4pSrb7cdmZWSw+lxlgE8MHoSlwenJnRz/c9KBakpzkjZQJdAoA=;
Message-ID: <a0d48f47-bb62-5ed0-0c9b-95935dc75ca3@xen.org>
Date: Wed, 3 May 2023 08:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] xen/arm: arm32: Enable smpboot on Arm32 based systems
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230502105849.40677-1-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2305021643010.974517@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2305021643010.974517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 03/05/2023 00:55, Stefano Stabellini wrote:
>> +    {
>> +        printk("CPU%d: No release addr\n", cpu);
>> +        return -ENODEV;
>> +    }
>> +
>> +    release = ioremap_nocache(cpu_release_addr[cpu], 4);
>> +    if ( !release )
>> +    {
>> +        dprintk(XENLOG_ERR, "CPU%d: Unable to map release address\n", cpu);
>> +        return -EFAULT;
>> +    }
>> +
>> +    writel(__pa(init_secondary), release);
>> +
>> +    iounmap(release);
> 
> I think we need a wmb() ?

I am not sure why we would need a wmb() here. Instead, looking at the 
Linux version, I think we are missing a cache flush (so does on arm64) 
which would be necessary if the CPU waiting for the release doesn't have 
cache enabled.

Cheers,

-- 
Julien Grall

