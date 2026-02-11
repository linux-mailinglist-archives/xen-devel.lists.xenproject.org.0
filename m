Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id j3H4I1+5jGlJsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:16:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D40E126867
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227997.1534399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDot-0005nh-Ox; Wed, 11 Feb 2026 17:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227997.1534399; Wed, 11 Feb 2026 17:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDot-0005kL-Jx; Wed, 11 Feb 2026 17:16:07 +0000
Received: by outflank-mailman (input) for mailman id 1227997;
 Wed, 11 Feb 2026 17:16:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vqDoq-0004tt-My
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:16:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 583ec24c-076d-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 18:16:04 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F660339;
 Wed, 11 Feb 2026 09:15:57 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.53.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63DC63F63F;
 Wed, 11 Feb 2026 09:16:02 -0800 (PST)
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
X-Inumbo-ID: 583ec24c-076d-11f1-b162-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 05/12] xen/arm: ffa: Fix PARTINFO RX release errors
Date: Wed, 11 Feb 2026 18:15:29 +0100
Message-ID: <bbeacc8812adc7ebffe58d7d7a3b0434b13da7c4.1770826406.git.bertrand.marquis@arm.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 2D40E126867
X-Rspamd-Action: no action

On PARTITION_INFO_GET error paths, Xen unconditionally called
FFA_RX_RELEASE for the SPMC RX buffer. If the SPMC didn't grant RX
ownership (i.e., the call failed early), this issues a spurious release
that returns DENIED and produces warnings.

Modify ffa_rxtx_spmc_rx_release() to return the release status and let
callers choose whether to log it. Only issue FFA_RX_RELEASE after a
successful PARTINFO SMC, while always releasing the local RX lock to
avoid deadlocks.

Update handle_partition_info_get() to only release the SPMC RX buffer
after successful fw_ret checks, and ignore release errors during the
error path.

Functional impact: eliminates spurious FFA_RX_RELEASE calls and
associated DENIED warnings when PARTITION_INFO_GET fails before
obtaining SPMC RX buffer ownership.

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- Rename spmc_ok to notify_fw
- Add Jens R-b
---
 xen/arch/arm/tee/ffa_partinfo.c | 14 ++++++++++++--
 xen/arch/arm/tee/ffa_private.h  |  2 +-
 xen/arch/arm/tee/ffa_rxtx.c     | 14 +++++++++-----
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index bf906ed0c88f..015097bd4d2a 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -92,9 +92,11 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
                                    uint32_t dst_size)
 {
     int32_t ret;
+    int32_t release_ret;
     uint32_t src_size, real_sp_count;
     void *src_buf;
     uint32_t count = 0;
+    bool notify_fw = false;
 
     /* We need to use the RX buffer to receive the list */
     src_buf = ffa_rxtx_spmc_rx_acquire();
@@ -104,6 +106,7 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
     ret = ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
     if ( ret )
         goto out;
+    notify_fw = true;
 
     /* Validate the src_size we got */
     if ( src_size < sizeof(struct ffa_partition_info_1_0) ||
@@ -157,7 +160,10 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
     *sp_count = count;
 
 out:
-    ffa_rxtx_spmc_rx_release();
+    release_ret = ffa_rxtx_spmc_rx_release(notify_fw);
+    if ( release_ret )
+        gprintk(XENLOG_WARNING,
+                "ffa: Error releasing SPMC RX buffer: %d\n", release_ret);
     return ret;
 }
 
@@ -507,6 +513,7 @@ bool ffa_partinfo_init(void)
     int32_t e;
     void *spmc_rx;
     struct ffa_uuid nil_uuid = { .val = { 0ULL, 0ULL } };
+    bool notify_fw = false;
 
     if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) ||
          !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32))
@@ -522,6 +529,7 @@ bool ffa_partinfo_init(void)
         printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
         goto out;
     }
+    notify_fw = true;
 
     if ( count >= FFA_MAX_NUM_SP )
     {
@@ -533,7 +541,9 @@ bool ffa_partinfo_init(void)
     ret = init_subscribers(spmc_rx, count, fpi_size);
 
 out:
-    ffa_rxtx_spmc_rx_release();
+    e = ffa_rxtx_spmc_rx_release(notify_fw);
+    if ( e )
+        printk(XENLOG_WARNING "ffa: Error releasing SPMC RX buffer: %d\n", e);
     return ret;
 }
 
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index ccef2f7631f6..1a632983c860 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -459,7 +459,7 @@ int32_t ffa_endpoint_domain_lookup(uint16_t endpoint_id, struct domain **d_out,
 bool ffa_rxtx_spmc_init(void);
 void ffa_rxtx_spmc_destroy(void);
 void *ffa_rxtx_spmc_rx_acquire(void);
-void ffa_rxtx_spmc_rx_release(void);
+int32_t ffa_rxtx_spmc_rx_release(bool notify_fw);
 void *ffa_rxtx_spmc_tx_acquire(void);
 void ffa_rxtx_spmc_tx_release(void);
 
diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
index 7d8bb4f4d031..50758fb57cdf 100644
--- a/xen/arch/arm/tee/ffa_rxtx.c
+++ b/xen/arch/arm/tee/ffa_rxtx.c
@@ -375,18 +375,22 @@ void *ffa_rxtx_spmc_rx_acquire(void)
     return NULL;
 }
 
-void ffa_rxtx_spmc_rx_release(void)
+int32_t ffa_rxtx_spmc_rx_release(bool notify_fw)
 {
     int32_t ret;
 
     ASSERT(spin_is_locked(&ffa_spmc_rx_lock));
 
-    /* Inform the SPMC that we are done with our RX buffer */
-    ret = ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
-    if ( ret != FFA_RET_OK )
-        printk(XENLOG_DEBUG "Error releasing SPMC RX buffer: %d\n", ret);
+    if ( notify_fw )
+    {
+        /* Inform the SPMC that we are done with our RX buffer */
+        ret = ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
+    }
+    else
+        ret = FFA_RET_OK;
 
     spin_unlock(&ffa_spmc_rx_lock);
+    return ret;
 }
 
 void *ffa_rxtx_spmc_tx_acquire(void)
-- 
2.52.0


