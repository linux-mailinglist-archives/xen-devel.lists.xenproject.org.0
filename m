Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0899E331621
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 19:32:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95057.179302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJKeq-00013T-SR; Mon, 08 Mar 2021 18:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95057.179302; Mon, 08 Mar 2021 18:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJKeq-000134-P4; Mon, 08 Mar 2021 18:31:08 +0000
Received: by outflank-mailman (input) for mailman id 95057;
 Mon, 08 Mar 2021 18:31:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=41aJ=IG=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1lJKeo-00012x-V2
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 18:31:07 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8612da2-3f72-4ee1-9b6e-e980253f41a5;
 Mon, 08 Mar 2021 18:31:05 +0000 (UTC)
Received: from zn.tnic (p200300ec2f05ab0000cbc018bb7305ab.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f05:ab00:cb:c018:bb73:5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 402F51EC0473;
 Mon,  8 Mar 2021 19:31:04 +0100 (CET)
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
X-Inumbo-ID: c8612da2-3f72-4ee1-9b6e-e980253f41a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1615228264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=R6Ru9203fpURvzmZRq8yn1riFpTQt60U5lcjEmeWKn0=;
	b=qIptAghnedJcDlkx/F8uwNChFfQEKy4KKBB+5XrfeEuhThKI8g22F1BamxZ83fyPHVx7BX
	oJvtgVXiR88qxGa+hs5ED0PQMY20AkAWQFP4qF9KJN9vVmYqQYRxNHt7L4UqA57BK0gDxx
	1JhtQ+BoV1uLOBTASs1EwTFbeIdf+KM=
Date: Mon, 8 Mar 2021 19:30:58 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>
Subject: Re: [PATCH v5 11/12] x86/paravirt: switch functions with custom code
 to ALTERNATIVE
Message-ID: <20210308183058.GC12548@zn.tnic>
References: <20210308122844.30488-1-jgross@suse.com>
 <20210308122844.30488-12-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210308122844.30488-12-jgross@suse.com>

On Mon, Mar 08, 2021 at 01:28:43PM +0100, Juergen Gross wrote:
> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
> index 36cd71fa097f..04b3067f31b5 100644
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -137,7 +137,8 @@ static inline void write_cr0(unsigned long x)
>  
>  static inline unsigned long read_cr2(void)
>  {
> -	return PVOP_CALLEE0(unsigned long, mmu.read_cr2);
> +	return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
> +				"mov %%cr2, %%rax;", ~X86_FEATURE_XENPV);

Just some cursory poking first - indepth review later.

Do I see this correctly that the negated feature can be expressed with, to use
this example here:

	ALTERNATIVE_TERNARY(mmu.read_cr2, X86_FEATURE_XENPV, "", "mov %%cr2, %%rax;");

?

And then you don't need to touch the patching code for ~feature handling
and the flags byte.

If you want it syntactically sugared, you can define a separate
ALTERNATIVE_NOT macro using ALTERNATIVE_TERNARY...

Hmmm.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

