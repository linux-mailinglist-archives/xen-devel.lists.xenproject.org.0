Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1776A4180
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 13:14:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502478.774315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcOC-0006Ca-2i; Mon, 27 Feb 2023 12:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502478.774315; Mon, 27 Feb 2023 12:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcOB-0006AX-WF; Mon, 27 Feb 2023 12:13:56 +0000
Received: by outflank-mailman (input) for mailman id 502478;
 Mon, 27 Feb 2023 12:13:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddEZ=6X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pWcOA-0006AP-7B
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 12:13:54 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32b7e844-b698-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 13:13:52 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id z5so6193193ljc.8
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 04:13:52 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 b15-20020a2e988f000000b0029599744c02sm711861ljj.75.2023.02.27.04.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:13:51 -0800 (PST)
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
X-Inumbo-ID: 32b7e844-b698-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9lNsBql8aioKtLfiL9IaOFFrgzEWLfErMQPcFuOlMa0=;
        b=WCJ3JEr4kRlN1Qhj2STHJ44/uFHZooDxOtULn+JaTQeNf/YadR9xhDuqENa21IjKZR
         +nIRLk3JaEmK/4DjnOJgkPP9uNEk3za3JaRfmU03xvL6nCAmJ3Wx1XPaZmnrbw3HAWgX
         vUrEo1riNgX9BvolGh5C0tzV+4OeWId1atQZAQqXkD43TOG9yRHHbvScH4Ret9+k4u47
         8bc470S11bnFsPbCzdi27yWr3R/fGdbpMoXQYBEtZ6iGA46PXMjKBNfBupUqutdas7OO
         br7HANgo7xyqEhxErrIoED7YIm4f03Y+yFugU5inkuTuWapxBjN+FW7CZ+PYvBJsfCY3
         3MQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9lNsBql8aioKtLfiL9IaOFFrgzEWLfErMQPcFuOlMa0=;
        b=jd9XOTvc2Hf+UxDhui5PXzb5ViJ9Z2PiENKnhcL4/PcF8VbTDByCtff+n4qlXh4BmO
         AhV5ya2KhRFpQ03EjUyrzH07vEGknyl09NVgefB+LBljybK6/qKrEMSORSk04Uvj15Eh
         q3yROyYfvmJwDnH7lqSjcg2r05y0d6ywwBjcj/XkIJz6PkDoYUkjemLsmRtfW5XDL/4k
         CSIbiuWc0XcaoqLMfVEJ+271gaeQAbrdChC6bLH1XEA6A5oMyMlUp/M/i6tecVR/15so
         XnikHRaz6ihikdxHt4WpCtJHLP3FWc0YJDtLxg0N3GInRuFLJcMxf7g5lc5BDR4W3+7U
         3pzw==
X-Gm-Message-State: AO0yUKV4FSYRvKOYg3R0gLG3q8uw3gOsd0plXzzUcpn3p/sSV1BC0+ZD
	61+TqF9cjXEJ8IkLRp7QFQc=
X-Google-Smtp-Source: AK7set/kMbU9Q7XYd8aNpw23ZRqLlSp9+UmQDM46LWoaTF+sw2C9o/dGeZiAKii5Sbp+gt5TQI6hVQ==
X-Received: by 2002:a2e:8e84:0:b0:295:a3a6:614 with SMTP id z4-20020a2e8e84000000b00295a3a60614mr3755855ljk.12.1677500031464;
        Mon, 27 Feb 2023 04:13:51 -0800 (PST)
Message-ID: <19c2c6f283e9f220fa54d9c08a911aa3d3f530ef.camel@gmail.com>
Subject: Re: [PATCH] xen/riscv: read hart_id and dtb_base passed by
 bootloader
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 27 Feb 2023 14:13:49 +0200
In-Reply-To: <f7b66c62-d67d-bd46-648c-b48a2e9ec76f@suse.com>
References: 
	<94d722dea114defa2a5efe29e6511829f0c54b41.1677249592.git.oleksii.kurochko@gmail.com>
	 <cbc043ac-fde9-50d9-a63f-40a6b4a59f34@suse.com>
	 <b2e99dbc61295ef8ab41ba8e8afa8f606ed6503d.camel@gmail.com>
	 <738ca749-2abb-6ab4-db8f-81ff41f4de16@suse.com>
	 <f5d3743acbac46c4fb3ddfe879e417bff77139be.camel@gmail.com>
	 <f7b66c62-d67d-bd46-648c-b48a2e9ec76f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-27 at 12:37 +0100, Jan Beulich wrote:
