Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67337412DA3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 06:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191283.341240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSWwZ-0007TS-2E; Tue, 21 Sep 2021 03:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191283.341240; Tue, 21 Sep 2021 03:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSWwY-0007RX-UE; Tue, 21 Sep 2021 03:59:42 +0000
Received: by outflank-mailman (input) for mailman id 191283;
 Tue, 21 Sep 2021 03:59:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cbwx=OL=kernel.org=nathan@srs-us1.protection.inumbo.net>)
 id 1mSWwX-0007RR-5C
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 03:59:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57eb5902-1a90-11ec-b895-12813bfff9fa;
 Tue, 21 Sep 2021 03:59:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1516B611C5;
 Tue, 21 Sep 2021 03:59:36 +0000 (UTC)
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
X-Inumbo-ID: 57eb5902-1a90-11ec-b895-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632196779;
	bh=7OFVjzBNfyXXNiMg++zl6W4YbQ+GkChXNDPM6C4fm5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3XB9+ugrNqVsTPmuetwR6tFfbxIb+a2Z7toWMqN0Dy+j2Cbd7wAA1OEPwy8tAEbZ
	 ZjOua8+cY72aS72AP8eojwewsPQkKUXi2TtXcnk2kUzalmAKD01uRtWYX+3OA8Gepk
	 B87YzxW/IBbfeVyitYV3IaTEAdLqdcLDfGb17WGpYDIka9EhrHUme/0D12blfxBtCu
	 eJPWLehJsL7qkqgkblKCHlkbCjcuZ/ek106F5zZEGKWvfpWeQoNGGFGljGLDpsIpv1
	 OlBIdUGF7H3tJPgr997lQ9+w/Fo16rZSiWOXwAFb2KxZM19MDil9rGz75CswVKOYZB
	 7O9rHggfmZiQA==
Date: Mon, 20 Sep 2021 20:59:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, efault@gmx.de,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2] x86/setup: call early_reserve_memory() earlier
Message-ID: <YUlYpWhGCxpJ9diw@archlinux-ax161>
References: <20210920120421.29276-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210920120421.29276-1-jgross@suse.com>

On Mon, Sep 20, 2021 at 02:04:21PM +0200, Juergen Gross wrote:
> Commit a799c2bd29d19c565 ("x86/setup: Consolidate early memory
> reservations") introduced early_reserve_memory() to do all needed
> initial memblock_reserve() calls in one function. Unfortunately the
> call of early_reserve_memory() is done too late for Xen dom0, as in
> some cases a Xen hook called by e820__memory_setup() will need those
> memory reservations to have happened already.
> 
> Move the call of early_reserve_memory() before the call of
> e820__memory_setup() in order to avoid such problems.
> 
> Cc: stable@vger.kernel.org
> Fixes: a799c2bd29d19c565 ("x86/setup: Consolidate early memory reservations")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

I had issues on an AMD Ryzen 3 4300G based system with v1. v2 does not
trigger any boot issues on that same machine or an Intel i5-4210U based
system that I also test with.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
> V2:
> - update comment (Jan Beulich, Boris Petkov)
> - move call down in setup_arch() (Mike Galbraith)
> ---
>  arch/x86/kernel/setup.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 79f164141116..40ed44ead063 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -830,6 +830,20 @@ void __init setup_arch(char **cmdline_p)
>  
>  	x86_init.oem.arch_setup();
>  
> +	/*
> +	 * Do some memory reservations *before* memory is added to memblock, so
> +	 * memblock allocations won't overwrite it.
> +	 *
> +	 * After this point, everything still needed from the boot loader or
> +	 * firmware or kernel text should be early reserved or marked not RAM in
> +	 * e820. All other memory is free game.
> +	 *
> +	 * This call needs to happen before e820__memory_setup() which calls the
> +	 * xen_memory_setup() on Xen dom0 which relies on the fact that those
> +	 * early reservations have happened already.
> +	 */
> +	early_reserve_memory();
> +
>  	iomem_resource.end = (1ULL << boot_cpu_data.x86_phys_bits) - 1;
>  	e820__memory_setup();
>  	parse_setup_data();
> @@ -876,18 +890,6 @@ void __init setup_arch(char **cmdline_p)
>  
>  	parse_early_param();
>  
> -	/*
> -	 * Do some memory reservations *before* memory is added to
> -	 * memblock, so memblock allocations won't overwrite it.
> -	 * Do it after early param, so we could get (unlikely) panic from
> -	 * serial.
> -	 *
> -	 * After this point everything still needed from the boot loader or
> -	 * firmware or kernel text should be early reserved or marked not
> -	 * RAM in e820. All other memory is free game.
> -	 */
> -	early_reserve_memory();
> -
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  	/*
>  	 * Memory used by the kernel cannot be hot-removed because Linux
> -- 
> 2.26.2
> 
> 

