Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF6F527077
	for <lists+xen-devel@lfdr.de>; Sat, 14 May 2022 12:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329023.552188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npobJ-0003gp-SX; Sat, 14 May 2022 10:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329023.552188; Sat, 14 May 2022 10:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npobJ-0003dh-PP; Sat, 14 May 2022 10:02:17 +0000
Received: by outflank-mailman (input) for mailman id 329023;
 Sat, 14 May 2022 10:02:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1npobI-0003db-NX
 for xen-devel@lists.xenproject.org; Sat, 14 May 2022 10:02:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npobI-0007Jk-DA; Sat, 14 May 2022 10:02:16 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npobI-000874-7c; Sat, 14 May 2022 10:02:16 +0000
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
	bh=lDYAh5SHq6K31T6rUjOD31ohrVwQITpLtMsYZeN/f7w=; b=ApT1Kque4oHkPT5UQfVFvn3lQT
	l1h0in7bxnBicNfxUFBTBcbqcbRmWgUAqB8wJ7hqvVfcF15KSfecpPPZZafUXLF+d/ydiizutyhFq
	oKVAtL5XQEL3uP6u/4VpdduToIqOte4TKZHCYMaJ7MCuDW0l72QrVra9shBUF90V6nGg=;
Message-ID: <a3d99536-d092-dc74-bbfa-b7be88e79059@xen.org>
Date: Sat, 14 May 2022 11:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v3 19/19] xen/arm: mm: Re-implement
 setup_frame_table_mappings() with map_pages_to_xen()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-20-julien@xen.org>
 <alpine.DEB.2.22.394.2204051700040.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204051700040.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 06/04/2022 01:01, Stefano Stabellini wrote:
> On Mon, 21 Feb 2022, Julien Grall wrote:
>>       frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
>>       /* Round up to 2M or 32M boundary, as appropriate. */
>>       frametable_size = ROUNDUP(frametable_size, mapping_size);
>>       base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
>>   
>> -#ifdef CONFIG_ARM_64
>> -    /* Compute the number of second level pages. */
>> -    nr_second = ROUNDUP(frametable_size, FIRST_SIZE) >> FIRST_SHIFT;
>> -    second_base = alloc_boot_pages(nr_second, 1);
>> -    second = mfn_to_virt(second_base);
>> -    for ( i = 0; i < nr_second; i++ )
>> -    {
>> -        clear_page(mfn_to_virt(mfn_add(second_base, i)));
>> -        pte = mfn_to_xen_entry(mfn_add(second_base, i), MT_NORMAL);
>> -        pte.pt.table = 1;
>> -        write_pte(&xen_first[first_table_offset(FRAMETABLE_VIRT_START)+i], pte);
>> -    }
>> -    create_mappings(second, 0, mfn_x(base_mfn), frametable_size >> PAGE_SHIFT,
>> -                    mapping_size);
>> -#else
>> -    create_mappings(xen_second, FRAMETABLE_VIRT_START, mfn_x(base_mfn),
>> -                    frametable_size >> PAGE_SHIFT, mapping_size);
>> -#endif
>> +    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
>> +                          frametable_size >> PAGE_SHIFT, PAGE_HYPERVISOR_RW);
> 
> Doesn't it need to be PAGE_HYPERVISOR_RW | _PAGE_BLOCK ?

You are right. Otherwise, it would only use small pages. I will fix it 
in the next version.

Cheers,

-- 
Julien Grall

