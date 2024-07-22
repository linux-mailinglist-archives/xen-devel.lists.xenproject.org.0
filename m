Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B193905A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 16:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762029.1172123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtjV-0002mM-8D; Mon, 22 Jul 2024 14:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762029.1172123; Mon, 22 Jul 2024 14:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtjV-0002jx-56; Mon, 22 Jul 2024 14:09:45 +0000
Received: by outflank-mailman (input) for mailman id 762029;
 Mon, 22 Jul 2024 14:09:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urmM=OW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sVtjT-0002jn-JA
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 14:09:43 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09c2a98b-4834-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 16:09:41 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f04c1e58eso1172578e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 07:09:41 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52efe29c066sm745236e87.183.2024.07.22.07.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 07:09:40 -0700 (PDT)
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
X-Inumbo-ID: 09c2a98b-4834-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721657381; x=1722262181; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uD9EuaW0GWOnxqh2AFy2RrKGdjrHNnxxMsowt9f4MJU=;
        b=AIA+NKHOoqbCoKv7CkMJvX1OawzCBgyEhPflJpo68MxisjvyywIlaGUwAPhwy1o2GP
         ZTzShWcaXUNCAETAKrGuRvk2nyeCqWT5GsfFv3ajTnjuS7BNgASjmtMDenKVriANK7uQ
         JDqt9MYoulvzFB/QpydS+oo7ygIqRGXb9gFf5c6bGLv6hpnQki3pCs4h/ISlCL7CrJOs
         H6Wc7bxiybHTYLaFEacnDfcdfqkt+ySxcR2VzVfYt+HzxuEeEwUKVS6jvFFXZz6DcF2l
         f/lNbTXpBXCZUuPwn5raMgaMCgUYW54rwPAhC+KqFcIlxRLu8+AG+sK1OBFW4A5l9Dkd
         Mvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721657381; x=1722262181;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uD9EuaW0GWOnxqh2AFy2RrKGdjrHNnxxMsowt9f4MJU=;
        b=gsoU71aijgr63R/iWQ517s9WXJk7wsZNErYCMQ0h0ERs/ERvn02Ql+2DNPmcBGC9Dz
         CBpOdRna3T3sZNojIbNQdQLgLnZJajJF9YxX1pQ6Wx66GuOLq6VaGfcWqMUaMMYrj5sm
         zaxUxz0ozSwpNNe16oOTIR2nOQi1LgVi61hDmEDY+6OGbVTZkXtPN8xNxNnFim6auBk5
         ivEeqYs7CANk1dAa4XZxcC/PIBW83ugugwslRzinKxza2P1AXoVqj1wCtyOig8BoPcmw
         p8wdaYWy3GBBM15LlMd6xktNbSM5oM64SCa/ZqaC6ogJ9lLqywihv2WliFEgIVNwUp5p
         +XnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGvBoxtDhl4KS3c7WnIq4PrGBGXDwvdjmc9C97WJkdS+tynDkCKkEFE3nKrPalWlEaF6Nj5LKoB72eNoB5Brh8l0Re+Bmyz3UNyFrOUR8=
X-Gm-Message-State: AOJu0Yz7NS/82QKBcULSaf4Hv0VKCXi6gl4lNmv8q8xEUUPiZw4UCvvJ
	6JtWu+C8l7jfDmb+n7LxgcJZIOZ+9LI9GqXTa3CEwuor2iBNEeYp
X-Google-Smtp-Source: AGHT+IHNkAe97Gvcm0YjnJGtqS/EDZ03QvDZ0XF0D6DS7RNTksLh3Hd9KnSNMWwz6P4NX0D1p1vAqQ==
X-Received: by 2002:ac2:4bc2:0:b0:52e:8071:e89d with SMTP id 2adb3069b0e04-52efb7aed7dmr6207884e87.40.1721657380545;
        Mon, 22 Jul 2024 07:09:40 -0700 (PDT)
