Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0926A4075
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:20:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502390.774165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbXo-0007Qv-Ab; Mon, 27 Feb 2023 11:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502390.774165; Mon, 27 Feb 2023 11:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbXo-0007OQ-7f; Mon, 27 Feb 2023 11:19:48 +0000
Received: by outflank-mailman (input) for mailman id 502390;
 Mon, 27 Feb 2023 11:19:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddEZ=6X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pWbXl-0007OK-TA
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:19:46 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a344c77a-b690-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 12:19:44 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id s20so8017121lfb.11
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 03:19:44 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 w26-20020ac2599a000000b004db513b0175sm864612lfn.136.2023.02.27.03.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:19:43 -0800 (PST)
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
X-Inumbo-ID: a344c77a-b690-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ayrn8/LFsotyDDm6Z/Mc8ba9pVXgViWhZp7UVN9PO7U=;
        b=GCFMDRjSxgzyWqu0g4WF3zELZK+FjaBRvJQbwmJoS0ze/6dK77xupZlSqfs+QRnaYx
         viR67roWblF4dzBCU2h+Ks4zUpWCwKryAu93r857ZpVYQJi3euaP7aYOdy1cAuHyo/lL
         7R4f0GJOONaWDuZwmIyBQrYyvWUrhuyLYpi0U7f5YXPIQ8FPTf7ettDD732AcNgarXzP
         +DMx7B+hS8Rkd+jhkPuI/H+xrTUYdVvZ+928JhvJnGqdfETJ9Tv4QIuYm+FUEWUK7nYG
         JnHpr7XeWFmsDNkE789iXx1xRmpSXbUJlI6Q6RvVoZ4zeY4GDGl31ACq2ACWpieaSJtk
         aNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ayrn8/LFsotyDDm6Z/Mc8ba9pVXgViWhZp7UVN9PO7U=;
        b=nxYv+zsjJqdJrGKaE7hecQD3Kl0mvotsaFyKS7YO4o02KVF5zbPdtHoDo7cR8IYSyR
         lA6lfiCELBfemvAs0ZpBxjvt78oETmp52mmrbqo63WWFv8XNb5mlkw13R/Zstw1V+RdG
         vmuKsij9hCBm3oOQYWhZWUW1jZaDE5rkLmrNoQEtnRo2J01rBAQJcJFerq9in7yw9zMi
         3cFqX4zccL6qaaYKXm0l0S/NnHv+N7WTaHx+wwaHBBYm79mnT8caosw9/wp5c/mgKIUe
         7tS1j8+FneABSt4ITAMtAL4tAI5zheBs/YtqOq2rItid/szkk0UrJh+jpV4UvfDxBL6U
         CjPQ==
X-Gm-Message-State: AO0yUKVetZYwC9tqX5mDbBwGtcABDVlQtTTFCwsiYeB0ijSxpCdvGkW/
	UuKAWcbd/xrRoABcYjG0Y44=
X-Google-Smtp-Source: AK7set+7m6NuoGN63ZVZEziJpo4StueTbu/SGUzmQDG/RISR6dshCfMqvf9cr/2hK7ayC5e/yz/63g==
X-Received: by 2002:a19:c20e:0:b0:4e0:a426:6ddc with SMTP id l14-20020a19c20e000000b004e0a4266ddcmr567579lfc.0.1677496784321;
        Mon, 27 Feb 2023 03:19:44 -0800 (PST)
Message-ID: <f5d3743acbac46c4fb3ddfe879e417bff77139be.camel@gmail.com>
Subject: Re: [PATCH] xen/riscv: read hart_id and dtb_base passed by
 bootloader
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 27 Feb 2023 13:19:42 +0200
In-Reply-To: <738ca749-2abb-6ab4-db8f-81ff41f4de16@suse.com>
References: 
	<94d722dea114defa2a5efe29e6511829f0c54b41.1677249592.git.oleksii.kurochko@gmail.com>
	 <cbc043ac-fde9-50d9-a63f-40a6b4a59f34@suse.com>
	 <b2e99dbc61295ef8ab41ba8e8afa8f606ed6503d.camel@gmail.com>
	 <738ca749-2abb-6ab4-db8f-81ff41f4de16@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-27 at 10:17 +0100, Jan Beulich wrote:
> On 24.02.2023 17:36, Oleksii wrote:
> > On Fri, 2023-02-24 at 16:04 +0100, Jan Beulich wrote:
> > > On 24.02.2023 15:48, Oleksii Kurochko wrote:
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > =C2=A0xen/arch/riscv/setup.c | 12 ++++++++++++
> > > > =C2=A01 file changed, 12 insertions(+)
> > > >=20
> > > > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > > > index b3f8b10f71..154bf3a0bc 100644
> > > > --- a/xen/arch/riscv/setup.c
> > > > +++ b/xen/arch/riscv/setup.c
> > > > @@ -26,6 +26,18 @@ static void test_macros_from_bug_h(void)
> > > > =C2=A0
> > > > =C2=A0void __init noreturn start_xen(void)
> > > > =C2=A0{
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * The following things are passed by boot=
loader:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 a0 -> hart_id
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 a1 -> dtb_base
> > > > +=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 register unsigned long hart_id=C2=A0 asm("a0");
> > > > +=C2=A0=C2=A0=C2=A0 register unsigned long dtb_base asm("a1");
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 asm volatile( "mv %0, a0" : "=3Dr" (hart_id) );
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 asm volatile( "mv %0, a1" : "=3Dr" (dtb_base) )=
;
> > >=20
> > > Are you sure this (a) works and (b) is what you want? You're
> > > inserting
> > Oh, yeah... it should be:
> > =C2=A0 unsigned long hart_id;
> > =C2=A0 unsigned long dtb_base;
>=20
> As per below - no, I don't think so. I continue to think these want
> to be function parameters.
>=20
> > I did experiments with 'register' and 'asm()' and after rebase of
> > my
> > internal branches git backed these changes...
> >=20
> > Sorry for that I have to double check patches next time.
> >=20
> > It looks like it works only because the variables aren't used
> > anywhere.
> > > "mov a0, a0" and "mov a1, a1". I suppose as long as the two local
> > > variables aren't used further down in the function, the compiler
> > > will
> > > be able to recognize both registers as dead, and hence use them
> > > for
> > > argument passing to later functions that you call. But I would
> > > expect
> > > that to break once you actually consume either of the variables.
> > >=20
> > > Fundamentally I think this is the kind of thing you want do to in
> > > assembly. However, in the specific case here, can't you simply
> > > have
> > >=20
> > > void __init noreturn start_xen(unsigned long hard_id,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long dtb_base)
> > > {
> > > =C2=A0=C2=A0=C2=A0 ...
> > >=20
> > > and all is going to be fine, without any asm()?
> > One of the things that I would like to do is to not use an
> > assembler as
> > much as possible. And as we have C environment ready after a few
> > assembly instructions in head.S I thought it would be OK to do it
> > in C
> > code somewhere at the start so someone/sonething doesn't alter
> > register
> > a0 and a1.
>=20
> Avoiding assembly code where possible if of course appreciated,
> because
> generally C code is easier to maintain. But of course this can only
> be
> done if things can be expressed correctly. And you need to keep in
> mind
> that asm() statements also are assembly code, just lower volume.
>=20
Let's get hard_id and dtb_base in head.S and pass them as arguments of
start_xen() function as you mentioned before.
I'll update the patch and send new version.
> Jan
~ Oleksii


