Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD870671A72
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 12:23:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480507.744961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6XI-0001h0-Ne; Wed, 18 Jan 2023 11:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480507.744961; Wed, 18 Jan 2023 11:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6XI-0001dc-KU; Wed, 18 Jan 2023 11:23:20 +0000
Received: by outflank-mailman (input) for mailman id 480507;
 Wed, 18 Jan 2023 11:23:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Njh=5P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pI6XH-0001ck-QC
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 11:23:19 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81759392-9722-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 12:23:17 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id k16so3780892wms.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jan 2023 03:23:17 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b003daff80f16esm2216711wmq.27.2023.01.18.03.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 03:23:16 -0800 (PST)
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
X-Inumbo-ID: 81759392-9722-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k6ihGsBNK8ToYkzti6MYyGHuz3m7GBLzr30v6z+rVFs=;
        b=D6fHzRbO8mZ8nV/RvWoiIAryPl0iflE9PCXN/5yHNWX4sE9Ss8e/8ToeYA0G2VDXB7
         DHnsNvzIsgh2zQY4g9w2GupNEX8MgxUSGZE/j1NGJ/wk/jr9X3sj0G9EK2+QltE9qSwd
         2acxIxk2UjuwmS6q8kbC3LZmxzYPzjnqyvK2tem8SCFmkTl5lTIcmQVa/vOp2C40qdwS
         IE1iIU3vg7KGMoBc9L4hO79XizZXjgJSTXsJo9uetBgj/4Pr7ksYfaaklz6YZDmoyaSD
         BLIUBEQ2bpTW750Sqa0Ar17DmGMyOqiLaJXOphB0ksRAWlJxyc6Ip/sV7pwz2LSFYt8e
         qH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6ihGsBNK8ToYkzti6MYyGHuz3m7GBLzr30v6z+rVFs=;
        b=hkZHqHTjNMs2ShFtAkrqNFwAM9yKt9WV+C5AbbGBMmxoao3uRrec6LiWsZaLTxfQz0
         7jWGhMcONrYnoXNlSSIx48EAsEZReD6jEleoa9JxuznECr3loRMTMlgLAolGrJGDqjZs
         btgGQd9M/fgljGOc/QpRw0ikMTGOFnoBGfUX7pBIef0qkU1169askMCnZzXhsYioLQby
         EY+xvi6UhuOCJowhpzp2I4Z6U+SDL9o+IZV37dZ0BXheAO9ZICOWdZIzJw5Kev2cjQxj
         QRm6suCdZmS54nFbsxSet4+U0ehpN7ApWmf0uV4kdZ+5zvgOtkGtr9Vfov7VaoajS5LZ
         P4jA==
X-Gm-Message-State: AFqh2krqIc9Y+fVifyebOBImUsmXhdk6A3ptisJVjF+1gw/6psmEHQvs
	cSbdoBIZfl/vei/YH9BNOUM=
X-Google-Smtp-Source: AMrXdXs4S5xswNnSOU95qEZToGvTdp6Uur8VvCnUSlvqLvBfq/L5f6mVDGUKbl3+uc6tBOy69eChQA==
X-Received: by 2002:a05:600c:1d12:b0:3db:53f:baea with SMTP id l18-20020a05600c1d1200b003db053fbaeamr6013246wms.6.1674040997041;
        Wed, 18 Jan 2023 03:23:17 -0800 (PST)
Message-ID: <79e2670cdc74454045e653bd62fb4815cb8a7eb3.camel@gmail.com>
Subject: Re: [PATCH v4 1/4] xen/riscv: introduce asm/types.h header file
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 18 Jan 2023 13:23:16 +0200
In-Reply-To: <d871f9e2-5f00-1f0d-3297-0084d4a4af27@suse.com>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
	 <2ce57f95f8445a4880e0992668a48ffe7c2f9732.1673877778.git.oleksii.kurochko@gmail.com>
	 <e00512a6-5d32-6dbf-4269-429532f8a852@suse.com>
	 <87107d8945c9f1513c305d115f24f488b87e088b.camel@gmail.com>
	 <d871f9e2-5f00-1f0d-3297-0084d4a4af27@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-01-17 at 11:04 +0100, Jan Beulich wrote:
> On 17.01.2023 10:29, Oleksii wrote:
> > On Mon, 2023-01-16 at 15:59 +0100, Jan Beulich wrote:
> > > On 16.01.2023 15:39, Oleksii Kurochko wrote:
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > Changes in V4:
> > > > =C2=A0=C2=A0=C2=A0 - Clean up types in <asm/types.h> and remain onl=
y
> > > > necessary.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The following types was removed as t=
hey are defined in
> > > > <xen/types.h>:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {__|}{u|s}{8|16|32|64}
> > >=20
> > > For one you still typedef u32 and u64. And imo correctly so,
> > > until we
> > > get around to move the definition basic types into xen/types.h.
> > > Plus
> > > I can't see how things build for you: xen/types.h expects
> > > __{u,s}<N>
> > It builds because nothing is used <xen/types.h> now so that's why I
> > missed them but you are right __{u,s}<N> should be backed.
> > It looks like {__,}{u,s}{8,16,32} are the same for all available in
> > Xen
> > architectures so probably can I move them to <xen/types.h> instead
> > of
> > remain them in <asm/types.h>?
>=20
> This next step isn't quite as obvious, i.e. has room for being
> contentious. In particular deriving fixed width types from C basic
> types is setting us up for future problems (especially in the
> context of RISC-V think of RV128). Therefore, if we touch and
> generalize this, I'd like to sanitize things at the same time.
>=20
> I'd then prefer to typedef {u,}int<N>_t by using either the "mode"
> attribute (requiring us to settle on a prereq of there always being
> 8 bits per char) or the compiler supplied __{U,}INT<N>_TYPE__
> (taking gcc 4.7 as a prereq; didn't check clang yet). Both would
> allow {u,}int64_t to also be put in the common header. Yet if e.g.
> a prereq assumption faced opposition, some other approach would
> need to be found. Plus using either of the named approaches has
> issues with the printf() format specifiers, for which I'm yet to
> figure out a solution (or maybe someone else knows a good way to
> deal with that; using compiler provided headers isn't an option
> afaict, as gcc provides stdint.h but not inttypes.h, but maybe
> glibc's simplistic approach is good enough - they're targeting
> far more architectures than we do and get away with that).
>=20
Thanks for the explanation.

If back to RISCV's <asm/types.h> it looks that the v2 of the patch
(https://lore.kernel.org/xen-devel/ca2674739cfa71cae0bf084a7b471ad4518026d3=
.1673278109.git.oleksii.kurochko@gmail.com/)
is the best one option now because as I can see some work is going on
around <xen/types.h> and keeping the minimal set of types now will
allow us to not remove unneeded types for RISCV's port from asm/types.h
in the future.

Even more based on your patch [
https://lists.xen.org/archives/html/xen-devel/2023-01/msg00720.html ]
RISCV's <asm/types.h> can be empty for this patch series.

> Jan
~Oleksii