Message-ID: <16b92dc23daf98d2c55ab42f0d941d9b8888064e.camel@gmail.com>
Subject: Re: [PATCH v10 4/5] xen/riscv: enable GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2024 16:09:39 +0200
In-Reply-To: <5e3be451-188f-4092-a84e-1c40a5ad6b44@suse.com>
References: <cover.1720799487.git.oleksii.kurochko@gmail.com>
	 <c2bbbe2ac9f41c19f746418df324212b2e4684a5.1720799487.git.oleksii.kurochko@gmail.com>
	 <5e3be451-188f-4092-a84e-1c40a5ad6b44@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-22 at 13:02 +0200, Jan Beulich wrote:
> On 12.07.2024 18:18, Oleksii Kurochko wrote:
> > To have working BUG(), WARN(), ASSERT, run_in_exception_handler()
> > it is needed to enable GENERIC_BUG_FRAME.
> >=20
> > Also, <xen/lib.h> is needed to be included for the reason that
> > panic() and
> > printk() are used in common/bug.c and RISC-V fails if it is not
> > included
> > with the following errors:
> > =C2=A0=C2=A0 common/bug.c:69:9: error: implicit declaration of function
> > 'printk'
> > =C2=A0=C2=A0 [-Werror=3Dimplicit-function-declaration]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 69 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 printk("Xen WARN at %s%s:%d\n", prefix,
> > filename,
> > =C2=A0=C2=A0 lineno);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~
> > =C2=A0=C2=A0 common/bug.c:77:9: error: implicit declaration of function
> > 'panic'
> > =C2=A0=C2=A0 [-Werror=3Dimplicit-function-declaration]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 77 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 panic("Xen BUG at %s%s:%d\n", prefix, filename,
> > =C2=A0=C2=A0 lineno);
>=20
> I don't think the diagnostics themselves are needed here.
>=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V10:
> > =C2=A0- put 'select GENERIC_BUG_FRAME' in "Config RISCV".
> > =C2=A0- rework do_trap() to not fetch an instruction in case when the
> > cause of trap
> > =C2=A0=C2=A0 is BUG_insn.
>=20
> It's BUG_insn here, but then ...
>=20
> > @@ -103,7 +104,29 @@ static void do_unexpected_trap(const struct
> > cpu_user_regs *regs)
> > =C2=A0
> > =C2=A0void do_trap(struct cpu_user_regs *cpu_regs)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 do_unexpected_trap(cpu_regs);
> > +=C2=A0=C2=A0=C2=A0 register_t pc =3D cpu_regs->sepc;
> > +=C2=A0=C2=A0=C2=A0 unsigned long cause =3D csr_read(CSR_SCAUSE);
> > +
> > +=C2=A0=C2=A0=C2=A0 switch ( cause )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 case CAUSE_BREAKPOINT:
>=20
> ... BREAKPOINT here? Generally I'd deem something named "breakpoint"
> as
> debugging related (and hence continuable). I'd have expected
> CAUSE_ILLEGAL_INSTRUCTION here, but likely I'm missing something.
Agree, that is is confusing, but BUG_insn is defined as ebreak
instruction ( Linux kernel uses also ebreak ) and it generates
CAUSE_BREAKPOINT.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( do_bug_frame(cpu_regs,=
 pc) >=3D 0 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
( !pc ||
>=20
> In how far does this really need special casing? Isn't that case
> covered by
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(is_kernel_text(pc + 1) || is_kernel_inittext(=
pc
> > + 1)) )
>=20
> ... these checks anyway?
Good point. We could drop it.

> And btw, why the "+ 1" in both function arguments?
There is no need for them anymore, just missed to drop +1.

~ Oleksii

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 printk("Something wrong with PC: 0x%lx\n", pc);
>=20
> Nit: %#lx please in situations like this.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 die();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu=
_regs->sepc +=3D GET_INSN_LENGTH(*(uint16_t *)pc);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn;
>=20
> This isn't needed, is it? You'd return anyway by ...
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>=20
> .... going through here to ...
>=20
> > +=C2=A0=C2=A0=C2=A0 default:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_unexpected_trap(cpu_regs=
);
> > +=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
>=20
> ... here.
>=20
> Two further nits for the default case: Please have a break statement
> there as well, and please have a blank line immediately up from it.
>=20
> Jan


