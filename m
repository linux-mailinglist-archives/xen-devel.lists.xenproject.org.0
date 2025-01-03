Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38FDA01108
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 00:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864667.1275887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTr6V-0001Lc-Og; Fri, 03 Jan 2025 23:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864667.1275887; Fri, 03 Jan 2025 23:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTr6V-0001Ji-M4; Fri, 03 Jan 2025 23:29:19 +0000
Received: by outflank-mailman (input) for mailman id 864667;
 Fri, 03 Jan 2025 23:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79/6=T3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTr6U-0001Jc-Is
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 23:29:18 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bf14b1b-ca2a-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 00:29:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1F8BEA41189;
 Fri,  3 Jan 2025 23:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F820C4CEDD;
 Fri,  3 Jan 2025 23:29:13 +0000 (UTC)
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
X-Inumbo-ID: 8bf14b1b-ca2a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735946954;
	bh=hc7q+WryTt942r3uQCeUK51Kjvlaohg5KXYEpHUpdoo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HZTnvg2hqv1NGd6JmwmtQidZCbvSbQD1KpB6lcAaEpinV9DkgnL5xbIKvBCAyYY3x
	 DBYmkmbUexiSaDii4xuxkI52m36bKjyKtb6pAPLQUK468oL4w07cTOSAanNxSlgOyv
	 kmzDskTwfeqOv1rCMt/1OZzOLDx10ryVepG3gVW+7/HoflHe/dxxjkbkmdw2nvO2PJ
	 8aSamR71Wu9z5BEd23aQWyxMbZSK6a6kYOQAvUe4P/HuH34qIDDf838RpTjjf6i9YS
	 N3nEW6lba729QMtHi+5ECuB1jEb/0+t3npFUbFMvd3g/XNJZMFE3ODOa46T3Ox4Esr
	 FV0E+nXkoQx0g==
Date: Fri, 3 Jan 2025 15:29:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH 2/5] xen/perfc: Add perfc_defn.h to asm-generic
In-Reply-To: <20250102192508.2405687-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2501031525580.16425@ubuntu-linux-20-04-desktop>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com> <20250102192508.2405687-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-813812359-1735946954=:16425"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-813812359-1735946954=:16425
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 2 Jan 2025, Andrew Cooper wrote:
> ... and hook it up for RISC-V and PPC.
> 
> On RISC-V at least, no combination of headers pulls in errno.h, so include it
> explicitly.
> 
> Guard the hypercalls array declaration based on NR_hypercalls existing.  This
> is sufficient to get PERF_COUNTERS fully working on RISC-V and PPC, so drop
> the randconfig override.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  automation/gitlab-ci/build.yaml      | 1 -
>  xen/arch/ppc/include/asm/Makefile    | 1 +
>  xen/arch/riscv/include/asm/Makefile  | 1 +
>  xen/common/perfc.c                   | 1 +
>  xen/include/asm-generic/perfc_defn.h | 5 +++++
>  xen/include/xen/perfc_defn.h         | 2 ++
>  6 files changed, 10 insertions(+), 1 deletion(-)
>  create mode 100644 xen/include/asm-generic/perfc_defn.h
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 1b884cc81cdb..41f17ed45641 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -734,7 +734,6 @@ debian-12-riscv64-gcc:
>        CONFIG_GRANT_TABLE=n
>        CONFIG_LIVEPATCH=n
>        CONFIG_MEM_ACCESS=n
> -      CONFIG_PERF_COUNTERS=n
>        CONFIG_QEMU_PLATFORM=y
>        CONFIG_XSM=n
>  
> diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
> index ced02e26ed13..c989a7f89b34 100644
> --- a/xen/arch/ppc/include/asm/Makefile
> +++ b/xen/arch/ppc/include/asm/Makefile
> @@ -7,6 +7,7 @@ generic-y += hypercall.h
>  generic-y += iocap.h
>  generic-y += paging.h
>  generic-y += percpu.h
> +generic-y += perfc_defn.h
>  generic-y += random.h
>  generic-y += softirq.h
>  generic-y += vm_event.h
> diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
> index ced02e26ed13..c989a7f89b34 100644
> --- a/xen/arch/riscv/include/asm/Makefile
> +++ b/xen/arch/riscv/include/asm/Makefile
> @@ -7,6 +7,7 @@ generic-y += hypercall.h
>  generic-y += iocap.h
>  generic-y += paging.h
>  generic-y += percpu.h
> +generic-y += perfc_defn.h
>  generic-y += random.h
>  generic-y += softirq.h
>  generic-y += vm_event.h
> diff --git a/xen/common/perfc.c b/xen/common/perfc.c
> index ed4dba36f1bc..8c967ab900f9 100644
> --- a/xen/common/perfc.c
> +++ b/xen/common/perfc.c
> @@ -1,4 +1,5 @@
>  
> +#include <xen/errno.h>
>  #include <xen/lib.h>
>  #include <xen/smp.h>
>  #include <xen/time.h>
> diff --git a/xen/include/asm-generic/perfc_defn.h b/xen/include/asm-generic/perfc_defn.h
> new file mode 100644
> index 000000000000..8237636d83fb
> --- /dev/null
> +++ b/xen/include/asm-generic/perfc_defn.h
> @@ -0,0 +1,5 @@
> +/* This file is legitimately included multiple times. */

It is a good idea to add comment here to explain. This is effectively
the same as a deviation of MISRA D4.10. SAF-8-safe is defined as
"Headers that deliberatively leave the responsability of their correct
inclusion to the caller are allowed". I think it applies, please add
SAF-8-safe to this comment and also the other perfc_defn.h, e.g.:

/* SAF-8-safe This file is legitimately included multiple times. */


> +/* #ifndef ASM_GENERIC_PERFC_DEFN_H */
> +/* #define ASM_GENERIC_PERFC_DEFN_H */
> +
> +/* #endif ASM_GENERIC_PERFC_DEFN_H */
> diff --git a/xen/include/xen/perfc_defn.h b/xen/include/xen/perfc_defn.h
> index 0027d95a60bc..a987d80dd6f1 100644
> --- a/xen/include/xen/perfc_defn.h
> +++ b/xen/include/xen/perfc_defn.h
> @@ -4,7 +4,9 @@
>  
>  #include <asm/perfc_defn.h>
>  
> +#ifdef NR_hypercalls
>  PERFCOUNTER_ARRAY(hypercalls,           "hypercalls", NR_hypercalls)
> +#endif
>  
>  PERFCOUNTER(calls_from_multicall,       "calls from multicall")
>  
> -- 
> 2.39.5
> 
--8323329-813812359-1735946954=:16425--

