Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D140E66A386
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 20:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477529.740260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGPug-00034k-HM; Fri, 13 Jan 2023 19:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477529.740260; Fri, 13 Jan 2023 19:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGPug-000325-ET; Fri, 13 Jan 2023 19:40:30 +0000
Received: by outflank-mailman (input) for mailman id 477529;
 Fri, 13 Jan 2023 19:40:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8P1x=5K=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1pGPuf-00031z-5C
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 19:40:29 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 212f2262-937a-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 20:40:27 +0100 (CET)
Received: by mail-ej1-f49.google.com with SMTP id ss4so47352118ejb.11
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jan 2023 11:40:27 -0800 (PST)
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
X-Inumbo-ID: 212f2262-937a-11ed-91b6-6bf2151ebd3b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FynnHHA+adKoY+qySCCuC0I0OWwcsOl+qYyvsB5YSU=;
        b=T1a+O7QCNB3TcCKYS1nainUZELsbZbCDR0+PDoOjKK2bk+7t6Yt078Fx0n1vTqDafc
         NO+L22TfIe4cimNeGq432w+HnZQi1CuKn5dHLat+MogtnJXF4QdO1NfqVuYYLjNdRpt8
         SGttBXEDanx2+m/yWVbGkKxUxdBMLPKAAinIvO41MCoUWXOPsOPZRatmLkgmGi/VvvkV
         GcG7uLvLD1fGBnSknoVG8e1yT3d/G+rx7JiAB9yKnueww5owrePKLmiWFLhuHUsiQIOI
         5LCv4dntCNEnMQ5EdGTtRdc74h//rugI+Y1u+GCpQj7GGDkoON4roTNJTUbOKy4mfCiY
         B9mA==
X-Gm-Message-State: AFqh2krOFQZrY18Ot6rjfj70FToRHUkZuzzWvWGwLPE8a0mkf6K9zv2O
	KCBSMjeZ07LxZyNCXEsqyv7A0dBxBwKdSL1YgHE=
X-Google-Smtp-Source: AMrXdXvn2X6x4HoxAN6K2w1MSEvmKDvbqX2OyOqsOjj0s6TYIEhLLev1mfoqRKdTYIEqIwH2b1rnxH1eGYQbqtwdUl8=
X-Received: by 2002:a17:907:29c3:b0:84d:4b8e:efc with SMTP id
 ev3-20020a17090729c300b0084d4b8e0efcmr1445143ejc.390.1673638826641; Fri, 13
 Jan 2023 11:40:26 -0800 (PST)
