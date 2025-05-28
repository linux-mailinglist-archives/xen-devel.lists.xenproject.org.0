Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02418AC72AA
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 23:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999571.1380210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKO9e-0003ya-VA; Wed, 28 May 2025 21:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999571.1380210; Wed, 28 May 2025 21:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKO9e-0003wq-SX; Wed, 28 May 2025 21:17:42 +0000
Received: by outflank-mailman (input) for mailman id 999571;
 Wed, 28 May 2025 21:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ql61=YM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uKO9d-0003wk-Fn
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 21:17:41 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f6541a0-3c09-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 23:17:40 +0200 (CEST)
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
X-Inumbo-ID: 2f6541a0-3c09-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748467058; x=1748726258;
	bh=ErLwzxBQTVyhRVaY+zSrGgzb0yQIjH/IbyQk7822lpQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=jx3bDu99x5SbC2Nrqya8eEeb/8JHK35/mETXnb5OC7Yd4tLTGaGzIJ7TZHqgc6Ldx
	 4X+wKugsQ9F4CpR778NnpDLqqZ7/R4aHgnNXbxHrCy2q3RdgSE4whiXvZSJK15Ww8g
	 ZnH9gcSD9AN8IimQ/Gc4xRUKla+xYUVeENJeJG53Fbj1vM+POZDc+gHwJvB/V0fm34
	 RXUaCLO+F12pY5ICmLBLsbmBoavmdFsrwcb2/Wlx2v4GNjY/N6glMhNTn2OAz2sbJS
	 F0zWUu6FZ0QRQwHYwvdRtxF8/T0DbFIpTDZCxoO6m205Xp361+ZtQ/3CdJ4WtGAX0f
	 Po7UEuaMFuhxw==
Date: Wed, 28 May 2025 21:17:33 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v2 1/2] xen/domain: introduce non-x86 hardware emulation flags
Message-ID: <aDd9Z3eY3RQgTTdy@kraken>
In-Reply-To: <aC3dkKyiIHRF8YO1@macbook.local>
References: <20250516022855.1146121-1-dmukhin@ford.com> <20250516022855.1146121-2-dmukhin@ford.com> <aC3dkKyiIHRF8YO1@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9b1149ee8da47a38f89914f1a9e437722ee6e8be
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 04:05:04PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 16, 2025 at 02:29:09AM +0000, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Define per-architecture emulation_flags for configuring domain emulatio=
n
> > features.
> >
> > Print d->arch.emulation_flags from 'q' keyhandler for better traceabili=
ty
> > while debugging.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v1:
> > - dropped comments
> > ---
> >  xen/arch/arm/include/asm/domain.h   | 1 +
> >  xen/arch/ppc/include/asm/domain.h   | 1 +
> >  xen/arch/riscv/include/asm/domain.h | 1 +
> >  xen/common/keyhandler.c             | 1 +
> >  4 files changed, 4 insertions(+)
> >
> > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/a=
sm/domain.h
> > index a3487ca713..70e6e7d49b 100644
> > --- a/xen/arch/arm/include/asm/domain.h
> > +++ b/xen/arch/arm/include/asm/domain.h
> > @@ -121,6 +121,7 @@ struct arch_domain
> >      void *tee;
> >  #endif
> >
> > +    uint32_t emulation_flags;
> >  }  __cacheline_aligned;
> >
> >  struct arch_vcpu
> > diff --git a/xen/arch/ppc/include/asm/domain.h b/xen/arch/ppc/include/a=
sm/domain.h
> > index 3a447272c6..001116a0ab 100644
> > --- a/xen/arch/ppc/include/asm/domain.h
> > +++ b/xen/arch/ppc/include/asm/domain.h
> > @@ -21,6 +21,7 @@ struct arch_vcpu {
> >
> >  struct arch_domain {
> >      struct hvm_domain hvm;
> > +    uint32_t emulation_flags;
> >  };
> >
> >  #include <xen/sched.h>
> > diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/inclu=
de/asm/domain.h
> > index c3d965a559..7bc242da55 100644
> > --- a/xen/arch/riscv/include/asm/domain.h
> > +++ b/xen/arch/riscv/include/asm/domain.h
> > @@ -18,6 +18,7 @@ struct arch_vcpu {
> >
> >  struct arch_domain {
> >      struct hvm_domain hvm;
> > +    uint32_t emulation_flags;
> >  };
> >
> >  #include <xen/sched.h>
> > diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> > index 0bb842ec00..73f5134b68 100644
> > --- a/xen/common/keyhandler.c
> > +++ b/xen/common/keyhandler.c
> > @@ -306,6 +306,7 @@ static void cf_check dump_domains(unsigned char key=
)
> >              if ( test_bit(i, &d->watchdog_inuse_map) )
> >                  printk("    watchdog %d expires in %d seconds\n",
> >                         i, (u32)((d->watchdog_timer[i].expires - NOW())=
 >> 30));
> > +        printk("    emulation_flags %#x\n", d->arch.emulation_flags);
> >
> >          arch_dump_domain_info(d);
>=20
> Hello,
>=20
> I think it might be easier to print emulation_flags in
> arch_dump_domain_info(), ideally it would be helpful if this could be
> printed in a user friendly way apart from the raw dump:
>=20
> printk("    emulation_flags:%s%s... (%#x)\n",
>        !d->arch.emulation_flags ? " none" : "",
>        has_vlapic(d) ? " lapic" : "", ...
>        d->arch.emulation_flags);

I moved emulation_flags to the common domain struct in v3 and I kept the
emulation_flags flags printout here in common dump_domains().

I will plumb the human-readable printout for x86 flags in the follow on pat=
ch.

>=20
> Regards, Roger.


