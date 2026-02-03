Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMZpEr4ygmkuQgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:39:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FD6DCEAF
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:39:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219537.1528406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMQ-0000hW-By; Tue, 03 Feb 2026 17:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219537.1528406; Tue, 03 Feb 2026 17:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMQ-0000eN-8I; Tue, 03 Feb 2026 17:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1219537;
 Tue, 03 Feb 2026 17:38:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnKMO-0000KW-Ml
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:38:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2fa3276b-0127-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 18:38:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32C8C497;
 Tue,  3 Feb 2026 09:38:37 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 904F73F632;
 Tue,  3 Feb 2026 09:38:42 -0800 (PST)
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
X-Inumbo-ID: 2fa3276b-0127-11f1-b161-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 02/12] xen/arm: ffa: Fix MEM_SHARE NS attribute handling
Date: Tue,  3 Feb 2026 18:37:57 +0100
Message-ID: <9886df295f4c4365668576cc956299ee36f36c8b.1770115301.git.bertrand.marquis@arm.com>
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
X-Rspamd-Queue-Id: 41FD6DCEAF
X-Rspamd-Action: no action

The FF-A memory attribute encoding is currently a literal value (0x2f),
which makes reviews and validation harder. In addition, MEM_SHARE
accepts the NS (non-secure) attribute bit even though the normal world
must not set it according to FF-A specification.

Introduce named attribute bit masks and express FFA_NORMAL_MEM_REG_ATTR
in terms of them for clarity.

Reject MEM_SHARE descriptors with the NS bit set, returning
INVALID_PARAMETERS to match FF-A v1.1 rules that prohibit normal world
from setting this bit.

Functional impact: MEM_SHARE now rejects descriptors with NS bit set,
which were previously accepted but violate FF-A specification.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_private.h | 17 ++++++++++++++++-
 xen/arch/arm/tee/ffa_shm.c     |  6 ++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index cd7ecabc7eff..b625f1c72914 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -129,11 +129,26 @@
 #define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
 #define FFA_HANDLE_INVALID              0xffffffffffffffffULL
 
+/* NS attribute was introduced in v1.1 */
+#define FFA_MEM_ATTR_NS                 BIT(6, U)
+
+#define FFA_MEM_ATTR_TYPE_DEV           (1U << 3)
+#define FFA_MEM_ATTR_TYPE_MEM           (2U << 4)
+
+#define FFA_MEM_ATTR_NC                 (1U << 2)
+#define FFA_MEM_ATTR_WB                 (3U << 2)
+
+#define FFA_MEM_ATTR_NON_SHARE          (0U)
+#define FFA_MEM_ATTR_OUT_SHARE          (2U)
+#define FFA_MEM_ATTR_INN_SHARE          (3U)
+
 /*
  * Memory attributes: Normal memory, Write-Back cacheable, Inner shareable
  * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
  */
-#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
+#define FFA_NORMAL_MEM_REG_ATTR         (FFA_MEM_ATTR_TYPE_MEM | \
+                                         FFA_MEM_ATTR_WB | \
+                                         FFA_MEM_ATTR_INN_SHARE)
 /*
  * Memory access permissions: Read-write
  * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index 8282bacf85d3..90800e44a86a 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -512,6 +512,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     if ( ret )
         goto out_unlock;
 
+    if ( trans.mem_reg_attr & FFA_MEM_ATTR_NS )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_unlock;
+    }
+
     if ( trans.mem_reg_attr != FFA_NORMAL_MEM_REG_ATTR )
     {
         ret = FFA_RET_NOT_SUPPORTED;
-- 
2.50.1 (Apple Git-155)


