Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B53C8FBED
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 18:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174302.1499255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOg2n-0005y8-1l; Thu, 27 Nov 2025 17:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174302.1499255; Thu, 27 Nov 2025 17:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOg2m-0005vt-Un; Thu, 27 Nov 2025 17:44:36 +0000
Received: by outflank-mailman (input) for mailman id 1174302;
 Thu, 27 Nov 2025 17:44:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wKXk=6D=bounce.vates.tech=bounce-md_30504962.69288dea.v1-925301c2d1b9457582b79c9c271a6833@srs-se1.protection.inumbo.net>)
 id 1vOg2e-0005vV-Uj
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 17:44:35 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0be179b-cbb8-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 18:44:18 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHP1k3Q3mzFCWjl5
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 17:44:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 925301c2d1b9457582b79c9c271a6833; Thu, 27 Nov 2025 17:44:10 +0000
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
X-Inumbo-ID: b0be179b-cbb8-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764265450; x=1764535450;
	bh=oFO9PAR/yTcyRRSVY2Kh+NJBWGMyiPLKETAVROEcBQ0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RidMY7Wkbl1uCz7vKimJQy4g69RnqtHWxFv9WoYVREKMUxtcqlh3uVyYZqn3IeKr6
	 EfGAt24zLihOW366e0TICRQmds/ES8Pi7rej5UX6XVjaY51jUSfiQwb3z42aAuW7tK
	 g90cRX50O8ZRc5dL+XZrHF5GyxvtiZgtDqMjJbeAGMacIww58b7T+3Wt8twQpNyfHk
	 AGu1XZmE79HC9wzsmK1nOH3c5OCuD71Jx5XjO/7lgZASFfrg78ZCpc/8sCEp4fflvk
	 c7+KAmS1pWQ0LW24H2vUxgUkXBw2cmhfJV/IzEL0mSTb/xrPTsKZ7eK4X6uVVhT7Ac
	 tWro2D12gI/vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764265450; x=1764525950; i=teddy.astie@vates.tech;
	bh=oFO9PAR/yTcyRRSVY2Kh+NJBWGMyiPLKETAVROEcBQ0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EfGWw9uoSc44717PyKmQ3sH+JiNb5EtDKg9Eonybjnv5fnUSGmemIuPZYUDxu1O9b
	 CGN4rGMp3YrigbHxbgIxQt2aMRx7WQEHWvSRgcN1kZSo+d8SkoeafLG8CZBgH83LGL
	 78+DcBbmbIW2Na0Fts3wq7NRdyOrGnUPdAaBczu9jamg3uBhwSZaNXplrXcuKAL1w6
	 BKimx9teBc9OlWZPALGHMa8VGZ00yiLQlyUuJIk9AOjIp4xVr7EVv3WbrU4DMdSbMw
	 e//HVEZDPtJyjYBthcFX3BUcciHw7nTfwimu14BsSAquZy9eUciE4ytHGNV/6P0QWY
	 emA1Lu+4THutA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=204/4]=20x86/hap:=20Migrate=20tlb=20flush=20logic=20to=20p2m->flush=5Ftlb?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764265449386
Message-Id: <782c3d76-defe-44fb-8e64-b3dd149c4257@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1764248710.git.teddy.astie@vates.tech> <94bf385598cc7d70ecaecfae670e305581ad83b3.1764248710.git.teddy.astie@vates.tech> <e7f7e2df-5881-40f6-b157-bd01c0d514f5@suse.com>
In-Reply-To: <e7f7e2df-5881-40f6-b157-bd01c0d514f5@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.925301c2d1b9457582b79c9c271a6833?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251127:md
Date: Thu, 27 Nov 2025 17:44:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/11/2025 =C3=A0 15:32, Jan Beulich a =C3=A9crit=C2=A0:
> On 27.11.2025 14:39, Teddy Astie wrote:
>> Now that p2m->need_flush is set when modifying the pagetable in a way th=
at
>> requires it. We can move the tlb flush logic to p2m->tlb_flush.
>>
>> Introduce hap_tlb_flush to do it, which is called by main p2m logic (e.g=
 p2m_unlock,
>> p2m_tlb_flush_sync, ...). Drop inline calls of guest_flush_tlb_mask whic=
h are now
>> redundant with what now does p2m->flush_tlb, allowing us to drop guest_f=
lush_tlb_*
>> as it is now unused.
>>
>> No function change intended.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> 
> I think the safety / correctness of the change needs explaining in the
> description. TLB flushing is often delicate, so it wants to be made prett=
y
> clear that no necessary flush is now omitted anywhere. It also wants to b=
e
> made clear, from a performance angle, no new excess flushing is added (se=
e
> below for a respective question towards EPT).
> 

