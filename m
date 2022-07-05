Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D2356720A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 17:05:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361389.590878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8k6X-0005P2-2e; Tue, 05 Jul 2022 15:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361389.590878; Tue, 05 Jul 2022 15:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8k6W-0005MZ-Vl; Tue, 05 Jul 2022 15:04:44 +0000
Received: by outflank-mailman (input) for mailman id 361389;
 Tue, 05 Jul 2022 15:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kDjK=XK=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1o8k6V-0005MT-R8
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 15:04:43 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbb877d6-fc73-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 17:04:42 +0200 (CEST)
Received: from zn.tnic (p200300ea970ff682329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:970f:f682:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7299F1EC0513;
 Tue,  5 Jul 2022 17:04:36 +0200 (CEST)
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
X-Inumbo-ID: cbb877d6-fc73-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1657033476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=A3o83DD+B1z/6kiI4KQQIPd6dtqOA5pz/dpE36h38W8=;
	b=jkN8Vw62hc7iKa88OPl2ClVxqDZZcTXMySFImEcGL0S8nJorx7CDCmqDTQMJnayaw9xIzk
	LHjGDPZOSaxrCRUZSFFMFEyCqqMiIRerKV2/mupELKxAl+F8Ac8RaI6qFg84cYP+XxKbP1
	sYaLNFoWAfyJuXvx/Ucp4B3UoyvyWmI=
Date: Tue, 5 Jul 2022 17:04:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Lutomirski <luto@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/PAT: have pat_enabled() properly reflect state when
 running on e.g. Xen
Message-ID: <YsRTAGI2PhfZ5V7M@zn.tnic>
References: <9385fa60-fa5d-f559-a137-6608408f88b0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9385fa60-fa5d-f559-a137-6608408f88b0@suse.com>

On Thu, Apr 28, 2022 at 04:50:29PM +0200, Jan Beulich wrote:
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -62,6 +62,7 @@
>  
>  static bool __read_mostly pat_bp_initialized;
>  static bool __read_mostly pat_disabled = !IS_ENABLED(CONFIG_X86_PAT);
> +static bool __initdata pat_force_disabled = !IS_ENABLED(CONFIG_X86_PAT);
>  static bool __read_mostly pat_bp_enabled;
>  static bool __read_mostly pat_cm_initialized;

Why yet another boolean var?

Why not extend pat_enabled() to reflect the Xen case and explain it
properly above it?

My comment is likely wrong because I don't know what the Xen HV hides or
doesn't but you get the idea...

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index d5ef64ddd35e..a8f1a02f9bc2 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -92,6 +92,13 @@ early_param("nopat", nopat);
 
 bool pat_enabled(void)
 {
+	/*
+	 * Xen PV doesn't expose the PAT MSR to dom0 so the proper init path
+	 * there cannot be exercised. Announce PAT is enabled in that case too.
+	 */
+	if (cpu_feature_enabled(X86_FEATURE_XENPV) && !pat_disabled)
+		return true;
+
 	return pat_bp_enabled;
 }
 EXPORT_SYMBOL_GPL(pat_enabled);

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

