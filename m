Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F03330E8E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94899.178863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFDb-000847-Jp; Mon, 08 Mar 2021 12:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94899.178863; Mon, 08 Mar 2021 12:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFDb-00083h-GN; Mon, 08 Mar 2021 12:42:39 +0000
Received: by outflank-mailman (input) for mailman id 94899;
 Mon, 08 Mar 2021 12:42:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJFDa-00083b-6m
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:42:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fcb9fae-39c6-4720-aec6-95ddc6e25150;
 Mon, 08 Mar 2021 12:42:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E946AC0C;
 Mon,  8 Mar 2021 12:42:36 +0000 (UTC)
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
X-Inumbo-ID: 3fcb9fae-39c6-4720-aec6-95ddc6e25150
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615207356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Chd/tr2rM8xqMAcHymy5HOuxuEtziYDAycbzmfjYL4=;
	b=HiYzDCVIt3dOGfuYckS5KEujZ2tCb0H8XQfSwVREPUZvaA3vMgpgmvs/wLHTvyEYPYKEqG
	oC0lRkml2WJ6V0tfk81hOxgroKZGLd/eOhcFkQSH9ZpiFZH5SQVS1PKG9oDl76O7AZ77a5
	Fyp+OBgPugEFNU6znsjvvS/iKoPy17w=
Subject: Re: [PATCH 2/2][4.15?] x86/shadow: encode full GFN in magic MMIO
 entries
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <ccf12da3-b3df-7be1-1898-992ec994b78f@suse.com>
 <041aed42-929d-287d-f9e4-c12e5a71ab38@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c8ff279-fc87-640a-7a39-81451166b6b1@suse.com>
Date: Mon, 8 Mar 2021 13:42:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <041aed42-929d-287d-f9e4-c12e5a71ab38@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.03.2021 17:32, Andrew Cooper wrote:
> On 05/03/2021 15:37, Jan Beulich wrote:
>> Since we don't need to encode all of the PTE flags, we have enough bits
>> in the shadow entry to store the full GFN. Don't use literal numbers -
>> instead derive the involved values. Or, where derivation would become
>> too ugly, sanity-check the result (invoking #error to identify failure).
>>
>> This then allows dropping from sh_l1e_mmio() again the guarding against
>> too large GFNs.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wonder if the respective check in sh_audit_l1_table() is actually
>> useful to retain with these changes.
>>
>> --- a/xen/arch/x86/mm/shadow/types.h
>> +++ b/xen/arch/x86/mm/shadow/types.h
>> @@ -283,9 +283,17 @@ shadow_put_page_from_l1e(shadow_l1e_t sl
>>   * This is only feasible for PAE and 64bit Xen: 32-bit non-PAE PTEs don't
>>   * have reserved bits that we can use for this.  And even there it can only
>>   * be used if we can be certain the processor doesn't use all 52 address bits.
>> + *
>> + * For the MMIO encoding (see below) we need the bottom 4 bits for
>> + * identifying the kind of entry and a full GFN's worth of bits to encode
>> + * the originating frame number.  Set all remaining bits to trigger
>> + * reserved bit faults, if (see above) the hardware permits triggering such.
>>   */
>>  
>> -#define SH_L1E_MAGIC 0xffffffff00000001ULL
>> +#define SH_L1E_MAGIC_NR_META_BITS 4
>> +#define SH_L1E_MAGIC_MASK ((~0ULL << (PADDR_BITS - PAGE_SHIFT + \
>> +                                      SH_L1E_MAGIC_NR_META_BITS)) | \
>> +                           _PAGE_PRESENT)
>>  
>>  static inline bool sh_have_pte_rsvd_bits(void)
>>  {
>> @@ -294,7 +302,8 @@ static inline bool sh_have_pte_rsvd_bits
>>  
>>  static inline bool sh_l1e_is_magic(shadow_l1e_t sl1e)
>>  {
>> -    return (sl1e.l1 & SH_L1E_MAGIC) == SH_L1E_MAGIC;
>> +    BUILD_BUG_ON(!(PADDR_MASK & SH_L1E_MAGIC_MASK));
>> +    return (sl1e.l1 & SH_L1E_MAGIC_MASK) == SH_L1E_MAGIC_MASK;
>>  }
>>  
>>  /* Guest not present: a single magic value */
>> @@ -320,20 +329,26 @@ static inline bool sh_l1e_is_gnp(shadow_
>>  
>>  /*
>>   * MMIO: an invalid PTE that contains the GFN of the equivalent guest l1e.
>> - * We store 28 bits of GFN in bits 4:32 of the entry.
>> + * We store the GFN in bits 4:43 of the entry.
>>   * The present bit is set, and the U/S and R/W bits are taken from the guest.
>>   * Bit 3 is always 0, to differentiate from gnp above.
>>   */
>> -#define SH_L1E_MMIO_MAGIC       0xffffffff00000001ULL
>> -#define SH_L1E_MMIO_MAGIC_MASK  0xffffffff00000009ULL
>> -#define SH_L1E_MMIO_GFN_MASK    0x00000000fffffff0ULL
>> +#define SH_L1E_MMIO_MAGIC       SH_L1E_MAGIC_MASK
>> +#define SH_L1E_MMIO_MAGIC_BIT   ((_PAGE_PRESENT | _PAGE_RW | _PAGE_USER) + 1)
>> +#if SH_L1E_MMIO_MAGIC_BIT & (SH_L1E_MMIO_MAGIC_BIT - 1)
>> +# error SH_L1E_MMIO_MAGIC_BIT needs to be a power of 2
>> +#endif
>> +#if SH_L1E_MMIO_MAGIC_BIT >> SH_L1E_MAGIC_NR_META_BITS
>> +# error SH_L1E_MMIO_MAGIC_BIT and SH_L1E_MAGIC_NR_META_BITS are out of sync
>> +#endif
>> +#define SH_L1E_MMIO_MAGIC_MASK  (SH_L1E_MAGIC_MASK | SH_L1E_MMIO_MAGIC_BIT)
>> +#define SH_L1E_MMIO_GFN_MASK    ~(SH_L1E_MMIO_MAGIC_MASK | _PAGE_RW | _PAGE_USER)
> 
> In practice, it is 4:36, because we have to limit shadow guests to 32
> bits of gfn for XSA-173 (width of the superpage backpointer IIRC).

When !BIGMEM - yes.

> Also, this property is important for L1TF.  The more guest-controllable
> bits we permit in here, the greater the chance of being vulnerable to
> L1TF on massive machines.
> 
> (I'm a little concerned that I can't spot an L1TF comment which has been
> made stale by these changes...  Probably the fault of whichever numpty
> prepared the L1TF patches, because I'm certain we discussed this at the
> time)
> 
> Going from 32 to 36 bits moves the upper safety barrier from TOP-4G to
> TOP-64G but I recall us agreed that that was ok, especially as the main
> safety guestimate is "no RAM in the top quarter of the address space".
> 
> However, I don't think we want to accidentally creep beyond bit 36, so
> I'd suggest that the easy fix here is just adjusting a nibble in the
> MMIO masks.

With BIGMEM I'm not sure we want to be this strict. Nor do we need
to as long as we only need 4 bits at the bottom - we only go up to
bit 43 with what we allow guests control over. IOW we will need to
be careful on old hardware when l1d_maxphysaddr == 44, but on
anything newer we're still far enough away I would think. So I
guess instead of outright dropping the GFN check from sh_l1e_mmio()
I want to replace it by use of is_l1tf_safe_maddr() (on the
produced shadow_l1e_t).

Jan

