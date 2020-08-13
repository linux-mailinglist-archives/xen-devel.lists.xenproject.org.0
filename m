Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E92435C2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 10:11:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k68Jo-0004Jm-OZ; Thu, 13 Aug 2020 08:10:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JVDZ=BX=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k68Jn-0004Jh-Gc
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 08:10:35 +0000
X-Inumbo-ID: 65cacf7a-b475-4d1d-acd3-f9010f779b46
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65cacf7a-b475-4d1d-acd3-f9010f779b46;
 Thu, 13 Aug 2020 08:10:34 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 3so4254693wmi.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2020 01:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=UzJkxleXbqhDilSn1OhEdpjY7qXtGN7wLS9MlvgAzbQ=;
 b=QJ13xlSrphIf4LL1ME1pGxsPpyi5O77heTsp0FQ+N3SUOBI2m5ySi1A1RBq4BhKAPw
 ZgCwxeUzTzBxvZxY7Nndo4yLTEzwMEiFlajJJ/6JUk2DuHr2oDOUnbKhLCnbIvUoaEHP
 2NeUL17xz4zRH2usPDVUzAFwlBVXAtbqcY0TC6Nl0kH948BQDLUs1yRSVAhWdOnBkoEY
 gUoC2PO3mxbss+0mjgpff63beC3JYnDpkBElk4iBlsX/u4inYpA5LlgJ37iUKMA8JT6j
 VAos0pSTXfttPfsY/SXjt7tfb9EcmRUYHjwJjLzhmETVDC5y5+naEKPDSeW4g7c2zTu8
 BXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=UzJkxleXbqhDilSn1OhEdpjY7qXtGN7wLS9MlvgAzbQ=;
 b=AhiF9LeI9VseIiCXTLvVPf7g6utNbYOmlTk2dKPaXv9yRztEXCbwzNGVd9w+SCT9mi
 nlV1pKVUOmzAgX1tKgxzCM2KqbUOwVdaQS4OX/oqV3AGAgw3N2MXzhOUmX6+i5iuFF29
 N2cyYM69cZM5TDyT0e/KsQnx87fUFR4+JsicO1AaklNbpeNr4IYUjwtJi8tW+8n17g25
 mSmhruIlUsrFqB2178KZhjfmYi+l9uvgHWgZbY4sPENBEWusg41eqUmvLvEIf/Bcy5PR
 dCQj/Fckp7V8RDaMTG5cog4IZc+WetG8xj4Slfe/z/x6EmUkJca8PddS5+KbCFdkz9yq
 RVMw==
X-Gm-Message-State: AOAM5336sD5PSuiE2CW8/7BKj8kSLC+GosVTqYqR24XyzbeXQUG/ZKvZ
 LpAkMS9PWquatIla+MeGt2M=
X-Google-Smtp-Source: ABdhPJyak/GnDIe33HVaNHefmpQmAcwnR8ZJGnwpC/sYdcItii/LKLTac0BkoE5i70ORnfWtlZmM3A==
X-Received: by 2002:a1c:1f0d:: with SMTP id f13mr3334526wmf.53.1597306233553; 
 Thu, 13 Aug 2020 01:10:33 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-143-223-30.range86-143.btcentralplus.com.
 [86.143.223.30])
 by smtp.gmail.com with ESMTPSA id j24sm9687507wrb.49.2020.08.13.01.10.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Aug 2020 01:10:33 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
 "'Paul Durrant'" <paul.durrant@citrix.com>,
 <xen-devel@lists.xenproject.org>,
 "'Roger Pau Monne'" <roger.pau@citrix.com>
Cc: "'Eslam Elnikety'" <elnikety@amazon.de>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Shan Haitao'" <haitao.shan@intel.com>,
 "'Jan Beulich'" <jbeulich@suse.com>
References: <20180118151059.1336-1-paul.durrant@citrix.com>
 <1535153880.24926.28.camel@infradead.org>
 <7547be305e3ede9edb897e2be898fe54e0b4065c.camel@infradead.org>
