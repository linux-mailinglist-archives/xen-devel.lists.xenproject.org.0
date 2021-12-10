Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C4147088C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 19:21:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244204.422383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkWL-0007QT-VW; Fri, 10 Dec 2021 18:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244204.422383; Fri, 10 Dec 2021 18:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkWL-0007Oe-Qm; Fri, 10 Dec 2021 18:21:25 +0000
Received: by outflank-mailman (input) for mailman id 244204;
 Fri, 10 Dec 2021 18:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dzg=Q3=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1mvkWK-0007OU-3I
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 18:21:24 +0000
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa604526-59e5-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 19:21:23 +0100 (CET)
Received: by mail-ot1-f50.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so10420096otv.9
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 10:21:23 -0800 (PST)
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
X-Inumbo-ID: fa604526-59e5-11ec-ad7a-b7ef48004f0a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CGnO4bxnTAqMK/uthYlBDN3+OwLPbg309qxpgobdKxI=;
        b=ksZIEvcpYx33W6T4oWVnODlPjYPbc9kw21gBhLsMkR3d244tlOdMTPp3s8LUBzIcCa
         v6EBL8Np37eCJiz5tHp+8NGOVEzgHgIzDX7idvJzwwX6CzbpCTlKfoJN8w/SNV3nej6J
         MGbsRXXTWa9llJjzs+0sV2PWNA7K4pHw62T6CjGErmnhaGMjRNUiKnT+QziFnwb6MbzQ
         JqTAeJwZrOTew9kAZPkv+5SZzEOr7GfQsPQ3M5nXoeSfbqxXD3aDJI3VLGAwqZDtGzCX
         x/0rte4KdsALwG9aKKLs0LMLvRXCbJV6Fi2XbbvmKQ9LOiqdpVvqC3ZaTl+W5Ly0qst7
         /P6Q==
X-Gm-Message-State: AOAM53172OnmRj/1/Lk9dtf6DQW3NJGC3lCZ/iYLPYrrQd53SoeXDrvM
	px8HjdfKMToF6q0uhTw8nGlOiqDwM+NJ81PePik=
X-Google-Smtp-Source: ABdhPJxyUbegeOKjvJ3CxiHL7dwpj9EzFVDPRUNdKiJGM3d307QrxgUO9bUGZj0EMwemLB2snxZHAeDirffJcqK0rDM=
X-Received: by 2002:a05:6830:1e57:: with SMTP id e23mr12377743otj.16.1639160481982;
 Fri, 10 Dec 2021 10:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com> <20211126180101.27818-5-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-5-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:21:11 +0100
Message-ID: <CAJZ5v0h_OfrQ92KqsUdiKAfUrXDT9dPXzq4S=b6zi4k_2cPAjg@mail.gmail.com>
Subject: Re: [PATCH v4 04/25] reboot: Correct typo in a comment
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Joshua Thompson <funaho@jurai.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	alankao@andestech.com, "K . C . Kuen-Chern Lin" <kclin@andestech.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
	Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Correct s/implemenations/implementations/ in <reboot.h>.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

This patch clearly need not be part of this series.

> ---
>  include/linux/reboot.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index af907a3d68d1..7c288013a3ca 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -63,7 +63,7 @@ struct pt_regs;
>  extern void machine_crash_shutdown(struct pt_regs *);
>
>  /*
> - * Architecture independent implemenations of sys_reboot commands.
> + * Architecture independent implementations of sys_reboot commands.
>   */
>
>  extern void kernel_restart_prepare(char *cmd);
> --
> 2.33.1
>

