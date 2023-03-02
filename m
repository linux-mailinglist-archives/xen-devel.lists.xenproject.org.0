Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 132CD6A878D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 18:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505282.777958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXmSV-00029n-L9; Thu, 02 Mar 2023 17:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505282.777958; Thu, 02 Mar 2023 17:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXmSV-00027C-IW; Thu, 02 Mar 2023 17:11:11 +0000
Received: by outflank-mailman (input) for mailman id 505282;
 Thu, 02 Mar 2023 17:11:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXmSU-000276-Bv
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 17:11:10 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 389e41a1-b91d-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 18:11:07 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id bi9so186901lfb.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 09:11:07 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 w9-20020ac254a9000000b004d580823c25sm3854lfk.11.2023.03.02.09.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 09:11:06 -0800 (PST)
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
X-Inumbo-ID: 389e41a1-b91d-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677777067;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bSzvFO2SBzlMBOkDqHUkkdIk6AHv4frvYBnwZxrZavc=;
        b=YKxMtQUfwmSJ0NQ0Hh4/iRO3pCd6Vnj8+jlk2ygJNMzQr4uPdbzLoEnji0qPYjfpAm
         D1/UqzmA664qxjkJR11qBvOUpsIq4ycg6uyWl4gEuGgN6kKmxWBw8LsyidHD/j5QeP9J
         H5SGASrclDSFkpWZPefrgKqUyc8Fp7x+/5FsKjspy+W1OD9efut5U14umBLD0B5vRILc
         zTmHKWgaHoMvDS+I9Ow9FJPMCLJJvMN7HbuuDXvVbnfcWFrHe1kghi9sanIe4FJb0Y/q
         Y1NwlvLpt3cAmmdtbRyOHoye1Z6wr6TtFdUoWwyDCQxG7Fjsr3rz0j2M2ER4zsZKMKW4
         T3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677777067;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bSzvFO2SBzlMBOkDqHUkkdIk6AHv4frvYBnwZxrZavc=;
        b=gOQ/LHQSm0RzBAjXPTVO4fY+vjEzonMg5zk32swvkzkeG3Bmnz2fbKmtwcStlaYzcz
         bf1VOddqkRgA9KmePhorOxotpLt2CrEgr9A5ANu3qXliV6Yhv5S59TubL++aN0wfVawX
         gZdow1RSnhV5zndh/Ibz9Q0K+2POsSLgH4oxx8bP/+KSJjvR+haYacCgS5n4TBd6YqqA
         QodNK87kIVMXEPALCYY3XwKKmTSCyl+TRixAstH903ODyXkfwlZkGwhNiWBoDFUFR1QU
         MBsRe53dqCjkyFFX/EWaZenPeM4ZsmF7r8zjjyUNBeOquqp684QFupSUvyo3Lb9Q+B9v
         InAQ==
X-Gm-Message-State: AO0yUKXEk5FZaE9+RQuxVTjItt6wwXSAx/Rzz9X12hE9wyqXp9YEGakf
	PvtKDYULHzvBIHbR5uTW7Mo=
X-Google-Smtp-Source: AK7set8+BipN7Cxu+YqU431qNWaB+8ydwYpUeTWiLG11VVHx/Bf9Y+5my9lP/6+KcplRCVKCrhFglw==
X-Received: by 2002:ac2:592b:0:b0:4e3:448:c000 with SMTP id v11-20020ac2592b000000b004e30448c000mr2497348lfi.33.1677777066844;
        Thu, 02 Mar 2023 09:11:06 -0800 (PST)
Message-ID: <2fa25d4c190e96991987cbf360a7e1a832434130.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] xen/riscv: disable fpu
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Thu, 02 Mar 2023 19:11:04 +0200
In-Reply-To: <7f3703a2-83a6-6fad-041c-f2b3df0253df@citrix.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
	 <f9bed949656462e9eb9554dc5e0dcccdd722b9cd.1677762812.git.oleksii.kurochko@gmail.com>
	 <7f3703a2-83a6-6fad-041c-f2b3df0253df@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-03-02 at 14:20 +0000, Andrew Cooper wrote:
> On 02/03/2023 1:23 pm, Oleksii Kurochko wrote:
> > Disable FPU to detect illegal usage of floating point in kernel
> > space.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes since v1:
> > =C2=A0* Rebase on top of two previous patches.
> > ---
>=20
> Apologies - I meant to ask these on the previous series, but didn't
> get
> around to it.
>=20
> Why do we disable interrupts at the very start of start(), but only
> disable the FPU at the start of C ?
I decided to do at the start of start_xen() as it's the first C
function and before that there is only assembler where we can control
not to use FPU.

But to be 100% sure we can move to the start() function.
Could you please share your thoughts about?
>=20
> To start with, doesn't OpenSBI have a starting ABI spec?=C2=A0 What does
> that
> say on the matter of the enablement of these features on entry into
> the
> environment?
I tried to find specific OpenSBI ABI spec before and, unfortunately, i
didn't find any. Only docs in their repo:
https://github.com/riscv-software-src/opensbi/blob/master/docs/firmware/fw.=
md
My expactation was that such information should be part of RISC-V
SBI/ABI which OpenSBI implements but it is mentioned only SBI functions
that should be implemented.

I look at OpenSBI code and it looks like it disables interrupts before
jump to hypervisor:
https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_hart.=
c#L805
But it doesn't do anything with FPU.

Thereby I can't be sure that it's mandatory or not for OpenSBI to
disable/enable interrupts, FPU and so on.

If you have or saw the OpenSBI starting ABI please let me know.

>=20
> Either way, my gut feeling is that these disables (if necessary to
> begin
> with) should be together, rather than split like this.
>=20
>=20
> That aside, while I can see the value of checking this now, won't we
> have to delete this again in order to allow for context switching a
> vCPUs FPU register state?
Not really.

My expectation that we will have the function similar to:
void cpu_vcpu_fp_init(...)
{
	riscv_regs(vcpu)->sstatus &=3D ~SSTATUS_FS;
	if (riscv_isa_extension_available(riscv_priv(vcpu)->isa, f) ||
	    riscv_isa_extension_available(riscv_priv(vcpu)->isa, d))
		riscv_regs(vcpu)->sstatus |=3D SSTATUS_FS_INITIAL;
	else
		....
	memset(&riscv_priv(vcpu)->fp, 0, sizeof(riscv_priv(vcpu)-
>fp));
}


~ Oleksii

