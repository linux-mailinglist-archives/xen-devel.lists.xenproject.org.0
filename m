Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E3C7F6100
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 15:04:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639750.997422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6AIz-0002xg-I4; Thu, 23 Nov 2023 14:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639750.997422; Thu, 23 Nov 2023 14:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6AIz-0002vu-DM; Thu, 23 Nov 2023 14:03:45 +0000
Received: by outflank-mailman (input) for mailman id 639750;
 Thu, 23 Nov 2023 14:03:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r6AIx-0002vo-Oy
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 14:03:43 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19d1b306-8a09-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 15:03:38 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32fdc5be26dso493718f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 06:03:38 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 s11-20020adfeccb000000b00332c6c5ce82sm1749462wro.94.2023.11.23.06.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 06:03:37 -0800 (PST)
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
X-Inumbo-ID: 19d1b306-8a09-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700748218; x=1701353018; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4w0Ll5Z0+tsReFNI0L6TwaBLx7stMZGJ1xi3oGaHBHE=;
        b=TiKzV388FwgakKS/D7DCTaOJpBTrmRgP1EsvE8DEuzuEBObeMUaSMfIJVYOQb+Np4c
         76IITtRKwARicaIQIdaZhLnwBbhvGMbOfMmR8QY9VFlwzJoH04z/208yo1cE7JtVyhDe
         I5abQTP512uu2DZREKCJSEUrGMKDH3Qvk4aak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700748218; x=1701353018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4w0Ll5Z0+tsReFNI0L6TwaBLx7stMZGJ1xi3oGaHBHE=;
        b=XXydlC4KE4ioV7yYaH4FmKEZnVMk4+oGz1uANhUQFBJTdSpp59F/S3eXA9Zbr1JKlQ
         9s5SWNFzDae1KB7Nri1Gzqx9Q8dr2EzZ4CBSPD+J6OG6T/yeAGFKMGhE7cdQf05LHPIu
         P+0i3DI4AkwNZEhV2W8M1Ihx0IM1ozKrj45nkYV/XmNW4oLNyZ7zS6RuvD1g87ks2T6h
         1nxu4nzOdVZa6YhnIveDG+WwqwHvgwO7YEEMSFqXx15cRSGTCho0jGAjR3xTm1mj8/kz
         KgvQLjlAcLoyr6Hi8egp1e+7SoGuPyV5lEqEeulUlILcO8F+jlcJtcdQpTWxh1XbF9xW
         SBeg==
X-Gm-Message-State: AOJu0Yzxqpjx7ThehoRz2EH8AsiG3qXQgavjkwwJqeT/9Qu2MjzX4EKQ
	GJ+T79d+TeY/WSS7ZNwC1aOUpQ==
X-Google-Smtp-Source: AGHT+IGhc2AeetIk6vo28zcyGDjwnmepgcn9RGG2JHlM91YPT7k5cme2XhF1FY934P+W8EC+nMNG5g==
X-Received: by 2002:a05:6000:818:b0:32f:7cba:6815 with SMTP id bt24-20020a056000081800b0032f7cba6815mr3034593wrb.61.1700748217602;
        Thu, 23 Nov 2023 06:03:37 -0800 (PST)
Date: Thu, 23 Nov 2023 15:03:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] xen/x86: On x2APIC mode, derive LDR from APIC ID
Message-ID: <ZV9buKlgta4Gbn-a@macbook>
References: <20231122160817.15266-1-alejandro.vallejo@cloud.com>
 <ZV8VUFmNe30prv7_@macbook>
 <655f43d2.5d0a0220.afd7c.48b9@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <655f43d2.5d0a0220.afd7c.48b9@mx.google.com>

