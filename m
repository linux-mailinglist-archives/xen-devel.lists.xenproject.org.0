Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B73F84C8C2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 11:39:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677353.1053901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfK8-0001FI-97; Wed, 07 Feb 2024 10:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677353.1053901; Wed, 07 Feb 2024 10:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfK8-0001C4-5Q; Wed, 07 Feb 2024 10:38:36 +0000
Received: by outflank-mailman (input) for mailman id 677353;
 Wed, 07 Feb 2024 10:38:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CAtM=JQ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rXfK7-0001A0-8N
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 10:38:35 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a5cdfa2-c5a5-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 11:38:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id B5412A02E8;
 Wed,  7 Feb 2024 11:38:32 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1GDuaE29GF2; Wed,  7 Feb 2024 11:38:32 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 5443EA02D4;
 Wed,  7 Feb 2024 11:38:32 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rXfK3-00000008jDN-3xTx; Wed, 07 Feb 2024 11:38:31 +0100
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
X-Inumbo-ID: 0a5cdfa2-c5a5-11ee-8a49-1f161083a0e0
Date: Wed, 7 Feb 2024 11:38:31 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH] Mini-OS: x86: zero out .bss segment at boot
Message-ID: <20240207103831.dtvlyjtbmgz7kmll@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240207103138.26901-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240207103138.26901-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mer. 07 févr. 2024 11:31:38 +0100, a ecrit:
> The .bss segment should be zeroed at very early boot.

Is that not done by the elf loader of Xen?

> While adding the extern declaration of __bss_start for x86, make it
> together with the other linker table defined section boundaries
> common for all architectures.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/setup.c      | 2 ++
>  include/arm/arch_mm.h | 1 -
>  include/mm.h          | 2 ++
>  include/x86/arch_mm.h | 1 -
>  4 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/setup.c b/arch/x86/setup.c
> index b27bbed7..3dddf4ad 100644
> --- a/arch/x86/setup.c
> +++ b/arch/x86/setup.c
> @@ -184,6 +184,8 @@ arch_init(void *par)
>  {
>  	static char hello[] = "Bootstrapping...\n";
>  
> +	memset(&__bss_start, 0, &_end - &__bss_start);
> +
>  	hpc_init();
>  	(void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(hello), hello);
>  
> diff --git a/include/arm/arch_mm.h b/include/arm/arch_mm.h
> index 79d9e05b..335eb4ff 100644
> --- a/include/arm/arch_mm.h
> +++ b/include/arm/arch_mm.h
> @@ -3,7 +3,6 @@
>  
>  typedef uint64_t paddr_t;
>  
> -extern char _text, _etext, _erodata, _edata, _end, __bss_start;
>  extern int _boot_stack[];
>  extern int _boot_stack_end[];
>  extern uint32_t physical_address_offset;	/* Add this to a virtual address to get the physical address (wraps at 4GB) */
> diff --git a/include/mm.h b/include/mm.h
> index 4fc364ff..e02e080b 100644
> --- a/include/mm.h
> +++ b/include/mm.h
> @@ -46,6 +46,8 @@
>  #define round_pgdown(_p)  ((_p) & PAGE_MASK)
>  #define round_pgup(_p)    (((_p) + (PAGE_SIZE - 1)) & PAGE_MASK)
>  
> +extern char _text, _etext, _erodata, _edata, _end, __bss_start;
> +
>  extern unsigned long nr_free_pages;
>  
>  extern unsigned long *mm_alloc_bitmap;
> diff --git a/include/x86/arch_mm.h b/include/x86/arch_mm.h
> index a1b975dc..6b398cef 100644
> --- a/include/x86/arch_mm.h
> +++ b/include/x86/arch_mm.h
> @@ -225,7 +225,6 @@ extern unsigned long *phys_to_machine_mapping;
>  #else
>  extern pgentry_t page_table_base[];
>  #endif
> -extern char _text, _etext, _erodata, _edata, _end;
>  extern unsigned long mfn_zero;
>  static __inline__ maddr_t phys_to_machine(paddr_t phys)
>  {
> -- 
> 2.35.3

