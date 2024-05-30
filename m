Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0798D51BF
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 20:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732949.1139008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCkUS-0001bp-MK; Thu, 30 May 2024 18:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732949.1139008; Thu, 30 May 2024 18:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCkUS-0001ZM-Ih; Thu, 30 May 2024 18:27:04 +0000
Received: by outflank-mailman (input) for mailman id 732949;
 Thu, 30 May 2024 18:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA40=NB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCkUR-0001Xj-BD
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 18:27:03 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 357c51f4-1eb2-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 20:27:02 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2e72224c395so10996641fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 11:27:02 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d89485sm32279e87.254.2024.05.30.11.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 11:27:01 -0700 (PDT)
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
X-Inumbo-ID: 357c51f4-1eb2-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717093622; x=1717698422; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JO7Vprcr74OLOAx5MFxE/wYQ+52Z1NDEYUh3yhUtyds=;
        b=XH5VEJ9QfFpXqhOkewZ9/4wWPthqri+tl4jGPaJs5I5+/FKmp3JghNcZZOaNIX2C5D
         DER0EzAPO9pIj6XSRD4V+Wb7/4HrzWVm1Q7Eppfkp83fUpICjtJj+v2HB5aqTfN4yJJ9
         vYjPaw25IINfLQlHx6bq8U9rVxRKB1hRYNIkVj5Kv5WqDbwEIPBzw4sy6vdg0O5EU7oH
         YEhdKlk4H9lus512qQt9+qJp3Lfizr+t02E7UhOLT+Cw/ObArI4/YY4PGx9rpi2WPEwS
         1SC0MUpE7lwGyiGZpesm1AJvhpUM0annCspQT+QxQ+mfH6qZoSc392XqHgJq9Il76n9m
         gcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717093622; x=1717698422;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JO7Vprcr74OLOAx5MFxE/wYQ+52Z1NDEYUh3yhUtyds=;
        b=M5/4YPjnH4R6xwbKUCPu2zE4XX4DV/pVG97pUz1d48ZYKuD40+NNIPrnD7TJHiExys
         Db6akv6x2wqPGsFM8jNB5vtKq3kEgQ36zk4DLWMJIMKCiUH/STgs1IGJwEWlo24AIqRv
         kwJWb5PwnfnnpXaooc7qATlx2tJW1nDV2GKgdB2f06z69PplTfNIxOvzgrZ3b4/itWy/
         49FBQImPMdEiIu9ZokOEAe4w78pv/rzjncclv2kYhJh9gNNknR2+0CyAFG1+63PlWo7R
         c3i+Qk8WJVRtzbQTDMX9YwGlDYzoXfFdSJaexqYwM7InAoRnZeY29sgfvNFC28ZFDtDh
         7rIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoEbBAfAbEaUQvPVmAqJvA8YROFY0ngrrTHzfEbmNe0jXq4xlhhmZsUDnVc/r+EvEPFb3DtLIH748Y/L+/zG8DuSaIF4q/lg9xQtedDGY=
X-Gm-Message-State: AOJu0Yww+6Bh67XLsQg4pArsyDk6TJ0wKYxjqOvFp28dJOXf2Ftf2f58
	6Cd9dpLf0JiKQKu6GbrxFEETlIWaiWW/pF7BPEK0dFBhdnAXowTb
X-Google-Smtp-Source: AGHT+IELFMT8Jpq+yczGXk2pdKBr0KHXOEFr2vdN1VNKLGjt4omHsnA3LtdOZyXLNztdwi/sh4PorA==
X-Received: by 2002:ac2:4c2f:0:b0:51e:2a1d:6654 with SMTP id 2adb3069b0e04-52b7d43aeefmr1648061e87.31.1717093621584;
        Thu, 30 May 2024 11:27:01 -0700 (PDT)
Message-ID: <934dbe6381e646d551e7f815aacb415e87f0210d.camel@gmail.com>
Subject: Re: [PATCH v12 7/8] xen/riscv: enable full Xen build
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Date: Thu, 30 May 2024 20:27:00 +0200
In-Reply-To: <61c227f6-9515-4bfb-932b-aa0a5d33bc66@citrix.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
	 <1cea913117f771a5f3b4404d7bfb7e1329f3f38e.1717008161.git.oleksii.kurochko@gmail.com>
	 <1ecd7a2c-b7da-4c59-8ebd-c3841d5991f8@citrix.com>
	 <2747a20d490252c279dd051c41a9b8dc69fb4c3e.camel@gmail.com>
	 <61c227f6-9515-4bfb-932b-aa0a5d33bc66@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 18:45 +0100, Andrew Cooper wrote:
