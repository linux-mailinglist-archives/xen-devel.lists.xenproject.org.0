Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F93B7F8FC1
	for <lists+xen-devel@lfdr.de>; Sat, 25 Nov 2023 23:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641252.1000005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r714U-0007Q1-01; Sat, 25 Nov 2023 22:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641252.1000005; Sat, 25 Nov 2023 22:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r714T-0007NO-RO; Sat, 25 Nov 2023 22:24:17 +0000
Received: by outflank-mailman (input) for mailman id 641252;
 Sat, 25 Nov 2023 22:24:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWaD=HG=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r714S-0007ND-Bd
 for xen-devel@lists.xenproject.org; Sat, 25 Nov 2023 22:24:16 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bf1efd6-8be1-11ee-9b0e-b553b5be7939;
 Sat, 25 Nov 2023 23:24:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 133D6200E8;
 Sat, 25 Nov 2023 23:24:12 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YN0-7rbfk1W0; Sat, 25 Nov 2023 23:24:11 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id F03FF200E6;
 Sat, 25 Nov 2023 23:24:11 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r714N-000000060iN-2uzu; Sat, 25 Nov 2023 23:24:11 +0100
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
X-Inumbo-ID: 5bf1efd6-8be1-11ee-9b0e-b553b5be7939
Date: Sat, 25 Nov 2023 23:24:11 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [RFC PATCH] Mini-OS: explicitly mark symbols to be visible for
 apps
Message-ID: <20231125222411.o7rf6awppslwhsro@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231124135903.16621-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231124135903.16621-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 24 nov. 2023 14:59:03 +0100, a ecrit:
> Add an EXPORT_SYMBOL() macro to explicitly mark a symbol to be visible
> for an app or library linked with Mini-OS. This enables to hide all
> other symbols from external components, avoiding any problems with
> duplicate symbol names.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> Based on top of my previous series "Mini-OS: hide mini-os internal
> symbols".
> This is a RFC as an alternative to the map file containing all
> visible symbol names. It would add more code churn, but it has the
> large benefit of declaring visibility of a symbol at the place
> where it is defined, reducing the chance to miss a proper symbol
> visibility definition.
> This patch is including an example for the do_exit() function in
> order to prove the viability of the approach.
> In case this idea is approved, I'd setup a patch series replacing
> the second patch of above series with this patch (minus the do_exit()
> example) and the scattered EXPORT_SYMBOL() instances.

I agree on the rationale, indeed.

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  Makefile      | 3 ++-
>  include/lib.h | 6 ++++++
>  kernel.c      | 1 +
>  mini-os.map   | 1 -
>  4 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index d4768110..5dbad8ce 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -166,7 +166,8 @@ $(OBJ_DIR)/arch/x86/minios-x86%.lds:  arch/x86/minios-x86.lds.S
>  
>  $(OBJ_DIR)/$(TARGET)-kern.o: $(OBJS) arch_lib $(OBJ_DIR)/$(TARGET_ARCH_DIR)/minios-$(MINIOS_TARGET_ARCH).lds mini-os.map
>  	$(LD) -r $(LDFLAGS) $(HEAD_OBJ) $(OBJS) $(LDARCHLIB) -o $@
> -	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* --keep-global-symbols=mini-os.map $@ $@
> +	$(OBJCOPY) --dump-section .export_symbol=syms mini-os-kern.o
> +	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* --keep-global-symbols=mini-os.map --keep-global-symbols=syms --remove-section=.export_symbol $@ $@
>  
>  $(OBJ_DIR)/$(TARGET): $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O)
>  	$(LD) -r $(LDFLAGS) $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O) $(LDLIBS) -o $@.o
> diff --git a/include/lib.h b/include/lib.h
> index dd68985a..24fd0186 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -64,6 +64,12 @@
>  #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
>  #endif
>  
> +#define EXPORT_SYMBOL(sym)                    \
> +    extern typeof(sym) sym;                   \
> +    asm(".section \".export_symbol\",\"a\"\n" \
> +        "\t.ascii \""#sym"\n\"\n"             \
> +        ".previous")
> +
>  #ifdef HAVE_LIBC
>  #include <sys/queue.h>
>  #include <sys/stat.h>
> diff --git a/kernel.c b/kernel.c
> index 1f97d8dd..29eed535 100644
> --- a/kernel.c
> +++ b/kernel.c
> @@ -199,3 +199,4 @@ void do_exit(void)
>          HYPERVISOR_sched_op(SCHEDOP_shutdown, &sched_shutdown);
>      }
>  }
> +EXPORT_SYMBOL(do_exit);
> diff --git a/mini-os.map b/mini-os.map
> index 58a3a0ee..90f02edf 100644
> --- a/mini-os.map
> +++ b/mini-os.map
> @@ -69,7 +69,6 @@ close
>  closedir
>  closelog
>  connect
> -do_exit
>  dup
>  dup2
>  err
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

