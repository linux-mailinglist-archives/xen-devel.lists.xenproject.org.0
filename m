Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A6E9392EC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 19:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762249.1172384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwPc-00012V-BZ; Mon, 22 Jul 2024 17:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762249.1172384; Mon, 22 Jul 2024 17:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwPc-000100-8x; Mon, 22 Jul 2024 17:01:24 +0000
Received: by outflank-mailman (input) for mailman id 762249;
 Mon, 22 Jul 2024 17:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urmM=OW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sVwPb-0000zu-2e
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 17:01:23 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05854914-484c-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 19:01:22 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f04c1e58eso1529266e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 10:01:21 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52efdacbbb2sm838850e87.241.2024.07.22.10.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 10:01:20 -0700 (PDT)
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
X-Inumbo-ID: 05854914-484c-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721667681; x=1722272481; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pgATQk2RRZl11Zip1xX50dLuhMwYx30qrTrEnVuZ9PE=;
        b=mIIcT5EAr9Y1VFAv9VjIGhUl1wZkYDinUyZbA8ACDjquBwULgKjCPFwi+M449TQvXO
         paeOZ6E3Ci1BiQ+X9+sl5pS/bget3MGGaSFgHYq4vnC35U7YS6MOfk3QEHtgEbMgH8Yb
         hF2WNR4Jj2G0kI5GRATSx0mrmh/AdPLX4gxQ3WmY98seMIDK1wIw+6p39nfluUiPjxb2
         SE+QBTN8jE0fdKQsGk8rDmXGYusA/7MXDOsfT4xppzSfrefUrYxnDok0UvYteVt0bjr0
         IoMwNOfxR2/DgBQUUfmeO180Uw0XhPNqLGKBwNYAriMjIAYZHsX9oU7xsegJCW5EQhSX
         VQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721667681; x=1722272481;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgATQk2RRZl11Zip1xX50dLuhMwYx30qrTrEnVuZ9PE=;
        b=iWySQMQ9BLn6F2l+fLcPeV9Swwls71UGOem+n3AX6TapoNXc3ktQFrdOQYoJ+76Izp
         JbosvPZVemn6UIfavA+GJFy6SwbCojaxbd+UJaXwBX+LGN1CjeGBDt8U+SVxKZhnrdti
         XTsI/ZC+pc5AHOb4oacge1ev+CNG/atebYgqqqSGAmE92DpipV2ZCKEnfweH44E98nhf
         sfIqtM1Lqq4oJZNmt7Q9I5YQh2coIXTPjCID7ksOwefuMEAKGKnBo0BtiBAcARBpqpfi
         dTNd2tfeITdBjldYVbElti/paqcI0JHnuqr9wf4TkO26rPPPdbEt+8o9d9nv1W9B3Els
         uvCg==
X-Forwarded-Encrypted: i=1; AJvYcCVXyLc/p7vhfEBeXuo1KQKdPTc3AYF0/FRupztOS+rxU/+hKJj67iSp0gwetlWwX2a05gJJUbeluUaIS6nfbXWXMdBUeH1deKWVF2RvFQI=
X-Gm-Message-State: AOJu0YzKHFhDK22L8hgPr7JTqfIb14a/2hLrSycI+LyjHKRfcJCAx/0t
	Fc2/Rh0Zo0IB8t/Beu9fQZZZbcFfcKAg03GcijDVSGYOItbJ2vw9
X-Google-Smtp-Source: AGHT+IHV/wRrpLRvih3Xn/ddxdkxUQeJXQQf2yy73784W0tHKwuKTmn7SDUu01zY2EUvpEA2QF4Ywg==
X-Received: by 2002:a05:6512:32c5:b0:52e:936e:a237 with SMTP id 2adb3069b0e04-52efb53bd95mr6087784e87.16.1721667681131;
        Mon, 22 Jul 2024 10:01:21 -0700 (PDT)
Message-ID: <d8ec7934eacbc2c621c715b4dc8e08c23905e5a3.camel@gmail.com>
Subject: Re: [PATCH v10 4/5] xen/riscv: enable GENERIC_BUG_FRAME
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2024 19:01:20 +0200
In-Reply-To: <6036a48e-f2ae-4629-ba73-2c78f46234fb@suse.com>
References: <cover.1720799487.git.oleksii.kurochko@gmail.com>
	 <c2bbbe2ac9f41c19f746418df324212b2e4684a5.1720799487.git.oleksii.kurochko@gmail.com>
	 <5e3be451-188f-4092-a84e-1c40a5ad6b44@suse.com>
	 <16b92dc23daf98d2c55ab42f0d941d9b8888064e.camel@gmail.com>
	 <6036a48e-f2ae-4629-ba73-2c78f46234fb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-22 at 17:32 +0200, Jan Beulich wrote:
> On 22.07.2024 16:09, Oleksii wrote:
> > On Mon, 2024-07-22 at 13:02 +0200, Jan Beulich wrote:
> > > On 12.07.2024 18:18, Oleksii Kurochko wrote:
> > > > ---
> > > > Changes in V10:
> > > > =C2=A0- put 'select GENERIC_BUG_FRAME' in "Config RISCV".
> > > > =C2=A0- rework do_trap() to not fetch an instruction in case when
> > > > the
> > > > cause of trap
> > > > =C2=A0=C2=A0 is BUG_insn.
> > >=20
> > > It's BUG_insn here, but then ...
> > >=20
> > > > @@ -103,7 +104,29 @@ static void do_unexpected_trap(const
> > > > struct
> > > > cpu_user_regs *regs)
> > > > =C2=A0
> > > > =C2=A0void do_trap(struct cpu_user_regs *cpu_regs)
> > > > =C2=A0{
> > > > -=C2=A0=C2=A0=C2=A0 do_unexpected_trap(cpu_regs);
> > > > +=C2=A0=C2=A0=C2=A0 register_t pc =3D cpu_regs->sepc;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long cause =3D csr_read(CSR_SCAUSE);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 switch ( cause )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0 case CAUSE_BREAKPOINT:
> > >=20
> > > ... BREAKPOINT here? Generally I'd deem something named
> > > "breakpoint"
> > > as
> > > debugging related (and hence continuable). I'd have expected
> > > CAUSE_ILLEGAL_INSTRUCTION here, but likely I'm missing something.
> > Agree, that is is confusing, but BUG_insn is defined as ebreak
> > instruction ( Linux kernel uses also ebreak ) and it generates
> > CAUSE_BREAKPOINT.
>=20
> I'm curious: How do you / does a debugger tell a breakpoint set on
> such an EBREAK insn (e.g. as a result of a use of WARN_ON()) from
> the original, unmodified insn? If there's a breakpoint, you want
> to forward to the debugger. Whereas if there's no breakpoint, you
> want to process the WARN_ON() normally.
I don't know details of debug spec but AFAIU ebreak triggers a debug
trap, which starts in debug mode and is then filtered by every mode as
it goes towards user-mode. So first GDB will handle this debug trap and
will check if this ebreak was set by him or not.

~ Oleksii

