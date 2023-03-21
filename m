Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2646C349F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512764.792954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedEI-0004gZ-1T; Tue, 21 Mar 2023 14:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512764.792954; Tue, 21 Mar 2023 14:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedEH-0004ea-TT; Tue, 21 Mar 2023 14:44:49 +0000
Received: by outflank-mailman (input) for mailman id 512764;
 Tue, 21 Mar 2023 14:44:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mk2b=7N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pedEF-0004eU-UD
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:44:47 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec1f4cca-c7f6-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:44:45 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id x3so60587639edb.10
 for <xen-devel@lists.xenproject.org>; Tue, 21 Mar 2023 07:44:45 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 k12-20020a50ce4c000000b004af70c546dasm6399342edj.87.2023.03.21.07.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 07:44:44 -0700 (PDT)
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
X-Inumbo-ID: ec1f4cca-c7f6-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679409885;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o0eKAm3w+MLMO2xDlQnRXgMFej2WGE/ICARDnwgXa7c=;
        b=oQJbWYsPId/o0jWqV5SRbUS/UveX7E4rAXBbzlKb6A9Cn1JKLVwMbFqidO5T4lW97Q
         7hP1w9Mi0hH2Cr+Qd+g8wHiNR6Uv8w7PKUnblq6pimHeqWS2Xkw45W4MOTTWkSXHYuPZ
         M/7zeoz1Hqxv5SWugBC6Wli7k8yPDXoUcIwPD0/pVZWpHi0YK/ltSvl+o4Zrs2Qlql2u
         SQa00Q3OvXoJxhkUi+6ggGrdfOFGgw9WL9GkS7ELD/3w0R3J+9LO/ZrV02x8B8Beu8vO
         AhTAqW2thom4p+rPgdVdHx6CSNZPIaznG7TQOoBi9dTlixdCsxqcnoeMuGIe0F1JJplr
         hgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679409885;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0eKAm3w+MLMO2xDlQnRXgMFej2WGE/ICARDnwgXa7c=;
        b=F0wrWYW4Nd6vwupyk67dpULNkjvSJhcADZU4Z2TdWAy9z4IU/r9WCLej9Mby7GmrkT
         xwoK+5env1yJy2NuHcqsWE8CuRvdm6lipZQizbP2V0LIf9XrGMhP+gOhx33GGT00YBUC
         Zd1coZA3B/vMqc1cIlvDrlpdIXdbi97I1JZW+zGsa0V5NeTRcCdEJn1BxshB7hLqNrYi
         ms6MRBybKaX+/j5FucP2mzEeZYQ4KevBLZ8bS59HTurpN+OAsjaP1EGYheeBbMZLhU0y
         M9yfTkg7gpVRMTry5aBq452SOhFTaq9UJ+5XySCg734skLakbceQM3/Ca6Kh3sYTAwEp
         zkRA==
X-Gm-Message-State: AO0yUKUWYi00EwGgPXzK4bUts1vjQrSCWfewAyMaA6rDlREaZwh+gf6T
	KRxGSQ2f6NZoCOhQB/x7zho=
X-Google-Smtp-Source: AK7set9f61HcPFlCMHkDuP9JxsiemFJF4/KHd8NhfnPy8N/krM62MWw4Tm4t92h/AFmqReFDkKpcwQ==
X-Received: by 2002:aa7:ce09:0:b0:4ad:1e35:771f with SMTP id d9-20020aa7ce09000000b004ad1e35771fmr3939981edv.35.1679409885174;
        Tue, 21 Mar 2023 07:44:45 -0700 (PDT)
