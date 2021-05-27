Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6B5392C0E
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 12:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132985.247977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmDSi-0002iA-8B; Thu, 27 May 2021 10:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132985.247977; Thu, 27 May 2021 10:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmDSi-0002gM-4O; Thu, 27 May 2021 10:42:00 +0000
Received: by outflank-mailman (input) for mailman id 132985;
 Thu, 27 May 2021 10:41:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmDSg-0002gG-El
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 10:41:58 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5a414f9-2136-4554-9411-4974fa7b27ca;
 Thu, 27 May 2021 10:41:57 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 39BC52190B;
 Thu, 27 May 2021 10:41:56 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 13EA611A98;
 Thu, 27 May 2021 10:41:56 +0000 (UTC)
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
X-Inumbo-ID: f5a414f9-2136-4554-9411-4974fa7b27ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622112116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/QiFQpJzn8z0jngnLO0NpnXw5ZlFo2Hax+6X6e/vYpY=;
	b=n79tettru6RTN7r9rbbx7T4/gxjUB2pigbB5bxVA9N6Q16tEG+4OhrRWmi7tYtnSlFGJtE
	jJrWtwPpnWcXrfiUcpGjwdjjhBzbSwV5E9xOAqcMsBL8wLYnMglNhZfZndzqWZWkbd3crf
	xCHEdf/Nr2O5jwBniOFGD6hRL0TOm8E=
Subject: Re: [PATCH] x86/AMD: expose SYSCFG, TOM, and TOM2 to Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Olaf Hering <olaf@aepfle.de>
References: <c5764274-1257-809e-a2a7-d87b9d0fe675@suse.com>
 <YK9ZXJuPk1G5SGnK@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b6693807-95cb-7925-587d-1e1e2db8c798@suse.com>
Date: Thu, 27 May 2021 12:41:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YK9ZXJuPk1G5SGnK@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.05.2021 10:33, Roger Pau Monné wrote:
> On Wed, May 26, 2021 at 02:59:00PM +0200, Jan Beulich wrote:
>> Sufficiently old Linux (3.12-ish) accesses these MSRs in an unguarded
>> manner. Furthermore these MSRs, at least on Fam11 and older CPUs, are
>> also consulted by modern Linux, and their (bogus) built-in zapping of
>> #GP faults from MSR accesses leads to it effectively reading zero
>> instead of the intended values, which are relevant for PCI BAR placement
>> (which ought to all live in MMIO-type space, not in DRAM-type one).
>>
>> For SYSCFG, only certain bits get exposed. In fact, whether to expose
>> MtrrVarDramEn is debatable: It controls use of not just TOM, but also
>> the IORRs. Introduce (consistently named) constants for the bits we're
>> interested in and use them in pre-existing code as well.
> 
> I think we should also allow access to the IORRs MSRs for coherency
> (c001001{6,9}) for the hardware domain.

Hmm, originally I was under the impression that these could conceivably
be written by OSes, and hence would want dealing with separately. But
upon re-reading I see that they are supposed to be set by the BIOS alone.
So yes, let me add them for read access, taking care of the limitation
that I had to spell out.

This raises the question then though whether to also include SMMAddr
and SMMMask in the set - the former does get accessed by Linux as well,
and was one of the reasons for needing 6eef0a99262c ("x86/PV:
conditionally avoid raising #GP for early guest MSR reads").

Especially for SMMAddr, and maybe also for IORR_BASE, returning zero
for DomU-s might be acceptable. The respective masks, however, can
imo not sensibly be returned as zero. Hence even there I'd leave DomU
side handling (see below) for a later time.

>> As a welcome side effect, verbosity on/of debug builds gets (perhaps
>> significantly) reduced.
>>
>> Note that at least as far as those MSR accesses by Linux are concerned,
>> there's no similar issue for DomU-s, as the accesses sit behind PCI
>> device matching logic. The checked for devices would never be exposed to
>> DomU-s in the first place. Nevertheless I think that at least for HVM we
>> should return sensible values, not 0 (as svm_msr_read_intercept() does
>> right now). The intended values may, however, need to be determined by
>> hvmloader, and then get made known to Xen.
> 
> Could we maybe come up with a fixed memory layout that hvmloader had
> to respect?
> 
> Ie: DRAM from 0 to 3G, MMIO from 3G to 4G, and then the remaining
> DRAM from 4G in a contiguous single block?
> 
> hvmloader would have to place BARs that don't fit in the 3G-4G hole at
> the end of DRAM (ie: after TOM2).

Such a fixed scheme may be too limiting, I'm afraid.

>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -339,6 +339,19 @@ int guest_rdmsr(struct vcpu *v, uint32_t
>>          *val = msrs->tsc_aux;
>>          break;
>>  
>> +    case MSR_K8_SYSCFG:
>> +    case MSR_K8_TOP_MEM1:
>> +    case MSR_K8_TOP_MEM2:
>> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>> +            goto gp_fault;
>> +        if ( !is_hardware_domain(d) )
>> +            return X86EMUL_UNHANDLEABLE;
> 
> It might be clearer to also handle the !is_hardware_domain case here,
> instead of deferring to svm_msr_read_intercept:
> 
> if ( is_hardware_domain(d) )
>     rdmsrl(msr, *val);
> else
>     *val = 0;

As said in the post-commit-message remark, I don't think returning 0
here is appropriate. I'd be willing to move DomU handling here, but
only once it's sane.

>> @@ -279,10 +286,7 @@
>>  #define MSR_K8_TOP_MEM1			0xc001001a
>>  #define MSR_K7_CLK_CTL			0xc001001b
>>  #define MSR_K8_TOP_MEM2			0xc001001d
>> -#define MSR_K8_SYSCFG			0xc0010010
>>  
>> -#define K8_MTRRFIXRANGE_DRAM_ENABLE	0x00040000 /* MtrrFixDramEn bit    */
>> -#define K8_MTRRFIXRANGE_DRAM_MODIFY	0x00080000 /* MtrrFixDramModEn bit */
>>  #define K8_MTRR_RDMEM_WRMEM_MASK	0x18181818 /* Mask: RdMem|WrMem    */
> 
> That last one seem to be unused, I wonder if you could also drop it as
> part of this cleanup?

It's for an unrelated set of MSRs, so I thought I'd leave it alone
here. Otoh the value is at best bogus anyway, as it assumes both
halves of fixed-size MTRRs get accessed separately. So I guess
since you ask for it, I'll drop it at this occasion.

Jan