> On 30/05/2024 6:12 pm, Oleksii K. wrote:
> > On Thu, 2024-05-30 at 17:48 +0100, Andrew Cooper wrote:
> > > On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> > > > diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> > > > index 8285bcffef..bda35fc347 100644
> > > > --- a/xen/arch/riscv/stubs.c
> > > > +++ b/xen/arch/riscv/stubs.c
> > > > @@ -24,12 +24,6 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t,
> > > > cpu_core_mask);
> > > > =C2=A0
> > > > =C2=A0nodemask_t __read_mostly node_online_map =3D { { [0] =3D 1UL =
} };
> > > > =C2=A0
> > > > -/*
> > > > - * max_page is defined in page_alloc.c which isn't complied
> > > > for
> > > > now.
> > > > - * definition of max_page will be remove as soon as page_alloc
> > > > is
> > > > built.
> > > > - */
> > > > -unsigned long __read_mostly max_page;
> > > > -
> > > > =C2=A0/* time.c */
> > > > =C2=A0
> > > > =C2=A0unsigned long __ro_after_init cpu_khz;=C2=A0 /* CPU clock fre=
quency
> > > > in
> > > > kHz. */
> > > > @@ -419,21 +413,3 @@ void __cpu_die(unsigned int cpu)
> > > > =C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > > =C2=A0}
> > > > -
> > > > -/*
> > > > - * The following functions are defined in common/irq.c, but
> > > > common/irq.c isn't
> > > > - * built for now. These changes will be removed there when
> > > > common/irq.c is
> > > > - * ready.
> > > > - */
> > > > -
> > > > -void cf_check irq_actor_none(struct irq_desc *desc)
> > > > -{
> > > > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > > -}
> > > > -
> > > > -unsigned int cf_check irq_startup_none(struct irq_desc *desc)
> > > > -{
> > > > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > > -
> > > > -=C2=A0=C2=A0=C2=A0 return 0;
> > > > -}
> > > All 3 of these are introduced in the previous patch and deleted
> > > again
> > > here.=C2=A0 Looks like a rebasing accident.
> > Not really.
> >=20
> > This was done to avoid build failures for RISC-V. If the HEAD is on
> > the
> > previous patch where these changes are introduced and then we just
> > drop
> > them, it will lead to a linkage error because these functions are
> > defined in common/irq.c, which isn't built for RISC-V if the HEAD
> > is on
> > the previous patch:
> > =C2=A0=C2=A0 /build/xen/arch/riscv/entry.S:86: undefined reference to
> > `max_page'
>=20
> Nothing in the series touches entry.S, so I'm not sure what this is
> complaining about.
>=20
> The stub for get_upper_mfn_bound() references max_page, but it's only
> used in a SYSCTL so you can avoid the problem with a BUG_ON().
I didn't get how I can use BUG_ON() with declaration of variable to
avoid the compilation issue the undefined reference to max_page?

>=20
> BTW, you also don't need a return after a BUG_ON().=C2=A0
> __builtin_unreachable() takes care of everything properly for you.
>=20
>=20
> > =C2=A0=C2=A0 riscv64-linux-gnu-ld: prelink.o:(.rodata+0x8): undefined
> > reference to
> > =C2=A0=C2=A0 `irq_startup_none'
> > =C2=A0=C2=A0 riscv64-linux-gnu-ld: prelink.o:(.rodata+0x10): undefined
> > reference to
> > =C2=A0=C2=A0 `irq_actor_none'
> > =C2=A0=C2=A0 riscv64-linux-gnu-ld: prelink.o:(.rodata+0x18): undefined
> > reference to
> > =C2=A0=C2=A0 `irq_actor_none'
> > =C2=A0=C2=A0 riscv64-linux-gnu-ld: prelink.o:(.rodata+0x20): undefined
> > reference to
> > =C2=A0=C2=A0 `irq_actor_none'
> > =C2=A0=C2=A0 riscv64-linux-gnu-ld: xen-syms: hidden symbol `irq_actor_n=
one'
> > isn't
> > =C2=A0=C2=A0 defined
> >=20
> > That is why these stubs were introduced in the previous patch
> > (because
> > common/irq.c isn't built at that moment) and are removed in this
> > patch
> > (since at the moment of this patch, common/irq.c is now being
> > built).
>=20
> These OTOH are a side effect of how no_irq_type works, which is
> horrifying, and not something I can unsee.
>=20
> I'll see about fixing it, because I really can't bare to leave it
> like
> this...
I am really sorry, but I don't understand should I deal with this
somehow now or the provided changes are okay?

~ Oleksii

