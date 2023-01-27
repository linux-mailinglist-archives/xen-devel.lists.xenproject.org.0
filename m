Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C406367E7ED
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:15:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485678.753076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPVR-0003ck-6Z; Fri, 27 Jan 2023 14:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485678.753076; Fri, 27 Jan 2023 14:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPVR-0003aW-2X; Fri, 27 Jan 2023 14:15:05 +0000
Received: by outflank-mailman (input) for mailman id 485678;
 Fri, 27 Jan 2023 14:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPVP-0003aQ-Pb
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 14:15:03 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd35090b-9e4c-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 15:15:02 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id h16so5061853wrz.12
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 06:15:02 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 j5-20020adff005000000b002bddd75a83fsm4133579wro.8.2023.01.27.06.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:15:00 -0800 (PST)
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
X-Inumbo-ID: fd35090b-9e4c-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Q86dD1lo7VUFB+GozTLUzEN5VfEloh1zuvqKw45joo=;
        b=dRuwMasfnpkREPWr/1vr9i22DPJ3orpn4yaox5lPwZUiPzFz1Z6fA4ZiHrZ/NHkjyo
         O33gsx9SuSn1WzIwgqiMN2jhu0skJhU3bO0wEcS9Hu6cNF+xSz2DscrdWcJSk9lL9INU
         Po0AZO0W3NF3riTMK8lWDdbit3iaSzF3wsCU6LHr1kfiIKvYiaX4/QtvB5g619aCVKKU
         iYdSr1zsmC6xYSxBAJW42NDNhhh+FxBHs8JUbzAXZtMMNxsjX4wp2hn1GmJCVUtL/bCJ
         aUg9luJoIwqfhLdAgC5n/8qDkmSzekjFAvkZidiQ/kq9/c3X9Fbjdmmi0Jqil5CtCWV7
         nk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Q86dD1lo7VUFB+GozTLUzEN5VfEloh1zuvqKw45joo=;
        b=AnYY2y3w6fzuFTDZ4ddHS+xReuXKxRIX8XYtJWqd0RKP3TwCRvJzohmZv3ozw8iOBx
         tDrP1K7eLfBsDcBFc3Y4L/RCWFESmN729JsCgrJFLLaSRAb6/C4LaUu+0TylwVWcKQLq
         jGsOdg/kNVscxhIcuqy9cAOG1LKcothdlBUAnTfExVuXSDaiBhVwhSH/3f8XqnVz50Mr
         xsW8698N1JmlCAsAQTtffMWHsdUmcQT0MIN/fhWB/q0bfcf9Xb4/yYDHdqPCfos8tO8T
         7Ur/S2cu5Md2RbVzJTT6naFg4PMD/OyzIP6tDLNB3yaWuP0I0+uTYA2/lWiBPWKV9Ac2
         L2zQ==
X-Gm-Message-State: AFqh2krNjbHU2ohlk5cNroLtadkDEPIIdcjCFsSTmKRvu7hs3VQfVBJq
	m8WlfZq3NiHoVS+q3LyNNdFUrUgJyDw=
X-Google-Smtp-Source: AMrXdXscQG8kEGMr7Y1AsjJdJ3mhDuCiYu3+zdW3CsKbfJhZ//tAD/a8rfa3vsb3LaZsUMLkve96Ew==
X-Received: by 2002:a05:6000:1f14:b0:2ac:5b46:9c85 with SMTP id bv20-20020a0560001f1400b002ac5b469c85mr34231516wrb.68.1674828901396;
        Fri, 27 Jan 2023 06:15:01 -0800 (PST)
Message-ID: <f5cd1bfb116bfcc86fc2848df7eead05cd1a24c0.camel@gmail.com>
Subject: Re: [PATCH v7 1/2] xen/riscv: introduce early_printk basic stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Gianluca
 Guida <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,  Connor Davis
 <connojdavis@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
