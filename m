Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGPXBmC5jGlHsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:16:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF4126884
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227999.1534415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDov-0006C4-Kd; Wed, 11 Feb 2026 17:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227999.1534415; Wed, 11 Feb 2026 17:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDov-00063n-By; Wed, 11 Feb 2026 17:16:09 +0000
Received: by outflank-mailman (input) for mailman id 1227999;
 Wed, 11 Feb 2026 17:16:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vqDot-0004tt-Jc
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:16:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 59f2c27a-076d-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 18:16:06 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 030DF339;
 Wed, 11 Feb 2026 09:16:00 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.53.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2857D3F63F;
 Wed, 11 Feb 2026 09:16:05 -0800 (PST)
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
X-Inumbo-ID: 59f2c27a-076d-11f1-b162-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 07/12] xen/arm: ffa: Fix RXTX_UNMAP ownership race
Date: Wed, 11 Feb 2026 18:15:31 +0100
Message-ID: <cbe45740ea22b7d49fbaf45585acc6a8cc8866d8.1770826406.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770826406.git.bertrand.marquis@arm.com>
References: <cover.1770826406.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 0AEF4126884
X-Rspamd-Action: no action

rxtx_unmap() checks RX ownership without holding the RX/TX locks and
only enforces the ownership rule when FFA_RX_ACQUIRE is supported. This
allows a vCPU to acquire RX between the check and unmap, and it lets
RXTX_UNMAP proceed while RX is owned when buffers are not forwarded to
firmware.

Hold rx_lock/tx_lock across the ownership check and unmap, and deny
RXTX_UNMAP whenever RX is owned, independent of RX_ACQUIRE support. For
teardown, release RX ownership under the same lock window; use
FFA_RX_RELEASE directly because rx_lock is held, and clear the local
flag when the firmware path is unavailable.

Functional impact: RXTX_UNMAP now reliably returns DENIED while RX is
owned, and teardown releases/clears ownership without a race.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- Remove marking rx buffer as free during teardown as it is useless
- Add a comment when calling rxtx_unmap during teardown to remind code
  readers that true is for teardown mode
---
 xen/arch/arm/tee/ffa_rxtx.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
index eff95a7955d7..c4fc4c4934af 100644
--- a/xen/arch/arm/tee/ffa_rxtx.c
+++ b/xen/arch/arm/tee/ffa_rxtx.c
@@ -220,7 +220,7 @@ err_unlock_rxtx:
     return ret;
 }
 
-static int32_t rxtx_unmap(struct domain *d)
+static int32_t rxtx_unmap(struct domain *d, bool teardown)
 {
     struct ffa_ctx *ctx = d->arch.tee;
     int32_t ret = FFA_RET_OK;
@@ -234,6 +234,32 @@ static int32_t rxtx_unmap(struct domain *d)
         goto err_unlock_rxtx;
     }
 
+    if ( !ctx->rx_is_free )
+    {
+        if ( teardown )
+        {
+            if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
+            {
+                int32_t rel_ret;
+
+                /* Can't use ffa_rx_release() while holding rx_lock. */
+                rel_ret = ffa_simple_call(FFA_RX_RELEASE, ctx->ffa_id,
+                                          0, 0, 0);
+                if ( rel_ret )
+                    gdprintk(XENLOG_DEBUG,
+                             "ffa: RX release during teardown failed: %d\n",
+                             rel_ret);
+            }
+        }
+        else
+        {
+            gdprintk(XENLOG_DEBUG,
+                     "ffa: RXTX_UNMAP denied, RX buffer owned by VM\n");
+            ret = FFA_RET_DENIED;
+            goto err_unlock_rxtx;
+        }
+    }
+
     if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
     {
         ret = ffa_rxtx_unmap(ffa_get_vm_id(d));
@@ -261,7 +287,7 @@ err_unlock_rxtx:
 
 int32_t ffa_handle_rxtx_unmap(void)
 {
-    return rxtx_unmap(current->domain);
+    return rxtx_unmap(current->domain, false);
 }
 
 int32_t ffa_rx_acquire(struct ffa_ctx *ctx, void **buf, size_t *buf_size)
@@ -369,7 +395,7 @@ int32_t ffa_rxtx_domain_init(struct domain *d)
 
 void ffa_rxtx_domain_destroy(struct domain *d)
 {
-    rxtx_unmap(d);
+    rxtx_unmap(d, true /* teardown */);
 }
 
 void *ffa_rxtx_spmc_rx_acquire(void)
-- 
2.52.0


