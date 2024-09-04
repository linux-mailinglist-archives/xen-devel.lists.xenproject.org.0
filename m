Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A16896B843
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790028.1199718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sln9r-000393-5L; Wed, 04 Sep 2024 10:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790028.1199718; Wed, 04 Sep 2024 10:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sln9r-00037y-1p; Wed, 04 Sep 2024 10:22:39 +0000
Received: by outflank-mailman (input) for mailman id 790028;
 Wed, 04 Sep 2024 10:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JixD=QC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sln9o-00037r-TW
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:22:36 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ab5cc34-6aa7-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 12:22:36 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f3f0bdbcd9so7811841fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:22:36 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614f007b5sm25463871fa.43.2024.09.04.03.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 03:22:34 -0700 (PDT)
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
X-Inumbo-ID: 9ab5cc34-6aa7-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725445355; x=1726050155; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ot6ekhaqzJ13RE6X5Mq04W0grM9ygIRT6z3DWVbfh3s=;
        b=IUyG77vyT8i4y49MYPdAnb+JglP9kS+q3sLLdHiyhp36C3RwV0Ce4ERHDrMZjeyhQm
         9MsrdZc+DTy6p/a8DRDevY8XPMss6XrwfJrfgSQWInuR0UtAOfAOgzdE46F2r1XbFQhn
         wuajPvKtt2Qe2SUoQdNocsrbw31F/w51bYU17Ty/Ruu6bRHmRVblMCc2zXNC3v+z4bg+
         n5LCUei1qAsmmWvfS8opdN+tpl08CPa7F63JU/3NUnivQpGsjJ7g+8yNTb2MCFLSKBf8
         Lko9VZWTktKWZhNt12d8nXQMNdFI1GY9wN9MypdOqp6r4JCeDvuPKhK92WjP0tIu8N+Z
         VRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445355; x=1726050155;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ot6ekhaqzJ13RE6X5Mq04W0grM9ygIRT6z3DWVbfh3s=;
        b=opSmhl4Jnp0qnIcZRKEPua/xizXTaJOF7pwxzHYMjQbn/d6zL1BEXxh9anwCwKIx+7
         kQPcyMFq7DUTTQDs2IPiDqdb/vkl5nmNZOe93r3knI/lz74QKnYixwNSDfJIzw+HLMLo
         WGga3jNJ7fignZXTKUqCaPcRZFnrUF8d/UhAK8cxPAmFWU+zSlZI+5yu354GouL8wmRe
         qTd8vMmql1s7m01rV+XtFQAssat2qvyft85wbillhov8LkmvZMlrgIANOddLtiRvPzyq
         l27vWrRBYZzpeU1+YaufOFkuYapBx356cghjjsrgG4lvj39llwkR2olvsUu/cth2a+WP
         dnrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWhZr5NiPHLGyiKMk6cXWi5vbS10P+jIWCa8sKhUm3hh9SvjwHiwjRVwqcOUMN3WF8TKGHOI8IjpE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2XztPwihBP3vaZfDgAsmlC5kqjrEJ99qk1SdCAIte4b7fny6q
	8RJqHP+/f3RqsVXMM3pAXHdS6sJ9/Rowv60QthP3jbDDCvrdlhNtF9+kTQ==
X-Google-Smtp-Source: AGHT+IFe6cXqOLc8EFMvq7TiawJif8E1EnTZD9H/ubz+5efnGCGEsHxgszQJcLSTkcXo7CQ5arqiVA==
X-Received: by 2002:a05:651c:50c:b0:2f0:1e0a:4696 with SMTP id 38308e7fff4ca-2f651d542fbmr17575101fa.7.1725445354561;
        Wed, 04 Sep 2024 03:22:34 -0700 (PDT)
Message-ID: <17b61f0f6995e153d3dbc923c943824ac9342b7e.camel@gmail.com>
Subject: Re: [PATCH] RISCV/shutdown: Implement machine_{halt,restart}()
From: oleksii.kurochko@gmail.com
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Date: Wed, 04 Sep 2024 12:22:33 +0200
In-Reply-To: <20240903141937.3552353-1-andrew.cooper3@citrix.com>
References: 
	<3d32a952c7cc77fd759e211c3b60427485a75582.1725295716.git.oleksii.kurochko@gmail.com>
	 <20240903141937.3552353-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-09-03 at 15:19 +0100, Andrew Cooper wrote:
> SBI has an API for shutdown so wire it up.=C2=A0 However, the spec does
> allow the
> call not to be implemented, so we have to cope with the call return
> returning.
>=20
> There is a reboot-capable SBI extention, but in the short term route
> route
> machine_restart() into machine_halt().
>=20
> Then, use use machine_halt() rather than an infinite loop at the end
> of
> start_xen().=C2=A0 This avoids the Qemu smoke test needing to wait for th=
e
> full
> timeout in order to succeed.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
LGTM:
 Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks for the patch.

