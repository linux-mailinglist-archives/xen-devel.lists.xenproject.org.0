Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD36191EA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 08:27:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437318.691645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqr71-0001bo-Th; Fri, 04 Nov 2022 07:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437318.691645; Fri, 04 Nov 2022 07:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqr71-0001YB-PW; Fri, 04 Nov 2022 07:27:35 +0000
Received: by outflank-mailman (input) for mailman id 437318;
 Fri, 04 Nov 2022 07:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BBJ=3E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqr6z-00082w-UQ
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 07:27:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 255d91ac-5c12-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 08:27:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C775218EF;
 Fri,  4 Nov 2022 07:27:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1CDC51346F;
 Fri,  4 Nov 2022 07:27:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ITjcBeS+ZGMZQQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Nov 2022 07:27:32 +0000
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
X-Inumbo-ID: 255d91ac-5c12-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667546852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETDMSDRjzWVlC2eQNNmpxl8Qm+9vtlmDFMYqkaHH46A=;
	b=eJn1trHVH1GRxxTQIn3/dsYTb5dd6wFDdzEmr/pcuLJJrPFpEG0eUfoI8DIfdNdH2y+4rh
	u7Oyhpi+e9xO2n6z0/19haLXwlav+3Ni90QaysufhNHcaBLTqERRceU691XKyTAp6aS58d
	ABYUnkrtYpEaAfSJGb5XlddGJwlbvIg=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Pu Wen <puwen@hygon.cn>
Subject: [PATCH v2 5/5] x86: switch to cpu_feature_enabled() for X86_FEATURE_XENPV
Date: Fri,  4 Nov 2022 08:27:01 +0100
Message-Id: <20221104072701.20283-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221104072701.20283-1-jgross@suse.com>
References: <20221104072701.20283-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the remaining cases of static_cpu_has(X86_FEATURE_XENPV) and
boot_cpu_has(X86_FEATURE_XENPV) to use cpu_feature_enabled(), allowing
more efficient code in case the kernel is configured without
CONFIG_XEN_PV.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kernel/cpu/amd.c    | 2 +-
 arch/x86/kernel/cpu/bugs.c   | 2 +-
 arch/x86/kernel/cpu/hygon.c  | 2 +-
 arch/x86/kernel/process_64.c | 4 ++--
 arch/x86/kernel/topology.c   | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 860b60273df3..697fe881e967 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -985,7 +985,7 @@ static void init_amd(struct cpuinfo_x86 *c)
 			set_cpu_cap(c, X86_FEATURE_3DNOWPREFETCH);
 
 	/* AMD CPUs don't reset SS attributes on SYSRET, Xen does. */
-	if (!cpu_has(c, X86_FEATURE_XENPV))
+	if (!cpu_feature_enabled(X86_FEATURE_XENPV))
 		set_cpu_bug(c, X86_BUG_SYSRET_SS_ATTRS);
 
 	/*
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index da7c361f47e0..7f78e1527c5e 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1302,7 +1302,7 @@ static enum spectre_v2_mitigation_cmd __init spectre_v2_parse_cmdline(void)
 		return SPECTRE_V2_CMD_AUTO;
 	}
 
-	if (cmd == SPECTRE_V2_CMD_IBRS && boot_cpu_has(X86_FEATURE_XENPV)) {
+	if (cmd == SPECTRE_V2_CMD_IBRS && cpu_feature_enabled(X86_FEATURE_XENPV)) {
 		pr_err("%s selected but running as XenPV guest. Switching to AUTO select\n",
 		       mitigation_options[i].option);
 		return SPECTRE_V2_CMD_AUTO;
diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index 21fd425088fe..1c27645fd429 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -339,7 +339,7 @@ static void init_hygon(struct cpuinfo_x86 *c)
 	set_cpu_cap(c, X86_FEATURE_ARAT);
 
 	/* Hygon CPUs don't reset SS attributes on SYSRET, Xen does. */
-	if (!cpu_has(c, X86_FEATURE_XENPV))
+	if (!cpu_feature_enabled(X86_FEATURE_XENPV))
 		set_cpu_bug(c, X86_BUG_SYSRET_SS_ATTRS);
 
 	check_null_seg_clears_base(c);
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 6b3418bff326..e2f469175be8 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -165,7 +165,7 @@ static noinstr unsigned long __rdgsbase_inactive(void)
 
 	lockdep_assert_irqs_disabled();
 
-	if (!static_cpu_has(X86_FEATURE_XENPV)) {
+	if (!cpu_feature_enabled(X86_FEATURE_XENPV)) {
 		native_swapgs();
 		gsbase = rdgsbase();
 		native_swapgs();
@@ -190,7 +190,7 @@ static noinstr void __wrgsbase_inactive(unsigned long gsbase)
 {
 	lockdep_assert_irqs_disabled();
 
-	if (!static_cpu_has(X86_FEATURE_XENPV)) {
+	if (!cpu_feature_enabled(X86_FEATURE_XENPV)) {
 		native_swapgs();
 		wrgsbase(gsbase);
 		native_swapgs();
diff --git a/arch/x86/kernel/topology.c b/arch/x86/kernel/topology.c
index 8617d1ed9d31..1b83377274b8 100644
--- a/arch/x86/kernel/topology.c
+++ b/arch/x86/kernel/topology.c
@@ -106,7 +106,7 @@ int arch_register_cpu(int num)
 	 * Xen PV guests don't support CPU0 hotplug at all.
 	 */
 	if (c->x86_vendor != X86_VENDOR_INTEL ||
-	    boot_cpu_has(X86_FEATURE_XENPV))
+	    cpu_feature_enabled(X86_FEATURE_XENPV))
 		cpu0_hotpluggable = 0;
 
 	/*
-- 
2.35.3