MIME-Version: 1.0
References: <20230113140610.7132-1-jgross@suse.com>
In-Reply-To: <20230113140610.7132-1-jgross@suse.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 13 Jan 2023 20:40:15 +0100
Message-ID: <CAJZ5v0gP_NUeQimn21tJuUjpMAOW_wFrRe4jstN13So_4_T4QQ@mail.gmail.com>
Subject: Re: [PATCH] x86/acpi: fix suspend with Xen
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-pm@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2023 at 3:06 PM Juergen Gross <jgross@suse.com> wrote:
>
> Commit f1e525009493 ("x86/boot: Skip realmode init code when running as
> Xen PV guest") missed one code path accessing real_mode_header, leading
> to dereferencing NULL when suspending the system under Xen:
>
>     [  348.284004] PM: suspend entry (deep)
>     [  348.289532] Filesystems sync: 0.005 seconds
>     [  348.291545] Freezing user space processes ... (elapsed 0.000 secon=
ds) done.
>     [  348.292457] OOM killer disabled.
>     [  348.292462] Freezing remaining freezable tasks ... (elapsed 0.104 =
seconds) done.
>     [  348.396612] printk: Suspending console(s) (use no_console_suspend =
to debug)
>     [  348.749228] PM: suspend devices took 0.352 seconds
>     [  348.769713] ACPI: EC: interrupt blocked
>     [  348.816077] BUG: kernel NULL pointer dereference, address: 0000000=
00000001c
>     [  348.816080] #PF: supervisor read access in kernel mode
>     [  348.816081] #PF: error_code(0x0000) - not-present page
>     [  348.816083] PGD 0 P4D 0
>     [  348.816086] Oops: 0000 [#1] PREEMPT SMP NOPTI
>     [  348.816089] CPU: 0 PID: 6764 Comm: systemd-sleep Not tainted 6.1.3=
-1.fc32.qubes.x86_64 #1
>     [  348.816092] Hardware name: Star Labs StarBook/StarBook, BIOS 8.01 =
07/03/2022
>     [  348.816093] RIP: e030:acpi_get_wakeup_address+0xc/0x20
>
> Fix that by adding an indirection for acpi_get_wakeup_address() which
> Xen PV dom0 can use to return a dummy non-zero wakeup address (this
> address won't ever be used, as the real suspend handling is done by the
> hypervisor).

How exactly does this help?

> Fixes: f1e525009493 ("x86/boot: Skip realmode init code when running as X=
en PV guest")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/include/asm/acpi.h  | 2 +-
>  arch/x86/kernel/acpi/sleep.c | 3 ++-
>  include/xen/acpi.h           | 9 +++++++++
>  3 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
> index 65064d9f7fa6..137259ff8f03 100644
> --- a/arch/x86/include/asm/acpi.h
> +++ b/arch/x86/include/asm/acpi.h
> @@ -61,7 +61,7 @@ static inline void acpi_disable_pci(void)
>  extern int (*acpi_suspend_lowlevel)(void);
>
>  /* Physical address to resume after wakeup */
> -unsigned long acpi_get_wakeup_address(void);
> +extern unsigned long (*acpi_get_wakeup_address)(void);
>
>  /*
>   * Check if the CPU can handle C2 and deeper
> diff --git a/arch/x86/kernel/acpi/sleep.c b/arch/x86/kernel/acpi/sleep.c
> index 3b7f4cdbf2e0..1a3cd5e24cd0 100644
> --- a/arch/x86/kernel/acpi/sleep.c
> +++ b/arch/x86/kernel/acpi/sleep.c
> @@ -33,10 +33,11 @@ static char temp_stack[4096];
>   * Returns the physical address where the kernel should be resumed after=
 the
>   * system awakes from S3, e.g. for programming into the firmware waking =
vector.
>   */
> -unsigned long acpi_get_wakeup_address(void)
> +static unsigned long x86_acpi_get_wakeup_address(void)
>  {
>         return ((unsigned long)(real_mode_header->wakeup_start));
>  }
> +unsigned long (*acpi_get_wakeup_address)(void) =3D x86_acpi_get_wakeup_a=
ddress;
>
>  /**
>   * x86_acpi_enter_sleep_state - enter sleep state
> diff --git a/include/xen/acpi.h b/include/xen/acpi.h
> index b1e11863144d..7e1e5dbfb77c 100644
> --- a/include/xen/acpi.h
> +++ b/include/xen/acpi.h
> @@ -56,6 +56,12 @@ static inline int xen_acpi_suspend_lowlevel(void)
>         return 0;
>  }
>
> +static inline unsigned long xen_acpi_get_wakeup_address(void)
> +{
> +       /* Just return a dummy non-zero value, it will never be used. */
> +       return 1;
> +}
> +
>  static inline void xen_acpi_sleep_register(void)
>  {
>         if (xen_initial_domain()) {
> @@ -65,6 +71,9 @@ static inline void xen_acpi_sleep_register(void)
>                         &xen_acpi_notify_hypervisor_extended_sleep);
>
>                 acpi_suspend_lowlevel =3D xen_acpi_suspend_lowlevel;
> +#ifdef CONFIG_ACPI_SLEEP
> +               acpi_get_wakeup_address =3D xen_acpi_get_wakeup_address;
> +#endif
>         }
>  }
>  #else
> --
> 2.35.3
>

