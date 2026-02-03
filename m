Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDu1KrwygmkxQgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:39:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF8ADCE8A
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:39:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219538.1528414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMR-0000uO-Ic; Tue, 03 Feb 2026 17:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219538.1528414; Tue, 03 Feb 2026 17:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMR-0000s6-FL; Tue, 03 Feb 2026 17:38:47 +0000
Received: by outflank-mailman (input) for mailman id 1219538;
 Tue, 03 Feb 2026 17:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnKMP-0000Zt-EA
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:38:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2edc0ddb-0127-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 18:38:43 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C66EC339;
 Tue,  3 Feb 2026 09:38:35 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 281583F632;
 Tue,  3 Feb 2026 09:38:41 -0800 (PST)
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
X-Inumbo-ID: 2edc0ddb-0127-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 01/12] xen/arm: ffa: Add endpoint lookup helper
Date: Tue,  3 Feb 2026 18:37:56 +0100
Message-ID: <db0a0b4459630ea00a67d5e985cff3bca73d1c64.1770115301.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1770115301.git.bertrand.marquis@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7CF8ADCE8A
X-Rspamd-Action: no action

Direct messaging paths duplicate endpoint validation and RCU domain
lookup logic across multiple call sites, which makes the checks easy to
drift and complicates maintenance.

Introduce ffa_endpoint_domain_lookup() to centralize this logic. The
helper validates the endpoint ID (rejecting ID 0 for the hypervisor),
performs RCU domain lookup, ensures the domain is live and has an
initialized FF-A context with a negotiated version, and returns the
domain locked via RCU.

Switch ffa_msg_send2_vm() to use the helper, replacing its open-coded
validation sequence. This consolidates approximately 20 lines of
duplicated checks into a single call.

No functional changes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c         | 45 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_msg.c     | 24 +++---------------
 xen/arch/arm/tee/ffa_private.h |  3 +++
 3 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index ed18e76080d0..6de2b9f8ac8e 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -433,6 +433,51 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     return true;
 }
 
+/*
+ * Look up a domain by its FF-A endpoint ID and validate it's ready for FF-A.
+ * Returns FFA_RET_OK on success with domain locked via RCU.
+ * Caller must call rcu_unlock_domain() when done.
+ *
+ * Validates:
+ * - endpoint_id is not 0 (the hypervisor)
+ * - domain exists and is live
+ * - domain has FF-A context initialized
+ * - domain has negotiated an FF-A version
+ */
+int32_t ffa_endpoint_domain_lookup(uint16_t endpoint_id, struct domain **d_out,
+                                   struct ffa_ctx **ctx_out)
+{
+    struct domain *d;
+    struct ffa_ctx *ctx;
+    int err;
+
+    if ( endpoint_id == 0 )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    err = rcu_lock_live_remote_domain_by_id(endpoint_id - 1, &d);
+    if ( err )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    if ( !d->arch.tee )
+    {
+        rcu_unlock_domain(d);
+        return FFA_RET_INVALID_PARAMETERS;
+    }
+
+    ctx = d->arch.tee;
+    if ( !ACCESS_ONCE(ctx->guest_vers) )
+    {
+        rcu_unlock_domain(d);
+        return FFA_RET_INVALID_PARAMETERS;
+    }
+
+    *d_out = d;
+    if ( ctx_out )
+        *ctx_out = ctx;
+
+    return FFA_RET_OK;
+}
+
 static int ffa_domain_init(struct domain *d)
 {
     struct ffa_ctx *ctx;
diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index 4e26596461a9..10856fddcbc4 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -161,30 +161,12 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
     struct ffa_part_msg_rxtx_1_2 *dst_msg;
     void *rx_buf;
     size_t rx_size;
-    int err;
     int32_t ret;
 
-    if ( dst_id == 0 )
-        /* FF-A ID 0 is the hypervisor, this is not valid */
-        return FFA_RET_INVALID_PARAMETERS;
-
     /* This is also checking that dest is not src */
-    err = rcu_lock_live_remote_domain_by_id(dst_id - 1, &dst_d);
-    if ( err )
-        return FFA_RET_INVALID_PARAMETERS;
-
-    if ( dst_d->arch.tee == NULL )
-    {
-        ret = FFA_RET_INVALID_PARAMETERS;
-        goto out_unlock;
-    }
-
-    dst_ctx = dst_d->arch.tee;
-    if ( !ACCESS_ONCE(dst_ctx->guest_vers) )
-    {
-        ret = FFA_RET_INVALID_PARAMETERS;
-        goto out_unlock;
-    }
+    ret = ffa_endpoint_domain_lookup(dst_id, &dst_d, &dst_ctx);
+    if ( ret )
+        return ret;
 
     /* This also checks that destination has set a Rx buffer */
     ret = ffa_rx_acquire(dst_ctx , &rx_buf, &rx_size);
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 282c105f3bce..cd7ecabc7eff 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -437,6 +437,9 @@ int32_t ffa_partinfo_domain_init(struct domain *d);
 bool ffa_partinfo_domain_destroy(struct domain *d);
 void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
 
+int32_t ffa_endpoint_domain_lookup(uint16_t endpoint_id, struct domain **d_out,
+                                   struct ffa_ctx **ctx_out);
+
 bool ffa_rxtx_spmc_init(void);
 void ffa_rxtx_spmc_destroy(void);
 void *ffa_rxtx_spmc_rx_acquire(void);
-- 
2.50.1 (Apple Git-155)


