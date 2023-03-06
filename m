Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2393D6AB891
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 09:41:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506775.779928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6PY-0008TX-Su; Mon, 06 Mar 2023 08:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506775.779928; Mon, 06 Mar 2023 08:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6PY-0008Qr-PW; Mon, 06 Mar 2023 08:41:36 +0000
Received: by outflank-mailman (input) for mailman id 506775;
 Mon, 06 Mar 2023 08:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q3Qw=66=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1pZ6PN-0008QZ-ET
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 08:41:35 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad005f2d-bbfa-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 09:41:24 +0100 (CET)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 364BD1EC0554;
 Mon,  6 Mar 2023 09:41:23 +0100 (CET)
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
X-Inumbo-ID: ad005f2d-bbfa-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1678092083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=Ch2JqcQidKQQw3jxmmjcy3XtJaLHvZg4719TcnfXY28=;
	b=Qx2LNM8GAehIIoRwD6DIBt12Y5dpKRZm+CSgKO+pDq6m4Xe438WsLBNmOQg6NKRA3ywcQ5
	LJE1fX9vDOQbHArJ99nI+xx1I2w/W+UEGxcn4QY6UKQEBvGEq5lZ1JEnIu+MfHiejEZE/z
	aGW6efJMwgYssl+dV21lAbF+6UBau7E=
Date: Mon, 6 Mar 2023 09:41:17 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux-foundation.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/paravirt: merge activate_mm and dup_mmap callbacks
Message-ID: <20230306084117.GAZAWnLeGI09VLsXkC@fat_crate.local>
References: <20230207075902.7539-1-jgross@suse.com>
 <dc5fbb2e-6a23-15e5-a451-e069e90a0656@csail.mit.edu>
 <2b4b0590-8327-3567-f4cd-e610d52fbf1c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b4b0590-8327-3567-f4cd-e610d52fbf1c@suse.com>

On Thu, Feb 23, 2023 at 04:05:51PM +0100, Juergen Gross wrote:
> x86 maintainers, I think this patch should be carried via the tip tree.

You missed a spot. I'll whack it.

diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index a8b323266179..c3ad8a526378 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -16,13 +16,6 @@
 
 extern atomic64_t last_mm_ctx_id;
 
-#ifndef CONFIG_PARAVIRT_XXL
-static inline void paravirt_activate_mm(struct mm_struct *prev,
-					struct mm_struct *next)
-{
-}
-#endif	/* !CONFIG_PARAVIRT_XXL */
-
 #ifdef CONFIG_PERF_EVENTS
 DECLARE_STATIC_KEY_FALSE(rdpmc_never_available_key);
 DECLARE_STATIC_KEY_FALSE(rdpmc_always_available_key);

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