Date: Fri, 27 Jan 2023 16:15:00 +0200
In-Reply-To: <06c2c36bd68b2534c757dc4087476e855253680a.1674819203.git.oleksii.kurochko@gmail.com>
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
	 <06c2c36bd68b2534c757dc4087476e855253680a.1674819203.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Alistair, Bobby and community,

I would like to ask your help with the following check:
+/*
+ * early_*() can be called from head.S with MMU-off.
+ *
+ * The following requiremets should be honoured for early_*() to
+ * work correctly:
+ *    It should use PC-relative addressing for accessing symbols.
+ *    To achieve that GCC cmodel=3Dmedany should be used.
+ */
+#ifndef __riscv_cmodel_medany
+#error "early_*() can be called from head.S with MMU-off"
+#endif

Please take a look at the following messages and help me to decide if
the check mentioned above should be in early_printk.c or not:
[1]
https://lore.kernel.org/xen-devel/599792fa-b08c-0b1e-10c1-0451519d9e4a@xen.=
org/
[2]
https://lore.kernel.org/xen-devel/0ec33871-96fa-bd9f-eb1b-eb37d3d7c982@xen.=
org/

Thanks in advance.

~ Oleksii

On Fri, 2023-01-27 at 13:39 +0200, Oleksii Kurochko wrote:
> Because printk() relies on a serial driver (like the ns16550 driver)
> and drivers require working virtual memory (ioremap()) there is not
> print functionality early in Xen boot.
>=20
> The patch introduces the basic stuff of early_printk functionality
> which will be enough to print 'hello from C environment".
>=20
> Originally early_printk.{c,h} was introduced by Bobby Eshleman
> (
> https://github.com/glg-rv/xen/commit/a3c9916bbdff7ad6030055bbee7e53d1a
> ab71384)
> but some functionality was changed:
> early_printk() function was changed in comparison with the original
> as
> common isn't being built now so there is no vscnprintf.
>=20
> This commit adds early printk implementation built on the putc SBI
> call.
>=20
> As sbi_console_putchar() is already being planned for deprecation
> it is used temporarily now and will be removed or reworked after
> real uart will be ready.
>=20
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> ---
> Changes in V7:
> =C2=A0=C2=A0=C2=A0 - Nothing was changed
> ---
> Changes in V6:
> =C2=A0=C2=A0=C2=A0 - Remove __riscv_cmodel_medany check from early_printk=
.c
> ---
> Changes in V5:
> =C2=A0=C2=A0=C2=A0 - Code style fixes
> =C2=A0=C2=A0=C2=A0 - Change an error message of #error in case of
> __riscv_cmodel_medany
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isn't defined
> ---
> Changes in V4:
> =C2=A0=C2=A0=C2=A0 - Remove "depends on RISCV*" from Kconfig.debug as it =
is located
> in
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch specific folder so by default RISCV c=
onfigs should be
> ebabled.
> =C2=A0=C2=A0=C2=A0 - Add "ifdef __riscv_cmodel_medany" to be sure that PC=
-relative
> addressing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is used as early_*() functions can be call=
ed from head.S with
> MMU-off and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 before relocation (if it would be needed a=
t all for RISC-V)
> =C2=A0=C2=A0=C2=A0 - fix code style
> ---
> Changes in V3:
> =C2=A0=C2=A0=C2=A0 - reorder headers in alphabetical order
> =C2=A0=C2=A0=C2=A0 - merge changes related to start_xen() function from "=
[PATCH v2
> 7/8]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen/riscv: print hello message from C env"=
 to this patch
