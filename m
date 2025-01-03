Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C06A010EB
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 00:22:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864659.1275879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTqys-0000e2-24; Fri, 03 Jan 2025 23:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864659.1275879; Fri, 03 Jan 2025 23:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTqyr-0000av-V4; Fri, 03 Jan 2025 23:21:25 +0000
Received: by outflank-mailman (input) for mailman id 864659;
 Fri, 03 Jan 2025 23:21:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79/6=T3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTqyr-0000ap-6f
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 23:21:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 713e79bf-ca29-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 00:21:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B7945C634C;
 Fri,  3 Jan 2025 23:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CA5C4CEDD;
 Fri,  3 Jan 2025 23:21:18 +0000 (UTC)
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
X-Inumbo-ID: 713e79bf-ca29-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735946480;
	bh=dIjuQpPWOFQi6NC/w3MIRRxFT6bdrilHLk10vxsvem8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dMTJsBhAFeVM6m7N0HuCLdC/Q5GnF0ACksgfsEMspAMpnLxc1nAHUzLal+psZyGyW
	 9HovhBS4xVt2icxKbg00lFTmZNpe8Lq909fCYlUZPnERM4SJ++Iih6dE4A5E2hS4ro
	 SIwx9lFlHORppm2eLA1yvy0wjgASXHB4eXr+ee5PYp18+ehRk/hDYHT7OU7W8r/Sjk
	 YmYY7ufrS4RnaOWRtiMhmyXIlijJqkz3Yf2Lu026tTMvsX68zn37d9QuTheVg0TK1n
	 qCQ1QNLWuKTQzgvZ3quyT7P0uNLO0PsTxzSFD4Y5FtjDvN4uGvYjaFuM1Mjs8iNeyv
	 vLE1Q0WaWpVfg==
Date: Fri, 3 Jan 2025 15:21:16 -0800 (PST)
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
Subject: Re: [PATCH 1/5] xen/perfc: Drop arch_perfc_{gather,reset}()
In-Reply-To: <20250102192508.2405687-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2501031521100.16425@ubuntu-linux-20-04-desktop>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com> <20250102192508.2405687-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-515934889-1735946480=:16425"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-515934889-1735946480=:16425
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 2 Jan 2025, Andrew Cooper wrote:
> These were only ever used by the IA64 port, which was droped in commit
> 570c311ca2c7 ("remove ia64").
> 
> Remove them, and clean up the arm/x86 stub headers.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


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
>  xen/arch/arm/include/asm/perfc.h | 21 ---------------------
>  xen/arch/x86/include/asm/perfc.h | 12 ------------
>  xen/common/perfc.c               |  6 ------
>  3 files changed, 39 deletions(-)
>  delete mode 100644 xen/arch/arm/include/asm/perfc.h
>  delete mode 100644 xen/arch/x86/include/asm/perfc.h
> 
> diff --git a/xen/arch/arm/include/asm/perfc.h b/xen/arch/arm/include/asm/perfc.h
> deleted file mode 100644
> index 95c4b2b6b7bf..000000000000
> --- a/xen/arch/arm/include/asm/perfc.h
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -#ifndef __ASM_PERFC_H__
> -#define __ASM_PERFC_H__
> -
> -static inline void arch_perfc_reset(void)
> -{
> -}
> -
> -static inline void arch_perfc_gather(void)
> -{
> -}
> -
> -#endif
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/x86/include/asm/perfc.h b/xen/arch/x86/include/asm/perfc.h
> deleted file mode 100644
> index a1a591e803a6..000000000000
> --- a/xen/arch/x86/include/asm/perfc.h
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -#ifndef __ASM_PERFC_H__
> -#define __ASM_PERFC_H__
> -
> -static inline void arch_perfc_reset(void)
> -{
> -}
> -
> -static inline void arch_perfc_gather(void)
> -{
> -}
> -
> -#endif
> diff --git a/xen/common/perfc.c b/xen/common/perfc.c
> index 80480aa7766d..ed4dba36f1bc 100644
> --- a/xen/common/perfc.c
> +++ b/xen/common/perfc.c
> @@ -8,7 +8,6 @@
>  #include <xen/mm.h>
>  #include <xen/guest_access.h>
>  #include <public/sysctl.h>
> -#include <asm/perfc.h>
>  
>  #define PERFCOUNTER( var, name )              { name, TYPE_SINGLE, 0 },
>  #define PERFCOUNTER_ARRAY( var, name, size )  { name, TYPE_ARRAY,  size },
> @@ -148,8 +147,6 @@ void cf_check perfc_reset(unsigned char key)
>              break;
>          }
>      }
> -
> -    arch_perfc_reset();
>  }
>  
>  static struct xen_sysctl_perfc_desc perfc_d[NR_PERFCTRS];
> @@ -199,9 +196,6 @@ static int perfc_copy_info(XEN_GUEST_HANDLE_64(xen_sysctl_perfc_desc_t) desc,
>      if ( perfc_vals == NULL )
>          return -ENOMEM;
>  
> -    /* Architecture may fill counters from hardware.  */
> -    arch_perfc_gather();
> -
>      /* We gather the counts together every time. */
>      for ( i = j = v = 0; i < NR_PERFCTRS; i++ )
>      {
> -- 
> 2.39.5
> 
--8323329-515934889-1735946480=:16425--

