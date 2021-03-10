Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D155A3335B0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 07:08:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95856.180945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJs02-0000kZ-Bk; Wed, 10 Mar 2021 06:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95856.180945; Wed, 10 Mar 2021 06:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJs02-0000kA-8U; Wed, 10 Mar 2021 06:07:14 +0000
Received: by outflank-mailman (input) for mailman id 95856;
 Wed, 10 Mar 2021 06:07:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8s4R=II=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1lJs00-0000k5-Pf
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 06:07:12 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad481ac3-204b-4ed9-97c0-e238f8d67c5a;
 Wed, 10 Mar 2021 06:07:11 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0a99002de44af59edd037d.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:9900:2de4:4af5:9edd:37d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E62DF1EC0473;
 Wed, 10 Mar 2021 07:07:09 +0100 (CET)
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
X-Inumbo-ID: ad481ac3-204b-4ed9-97c0-e238f8d67c5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1615356430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=BzBbQnXUuiDK+nmPzIwIGL4n/Loc18opf7QU0fcWCJI=;
	b=EFBzBnX3lsz0uqv3rvfnAcgyzAPvVERZQvmn6qwVVk3XZ7ShVAeGR0lCSjJr6bRb2Z6d5m
	loNpBlkOf+e6lbtfnVNg9sMVA12nr5iwtTNQ4pYnEi+mB9nQxRqVvotZuQGZvt5WwBhuqD
	676DJkplf/Co08k5EvawCocwKqd5DV0=
Date: Wed, 10 Mar 2021 07:07:05 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v6 04/12] x86/alternative: support not-feature
Message-ID: <20210310060705.GB23521@zn.tnic>
References: <20210309134813.23912-1-jgross@suse.com>
 <20210309134813.23912-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210309134813.23912-5-jgross@suse.com>

On Tue, Mar 09, 2021 at 02:48:05PM +0100, Juergen Gross wrote:
> Add support for alternative patching for the case a feature is not
> present on the current cpu.
> 
> For users of ALTERNATIVE() and friends an inverted feature is specified
> by applying the ALT_NOT() macro to it, e.g.:
> 
> ALTERNATIVE(old, new, ALT_NOT(feature))
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V5:
> - split off from next patch
> - reworked to use flag byte (Boris Petkov)
> V6:
> - rework again to not use flag byte (Boris Petkov)
> ---
>  arch/x86/include/asm/alternative-asm.h |  3 +++
>  arch/x86/include/asm/alternative.h     |  3 +++
>  arch/x86/kernel/alternative.c          | 19 ++++++++++++++-----
>  3 files changed, 20 insertions(+), 5 deletions(-)

LGTM, minor touchups I'd do ontop:

---

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 89889618ae01..fd205cdcfbad 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -55,18 +55,18 @@
 	".long 999b - .\n\t"					\
 	".popsection\n\t"
 
+#define ALTINSTR_FLAG_INV	(1 << 15)
+#define ALT_NOT(feat)		((feat) | ALTINSTR_FLAG_INV)
+
 struct alt_instr {
 	s32 instr_offset;	/* original instruction */
 	s32 repl_offset;	/* offset to replacement instruction */
 	u16 cpuid;		/* cpuid bit set for replacement */
-#define ALTINSTR_FLAG_INV (1 << 15)
 	u8  instrlen;		/* length of original instruction */
 	u8  replacementlen;	/* length of new instruction */
 	u8  padlen;		/* length of build-time padding */
 } __packed;
 
-#define ALT_NOT(feat)	((feat) | ALTINSTR_FLAG_INV)
-
 /*
  * Debug flag that can be tested to see whether alternative
  * instructions were patched in already:
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index d8e669a1546f..133b549dc091 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -397,9 +397,10 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 		BUG_ON(feature >= (NCAPINTS + NBUGINTS) * 32);
 
 		/*
-		 * Drop out if either:
-		 * - feature not available, but required, or
-		 * - feature available, but NOT required
+		 * Patch if either:
+		 * - feature is present
+		 * - feature not present but ALTINSTR_FLAG_INV is set to mean,
+		 *   patch if feature is *NOT* present.
 		 */
 		if (!boot_cpu_has(feature) == !(a->cpuid & ALTINSTR_FLAG_INV)) {
 			if (a->padlen > 1)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

