Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC345836404
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669869.1042335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRu35-0002jI-96; Mon, 22 Jan 2024 13:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669869.1042335; Mon, 22 Jan 2024 13:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRu35-0002hH-65; Mon, 22 Jan 2024 13:09:11 +0000
Received: by outflank-mailman (input) for mailman id 669869;
 Mon, 22 Jan 2024 13:09:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WAGQ=JA=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1rRu32-0002gh-OW
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:09:09 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6be19ecb-b927-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 14:09:06 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 85FBE40E01BB; 
 Mon, 22 Jan 2024 13:09:03 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eLLUWNaX3eQF; Mon, 22 Jan 2024 13:09:01 +0000 (UTC)
Received: from zn.tnic (pd953099d.dip0.t-ipconnect.de [217.83.9.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1EFF040E0196;
 Mon, 22 Jan 2024 13:08:37 +0000 (UTC)
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
X-Inumbo-ID: 6be19ecb-b927-11ee-9b0f-b553b5be7939
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1705928940; bh=eTf0G+nsoYXpQyGDiFAXKjszCHpf9NvYJlgyMa5r3LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6wfFtqitOlRYEO36RZo5CKnIlncNgICpDDk58+bdJ+2vSZnopKKWVngmLzJPdvnd
	 PgVERWwlK9f15OX3gI7Q6CwH5TS2+DzskSmgzVCtKyoqgIVR53JxG4Doxit35vgBcr
	 cR9pb5s0l4t4aPPss1i7RMMXhKlYDbiKqB1Cs502753r9tSXlOM4KHSCWHv3Xm9M/x
	 KYo3qhCRyXTZIapgX63a3gIXI8awEZRwlWBWkty3jIaZ40Cc6jb7ioHwcMcXIOsHvc
	 SQGPOqdsWAzItp/P/V3rJi0gK8hybmypxw9iVR84Y2yv1uizcVN7EgfiKI6etPN27k
	 1B4q7qm3z+GNqfnBkyMPgffLc4vE3v358b0pdMKddE//bw0gKugu7SYS+yKq98aWqv
	 yc9eH2BQXULkjmI7940CALRu1OCsdCgD1aa8hASVyUxAaWwuP6ntdCKI7wxMwsZmFW
	 9/XXTkzpq0w0uNGDxzqLEpDMJ4zQ3pGlsafEWidbF6ooCpgbCD2kZxeyt11sjdb1CP
	 92WMKyBt3wOHiiiw8ia1DZaLo3qAYFzONvwIkiF9KbhVRYldEPxcq0aqx5p7pfczAr
	 O/iRhs84IdZOa0vbNQ4DUcEnAodPN3pzCKYdJqookoTLJQXIM1PFfvLH6ppQAZqjGl
	 0kltp+3VBkgXFIvUP6z1Dh3o=
Date: Mon, 22 Jan 2024 14:08:27 +0100
From: Borislav Petkov <bp@alien8.de>
To: Xin Li <xin3.li@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
	seanjc@google.com, peterz@infradead.org, jgross@suse.com,
	ravi.v.shankar@intel.com, mhiramat@kernel.org,
	andrew.cooper3@citrix.com, jiangshanlai@gmail.com,
	nik.borisov@suse.com, shan.kang@intel.com
Subject: Re: [PATCH v13 07/35] x86/fred: Disable FRED support if
 CONFIG_X86_FRED is disabled
Message-ID: <20240122130827.GQZa5oy4OZHRFEqbsr@fat_crate.local>
References: <20231205105030.8698-1-xin3.li@intel.com>
 <20231205105030.8698-8-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205105030.8698-8-xin3.li@intel.com>

On Tue, Dec 05, 2023 at 02:49:56AM -0800, Xin Li wrote:
> From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
> 
> Add CONFIG_X86_FRED to <asm/disabled-features.h> to make
> cpu_feature_enabled() work correctly with FRED.
> 
> Originally-by: Megha Dey <megha.dey@intel.com>
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> Tested-by: Shan Kang <shan.kang@intel.com>
> Signed-off-by: Xin Li <xin3.li@intel.com>
> ---
> 
> Changes since v10:
> * FRED feature is defined in cpuid word 12, not 13 (Nikolay Borisov).
> ---
>  arch/x86/include/asm/disabled-features.h       | 8 +++++++-
>  tools/arch/x86/include/asm/disabled-features.h | 8 +++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)

Whoever applies this: this one and the previous one can be merged into
one patch.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

