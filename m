Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812897F49F4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 16:12:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638816.995748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5otT-0004d5-8P; Wed, 22 Nov 2023 15:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638816.995748; Wed, 22 Nov 2023 15:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5otT-0004aH-4f; Wed, 22 Nov 2023 15:11:59 +0000
Received: by outflank-mailman (input) for mailman id 638816;
 Wed, 22 Nov 2023 15:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1AL=HD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r5otR-0004aB-UH
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 15:11:57 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79a5a4c9-8949-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 16:11:56 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b31232bf0so6622155e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 07:11:56 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004094d4292aesm2474213wmb.18.2023.11.22.07.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 07:11:54 -0800 (PST)
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
X-Inumbo-ID: 79a5a4c9-8949-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700665916; x=1701270716; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YlRXJcOcg86B5FeODMCbWgJVq9mSDyoMuAUjyQGn5TQ=;
        b=Rwn7LKNmwqzfbDS9Uk6Fg3RswE0kukzkRB23nhqwQKZotpIK2ojzhMeyvRDzjzgFsv
         HKDtQ0g+Jz+Jcon4FuSPAmDEFCwfDKn9KKZeX9u4AmvQz4sioFQV5g2LBJM/CzfaCYbf
         I3RTnJDdOSvmfHyLphtqfnubjrAlpMZaSSpHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700665916; x=1701270716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YlRXJcOcg86B5FeODMCbWgJVq9mSDyoMuAUjyQGn5TQ=;
        b=clIv4YYGym1oJ86RESrAnhjS/lVa5vLrTKiEgUZqqM0x1ZNXh31fbqGuIKxMkr3KGm
         f9GqI6qej9Wv+NbpXmO0AaPqrWLIzw4PF2igakFnCQ3jRPUDBl7N3byfpujzZ/8bd0y0
         h1t/XSwWdp1sJyt7/6XkuQOiG8DlqYP7zySgvcHw+S6FaOMh7M54ivxH4UOrM9pl6BkK
         P3SY2pPR4obsURBdptr/BKKDPs1FUajXzGCA6GGfOe4hx+9YvAJjLD5FSMi1ml9z5TEy
         hKLgUJ90+5pRE+P3SsHdaNUwJdIXHTQ1o44pKJ4bVTuqQwIaabKPeVdypWxRbPI6qjRx
         AV9A==
X-Gm-Message-State: AOJu0Yz/ymsEiec69oz3bT5FM+GMe+HLGExkMZuzB6E8p3R4yGTsTmqX
	iDan8Q3Ftu/6elXg0mDb2TZXhQ==
X-Google-Smtp-Source: AGHT+IEC1M2wBCvQbevAApM2RSBCZAMZW5mOnhkw9ueCIHr5Ud6ZpP4EJz+c744wwfSfPi1lU4PwvA==
X-Received: by 2002:a05:600c:4510:b0:3fe:1b4e:c484 with SMTP id t16-20020a05600c451000b003fe1b4ec484mr520176wmo.5.1700665915580;
        Wed, 22 Nov 2023 07:11:55 -0800 (PST)
Message-ID: <655e1a3a.050a0220.137b8.9238@mx.google.com>
X-Google-Original-Message-ID: <ZV4aOL21DpdHdROm@EMEAENGAAD19049.>
Date: Wed, 22 Nov 2023 15:11:52 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/x86: On x2APIC mode, derive LDR from APIC_ID
References: <20231121162604.19405-1-alejandro.vallejo@cloud.com>
 <ZV4EsjpoPThN5YME@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZV4EsjpoPThN5YME@macbook>

