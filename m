Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0864F4422
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 00:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299327.509975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbrPk-00071W-DX; Tue, 05 Apr 2022 22:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299327.509975; Tue, 05 Apr 2022 22:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbrPk-0006yw-9U; Tue, 05 Apr 2022 22:12:40 +0000
Received: by outflank-mailman (input) for mailman id 299327;
 Tue, 05 Apr 2022 22:12:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nbrPi-0006yq-Q3
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 22:12:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nbrPi-0002rL-IW; Tue, 05 Apr 2022 22:12:38 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nbrPi-0004fY-Cy; Tue, 05 Apr 2022 22:12:38 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=wnQ7IEvcuWj81NnD2cWgD+0hq/h0LgXbUwyYhZR+aDw=; b=ZJGKdTOg7KoEhs/IoWWEcbmG0H
	C/RNNDPM3enk/rHVEhpxVrwmZbmCIjaHYy+Iy/dUunp2Cc5YQo/31OhfbVtK64eixPIkUMSNS8VM1
	jUP8+CduCR6N/+Q5wxWe9AnxZm4I1E+SyzyaQzzV+bdmbaYCU0cb+p4Ts7wTQcQurq4s=;
Message-ID: <bc1930c6-9264-a6b1-9956-629546cab169@xen.org>
Date: Tue, 5 Apr 2022 23:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-18-julien@xen.org>
 <alpine.DEB.2.22.394.2204051444220.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 17/19] xen/arm64: mm: Add memory to the boot allocator
 first
In-Reply-To: <alpine.DEB.2.22.394.2204051444220.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 05/04/2022 22:50, Stefano Stabellini wrote:
>> +static void __init setup_mm(void)
>> +{
>> +    const struct meminfo *banks = &bootinfo.mem;
>> +    paddr_t ram_start = ~0;
>> +    paddr_t ram_end = 0;
>> +    paddr_t ram_size = 0;
>> +    unsigned int i;
>> +
>> +    init_pdx();
>> +
>> +    /*
>> +     * We need some memory to allocate the page-tables used for the xenheap
>> +     * mappings. But some regions may contain memory already allocated
>> +     * for other uses (e.g. modules, reserved-memory...).
>> +     *
>> +     * For simplify add all the free regions in the boot allocator.
>> +     */
> 
> We currently have:
> 
> BUG_ON(nr_bootmem_regions == (PAGE_SIZE / sizeof(struct bootmem_region)));

This has enough space for 256 distinct regions on arm64 (512 regions on 
arm32).

> 
> Do you think we should check for the limit in populate_boot_allocator?

This patch doesn't change the number of regions added to the boot 
allocator. So if we need to check the limit then I would rather deal 
separately (see more below).

> Or there is no need because it is unrealistic to reach it?
I can't say never because history told us on some UEFI systems, there 
will be a large number of regions exposed. I haven't heard anyone that 
would hit the BUG_ON().

The problem is what do we do if we hit the limit? We could ignore all 
the regions after. However, there are potentially a risk there would not 
be enough memory to cover the boot memory allocation (regions may be 
really small).

So if we ever hit the limit, then I think we should update the boot 
allocator.

Cheers,

-- 
Julien Grall

