Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB231884B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 11:37:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83816.156913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA9LM-0004PD-41; Thu, 11 Feb 2021 10:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83816.156913; Thu, 11 Feb 2021 10:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA9LM-0004Oq-0k; Thu, 11 Feb 2021 10:37:04 +0000
Received: by outflank-mailman (input) for mailman id 83816;
 Thu, 11 Feb 2021 10:37:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cmTu=HN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lA9LK-0004Ol-H0
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 10:37:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ecda26f-8d8f-4e22-bd78-d1343834501c;
 Thu, 11 Feb 2021 10:37:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E8EBADCD;
 Thu, 11 Feb 2021 10:37:00 +0000 (UTC)
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
X-Inumbo-ID: 2ecda26f-8d8f-4e22-bd78-d1343834501c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613039820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIKt2IbxDJ+JR+5PH3MQz09qkcO3HbCdRbYVSX8ZwhI=;
	b=j4y2aDoWqmd7hjQAQh7dqAwxVyn+H5MqPwjIcLe03Qtc3Z1vlFRUJiHQsxx7OPoGzQBUad
	aEWlD4y7vM7I/ohV/TBF9YyksvvYuF5ycROe3jkagkKC/r8QHmZ0THYkHHxY0kWVuonqB3
	Le5eRlkjdg9WzspkPk53ZgKhSFsalsU=
Subject: Re: [PATCH] VMX: use a single, global APIC access page
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <YCTuq5b130PR6G35@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7abc515b-d652-3d39-6038-99966deafdf8@suse.com>
Date: Thu, 11 Feb 2021 11:36:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCTuq5b130PR6G35@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.02.2021 09:45, Roger Pau Monné wrote:
> On Wed, Feb 10, 2021 at 05:48:26PM +0100, Jan Beulich wrote:
>> I did further consider not allocating any real page at all, but just
>> using the address of some unpopulated space (which would require
>> announcing this page as reserved to Dom0, so it wouldn't put any PCI
>> MMIO BARs there). But I thought this would be too controversial, because
>> of the possible risks associated with this.
> 
> No, Xen is not capable of allocating a suitable unpopulated page IMO,
> so let's not go down that route. Wasting one RAM page seems perfectly
> fine to me.

Why would Xen not be able to, in principle? It may be difficult,
but there may also be pages we could declare we know we can use
for this purpose.

>> @@ -3216,53 +3211,28 @@ static int vmx_alloc_vlapic_mapping(stru
>>      if ( !cpu_has_vmx_virtualize_apic_accesses )
>>          return 0;
>>  
>> -    pg = alloc_domheap_page(d, MEMF_no_refcount);
>> +    pg = alloc_domheap_page(NULL, 0);
>>      if ( !pg )
>>          return -ENOMEM;
>>  
>> -    if ( !get_page_and_type(pg, d, PGT_writable_page) )
>> -    {
>> -        /*
>> -         * The domain can't possibly know about this page yet, so failure
>> -         * here is a clear indication of something fishy going on.
>> -         */
>> -        domain_crash(d);
>> -        return -ENODATA;
>> -    }
>> -
>>      mfn = page_to_mfn(pg);
>>      clear_domain_page(mfn);
>> -    d->arch.hvm.vmx.apic_access_mfn = mfn;
>> +    apic_access_mfn = mfn;
>>  
>> -    return set_mmio_p2m_entry(d, gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE), mfn,
>> -                              PAGE_ORDER_4K);
>> -}
>> -
>> -static void vmx_free_vlapic_mapping(struct domain *d)
>> -{
>> -    mfn_t mfn = d->arch.hvm.vmx.apic_access_mfn;
>> -
>> -    d->arch.hvm.vmx.apic_access_mfn = _mfn(0);
>> -    if ( !mfn_eq(mfn, _mfn(0)) )
>> -    {
>> -        struct page_info *pg = mfn_to_page(mfn);
>> -
>> -        put_page_alloc_ref(pg);
>> -        put_page_and_type(pg);
>> -    }
>> +    return 0;
>>  }
>>  
>>  static void vmx_install_vlapic_mapping(struct vcpu *v)
>>  {
>>      paddr_t virt_page_ma, apic_page_ma;
>>  
>> -    if ( mfn_eq(v->domain->arch.hvm.vmx.apic_access_mfn, _mfn(0)) )
>> +    if ( mfn_eq(apic_access_mfn, _mfn(0)) )
> 
> You should check if the domain has a vlapic I think, since now
> apic_access_mfn is global and will be set regardless of whether the
> domain has vlapic enabled or not.
> 
> Previously apic_access_mfn was only allocated if the domain had vlapic
> enabled.

Oh, indeed - thanks for spotting. And also in domain_creation_finished().

>>          return;
>>  
>>      ASSERT(cpu_has_vmx_virtualize_apic_accesses);
>>  
>>      virt_page_ma = page_to_maddr(vcpu_vlapic(v)->regs_page);
>> -    apic_page_ma = mfn_to_maddr(v->domain->arch.hvm.vmx.apic_access_mfn);
>> +    apic_page_ma = mfn_to_maddr(apic_access_mfn);
>>  
>>      vmx_vmcs_enter(v);
>>      __vmwrite(VIRTUAL_APIC_PAGE_ADDR, virt_page_ma);
> 
> I would consider setting up the vmcs and adding the page to the p2m in
> the same function, and likely call it from vlapic_init. We could have
> a domain_setup_apic in hvm_function_table that takes care of all this.

Well, I'd prefer to do this just once per domain without needing
to special case this on e.g. vCPU 0.

>> --- a/xen/include/asm-x86/p2m.h
>> +++ b/xen/include/asm-x86/p2m.h
>> @@ -935,6 +935,9 @@ static inline unsigned int p2m_get_iommu
>>          flags = IOMMUF_readable;
>>          if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)) )
>>              flags |= IOMMUF_writable;
>> +        /* VMX'es APIC access page is global and hence has no owner. */
>> +        if ( mfn_valid(mfn) && !page_get_owner(mfn_to_page(mfn)) )
>> +            flags = 0;
> 
> Is it fine to have this page accessible to devices if the page tables
> are shared between the CPU and the IOMMU?

No, it's not, but what do you do? As said elsewhere, devices
gaining more access than is helpful is the price we pay for
being able to share page tables. But ...

> Is it possible for devices to write to it?

... thinking about it - they would be able to access it only
when interrupt remapping is off. Otherwise the entire range
0xFEExxxxx gets treated differently altogether by the IOMMU,
and is not subject to DMA remapping. IOW it shouldn't even
matter what flags we put in there (and I'd be far less
concerned about the no-intremap case). What this change
matters for then is only to avoid an unnecessary call to
iommu_map() (and, for small enough domain, extra intermediate
page tables to be allocated).

But let me really split this off of this patch.

Jan

