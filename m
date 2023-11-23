Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBCD7F5EF1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 13:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639691.997322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68iF-0006EZ-5T; Thu, 23 Nov 2023 12:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639691.997322; Thu, 23 Nov 2023 12:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68iF-0006CF-2s; Thu, 23 Nov 2023 12:21:43 +0000
Received: by outflank-mailman (input) for mailman id 639691;
 Thu, 23 Nov 2023 12:21:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xmv=HE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r68iD-0006C9-Md
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 12:21:41 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da4fa432-89fa-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 13:21:39 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50aabfa1b75so1047830e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 04:21:39 -0800 (PST)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c3-20020a5d4143000000b0032da49e18fasm1527987wrq.23.2023.11.23.04.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 04:21:38 -0800 (PST)
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
X-Inumbo-ID: da4fa432-89fa-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700742099; x=1701346899; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GLcs6JC5/5szpcpgesIIKdBNp91UY+6He+PojjhxwKo=;
        b=iAsdnFdqlcW/XzXIGI/BMRe6Y3YrIyX6zEUDGdVRbW9m3fOUzyQMiZZKwEsgcrskoN
         tefc9fDhdsX8Y5dAanR72G7CBNiE+r4VWtcZvULvTlpSRMihGpqJeJKrgx0ZZ/8WL/E9
         P5taUKjktqK99y7aLUFAH/mKW9juTzDgK4rZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700742099; x=1701346899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLcs6JC5/5szpcpgesIIKdBNp91UY+6He+PojjhxwKo=;
        b=o8zwPwSFSHjO2tfvXc+FYvlnB1vysXc4ZkRPEycwQURITR25S9ii0OC6/w3kEjjO9O
         ws9W+UFJwH4Isk4PXM40ys8p6xQSwfy+GMhJUhRNxlfby8Zc0aNt8keMD4rEevMoXjaY
         qiU7mVZqxP1OA6kLDqo1jZZNrMyOrw22vBdJIF4rQV0NKRNLqOqAi4SN8lSTd/dBXwhz
         bQZQnPC4TqPZ6odS4RrzHhxjTnJr/Mtn63wJCJO6+5OBnmQ5fHpCl2jIu1SjVbW0b3I0
         /AaoMC1WmsruD+olwWq0Ws8y3YQFvB9SwccpEbE2Qt6ZG/ME7px9/UbBiBcvQjy8cudV
         sYYw==
X-Gm-Message-State: AOJu0YznlucHQv3VF9W6NGAYgQm2HnRdwW66czg7CsKgpk+IElErge78
	vAedW8TBycOTeTTNVMK7mfcPfp2KlEGIt/lfo/c=
X-Google-Smtp-Source: AGHT+IHUhaYbDTI82NyfM9Ao4ugStPyV+Y9DZcqCZu38VQuhedChd8uQ94iFhD/PoBFf7lk44nz6Jw==
X-Received: by 2002:ac2:5472:0:b0:50a:6bbc:52e7 with SMTP id e18-20020ac25472000000b0050a6bbc52e7mr3747717lfn.2.1700742098627;
        Thu, 23 Nov 2023 04:21:38 -0800 (PST)
Message-ID: <655f43d2.5d0a0220.afd7c.48b9@mx.google.com>
X-Google-Original-Message-ID: <ZV9D0HzHTi+znZfr@EMEAENGAAD19049.>
Date: Thu, 23 Nov 2023 12:21:36 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] xen/x86: On x2APIC mode, derive LDR from APIC ID
References: <20231122160817.15266-1-alejandro.vallejo@cloud.com>
 <ZV8VUFmNe30prv7_@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZV8VUFmNe30prv7_@macbook>

