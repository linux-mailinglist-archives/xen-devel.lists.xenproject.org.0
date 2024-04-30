Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED088B7C80
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715044.1116478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1q2J-00058m-QW; Tue, 30 Apr 2024 16:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715044.1116478; Tue, 30 Apr 2024 16:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1q2J-00056O-NJ; Tue, 30 Apr 2024 16:08:55 +0000
Received: by outflank-mailman (input) for mailman id 715044;
 Tue, 30 Apr 2024 16:08:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L/US=MD=amazon.co.uk=prvs=84335f14b=eliasely@srs-se1.protection.inumbo.net>)
 id 1s1q2J-00056I-53
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:08:55 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef9ea85a-070b-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 18:08:53 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 16:08:48 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.10.100:56250]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.5.85:2525] with
 esmtp (Farcaster)
 id 186665e8-eb70-4e8e-aff0-c9983345233e; Tue, 30 Apr 2024 16:08:46 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 30 Apr 2024 16:08:42 +0000
Received: from [192.168.29.156] (10.106.83.21) by
 EX19D018EUA002.ant.amazon.com (10.252.50.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 30 Apr 2024 16:08:39 +0000
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
X-Inumbo-ID: ef9ea85a-070b-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1714493333; x=1746029333;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EfJUfzR8bzd9lzOt6I9Dh6oyaNcLen2Te1FxnodN7Do=;
  b=YABzOZ7MpYzPBLWCcNVcvj7dBHc2pT+k7wcIQEvrDtCAcYceu5iTyVci
   R+2gNFAQN7Ejfhq+G7822Pfui8JavRsRjWn3zSnZUateGhZXAsHBXzA2U
   SKdxW87dFoP7GRPVpjVW+VeCeESuF12iat2Z5zyb7qUr9bIQUznC1Gddy
   o=;
X-IronPort-AV: E=Sophos;i="6.07,242,1708387200"; 
   d="scan'208";a="85752971"
X-Farcaster-Flow-ID: 186665e8-eb70-4e8e-aff0-c9983345233e
Message-ID: <a5ba2399-30a6-4ca4-bb8c-cf8773f862b9@amazon.com>
Date: Tue, 30 Apr 2024 17:08:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 07/27] x86: Map/unmap pages in
 restore_all_guests
To: Jan Beulich <jbeulich@suse.com>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.com>,
	<xen-devel@lists.xenproject.org>
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-8-eliasely@amazon.com>
 <a2ce9820-c57a-4690-9dc6-c15d8a1489f4@suse.com>
Content-Language: en-US
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <a2ce9820-c57a-4690-9dc6-c15d8a1489f4@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.83.21]
X-ClientProxiedBy: EX19D032UWB003.ant.amazon.com (10.13.139.165) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)

Hi Jan,


>> From: Hongyan Xia <hongyxia@amazon.com>
>>
>> Before, it assumed the pv cr3 could be accessed via a direct map. This
>> is no longer true.
> 
> There are a number of terminology issues here, starting with the title:
> Unlike (iirc) in an earlier version, no mapping/unmapping occurs in
> restore_all_guests itself anymore. When reading just the title I
> thought "What? Didn't I say no there?" Then for the sentence above: If
> what it stated was true, a bug would have been introduced in one of
> the earlier patches. What I think is meant, though, is that this is
> going to be no longer true.

Indeed, I updated the code without renaming the commit nor reflecting 
the changes in the commit message. I'll fix that in the next revision.
> Finally the use of "shadow" in identifiers in the code changes
> themselves is somewhat problematic imo, seeing the shadow paging mode
> we support for both HVM and PV. The nature here is different (it's
> merely a secondary mapping aiui), so I think it would be better to
> avoid the term "shadow". Maybe ...

I agree, let's clear the confusion, I'll go with PV_ROOT_PT_MAPPING_* 
prefix.

>> --- a/xen/arch/x86/include/asm/config.h
>> +++ b/xen/arch/x86/include/asm/config.h
>> @@ -202,7 +202,7 @@ extern unsigned char boot_edid_info[128];
>>   /* Slot 260: per-domain mappings (including map cache). */
>>   #define PERDOMAIN_VIRT_START    (PML4_ADDR(260))
>>   #define PERDOMAIN_SLOT_MBYTES   (PML4_ENTRY_BYTES >> (20 + PAGETABLE_ORDER))
>> -#define PERDOMAIN_SLOTS         3
>> +#define PERDOMAIN_SLOTS         4
>>   #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
>>                                    (PERDOMAIN_SLOT_MBYTES << 20))
>>   /* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
>> @@ -316,6 +316,16 @@ extern unsigned long xen_phys_start;
>>   #define ARG_XLAT_START(v)        \
>>       (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
>>   
>> +/* root_pt shadow mapping area. The fourth per-domain-mapping sub-area */
>> +#define SHADOW_ROOT_PT_VIRT_START   PERDOMAIN_VIRT_SLOT(3)
>> +#define SHADOW_ROOT_PT_ENTRIES      MAX_VIRT_CPUS
>> +#define SHADOW_ROOT_PT_VIRT_END     (SHADOW_ROOT_PT_VIRT_START +    \
>> +                                     (SHADOW_ROOT_PT_ENTRIES * PAGE_SIZE))
>> +
>> +/* The address of a particular VCPU's ROOT_PT */
>> +#define SHADOW_ROOT_PT_VCPU_VIRT_START(v) \
>> +    (SHADOW_ROOT_PT_VIRT_START + ((v)->vcpu_id * PAGE_SIZE))
> 
> ... ROOT_PT_MAPPING_* throughout, or PV_ROOT_PT_MAPPING_*?
> 
> As to SHADOW_ROOT_PT_VIRT_END - when trying to check where it's used
> and hence whether it really needs to use MAX_VIRT_CPUS I couldn't
> spot any use. I don't think the constant should be defined when it's
> not needed.

