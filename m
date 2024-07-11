Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E6A92E812
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 14:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757423.1166330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRsgZ-0005H0-KH; Thu, 11 Jul 2024 12:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757423.1166330; Thu, 11 Jul 2024 12:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRsgZ-0005FW-Gq; Thu, 11 Jul 2024 12:14:07 +0000
Received: by outflank-mailman (input) for mailman id 757423;
 Thu, 11 Jul 2024 12:14:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRsgY-0005FQ-Ra
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 12:14:06 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10d5c666-3f7f-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 14:14:04 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5956fbe6d0dso1068452a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 05:14:04 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bbe2cca6sm3383825a12.27.2024.07.11.05.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 05:14:03 -0700 (PDT)
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
X-Inumbo-ID: 10d5c666-3f7f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720700044; x=1721304844; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UGKZ91eg88Z+RUeX4tqh8nCPLTT9ggdC7XH32J7xMhA=;
        b=PYbmSUMJ9XCj/pxE/DwwzPOd9CFp6BmjoKwBBrB/lHGEXSeGKXcGNcMauz/lkgIOVJ
         IowDrWhnMPLDQtA3RBEudL+oHHIl+N896HiVREJUsqA5ySga1rrpcpsDH3kXaEX7PN0K
         zulsjc9WQkGI+2S00LE5PbpQCgMyq+n58q2dIDzKtKQye5ZpdvI78VoGSULNjnrAY3aV
         N6M6iiAr+4T8qNvbJmkfuOO8QSN60h8uIHaW3+Rmv3h5GRROxosNJPaz78wWPyfp+rMN
         153mTsl4hiRRgqqA0v8gDTE9NaVrHph2eS1YTyymLbu7vdjZ7l6Fpv1b92W/m/7Svd3c
         f5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720700044; x=1721304844;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UGKZ91eg88Z+RUeX4tqh8nCPLTT9ggdC7XH32J7xMhA=;
        b=mhNs4Atv4tKwngCwLOQg6Mv72mDOqKm6PtmSZVDiIe6dn6kFvOdFkXdD/muIgMpw8y
         Ama6SjFXz98AlAc8zjYDAeognfICHuqIWSZZgIThEu5aNskYyIKO8EWpNI32gV45W2IE
         B9T5BJeMUyFGNK7lf15H8s3ArqN713CHphjwCjXXLgL8m7d9/IXi3Z1RqAVZS0nYdJ9D
         o/Gnrcd5dba9YS9tP3MB/NbYItMynoJelKPQacbRrVRTvqte41IaOcZVyD1nA9wb5qpT
         irx/1pLhlvfq1MZT7w2/bsXpph8tCsiFw4UMDrZVhDJPCtFaiz8CR+qyooIVj53prWw4
         Xd8A==
X-Forwarded-Encrypted: i=1; AJvYcCWu8F7krGyxhwMApbiR3yQe2acydvSCxLjIkrozw84DjyKV8wapR2jJLAK2+zoqaEv4tTWknuhfBNin4F0HDCi3I8qNJ6xwA1I3aycc1aQ=
X-Gm-Message-State: AOJu0YzfzlsK2nkuKRPg8O8MOyMr0ks/Qag0ywvIlPHLXlm4SvTlSrg1
	bT0nAx4R0Q/caVGWNDmEg8XjfBzLI2p7NmJpWyCACSbCWlV1PS7J
X-Google-Smtp-Source: AGHT+IE5m1Nt9eerjZl1cQR1AihhHcuS+k6jo85+Q2ei4YKmYv8Vt4YOlGqBO4k/R2QLwlRgk2bb4w==
X-Received: by 2002:a05:6402:2794:b0:58d:ebf9:4e2b with SMTP id 4fb4d7f45d1cf-594ba98f46bmr5746403a12.2.1720700044121;
        Thu, 11 Jul 2024 05:14:04 -0700 (PDT)
