Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7576F3B1B
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 01:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528312.821287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptdNC-00009u-3G; Mon, 01 May 2023 23:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528312.821287; Mon, 01 May 2023 23:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptdNC-00006T-0B; Mon, 01 May 2023 23:56:02 +0000
Received: by outflank-mailman (input) for mailman id 528312;
 Mon, 01 May 2023 23:56:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7rn=AW=dabbelt.com=palmer@srs-se1.protection.inumbo.net>)
 id 1ptdNA-00006N-Bx
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 23:56:00 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6056f9c-e87b-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 01:55:57 +0200 (CEST)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63b8b19901fso3667234b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 16:55:56 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 t2-20020a628102000000b0063b1e7ffc5fsm20413877pfd.39.2023.05.01.16.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 16:55:53 -0700 (PDT)
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
X-Inumbo-ID: b6056f9c-e87b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682985354; x=1685577354;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuwyJlMhOzHc7pD19rcBJm7YGGdkgt4st5TSnBpxtCA=;
        b=u7Fbet5GsM/a+tKDG1jIQjylhg8yDIGsEfB3R3METzXxmxTlMfZIrKJcjG1Eg5BKJj
         MlFOPCIdB1Kzok6k4VO3kofHLnjOICQw4gU2tuQOBg05zhDbFsggy6hJcjAmZMRGAXf0
         rUtZb8K8J1C2NtGocYCnTuPL/7q8UuOvuWeleHqtXMOc3hyp4VTgoMKde+PprRxEq3U9
         3NCfHp5mczh1hPm51YYXtT/w0nBzMFK+Xv4D4Xzjfds97FS7WzOT/O5styDeQpozCahx
         aw/N9G2On9yOd5m0BdC1sLbhcBfoO3yIW/1WaAekonzfxEBWX3WbGIXs9NTSCve1lAj1
         n8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682985354; x=1685577354;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuwyJlMhOzHc7pD19rcBJm7YGGdkgt4st5TSnBpxtCA=;
        b=AXjVAAOy36CR1B9sJotdZBON9iZBAFosUpB+ZJY1hlIPrzYddyMErlpIm4cSlSMjbL
         cFp4vgqFMD7iO0wKXWKoQLtJwHnkgRKZcNScQVZ01tV3O3S/H7poU2MrXcL39teWSn9X
         9RIf/Ri+pceUMGRyFWJKETAHuqzGr4neA1BswUWsNG1JFurwMnP3523scI1h++gEwVww
         1cuLjEtBRXQ8B6qzlhL0XgouJMLSyiB3Lx3iR6lopyy/U9uzGUOY8n7/F6z6w2CYfn/x
         DtvDLT+zkfWYq0WROgp6vex6YtJo2iQ5BKfTitZkOTAGEG0lTRDVGh7ABJoC884bYLEA
         Tt0w==
X-Gm-Message-State: AC+VfDx+UWpUCP362lultdJX8cp/ZFj2clph+p7ovK17s1psBNpeWVZN
	xAksnb/Xs5NHrlu2Ux4dBDTUmA==
X-Google-Smtp-Source: ACHHUZ4SgBzSoTxFJ9j/mzMx+FBKsdjE/IfAfq6NZWT2hwrYFJsUY4cczelg66bWFkmYBXKaJT4LqQ==
X-Received: by 2002:a05:6a20:6f03:b0:f8:b39b:b24e with SMTP id gt3-20020a056a206f0300b000f8b39bb24emr16225285pzb.11.1682985354255;
        Mon, 01 May 2023 16:55:54 -0700 (PDT)
Date: Mon, 01 May 2023 16:55:53 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 16:55:31 PDT (-0700)
Subject:     Re: [patch 26/37] riscv: Switch to hotplug core state synchronization
In-Reply-To: <20230414232310.817955867@linutronix.de>
CC: linux-kernel@vger.kernel.org, x86@kernel.org, dwmw@infradead.org,
  andrew.cooper3@citrix.com, brgerst@gmail.com, arjan@linux.intel.com, pbonzini@redhat.com,
  paulmck@kernel.org, thomas.lendacky@amd.com, seanjc@google.com, oleksandr@natalenko.name,
  pmenzel@molgen.mpg.de, gpiccoli@igalia.com, lucjan.lucjanov@gmail.com,
  Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, dwmw@amazon.co.uk, usama.arif@bytedance.com,
  jgross@suse.com, boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
  linux@armlinux.org.uk, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, guoren@kernel.org, linux-csky@vger.kernel.org,
  tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
  deller@gmx.de, linux-parisc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
  sabrapan@amazon.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tglx@linutronix.de
Message-ID: <mhng-fd944caa-93db-40e0-8ea8-bc52772a261a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 14 Apr 2023 16:44:55 PDT (-0700), tglx@linutronix.de wrote:
> Switch to the CPU hotplug core state tracking and synchronization
> mechanim. No functional change intended.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/Kconfig              |    1 +
>  arch/riscv/include/asm/smp.h    |    2 +-
>  arch/riscv/kernel/cpu-hotplug.c |   14 +++++++-------
>  3 files changed, 9 insertions(+), 8 deletions(-)
>
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -116,6 +116,7 @@ config RISCV
>  	select HAVE_RSEQ
>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
> +	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
>  	select MODULES_USE_ELF_RELA if MODULES
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -64,7 +64,7 @@ asmlinkage void smp_callin(void);
>
>  #if defined CONFIG_HOTPLUG_CPU
>  int __cpu_disable(void);
> -void __cpu_die(unsigned int cpu);
> +static inline void __cpu_die(unsigned int cpu) { }
>  #endif /* CONFIG_HOTPLUG_CPU */
>
>  #else
> --- a/arch/riscv/kernel/cpu-hotplug.c
> +++ b/arch/riscv/kernel/cpu-hotplug.c
> @@ -8,6 +8,7 @@
>  #include <linux/sched.h>
>  #include <linux/err.h>
>  #include <linux/irq.h>
> +#include <linux/cpuhotplug.h>
>  #include <linux/cpu.h>
>  #include <linux/sched/hotplug.h>
>  #include <asm/irq.h>
> @@ -48,17 +49,15 @@ int __cpu_disable(void)
>  	return ret;
>  }
>
> +#ifdef CONFIG_HOTPLUG_CPU
>  /*
> - * Called on the thread which is asking for a CPU to be shutdown.
> + * Called on the thread which is asking for a CPU to be shutdown, if the
> + * CPU reported dead to the hotplug core.
>   */
> -void __cpu_die(unsigned int cpu)
> +void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
>  {
>  	int ret = 0;
>
> -	if (!cpu_wait_death(cpu, 5)) {
> -		pr_err("CPU %u: didn't die\n", cpu);
> -		return;
> -	}
>  	pr_notice("CPU%u: off\n", cpu);
>
>  	/* Verify from the firmware if the cpu is really stopped*/
> @@ -75,9 +74,10 @@ void arch_cpu_idle_dead(void)
>  {
>  	idle_task_exit();
>
> -	(void)cpu_report_death();
> +	cpuhp_ap_report_dead();
>
>  	cpu_ops[smp_processor_id()]->cpu_stop();
>  	/* It should never reach here */
>  	BUG();
>  }
> +#endif

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