On Thu, Nov 23, 2023 at 12:21:36PM +0000, Alejandro Vallejo wrote:
> On Thu, Nov 23, 2023 at 10:03:12AM +0100, Roger Pau Monné wrote:
> > On Wed, Nov 22, 2023 at 04:08:17PM +0000, Alejandro Vallejo wrote:
> > > +static uint32_t x2apic_ldr_from_id(uint32_t id)
> > > +{
> > > +    return ((id & ~0xf) << 12) | (1 << (id & 0xf));
> > > +}
> > > +
> > >  static void set_x2apic_id(struct vlapic *vlapic)
> > >  {
> > > -    u32 id = vlapic_vcpu(vlapic)->vcpu_id;
> > > -    u32 ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
> > > +    uint32_t vcpu_id = vlapic_vcpu(vlapic)->vcpu_id;
> > > +    uint32_t apic_id = vcpu_id * 2;
> > > +    uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
> > > +
> > > +    /* This is a migration bug workaround. See wall of text in lapic_load_fixup() */
> > 
> > Line length > 80 cols.
> > 
> > I try to avoid referencing function names in comments, as they tend to
> > get out of sync without noticing.  It's much easier to use cscope to
> > grep for x2apic_ldr_bug_with_vcpu_id and find the comment itself.
> In my experience that's less of a problem than it's usually made out to be,
> and helps new readers know about the real context something is in the place
> it is.
> 
> But I do hold the atypical belief that an out of date pointer to context is
> preferrable to no context.

It's a question of taste TBH, I'm certainly not going to insist.

Since you have to wrap the line to fit in 80 cols anyway, I think I
would rather write: "This is a workaround for migrated domains. ...".
Current text reads to me as it's a migration bug, but that's not the
case, the bug is in the previous Xen versions.  I'm not a native
speaker anyway, so maybe it's just me reading it wrong.

> > 
> > > +    if ( vlapic_domain(vlapic)->arch.hvm.x2apic_ldr_bug_with_vcpu_id )
> > > +        apic_ldr = x2apic_ldr_from_id(vcpu_id);
> > >  
> > > -    vlapic_set_reg(vlapic, APIC_ID, id * 2);
> > > -    vlapic_set_reg(vlapic, APIC_LDR, ldr);
> > > +    vlapic_set_reg(vlapic, APIC_ID, apic_id);
> > > +    vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
> > >  }
> > >  
> > >  int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
> > > @@ -1498,27 +1508,35 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
> > >   */
> > >  static void lapic_load_fixup(struct vlapic *vlapic)
> > >  {
> > > -    uint32_t id = vlapic->loaded.id;
> > > +    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
> > > +    if ( !vlapic_x2apic_mode(vlapic) ||
> > > +         (vlapic->loaded.ldr == x2apic_ldr_from_id(vlapic->loaded.id)) )
> > > +        return;
> > >  
> > > -    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
> > > -    {
> > > +    if ( vlapic->loaded.ldr == 1 )
> > > +       /*
> > > +        * Xen <= 4.4 had a bug by which all the APICs configured in x2APIC
> > > +        * mode got LDR = 1. We can't leave it as-is because it assigned the
> > > +        * same LDR to every CPU.  We'll fix fix the bug now and assign an
> > > +        * LDR value consistent with the APIC ID.
> > > +        */
> > > +        set_x2apic_id(vlapic);
> > > +    else if ( vlapic->loaded.ldr ==
> > > +              x2apic_ldr_from_id(vlapic_vcpu(vlapic)->vcpu_id) )
> > >          /*
> > > -         * This is optional: ID != 0 contradicts LDR == 1. It's being added
> > > -         * to aid in eventual debugging of issues arising from the fixup done
> > > -         * here, but can be dropped as soon as it is found to conflict with
> > > -         * other (future) changes.
> > > +         * This is a migration from a broken Xen between 4.4 and 4.18 and
> > > +         * we must _PRESERVE_ LDRs so new vCPUs use consistent derivations.
> > 
> > Not sure if we should try to avoid mentioning specific versions in the
> > comments, as I this fix will be backported to stable branches (I hope),
> > and hence those will no longer be affected.
> Hence the "broken Xen" part of the paragraphs. Not every 4.18 will have the
> problem, but it shouldn't be seen in 4.19 onwards. I think there's value in
> stating the versions that "may" exhibit problems, but this is all
> subjective 

FE.

> > 
> > > +         * This is so existing running guests that may have already read
> > > +         * the LDR at the source host aren't surprised when IPIs stop
> > > +         * working as they did at the other end. To address this, we set
> > > +         * this domain boolean so future CPU hotplugs derive an LDR
> > > +         * consistent with the older Xen's broken idea of consistency.
> > 
> > I think this is possibly too verbose, I would be fine with just the
> > first sentence TBH.  If we want the full comment however, the wording
> > should be slightly addressed: it's not just IPIs that would possibly
> > fail to be delivered, but any interrupt attempting to target the APIC
> > using the previous LDR addressing (either an IPI or an external
> > interrupt).
> I can s/IPIs/targetted interrupts/ and remove the second sentence.

I would just use interrupts FWIW.

> > 
> > >           */
> > > -        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
> > > -             id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
> > > -            printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
> > > -                   vlapic_vcpu(vlapic), id);
> > > -        set_x2apic_id(vlapic);
> > > -    }
> > > -    else /* Undo an eventual earlier fixup. */
> > > -    {
> > > -        vlapic_set_reg(vlapic, APIC_ID, id);
> > > -        vlapic_set_reg(vlapic, APIC_LDR, vlapic->loaded.ldr);
> > > -    }
> > > +        vlapic_domain(vlapic)->arch.hvm.x2apic_ldr_bug_with_vcpu_id = true;
> > > +    else
> > > +        printk(XENLOG_G_WARNING
> > > +               "%pv: bogus x2APIC loaded id=%#x ldr=%#x\n",
> > > +               vlapic_vcpu(vlapic), vlapic->loaded.id, vlapic->loaded.ldr);
> > 
> > Could you write the expected values while at it:
> > 
> > "%pv: bogus x2APIC loaded id=%#x ldr=%#x (expected id=%#x ldr=%#x)\n"
> x2APIC ID is current strictly related to the vcpu ID, but it won't be after
> I'm done with topology. I can print the expected LDR though.

Oh, I see.  Just printing the expected LDR then would be fine.

Thanks, Roger.