In-Reply-To: <7547be305e3ede9edb897e2be898fe54e0b4065c.camel@infradead.org>
Subject: RE: [Xen-devel] [PATCH v2] x86/hvm: re-work viridian APIC assist code
Date: Thu, 13 Aug 2020 09:10:31 +0100
Message-ID: <002d01d67149$37404b00$a5c0e100$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIgHQN/h0Ty9jyVo3UQEjqW5MEoXwKDU19gAiMN4CSofSLiQA==
Content-Language: en-gb
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
David Woodhouse
> Sent: 11 August 2020 14:25
> To: Paul Durrant <paul.durrant@citrix.com>; =
xen-devel@lists.xenproject.org; Roger Pau Monne
> <roger.pau@citrix.com>
> Cc: Eslam Elnikety <elnikety@amazon.de>; Andrew Cooper =
<andrew.cooper3@citrix.com>; Shan Haitao
> <haitao.shan@intel.com>; Jan Beulich <jbeulich@suse.com>
> Subject: Re: [Xen-devel] [PATCH v2] x86/hvm: re-work viridian APIC =
assist code
>=20
> Resending this straw man patch at Roger's request, to restart =
discussion.
>=20
> Redux: In order to cope with the relatively rare case of unmaskable
> legacy MSIs, each vlapic EOI takes a domain-global spinlock just to
> iterate over all IRQs and determine that there's actually nothing to
> do.
>=20
> In my testing, I observe that this drops Windows performance on =
passed-
> through NVMe from 2.2M IOPS down to about 1.0M IOPS.
>=20
> I have a variant of this patch which just has a single per-domain "I
> attached legacy unmaskable MSIs" flag, which is never cleared. The
> patch below is per-vector (but Roger points out it should be per-vCPU
> per-vector). I don't know that we really care enough to do more than
> the single per-domain flag, which in real life would never happen
> anyway unless you have crappy hardware, at which point you get back to
> today's status quo.
>=20
> My main concern is that this code is fairly sparsely documented and =
I'm
> only 99% sure that this code path really *is* only for unmaskable =
MSIs,
> and doesn't have some other esoteric use. A second opinion on that
> would be particularly welcome.
>=20

The loop appears to be there to handle the case where multiple devices =
assigned to a domain have MSIs programmed with the same dest/vector... =
which seems like an odd thing for a guest to do but I guess it is at =
liberty to do it. Does it matter whether they are maskable or not?=20

  Paul

