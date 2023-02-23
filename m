Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775276A0857
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 13:15:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500295.771598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAV4-00033m-Ns; Thu, 23 Feb 2023 12:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500295.771598; Thu, 23 Feb 2023 12:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAV4-000325-Kq; Thu, 23 Feb 2023 12:15:02 +0000
Received: by outflank-mailman (input) for mailman id 500295;
 Thu, 23 Feb 2023 12:15:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxRn=6T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVAV3-00031z-07
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 12:15:01 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b08f9b7e-b373-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 13:14:58 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id s22so13433340lfi.9
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 04:14:58 -0800 (PST)
Received: from [192.168.8.199] (46.204.108.92.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.92]) by smtp.gmail.com with ESMTPSA id
 x4-20020ac25dc4000000b004d85dab237csm332827lfq.39.2023.02.23.04.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:14:56 -0800 (PST)
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
X-Inumbo-ID: b08f9b7e-b373-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q03nZdHcaZyS2SEQ16TanMUwzIqCvS8HZ7BWBitUm6E=;
        b=aylN1ZXpePcTLK4McLPR7XJ8BPPuqMombWZ4sqHhfMfIdPFSGw8Gh3cFKX3uVs1as6
         VsVWDagPFIuvTWG9T5ALnjNmKZgVN6ysiaYcdE6XISXDhyZq35RbZmhe5TpTjJSr2tUM
         ynFynEqx4eqcOuuKqsUKaWEoy+pXGHkWNHAHWnKp+eWv6EKFhwHJ1TM8FCalyVOT9L+F
         6KOrw3U5YlYIcXGD6dbi1mYuJgELssSnKDE0BMu7FQQfwkqcU8LdBFB9rh4A+60bwRrZ
         qwUMlG4V+ugx0/IKatTZoHAc3+Lx/wKvdYg0xLP10+ZlgalKTkkj0mGCHP+0qCnTGCwU
         qyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q03nZdHcaZyS2SEQ16TanMUwzIqCvS8HZ7BWBitUm6E=;
        b=P180WSyDNCmIdGje5Qxh63YKI9CxDs7Q8Ldroe3ngp0UmVBkpBvxsHvDe2yFs2VAyv
         bxdJaxK28ECN20QxYYIONSsCm9BuRe+W6vC/cQyP+n4mGo3aXU58PoCmJpzF2VXrCgGd
         1cszUgzvCCIwX9wnq2Pz9HjeLduj9SDC+MMzbSZwQncPD5duRZrMsC+DJKocaM4L9SnM
         ebNE6YHKi5eanSdFNrSvpqjfhYWqvtK0LEbo/OONaIgln6RldSqtkF1PHByob6C/wdbt
         fb6HWwcSUk1fF8pkUg/6PKtM9HO97Qxbfun6N4IYOXX+SytVNl4yiWevjr5Iyd5u1200
         RHqg==
X-Gm-Message-State: AO0yUKUUNooX6/+H+B5r7lLMVSqX8nmLe9fmD4WrxNV1p5ptZdl185vN
	pRSYlow8CQ/kUSsK62xSH60=
X-Google-Smtp-Source: AK7set9gPkBBgzemR7sKu4vScrAFaggZ+MaDyTYSQ7rtDb6n5jJ+QhJBSdBHLwD4R63GX6Q/9b8lfg==
X-Received: by 2002:a05:6512:25b:b0:4cb:449a:31f8 with SMTP id b27-20020a056512025b00b004cb449a31f8mr4102416lfo.35.1677154497504;
        Thu, 23 Feb 2023 04:14:57 -0800 (PST)
