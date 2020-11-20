Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95392BABF5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 15:37:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32269.63311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg7Xi-0002k6-6s; Fri, 20 Nov 2020 14:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32269.63311; Fri, 20 Nov 2020 14:37:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg7Xi-0002jh-3c; Fri, 20 Nov 2020 14:37:42 +0000
Received: by outflank-mailman (input) for mailman id 32269;
 Fri, 20 Nov 2020 14:37:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BBs/=E2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kg7Xg-0002jB-QL
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:37:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a5f306d-93b5-4c06-ac77-92896595a593;
 Fri, 20 Nov 2020 14:37:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BBs/=E2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kg7Xg-0002jB-QL
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:37:40 +0000
X-Inumbo-ID: 4a5f306d-93b5-4c06-ac77-92896595a593
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4a5f306d-93b5-4c06-ac77-92896595a593;
	Fri, 20 Nov 2020 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605883059;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=U71QbxcHC/PxwgSRJQN8Bud11hm3wMIaHc5A2f2lxO8=;
  b=YLPmSJLCzYqFTSr0rtZXqGR8AlPtAd7KQG2KGvgaspTbsj0QiXdrWFeL
   RPe+zQ6SJG1FI2bo2D9NrNBA9BCbRSqxTZ4AUiqeykoYctuGN3+U/VNsA
   22xybQ4JYcxS/FTJ2IoZ0uvO4C00gsBOjDn9mnTthIkRjJXzCoytbGtCx
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 40k0l0PZ79VBL+FnsYx10JSj/+FmicCQhDs2LQQQXmm+SNqkHb68q/gHL3rFjj3kQLnYtZuP3p
 OmGZgzQu4ZMDXlQfyw7WnZaDpI6PCoainjT/iew7XaZ8W6VyF8fiq9AV7mQezYZtI4LbIKo+/p
 iXgjBTxxt0cHnmP057YBFkWVv2TQcZy0/rWoThCM6yhxUcBuHXpxRjJW3HGA5WZRhO0R6CrDaY
 /yBey8lzhDjOmkkiY0Dx6bU5fWPH9t76nOghFnb8xGYqbNgPeT0rFzSGOa8gELEoIMmgCD8Yi0
 B8g=
X-SBRS: None
X-MesageID: 31960192
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,356,1599537600"; 
   d="scan'208";a="31960192"
Subject: Re: [PATCH] amd-iommu: Fix Guest CR3 Table following c/s 3a7947b6901
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <paul.durrant@citrix.com>
References: <20201120141951.13742-1-andrew.cooper3@citrix.com>
 <dc7a4158-2c8e-5aaf-cc68-ab7f15454c77@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3e82cbbc-c121-aa14-c15b-ca3489f5cf2e@citrix.com>
Date: Fri, 20 Nov 2020 14:37:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dc7a4158-2c8e-5aaf-cc68-ab7f15454c77@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 20/11/2020 14:32, Jan Beulich wrote:
> On 20.11.2020 15:19, Andrew Cooper wrote:
>> "amd-iommu: use a bitfield for DTE" renamed iommu_dte_set_guest_cr3()'s gcr3
>> parameter to gcr3_mfn but ended up with an off-by-PAGE_SIZE error when
>> extracting bits from the address.
>>
>> First of all, get_guest_cr3_from_dte() and iommu_dte_set_guest_cr3()
>> are (almost) getters and setters for the same field, so should live together.
>>
>> Rename them to dte_{get,set}_gcr3_table() to specifically avoid 'guest_cr3' in
>> the name.  This field actually points to a table in memory containing an array
>> of guest CR3 values.  As these functions are used for different logical
>> indirections, they shouldn't use gfn/mfn terminology for their parameters.
>> Switch them to use straight uint64_t full addresses.
> All of this still looks to belong to "First of all ..." - did you
> mean to have more in here, but forgot to actually put it in?

No - I deleted the bit which has caused this to be blocked on minutia
for nearly 2 years.l

>
>> --- a/xen/drivers/passthrough/amd/iommu_guest.c
>> +++ b/xen/drivers/passthrough/amd/iommu_guest.c
>> @@ -68,11 +68,39 @@ static void guest_iommu_disable(struct guest_iommu *iommu)
>>      iommu->enabled = 0;
>>  }
>>  
>> -static uint64_t get_guest_cr3_from_dte(struct amd_iommu_dte *dte)
>> +/*
>> + * The Guest CR3 Table is a table written by the guest kernel, pointing at
>> + * gCR3 values for PASID transactions to use.  The Device Table Entry points
>> + * at a system physical address.
>> + *
>> + * However, these helpers deliberately use untyped parameters without
>> + * reference to gfn/mfn because they are used both for programming the real
>> + * IOMMU, and interpreting a guests programming of its vIOMMU.
>> + */
>> +static uint64_t dte_get_gcr3_table(const struct amd_iommu_dte *dte)
>>  {
>>      return (((uint64_t)dte->gcr3_trp_51_31 << 31) |
>>              (dte->gcr3_trp_30_15 << 15) |
>> -            (dte->gcr3_trp_14_12 << 12)) >> PAGE_SHIFT;
>> +            (dte->gcr3_trp_14_12 << 12));
>> +}
>> +
>> +static void dte_set_gcr3_table(struct amd_iommu_dte *dte, uint16_t dom_id,
>> +                               uint64_t addr, bool gv, uint8_t glx)
>> +{
>> +#define GCR3_MASK(hi, lo) (((1ul << ((hi) + 1)) - 1) & ~((1ul << (lo)) - 1))
>> +
>> +    /* I bit must be set when gcr3 is enabled */
>> +    dte->i = true;
>> +
>> +    dte->gcr3_trp_14_12 = MASK_EXTR(addr, GCR3_MASK(14, 12));
>> +    dte->gcr3_trp_30_15 = MASK_EXTR(addr, GCR3_MASK(30, 15));
>> +    dte->gcr3_trp_51_31 = MASK_EXTR(addr, GCR3_MASK(51, 31));
>> +
>> +    dte->domain_id = dom_id;
>> +    dte->glx = glx;
>> +    dte->gv = gv;
>> +
>> +#undef GCR3_MASK
>>  }
> I realize the question is somewhat unrelated, but aren't we updating
> a live DTE here? If so, are there no ordering requirements between the
> writes? Might be worth putting in barrier(s) right on this occasion.

I don't know.  Honestly, its not relevant either as this is code motion.

This entire file is full of security holes.  None of it is fit for use
in its current form.

~Andrew

