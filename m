Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677D75F3EAB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 10:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415263.659819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofdXU-0004OQ-Pi; Tue, 04 Oct 2022 08:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415263.659819; Tue, 04 Oct 2022 08:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofdXU-0004MH-Lo; Tue, 04 Oct 2022 08:44:32 +0000
Received: by outflank-mailman (input) for mailman id 415263;
 Tue, 04 Oct 2022 08:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l35h=2F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ofdXU-0003h7-1Q
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 08:44:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c37e190f-43c0-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 10:44:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 11EBB1F906;
 Tue,  4 Oct 2022 08:44:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9E1D139D2;
 Tue,  4 Oct 2022 08:44:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OoYyLG7yO2PGVwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 04 Oct 2022 08:44:30 +0000
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
X-Inumbo-ID: c37e190f-43c0-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664873071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+lb+y1NjPOXtKvMZH/DFSB4E2HI7Wk27OuXyDj7Pes=;
	b=V5kYOfYG/kj7NXn15dK5dXFgizcJc0Xl1WjROjliBeu1yo+TIE6Sr3gVqM+UWRTYj9Tfil
	ASTZ7BUd2XV0WR39svbS+pg2w8Egm8ZAxheUGff0g9ixjcUtg+oeLNAbxtIhGaTZ+qv1Ug
	qKGMIb1hvqpeMW5WsqqTFd+LstFgDrE=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 3/3] xen/pv: support selecting safe/unsafe msr accesses
Date: Tue,  4 Oct 2022 10:43:35 +0200
Message-Id: <20221004084335.2838-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221004084335.2838-1-jgross@suse.com>
References: <20221004084335.2838-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of always doing the safe variants for reading and writing MSRs
in Xen PV guests, make the behavior controllable via Kconfig option
and a boot parameter.

The default will be the current behavior, which is to always use the
safe variant.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++++
 arch/x86/xen/Kconfig                          |  9 +++++++
 arch/x86/xen/enlighten_pv.c                   | 24 +++++++++++--------
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 426fa892d311..1bda9cf18fae 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6836,6 +6836,12 @@
 			Crash from Xen panic notifier, without executing late
 			panic() code such as dumping handler.
 
+	xen_msr_safe=	[X86,XEN]
+			Format: <bool>
+			Select whether to always use non-faulting (safe) MSR
+			access functions when running as Xen PV guest. The
+			default value is controlled by CONFIG_XEN_PV_MSR_SAFE.
+
 	xen_nopvspin	[X86,XEN]
 			Disables the qspinlock slowpath using Xen PV optimizations.
 			This parameter is obsoleted by "nopvspin" parameter, which
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 85246dd9faa1..9b1ec5d8c99c 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -92,3 +92,12 @@ config XEN_DOM0
 	select X86_X2APIC if XEN_PVH && X86_64
 	help
 	  Support running as a Xen Dom0 guest.
+
+config XEN_PV_MSR_SAFE
+	bool "Always use safe MSR accesses in PV guests"
+	default y
+	depends on XEN_PV
+	help
+	  Use safe (not faulting) MSR access functions even if the MSR access
+	  should not fault anyway.
+	  The default can be changed by using the "xen_msr_safe" boot parameter.
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index d5b0844a1b7c..daae454191f2 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -108,6 +108,16 @@ struct tls_descs {
  */
 static DEFINE_PER_CPU(struct tls_descs, shadow_tls_desc);
 
+static __read_mostly bool xen_msr_safe = IS_ENABLED(CONFIG_XEN_PV_MSR_SAFE);
+
+static int __init parse_xen_msr_safe(char *str)
+{
+	if (str)
+		return strtobool(str, &xen_msr_safe);
+	return -EINVAL;
+}
+early_param("xen_msr_safe", parse_xen_msr_safe);
+
 static void __init xen_pv_init_platform(void)
 {
 	/* PV guests can't operate virtio devices without grants. */
@@ -1011,22 +1021,16 @@ static int xen_write_msr_safe(unsigned int msr, unsigned int low,
 
 static u64 xen_read_msr(unsigned int msr)
 {
-	/*
-	 * This will silently swallow a #GP from RDMSR.  It may be worth
-	 * changing that.
-	 */
 	int err;
 
-	return xen_read_msr_safe(msr, &err);
+	return xen_do_read_msr(msr, xen_msr_safe ? &err : NULL);
 }
 
 static void xen_write_msr(unsigned int msr, unsigned low, unsigned high)
 {
-	/*
-	 * This will silently swallow a #GP from WRMSR.  It may be worth
-	 * changing that.
-	 */
-	xen_write_msr_safe(msr, low, high);
+	int err;
+
+	xen_do_write_msr(msr, low, high, xen_msr_safe ? &err : NULL);
 }
 
 /* This is called once we have the cpu_possible_mask */
-- 
2.35.3


