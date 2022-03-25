Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5504E7475
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 14:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294725.501302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkIu-0001HU-9d; Fri, 25 Mar 2022 13:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294725.501302; Fri, 25 Mar 2022 13:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkIu-0001EE-68; Fri, 25 Mar 2022 13:48:36 +0000
Received: by outflank-mailman (input) for mailman id 294725;
 Fri, 25 Mar 2022 13:48:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXkIs-0001D8-GH
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 13:48:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXkIs-0003HI-11; Fri, 25 Mar 2022 13:48:34 +0000
Received: from [54.239.6.185] (helo=[192.168.14.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXkIr-0004aT-QM; Fri, 25 Mar 2022 13:48:33 +0000
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
	bh=tRNa6HC8kLqjps7Q9TmiVhFDBQiL1m2ULowB5h8C968=; b=lexLUzGH2hlNb3VrQJjaBBoytp
	Vaj4hIcI0nkSzhLOdxeSzq1CfZU3BEeMBgeEMoPIztufxWSbiINMWfsG1Mu185sT7x7pR3i4mLQp+
	Wco0jFrl4Ll43nWzIdB9Sql6z0CfLnkfxBpAoRjcoXVb8xpKGJSKfEhZ8Pv6uGi14tx8=;
Message-ID: <5a20f085-e4c6-54da-473b-4fcec6657450@xen.org>
Date: Fri, 25 Mar 2022 13:48:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH early-RFC 3/5] xen/arm: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
 "lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien GralL
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-4-julien@xen.org>
 <7A115ECF-66CD-4B9A-AD98-53A92F91269E@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7A115ECF-66CD-4B9A-AD98-53A92F91269E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/03/2022 13:32, Bertrand Marquis wrote:
> Hi Julien,

Hi,

>> On 9 Mar 2022, at 12:20, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien GralL <jgrall@amazon.com>
>>
>> In follow-up patches we will need to have part of Xen identity mapped in
>> order to safely switch the TTBR.
>>
>> On some platform, the identity mapping may have to start at 0. If we always
>> keep the identity region mapped, NULL pointer ference would lead to access
>> to valid mapping.
>>
>> It would be possible to relocate Xen to avoid clashing with address 0.
>> However the identity mapping is only meant to be used in very limited
>> places. Therefore it would be better to keep the identity region invalid
>> for most of the time.
>>
>> Two new helpers are introduced:
>>     - prepare_identity_mapping() will setup the page-tables so it is
>>       easy to create the mapping afterwards.
>>     - update_identity_mapping() will create/remove the identity mapping
> 
> Nit: Would be better to first say what the patch is doing and then explaining
> the NULL pointer possible issue.
The NULL pointer is part of the problem statement. IOW, I would not have 
introduced update_identity_mapping() if we were not concerned that the 
mapping start 0.

So I don't think the commit message would read the same.

>> +/*
>> + * The identity mapping may start at physical address 0. So don't want
>> + * to keep it mapped longer than necessary.
>> + *
>> + * When this is called, we are still using the boot_pgtable.
>> + *
>> + * XXX: Handle Arm32 properly.
>> + */
>> +static void prepare_identity_mapping(void)
>> +{
>> +    paddr_t id_addr = virt_to_maddr(_start);
>> +    lpae_t pte;
>> +    DECLARE_OFFSETS(id_offsets, id_addr);
>> +
>> +    printk("id_addr 0x%lx\n", id_addr);
> 
> Debug print that should be removed.

Will do. Note the "early-RFC" in the comment. I am not looking for a 
detailed review (I didn't spend too much time cleaning up) but a 
feedback on the approach.

> 
>> +#ifdef CONFIG_ARM_64
>> +    if ( id_offsets[0] != 0 )
>> +        panic("Cannot handled ID mapping above 512GB\n");
> 
> The error message here might not be really helpful for the user.
> How about saying that Xen cannot be loaded in memory with
> a physical address above 512GB ?

Sure.

> 
>> +#endif
>> +
>> +    /* Link first ID table */
>> +    pte = pte_of_xenaddr((vaddr_t)xen_first_id);
>> +    pte.pt.table = 1;
>> +    pte.pt.xn = 0;
>> +
>> +    write_pte(&boot_pgtable[id_offsets[0]], pte);
>> +
>> +    /* Link second ID table */
>> +    pte = pte_of_xenaddr((vaddr_t)xen_second_id);
>> +    pte.pt.table = 1;
>> +    pte.pt.xn = 0;
>> +
>> +    write_pte(&xen_first_id[id_offsets[1]], pte);
>> +
>> +    /* Link third ID table */
>> +    pte = pte_of_xenaddr((vaddr_t)xen_third_id);
>> +    pte.pt.table = 1;
>> +    pte.pt.xn = 0;
>> +
>> +    write_pte(&xen_second_id[id_offsets[2]], pte);
>> +
>> +    /* The mapping in the third table will be created at a later stage */
>> +
>> +    /*
>> +     * Link the identity mapping in the runtime Xen page tables. No need to
>> +     * use write_pte here as they are not live yet.
>> +     */
>> +    xen_pgtable[id_offsets[0]] = boot_pgtable[id_offsets[0]];
>> +}
>> +
>> +void update_identity_mapping(bool enable)
> 
> You probably want an __init attribute here.
I expect this helper to be necessary after boot (e.g. CPU bring-up, 
suspend/resume). So I decided to keep it without _init.

> 
>> +{
>> +    paddr_t id_addr = virt_to_maddr(_start);
>> +    int rc;
>> +
>> +    if ( enable )
>> +        rc = map_pages_to_xen(id_addr, maddr_to_mfn(id_addr), 1,
>> +                              PAGE_HYPERVISOR_RX);
>> +    else
>> +        rc = destroy_xen_mappings(id_addr, id_addr + PAGE_SIZE);
>> +
>> +    BUG_ON(rc);
>> +}
>> +
>> /*
>>   * After boot, Xen page-tables should not contain mapping that are both
>>   * Writable and eXecutables.
>> @@ -609,6 +679,9 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>>
>>      phys_offset = boot_phys_offset;
>>
>> +    /* XXX: Find a better place to call it */
> 
> Why do you think this place is not right ?
Because the use in setup_pagetables() will soon disappear (my plan it to 
completely remove setup_pagetables) and this will used in other 
subsystem (CPU bring-up, suspend/resume).

Cheers,

-- 
Julien Grall

