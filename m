Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DF66C10E4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 12:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511853.791202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDoG-0000tw-1J; Mon, 20 Mar 2023 11:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511853.791202; Mon, 20 Mar 2023 11:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDoF-0000rG-UM; Mon, 20 Mar 2023 11:36:15 +0000
Received: by outflank-mailman (input) for mailman id 511853;
 Mon, 20 Mar 2023 11:36:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufZv=7M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1peDoF-0000rA-0G
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 11:36:15 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6aa0f33f-c713-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 12:36:13 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id cy23so45313452edb.12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 04:36:12 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 u8-20020a170906b10800b008c9b44b7851sm4300717ejy.182.2023.03.20.04.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 04:36:11 -0700 (PDT)
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
X-Inumbo-ID: 6aa0f33f-c713-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312172;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/L1oYNdo0Vt5WHyjhs757KQipPoFgtDw9vfR3zr/7jI=;
        b=Eep9SOgarPAehF648KhSYJ/oCf3Ia/4ZSY7LPYtdRgoisQ7TstNu2WvARMaPLguL6n
         AJrahcUsC3V9OAXcdSZsAbypQQoAH7HiirItHRJ0Rx/2KoGEJDIVHuIzoDbfVdFWKWPU
         /UY8848ByIz9gMw8PHBgeIQzL2uATp4h+u4cG4U19FN4nW7N/MXVQ4ZlQDvuDNKLcvme
         j/lpV5LIbHJB1G+Qw9sfQ51rncM5OdnluRwVwbkJWLHBqbxW6rBjLkoUoYuwrfsAuL/k
         dV3JuxBIM16yux9Lo+2fTcDs1fMDmHC2uxEKUjw9vVojkHkPy20gwKRVPEvSqPQ/sNy2
         40fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312172;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/L1oYNdo0Vt5WHyjhs757KQipPoFgtDw9vfR3zr/7jI=;
        b=p5m/P63pEUMeFgVrmLQam+sB+Gs5BQIZ0o/zzqQdNVMjLj6tXe2af6G9hmXRrBETAp
         yYmCRMz7oQglp2o7udrzbieQCiyqv6Oh5ht0mhOo7JqyStmunPO67rxVulGQ64/jyfNq
         Co4Q8TQfVAF4qoubFkAjuvfPNH6ry6qVlF0wF2gTjyz0xWf8Sz9eWmiogi0yFyurbgxA
         BYqBv1FWXwsxoeicrz5eHh4ACZSXlIkrZC55vQDj2+QCmX037L3yQtAMDikmokkBhC21
         CIU9F/kVaFMu4yaSI2HHDgWKJpMdWKdfckdwbg3f5KsIw9+UrF/uIJviHjpozYCZGb0e
         ih+g==
X-Gm-Message-State: AO0yUKUcgffRUHL0O8qjQkoTT/LFXZdrdOxyHaJ0bV+tT/C8LxO9OuS/
	KnfCVRmiNsiXBvhpAZLf3es=
X-Google-Smtp-Source: AK7set+4Px7Z0nA2z8BfP9kL3T83lKbM3Gmu6kBG8FQKpsxG+sntFIylI4Prq5lvRoESUcnt6hoi6g==
X-Received: by 2002:a17:907:c607:b0:931:6f5b:d280 with SMTP id ud7-20020a170907c60700b009316f5bd280mr9958423ejc.17.1679312172040;
        Mon, 20 Mar 2023 04:36:12 -0700 (PDT)
