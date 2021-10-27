Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEEB43DA33
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 06:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217515.377729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfwvz-0000ON-Uw; Thu, 28 Oct 2021 04:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217515.377729; Thu, 28 Oct 2021 04:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfwvz-0000MC-Rv; Thu, 28 Oct 2021 04:22:35 +0000
Received: by outflank-mailman (input) for mailman id 217515;
 Wed, 27 Oct 2021 23:09:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EXXu=PP=dabbelt.com=palmer@srs-us1.protection.inumbo.net>)
 id 1mfs2f-0004Hw-Q0
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 23:09:09 +0000
Received: from mail-pj1-x102d.google.com (unknown [2607:f8b0:4864:20::102d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f7c6ad4-4552-412e-98d4-8eab26454eb9;
 Wed, 27 Oct 2021 23:09:08 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso6416842pjc.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 16:09:08 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:60fc:a50:6d27:9fd3])
 by smtp.gmail.com with ESMTPSA id bg15sm739067pjb.15.2021.10.27.16.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 16:09:07 -0700 (PDT)
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
X-Inumbo-ID: 9f7c6ad4-4552-412e-98d4-8eab26454eb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=XJfFTW9EjYJeHoclf1SeEwj25PLenE7ts5EFTr8vzec=;
        b=vYjyS+8EH3CfIBezSrdmSEFFSJc1bpK8IsDLNwp4SIdgzIr0qhB73jSdQ+tZtt+gKe
         gLRCAnofL8DMkcE7vLBKcZfntvEYsCybXJMFIekVgyaoqoB4d2yoy2/fxl6NKOgXIYmd
         GMEiLNFKg0iVmrnBvlpV4pv/PV+nqVeQwlB1PLBrwM8b8vjtjZjGvc3MJRrAfuUoDBNo
         ViaF9lo0gQuECLSnf0dUVzQmZPRvjI+cvfCWgH2cYeMbb2VhrXJlj9sEs5Y4vYC263de
         h2wbGwEHNdbZkGS/4AP/MxQ7HKYBbqiVTjD7lo6//33sqHBHnP35ISg1TmvMKaMznq9A
         cKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=XJfFTW9EjYJeHoclf1SeEwj25PLenE7ts5EFTr8vzec=;
        b=7GwE/ug7EqExXnf4YaKKfqFiIF79hXKnK0oP6JIek87r52/R4LTQnSIEs9SbIs6iJl
         rFtH1O/90GpluSzmDlETlxKUriuKhf8hmHvDx3jF6QNOInF0zNFqutx4/rJbEU6QJNDw
         YTDOO9qQtO4MlHN2ym2bJRwkCf5jucxhn7meFIOQ9Ab7XxWM+31i42m87erukPa0DsnA
         v9cr57m4L/NzPR+4CckTorwdNvK8zdoVaxowgYYE0JjDak5wv5FJRrApIz0p1MQe9TCD
         3guUzXjhj4fXbitGHzYbhuLyi4ODs/BR0X+I1Po+HW/zTePdaLOQhQvN14bo+O3OSQSK
         vp3Q==
X-Gm-Message-State: AOAM531OcxR/6dgSu33Q8ea79mgFWu3sN2A3KKvqhQCvRpr2yPQE2NtW
	+FKGLZ4HlcOIRMWGSy5iyom22A==
X-Google-Smtp-Source: ABdhPJxUJYglQ4uyqyrvUHQJ2HBzLbAnkI4OfP0sJtC8YPLND6BbQ0gKrpcxmED13rpzsyQoceaG3g==
X-Received: by 2002:a17:903:246:b0:13f:2ff9:8b93 with SMTP id j6-20020a170903024600b0013f2ff98b93mr652035plh.54.1635376148047;
        Wed, 27 Oct 2021 16:09:08 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:09:07 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Oct 2021 16:09:01 PDT (-0700)
Subject:     Re: [PATCH v2 18/45] riscv: Use do_kernel_power_off()
In-Reply-To: <20211027211715.12671-19-digetx@gmail.com>
CC: thierry.reding@gmail.com, jonathanh@nvidia.com, lee.jones@linaro.org,
  rafael@kernel.org, broonie@kernel.org, akpm@linux-foundation.org, linux@roeck-us.net,
  linux@armlinux.org.uk, daniel.lezcano@linaro.org, andriy.shevchenko@linux.intel.com,
  ulf.hansson@linaro.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org,
  geert@linux-m68k.org, gerg@linux-m68k.org, funaho@jurai.org, tsbogend@alpha.franken.de,
  nickhu@andestech.com, green.hu@gmail.com, deanbo422@gmail.com, James.Bottomley@HansenPartnership.com,
  deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, ysato@users.sourceforge.jp, dalias@libc.org,
  tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
  lenb@kernel.org, ssantosh@kernel.org, krzysztof.kozlowski@canonical.com,
  linus.walleij@linaro.org, wens@csie.org, j.neuschaefer@gmx.net, tony@atomide.com, lgirdwood@gmail.com,
  p.zabel@pengutronix.de, vz@mleia.com, avifishman70@gmail.com, tmaimon77@gmail.com,
  tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, pavel@ucw.cz,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
  linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
  linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
  linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
  linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
  linux-pm@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: digetx@gmail.com
Message-ID: <mhng-fd8f451c-4860-4b0c-a155-6f65891cd276@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 27 Oct 2021 14:16:48 PDT (-0700), digetx@gmail.com wrote:
> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/riscv/kernel/reset.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 9c842c41684a..912288572226 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -23,16 +23,12 @@ void machine_restart(char *cmd)
>
>  void machine_halt(void)
>  {
> -	if (pm_power_off != NULL)
> -		pm_power_off();
> -	else
> -		default_power_off();
> +	do_kernel_power_off();
> +	default_power_off();
>  }
>
>  void machine_power_off(void)
>  {
> -	if (pm_power_off != NULL)
> -		pm_power_off();
> -	else
> -		default_power_off();
> +	do_kernel_power_off();
> +	default_power_off();
>  }

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

