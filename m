Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD62737697
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 23:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552378.862430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiqn-0007Ne-7j; Tue, 20 Jun 2023 21:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552378.862430; Tue, 20 Jun 2023 21:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiqn-0007Lk-4k; Tue, 20 Jun 2023 21:25:21 +0000
Received: by outflank-mailman (input) for mailman id 552378;
 Tue, 20 Jun 2023 21:25:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJOa=CI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBiql-0007Lc-Ho
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 21:25:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3067a06-0fb0-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 23:25:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC3F5611DF;
 Tue, 20 Jun 2023 21:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF50C433C0;
 Tue, 20 Jun 2023 21:25:13 +0000 (UTC)
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
X-Inumbo-ID: f3067a06-0fb0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296315;
	bh=k5Wns646Hblfxr+U05jE1yhaaxS+CsQxVfMrNPpdUqo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lJ52d0HLc6Wy1Lf5Foky4IkPA8AHnOku4t5yoIfPYlkIjpqtc9bB4ZAe/a24wVCS3
	 d63Hz8dAGy7CMC0zYjsKKPxB+BVuODiQP6Bx+HiJ1fYk1byEzn9mldqn8cgvBgY/Yk
	 lTbZnH2SBk4Qnaij1aijLxPj5kUbxZbhxCUwCgEefRxDMsEvo3590acXATZq1vKgP+
	 rwT9TgR/nhUJh886jjpTxOBBiawaJzAb5qXa7qmKJqqYrRoDqk3IubouWAiQ43Horf
	 OJXv0VmLvJjHYXgwqJgjngtp5/GFXuNEHgFImq3ZHkHmu6EH9cNjbthX2Fj8qsEewS
	 EQxiXgkZx7k6w==
Date: Tue, 20 Jun 2023 14:25:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH] build: Drop CONFIG_$ARCH_$(XEN_OS) definitions
In-Reply-To: <20230619180614.3610284-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2306201424560.897208@ubuntu-linux-20-04-desktop>
References: <20230619180614.3610284-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1372300645-1687296315=:897208"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1372300645-1687296315=:897208
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 19 Jun 2023, Andrew Cooper wrote:
> These aren't used, and are not obvious useful either.
> 
> tools/ does have some logic which works on $(XEN_OS) directly, and some on
> CONFIG_$(XEN_OS) too, but this isn't how we typically refer to things.
> 
> The only user ever of this scheme was introduced in c0fd920e987 (2006) and
> deleted in fa2244104b4 (2010).
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> The necessary rune is:
> 
>   git grep -E "CONFIG_(X86|ARM|RISCV)_(FreeBSD|Linux|MiniOS|NetBSD|OpenBSD|SunOS)"
> ---
>  config/arm32.mk   | 1 -
>  config/arm64.mk   | 1 -
>  config/riscv64.mk | 1 -
>  config/x86_32.mk  | 1 -
>  config/x86_64.mk  | 1 -
>  5 files changed, 5 deletions(-)
> 
> diff --git a/config/arm32.mk b/config/arm32.mk
> index f95228e3c079..c38d89cb30fc 100644
> --- a/config/arm32.mk
> +++ b/config/arm32.mk
> @@ -1,6 +1,5 @@
>  CONFIG_ARM := y
>  CONFIG_ARM_32 := y
> -CONFIG_ARM_$(XEN_OS) := y
>  
>  CONFIG_XEN_INSTALL_SUFFIX :=
>  
> diff --git a/config/arm64.mk b/config/arm64.mk
> index aa45772b6173..c4662f67d044 100644
> --- a/config/arm64.mk
> +++ b/config/arm64.mk
> @@ -1,6 +1,5 @@
>  CONFIG_ARM := y
>  CONFIG_ARM_64 := y
> -CONFIG_ARM_$(XEN_OS) := y
>  
>  CONFIG_XEN_INSTALL_SUFFIX :=
>  
> diff --git a/config/riscv64.mk b/config/riscv64.mk
> index a5a21e5fa220..91c6e53da6f8 100644
> --- a/config/riscv64.mk
> +++ b/config/riscv64.mk
> @@ -1,5 +1,4 @@
>  CONFIG_RISCV := y
>  CONFIG_RISCV_64 := y
> -CONFIG_RISCV_$(XEN_OS) := y
>  
>  CONFIG_XEN_INSTALL_SUFFIX :=
> diff --git a/config/x86_32.mk b/config/x86_32.mk
> index bc96ff013d74..3cc046d9bcf3 100644
> --- a/config/x86_32.mk
> +++ b/config/x86_32.mk
> @@ -1,6 +1,5 @@
>  CONFIG_X86 := y
>  CONFIG_X86_32 := y
> -CONFIG_X86_$(XEN_OS) := y
>  
>  CONFIG_MIGRATE := y
>  CONFIG_XCUTILS := y
> diff --git a/config/x86_64.mk b/config/x86_64.mk
> index 4afef4414129..8614457b03d0 100644
> --- a/config/x86_64.mk
> +++ b/config/x86_64.mk
> @@ -1,6 +1,5 @@
>  CONFIG_X86 := y
>  CONFIG_X86_64 := y
> -CONFIG_X86_$(XEN_OS) := y
>  
>  CONFIG_MIGRATE := y
>  CONFIG_XCUTILS := y
> 
> base-commit: 43e863a02d81f5fff32763b23d2a39f041f7e62b
> -- 
> 2.30.2
> 
--8323329-1372300645-1687296315=:897208--