~ Oleksii

>=20
> As per commit e44f33ccddc2 ("ppc/shutdown: Implement
> machine_{halt,restart}()")
>=20
> Simply replacing BUG() with a printk() is just swapping one problem
> for
> another.
> ---
> =C2=A0xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/arch/riscv/include/asm/sbi.h |=C2=A0 3 +++
> =C2=A0xen/arch/riscv/sbi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++++
> =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 ++----
> =C2=A0xen/arch/riscv/shutdown.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 25 +++++++++++++++++++++++++
> =C2=A0xen/arch/riscv/stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 12 ------------
> =C2=A06 files changed, 36 insertions(+), 16 deletions(-)
> =C2=A0create mode 100644 xen/arch/riscv/shutdown.c
>=20
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 81b77b13d652..d192be7b552a 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -4,6 +4,7 @@ obj-y +=3D mm.o
> =C2=A0obj-$(CONFIG_RISCV_64) +=3D riscv64/
> =C2=A0obj-y +=3D sbi.o
> =C2=A0obj-y +=3D setup.o
> +obj-y +=3D shutdown.o
> =C2=A0obj-y +=3D stubs.o
> =C2=A0obj-y +=3D traps.o
> =C2=A0obj-y +=3D vm_event.o
> diff --git a/xen/arch/riscv/include/asm/sbi.h
> b/xen/arch/riscv/include/asm/sbi.h
> index 0e6820a4eda3..4d72a2295e72 100644
> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -13,6 +13,7 @@
> =C2=A0#define __ASM_RISCV_SBI_H__
> =C2=A0
> =C2=A0#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
> +#define SBI_EXT_0_1_SHUTDOWN			0x8
> =C2=A0
> =C2=A0struct sbiret {
> =C2=A0=C2=A0=C2=A0=C2=A0 long error;
> @@ -31,4 +32,6 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned
> long fid,
> =C2=A0 */
> =C2=A0void sbi_console_putchar(int ch);
> =C2=A0
> +void sbi_shutdown(void);
> +
> =C2=A0#endif /* __ASM_RISCV_SBI_H__ */
> diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
> index 0ae166c8610e..c7984344bc6b 100644
> --- a/xen/arch/riscv/sbi.c
> +++ b/xen/arch/riscv/sbi.c
> @@ -42,3 +42,8 @@ void sbi_console_putchar(int ch)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0,=
 0, 0, 0, 0);
> =C2=A0}
> +
> +void sbi_shutdown(void)
> +{
> +=C2=A0=C2=A0=C2=A0 sbi_ecall(SBI_EXT_0_1_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);
> +}
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index a6a29a150869..bf9078f36aff 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -4,6 +4,7 @@
> =C2=A0#include <xen/compile.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/mm.h>
> +#include <xen/shutdown.h>
> =C2=A0
> =C2=A0#include <public/version.h>
> =C2=A0
> @@ -28,8 +29,5 @@ void __init noreturn start_xen(unsigned long
> bootcpu_id,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 printk("All set up\n");
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 for ( ;; )
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("wfi");
> -
> -=C2=A0=C2=A0=C2=A0 unreachable();
> +=C2=A0=C2=A0=C2=A0 machine_halt();
> =C2=A0}
> diff --git a/xen/arch/riscv/shutdown.c b/xen/arch/riscv/shutdown.c
> new file mode 100644
> index 000000000000..270bb26b68a6
> --- /dev/null
> +++ b/xen/arch/riscv/shutdown.c
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/shutdown.h>
> +
> +#include <asm/sbi.h>
> +
> +void machine_halt(void)
> +{
> +=C2=A0=C2=A0=C2=A0 sbi_shutdown();
> +
> +=C2=A0=C2=A0=C2=A0 for ( ;; )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("wfi");
> +
> +=C2=A0=C2=A0=C2=A0 unreachable();
> +}
> +
> +void machine_restart(unsigned int delay_millisecs)
> +{
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * TODO: mdelay(delay_millisecs)
> +=C2=A0=C2=A0=C2=A0=C2=A0 * TODO: Probe for #SRST support, where sbi_syst=
em_reset() has a
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shutdown/=
reboot parameter.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +
> +=C2=A0=C2=A0=C2=A0 machine_halt();
> +}
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 3285d1889940..2aa245f272b5 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -49,18 +49,6 @@ void domain_set_time_offset(struct domain *d,
> int64_t time_offset_seconds)
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> =C2=A0}
> =C2=A0
> -/* shutdown.c */
> -
> -void machine_restart(unsigned int delay_millisecs)
> -{
> -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> -}
> -
> -void machine_halt(void)
> -{
> -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> -}
> -
> =C2=A0/* domctl.c */
> =C2=A0
> =C2=A0long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>=20
> base-commit: 1e6bb29b03680a9d0e12f14c4d406a0d67317ea7


