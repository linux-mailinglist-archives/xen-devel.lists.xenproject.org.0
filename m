Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF16191E7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 08:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437315.691635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqr6u-00011N-Fy; Fri, 04 Nov 2022 07:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437315.691635; Fri, 04 Nov 2022 07:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqr6u-0000yO-Be; Fri, 04 Nov 2022 07:27:28 +0000
Received: by outflank-mailman (input) for mailman id 437315;
 Fri, 04 Nov 2022 07:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BBJ=3E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqr6t-0008IY-N1
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 07:27:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22084a9b-5c12-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 08:27:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B9907218EE;
 Fri,  4 Nov 2022 07:27:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69AA81346F;
 Fri,  4 Nov 2022 07:27:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RA1rGN6+ZGMMQQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Nov 2022 07:27:26 +0000
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
X-Inumbo-ID: 22084a9b-5c12-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667546846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ly27pQKB8zJ1EGsnrKjc1hdO+HpUmQnfYr1acXfsIKI=;
	b=pWWGyaE1jxFj4EjMVnygdiccjsW9T7hMUI/EjyWLk8AOcDK33Qd3GEW3K8SxWXeOgef95G
	4pBmTHfQ3c1oRljU9jKJyr7IKQEcy9YZVxjmPxb3hvDc/bi4jjizmVf1+YSdSVhgHNDng6
	z8vF1yxfGykjPIdwW/UFsd6/FHzWfwI=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 4/5] x86: remove X86_FEATURE_XENPV usage in setup_cpu_entry_area()
Date: Fri,  4 Nov 2022 08:27:00 +0100
Message-Id: <20221104072701.20283-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221104072701.20283-1-jgross@suse.com>
References: <20221104072701.20283-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing of X86_FEATURE_XENPV in setup_cpu_entry_area() can be removed,
as this code path is 32-bit only, and Xen PV guests are not supporting
32-bit mode.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 arch/x86/mm/cpu_entry_area.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/mm/cpu_entry_area.c b/arch/x86/mm/cpu_entry_area.c
index 6c2f1b76a0b6..42cd96e7d733 100644
--- a/arch/x86/mm/cpu_entry_area.c
+++ b/arch/x86/mm/cpu_entry_area.c
@@ -138,17 +138,13 @@ static void __init setup_cpu_entry_area(unsigned int cpu)
 	pgprot_t tss_prot = PAGE_KERNEL_RO;
 #else
 	/*
-	 * On native 32-bit systems, the GDT cannot be read-only because
+	 * On 32-bit systems, the GDT cannot be read-only because
 	 * our double fault handler uses a task gate, and entering through
 	 * a task gate needs to change an available TSS to busy.  If the
 	 * GDT is read-only, that will triple fault.  The TSS cannot be
 	 * read-only because the CPU writes to it on task switches.
-	 *
-	 * On Xen PV, the GDT must be read-only because the hypervisor
-	 * requires it.
 	 */
-	pgprot_t gdt_prot = boot_cpu_has(X86_FEATURE_XENPV) ?
-		PAGE_KERNEL_RO : PAGE_KERNEL;
+	pgprot_t gdt_prot = PAGE_KERNEL;
 	pgprot_t tss_prot = PAGE_KERNEL;
 #endif
 
-- 
2.35.3


