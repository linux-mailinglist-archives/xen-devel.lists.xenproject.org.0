Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5307FB6C5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642920.1002724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7v2D-0007yR-2D; Tue, 28 Nov 2023 10:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642920.1002724; Tue, 28 Nov 2023 10:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7v2C-0007vN-VD; Tue, 28 Nov 2023 10:09:40 +0000
Received: by outflank-mailman (input) for mailman id 642920;
 Tue, 28 Nov 2023 10:09:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oxj7=HJ=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1r7v2B-0007vH-Om
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:09:39 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c59504a-8dd6-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 11:09:37 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 882A740E01B1; 
 Tue, 28 Nov 2023 10:09:36 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id n6vaYX6mQPGx; Tue, 28 Nov 2023 10:09:34 +0000 (UTC)
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8B4B840E01A5;
 Tue, 28 Nov 2023 10:09:11 +0000 (UTC)
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
X-Inumbo-ID: 3c59504a-8dd6-11ee-9b0e-b553b5be7939
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701166173; bh=ZbOAIQjytTHlygvBJZdtmYHZgd+py/hKn6bkyMaazjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WqvcBgi4X9QIQCMq9rbbSQ5yckzcUFi2nYsW5MeInmATYRTahKqBugagSn2r6mcCf
	 0OKLl1fUw7IGcqogaH5K60o9MnxTMAwqVZcoLJj+TMs/KT0za6Zq7t1tW2/Ky9ATC4
	 pMaezQt2tstNf5o+V8MgG9hsMUIkDdRe8+AHDweomKer8/hpIZOyUDVdCsCvQm3EJp
	 R8fH+CyGxdZZedQ8ges+Y8u0LMmQYV3AqbrSkYKdbd1u6YGggNSvJV8KIpYwS/MrtT
	 8NLKg58ZHCK194AabA4fUcsX2l5x6TPCAG6E8WunhkXo7OyDI18O5HIsYKRlEnF2xz
	 DK+vBY+Etna4jLAt3huPcAlHSrV/TsprLkW+MM74k+XziphA6FKIN0HOJarlWLhol2
	 K0F1NhYJ5bIokwuhXGJqZ0FXH/v94Ul/8v435Jva0XF3m/skw6ISeuyDuv7kpDbOhT
	 fXNefHnI2Dc5iXbQpfiCXIb74g9FH7zPTXzsEMG2ez0G3YN8cMrrFRtDqZT7WQJUuc
	 CX3jZGcfJrp5UiW8OoFEM4FajOlEuVTcNzPYei0+052dHmkxO7AbDriA2oZOklc953
	 dej16pz5yYo1mdKVZaGNo/ODqFn8nXdYtyFEtOfQEi8eCl0wau/qz0RlzdveGBe5Mv
	 d2OWeQiMp1IFOzr8SWk0eIUk=
Date: Tue, 28 Nov 2023 11:09:10 +0100
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
	nik.borisov@suse.com
Subject: Re: [PATCH v12 24/37] x86/idtentry: Incorporate
 definitions/declarations of the FRED entries
Message-ID: <20231128100910.GSZWW8RnyhX0YQjwDm@fat_crate.local>
References: <20231003062458.23552-1-xin3.li@intel.com>
 <20231003062458.23552-25-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231003062458.23552-25-xin3.li@intel.com>

On Mon, Oct 02, 2023 at 11:24:45PM -0700, Xin Li wrote:
> FRED and IDT can share most of the definitions and declarations so
> that in the majority of cases the actual handler implementation is the
> same.
> 
> The differences are the exceptions where FRED stores exception related
> information on the stack and the sysvec implementations as FRED can
> handle irqentry/exit() in the dispatcher instead of having it in each
> handler.
> 
> Also add stub defines for vectors which are not used due to Kconfig
> decisions to spare the ifdeffery in the actual FRED dispatch code.
> 
> Tested-by: Shan Kang <shan.kang@intel.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Xin Li <xin3.li@intel.com>

This makes me wonder too who the author is. The commit message text
sounds like tglx. :)

> @@ -137,6 +141,17 @@ static __always_inline void __##func(struct pt_regs *regs,		\
>  #define DEFINE_IDTENTRY_RAW(func)					\
>  __visible noinstr void func(struct pt_regs *regs)
>  
> +/**
> + * DEFINE_FREDENTRY_RAW - Emit code for raw FRED entry points

LOL, "FREDENTRY"

...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