Message-ID: <f06280271a75c8d52202b8dc621e07178986e065.camel@gmail.com>
Subject: Re: [PATCH v8 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 21 Mar 2023 16:44:43 +0200
In-Reply-To: <7ebd7064-8ebd-a072-fc2e-2629cc99f7eb@suse.com>
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
	 <2afad972cd8da98dcb0ba509ba29ff239dc47cd0.1678900513.git.oleksii.kurochko@gmail.com>
	 <3bc211fa-a8f7-70ce-bfa9-5e4380776070@suse.com>
	 <99354bbeabf11e86cbf3fd46019c08fb36bf0098.camel@gmail.com>
	 <6af7a3ea-f454-7027-590d-f883e6c2a523@suse.com>
	 <02a815ffe1d3839f6f82ab4d16ec8d124642617d.camel@gmail.com>
	 <390dd04d369fad707fd786ed37992ec27a63b7cf.camel@gmail.com>
	 <7ebd7064-8ebd-a072-fc2e-2629cc99f7eb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-03-21 at 14:35 +0100, Jan Beulich wrote:
> On 21.03.2023 12:18, Oleksii wrote:
> > On Mon, 2023-03-20 at 13:36 +0200, Oleksii wrote:
> > > On Fri, 2023-03-17 at 15:59 +0100, Jan Beulich wrote:
> > > > On 17.03.2023 10:23, Oleksii wrote:
> > > > > On Thu, 2023-03-16 at 12:26 +0100, Jan Beulich wrote:
> > > > > > On 15.03.2023 18:21, Oleksii Kurochko wrote:
> > > > > > > --- /dev/null
> > > > > > > +++ b/xen/common/bug.c
> > > > > > > @@ -0,0 +1,108 @@
> > > > > > > +#include <xen/bug.h>
> > > > > > > +#include <xen/debugger.h>
> > > > > > > +#include <xen/errno.h>
> > > > > > > +#include <xen/kernel.h>
> > > > > > > +#include <xen/livepatch.h>
> > > > > > > +#include <xen/string.h>
> > > > > > > +#include <xen/types.h>
> > > > > > > +#include <xen/virtual_region.h>
> > > > > > > +
> > > > > > > +#include <asm/processor.h>
> > > > > >=20
> > > > > > I actually meant to also ask: What is this needed for?
> > > > > > Glancing
> > > > > > over
> > > > > > the
> > > > > > code ...
> > > > > >=20
> > > > > > > +/*
> > > > > > > + * Returns a negative value in case of an error
> > > > > > > otherwise
> > > > > > > + * BUGFRAME_{run_fn, warn, bug, assert}
> > > > > > > + */
> > > > > > > +int do_bug_frame(struct cpu_user_regs *regs, unsigned
> > > > > > > long
> > > > > > > pc)
> > > > > > > +{
> > > > > > > +=C2=A0=C2=A0=C2=A0 const struct bug_frame *bug =3D NULL;
> > > > > > > +=C2=A0=C2=A0=C2=A0 const struct virtual_region *region;
> > > > > > > +=C2=A0=C2=A0=C2=A0 const char *prefix =3D "", *filename, *pr=
edicate;
> > > > > > > +=C2=A0=C2=A0=C2=A0 unsigned long fixup;
> > > > > > > +=C2=A0=C2=A0=C2=A0 unsigned int id, lineno;
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0 region =3D find_text_region(pc);
> > > > > > > +=C2=A0=C2=A0=C2=A0 if ( !region )
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0 for ( id =3D 0; id < BUGFRAME_NR; id++ )
> > > > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct bug_=
frame *b;
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t i;
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( i =3D 0, b =
=3D region->frame[id].bugs;
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 i < region->frame[id].n_bugs; b++, i++ )
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if ( bug_loc(b) =3D=3D pc )
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 {
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bug =3D b;
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto found;
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > > > +
> > > > > > > + found:
> > > > > > > +=C2=A0=C2=A0=C2=A0 if ( !bug )
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOENT;
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0 if ( id =3D=3D BUGFRAME_run_fn )
> > > > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(struct=
 cpu_user_regs *) =3D
> > > > > > > bug_ptr(bug);
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn(regs);
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Re-enforce con=
sistent types, because of the
> > > > > > > casts
> > > > > > > involved. */
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( false )
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 run_in_exception_handler(fn);
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return id;
> > > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0 /* WARN, BUG or ASSERT: decode the filena=
me pointer
> > > > > > > and
> > > > > > > line
> > > > > > > number. */
> > > > > > > +=C2=A0=C2=A0=C2=A0 filename =3D bug_ptr(bug);
> > > > > > > +=C2=A0=C2=A0=C2=A0 if ( !is_kernel(filename) && !is_patch(fi=
lename) )
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > > > > +=C2=A0=C2=A0=C2=A0 fixup =3D strlen(filename);
> > > > > > > +=C2=A0=C2=A0=C2=A0 if ( fixup > 50 )
> > > > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 filename +=3D fix=
up - 47;
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefix =3D "...";
> > > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > > > +=C2=A0=C2=A0=C2=A0 lineno =3D bug_line(bug);
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0 switch ( id )
> > > > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > > > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_warn:
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Xen WARN =
at %s%s:%d\n", prefix,
> > > > > > > filename,
> > > > > > > lineno);
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_st=
ate(regs);
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_bug:
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Xen BUG a=
t %s%s:%d\n", prefix, filename,
> > > > > > > lineno);
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( BUG_DEBUGGER=
_TRAP_FATAL(regs) )
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 break;
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_st=
ate(regs);
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Xen BUG at=
 %s%s:%d\n", prefix, filename,
> > > > > > > lineno);
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_assert:
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ASSERT: decode=
 the predicate string pointer.
> > > > > > > */
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 predicate =3D bug=
_msg(bug);
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !is_kernel(p=
redicate) &&
> > > > > > > !is_patch(predicate) )
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 predicate =3D "<unknown>";
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Assertion=
 '%s' failed at %s%s:%d\n",
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 predicate, prefix, filename, lineno);
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( BUG_DEBUGGER=
_TRAP_FATAL(regs) )
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 break;
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_st=
ate(regs);
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Assertion =
'%s' failed at %s%s:%d\n",
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 predicate, prefix, filename, lineno);
> > > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0 return id;
> > > > > > > +}
> > > > > >=20
> > > > > > ... I can't really spot what it might be that comes from
> > > > > > that
> > > > > > header.
> > > > > > Oh, on the N+1st run I've spotted it - it's
> > > > > > show_execution_state().
> > > > > > The declaration of which, already being used from common
> > > > > > code
> > > > > > ahead
> > > > > > of this series, should imo be moved to a common header. I
> > > > > > guess
> > > > > > I'll
> > > > > > make yet another patch ...
> > > > > As mentioned above. Not only show_execution_state() but also
> > > > > cpu_user_regs structure. ( at lest, for ARM & RISCV )
> > > >=20
> > > > Do we deref "regs" anywhere? I can't seem to be able to spot an
> > > > instance.
> > > > Without a deref (or alike) a forward decl is all that's needed
> > > > for
> > > > this
> > > > code to compile.
> > > You are there is no a deref so let's swich to a forward decl.
> > >=20
> > > I'll add it to a new version of the patch series.
> > I just realized that show_execution_state() is declared in
> > <asm/processor.h>.
>=20
> Not anymore with "move {,vcpu_}show_execution_state() declarations
> to common header", which was specifically made ...
>=20
> > So we have to leave an inclusion of the header or declare the
> > function
> > explicitly.
>=20
> ... to eliminate this dependency, but which sadly is still pending an
> Arm side ack.
Oh, I forgot about that patch.
Then you are right there is no any sense in the inclusion of
<asm/processor.h>.

~ Oleksii