> On 27.02.2023 12:19, Oleksii wrote:
> > On Mon, 2023-02-27 at 10:17 +0100, Jan Beulich wrote:
> > > On 24.02.2023 17:36, Oleksii wrote:
> > > > On Fri, 2023-02-24 at 16:04 +0100, Jan Beulich wrote:
> > > > > On 24.02.2023 15:48, Oleksii Kurochko wrote:
> > > > > > Signed-off-by: Oleksii Kurochko
> > > > > > <oleksii.kurochko@gmail.com>
> > > > > > ---
> > > > > > =C2=A0xen/arch/riscv/setup.c | 12 ++++++++++++
> > > > > > =C2=A01 file changed, 12 insertions(+)
> > > > > >=20
> > > > > > diff --git a/xen/arch/riscv/setup.c
> > > > > > b/xen/arch/riscv/setup.c
> > > > > > index b3f8b10f71..154bf3a0bc 100644
> > > > > > --- a/xen/arch/riscv/setup.c
> > > > > > +++ b/xen/arch/riscv/setup.c
> > > > > > @@ -26,6 +26,18 @@ static void test_macros_from_bug_h(void)
> > > > > > =C2=A0
> > > > > > =C2=A0void __init noreturn start_xen(void)
> > > > > > =C2=A0{
> > > > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * The following things are passed by =
bootloader:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 a0 -> hart_id
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 a1 -> dtb_base
> > > > > > +=C2=A0=C2=A0=C2=A0 */
> > > > > > +=C2=A0=C2=A0=C2=A0 register unsigned long hart_id=C2=A0 asm("a=
0");
> > > > > > +=C2=A0=C2=A0=C2=A0 register unsigned long dtb_base asm("a1");
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 asm volatile( "mv %0, a0" : "=3Dr" (hart_id=
) );
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 asm volatile( "mv %0, a1" : "=3Dr" (dtb_bas=
e) );
> > > > >=20
> > > > > Are you sure this (a) works and (b) is what you want? You're
> > > > > inserting
> > > > Oh, yeah... it should be:
> > > > =C2=A0 unsigned long hart_id;
> > > > =C2=A0 unsigned long dtb_base;
> > >=20
> > > As per below - no, I don't think so. I continue to think these
> > > want
> > > to be function parameters.
> > >=20
> > > > I did experiments with 'register' and 'asm()' and after rebase
> > > > of
> > > > my
> > > > internal branches git backed these changes...
> > > >=20
> > > > Sorry for that I have to double check patches next time.
> > > >=20
> > > > It looks like it works only because the variables aren't used
> > > > anywhere.
> > > > > "mov a0, a0" and "mov a1, a1". I suppose as long as the two
> > > > > local
> > > > > variables aren't used further down in the function, the
> > > > > compiler
> > > > > will
> > > > > be able to recognize both registers as dead, and hence use
> > > > > them
> > > > > for
> > > > > argument passing to later functions that you call. But I
> > > > > would
> > > > > expect
> > > > > that to break once you actually consume either of the
> > > > > variables.
> > > > >=20
> > > > > Fundamentally I think this is the kind of thing you want do
> > > > > to in
> > > > > assembly. However, in the specific case here, can't you
> > > > > simply
> > > > > have
> > > > >=20
> > > > > void __init noreturn start_xen(unsigned long hard_id,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long dtb_base)
> > > > > {
> > > > > =C2=A0=C2=A0=C2=A0 ...
> > > > >=20
> > > > > and all is going to be fine, without any asm()?
> > > > One of the things that I would like to do is to not use an
> > > > assembler as
> > > > much as possible. And as we have C environment ready after a
> > > > few
> > > > assembly instructions in head.S I thought it would be OK to do
> > > > it
> > > > in C
> > > > code somewhere at the start so someone/sonething doesn't alter
> > > > register
> > > > a0 and a1.
> > >=20
> > > Avoiding assembly code where possible if of course appreciated,
> > > because
> > > generally C code is easier to maintain. But of course this can
> > > only
> > > be
> > > done if things can be expressed correctly. And you need to keep
> > > in
> > > mind
> > > that asm() statements also are assembly code, just lower volume.
> > >=20
> > Let's get hard_id and dtb_base in head.S and pass them as arguments
> > of
> > start_xen() function as you mentioned before.
>=20
> Still looks like a misunderstanding to me. Aiui a0 and a1 are the
> registers to hold first and second function arguments each. If
> firmware places the two values in these two registers, then
> start_xen(), with the adjusted declaration, will fit the purpose
> without any assembly code.
>=20
It will work for the code we have now, but it will be more save to save
registers a0 and a1 to some variables and pass them to start_xen() as
arguments as they can be changed by something before the start_xen()
call in the future.

~ Oleksii


