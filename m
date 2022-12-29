Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCD2658A39
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 09:12:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469644.729034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAo0h-0001mt-Pq; Thu, 29 Dec 2022 08:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469644.729034; Thu, 29 Dec 2022 08:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAo0h-0001km-M1; Thu, 29 Dec 2022 08:11:31 +0000
Received: by outflank-mailman (input) for mailman id 469644;
 Thu, 29 Dec 2022 08:11:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huHg=43=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pAo0f-0001kg-R3
 for xen-devel@lists.xenproject.org; Thu, 29 Dec 2022 08:11:29 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65470cc4-8750-11ed-91b6-6bf2151ebd3b;
 Thu, 29 Dec 2022 09:11:28 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id w1so4639254wrt.8
 for <xen-devel@lists.xenproject.org>; Thu, 29 Dec 2022 00:11:28 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d468d000000b00275970a85f4sm15089200wrq.74.2022.12.29.00.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 00:11:27 -0800 (PST)
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
X-Inumbo-ID: 65470cc4-8750-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rRkw30Hjx2YfokI5B+W3DTvMqHqCDLpYHbeuHRHE5To=;
        b=Q+vQ68txPQn8STwCJhN3Dt9k+2ZXcHLmoqmZX4+ZSjMtSmERgt3IZjMHrg0EfEaN28
         +/Lsgn4tQn9v1a46k/y8oxQxQNFhGMohl0yK8SMry14yRizTIiuAdiuNQjhoUG/WC8TT
         KTWRc1BU1RJcNebWH2vLk8g/Z0rchWqHR0tnMz8wsyZfyBL0bxRcByK8aZHat9v21O9Y
         bb0Gn7ojAanwo4ljW75grfq1ApwnqfjUGg8ssFsLnYy5XO/LcVL7wLoajoESCFyBsUw5
         LDyt0e/aSKYISnS09prPI7mdjmE7fMf/9DR1EkvdS42bgY2PCHdvFQx8bE85WXgYgtw/
         bGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rRkw30Hjx2YfokI5B+W3DTvMqHqCDLpYHbeuHRHE5To=;
        b=wwn4gMsegG0fcTBrlrjHNomNvwdspsihXMu/mpAxUARzYVdTpwRTQUjdKklQaPNvux
         2tlCQFSNlOaCSHparbugosBw1Ttos2pzeMuBJDFnyUHaTZLn1ogmdKjrl1MUKqjPrlfV
         ZEv55dS1/MSvXQbsipRFeyFbCZbqxblaPXe/GrrrtMbisFs9Jmt2K9ArAavLxatn8EVL
         jbGxf7tdyXOSiQ6H31PiUDubMHXyBuF5XtWe/pLnWuv5MT16qkhDvlm3Uh6pjSMipo2V
         PCICMb8UDlIEoj8Tx7syklCTJ8rlKJAcGIMNlcNTsU38NTIsPTz7gWaxp51Q521V+txD
         T8rg==
X-Gm-Message-State: AFqh2kofofaiNQwWvKArcwDjM+NRPETjYdoO/OWMemHRCP0m/eQK553R
	B5Xf1MVErEDhP3v82XtaOu4=
X-Google-Smtp-Source: AMrXdXsgn8eNToAKXRU/Wo5owzVG4e2RKBnJZZLqaIqnA0mZ2Yq29KMeFSlVsjJ/ZLw0/CBq0z92ZQ==
X-Received: by 2002:a5d:4403:0:b0:268:f9de:d551 with SMTP id z3-20020a5d4403000000b00268f9ded551mr17993844wrq.40.1672301488099;
        Thu, 29 Dec 2022 00:11:28 -0800 (PST)
Message-ID: <bd9ac5481578ce7ac557973815df47c358e006d0.camel@gmail.com>
Subject: Re: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Alistair Francis
	 <alistair23@gmail.com>
Cc: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>,  Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Anthony
 Perard <anthony.perard@citrix.com>
Date: Thu, 29 Dec 2022 10:11:26 +0200
In-Reply-To: <0a60dc57-080f-4210-d9f8-4688308cc5f5@citrix.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
	 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
	 <3343c927-0f27-e285-5b6e-281c61939bb4@xen.org>
	 <43d726761900ba3d8b4919fc29fe7cb1991ac656.camel@gmail.com>
	 <CAKmqyKMmW7rRXymMD6dNeLTLbUaSwO5nw=hJTk_xNvsZ3pg7jA@mail.gmail.com>
	 <0a60dc57-080f-4210-d9f8-4688308cc5f5@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Wed, 2022-12-28 at 19:01 +0000, Andrew Cooper wrote:
> On 28/12/2022 4:51 am, Alistair Francis wrote:
> > On Mon, Dec 26, 2022 at 9:14 PM Oleksii
> > <oleksii.kurochko@gmail.com> wrote:
> > > On Fri, 2022-12-23 at 13:50 +0000, Julien Grall wrote:
> > > > On 23/12/2022 11:16, Oleksii Kurochko wrote:
> > > > > +  . =3D ALIGN(PAGE_SIZE);
> > > > > +  .bss : {
> > > > > +       __bss_start =3D .;
> > > > > +       *(.bss .bss.*)
> > > > > +       . =3D ALIGN(POINTER_ALIGN);
> > > > > +       __bss_end =3D .;
> > > > Same as .data, I would recommend to properly populate it.
> > > Do you mean to add .bss.stack_aligned, .bss.page_aligned,
> > > .bss.percpu*?
> > > One of the reasons they were skipped is they aren't used now and
> > > one
> > > more reason if to believe xen.lds.S file from ARM
> > > .bss.percpu.read_mostly should be aligned by SMP_CACHE_BYTES
> > > which
> > > requires dummy <asm/cache.h> (or not ?) which will increase the
> > > patch
> > > with unneeded stuff for now.
> > I think we should aim to get the linker file sorted right from the
> > start. Otherwise someone is going to hit a nasty bug at some point
> > in
> > the future.
>=20
> What needs to happen is actually for Xen to start using a common
> linker
> script, rather than a per-arch linker script.
>=20

Do you expect to see common linker script as a part of this patch
series?

> The vast majority of the linker script is not architecture specific
> to
> begin with, and the rest is easy to parametrise.
>=20

I reworked xen.lds.S file.

I took xen.lds.S from ARM as a basis and
remove all arch specific sections such as *(.proc.info), *(.ex_table),
*(.ex_table.pre), *(.altinstructions), *(.teemediator.info),
*(.adev.info), *(.dev.info), *(.arch.info), *(.bug_frames.*).

So it would be possible to use xen.lds.S as a common linker script.

> But in the short term, it's more important to get something working
> and
> properly into CI, rather than to block this change waiting for
> feature
> parity with a whole load of features not currently used.
>
> ~Andrew

~Oleksii


