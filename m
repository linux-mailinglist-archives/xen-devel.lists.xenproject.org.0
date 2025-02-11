Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF0A30F07
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 16:02:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885650.1295465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thrlx-00059e-Qx; Tue, 11 Feb 2025 15:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885650.1295465; Tue, 11 Feb 2025 15:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thrlx-00057z-Ns; Tue, 11 Feb 2025 15:02:01 +0000
Received: by outflank-mailman (input) for mailman id 885650;
 Tue, 11 Feb 2025 15:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zckm=VC=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1thrlw-0004x2-Ft
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 15:02:00 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 222e4f91-e889-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 16:01:55 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C079340E0220; 
 Tue, 11 Feb 2025 15:01:53 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vcaTo4I3qsTZ; Tue, 11 Feb 2025 15:01:50 +0000 (UTC)
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7F6A240E01AE;
 Tue, 11 Feb 2025 15:01:23 +0000 (UTC)
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
X-Inumbo-ID: 222e4f91-e889-11ef-b3ef-695165c68f79
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1739286109; bh=4lwHEX7loO/SRy+ZxkW2JvVT9zUzrCSHPE5+qCPs4Vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DpBI7Aqt8XOmID6XpqbDT6/JpWJ5yVuWy4TG2lI1I2RyyHucsQiPgTTbMFr+3APKE
	 vaRUG4GIlOzxTU7YUIqQaaJU7BZE3orP1yegfSTUKgT1lxeqrQgWZfKA3x6KXW4Qvh
	 Fmod4YL2KZ9eM8+nBAFJX18wZO8dX+OVtTHO+ERgfD/COIHzZak/rQkWDrzM8OUJzt
	 yDnh8pqfBZwKx5Pztz5ocTaM9hKiTWmb3XDQ+JYa8ptGy8Z9mlwqlbt5/zxlqajcrS
	 nCDSCzOfOH8dW+quN4fuLfRtCcjkuB2YKjhDgIuGlwXcyxgxsv2xNu6BIHkfCIu57T
	 dI3o6w7SJEYUnM3DccFMM2p7429H/Dbgolh0WNYMxImLZV9p3qVx1UCoLr1HOD5zEb
	 XeYWpWM5TAizW4An75m3IzKvBguY8O+HEf2DgqgFMy6/UrWgRx9lnzMyfgmtZsybpk
	 ewR38IijGkYWVNMTLoBdPuqnO+h1+ruRV3z2Cy2UoZdbRq67StoxJzL0dsuX5eyi4B
	 KNjYQlmCCsqqCRM0TsE9OAC4ybr5CUT3UCUPvIcSwoYDHPKGVAFK3OhGZ8h6ekN5DA
	 v+aqAFlzwhlYaJFyH+6bEW/HlTfbiwxSaatnuKXcl8tPmhFzoDDkuSgRm1lFyK7vYt
	 mfLheS+6IIG/fb5cqt1E39HQ=
Date: Tue, 11 Feb 2025 16:01:14 +0100
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Juergen Gross <jgross@suse.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev,
	linux-hyperv@vger.kernel.org, jailhouse-dev@googlegroups.com,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	Nikunj A Dadhania <nikunj@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
Message-ID: <20250211150114.GCZ6tmOqV4rI04HVuY@fat_crate.local>
References: <20250201021718.699411-1-seanjc@google.com>
 <20250201021718.699411-2-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250201021718.699411-2-seanjc@google.com>

On Fri, Jan 31, 2025 at 06:17:03PM -0800, Sean Christopherson wrote:
> Extract retrieval of TSC frequency information from CPUID into standalone
> helpers so that TDX guest support and kvmlock can reuse the logic.  Provide
> a version that includes the multiplier math as TDX in particular does NOT
> want to use native_calibrate_tsc()'s fallback logic that derives the TSC
> frequency based on CPUID.0x16 when the core crystal frequency isn't known.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/tsc.h | 41 ++++++++++++++++++++++++++++++++++++++
>  arch/x86/kernel/tsc.c      | 14 ++-----------
>  2 files changed, 43 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
> index 94408a784c8e..14a81a66b37c 100644
> --- a/arch/x86/include/asm/tsc.h
> +++ b/arch/x86/include/asm/tsc.h

Bah, why in the header as inlines? Just leave them in tsc.c and call them...

> @@ -28,6 +28,47 @@ static inline cycles_t get_cycles(void)
>  }
>  #define get_cycles get_cycles
>  
> +static inline int cpuid_get_tsc_info(unsigned int *crystal_khz,
> +				     unsigned int *denominator,
> +				     unsigned int *numerator)

Can we pls do a

struct cpuid_tsc_info {
	unsigned int denominator;
	unsigned int numerator;
	unsigned int crystal_khz;
	unsigned int tsc_khz;
}

and hand that around instead of those I/O pointers?

It would make the code a bit saner to stare at and follow.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

