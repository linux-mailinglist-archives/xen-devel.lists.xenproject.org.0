Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40CB7F4DB9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 18:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638930.995923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qe2-0001ZF-35; Wed, 22 Nov 2023 17:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638930.995923; Wed, 22 Nov 2023 17:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qe2-0001Wj-0L; Wed, 22 Nov 2023 17:04:10 +0000
Received: by outflank-mailman (input) for mailman id 638930;
 Wed, 22 Nov 2023 17:04:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0DV9=HD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5qe0-0001PV-MD
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 17:04:08 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25e986d6-8959-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 18:04:07 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4083f61312eso39540355e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 09:04:07 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 j3-20020a056000124300b0032f7e832cabsm17666878wrx.90.2023.11.22.09.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 09:04:06 -0800 (PST)
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
X-Inumbo-ID: 25e986d6-8959-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700672647; x=1701277447; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tC8eRiwVKQ/6nA/DQub9aamqJlUsebUP0HNGF+qN6Gk=;
        b=ZuI//xYdxtf4HxhJ8bH66wVZDPG9eQ9o3yifI5O+I1VQfJX/mqSP+iwXpfB3ClAdSX
         jXSDIhgb54tOGoKoylP+9Pbuk1VlUeSooZZGdukWWxHKuZMPLyIeqA8uWGsq8luqUKj7
         vZmrg5Pajp0IVT7vS18e1LSwae9sMMbi5Z/Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700672647; x=1701277447;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tC8eRiwVKQ/6nA/DQub9aamqJlUsebUP0HNGF+qN6Gk=;
        b=SW45UjvaecaYiQF8i9j9UihajwezeKOVq/9vCLJ6Li/CS8Gn10/7gri8RQ/xVrUL6J
         iGcen35Fp3Hl/h2V6q7I0pGZuFIqdUxvj2JAJs38A952DLLn22zIFrVS3yj19tbT2M7h
         SlRpIqhIZ4uoXCsqsNGhy9nc/UjioylwYzAbHT665sNxUL/OVZpw5/HrsoDrF6UrO5Ry
         RolX2Ie+oTS6TJlt28FaRMQXhq4+8ISp8O2QHxK4+DM/NgaejKFymHopiS/ylTFNEARM
         +HvPT60crCizbkj5LsLSYXzvvZjIPIDTC9sU80/ajUpS77OKFNA6N/WRst1mVa0FyVsl
         8BpQ==
X-Gm-Message-State: AOJu0YwcmkX4m8VQXiY6q1rWYrtGP+rV/DbRYmNQJPa48YeNdyDfQKMF
	rm1f44dZJccrI9dE0eu+jXSDTw==
X-Google-Smtp-Source: AGHT+IEtIeeVD6vhiSN7rHYZbAhwN31kK+OfiRf8RXZ9BDCjDZi7Lbqjxrzz5tYhSSt1prf5DiGJkw==
X-Received: by 2002:a5d:6e55:0:b0:332:d71f:3be8 with SMTP id j21-20020a5d6e55000000b00332d71f3be8mr308253wrz.4.1700672647162;
        Wed, 22 Nov 2023 09:04:07 -0800 (PST)
Date: Wed, 22 Nov 2023 18:04:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/x86: On x2APIC mode, derive LDR from APIC_ID
Message-ID: <ZV40hlVVvt5pyk26@macbook>
References: <20231121162604.19405-1-alejandro.vallejo@cloud.com>
 <ZV4EsjpoPThN5YME@macbook>
 <655e1a3a.050a0220.137b8.9238@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <655e1a3a.050a0220.137b8.9238@mx.google.com>