>=20
> (NB: APIC assist was a red herring here, except that it had a bug =
which
> stopped the gratuitous EOI work from ever happening at all =E2=80=94 =
which
> nobody ever cared about since it doesn't matter on sane hardware, but
> then when Paul *fixed* it, we saw it as a performance regression.)
>=20
>=20
> On Sat, 2018-08-25 at 00:38 +0100, David Woodhouse wrote:
> > On Thu, 2018-01-18 at 10:10 -0500, Paul Durrant wrote:
> > > Lastly the previous code did not properly emulate an EOI if a =
missed EOI
> > > was discovered in vlapic_has_pending_irq(); it merely cleared the =
bit in
> > > the ISR. The new code instead calls vlapic_EOI_set().
> >
> > Hm, this *halves* my observed performance running a 32-thread
> > 'diskspd.exe' on a Windows box with attached NVME devices, which =
makes
> > me sad.
> >
> > It's the call to hvm_dpci_msi_eoi() that does it.
> >
> > Commenting out the call to pt_pirq_iterate() and leaving *just* the
> > domain-global spinlock bouncing cache lines between all my CPUs, =
it's
> > already down to 1.6MIOPS/s from 2.2M on my test box before it does
> > *anything* at all.
> >
> > Calling an *inline* version of pt_pirq_iterate so no retpoline for =
the
> > indirect calls, and I'm down to 1.1M even when I've nopped out the
> > whole of the _hvm_dpci_msi_eoi function that it's calling. Put it =
all
> > back, and I'm down to about 1.0M. So it's worse than halved.
> >
> > And what's all this for? The code here is making my eyes bleed but I
> > believe it's for unmaskable MSIs, and these aren't unmaskable.
> >
> > Tempted to make it all go away by having a per-domain bitmap of =
vectors
> > for which all this work is actually required, and bypassing the =
whole
> > bloody lot in hvm_dpci_msi_eoi() if the corresponding in bit that
> > bitmap isn't set.
> >
> > The hackish version of that (which seems to work, but would probably
> > want testing with an actual unmaskable MSI in the system, and I have
> > absolutely no confidence I understand what's going on here) looks
> > something like this:
> >
> > diff --git a/xen/drivers/passthrough/io.c =
b/xen/drivers/passthrough/io.c
> > index bab3aa3..24df008 100644
> > --- a/xen/drivers/passthrough/io.c
> > +++ b/xen/drivers/passthrough/io.c
> > @@ -24,6 +24,7 @@
> >  #include <asm/hvm/irq.h>
> >  #include <asm/hvm/support.h>
> >  #include <asm/io_apic.h>
> > +#include <asm/msi.h>
> >
> >  static DEFINE_PER_CPU(struct list_head, dpci_list);
> >
> > @@ -282,6 +283,7 @@ int pt_irq_create_bind(
> >      struct hvm_pirq_dpci *pirq_dpci;
> >      struct pirq *info;
> >      int rc, pirq =3D pt_irq_bind->machine_irq;
> > +    irq_desc_t *desc;
> >
> >      if ( pirq < 0 || pirq >=3D d->nr_pirqs )
> >          return -EINVAL;
> > @@ -422,6 +425,13 @@ int pt_irq_create_bind(
> >
> >          dest_vcpu_id =3D hvm_girq_dest_2_vcpu_id(d, dest, =
dest_mode);
> >          pirq_dpci->gmsi.dest_vcpu_id =3D dest_vcpu_id;
> > +        BUG_ON(!local_irq_is_enabled());
> > +        desc =3D pirq_spin_lock_irq_desc(info, NULL);
> > +        if ( desc && desc->msi_desc && !msi_maskable_irq(desc-
> > >msi_desc) )
> > +            set_bit(pirq_dpci->gmsi.gvec,
> > +                    hvm_domain_irq(d)->unmaskable_msi_vecs);
> > +        spin_unlock_irq(&desc->lock);
> > +
> >          spin_unlock(&d->event_lock);
> >
> >          pirq_dpci->gmsi.posted =3D false;
> > @@ -869,7 +874,8 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
> >
> >  void hvm_dpci_msi_eoi(struct domain *d, int vector)
> >  {
> > -    if ( !iommu_enabled || !hvm_domain_irq(d)->dpci )
> > +    if ( !iommu_enabled || !hvm_domain_irq(d)->dpci ||
> > +         !test_bit(vector, hvm_domain_irq(d)->unmaskable_msi_vecs) =
)
> >         return;
> >
> >      spin_lock(&d->event_lock);
> > diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-
> > x86/hvm/irq.h
> > index 8a43cb9..d9d4652 100644
> > --- a/xen/include/asm-x86/hvm/irq.h
> > +++ b/xen/include/asm-x86/hvm/irq.h
> > @@ -78,6 +78,7 @@ struct hvm_irq {
> >      u8 round_robin_prev_vcpu;
> >
> >      struct hvm_irq_dpci *dpci;
> > +    DECLARE_BITMAP(unmaskable_msi_vecs, 256);
> >
> >      /*
> >       * Number of wires asserting each GSI.
> > _______________________________________________
> > Xen-devel mailing list
> > Xen-devel@lists.xenproject.org
> > https://lists.xenproject.org/mailman/listinfo/xen-devel



