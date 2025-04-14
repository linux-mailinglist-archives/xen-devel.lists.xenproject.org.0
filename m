Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B9A88344
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 15:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950301.1346668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KFq-00020E-Jo; Mon, 14 Apr 2025 13:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950301.1346668; Mon, 14 Apr 2025 13:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KFq-0001xK-H0; Mon, 14 Apr 2025 13:53:42 +0000
Received: by outflank-mailman (input) for mailman id 950301;
 Mon, 14 Apr 2025 13:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bgKV=XA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4KFp-0001wy-1g
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 13:53:41 +0000
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de1ce9ba-1937-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 15:53:40 +0200 (CEST)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-af91fc1fa90so4003474a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 06:53:40 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-306df3ffc38sm11085485a91.40.2025.04.14.06.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 06:53:37 -0700 (PDT)
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
X-Inumbo-ID: de1ce9ba-1937-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744638818; x=1745243618; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yF3TQI9kFpPlllrK3uiAM8glsQvPwTQUXhruOt8PHMI=;
        b=U7EOVqidnRfQF6nQitZtE4V2oBeafxwI/Xbg/WT5FB9TceVHi0l7+4xx6/x1hI8MEa
         7OYQiBteQuXzMZ/U/MWFieUrGiP6RWHoGndWzeavRKNoy15pHit2rSuYUFlw25w5sDh9
         g0/2+lZF75WRoShM971q8uwekuz0wWbstwDi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638818; x=1745243618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yF3TQI9kFpPlllrK3uiAM8glsQvPwTQUXhruOt8PHMI=;
        b=bCcyvy0HeID4Vqpb5EsadDAFFuy488hqWyZFEL8XISdItWhbWAe1x+x93mZWz3HO2c
         Vat/0rkrSHWtN4CisdrWujyZH3IRh8QB2aIYvGtD7WfQDj2xdUFBC0RKPgshIYcOcLHW
         4jHQcX99rxwpe3ts3JWJBNNe3JabvqGep5Pt0R5jWquuVfrMfzFXbeRdDYAsJ99c5lVI
         brfKXyJrGMhzHnjNTIHAmrvEGgfESMzQdW/dpVmpS9lAv0Jdnf/b7WWgg4bVLd88UNEY
         UhzbJJ+mpe7fL4E16sLvnT3Txoy/p2kloyK3QR5pDcxcmbJEryDJMoWz5nnIWM+CUuW7
         tvLw==
X-Forwarded-Encrypted: i=1; AJvYcCW5g0CxutcRnTIY0FQO18nVIr43N2gldntoFIwdxISjh8CYES6x6Ok6aUTxJUCq/RVkbIEr3rfSdaE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzK8akj4W0Cr59sgfIZ35F8hHHPwpAKIZMXcuN9G7g8SA7Qqdm0
	1XIaneZFpAld7gbeZvyu3FxdyYvqKtDSAP0WvRuZL/o1tyPYmLRYzFLPgQ0pF1M=
X-Gm-Gg: ASbGncvgZ0hayO4y6YV+X7V4emxAeF5EDm0DEqs4k8jPo06kbNFv+mjeMipDTzXccCf
	74Z8TGUIRry+nNpoL4sE+ZiAdhrSy5YUa+EKVdLzrBOHduRLX1pDLe0Zjho1uMb14i97FsrlZTe
	vgFiBrba4pPpGeWO86OTyad+46llLnE7SmvDmAZuxp0IsyCoTjlbZ60O8n6OZY6jK4+sZBKOJLX
	Xe+M/4TxNEp97zMypgK0v3oyEdWvygX32kl8XVLDghkM7Wl+99PrKrLxakTv80lqf2priWWXVjw
	8zu52DFonNbAiVmXYk/Msa/q3bkyb6AofWTq9qzVieqJLg==
X-Google-Smtp-Source: AGHT+IGBCo8s/124k9FxEnVk7VVQnYaWP6obtft0y9kFZrBTaJF+alE1n1I5vlX95WXIbClyluDWuA==
X-Received: by 2002:a17:90b:4d0c:b0:2fc:c262:ef4b with SMTP id 98e67ed59e1d1-30823645d5dmr19991048a91.18.1744638818081;
        Mon, 14 Apr 2025 06:53:38 -0700 (PDT)