On Thu, Nov 23, 2023 at 10:03:12AM +0100, Roger Pau Monné wrote:
> On Wed, Nov 22, 2023 at 04:08:17PM +0000, Alejandro Vallejo wrote:
> > Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> > registers are derivable from each other through a fixed formula.
> > 
> > Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> > rather than x2APIC IDs (which are not, at the moment). As I understand it,
> > this is an attempt to tightly pack vCPUs into clusters so each cluster has
> > 16 vCPUs rather than 8, but this is problematic for OSs that might read the
> > x2APIC ID and internally derive LDR (or the other way around)
> > 
> > This patch fixes the implementation so we follow the rules in the x2APIC
> > spec(s) and covers migrations from broken hypervisors, so LDRs are
> > preserved even for hotppluggable CPUs and across APIC resets.
> > 
> > While touching that area, I removed the existing printk statement in
> > vlapic_load_fixup() (as the checks it performed didn't make sense in x2APIC
> > mode and wouldn't affect the outcome) and put another printk as an else
> > branch so we get warnings trying to load nonsensical LDR values we don't
> > know about.
> > 
> > Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> Mostly some style nits, and one comment adjustment.
> 
> If you are OK with those:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> > ---
> > v3:
> >   * Removed underscores from (x2)APIC_ID in commit message
> >   * Added commit msg explaining the removal of the vlapic_load_fixup() printk
> >   * Restored lowercase to hex "F"s
> >   * Refactored a bit vlapic_load_fixup() so it has a trailing printk in
> >     case of spotting a nonsensical LDR it doesn't understand.
> >   * Moved field in domain.h with the other booleans
> >   * Trimmed down field name in domain.h
> >   * Trimmed down field comment in domain.h
> > 
> > If the field name in domain.h still seems too long I'm happy for it to be
> > trimmed further down, but I do want to preserve the "_bug_" part of it.
> 
> I think the _with_ part is redundant, but it's certainly shorter than
> previously :).
Sure
> 
> > ---
> >  xen/arch/x86/hvm/vlapic.c             | 62 +++++++++++++++++----------
> >  xen/arch/x86/include/asm/hvm/domain.h |  3 ++
> >  2 files changed, 43 insertions(+), 22 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > index 5cb87f8649..cd929c3716 100644
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -1061,13 +1061,23 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
> >      .write = vlapic_mmio_write,
> >  };
> >  
> > +static uint32_t x2apic_ldr_from_id(uint32_t id)
> > +{
> > +    return ((id & ~0xf) << 12) | (1 << (id & 0xf));
> > +}
> > +
> >  static void set_x2apic_id(struct vlapic *vlapic)
> >  {
> > -    u32 id = vlapic_vcpu(vlapic)->vcpu_id;
> > -    u32 ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
> > +    uint32_t vcpu_id = vlapic_vcpu(vlapic)->vcpu_id;
> > +    uint32_t apic_id = vcpu_id * 2;
> > +    uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
> > +
> > +    /* This is a migration bug workaround. See wall of text in lapic_load_fixup() */
> 
> Line length > 80 cols.
> 
> I try to avoid referencing function names in comments, as they tend to
> get out of sync without noticing.  It's much easier to use cscope to
> grep for x2apic_ldr_bug_with_vcpu_id and find the comment itself.
In my experience that's less of a problem than it's usually made out to be,
and helps new readers know about the real context something is in the place
it is.

But I do hold the atypical belief that an out of date pointer to context is
preferrable to no context.

> 
> > +    if ( vlapic_domain(vlapic)->arch.hvm.x2apic_ldr_bug_with_vcpu_id )
> > +        apic_ldr = x2apic_ldr_from_id(vcpu_id);
> >  
> > -    vlapic_set_reg(vlapic, APIC_ID, id * 2);
> > -    vlapic_set_reg(vlapic, APIC_LDR, ldr);
> > +    vlapic_set_reg(vlapic, APIC_ID, apic_id);
> > +    vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
> >  }
> >  
> >  int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
> > @@ -1498,27 +1508,35 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
> >   */
> >  static void lapic_load_fixup(struct vlapic *vlapic)
> >  {
> > -    uint32_t id = vlapic->loaded.id;
> > +    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
> > +    if ( !vlapic_x2apic_mode(vlapic) ||
> > +         (vlapic->loaded.ldr == x2apic_ldr_from_id(vlapic->loaded.id)) )
> > +        return;
> >  
> > -    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
> > -    {
> > +    if ( vlapic->loaded.ldr == 1 )
> > +       /*
> > +        * Xen <= 4.4 had a bug by which all the APICs configured in x2APIC
> > +        * mode got LDR = 1. We can't leave it as-is because it assigned the
> > +        * same LDR to every CPU.  We'll fix fix the bug now and assign an
> > +        * LDR value consistent with the APIC ID.
> > +        */
> > +        set_x2apic_id(vlapic);
> > +    else if ( vlapic->loaded.ldr ==
> > +              x2apic_ldr_from_id(vlapic_vcpu(vlapic)->vcpu_id) )
> >          /*
> > -         * This is optional: ID != 0 contradicts LDR == 1. It's being added
> > -         * to aid in eventual debugging of issues arising from the fixup done
> > -         * here, but can be dropped as soon as it is found to conflict with
> > -         * other (future) changes.
> > +         * This is a migration from a broken Xen between 4.4 and 4.18 and
> > +         * we must _PRESERVE_ LDRs so new vCPUs use consistent derivations.
> 
> Not sure if we should try to avoid mentioning specific versions in the
> comments, as I this fix will be backported to stable branches (I hope),
> and hence those will no longer be affected.
Hence the "broken Xen" part of the paragraphs. Not every 4.18 will have the
problem, but it shouldn't be seen in 4.19 onwards. I think there's value in
stating the versions that "may" exhibit problems, but this is all
subjective 

> 
> > +         * This is so existing running guests that may have already read
> > +         * the LDR at the source host aren't surprised when IPIs stop
> > +         * working as they did at the other end. To address this, we set
> > +         * this domain boolean so future CPU hotplugs derive an LDR
> > +         * consistent with the older Xen's broken idea of consistency.
> 
> I think this is possibly too verbose, I would be fine with just the
> first sentence TBH.  If we want the full comment however, the wording
> should be slightly addressed: it's not just IPIs that would possibly
> fail to be delivered, but any interrupt attempting to target the APIC
> using the previous LDR addressing (either an IPI or an external
> interrupt).
I can s/IPIs/targetted interrupts/ and remove the second sentence.

> 
> >           */
> > -        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
> > -             id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
> > -            printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
> > -                   vlapic_vcpu(vlapic), id);
> > -        set_x2apic_id(vlapic);
> > -    }
> > -    else /* Undo an eventual earlier fixup. */
> > -    {
> > -        vlapic_set_reg(vlapic, APIC_ID, id);
> > -        vlapic_set_reg(vlapic, APIC_LDR, vlapic->loaded.ldr);
> > -    }
> > +        vlapic_domain(vlapic)->arch.hvm.x2apic_ldr_bug_with_vcpu_id = true;
> > +    else
> > +        printk(XENLOG_G_WARNING
> > +               "%pv: bogus x2APIC loaded id=%#x ldr=%#x\n",
> > +               vlapic_vcpu(vlapic), vlapic->loaded.id, vlapic->loaded.ldr);
> 
> Could you write the expected values while at it:
> 
> "%pv: bogus x2APIC loaded id=%#x ldr=%#x (expected id=%#x ldr=%#x)\n"
x2APIC ID is current strictly related to the vcpu ID, but it won't be after
I'm done with topology. I can print the expected LDR though.
> 
> >  }
> >  
> >  static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> > diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> > index 6e53ce4449..2fee3874cd 100644
> > --- a/xen/arch/x86/include/asm/hvm/domain.h
> > +++ b/xen/arch/x86/include/asm/hvm/domain.h
> > @@ -106,6 +106,9 @@ struct hvm_domain {
> >  
> >      bool                   is_s3_suspended;
> >  
> > +    /* Compat setting for a bug in x2APIC LDR. See vlapic_load_fixup() */
> > +    bool x2apic_ldr_bug_with_vcpu_id;
> 
> I think you already mentioned in a followup reply that using
> bug_x2apic_ldr_vcpu_id would be fine.
> 
> Thanks, Roger.

Cheers,
Alejandro

