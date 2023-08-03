Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A7976DDD4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 04:05:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575958.901553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNiW-0008UR-RN; Thu, 03 Aug 2023 02:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575958.901553; Thu, 03 Aug 2023 02:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNiW-0008S4-NJ; Thu, 03 Aug 2023 02:05:32 +0000
Received: by outflank-mailman (input) for mailman id 575958;
 Thu, 03 Aug 2023 02:05:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRNiV-0008Rv-JR
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 02:05:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 382cbd67-31a2-11ee-b267-6b7b168915f2;
 Thu, 03 Aug 2023 04:05:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A519761BA2;
 Thu,  3 Aug 2023 02:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19BBC433C8;
 Thu,  3 Aug 2023 02:05:26 +0000 (UTC)
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
X-Inumbo-ID: 382cbd67-31a2-11ee-b267-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691028328;
	bh=GBnPtI8PPafHynrWGs1h9p7I5P+S0S74fgmbouf7Akk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jTNIGRUA/7SA20mvd8KIEbzOu3R1smFpiTq8qMzyZRFWE8rxcrIZag5lATckdbtcb
	 AA+HditFPJJwZFYJtXfH3jltqYUNLH1ntaWc4fZtjznuZ9/xJh9V9XDLdWGyLICBj4
	 Kmz8s0TnGSXkNZywiZJSu092QXsLhu0BTf6cFQwP9XmmiGsJv7gqbnrIKPifmvuVl0
	 DT4uZm0GrumkjLdt77DKEEMjpU8J4hQoy2Uiox9TeIhrzIWOgMNxcIy1wDemHZ+/xA
	 jYoIxlg4OxehOGhq5DVqhhYL92NguEKXYKntKsYSy+TSqVnGHUs0IfO63MMiKPFMX0
	 jr/qy3aykPd6A==
Date: Wed, 2 Aug 2023 19:05:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 4/4] x86/setup: address MISRA C:2012 Rule 5.3
In-Reply-To: <807b238780c3e2dfce785c6bb173099a4bd38e4b.1690969271.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308021904160.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690969271.git.nicola.vetrini@bugseng.com> <807b238780c3e2dfce785c6bb173099a4bd38e4b.1690969271.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Aug 2023, Nicola Vetrini wrote:
> The parameters renamed in the function declaration caused shadowing
> with the homonymous variable in 'xen/common/efi/boot.c'. Renaming
> them also addresses Rule 8.3:
> "All declarations of an object or function shall use the same names
> and type qualifiers".
> 
> The local variable 'mask' is removed because it shadows the homonymous
> variable defined in an outer scope, with no change to the semantics.
> It was introduced by commit 5a771800114c437fb857b44b3ed74f60e87979c2
> as a refactoring of the branch that handles 'CONFIG_X86_64' for function
> '__start_xen'.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/include/asm/setup.h | 2 +-
>  xen/arch/x86/setup.c             | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
> index 51fce66607..b0e6a39e23 100644
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -33,7 +33,7 @@ static inline void vesa_init(void) {};
>  
>  int construct_dom0(
>      struct domain *d,
> -    const module_t *kernel, unsigned long kernel_headroom,
> +    const module_t *image, unsigned long image_headroom,
>      module_t *initrd,
>      const char *cmdline);
>  void setup_io_bitmap(struct domain *d);
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 2dbe9857aa..80ae973d64 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1577,8 +1577,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          s = map_s;
>          if ( s < map_e )
>          {
> -            uint64_t mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
> -
> +            mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
>              map_s = (s + mask) & ~mask;
>              map_e &= ~mask;
>              init_boot_pages(map_s, map_e);
> -- 
> 2.34.1
> 