Date: Mon, 14 Apr 2025 15:53:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <Z_0TXKMe6tfrYR9T@macbook.lan>
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-4-roger.pau@citrix.com>
 <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>

On Mon, Apr 14, 2025 at 08:33:44AM +0200, Jan Beulich wrote:
> On 11.04.2025 12:54, Roger Pau Monne wrote:
> > The current logic to handle accesses to MMIO pages partially read-only is
> > based on the (now removed) logic used to handle accesses to the r/o MMCFG
> > region(s) for PVH v1 dom0.  However that has issues when running on AMD
> > hardware, as in that case the guest linear address that triggered the fault
> > is not provided as part of the VM exit.  This caused
> > mmio_ro_emulated_write() to always fail before calling
> > subpage_mmio_write_emulate() when running on AMD and called from an HVM
> > context.
> > 
> > Take a different approach and convert the handling of partial read-only
> > MMIO page accesses into an HVM MMIO ops handler, as that's the more natural
> > way to handle this kind of emulation for HVM domains.
> > 
> > This allows getting rid of hvm_emulate_one_mmio() and it's single cal site
> > in hvm_hap_nested_page_fault().
> > 
> > Note a small adjustment is needed to the `pf-fixup` dom0 PVH logic: avoid
> > attempting to fixup faults resulting from accesses to read-only MMIO
> > regions, as handling of those accesses is now done by handle_mmio().
> > 
> > Fixes: 33c19df9a5a0 ('x86/PCI: intercept accesses to RO MMIO from dom0s in HVM containers')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > The fixes tag is maybe a bit wonky, it's either this or:
> > 
> > 8847d6e23f97 ('x86/mm: add API for marking only part of a MMIO page read only')
> > 
> > However the addition of subpage r/o access handling to the existing
> > mmio_ro_emulated_write() function was done based on the assumption that the
> > current code was working - which turned out to not be the case for AMD,
> > hence my preference for blaming the commit that actually introduced the
> > broken logic.
> 
> I agree.
> 
> > ---
> >  xen/arch/x86/hvm/emulate.c             | 47 +-------------
> >  xen/arch/x86/hvm/hvm.c                 | 89 +++++++++++++++++++++++---
> 
> It's quite a bit of rather special code you add to this catch-all file. How
> about introducing a small new one, e.g. mmio.c (to later maybe become home
> to some further stuff)?

Yes, I didn't find any suitable place, I was also considering
hvm/io.c or hvm/intercept.c, but none looked very good TBH.

The main benefit of placing it in hvm.c is that the functions can all
be static and confined to hvm.c as it's only user.

