Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E236B9F64
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 20:12:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509797.786293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcA47-0001kC-VT; Tue, 14 Mar 2023 19:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509797.786293; Tue, 14 Mar 2023 19:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcA47-0001iD-SS; Tue, 14 Mar 2023 19:12:07 +0000
Received: by outflank-mailman (input) for mailman id 509797;
 Tue, 14 Mar 2023 19:12:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snfi=7G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcA46-0001hx-Ku
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 19:12:06 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1abd5568-c29c-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 20:12:03 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id da10so66399480edb.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 12:12:03 -0700 (PDT)
Received: from [192.168.8.114] (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 x26-20020a170906135a00b008e8e975e185sm1507669ejb.32.2023.03.14.12.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 12:12:03 -0700 (PDT)
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
X-Inumbo-ID: 1abd5568-c29c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678821123;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dJofpBQX78OOGX37duequ6e5EWi+LIgEtv671taA/iM=;
        b=kt/vnDqdVLyH/2E6milF9Ah9iMK/BULOiLSc0593HYNFLeIjt3BS5BVdLR/RMSzE6W
         pEGtyYbRuYUzu6maei1KfUeZQqOYz40fAGqW68+IDdfmy5sT00yRJtfq/iAGRE3cMyed
         +mbJ4BCPj/v0Wb5Ubn6pDtWMzoGvVnRxK4h9FFGjXbxL2V4kc4PV03dPHkMxchCnElQQ
         87t00q/btL+MK7/bqBg8HeoXZgzvBs6hdMAR8zwBguBxFExTXxEUy/Fnqt8V9ZZ/t0b4
         YRAv4DlulbQlTMhJ3jqA3hrkIa9iqy4Nlg4yB/ai0EMLm3lV5Tqdx7OCVTsLOjkDmvy9
         5u/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678821123;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJofpBQX78OOGX37duequ6e5EWi+LIgEtv671taA/iM=;
        b=y/ShqnrN2W6jKczTh2rQ+m6SSsWiQ6DWwy87SPfheiHpUa+MZgQ7W9R3KimqGpBD6N
         AlsDfSDc5l6vNBN69SqDoHc5OfFgLY4TGjJcPTQuuElxmWnn9wmjcyMngVfz3QMpwPHt
         4+IEEC6CM+rbb6hDnn9dEq94kHKkAM5/btuHsGVROgI6l9DiyeOprj78EsWuqBu1jRjQ
         MW6WNm7PKk3Y1Uz7F55E2UMjeS+Aq1X8SnE4So9X3EXhr5tkulz6diu7sNMJyAjbhjNO
         FWkH7U837YmiXJYY5UqIcOT1eB3G6sQ2Wvd0DbMjJr4nGp6coGk2zENPxMAw+nY3MvRk
         m1hg==
X-Gm-Message-State: AO0yUKVKex3nuyarR2GBHiKFeg8TNLFK1ZKDUbT4t5nvn2rhxC8f7XMA
	QWopWgpBgfLCTKJPz1+s3/k=
X-Google-Smtp-Source: AK7set8IsOBOCDQadlJ4pc3DACYjdNGeZXy9kOuiZ2JB6dgWsBjxT7tTylGQuhJjJxGA/TFtXbg2sQ==
X-Received: by 2002:a17:906:2dda:b0:8af:447a:ff8e with SMTP id h26-20020a1709062dda00b008af447aff8emr3129797eji.20.1678821123331;
        Tue, 14 Mar 2023 12:12:03 -0700 (PDT)
Message-ID: <192fbcf22a6c6e16498cc208eeb37fc6e08ce56a.camel@gmail.com>
Subject: Re: [PATCH v7 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Julien Grall <julien@xen.org>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 14 Mar 2023 21:12:01 +0200
In-Reply-To: <3df43c25-6c06-0cbb-5452-c989511a7e15@suse.com>
References: <cover.1678368234.git.oleksii.kurochko@gmail.com>
	 <671cd744b92f14ddc0c47ca471e03e3229cb89ba.1678368234.git.oleksii.kurochko@gmail.com>
	 <3df43c25-6c06-0cbb-5452-c989511a7e15@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-03-13 at 17:26 +0100, Jan Beulich wrote:
> On 09.03.2023 14:33, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/common/bug.c
> > @@ -0,0 +1,107 @@
> > +#include <xen/bug.h>
> > +#include <xen/errno.h>
> > +#include <xen/kernel.h>
> > +#include <xen/livepatch.h>
> > +#include <xen/string.h>
> > +#include <xen/types.h>
> > +#include <xen/virtual_region.h>
> > +
> > +#include <asm/processor.h>
> > +
> > +/*
> > + * Returns a negative value in case of an error otherwise
> > + * BUGFRAME_{run_fn, warn, bug, assert}
> > + */
> > +int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
> > +{
> > +=C2=A0=C2=A0=C2=A0 const struct bug_frame *bug =3D NULL;
> > +=C2=A0=C2=A0=C2=A0 const struct virtual_region *region;
> > +=C2=A0=C2=A0=C2=A0 const char *prefix =3D "", *filename, *predicate;
> > +=C2=A0=C2=A0=C2=A0 unsigned long fixup;
> > +=C2=A0=C2=A0=C2=A0 unsigned int id =3D BUGFRAME_NR, lineno;
>=20
> Unnecessary initializer; "id" is set ...
>=20
> > +=C2=A0=C2=A0=C2=A0 region =3D find_text_region(pc);
> > +=C2=A0=C2=A0=C2=A0 if ( !region )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( id =3D 0; id < BUGFRAME_NR; id++ )
>=20
> ... unconditionally here.
>=20
> > --- /dev/null
> > +++ b/xen/include/xen/bug.h
> > @@ -0,0 +1,162 @@
> > +#ifndef __XEN_BUG_H__
> > +#define __XEN_BUG_H__
> > +
> > +#define BUGFRAME_run_fn 0
> > +#define BUGFRAME_warn=C2=A0=C2=A0 1
> > +#define BUGFRAME_bug=C2=A0=C2=A0=C2=A0 2
> > +#define BUGFRAME_assert 3
> > +
> > +#define BUGFRAME_NR=C2=A0=C2=A0=C2=A0=C2=A0 4
> > +
> > +#define BUG_DISP_WIDTH=C2=A0=C2=A0=C2=A0 24
> > +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> > +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> > +
> > +#include <asm/bug.h>
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +#ifndef BUG_DEBUGGER_TRAP_FATAL
> > +#define BUG_DEBUGGER_TRAP_FATAL(regs) 0
> > +#endif
> > +
> > +#include <xen/lib.h>
> > +
> > +#ifndef BUG_FRAME_STRUCT
> > +
> > +struct bug_frame {
> > +=C2=A0=C2=A0=C2=A0 signed int loc_disp:BUG_DISP_WIDTH;
> > +=C2=A0=C2=A0=C2=A0 unsigned int line_hi:BUG_LINE_HI_WIDTH;
> > +=C2=A0=C2=A0=C2=A0 signed int ptr_disp:BUG_DISP_WIDTH;
> > +=C2=A0=C2=A0=C2=A0 unsigned int line_lo:BUG_LINE_LO_WIDTH;
> > +=C2=A0=C2=A0=C2=A0 signed int msg_disp[];
> > +};
> > +
> > +#define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
> > +
> > +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
> > +
> > +#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0))
> > &=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((1 << BUG_=
LINE_HI_WIDTH) - 1))
> > <<=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_LINE_LO_WIDTH=
)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (((b)->line_lo + ((b)->=
ptr_disp < 0))
> > &=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((1 << BUG_LINE_L=
O_WIDTH) - 1)))
> > +
> > +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])
> > +
> > +#ifndef BUILD_BUG_ON_LINE_WIDTH
> > +#define BUILD_BUG_ON_LINE_WIDTH(line) \
> > +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH +
> > BUG_LINE_HI_WIDTH))
> > +#endif
>=20
> I still don't see why you have #ifdef here. What I would expect is
> (as
> expressed before)
>=20
> #define BUILD_BUG_ON_LINE_WIDTH(line) \
> =C2=A0=C2=A0=C2=A0 BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_H=
I_WIDTH))
>=20
> #else=C2=A0 /* BUG_FRAME_STRUCT */
>=20
> #ifndef BUILD_BUG_ON_LINE_WIDTH
> #define BUILD_BUG_ON_LINE_WIDTH(line) ((void)(line)
> #endif
>=20
> (perhaps shortened to
>=20
> #elif !defined(BUILD_BUG_ON_LINE_WIDTH)
> #define BUILD_BUG_ON_LINE_WIDTH(line) ((void)(line)
>=20
> )
>=20
> > +#endif /* BUG_FRAME_STRUCT */
>=20
> ... and then the separate conditional further down dropped. Have you
> found anything speaking against this approach?
Both options are fine from compilation point of view.

Lets change it to proposed by you option with '#elif !defined(...)...'

I'll prepare new patch series and sent it to the mailing list.

I would like to add the changes from the [PATCH] xen/cpufreq: Remove
<asm/bug.h> by=C2=A0Jason Andryuk <jandryuk@gmail.com> but I don't know how
correctly do that. I mean should I added one more Signed-off to the
patch?

Thanks.

~ Oleksii

