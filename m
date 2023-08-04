Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6611D770AC1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 23:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577348.904432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2Hy-0001FJ-SO; Fri, 04 Aug 2023 21:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577348.904432; Fri, 04 Aug 2023 21:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2Hy-0001Cd-P6; Fri, 04 Aug 2023 21:24:50 +0000
Received: by outflank-mailman (input) for mailman id 577348;
 Fri, 04 Aug 2023 21:24:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS2Hx-0001CX-J4
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 21:24:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56c27a8a-330d-11ee-b271-6b7b168915f2;
 Fri, 04 Aug 2023 23:24:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AC40620AE;
 Fri,  4 Aug 2023 21:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849BAC433C7;
 Fri,  4 Aug 2023 21:24:45 +0000 (UTC)
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
X-Inumbo-ID: 56c27a8a-330d-11ee-b271-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691184287;
	bh=3jc8Tl1pBILA3Kk15KkbYw1ZW5lrkn+/IBolYaQsCZo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eNU5IF4X4xfMDqPI6FRs4eKig48aCUGtHprrR8Ez1FfHYBdW2ECjVffj50I8ivjZw
	 iwfCKi7OGOshKAqh1/bsaHElDHlczOLYpPSqPNQxFIbdd/o4Jp/kGSbaNhtlOUloD9
	 bqAo18SvhAwnvSMGkMF4us3kXzK7sunwpxD1NEYYQlBt6dT0PsLMhJOx9DY4klI7sr
	 BHhE65pFlsy0NlwPcqzFM+7b3zCHI46DlGYnfC/7tmtQDciwvHi7ZVCsl16RtRmQDT
	 Dj0G2RFt99Ytqz3EjtKWCf4HteluKoMG8lYpu+ji7Ibx0m3EQnQ1VhVb3AWaIrAJIr
	 zVJKlEem4fU8g==
Date: Fri, 4 Aug 2023 14:24:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 4/6] x86/include: address MISRA C:2012 Rule 5.3.
In-Reply-To: <40823fbaa9e0a9b026e5ff3b01af9d83583889fd.1691162261.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308041424240.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com> <40823fbaa9e0a9b026e5ff3b01af9d83583889fd.1691162261.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Nicola Vetrini wrote:
> s/mpc_default_type/mpc_default in 'xen/arch/x86/include/asm/mpspec.h'
> to avoid clashing with function parameter names in 'mpparse.c'.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Even though the global variable does not seem to be used anywhere and is
> perhaps better to remove it entirely.

Please remove it

> ---
>  xen/arch/x86/include/asm/mpspec.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/include/asm/mpspec.h b/xen/arch/x86/include/asm/mpspec.h
> index 1246eece0b..cc96ee63bd 100644
> --- a/xen/arch/x86/include/asm/mpspec.h
> +++ b/xen/arch/x86/include/asm/mpspec.h
> @@ -15,7 +15,7 @@ extern void get_smp_config (void);
>  extern unsigned char apic_version [MAX_APICS];
>  extern int mp_irq_entries;
>  extern struct mpc_config_intsrc mp_irqs [MAX_IRQ_SOURCES];
> -extern int mpc_default_type;
> +extern int mpc_default;
>  extern unsigned long mp_lapic_addr;
>  extern bool pic_mode;
>  
> -- 
> 2.34.1
> 