Message-ID: <df82de5d4dcf5224f58d8595ff5ad03429e9cad9.camel@gmail.com>
Subject: Re: [PATCH v9 4/5] xen/riscv: enable GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 14:14:03 +0200
In-Reply-To: <bff4f1e4-9242-4a1c-bbca-ba3d609db03f@suse.com>
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
	 <c51c485bac43b7589961aabec8af1b82d4673b94.1719918148.git.oleksii.kurochko@gmail.com>
	 <ca373d42-22f1-41a2-bdbb-4733145c635a@suse.com>
	 <a1224198ef6845f8f81baaaebe1d436726460c0e.camel@gmail.com>
	 <bff4f1e4-9242-4a1c-bbca-ba3d609db03f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-07-11 at 11:25 +0200, Jan Beulich wrote:
> On 11.07.2024 10:50, Oleksii wrote:
> > On Wed, 2024-07-10 at 12:01 +0200, Jan Beulich wrote:
> > > On 02.07.2024 13:23, Oleksii Kurochko wrote:
> > > > @@ -101,8 +102,38 @@ static void do_unexpected_trap(const
> > > > struct
> > > > cpu_user_regs *regs)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 die();
> > > > =C2=A0}
> > > > =C2=A0
> > > > +static bool is_valid_bug_insn(uint32_t insn)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 return insn =3D=3D BUG_INSN_32 ||
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (insn=
 & COMPRESSED_INSN_MASK) =3D=3D BUG_INSN_16;
> > > > +}
> > > > +
> > > > +/* Should be used only on Xen code */
> > > > +static uint32_t read_instr(unsigned long pc)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 uint16_t instr16 =3D *(uint16_t *)pc;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 ASSERT(is_kernel_text(pc + 1) || is_kernel_init=
text(pc +
> > > > 1));
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( GET_INSN_LENGTH(instr16) =3D=3D 2 )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return instr16;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 ASSERT(is_kernel_text(pc + 3) || is_kernel_init=
text(pc +
> > > > 3));
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return *(uint32_t *)pc;
> > > > +}
> > >=20
> > > Related to the point made further down: If either of these
> > > assertions
> > > fails,
> > > won't we come back again right here? If either of the
> > > is_kernel_*text()
> > > wasn't working quite right, wouldn't we be at risk of entering an
> > > infinite
> > > loop (presumably not quite infinite because of the stack
> > > overflowing
> > > at some
> > > point)?
> > It is really possible to have infinite loop here so it should be
> > better
> > to use 'if' with die() or panic().
> >=20
> > >=20
> > > > =C2=A0void do_trap(struct cpu_user_regs *cpu_regs)
> > > > =C2=A0{
> > > > +=C2=A0=C2=A0=C2=A0 register_t pc =3D cpu_regs->sepc;
> > > > +=C2=A0=C2=A0=C2=A0 uint32_t instr =3D read_instr(pc);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( ( is_valid_bug_insn(instr) ) && (
> > > > do_bug_frame(cpu_regs,
> > > > pc) >=3D 0 ) )
> > >=20
> > > No consideration of the kind of exception? I'd expect it is one
> > > very
> > > specific one which the BUG insn would raise, and then there's no
> > > point
> > > fetching the insn when it's a different kind of exception.
> > Good point.
> >=20
> > We should have 0x3 ( breakpoint exception ) in scause register. We
> > can
> > just check that without reading instruction and then also
> > is_valid_bug_insn could be dropped too.
>=20
> Just that then you'll also lose the is_kernel_*text() checking, which
> I
> understand is there to remind you/us that one this becomes reachable
> from non-Xen code, adjustments are going to be needed.
One thing I wrote incorrectly is that we still need fetch instruction
or at least 16 bits to identify the length of instruction to set proper
sepc:
    cpu_regs->sepc +=3D GET_INSN_LENGTH(instr);

We could write that in the following way:
    cpu_regs->sepc +=3D GET_INSN_LENGTH(*(uint16_t *)pc);
Would it be okay?

~ Oleksii

