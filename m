Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778856BCB7B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510457.788114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckHg-0008Hj-2w; Thu, 16 Mar 2023 09:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510457.788114; Thu, 16 Mar 2023 09:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckHf-0008F5-W0; Thu, 16 Mar 2023 09:52:31 +0000
Received: by outflank-mailman (input) for mailman id 510457;
 Thu, 16 Mar 2023 09:52:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pckHf-0008Ef-0e
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:52:31 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4355b5f5-c3e0-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 10:52:28 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id eh3so5079276edb.11
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 02:52:28 -0700 (PDT)
Received: from [192.168.8.114] (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 m20-20020a509994000000b004aef147add6sm3623199edb.47.2023.03.16.02.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 02:52:28 -0700 (PDT)
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
X-Inumbo-ID: 4355b5f5-c3e0-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678960348;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kDU3l0Q9xs79KZCJ6ZM68p1HdOJyTYyfAE+xZF3W1Ow=;
        b=XBA3OII5GX4v70AP2JaHnZ6HaZBHsAfEMFq7/K+LY0mR6jnob6cxg/bsxvjL5xjxL/
         N4BWpVGVPv+jaX5Kavm8wFWSvjl36JzKXKCI8MFPLELKYpUbi4qUt8mP7biR+fRb08ln
         /a8WZyxYOvOZRXoSaoxtzwK7QsNWk7EJEAM32PKyeC9i/Ju/NbFNRisVHAK5IfIZZULI
         pLqxg0DkdgUvX1aFcEOGhS821+x6xD6uxmhj/7JTtfhY+d2JOQ6e+vVD8lQVcrJeZ4IC
         2xrBN01dTuVbRxYG08CbUTRs1r8lZDeCIdQN3F12Yw58XoCVbbo010N37zJ6uJbPGENE
         0flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678960348;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDU3l0Q9xs79KZCJ6ZM68p1HdOJyTYyfAE+xZF3W1Ow=;
        b=CJtr2kFI+AGgK2i285NKxeP/eVkcR/WwaGODD6bxlxLfwAekraRiR66JKp08EgBxHr
         C6xhGzKs6y/n+wWljYeVKYhDlyWtYfCJEluttEdbyhFEDOJybY++MarziacmQksLb/A/
         WXrdNSB6KI+g8j0iX71WFB8KmPJGVv/teSpbVfVAoBWUGQ8s6LdPEqbb3gq9maDD1spY
         xb5P+fBSu7O231pent1hkiPG/VwKZu+QNhEa4+FOiSYAYmqx1jbWBLkV0vxFEAGOdNOf
         3Kix2XcvmibGH4f/W/THqs2yPfqOMwigsPStlAg1I0RWMtoeG4KnF1g6R7e/LRrLsgVZ
         GYZA==
X-Gm-Message-State: AO0yUKVpQUOOzRxlqK0YqCcY1RC98y/OYgMWGv3lTIkJWh2Hocw8JjIF
	b7o7shjj49ccT1H9YF2FOq8=
X-Google-Smtp-Source: AK7set/vaNmXuqRWtpMvTpDMRKUEahweJ5P9Xij//5l4dJxszOa2s4IjtrAV1SYhtunoTYseunnEPA==
X-Received: by 2002:a05:6402:789:b0:4fc:c644:6149 with SMTP id d9-20020a056402078900b004fcc6446149mr5898422edy.0.1678960348498;
        Thu, 16 Mar 2023 02:52:28 -0700 (PDT)
Message-ID: <dfbcea7e4dc7ae9d1c824a64e85969faa415c7a7.camel@gmail.com>
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Date: Thu, 16 Mar 2023 11:52:26 +0200
In-Reply-To: <4cee4508-7250-9a27-a186-8cc2000dc3ce@suse.com>
References: 
	<ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
	 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
	 <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
	 <966c19e3-d255-db73-9bb4-7abe0a745396@suse.com>
	 <ac357f76-653f-9dbd-dc54-6e31db28de9b@citrix.com>
	 <00fc9016252e656be257671aa5c2c4e102df240a.camel@gmail.com>
	 <4cee4508-7250-9a27-a186-8cc2000dc3ce@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

> >=20
> > Could you please explain what is x86 section asserts?
>=20
> If you look at the bottom of x86's xen.lds.S you'll find a number of
> assertions, among them one towards .got being empty. Some of the
> sections checked there may indeed not be applicable on arbitrary
> architectures, but I think .got is sufficiently universal. So I agree
> with Andrew that it may be worthwhile making some of this generic.

I have question about 'SIZEOF(.got.plt) =3D=3D 3 * 8':

#ifndef EFI
ASSERT(!SIZEOF(.got),      ".got non-empty")
/*
 * At least GNU ld 2.30 and earlier fail to discard the generic part of
 * .got.plt when no actual entries were allocated. Permit this case
alongside
 * the section being empty.
 */
ASSERT(!SIZEOF(.got.plt) || SIZEOF(.got.plt) =3D=3D 3 * 8,
       "unexpected .got.plt size")
ASSERT(!SIZEOF(.igot.plt), ".igot.plt non-empty")
ASSERT(!SIZEOF(.iplt),     ".iplt non-empty")
ASSERT(!SIZEOF(.plt),      ".plt non-empty")
ASSERT(!SIZEOF(.rela),     "leftover relocations")
#endif

I assume that the check 'SIZEOF(.got.plt) =3D=3D 3 * 8' was added to verify
the case when no real entries in .got.plt are needed but .got.plt still
has 3 entries.

I commented the code where got entries are produced now:
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -20,6 +20,7 @@ ENTRY(start)
         csrc    CSR_SSTATUS, t0
=20
         /* Clear the BSS */
+/*
         la      t3, __bss_start
         la      t4, __bss_end
 .L_clear_bss:
@@ -30,5 +31,6 @@ ENTRY(start)
         la     sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
+*/
=20
         tail    start_xen

And I can't see .got.plt with 3 entries:
  $ riscv64-linux-gnu-objdump -x xen/xen-syms | grep -i got

What am I doing wrong? Or my understanding of the idea of the check is
wrong?

And I assume that add !SIZEOF(.got) and !SIZEOF(.got.plt) would be
enough to RISC-V's xen.lds.S?

~ Oleksii