Message-ID: <85dc03958db37c8edd8c3894f1d99816a4ed2efe.camel@gmail.com>
Subject: Re: [PATCH v2 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Date: Thu, 23 Feb 2023 14:14:54 +0200
In-Reply-To: <d3764453-8a11-416c-e97b-eaaf0a305e67@suse.com>
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
	 <aa0d3704921f5ec04b66c8aa935638a64018c50b.1676909088.git.oleksii.kurochko@gmail.com>
	 <214973b0-5fe7-9208-2cfc-dd2884583157@suse.com>
	 <f28da3fa9266f32664280326dca610c67a733195.camel@gmail.com>
	 <d3764453-8a11-416c-e97b-eaaf0a305e67@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-02-23 at 11:11 +0100, Jan Beulich wrote:
> On 22.02.2023 17:16, Oleksii wrote:
> > On Wed, 2023-02-22 at 13:46 +0100, Jan Beulich wrote:
> > > On 20.02.2023 17:40, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/common/bug.c
> > > > @@ -0,0 +1,113 @@
> > > > +#include <xen/bug.h>
> > > > +#include <xen/errno.h>
> > > > +#include <xen/kernel.h>
> > > > +#include <xen/livepatch.h>
> > > > +#include <xen/string.h>
> > > > +#include <xen/types.h>
> > > > +#include <xen/virtual_region.h>
> > > > +
> > > > +#include <asm/processor.h>
> > >=20
> > > Is this really needed here?
> > Yes, it is.
> >=20
> > Function show_execution_state() is declared in this header for all
> > architectures and is used by handle_bug_frame().
>=20
> Ugly, but yes, you're right.
>=20
> > > > +const struct bug_frame* find_bug_frame(unsigned long pc,
> > > > unsigned
> > > > int *id)
> > >=20
> > > Is this function going to be needed outside of this CU? IOW why
> > > is it
> > > not
> > > static?
> > >=20
> > It's not static because there is not possible to use do_bug_frame()
> > as
> > is for x86 as x86 has some additional checks for some cases which
> > aren't in generic implementation:
> > [1]
> > https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch=
/x86/traps.c#L1217
> > [2]
> > https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch=
/x86/traps.c#L1238
> > [3]
> > https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch=
/x86/traps.c#L1259
> >=20
> > Probably to make generic do_bug_frame() more re-usable for x86 we
> > can
> > implement as stubs fixup_exception_return() and
> > debugger_trap_fatal()
> > under #ifndef X86 ... #endif inside common/bug.c.
> >=20
> > Could you please share your thoughts about that?
>=20
> Isn't all that's needed a suitable return value from the function,
> for the caller to take appropriate further action? (Maybe even that
> isn't really necessary.)
>=20
> That said, debugger_trap_fatal() imo may sensibly be generalized,
> and hence could be left in common code. Arm may simply stub this to
> nothing then for the time being.
I checked the source code I found that debugger_trap_fatal() is
generalized:
https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/include/=
xen/debugger.h
So we can use in generic version of do_bug_frame().

About fixup_exception_return() you are right as we can it handle(call)
by the caller so it's needed only to return a suitable return value for
do_bug_frame().

>=20
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 const char *prefix =3D "", *filename, *predicat=
e;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long fixup;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int lineno;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( id =3D=3D BUGFRAME_run_fn )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +#ifdef ARM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > >=20
> > > Who or what defines ARM? Anyway, seeing ...
> > it is defined by default in Kconfig:
> > https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch=
/arm/Kconfig#L13
>=20
> That'll be CONFIG_ARM then in uses in C code.
Ahh, yeah. I am always missing CONFIG_...
>=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(const struct=
 cpu_user_regs *) =3D (void
> > > > *)regs-
> > > > > BUG_FN_REG;
> > >=20
> > > ... this, wouldn't it be better (and independent of the specific
> > > arch) if
> > > you checked for BUG_FN_REG being defined?
> > If I understand Kconfig correctly than there is no significant
> > difference what check. But probably BUG_FN_REG would be a little
> > bit
> > better if someone will decide to change a way how pointer to
> > function
> > will be passed in case of ARM than we will get compilation error
> > and so
> > won't miss to fix the line in do_bug_frame().
>=20
> Indeed - #ifdef like this one generally want to check for the precise
> aspect in question, without making assumptions about something
> implying
> something else. (Pretty certainly there are exceptions to this rule,
> but it holds here.)
Thanks for the explanation.
>=20
> > > > +=C2=A0=C2=A0=C2=A0 ".p2align
> > > > 2\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0
> > > > ".Lfrm%=3D:\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 ".long (.Lbug%=3D - .Lfrm%=3D) +
> > > > %"MODIFIER"[bf_line_hi]\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 ".long (%"MODIFIER"[bf_ptr] - .Lfrm%=3D) +
> > > > %"MODIFIER"[bf_line_lo]\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 ".if " #second_frame
> > > > "\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 ".long 0, %"MODIFIER"[bf_msg] -
> > > > .Lfrm%=3D\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0
> > > > ".endif\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 ".popsection\n"
> > >=20
> > > I think I said so in reply to an earlier version already: The
> > > moment
> > > assembly code moves to a common header, it should be adjusted to
> > > be
> > > as
> > > portable as possible. In particular directives should never start
> > > at
> > > the
> > > beginning of a line, while labels always should. (Whether .long
> > > is
> > > actually portable is another question, which I'll be happy to
> > > leave
> > > aside for now.)
> > I am not sure that I understand about which one directive we are
> > talking about... Are we talking about .{push/pop}section and
> > .p2align?
> > Probably you can show me an example in Xen or other project?
>=20
> I'm talking about all directives here. Fundamentally assembly
> language
> source lines are like this (assuming colons follow labels):
>=20
> [<label>:|<blank>][<directive>|<insn>]
>=20
> Both parts can optionally be empty, but if the right one isn't, then
> the left one also shouldn't be (and hence minimally a blank is
> needed;
> commonly it would be a tab). Directives, unlike insns, start with a
> dot in most dialects. Labels can also start with a dot, but are
> disambiguated by the colon after them (yet more strict placement of
> items is therefore required when labels are not followed by colons -
> there are such dialects -, which is why it is generally a good idea
> to follow that simple formatting rule). Also, ftaod,
> - <insn> covers both actual insns as well as assembler macro
> =C2=A0 invocations,
> - there can of course be multiple labels on a single line (iirc this
> =C2=A0 requires that colons follow labels).
>=20
> As to examples: I'm afraid I'm unaware of arch-independent assembly
> code anywhere in Xen so far.
Thank you very much for the explanation.=20
>=20
> Jan
~ Oleksii


