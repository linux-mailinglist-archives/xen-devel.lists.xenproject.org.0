Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19480A73E5C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 20:07:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929901.1332668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txsYY-0006mq-DG; Thu, 27 Mar 2025 19:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929901.1332668; Thu, 27 Mar 2025 19:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txsYY-0006k8-9f; Thu, 27 Mar 2025 19:06:22 +0000
Received: by outflank-mailman (input) for mailman id 929901;
 Thu, 27 Mar 2025 19:06:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zm5l=WO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1txsYW-0006k2-CH
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 19:06:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 894681c1-0b3e-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 20:06:07 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5F62B1F388;
 Thu, 27 Mar 2025 19:06:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 113581376E;
 Thu, 27 Mar 2025 19:06:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mDu7Ap2h5WeONgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 27 Mar 2025 19:06:05 +0000
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
X-Inumbo-ID: 894681c1-0b3e-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743102365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1uaLOUY0NRlFtKACDBCKYX8snuEcg6PpjJZK1xBYCNw=;
	b=g7zNhjSfrYL5RYkzVmcyjXJxmGUk+AMVERlvObo78oWjtTLkXYhkFzcMqIMrvG+dy+Sr8H
	t3WM1tDbVLZLUG22cKsZu2lG1MfeUKF/9Kmfg/kVgQIqmYNRMy/WILfSnMUlUSc1zwAaxl
	iVaDS04UMDjCUoVJzicP4ZPgoUsY5N4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=g7zNhjSf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743102365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1uaLOUY0NRlFtKACDBCKYX8snuEcg6PpjJZK1xBYCNw=;
	b=g7zNhjSfrYL5RYkzVmcyjXJxmGUk+AMVERlvObo78oWjtTLkXYhkFzcMqIMrvG+dy+Sr8H
	t3WM1tDbVLZLUG22cKsZu2lG1MfeUKF/9Kmfg/kVgQIqmYNRMy/WILfSnMUlUSc1zwAaxl
	iVaDS04UMDjCUoVJzicP4ZPgoUsY5N4=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] xen: fix multicall debug feature
Date: Thu, 27 Mar 2025 20:06:02 +0100
Message-ID: <20250327190602.26015-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5F62B1F388
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Initializing a percpu variable with the address of a struct tagged as
.initdata is breaking the build with CONFIG_SECTION_MISMATCH_WARN_ONLY
not set to "y".

Fix that by using an access function instead returning the .initdata
struct address if the percpu space of the struct hasn't been
allocated yet.

Fixes: 368990a7fe30 ("xen: fix multicall debug data referencing")
Reported-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/multicalls.c | 26 ++++++++++++++------------
 arch/x86/xen/smp_pv.c     |  1 -
 arch/x86/xen/xen-ops.h    |  3 ---
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/arch/x86/xen/multicalls.c b/arch/x86/xen/multicalls.c
index 10c660fae8b3..7237d56a9d3f 100644
--- a/arch/x86/xen/multicalls.c
+++ b/arch/x86/xen/multicalls.c
@@ -54,14 +54,20 @@ struct mc_debug_data {
 
 static DEFINE_PER_CPU(struct mc_buffer, mc_buffer);
 static struct mc_debug_data mc_debug_data_early __initdata;
-static DEFINE_PER_CPU(struct mc_debug_data *, mc_debug_data) =
-	&mc_debug_data_early;
 static struct mc_debug_data __percpu *mc_debug_data_ptr;
 DEFINE_PER_CPU(unsigned long, xen_mc_irq_flags);
 
 static struct static_key mc_debug __ro_after_init;
 static bool mc_debug_enabled __initdata;
 
+static struct mc_debug_data * __ref get_mc_debug(void)
+{
+	if (!mc_debug_data_ptr)
+		return &mc_debug_data_early;
+
+	return this_cpu_ptr(mc_debug_data_ptr);
+}
+
 static int __init xen_parse_mc_debug(char *arg)
 {
 	mc_debug_enabled = true;
@@ -71,20 +77,16 @@ static int __init xen_parse_mc_debug(char *arg)
 }
 early_param("xen_mc_debug", xen_parse_mc_debug);
 
-void mc_percpu_init(unsigned int cpu)
-{
-	per_cpu(mc_debug_data, cpu) = per_cpu_ptr(mc_debug_data_ptr, cpu);
-}
-
 static int __init mc_debug_enable(void)
 {
 	unsigned long flags;
+	struct mc_debug_data __percpu *mcdb;
 
 	if (!mc_debug_enabled)
 		return 0;
 
-	mc_debug_data_ptr = alloc_percpu(struct mc_debug_data);
-	if (!mc_debug_data_ptr) {
+	mcdb = alloc_percpu(struct mc_debug_data);
+	if (!mcdb) {
 		pr_err("xen_mc_debug inactive\n");
 		static_key_slow_dec(&mc_debug);
 		return -ENOMEM;
@@ -93,7 +95,7 @@ static int __init mc_debug_enable(void)
 	/* Be careful when switching to percpu debug data. */
 	local_irq_save(flags);
 	xen_mc_flush();
-	mc_percpu_init(0);
+	mc_debug_data_ptr = mcdb;
 	local_irq_restore(flags);
 
 	pr_info("xen_mc_debug active\n");
@@ -155,7 +157,7 @@ void xen_mc_flush(void)
 	trace_xen_mc_flush(b->mcidx, b->argidx, b->cbidx);
 
 	if (static_key_false(&mc_debug)) {
-		mcdb = __this_cpu_read(mc_debug_data);
+		mcdb = get_mc_debug();
 		memcpy(mcdb->entries, b->entries,
 		       b->mcidx * sizeof(struct multicall_entry));
 	}
@@ -235,7 +237,7 @@ struct multicall_space __xen_mc_entry(size_t args)
 
 	ret.mc = &b->entries[b->mcidx];
 	if (static_key_false(&mc_debug)) {
-		struct mc_debug_data *mcdb = __this_cpu_read(mc_debug_data);
+		struct mc_debug_data *mcdb = get_mc_debug();
 
 		mcdb->caller[b->mcidx] = __builtin_return_address(0);
 		mcdb->argsz[b->mcidx] = args;
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 688ff59318ae..9bb8ff8bff30 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -305,7 +305,6 @@ static int xen_pv_kick_ap(unsigned int cpu, struct task_struct *idle)
 		return rc;
 
 	xen_pmu_init(cpu);
-	mc_percpu_init(cpu);
 
 	/*
 	 * Why is this a BUG? If the hypercall fails then everything can be
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 63c13a2ccf55..25e318ef27d6 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -261,9 +261,6 @@ void xen_mc_callback(void (*fn)(void *), void *data);
  */
 struct multicall_space xen_mc_extend_args(unsigned long op, size_t arg_size);
 
-/* Do percpu data initialization for multicalls. */
-void mc_percpu_init(unsigned int cpu);
-
 extern bool is_xen_pmu;
 
 irqreturn_t xen_pmu_irq_handler(int irq, void *dev_id);
-- 
2.43.0


