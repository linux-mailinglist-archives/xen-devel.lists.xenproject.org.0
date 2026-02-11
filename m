Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMp7OWW5jGlHsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:16:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26061268A7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:16:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228002.1534438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDoy-0006uG-Eb; Wed, 11 Feb 2026 17:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228002.1534438; Wed, 11 Feb 2026 17:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDoy-0006of-9P; Wed, 11 Feb 2026 17:16:12 +0000
Received: by outflank-mailman (input) for mailman id 1228002;
 Wed, 11 Feb 2026 17:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vqDow-0004tt-K6
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:16:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5bcb4448-076d-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 18:16:10 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17284339;
 Wed, 11 Feb 2026 09:16:03 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.53.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 455793F63F;
 Wed, 11 Feb 2026 09:16:08 -0800 (PST)
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
X-Inumbo-ID: 5bcb4448-076d-11f1-b162-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 09/12] xen/arm: ffa: Fix SEND2 SP support gating
Date: Wed, 11 Feb 2026 18:15:33 +0100
Message-ID: <f5907ab2d57e2ed6742b31fe398a8051dfc7cc1a.1770826406.git.bertrand.marquis@arm.com>
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
X-Rspamd-Queue-Id: E26061268A7
X-Rspamd-Action: no action

Xen only maps a VM RX/TX buffer into the SPMC when firmware supports
FFA_RX_ACQUIRE. Without that mapping, the SPMC cannot access the VM TX
buffer to relay FFA_MSG_SEND2 to a secure partition.

Advertise FFA_MSG_SEND2 to guests only when VM-to-VM is enabled or when
the firmware supports both FFA_MSG_SEND2 and FFA_RX_ACQUIRE, and reject
SEND2 to a secure partition otherwise. Add comments to document the
mapping/ownership dependency.

Functional impact: SEND2 to a secure partition is reported as
NOT_SUPPORTED when FFA_RX_ACQUIRE is absent.

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- Add Jens R-b
---
 xen/arch/arm/tee/ffa.c     |  8 +++++++-
 xen/arch/arm/tee/ffa_msg.c | 11 +++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index cb8cd95fdafa..ab02eafdb376 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -281,7 +281,13 @@ static void handle_features(struct cpu_user_regs *regs)
             ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         break;
     case FFA_MSG_SEND2:
-        if ( ffa_fw_supports_fid(a1) || IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+        /*
+         * Forwarding SEND2 to an SP requires the SPMC to see the VM TX buffer.
+         * We only map VM RX/TX into the SPMC when RX_ACQUIRE is supported.
+         */
+        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) ||
+             (ffa_fw_supports_fid(FFA_MSG_SEND2) &&
+              ffa_fw_supports_fid(FFA_RX_ACQUIRE)) )
             ffa_set_regs_success(regs, 0, 0);
         else
             ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index 10856fddcbc4..928f269f6c3a 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -274,6 +274,17 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
             ret = FFA_RET_NOT_SUPPORTED;
             goto out;
         }
+        /*
+         * The SPMC needs access to the VM TX buffer to relay SEND2.
+         * We only map VM RX/TX into the SPMC when RX_ACQUIRE is supported.
+         */
+        if ( !ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
+        {
+            ret = FFA_RET_NOT_SUPPORTED;
+            gdprintk(XENLOG_DEBUG,
+                     "ffa: msg_send2 to SP requires RX_ACQUIRE\n");
+            goto out;
+        }
 
         ret = ffa_simple_call(FFA_MSG_SEND2,
                               ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0, 0, 0);
-- 
2.52.0


