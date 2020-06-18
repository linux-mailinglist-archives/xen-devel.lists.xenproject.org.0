Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D631A1FF0FE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 13:50:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlt3P-0002qv-Bl; Thu, 18 Jun 2020 11:49:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlt3O-0002qo-IK
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 11:49:58 +0000
X-Inumbo-ID: d526955e-b159-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d526955e-b159-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 11:49:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 092DDAC50;
 Thu, 18 Jun 2020 11:49:55 +0000 (UTC)
Subject: Re: [PATCH] VT-x: simplify/clarify vmx_load_pdptrs()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b2bd8c84-9109-8b21-afb4-51e49b271a83@suse.com>
 <20200618101113.GI735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <762c5e4a-4132-b82f-7234-3b3e9508d1ae@suse.com>
Date: Thu, 18 Jun 2020 13:49:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618101113.GI735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.06.2020 12:11, Roger Pau Monné wrote:
> On Thu, Jun 18, 2020 at 08:38:27AM +0200, Jan Beulich wrote:
>> * Guests outside of long mode can't have PCID enabled. Drop the
>>   respective check to make more obvious that there's no security issue
>>   (from potentially accessing past the mapped page's boundary).
>>
>> * Only the low 32 bits of CR3 are relevant outside of long mode, even
>>   if they remained unchanged after leaving that mode.
>>
>> * Drop the unnecessary and badly typed local variable p.
>>
>> * Don't open-code hvm_long_mode_active() (and extend this to the related
>>   nested VT-x code).
>>
>> * Constify guest_pdptes to clarify that we're only reading from the
>>   page.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -1312,17 +1312,16 @@ static void vmx_set_interrupt_shadow(str
>>  
>>  static void vmx_load_pdptrs(struct vcpu *v)
>>  {
>> -    unsigned long cr3 = v->arch.hvm.guest_cr[3];
>> -    uint64_t *guest_pdptes;
>> +    uint32_t cr3 = v->arch.hvm.guest_cr[3];
>> +    const uint64_t *guest_pdptes;
>>      struct page_info *page;
>>      p2m_type_t p2mt;
>> -    char *p;
>>  
>>      /* EPT needs to load PDPTRS into VMCS for PAE. */
>> -    if ( !hvm_pae_enabled(v) || (v->arch.hvm.guest_efer & EFER_LMA) )
>> +    if ( !hvm_pae_enabled(v) || hvm_long_mode_active(v) )
>>          return;
>>  
>> -    if ( (cr3 & 0x1fUL) && !hvm_pcid_enabled(v) )
>> +    if ( cr3 & 0x1f )
>>          goto crash;
> 
> Intel SDM says bits 0 to 4 are ignored, not reserved, so I'm not sure
> we need to crash the guest here. I have no reference how real hardware
> behaves here, so maybe crashing is the right thing to do.

No, I was mislead by the wording of the description in the old
patch I've referenced. IOW ...

>> @@ -1332,14 +1331,12 @@ static void vmx_load_pdptrs(struct vcpu
>>           * queue, but this is the wrong place. We're holding at least
>>           * the paging lock */
>>          gdprintk(XENLOG_ERR,
>> -                 "Bad cr3 on load pdptrs gfn %lx type %d\n",
>> +                 "Bad cr3 on load pdptrs gfn %"PRIx32" type %d\n",
>>                   cr3 >> PAGE_SHIFT, (int) p2mt);
>>          goto crash;
>>      }
>>  
>> -    p = __map_domain_page(page);
>> -
>> -    guest_pdptes = (uint64_t *)(p + (cr3 & ~PAGE_MASK));
>> +    guest_pdptes = __map_domain_page(page) + (cr3 & ~PAGE_MASK);
> 
> Instead I think this could be:
> 
> guest_pdptes = __map_domain_page(page) + (cr3 & ~(PAGE_MASK | 0x1f));

... I agree and will change to this; I'll assume your R-b stands
with the change made (and the description adjusted accordingly).

Jan