On Wed, Nov 22, 2023 at 02:40:02PM +0100, Roger Pau Monné wrote:
> On Tue, Nov 21, 2023 at 04:26:04PM +0000, Alejandro Vallejo wrote:
> > Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> > registers are derivable from each other through a fixed formula.
> > 
> > Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> > rather than x2APIC_IDs (which are not, at the moment). As I understand it,
> > this is an attempt to tightly pack vCPUs into clusters so each cluster has
> > 16 vCPUs rather than 8, but this is problematic for OSs that might read the
> > x2APIC_ID and internally derive LDR (or the other way around)
> > 
> > This patch fixes the implementation so we follow the rules in the x2APIC
> > spec(s).
> > 
> > The patch also covers migrations from broken hypervisors, so LDRs are
> > preserved even for hotppluggable CPUs and across APIC resets.
> > 
> > Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> LGTM, just a couple of style comments.
> 
> > ---
> > I tested this by creating 3 checkpoints.
> >  1. One with pre-4.4 broken state (every LDR=1, by hacking save_regs)
> >  2. One with 4.4 onwards broken state (LDRs packed in their clusters)
> >  3. One with correct LDR values
> > 
> > (1) and (3) restores to the same thing. Consistent APIC_ID+LDR
> > (2) restores to what it previously had and hotplugs follow the same logic
> > ---
> >  xen/arch/x86/hvm/vlapic.c             | 81 +++++++++++++++++++--------
> >  xen/arch/x86/include/asm/hvm/domain.h | 13 +++++
> >  2 files changed, 72 insertions(+), 22 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > index a8e87c4446..7f169f1e5f 100644
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -1061,13 +1061,23 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
> >      .write = vlapic_mmio_write,
> >  };
> >  
> > +static uint32_t x2apic_ldr_from_id(uint32_t id)
> > +{
> > +    return ((id & ~0xF) << 12) | (1 << (id & 0xF));
> 
> Seeing other usages in vlapic.c I think the preference is to use lower
> case for hex numbers.
I thought it was covered by a MISRA rule, but it seems to apply only to the
literal suffixes. Fair enough, I'll revert to lowercase.

> 
> > +}
> > +
> >  static void set_x2apic_id(struct vlapic *vlapic)
> >  {
> > -    u32 id = vlapic_vcpu(vlapic)->vcpu_id;
> > -    u32 ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
> > +    uint32_t vcpu_id = vlapic_vcpu(vlapic)->vcpu_id;
> > +    uint32_t apic_id = vcpu_id * 2;
> > +    uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
> >  
> > -    vlapic_set_reg(vlapic, APIC_ID, id * 2);
> > -    vlapic_set_reg(vlapic, APIC_LDR, ldr);
> > +    /* This is a migration bug workaround. See wall of text in lapic_load_fixup() */
> > +    if ( vlapic_domain(vlapic)->arch.hvm.has_inconsistent_x2apic_ldr_bug )
> > +        apic_ldr = x2apic_ldr_from_id(vcpu_id);
> > +
> > +    vlapic_set_reg(vlapic, APIC_ID, apic_id);
> > +    vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
> >  }
> >  
> >  int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
> > @@ -1495,30 +1505,57 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
> >  /*
> >   * Following lapic_load_hidden()/lapic_load_regs() we may need to
> >   * correct ID and LDR when they come from an old, broken hypervisor.
> > + *
> > + * Xen <= 4.4 had a bug by which all the APICs configured in x2APIC mode
> > + * got LDR = 1. This was fixed back then, but another bug was introduced
> > + * causing APIC ID and LDR to break the consistency they are meant to have
> > + * according to the specs (LDR was derived from vCPU ID, rather than APIC
> > + * ID)
> > + *
> > + * Long story short, we can detect both cases here. For the LDR=1 case we
> > + * want to fix it up on migrate, as IPIs just don't work on non-physical
> > + * mode otherwise. For the other case we actually want to preserve previous
> > + * behaviour so that existing running instances that may have already read
> > + * the LDR at the source host aren't surprised when IPIs stop working as
> > + * they did at the other end.
> > + *
> > + * Note that "x2apic_id == 0" has always been correct and can't be used to
> > + * discriminate these cases.
> > + *
> 
> I think it's best if this big comment was split between the relevant
> parts of the if below used to detect the broken states, as that makes
> the comments more in-place with the code.
Ack
> 
> > + * Yuck!
> >   */
> >  static void lapic_load_fixup(struct vlapic *vlapic)
> >  {
> > -    uint32_t id = vlapic->loaded.id;
> > +    /*
> > +     * This LDR would be present in broken versions of Xen 4.4 through 4.18.
> > +     * It's correct for the cpu with x2apic_id=0 (vcpu0), but invalid for
> > +     * any other.
> > +     */
> > +    uint32_t bad_ldr = x2apic_ldr_from_id(vlapic_vcpu(vlapic)->vcpu_id);
> >  
> > -    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
> > -    {
> > +    /*
> > +     * No need to perform fixups in non-x2apic mode, and x2apic_id == 0 has
> > +     * always been correct.
> > +     */
> > +    if ( !vlapic_x2apic_mode(vlapic) || !vlapic->loaded.id )
> 
> You could replace the !vlapic->loaded.id check and instead use:
> 
> vlapic->loaded.ldr == x2apic_ldr_from_id(vlapic->loaded.id)
> 
> As that will allow returning early from the function if the LDR is
> correct.  Then if none of the fixups below apply we could print a
> warning message that the LDR is incorrect, but cannot be fixed up.
Sounds good.

> 
> > +        return;
> > +
> > +    if ( vlapic->loaded.ldr == 1 )
> > +       /*
> > +        * Migration from a broken Xen 4.4 or earlier. We can't leave it
> > +        * as-is because it assigned the same LDR to every CPU. We'll fix
> > +        * the bug now and assign LDR values consistent with the APIC ID.
> > +        */
> > +        set_x2apic_id(vlapic);
> 
> Previous code also did some checks here related to APIC ID sanity,
> which are now dropped?
> 
> Might be worth mentioning in the commit message, if that was intended.
> 
It was intentional, yes. And it's true it warrants something in the commit
message. For reference, the checks previously done where...

> > +    else if ( bad_ldr == vlapic->loaded.ldr )
> >          /*
> > -         * This is optional: ID != 0 contradicts LDR == 1. It's being added
> > -         * to aid in eventual debugging of issues arising from the fixup done
> > -         * here, but can be dropped as soon as it is found to conflict with
> > -         * other (future) changes.
> > +         * This is a migration from a broken Xen between 4.4 and 4.18 and we
> > +         * must _PRESERVE_ LDRs so new vCPUs use consistent derivations. In
> > +         * this case we set this domain boolean so future CPU hotplugs
> > +         * derive an LDR consistent with the older Xen's broken idea of
> > +         * consistency.
> >           */
> > -        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
> > -             id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
> > -            printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
> > -                   vlapic_vcpu(vlapic), id);
... these. But they _seem_ bogus for several reasons. And I just got rid of
them on these grounds:

  * It's using the GET_xAPIC_ID() macro on the register, but the LAPIC is
    not in xAPIC mode (due to the previous check), so the legacy APIC must
    be derived from the lowest octet, not the highest. That macro is meant
    to be used on the MMIO register, not the MSR one.
  * The printk (wants to be) triggered when the ID field is not "canonical"
    OR the x2APIC ID is not a pure xAPIC ID. Neither of these things are
    problems per se, the former just happens to be true at the moment, but
    the latter may very well not be, and that shouldn't trigger a scary
    printk.
  * The error message seems to imply the effective APIC ID eventually left
    loaded is the bogus one, but that's not the case.

Actually, I might just move the printk into a separate else in line with
your previous suggestion.

> > -        set_x2apic_id(vlapic);
> > -    }
> > -    else /* Undo an eventual earlier fixup. */
> > -    {
> > -        vlapic_set_reg(vlapic, APIC_ID, id);
> > -        vlapic_set_reg(vlapic, APIC_LDR, vlapic->loaded.ldr);
> > -    }
> > +        vlapic_domain(vlapic)->arch.hvm.has_inconsistent_x2apic_ldr_bug = true;
> >  }
> >  
> >  static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> > diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> > index 6e53ce4449..a42a6e99bb 100644
> > --- a/xen/arch/x86/include/asm/hvm/domain.h
> > +++ b/xen/arch/x86/include/asm/hvm/domain.h
> > @@ -61,6 +61,19 @@ struct hvm_domain {
> >      /* Cached CF8 for guest PCI config cycles */
> >      uint32_t                pci_cf8;
> >  
> > +    /*
> > +     * Xen had a bug between 4.4 and 4.18 by which the x2APIC LDR was
> > +     * derived from the vcpu_id rather than the x2APIC ID. This is wrong,
> > +     * but changing this behaviour is tricky because guests might have
> > +     * already read the LDR and used it accordingly. In the interest of not
> > +     * breaking migrations from those hypervisors we track here whether
> > +     * this domain suffers from this or not so a hotplugged vCPU or an APIC
> > +     * reset can recover the same LDR it would've had on the older host.
> > +     *
> > +     * Yuck!
> > +     */
> > +    bool has_inconsistent_x2apic_ldr_bug;
> 
> Could you place the new field after the existing boolean fields in the
> struct? (AFAICT there's plenty of padding left there)
Sure. I placed it somewhere with unused padding. (that u32 is sandwiched
between an "unsigned long" and a pointer), but I'm happy to stash it with
the other booleans.

> 
> I also think the field name is too long, I would rather use
> x2apic_ldr_vcpu_id for example (to note that LDR is calculated from
> vCPU ID rather than APIC ID).
I made it intentionally long so it can't be missed that it's a workaround
and not architectural behaviour. Would you consider
"x2apic_ldr_bug_vcpu_id" acceptable? I'd rather keep at least the "bug"
part of the identifier around so it's not lost to time that this is a
workaround marker and nothing else.

> 
> I think it would be good if we could trim a bit the comments, as I get
> the impression it's a bit repetitive.
> 
> So I would leave the big explanation in lapic_load_fixup(), and just
> comment here:
> 
> /* Compatibility setting for a bug in x2APIC LDR format. */
Sure, I'll put that comment on a diet

> 
> Thanks, Roger.

Cheers,
Alejandro

