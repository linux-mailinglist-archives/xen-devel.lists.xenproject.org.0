Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878474CF85
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561063.877343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIlxd-0006VR-Ao; Mon, 10 Jul 2023 08:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561063.877343; Mon, 10 Jul 2023 08:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIlxd-0006T8-7g; Mon, 10 Jul 2023 08:09:33 +0000
Received: by outflank-mailman (input) for mailman id 561063;
 Mon, 10 Jul 2023 08:09:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbMe=C4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qIlxb-0006T2-D1
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:09:31 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1863b348-1ef9-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 10:09:30 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b700e85950so60942331fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 01:09:30 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a2ea317000000b002b1b92910c8sm1892323lje.86.2023.07.10.01.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 01:09:28 -0700 (PDT)
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
X-Inumbo-ID: 1863b348-1ef9-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688976569; x=1691568569;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rQ3YaondrW5LA+gOinnTfEk+gHMn0xC/EdwUREwUx2E=;
        b=IrBTY+tX3Rwu6xUjE+rIPsddknJKAo4xRdatLv84FMyG33rJ9rXWR4rw0ojyU0eAWF
         6beQ45gxVjb9foTr8IpAfWd/E2M/7v/PPxOuXcMxE99FQ6F9edBFSvHgCxKLlnBe2BoP
         5uNIIg+q29JD1rX2mRSz9BPONBfx+TeJINyxQR070AjcnsfOK7fo+6jTbP22OuzUvDYw
         LiOf3/UTTi3v8ZmZ0JmAwOpqeLb/TkqDSt1ef4B5cgzyreRKJl2NqNOc9DZ9C3qXnuOb
         lTnPkvzSdvn4baO6/c9Bcjj8A1yUnxfwBgXkeeIrV1qo9h+tTm2PCUf5s46ye5SvPpDg
         vIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688976569; x=1691568569;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQ3YaondrW5LA+gOinnTfEk+gHMn0xC/EdwUREwUx2E=;
        b=B6Wze+cFPsOmfAyBQJ70slz228R2ZIPy6dsRPSJ7mT7mndCiBRhQaB1whGLZEY/BSH
         QzI4BZn9bpAZ+g1O0f/yyZL+Ut/RDeZAFjTYf3Pfs5Yva0fOM9u3TcO+N0AMYY+e5jSX
         yOo/4Y6xy1yfTnUhLKPzoRKe0nBrOoRXA6Oz3w3GkQfPvFKD6+dviyj47QatZnrWJK6h
         BMUOQj5MOg1ux0MYHu59uewJ0YY8eb8+KvZbs4UQjQoryiNG+NyYPS29SoeXaAIU9pZn
         PnC1JowKEqUfBudr2ufRHe/nuJ2rnRh1SkXyWtNmuOBKWm0OFGzuOIxwkPbU5RrxWjNW
         MkmQ==
X-Gm-Message-State: ABy/qLZv0lrD2UzcDZ1pnwrNMBfd8rovuLEIGYgWcLHpkR6UhGD8TXhO
	kIoQb9vuAWKst899XKeC9p0=
X-Google-Smtp-Source: APBJJlGixzxtZqbEqSBbXT9ylEeUqPzdDtaiIvSDbxrQoj9CTLJEMOsaiQgDjG36J5SQ/uN5+gbiDQ==
X-Received: by 2002:a2e:924e:0:b0:2b1:b4e9:4c3 with SMTP id v14-20020a2e924e000000b002b1b4e904c3mr9402861ljg.2.1688976569327;
        Mon, 10 Jul 2023 01:09:29 -0700 (PDT)
Message-ID: <886888f6a47973c84485d554e0fd71c331dcc35b.camel@gmail.com>
Subject: Re: [PATCH v2 2/6] xen/riscv: introduce reset_stack() function
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 10 Jul 2023 11:09:28 +0300
In-Reply-To: <be40e52e-454c-57ba-0ad1-6fae2b896332@suse.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
	 <6024617719467cd2da8ae03b81ddc899f2ba4311.1687178053.git.oleksii.kurochko@gmail.com>
	 <98f1cb38-673a-c66f-96be-ba2cb6ff242f@suse.com>
	 <ba2694c1e64b6bdf493170c72564ae72d701b700.camel@gmail.com>
	 <be40e52e-454c-57ba-0ad1-6fae2b896332@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Fri, 2023-07-07 at 11:33 +0200, Jan Beulich wrote:
> On 07.07.2023 11:08, Oleksii wrote:
> > On Thu, 2023-07-06 at 13:17 +0200, Jan Beulich wrote:
> > > On 19.06.2023 15:34, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/riscv64/head.S
> > > > +++ b/xen/arch/riscv/riscv64/head.S
> > > > @@ -27,8 +27,16 @@ ENTRY(start)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=
=A0=C2=A0 t3, t3, __SIZEOF_POINTER__
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bltu=C2=A0=C2=A0=
=C2=A0 t3, t4, .L_clear_bss
> > > > =C2=A0
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=
=C2=A0 reset_stack
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tail=C2=A0=C2=A0=C2=A0 =
start_xen
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text, "ax", %=
progbits
> > > > +
> > > > +ENTRY(reset_stack)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 sp, cpu0_boot_stack
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 t0, STACK_SIZE
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=
=A0=C2=A0 sp, sp, t0
> > > > =C2=A0
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tail=C2=A0=C2=A0=C2=A0 =
start_xen
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret
> > > > +
> > >=20
> > > Looking at patch 4 you will want to add a comment here to
> > > emphasize
> > > that a0 and a1 have to remain unclobbered.
> > Thanks for a note. I'll add it in the new patch version
>=20
> Having seen how things end up by the end of the series, there's an
> alternative: You could save a0 and a1 ahead of the 1st call to
> reset_stack, rather than immediately afterwards.
It makes sense. So lets stick to saving of a0 and a1 before 1st call of
reset_stack().

~ Oleksii

