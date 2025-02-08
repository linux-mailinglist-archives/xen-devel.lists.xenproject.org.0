Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D700CA2D322
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 03:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884237.1294030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgakb-0006TV-8n; Sat, 08 Feb 2025 02:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884237.1294030; Sat, 08 Feb 2025 02:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgakb-0006S3-5z; Sat, 08 Feb 2025 02:39:21 +0000
Received: by outflank-mailman (input) for mailman id 884237;
 Sat, 08 Feb 2025 02:39:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tgakZ-0006Rx-GB
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2025 02:39:19 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3edbef5-e5c5-11ef-a073-877d107080fb;
 Sat, 08 Feb 2025 03:39:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 63C08A43D0E;
 Sat,  8 Feb 2025 02:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF5EC4CED1;
 Sat,  8 Feb 2025 02:39:14 +0000 (UTC)
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
X-Inumbo-ID: e3edbef5-e5c5-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738982355;
	bh=oPn8YTlB6GCIgWVchX0+5vB61QId3kQApJoI+CxdJko=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CinMf3ghHe/Ox2MFv8FzBGa286lTMVpME6NZCQCapNP/djIPznJE9uI7JaZKG948x
	 QiiyKOHuOqMW5oBEl3bmM2c/aod06U3t4UyjWaYBWrPlPHCD6nHuKnZkbmH2yyggVX
	 J1eADwYc0sYGGBIdeBBmR7MUKcR7NIiD8u1ZZxI2xYhJRs9YpOZiOYWZQ2gNRF1xhY
	 7acYd7D7b+gJzTKCUSaNg5CawKFY2e7jmOzX2YT1Ny88iwwC0ChAbXKfokWAUQnXal
	 IUVDZsPXp9iK6Z6jCaB9Pq2s8rMEyJrZ7fsgxqCyjx17FXB4k1KUwI8uKwjyz0CV1I
	 un+Nwtnr1BO3g==
Date: Fri, 7 Feb 2025 18:39:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.20 3/3] RISCV: Activate UBSAN in testing
In-Reply-To: <20250207220122.380214-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2502071839050.619090@ubuntu-linux-20-04-desktop>
References: <20250207220122.380214-1-andrew.cooper3@citrix.com> <20250207220122.380214-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2081584842-1738982356=:619090"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2081584842-1738982356=:619090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 7 Feb 2025, Andrew Cooper wrote:
> RISC-V has less complicated headers, so update ubsan.c to pull in everything
> it needs.  Provide dump_execution_state(), and update the printk() message to
> make it more obvious that it's an outstanding task.
> 
> As with commit 8ef2ac727e21 ("automation: enable UBSAN for debug tests"),
> enable UBSAN in RISC-V testing too.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> Testing of this series:
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078817715
> 
> Sample run with an intentional UBSAN failure:
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570135
> ---
>  automation/gitlab-ci/build.yaml        | 3 +++
>  xen/arch/riscv/Kconfig                 | 1 +
>  xen/arch/riscv/include/asm/processor.h | 2 ++
>  xen/arch/riscv/traps.c                 | 2 +-
>  xen/common/ubsan/ubsan.c               | 5 ++++-
>  5 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index fb55d4ce5568..35e224366f62 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -359,6 +359,9 @@ debian-12-riscv64-gcc-debug:
>      CONTAINER: debian:12-riscv64
>      KBUILD_DEFCONFIG: tiny64_defconfig
>      HYPERVISOR_ONLY: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_UBSAN=y
> +      CONFIG_UBSAN_FATAL=y
>  
>  # Arm32 cross-build
>  
> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> index 00f329054c94..fa95cd0a4213 100644
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -4,6 +4,7 @@ config RISCV
>  	select GENERIC_BUG_FRAME
>  	select HAS_DEVICE_TREE
>  	select HAS_PMAP
> +	select HAS_UBSAN
>  	select HAS_VMAP
>  
>  config RISCV_64
> diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
> index 90b800956303..39696fb58dc6 100644
> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -91,6 +91,8 @@ static inline void sfence_vma(void)
>      asm volatile ( "sfence.vma" ::: "memory" );
>  }
>  
> +#define dump_execution_state() run_in_exception_handler(show_execution_state)
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* ASM__RISCV__PROCESSOR_H */
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> index d55a4a827b8c..ea3638a54fed 100644
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -140,7 +140,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>  
>  void show_execution_state(const struct cpu_user_regs *regs)
>  {
> -    printk("implement show_execution_state(regs)\n");
> +    printk("TODO: Implement show_execution_state(regs)\n");
>  }
>  
>  void arch_hypercall_tasklet_result(struct vcpu *v, long res)
> diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
> index 7f73f94759db..e99370322b44 100644
> --- a/xen/common/ubsan/ubsan.c
> +++ b/xen/common/ubsan/ubsan.c
> @@ -10,8 +10,11 @@
>   *
>   */
>  
> -#include <xen/spinlock.h>
> +#include <xen/bitops.h>
> +#include <xen/kernel.h>
> +#include <xen/lib.h>
>  #include <xen/percpu.h>
> +#include <xen/spinlock.h>
>  
>  #define __noreturn    noreturn
>  #define pr_err(...) printk(XENLOG_ERR __VA_ARGS__)
> -- 
> 2.39.5
> 
--8323329-2081584842-1738982356=:619090--