> > --- a/xen/arch/x86/hvm/emulate.c
> > +++ b/xen/arch/x86/hvm/emulate.c
> > @@ -370,7 +370,8 @@ static int hvmemul_do_io(
> >          /* If there is no suitable backing DM, just ignore accesses */
> >          if ( !s )
> >          {
> > -            if ( is_mmio && is_hardware_domain(currd) )
> > +            if ( is_mmio && is_hardware_domain(currd) &&
> > +                 !rangeset_contains_singleton(mmio_ro_ranges, PFN_DOWN(addr)) )
> 
> I think this needs a brief comment - it otherwise looks misplaced here.
> 
> > @@ -585,9 +585,81 @@ static int cf_check hvm_print_line(
> >      return X86EMUL_OKAY;
> >  }
> >  
> > +static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
> > +{
> > +    p2m_type_t t;
> > +    mfn_t mfn = get_gfn_query_unlocked(v->domain, addr, &t);
> > +
> > +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
> > +           !!subpage_mmio_find_page(mfn);
> 
> The !! isn't needed here, is it?

IIRC clang complained about conversion from pointer to integer without
a cast, but maybe that was before adding the further conditions here.

> > +}
> > +
> > +static int cf_check subpage_mmio_read(
> > +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> > +{
> > +    struct domain *d = v->domain;
> > +    p2m_type_t t;
> > +    mfn_t mfn = get_gfn_query(d, addr, &t);
> > +    struct subpage_ro_range *entry;
> > +    volatile void __iomem *mem;
> > +
> > +    *data = ~0UL;
> > +
> > +    if ( mfn_eq(mfn, INVALID_MFN) || t != p2m_mmio_direct )
> > +    {
> > +        put_gfn(d, addr);
> > +        return X86EMUL_RETRY;
> > +    }
> > +
> > +    entry = subpage_mmio_find_page(mfn);
> > +    if ( !entry )
> > +    {
> > +        put_gfn(d, addr);
> > +        return X86EMUL_RETRY;
> > +    }
> > +
> > +    mem = subpage_mmio_map_page(entry);
> > +    if ( !mem )
> > +    {
> > +        put_gfn(d, addr);
> > +        gprintk(XENLOG_ERR, "Failed to map page for MMIO read at %#lx\n",
> > +                mfn_to_maddr(mfn) + PAGE_OFFSET(addr));
> 
> Makes me wonder whether the function parameter wouldn't better be named
> "curr" and the local variable "currd", to reflect that this log message
> will report appropriate context.

Sure, can adjust.

> Would also logging the guest physical address perhaps be worthwhile here?

Possibly, my first apporahc was to print gfn -> mfn, but ended up
copying the same message from  subpage_mmio_write_emulate() for
symmetry reasons.

> > +        return X86EMUL_OKAY;
> > +    }
> > +
> > +    *data = read_mmio(mem + PAGE_OFFSET(addr), len);
> > +
> > +    put_gfn(d, addr);
> > +    return X86EMUL_OKAY;
> > +}
> > +
> > +static int cf_check subpage_mmio_write(
> > +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
> > +{
> > +    struct domain *d = v->domain;
> > +    p2m_type_t t;
> > +    mfn_t mfn = get_gfn_query(d, addr, &t);
> > +
> > +    if ( mfn_eq(mfn, INVALID_MFN) || t != p2m_mmio_direct )
> > +    {
> > +        put_gfn(d, addr);
> > +        return X86EMUL_RETRY;
> > +    }
> > +
> > +    subpage_mmio_write_emulate(mfn, PAGE_OFFSET(addr), data, len);
> > +
> > +    put_gfn(d, addr);
> > +    return X86EMUL_OKAY;
> > +}
> 
> Unlike the read path this doesn't return RETRY when subpage_mmio_find_page()
> fails (indicating something must have changed after "accept" said yes).

Yeah, I've noticed this, but didn't feel like modifying
subpage_mmio_write_emulate() for this.  The list of partial r/o MMIO
pages cannot change after system boot, so accept returning yes and not
finding a page here would likely warrant an ASSERT_UNRECHABLE().

Would you like me to modify subpage_mmio_write_emulate to make it
return an error code?

> > @@ -1981,7 +2056,9 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
> >       */
> >      if ( (p2mt == p2m_mmio_dm) ||
> >           (npfec.write_access &&
> > -          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
> > +          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
> > +           /* MMIO entries can be r/o if the target mfn is in mmio_ro_ranges. */
> > +           (p2mt == p2m_mmio_direct))) )
> >      {
> >          if ( !handle_mmio_with_translation(gla, gfn, npfec) )
> >              hvm_inject_hw_exception(X86_EXC_GP, 0);
> 
> Aren't we handing too many things to handle_mmio_with_translation() this
> way? At the very least you're losing ...
> 
> > @@ -2033,14 +2110,6 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
> >          goto out_put_gfn;
> >      }
> >  
> > -    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
> 
> ... the .present check.

Isn't the p2mt == p2m_mmio_direct check already ensuring the entry is
present?  Otherwise it's type would be p2m_invalid or p2m_mmio_dm?

It did seem to me the other checks in this function already assume
that by having a valid type the entry is present.

> I'm also concerned of e.g. VT-x'es APIC access MFN, which is
> p2m_mmio_direct.

But that won't go into hvm_hap_nested_page_fault() when using
cpu_has_vmx_virtualize_apic_accesses (and thus having an APIC page
mapped as p2m_mmio_direct)?

It would instead be an EXIT_REASON_APIC_ACCESS vmexit which is handled
differently?

Thanks, Roger.

