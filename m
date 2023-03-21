Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBD46C301E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512348.792323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pea0h-0004jM-L2; Tue, 21 Mar 2023 11:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512348.792323; Tue, 21 Mar 2023 11:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pea0h-0004gg-H4; Tue, 21 Mar 2023 11:18:35 +0000
Received: by outflank-mailman (input) for mailman id 512348;
 Tue, 21 Mar 2023 11:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mk2b=7N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pea0g-00047q-4h
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:18:34 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ceb7eb7-c7da-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 12:18:32 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id cy23so58066180edb.12
 for <xen-devel@lists.xenproject.org>; Tue, 21 Mar 2023 04:18:32 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 by22-20020a170906a2d600b008cecb8f374asm5634295ejb.0.2023.03.21.04.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 04:18:31 -0700 (PDT)
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
X-Inumbo-ID: 1ceb7eb7-c7da-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679397511;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eANDa77IRrpaj+pRw4c324GGJgMmDsa6GxlgKh791i8=;
        b=O9sCvIBin8n+4MuFFuoclBoI93u8Y0wXDcm8b3tlNmn7Yl8vvKYBQJqw0EvECoAqyM
         AyGjqx64XRcpgUzf+cRAeUGnjSMAjnr0rWzOPpox2+dQRFdDqm+BRSa7NB2Qoj3n/2DJ
         ONZvWxp+I9IsA2nteL1aJbyGZRzzov0Lmd8e4uX0jkpGM4FSK/77v4Crjnfr7SJ4lzzY
         Ao+uMC6I+7I3evUiTy8bkD9imY4sHYbPv61mcZZ/IpacQ5YhVNb2e3t6cR/vwZmidwwm
         fw/U3JTVcV2MXBL90tSg1wkq6Z1GJG0yLqRH3V8POLhUhUmGP7SCt0F9deW90XocUrdC
         cnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679397511;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eANDa77IRrpaj+pRw4c324GGJgMmDsa6GxlgKh791i8=;
        b=mBEus0bY0hES4Utxn325wPWSVyWrI0JyMU028F7wLdNDblAzW+dCcgg8ZWYfQjYOL6
         enEAMOJpL1n6gCX4iZD4tW+eWVUAzGTQ6mEb7kkCPa3VeHyzzPYv9oAqFMWplS/9SQLx
         AjoV1Bs1LeD7c3x+/iiWUkXw00OF6TWxGbNIUBot7xwnYe/Fr9w1JApzut5sBkQ+yHyk
         6Wakj07DEkES31qDdgua+La8tkxxOvuqs4e0SYA24vSEc62SyMkjRRpdJECzzO2LoZfC
         bHdnw7muovEI3F7o2Qw4GYEY8aPvOurypiMQpBlk6e1HZxC+aMQdObGu5hAeLhVwaGLD
         827A==
X-Gm-Message-State: AO0yUKUQFR3E93uQCRgq17549lWQVstSFwfGGe9KtMEpOsyu+Gqdmyzu
	JuH9DmrEWZYBIS94OOqx2xg=
X-Google-Smtp-Source: AK7set9/Ib+nLdk6+HFwWeKHgFS843kSWpYoAxzHi9V1w76OVbgUHifVTFT60eYDgASvpncK/9YAGg==
X-Received: by 2002:a17:906:d54f:b0:8e9:afb1:65c6 with SMTP id cr15-20020a170906d54f00b008e9afb165c6mr15281514ejc.13.1679397511557;
        Tue, 21 Mar 2023 04:18:31 -0700 (PDT)
