Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B99CD22CF
	for <lists+xen-devel@lfdr.de>; Sat, 20 Dec 2025 00:15:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191189.1511212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWjgH-00019q-KH; Fri, 19 Dec 2025 23:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191189.1511212; Fri, 19 Dec 2025 23:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWjgH-00017y-H0; Fri, 19 Dec 2025 23:14:41 +0000
Received: by outflank-mailman (input) for mailman id 1191189;
 Fri, 19 Dec 2025 23:14:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4//z=6Z=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1vWjgG-00017s-9i
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 23:14:40 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cf457cf-dd30-11f0-9cce-f158ae23cfc8;
 Sat, 20 Dec 2025 00:14:37 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2F58340E0200; 
 Fri, 19 Dec 2025 23:14:35 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id goW8WhbuMwbl; Fri, 19 Dec 2025 23:14:31 +0000 (UTC)
Received: from rn.tnic (unknown [160.86.253.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 3038840E016C; Fri, 19 Dec 2025 23:14:10 +0000 (UTC)
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
X-Inumbo-ID: 7cf457cf-dd30-11f0-9cce-f158ae23cfc8
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1766186071; bh=CsBXwAp1FXa5OdMQOT31fIYLZoJQpogmOvYurQaWB4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISQ4Rm0nLWlpmd7UwFjS9cxyBlJ2GcZ4RhipjlygwEujhWf+76T2NC1Gkaf/8Yqor
	 L5Zq9Xe46MhNFRoSrGskKpLi7NuZIbcmJAAHTaqjTDYs+icL9H6goIGu7bWDi8ozqK
	 wc0Y082xz7nBmE1mUgWf3HX9Y8+zJzPcG0eKQPcU5rNf7jSyt7e+Yutsf/aJ+8OuAV
	 ItHH1iBcRf2S1hr/RT264ntESFk/YAnAk8H1jPR2BEEt9BAgUauwky5IMxytOM4TTo
	 1c/hjJHnuc4Jg+lKH91QhRQgxGAJMHImmJa1K9RC8H0Zacs38uZpoA131HqFYUoYOf
	 GZlxWbi/pEXMsxaq1lHV+vSMUOegus3KLGTQgIWLmi7UflNVQOeWQFJ4AAO+dKGsIU
	 XDol6jDDX41gVYLw7mFU+D11UdgvJqFJ8W6gN0GnLbksPs5TC7MV8Dd6hDmMN5z/oe
	 nLMx6ZLEuK1WItBCrS8r3dz6OzMIpF+zdb6R5Ppy12HLLOOY3nh/nI/O6Jng/Oubtv
	 rwRv654zggQhpJsKOBqmQJ4cjFyjT7Xt0+U7DLA1K5RuiQ6dsMdYDwHSwN/TV3oHWe
	 SfAEaPSoHiKsQqsTY+N/UzRXECOEGHwtaleaRuDsof+qCqBuiR7bLNOsfbufFaQYw6
	 /jyAsVouB4kcFGTo18yiNiCo=
Date: Sat, 20 Dec 2025 00:14:02 +0100
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariadne Conill <ariadne@ariadne.space>,
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
	darwi@linutronix.de, sandipan.das@amd.com, kai.huang@intel.com,
	me@mixaill.net, yazen.ghannam@amd.com, riel@surriel.com,
	peterz@infradead.org, hpa@zytor.com, x86@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	xen-devel@lists.xenproject.org, stable@vger.kernel.org
Subject: Re: [PATCH] x86/CPU/AMD: avoid printing reset reasons on Xen domU
Message-ID: <20251027131249.GAaP9v0Rs0C2WZvbfR@renoirsky.local>
References: <20251219010131.12659-1-ariadne@ariadne.space>
 <7C6C14C2-ABF8-4A94-B110-7FFBE9D2ED79@alien8.de>
 <aUV4u0r44V5zHV5f@google.com>
 <e2632ad6-6721-4697-a923-53b5bb0c9f0f@citrix.com>
 <aUWNLUEme9FCUeAb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aUWNLUEme9FCUeAb@google.com>

On Fri, Dec 19, 2025 at 09:36:45AM -0800, Sean Christopherson wrote:
> @@ -301,6 +303,20 @@ __ioremap_caller(resource_size_t phys_addr, unsigned long size,
>         if (ioremap_page_range(vaddr, vaddr + size, phys_addr, prot))
>                 goto err_free_area;
>  
> +       /*
> +        * Verify the range was actually mapped when running as a Xen PV DomU
> +        * guest.  Xen PV doesn't emulate a virtual chipset/motherboard, and
> +        * disallows DomU from mapping host physical addresses that the domain
> +        * doesn't own.  Unfortunately, the PTE APIs assume success, and so
> +        * Xen's rejection of the mapping is ignored.
> +        */
> +       if (xen_pv_domain() && !xen_initial_domain()) {
> +               int level;
> +
> +               if (!lookup_address(vaddr, &level))
> +                       goto err_free_area;
> +       }

This activates my ancient allergies caused by the sprinkling "if (XEN)"
randomly across the kernel tree. If this is a PV guest there probably
should be a PV ioremap variant which hides all that gunk away...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

