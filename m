Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F192B6C4949
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 12:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513357.794221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pewig-0003z9-Ad; Wed, 22 Mar 2023 11:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513357.794221; Wed, 22 Mar 2023 11:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pewig-0003vw-7U; Wed, 22 Mar 2023 11:33:30 +0000
Received: by outflank-mailman (input) for mailman id 513357;
 Wed, 22 Mar 2023 11:33:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pewie-0003va-Jp
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 11:33:28 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b16e145-c8a5-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 12:33:25 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id i9so16668678wrp.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 04:33:24 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 e8-20020adffc48000000b002c8476dde7asm13576014wrs.114.2023.03.22.04.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 04:33:23 -0700 (PDT)
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
X-Inumbo-ID: 5b16e145-c8a5-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679484804;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zlfks0r1DSnLqCRS1mu2UoutTm79n3LdvTpNmxsqVmE=;
        b=Lg9xFbFJBzRb8avraQBjIRurKChV+wEweB4XPxxWpKXimxZ84TGkxkdR+emIGN5IqW
         pE0Ki8eBFmjuhxyemNOqTW1NfvjEL/GJ36FwIT1ufPgD/5Hzn67SIoUNRe57cJOLf64o
         PMuqqo3Yj1MCuiL9ZfI1bxQ6gZnaU+8q/qyqKKyK2MxtsQYQ+GkzZaOhWDKmmOPDs1ez
         9pP70mQrUsXNo90D88zLDB83gQG5Ewzh4d70IPqJZrefHoIl3ilx50ALBKveaqLDkKAF
         VhUDGniHiMznVzq1MF5gBkfpFuEjk/0TRD0EYDTdqAIcAeYsehdqnOcz0f4u4nDOHcNz
         ZxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679484804;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zlfks0r1DSnLqCRS1mu2UoutTm79n3LdvTpNmxsqVmE=;
        b=sAoNYltnw3zpVURw7HKS9RBuOWSTnJTxes8uozogVsmGSdA87Er6DH5ReHP2sNcOiq
         gEWMnyHzwAfTAlfUHCTzk9tX+GM3cER7lcgMmj3MLa9be38ByQXng+i2xM+w0lLpUTfh
         OlTHSGp11tUm5LWlXTGz7ei6wZ/kGAFs4hU7B32tkXUd5khN5hi1/2DLREMFR0mZxtuJ
         eu7H7XTuOK9kfSYQtdEF8Z49KqLW+2rdtITEzG8GrIFd4kCjAW5FqEYULR8pTDshNJ/2
         vqUr2VmaLocyJDPcspnYtElDeeF11Aa2TIDNJssK0qYxGmndYzl5ZFaWosyjMEXXi17k
         6ptQ==
X-Gm-Message-State: AO0yUKW8ybf6iuW0NFmjuS9YahVHGt0v+uu5DytgqhHZfoR4f1UuWacx
	RvD8mxLNv0HU+ufrXUccFUM=
X-Google-Smtp-Source: AK7set/O2hC3ujToRHG9N5B7ho4b4quZdHS7o98CQiuukPhlHAlPc8ab5grA4noaHRpe5ebDfKDjiA==
X-Received: by 2002:adf:ea86:0:b0:2c9:23c4:8f93 with SMTP id s6-20020adfea86000000b002c923c48f93mr4900591wrm.57.1679484803684;
        Wed, 22 Mar 2023 04:33:23 -0700 (PDT)
Message-ID: <520d64f0b6cd283416aa4fb7b9baa5f83454c4a8.camel@gmail.com>
Subject: Re: [PATCH v5 5/7] xen/riscv: introduce trap_init()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Wed, 22 Mar 2023 13:33:22 +0200
In-Reply-To: <5a2c6f35-373a-de3c-1db2-aeeb1b39635f@xen.org>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
	 <91b0284d20f530f2795a119ccb7436ee0b800256.1678976127.git.oleksii.kurochko@gmail.com>
	 <5a2c6f35-373a-de3c-1db2-aeeb1b39635f@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Tue, 2023-03-21 at 17:42 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 16/03/2023 14:39, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > Changes in V5:
> > =C2=A0=C2=A0 - Nothing changed
> > ---
> > Changes in V4:
> > =C2=A0=C2=A0 - Nothing changed
> > ---
> > Changes in V3:
> > =C2=A0=C2=A0 - Nothing changed
> > ---
> > Changes in V2:
> > =C2=A0=C2=A0 - Rename setup_trap_handler() to trap_init().
> > =C2=A0=C2=A0 - Add Reviewed-by to the commit message.
> > ---
> > =C2=A0 xen/arch/riscv/include/asm/traps.h | 1 +
> > =C2=A0 xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++++
> > =C2=A0 xen/arch/riscv/traps.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++++
> > =C2=A0 3 files changed, 13 insertions(+)
> >=20
> > diff --git a/xen/arch/riscv/include/asm/traps.h
> > b/xen/arch/riscv/include/asm/traps.h
> > index f3fb6b25d1..f1879294ef 100644
> > --- a/xen/arch/riscv/include/asm/traps.h
> > +++ b/xen/arch/riscv/include/asm/traps.h
> > @@ -7,6 +7,7 @@
> > =C2=A0=20
> > =C2=A0 void do_trap(struct cpu_user_regs *cpu_regs);
> > =C2=A0 void handle_trap(void);
> > +void trap_init(void);
> > =C2=A0=20
> > =C2=A0 #endif /* __ASSEMBLY__ */
> > =C2=A0=20
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > index 36556eb779..b44d105b5f 100644
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -3,7 +3,9 @@
> > =C2=A0 #include <xen/kernel.h>
> > =C2=A0=20
> > =C2=A0 #include <asm/boot-info.h>
> > +#include <asm/csr.h>
> > =C2=A0 #include <asm/early_printk.h>
> > +#include <asm/traps.h>
> > =C2=A0=20
> > =C2=A0 /* Xen stack for bringing up the first CPU. */
> > =C2=A0 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> > @@ -32,7 +34,10 @@ void __init noreturn start_xen(unsigned long
> > bootcpu_id,
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fill_boot_info();
> > =C2=A0=20
> > +=C2=A0=C2=A0=C2=A0 trap_init();
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("All set up\n");
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( ;; )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("w=
fi");
> > =C2=A0=20
> > diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> > index 8a1529e0c5..581f34efbc 100644
> > --- a/xen/arch/riscv/traps.c
> > +++ b/xen/arch/riscv/traps.c
> > @@ -13,6 +13,13 @@
> > =C2=A0 #include <asm/processor.h>
> > =C2=A0 #include <asm/traps.h>
> > =C2=A0=20
> > +void trap_init(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned long addr =3D (unsigned long)&handle_trap;
>=20
> It is not super clear to me whether this is going to store the
> virtual=20
> or physical address.
Actually it is going to store both the virtual and physical address.
Depending on if MMU is enabled or not.
>=20
> Depending on the answer, the next would be whether the value would
> still=20
> be valid after the MMU is turned on?
It would still be valid because for addr will be generated PC-relative
address.
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 csr_write(CSR_STVEC, addr);
> > +}
> > +
> > =C2=A0 static const char *decode_trap_cause(unsigned long cause)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static const char *const trap_causes[] =
=3D {
>=20
> Cheers,
>=20
> ~ Oleksii