> =C2=A0=C2=A0=C2=A0 - remove unneeded parentheses in definition of STACK_S=
IZE
> ---
> Changes in V2:
> =C2=A0=C2=A0=C2=A0 - introduce STACK_SIZE define.
> =C2=A0=C2=A0=C2=A0 - use consistent padding between instruction mnemonic =
and
> operand(s)
> ---
> =C2=A0xen/arch/riscv/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++
> =C2=A0xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 +
> =C2=A0xen/arch/riscv/early_printk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 33
> +++++++++++++++++++++++
> =C2=A0xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
> =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 +++
> =C2=A05 files changed, 55 insertions(+)
> =C2=A0create mode 100644 xen/arch/riscv/early_printk.c
> =C2=A0create mode 100644 xen/arch/riscv/include/asm/early_printk.h
>=20
> diff --git a/xen/arch/riscv/Kconfig.debug
> b/xen/arch/riscv/Kconfig.debug
> index e69de29bb2..608c9ff832 100644
> --- a/xen/arch/riscv/Kconfig.debug
> +++ b/xen/arch/riscv/Kconfig.debug
> @@ -0,0 +1,5 @@
> +config EARLY_PRINTK
> +=C2=A0=C2=A0=C2=A0 bool "Enable early printk"
> +=C2=A0=C2=A0=C2=A0 default DEBUG
> +=C2=A0=C2=A0=C2=A0 help
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enables early printk debug messages
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index fd916e1004..1a4f1a6015 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,3 +1,4 @@
> +obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
> =C2=A0obj-$(CONFIG_RISCV_64) +=3D riscv64/
> =C2=A0obj-y +=3D sbi.o
> =C2=A0obj-y +=3D setup.o
> diff --git a/xen/arch/riscv/early_printk.c
> b/xen/arch/riscv/early_printk.c
> new file mode 100644
> index 0000000000..b66a11f1bc
> --- /dev/null
> +++ b/xen/arch/riscv/early_printk.c
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RISC-V early printk using SBI
> + *
> + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
> + */
> +#include <asm/early_printk.h>
> +#include <asm/sbi.h>
> +
> +/*
> + * TODO:
> + *=C2=A0=C2=A0 sbi_console_putchar is already planned for deprecation
> + *=C2=A0=C2=A0 so it should be reworked to use UART directly.
> +*/
> +void early_puts(const char *s, size_t nr)
> +{
> +=C2=A0=C2=A0=C2=A0 while ( nr-- > 0 )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( *s =3D=3D '\n' )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sbi_c=
onsole_putchar('\r');
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sbi_console_putchar(*s);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s++;
> +=C2=A0=C2=A0=C2=A0 }
> +}
> +
> +void early_printk(const char *str)
> +{
> +=C2=A0=C2=A0=C2=A0 while ( *str )
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_puts(str, 1);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str++;
> +=C2=A0=C2=A0=C2=A0 }
> +}
> diff --git a/xen/arch/riscv/include/asm/early_printk.h
> b/xen/arch/riscv/include/asm/early_printk.h
> new file mode 100644
> index 0000000000..05106e160d
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/early_printk.h
> @@ -0,0 +1,12 @@
> +#ifndef __EARLY_PRINTK_H__
> +#define __EARLY_PRINTK_H__
> +
> +#include <xen/early_printk.h>
> +
> +#ifdef CONFIG_EARLY_PRINTK
> +void early_printk(const char *str);
> +#else
> +static inline void early_printk(const char *s) {};
> +#endif
> +
> +#endif /* __EARLY_PRINTK_H__ */
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 13e24e2fe1..d09ffe1454 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -1,12 +1,16 @@
> =C2=A0#include <xen/compile.h>
> =C2=A0#include <xen/init.h>
> =C2=A0
> +#include <asm/early_printk.h>
> +
> =C2=A0/* Xen stack for bringing up the first CPU. */
> =C2=A0unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> =C2=A0=C2=A0=C2=A0=C2=A0 __aligned(STACK_SIZE);
> =C2=A0
> =C2=A0void __init noreturn start_xen(void)
> =C2=A0{
> +=C2=A0=C2=A0=C2=A0 early_printk("Hello from C env\n");
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 for ( ;; )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("wfi");
> =C2=A0