Overall, all places where there is was a guest_flush_tlb_mask, there is 
a implicit call to p2m->tlb_flush (usually through p2m_unlock() or 
something that calls it); but that indeed wants to be explained.

>> --- a/xen/arch/x86/flushtlb.c
>> +++ b/xen/arch/x86/flushtlb.c
>> @@ -320,18 +320,3 @@ void cache_writeback(const void *addr, unsigned int=
 size)
>>       asm volatile ("sfence" ::: "memory");
>>   }
>>   
>> -unsigned int guest_flush_tlb_flags(const struct domain *d)
>> -{
>> -    bool shadow =3D paging_mode_shadow(d);
>> -    bool asid =3D is_hvm_domain(d) && (cpu_has_svm || shadow);
> 
> There's an SVM dependency here, which ...
> 
>> --- a/xen/arch/x86/mm/hap/hap.c
>> +++ b/xen/arch/x86/mm/hap/hap.c
>> @@ -105,8 +105,6 @@ int hap_track_dirty_vram(struct domain *d,
>>               p2m_change_type_range(d, begin_pfn, begin_pfn + nr_frames,
>>                                     p2m_ram_rw, p2m_ram_logdirty);
>>   
>> -            guest_flush_tlb_mask(d, d->dirty_cpumask);
>> -
>>               memset(dirty_bitmap, 0xff, size); /* consider all pages di=
rty */
>>           }
>>           else
>> @@ -191,7 +189,6 @@ static int cf_check hap_enable_log_dirty(struct doma=
in *d)
>>        * to be read-only, or via hardware-assisted log-dirty.
>>        */
>>       p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
>> -    guest_flush_tlb_mask(d, d->dirty_cpumask);
>>   
>>       return 0;
>>   }
>> @@ -220,7 +217,6 @@ static void cf_check hap_clean_dirty_bitmap(struct d=
omain *d)
>>        * be read-only, or via hardware-assisted log-dirty.
>>        */
>>       p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
>> -    guest_flush_tlb_mask(d, d->dirty_cpumask);
>>   }
>>   
>>   /************************************************/
>> @@ -806,18 +802,14 @@ static void cf_check hap_update_paging_modes(struc=
t vcpu *v)
>>       put_gfn(d, cr3_gfn);
>>   }
>>   
>> -static void cf_check
>> -hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
>> +void hap_p2m_tlb_flush(struct p2m_domain *p2m)
>>   {
>> -    struct domain *d =3D p2m->domain;
>> -
>> -    if ( oflags & _PAGE_PRESENT )
>> -        guest_flush_tlb_mask(d, d->dirty_cpumask);
>> +    flush_mask(p2m->domain->dirty_cpumask, FLUSH_HVM_ASID_CORE);
>>   }
>>   
>>   void hap_p2m_init(struct p2m_domain *p2m)
>>   {
>> -    p2m->write_p2m_entry_post =3D hap_write_p2m_entry_post;
>> +    p2m->tlb_flush =3D hap_p2m_tlb_flush;
>>   }
> 
> ... is entirely lost throughout the hap.c changes. Are we now doing exces=
s flushing
> for EPT?

Probably not as EPT uses its own tlb_flush function (ept_tlb_flush) 
instead. Most changes are isolated to p2m-pt.c, and here only SVM with HAP.

> I guess the relevant point here is that hap_p2m_init(), despite its name
> suggesting otherwise, doesn't come into play when EPT is in use. (This co=
uld do
> with cleaning up, as right now it then has to be the case that in a AMD_S=
VM=3Dn
> configuration that function is unreachable, violating a Misra rule.
> 

I would like in the end that NPT and EPT being similar to use the same 
tlb flushing logic thus hap_p2m_tlb_flush() (with some changes), but 
that requires additional work.

> Also, why would hap_p2m_tlb_flush() lose static and cf_check that the pri=
or hook
> function validly had?
> 

that's not intended indeed

> Jan
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