On Wed, Nov 22, 2023 at 03:11:52PM +0000, Alejandro Vallejo wrote:
> On Wed, Nov 22, 2023 at 02:40:02PM +0100, Roger Pau Monné wrote:
> > On Tue, Nov 21, 2023 at 04:26:04PM +0000, Alejandro Vallejo wrote:
> > > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > > index a8e87c4446..7f169f1e5f 100644
> > > --- a/xen/arch/x86/hvm/vlapic.c
> > > +++ b/xen/arch/x86/hvm/vlapic.c
> > > @@ -1061,13 +1061,23 @@ static const struct hvm_mmio_ops vlapic_mmio_ops = {
> > >      .write = vlapic_mmio_write,
> > >  };
> > >  
> > > +static uint32_t x2apic_ldr_from_id(uint32_t id)
> > > +{
> > > +    return ((id & ~0xF) << 12) | (1 << (id & 0xF));
> > 
> > Seeing other usages in vlapic.c I think the preference is to use lower
> > case for hex numbers.
> I thought it was covered by a MISRA rule, but it seems to apply only to the
> literal suffixes. Fair enough, I'll revert to lowercase.

FWIW, I'm thinking that I want to move x2apic_ldr_from_id() to a
header file, so that it can also be used by the native APIC driver in
order to detect when the LDR field is not configured according to the
spec (so adding a consistency check in
init_apic_ldr_x2apic_cluster()).

Anyway, might look into doing that after this patch is in.

> > > +    else if ( bad_ldr == vlapic->loaded.ldr )
> > >          /*
> > > -         * This is optional: ID != 0 contradicts LDR == 1. It's being added
> > > -         * to aid in eventual debugging of issues arising from the fixup done
> > > -         * here, but can be dropped as soon as it is found to conflict with
> > > -         * other (future) changes.
> > > +         * This is a migration from a broken Xen between 4.4 and 4.18 and we
> > > +         * must _PRESERVE_ LDRs so new vCPUs use consistent derivations. In
> > > +         * this case we set this domain boolean so future CPU hotplugs
> > > +         * derive an LDR consistent with the older Xen's broken idea of
> > > +         * consistency.
> > >           */
> > > -        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
> > > -             id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
> > > -            printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
> > > -                   vlapic_vcpu(vlapic), id);
> ... these. But they _seem_ bogus for several reasons. And I just got rid of
> them on these grounds:
> 
>   * It's using the GET_xAPIC_ID() macro on the register, but the LAPIC is
>     not in xAPIC mode (due to the previous check), so the legacy APIC must
>     be derived from the lowest octet, not the highest. That macro is meant
>     to be used on the MMIO register, not the MSR one.
>   * The printk (wants to be) triggered when the ID field is not "canonical"
>     OR the x2APIC ID is not a pure xAPIC ID. Neither of these things are
>     problems per se, the former just happens to be true at the moment, but
>     the latter may very well not be, and that shouldn't trigger a scary
>     printk.
>   * The error message seems to imply the effective APIC ID eventually left
>     loaded is the bogus one, but that's not the case.
> 
> Actually, I might just move the printk into a separate else in line with
> your previous suggestion.

Sounds good.  And I agree that using {GET,SET}_xAPIC_ID() on the
x2APIC 32bit width IDs looks to be wrong.

> > >  static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> > > diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> > > index 6e53ce4449..a42a6e99bb 100644
> > > --- a/xen/arch/x86/include/asm/hvm/domain.h
> > > +++ b/xen/arch/x86/include/asm/hvm/domain.h
> > > @@ -61,6 +61,19 @@ struct hvm_domain {
> > >      /* Cached CF8 for guest PCI config cycles */
> > >      uint32_t                pci_cf8;
> > >  
> > > +    /*
> > > +     * Xen had a bug between 4.4 and 4.18 by which the x2APIC LDR was
> > > +     * derived from the vcpu_id rather than the x2APIC ID. This is wrong,
> > > +     * but changing this behaviour is tricky because guests might have
> > > +     * already read the LDR and used it accordingly. In the interest of not
> > > +     * breaking migrations from those hypervisors we track here whether
> > > +     * this domain suffers from this or not so a hotplugged vCPU or an APIC
> > > +     * reset can recover the same LDR it would've had on the older host.
> > > +     *
> > > +     * Yuck!
> > > +     */
> > > +    bool has_inconsistent_x2apic_ldr_bug;
> > 
> > Could you place the new field after the existing boolean fields in the
> > struct? (AFAICT there's plenty of padding left there)
> Sure. I placed it somewhere with unused padding. (that u32 is sandwiched
> between an "unsigned long" and a pointer), but I'm happy to stash it with
> the other booleans.

Yes, there's plenty of padding but I feel it's better to place it with
the rest of the booleans, as there's also padding there.

> > 
> > I also think the field name is too long, I would rather use
> > x2apic_ldr_vcpu_id for example (to note that LDR is calculated from
> > vCPU ID rather than APIC ID).
> I made it intentionally long so it can't be missed that it's a workaround
> and not architectural behaviour. Would you consider
> "x2apic_ldr_bug_vcpu_id" acceptable? I'd rather keep at least the "bug"
> part of the identifier around so it's not lost to time that this is a
> workaround marker and nothing else

OK, if you think mentioning `bug` is helpful, I think it would be best
placed as a prefix: bug_x2apic_ldr_vcpu_id.  Having it in the middle
of the field name makes it harder to spot.

Thanks, Roger.