Correct, let me remove it.

>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -505,6 +505,13 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
>>       spin_unlock(&d->page_alloc_lock);
>>   }
>>   
>> +#define shadow_root_pt_idx(v) \
>> +    ((v)->vcpu_id >> PAGETABLE_ORDER)
>> +
>> +#define pv_shadow_root_pt_pte(v) \
>> +    ((v)->domain->arch.pv.shadow_root_pt_l1tab[shadow_root_pt_idx(v)] + \
>> +     ((v)->vcpu_id & (L1_PAGETABLE_ENTRIES - 1)))
> 
> I think uniformly named constant want using in both macros, i.e. either
> some L1_* in the first macro (preferred) or an expression derived from
> PAGETABLE_ORDER in the 2nd.
> 
>> @@ -524,6 +531,13 @@ void write_ptbase(struct vcpu *v)
>>   
>>       if ( is_pv_vcpu(v) && v->domain->arch.pv.xpti )
>>       {
>> +        mfn_t guest_root_pt = _mfn(v->arch.cr3 >> PAGE_SHIFT);
> 
> While we do so in several other places, I think we'd be better off not
> continuing to assume the top bits to all be zero. IOW MASK_EXTR() may
> be better to use here.

Sure, let's be on the safe side

>> +        l1_pgentry_t *pte = pv_shadow_root_pt_pte(v);
>> +
>> +        ASSERT(v == current);
>> +
>> +        l1e_write(pte, l1e_from_mfn(guest_root_pt, __PAGE_HYPERVISOR_RW));
> 
> The mapping is the copy source in restore_all_guests, isn't it? In
> which case couldn't this be a r/o mapping?

I believe you're right, let me change it to R/O.

>> --- a/xen/arch/x86/pv/domain.c
>> +++ b/xen/arch/x86/pv/domain.c
>> @@ -288,6 +288,19 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
>>                                 1U << GDT_LDT_VCPU_SHIFT);
>>   }
>>   
>> +static int pv_create_shadow_root_pt_l1tab(struct vcpu *v)
>> +{
>> +    return create_perdomain_mapping(v->domain, SHADOW_ROOT_PT_VCPU_VIRT_START(v),
> 
> This line looks to be too long. But ...
> 
>> +                                    1, v->domain->arch.pv.shadow_root_pt_l1tab,
>> +                                    NULL);
>> +}
>> +
>> +static void pv_destroy_shadow_root_pt_l1tab(struct vcpu *v)
>> +
>> +{
>> +    destroy_perdomain_mapping(v->domain, SHADOW_ROOT_PT_VCPU_VIRT_START(v), 1);
>> +}
> 
> ... I'm not convinced of the usefulness of these wrapper functions
> anyway, even more so that each is used exactly once.

The wrappers have been introduced to remain consistent with what has 
been done with GDT/LDT table. I would like to keep them if you don't mind.

>>       XFREE(d->arch.pv.cpuidmasks);
>>   
>>       FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
>> +    FREE_XENHEAP_PAGE(d->arch.pv.shadow_root_pt_l1tab);
>>   }
>>   
>>   void noreturn cf_check continue_pv_domain(void);
>> @@ -371,6 +394,12 @@ int pv_domain_initialise(struct domain *d)
>>           goto fail;
>>       clear_page(d->arch.pv.gdt_ldt_l1tab);
>>   
>> +    d->arch.pv.shadow_root_pt_l1tab =
>> +        alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
>> +    if ( !d->arch.pv.shadow_root_pt_l1tab )
>> +        goto fail;
>> +    clear_page(d->arch.pv.shadow_root_pt_l1tab);
> 
> Looks like you simply cloned the GDT/LDT code. That's covering 128k
> of VA space per vCPU, though, while here you'd using only 4k. Hence
> using a full page looks like a factor 32 over-allocation. And once
> using xzalloc() here instead a further question would be whether to
> limit to the domain's actual needs - most domains will have far less
> than 8k vCPU-s. In the common case (up to 512 vCPU-s) a single slot
> will suffice, at which point a yet further question would be whether
> to embed the "array" in struct pv_domain instead in that common case
> (e.g. by using a union).

I have to admit I don't really understand your suggestion. Could you 
elaborate a bit more?

Elias