Message-ID: <02a815ffe1d3839f6f82ab4d16ec8d124642617d.camel@gmail.com>
Subject: Re: [PATCH v8 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 20 Mar 2023 13:36:10 +0200
In-Reply-To: <6af7a3ea-f454-7027-590d-f883e6c2a523@suse.com>
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
	 <2afad972cd8da98dcb0ba509ba29ff239dc47cd0.1678900513.git.oleksii.kurochko@gmail.com>
	 <3bc211fa-a8f7-70ce-bfa9-5e4380776070@suse.com>
	 <99354bbeabf11e86cbf3fd46019c08fb36bf0098.camel@gmail.com>
	 <6af7a3ea-f454-7027-590d-f883e6c2a523@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-03-17 at 15:59 +0100, Jan Beulich wrote:
> On 17.03.2023 10:23, Oleksii wrote:
> > On Thu, 2023-03-16 at 12:26 +0100, Jan Beulich wrote:
> > > On 15.03.2023 18:21, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/common/bug.c
> > > > @@ -0,0 +1,108 @@
> > > > +#include <xen/bug.h>
> > > > +#include <xen/debugger.h>
> > > > +#include <xen/errno.h>
> > > > +#include <xen/kernel.h>
> > > > +#include <xen/livepatch.h>
> > > > +#include <xen/string.h>
> > > > +#include <xen/types.h>
> > > > +#include <xen/virtual_region.h>
> > > > +
> > > > +#include <asm/processor.h>
> > >=20
> > > I actually meant to also ask: What is this needed for? Glancing
> > > over
> > > the
> > > code ...
> > >=20
> > > > +/*
> > > > + * Returns a negative value in case of an error otherwise
> > > > + * BUGFRAME_{run_fn, warn, bug, assert}
> > > > + */
> > > > +int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 const struct bug_frame *bug =3D NULL;
> > > > +=C2=A0=C2=A0=C2=A0 const struct virtual_region *region;
> > > > +=C2=A0=C2=A0=C2=A0 const char *prefix =3D "", *filename, *predicat=
e;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long fixup;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int id, lineno;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 region =3D find_text_region(pc);
> > > > +=C2=A0=C2=A0=C2=A0 if ( !region )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 for ( id =3D 0; id < BUGFRAME_NR; id++ )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct bug_frame =
*b;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t i;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( i =3D 0, b =3D re=
gion->frame[id].bugs;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 i < region->frame[id].n_bugs; b++, i++ )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if ( bug_loc(b) =3D=3D pc )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bug =3D b;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 goto found;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > + found:
> > > > +=C2=A0=C2=A0=C2=A0 if ( !bug )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOENT;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( id =3D=3D BUGFRAME_run_fn )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(struct cpu_u=
ser_regs *) =3D bug_ptr(bug);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn(regs);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Re-enforce consisten=
t types, because of the casts
> > > > involved. */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( false )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 run_in_exception_handler(fn);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return id;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /* WARN, BUG or ASSERT: decode the filename poi=
nter and
> > > > line
> > > > number. */
> > > > +=C2=A0=C2=A0=C2=A0 filename =3D bug_ptr(bug);
> > > > +=C2=A0=C2=A0=C2=A0 if ( !is_kernel(filename) && !is_patch(filename=
) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > +=C2=A0=C2=A0=C2=A0 fixup =3D strlen(filename);
> > > > +=C2=A0=C2=A0=C2=A0 if ( fixup > 50 )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 filename +=3D fixup - 4=
7;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefix =3D "...";
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0 lineno =3D bug_line(bug);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 switch ( id )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_warn:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Xen WARN at %s%=
s:%d\n", prefix, filename,
> > > > lineno);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(re=
gs);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_bug:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Xen BUG at %s%s=
:%d\n", prefix, filename,
> > > > lineno);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( BUG_DEBUGGER_TRAP_=
FATAL(regs) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 break;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(re=
gs);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Xen BUG at %s%s:=
%d\n", prefix, filename,
> > > > lineno);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_assert:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ASSERT: decode the p=
redicate string pointer. */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 predicate =3D bug_msg(b=
ug);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !is_kernel(predica=
te) && !is_patch(predicate) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 predicate =3D "<unknown>";
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Assertion '%s' =
failed at %s%s:%d\n",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 predicate, prefix, filename, lineno);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( BUG_DEBUGGER_TRAP_=
FATAL(regs) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 break;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(re=
gs);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Assertion '%s' f=
ailed at %s%s:%d\n",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 predicate, prefix, filename, lineno);
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return id;
> > > > +}
> > >=20
> > > ... I can't really spot what it might be that comes from that
> > > header.
> > > Oh, on the N+1st run I've spotted it - it's
> > > show_execution_state().
> > > The declaration of which, already being used from common code
> > > ahead
> > > of this series, should imo be moved to a common header. I guess
> > > I'll
> > > make yet another patch ...
> > As mentioned above. Not only show_execution_state() but also
> > cpu_user_regs structure. ( at lest, for ARM & RISCV )
>=20
> Do we deref "regs" anywhere? I can't seem to be able to spot an
> instance.
> Without a deref (or alike) a forward decl is all that's needed for
> this
> code to compile.
You are there is no a deref so let's swich to a forward decl.

I'll add it to a new version of the patch series.

~ Oleksii


