Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FF3A1C3ED
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 16:08:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876957.1287182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbhko-000690-3n; Sat, 25 Jan 2025 15:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876957.1287182; Sat, 25 Jan 2025 15:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbhko-00066u-0i; Sat, 25 Jan 2025 15:07:22 +0000
Received: by outflank-mailman (input) for mailman id 876957;
 Sat, 25 Jan 2025 15:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VOc2=UR=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1tbhkm-00066o-5F
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 15:07:20 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10c7d9fd-db2e-11ef-a0e5-8be0dac302b0;
 Sat, 25 Jan 2025 16:07:18 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 50BDC40E016C; 
 Sat, 25 Jan 2025 15:07:15 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3ear0RxyTJw3; Sat, 25 Jan 2025 15:07:11 +0000 (UTC)
Received: from rn.tnic (unknown [IPv6:2a02:3038:26a:a804:d8b1:8636:c138:a149])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9329440E015F;
 Sat, 25 Jan 2025 15:06:59 +0000 (UTC)
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
X-Inumbo-ID: 10c7d9fd-db2e-11ef-a0e5-8be0dac302b0
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1737817631; bh=bcJcQThfeA4UEAY5LgxBbQHlB0IAX/5v2SleSTUbweM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCj83VmscQRO5wf6bhi81xxSftcLg28eT/WZzEzfyHjVqyshB77EbhH1O4NvAngIa
	 0K1dcN1YeKcIbqeUE0IlonQ/Hb1n/CegoHvL6pPYRzGhU4Vp+F2FP0NKVc7yOn6JN/
	 a2htLEMKxNaYWODwZjFw3549E/DiW3fETin4kwO0Sqo1Yl6GB2NtQV3k0Le9muRp4R
	 B3bjNPW86QA3D+yA//ljwStZlwWg23q2TOlsRzxqeTP/rYm21CFQxCR9XrO9+FgNI/
	 JIfp9yCz0uuqMHt/tVLt0IPuTuRQ7H2hP39DJLS6XkAiKyi2dLSPnEJ1z8zcKVk2Rd
	 02JHiumpJSAT5PXsXLbBYIKWs0z4kFLyDstRGVgduYt54R1I5Xqr2A2Y5CnzO4re+D
	 PSKcPoik0STZNhLEBLQ/An+IcxIIxLlipE2mcFIU2qujxxb7zM4+/tYnQPYBL55/PE
	 j3PgCt2zN6k5URdeZ5BMPaBMEYRHyYl6T1izS2MQEoq1glscXvKDMu8+KbMl1noMRz
	 8au5LfUtcyKr0KeTWdgrCpU+/pnQ6PCWQX7vV9YE6WMcOEHp0FkIvqCaAC1CRVv5W5
	 7MqTDf3hJPUECpC5ecWKNlBENgtEXoGn5JWsCvEEMPtTiemEKw9aC8EvcOYEkEYIe5
	 QUwaAC45dBzAwow2o4DPRIT4=
Date: Sat, 25 Jan 2025 16:06:58 +0100
From: Borislav Petkov <bp@alien8.de>
To: Brian Gerst <brgerst@gmail.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>, Uros Bizjak <ubizjak@gmail.com>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 04/15] x86/pvh: Use fixed_percpu_data for early boot
 GSBASE
Message-ID: <20250125150658.GAZ5T-EloWfjZAwJdU@renoirsky.local>
References: <20250123190747.745588-1-brgerst@gmail.com>
 <20250123190747.745588-5-brgerst@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250123190747.745588-5-brgerst@gmail.com>


On Thu, Jan 23, 2025 at 02:07:36PM -0500, Brian Gerst wrote:
> Instead of having a private area for the stack canary, use
> fixed_percpu_data for GSBASE like the native kernel.
> 
> Signed-off-by: Brian Gerst <brgerst@gmail.com>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/platform/pvh/head.S | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Use ./scripts/get_maintainer.pl pls. I've added Juergen now.

> diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
> index 4733a5f467b8..fa0072e0ca43 100644
> --- a/arch/x86/platform/pvh/head.S
> +++ b/arch/x86/platform/pvh/head.S
> @@ -173,10 +173,15 @@ SYM_CODE_START(pvh_start_xen)
>  1:
>  	UNWIND_HINT_END_OF_STACK
>  
> -	/* Set base address in stack canary descriptor. */
> -	mov $MSR_GS_BASE,%ecx
> -	leal canary(%rip), %eax
> -	xor %edx, %edx
> +	/*
> +	 * Set up GSBASE.
> +	 * Note that, on SMP, the boot cpu uses init data section until
> +	 * the per cpu areas are set up.

s/cpu/CPU/g

check your whole set pls.

> +	 */
> +	movl $MSR_GS_BASE,%ecx
> +	leaq INIT_PER_CPU_VAR(fixed_percpu_data)(%rip), %rdx
> +	movq %edx, %eax
> +	shrq $32, %rdx
>  	wrmsr