Message-ID: <390dd04d369fad707fd786ed37992ec27a63b7cf.camel@gmail.com>
Subject: Re: [PATCH v8 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 21 Mar 2023 13:18:29 +0200
In-Reply-To: <02a815ffe1d3839f6f82ab4d16ec8d124642617d.camel@gmail.com>
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
	 <2afad972cd8da98dcb0ba509ba29ff239dc47cd0.1678900513.git.oleksii.kurochko@gmail.com>
	 <3bc211fa-a8f7-70ce-bfa9-5e4380776070@suse.com>
	 <99354bbeabf11e86cbf3fd46019c08fb36bf0098.camel@gmail.com>
	 <6af7a3ea-f454-7027-590d-f883e6c2a523@suse.com>
	 <02a815ffe1d3839f6f82ab4d16ec8d124642617d.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-03-20 at 13:36 +0200, Oleksii wrote:
> On Fri, 2023-03-17 at 15:59 +0100, Jan Beulich wrote:
> > On 17.03.2023 10:23, Oleksii wrote:
> > > On Thu, 2023-03-16 at 12:26 +0100, Jan Beulich wrote:
> > > > On 15.03.2023 18:21, Oleksii Kurochko wrote:
> > > > > --- /dev/null
> > > > > +++ b/xen/common/bug.c
> > > > > @@ -0,0 +1,108 @@
> > > > > +#include <xen/bug.h>
> > > > > +#include <xen/debugger.h>
> > > > > +#include <xen/errno.h>
> > > > > +#include <xen/kernel.h>
> > > > > +#include <xen/livepatch.h>
> > > > > +#include <xen/string.h>
> > > > > +#include <xen/types.h>
> > > > > +#include <xen/virtual_region.h>
> > > > > +
> > > > > +#include <asm/processor.h>
> > > >=20
> > > > I actually meant to also ask: What is this needed for? Glancing
> > > > over
> > > > the
> > > > code ...
> > > >=20
> > > > > +/*
> > > > > + * Returns a negative value in case of an error otherwise
> > > > > + * BUGFRAME_{run_fn, warn, bug, assert}
> > > > > + */
> > > > > +int do_bug_frame(struct cpu_user_regs *regs, unsigned long
> > > > > pc)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 const struct bug_frame *bug =3D NULL;
> > > > > +=C2=A0=C2=A0=C2=A0 const struct virtual_region *region;
> > > > > +=C2=A0=C2=A0=C2=A0 const char *prefix =3D "", *filename, *predic=
ate;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long fixup;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned int id, lineno;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 region =3D find_text_region(pc);
> > > > > +=C2=A0=C2=A0=C2=A0 if ( !region )
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 for ( id =3D 0; id < BUGFRAME_NR; id++ )
> > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct bug_fram=
e *b;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t i;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( i =3D 0, b =3D =
region->frame[id].bugs;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 i < region->frame[id].n_bugs; b++, i++ )
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if ( bug_loc(b) =3D=3D pc )
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 bug =3D b;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto found;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > + found:
> > > > > +=C2=A0=C2=A0=C2=A0 if ( !bug )
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOENT;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 if ( id =3D=3D BUGFRAME_run_fn )
> > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(struct cpu=
_user_regs *) =3D bug_ptr(bug);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn(regs);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Re-enforce consist=
ent types, because of the casts
> > > > > involved. */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( false )
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 run_in_exception_handler(fn);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return id;
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 /* WARN, BUG or ASSERT: decode the filename p=
ointer and
> > > > > line
> > > > > number. */
> > > > > +=C2=A0=C2=A0=C2=A0 filename =3D bug_ptr(bug);
> > > > > +=C2=A0=C2=A0=C2=A0 if ( !is_kernel(filename) && !is_patch(filena=
me) )
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > > +=C2=A0=C2=A0=C2=A0 fixup =3D strlen(filename);
> > > > > +=C2=A0=C2=A0=C2=A0 if ( fixup > 50 )
> > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 filename +=3D fixup -=
 47;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefix =3D "...";
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0 lineno =3D bug_line(bug);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 switch ( id )
> > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_warn:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Xen WARN at %=
s%s:%d\n", prefix, filename,
> > > > > lineno);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(=
regs);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_bug:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Xen BUG at %s=
%s:%d\n", prefix, filename,
> > > > > lineno);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( BUG_DEBUGGER_TRA=
P_FATAL(regs) )
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(=
regs);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Xen BUG at %s%=
s:%d\n", prefix, filename,
> > > > > lineno);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_assert:
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ASSERT: decode the=
 predicate string pointer. */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 predicate =3D bug_msg=
(bug);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !is_kernel(predi=
cate) && !is_patch(predicate) )
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 predicate =3D "<unknown>";
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Assertion '%s=
' failed at %s%s:%d\n",
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 predicate, prefix, filename, lineno);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( BUG_DEBUGGER_TRA=
P_FATAL(regs) )
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(=
regs);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Assertion '%s'=
 failed at %s%s:%d\n",
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 predicate, prefix, filename, lineno);
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 return id;
> > > > > +}
> > > >=20
> > > > ... I can't really spot what it might be that comes from that
> > > > header.
> > > > Oh, on the N+1st run I've spotted it - it's
> > > > show_execution_state().
> > > > The declaration of which, already being used from common code
> > > > ahead
> > > > of this series, should imo be moved to a common header. I guess
> > > > I'll
> > > > make yet another patch ...
> > > As mentioned above. Not only show_execution_state() but also
> > > cpu_user_regs structure. ( at lest, for ARM & RISCV )
> >=20
> > Do we deref "regs" anywhere? I can't seem to be able to spot an
> > instance.
> > Without a deref (or alike) a forward decl is all that's needed for
> > this
> > code to compile.
> You are there is no a deref so let's swich to a forward decl.
>=20
> I'll add it to a new version of the patch series.
I just realized that show_execution_state() is declared in
<asm/processor.h>.

So we have to leave an inclusion of the header or declare the function
explicitly.

~ Oleksii


