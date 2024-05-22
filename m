Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11448CB860
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 03:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727173.1131594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9al3-0005Zo-Rr; Wed, 22 May 2024 01:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727173.1131594; Wed, 22 May 2024 01:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9al3-0005Wq-Oq; Wed, 22 May 2024 01:27:09 +0000
Received: by outflank-mailman (input) for mailman id 727173;
 Wed, 22 May 2024 01:27:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujjH=MZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s9al2-0005Wk-B1
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 01:27:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65b05b36-17da-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 03:27:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 38269623C9;
 Wed, 22 May 2024 01:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC74C2BD11;
 Wed, 22 May 2024 01:27:01 +0000 (UTC)
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
X-Inumbo-ID: 65b05b36-17da-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716341223;
	bh=TXldyTLK3Cf+rlFk9PEM4RWOf3bbRQQ10lumRKf+fxI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D16D0ZhuBkylC0MJKZRPVTcDlcRqlBRq35ROAI8JyxQSQ4147ZWe0lg3xaOrHfk1O
	 TvBbdKGKLWPcbIL0VtpQFZNNIiLO9SIhhKXqfaAQ8BpjUHFX16CqmmnCcm/zyb9Vvs
	 4wCRJ5X714+JwVlXcwlzOYbZtRReNW9Io9irSilfF9Fqcs9SfXIXfCMNI9tRXoU/yz
	 exiJ0TVR4GFGjtszgEwrPksQPesElWY9BYF0eeGPiHjxDAAmL/CefX2/xIxWBCV9SR
	 MK0SwH1/Ik1kxozTPYo3iI45PkspsBKu3c80FMK5GrU0Bud1cph0JS4594JZc/fvyv
	 XnkfhrMZykK7A==
Date: Tue, 21 May 2024 18:26:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 3/3] xen/x86: Address two misc MISRA 17.7 violations
In-Reply-To: <20240521171546.3650664-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405211826520.1052252@ubuntu-linux-20-04-desktop>
References: <20240521171546.3650664-1-andrew.cooper3@citrix.com> <20240521171546.3650664-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 May 2024, Andrew Cooper wrote:
> Neither text_poke() nor watchdog_setup() have return value consulted.  Switch
> them to being void.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/x86/alternative.c | 4 ++--
>  xen/arch/x86/nmi.c         | 5 ++---
>  xen/include/xen/watchdog.h | 2 +-
>  3 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
> index 2e7ba6e0b833..7824053c9d33 100644
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -155,10 +155,10 @@ void init_or_livepatch add_nops(void *insns, unsigned int len)
>   * "noinline" to cause control flow change and thus invalidate I$ and
>   * cause refetch after modification.
>   */
> -static void *init_or_livepatch noinline
> +static void init_or_livepatch noinline
>  text_poke(void *addr, const void *opcode, size_t len)
>  {
> -    return memcpy(addr, opcode, len);
> +    memcpy(addr, opcode, len);
>  }
>  
>  extern void *const __initdata_cf_clobber_start[];
> diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
> index f6329cb0270e..9793fa23168d 100644
> --- a/xen/arch/x86/nmi.c
> +++ b/xen/arch/x86/nmi.c
> @@ -464,12 +464,12 @@ bool watchdog_enabled(void)
>      return !atomic_read(&watchdog_disable_count);
>  }
>  
> -int __init watchdog_setup(void)
> +void __init watchdog_setup(void)
>  {
>      unsigned int cpu;
>  
>      /*
> -     * Activate periodic heartbeats. We cannot do this earlier during 
> +     * Activate periodic heartbeats. We cannot do this earlier during
>       * setup because the timer infrastructure is not available.
>       */
>      for_each_online_cpu ( cpu )
> @@ -477,7 +477,6 @@ int __init watchdog_setup(void)
>      register_cpu_notifier(&cpu_nmi_nfb);
>  
>      watchdog_enable();
> -    return 0;
>  }
>  
>  /* Returns false if this was not a watchdog NMI, true otherwise */
> diff --git a/xen/include/xen/watchdog.h b/xen/include/xen/watchdog.h
> index 434fcbdd2b11..40c21bca823f 100644
> --- a/xen/include/xen/watchdog.h
> +++ b/xen/include/xen/watchdog.h
> @@ -10,7 +10,7 @@
>  #include <xen/types.h>
>  
>  /* Try to set up a watchdog. */
> -int watchdog_setup(void);
> +void watchdog_setup(void);
>  
>  /* Enable the watchdog. */
>  void watchdog_enable(void);
> -- 
> 2.30.2
> 

