Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LGrDJ5g44ml73gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:41:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D8841BC06
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284305.1566142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjRw-00064F-3o; Fri, 17 Apr 2026 13:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284305.1566142; Fri, 17 Apr 2026 13:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjRv-00062s-Vr; Fri, 17 Apr 2026 13:41:35 +0000
Received: by outflank-mailman (input) for mailman id 1284305;
 Fri, 17 Apr 2026 13:41:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1wDjRu-0005zq-6m
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:41:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDjRt-009kb3-Jo
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 15:41:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69e23874-e002-0a2a0a5209dd-0a2a4504d544-46
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:41:33 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69e2388c-1dec-0a2a45040019-d98c6eacd9ca-1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:41:32 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47521152B;
 Fri, 17 Apr 2026 06:41:26 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.170])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D90C3F7D8;
 Fri, 17 Apr 2026 06:41:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776433292; bh=GpMN53OmsGMUNWxbJRMSEFaE53+mcg2MmZqtr/Lo+zY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ucGQGoVsedG3vqsRL/HuomCA0Jz5/3TnwHbqBxEWVCowvK4bG1Xo/y+ovBDsdFWfW
	 rBTnupjUo8k5NpYtaJM/9xf8eDMCYTsLR9ajQX7S2poaQAWt+gaNSbPsLuTeYulTVW
	 SRcArxibT/wa8kwDgYF7hKelE08jkMfcUyucIY9o=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 3/6] xen/arm: ffa: Tighten notification parameter validation
Date: Fri, 17 Apr 2026 15:40:51 +0200
Message-ID: <1036add9199c6304eb649854024c74dd0f0192cc.1776266307.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776266307.git.bertrand.marquis@arm.com>
References: <cover.1776266307.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1776433293-300413FF-D93CA36A/0/0
X-purgate-type: clean
X-purgate-size: 5853
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 16D8841BC06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The notification handlers still validate overlapping subsets of their
inputs. BIND, UNBIND, and SET each decode caller and destination IDs
locally, GET still accepts a non-zero receiver vCPU ID and reserved flag
bits, and SET still accepts non-zero NS-virtual flags. BIND also treats
unsupported non-zero flag encodings as a supported-feature failure
instead of as malformed input.

Add ffa_notif_parse_params() and use it to centralize the common
caller/destination and non-zero bitmap checks for BIND, UNBIND, and SET.
Also reject malformed GET and SET requests locally before touching
cached state or forwarding anything to the SPMC. Keep BIND limited to
global notifications and reject unsupported non-zero flag encodings with
INVALID_PARAMETERS.

- add a shared parameter parser for notification caller/destination
  validation
- wire BIND and UNBIND through the shared parser and reject unsupported
  bind flag encodings with INVALID_PARAMETERS
- reject non-zero receiver vCPU and reserved flag bits in
  FFA_NOTIFICATION_GET
- reject non-zero flags in the NS-virtual FFA_NOTIFICATION_SET path

Functional impact: malformed notification requests are rejected
consistently earlier in the mediator.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_notif.c | 61 +++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index d15119409a25..491db3b04df5 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -42,21 +42,40 @@ static void inject_notif_pending(struct domain *d)
                d);
 }
 
+static int32_t ffa_notif_parse_params(uint16_t dom_id, uint16_t caller_id,
+                                      uint16_t dest_id, uint32_t bitmap_lo,
+                                      uint32_t bitmap_hi)
+{
+    if ( caller_id != dom_id || dest_id == dom_id || !dest_id )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    if ( !bitmap_lo && !bitmap_hi )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    return FFA_RET_OK;
+}
+
 int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+    int32_t ret;
     uint32_t src_dst = get_user_reg(regs, 1);
     uint32_t flags = get_user_reg(regs, 2);
     uint32_t bitmap_lo = get_user_reg(regs, 3);
     uint32_t bitmap_hi = get_user_reg(regs, 4);
+    uint16_t caller_id = src_dst & GENMASK(15, 0);
+    uint16_t dest_id = src_dst >> 16;
 
-    if ( (src_dst & GENMASK(15, 0)) != ffa_get_vm_id(d) )
+    if ( flags )    /* Only global notifications are supported */
         return FFA_RET_INVALID_PARAMETERS;
 
-    if ( flags )    /* Only global notifications are supported */
-        return FFA_RET_DENIED;
+    ret = ffa_notif_parse_params(ctx->ffa_id, caller_id, dest_id, bitmap_lo,
+                                 bitmap_hi);
+    if ( ret )
+        return ret;
 
-    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
+    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
         return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
                                bitmap_lo, bitmap_hi);
 
@@ -66,16 +85,22 @@ int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
 int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+    int32_t ret;
     uint32_t src_dst = get_user_reg(regs, 1);
     uint32_t bitmap_lo = get_user_reg(regs, 3);
     uint32_t bitmap_hi = get_user_reg(regs, 4);
+    uint16_t caller_id = src_dst & GENMASK(15, 0);
+    uint16_t dest_id = src_dst >> 16;
 
-    if ( (src_dst & GENMASK(15, 0)) != ffa_get_vm_id(d) )
-        return FFA_RET_INVALID_PARAMETERS;
+    ret = ffa_notif_parse_params(ctx->ffa_id, caller_id, dest_id, bitmap_lo,
+                                 bitmap_hi);
+    if ( ret )
+        return ret;
 
-    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
-        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_lo,
-                                bitmap_hi);
+    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
+        return ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_lo,
+                               bitmap_hi);
 
     return FFA_RET_NOT_SUPPORTED;
 }
@@ -142,6 +167,12 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
         return;
     }
 
+    if ( recv >> 16 || (flags & GENMASK(31, 4)) )
+    {
+        ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
+        return;
+    }
+
     if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
                                         FFA_NOTIF_FLAG_BITMAP_SPM )) )
     {
@@ -204,11 +235,19 @@ int32_t ffa_handle_notification_set(struct cpu_user_regs *regs)
     uint32_t flags = get_user_reg(regs, 2);
     uint32_t bitmap_lo = get_user_reg(regs, 3);
     uint32_t bitmap_hi = get_user_reg(regs, 4);
+    uint16_t caller_id = src_dst >> 16;
+    uint16_t dest_id = src_dst & GENMASK(15, 0);
+    int32_t ret;
+
+    ret = ffa_notif_parse_params(ffa_get_vm_id(d), caller_id, dest_id,
+                                 bitmap_lo, bitmap_hi);
+    if ( ret )
+        return ret;
 
-    if ( (src_dst >> 16) != ffa_get_vm_id(d) )
+    if ( flags )
         return FFA_RET_INVALID_PARAMETERS;
 
-    if ( FFA_ID_IS_SECURE(src_dst & GENMASK(15, 0)) && fw_notif_enabled )
+    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
         return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_lo,
                                bitmap_hi);
 
-- 
2.53.0


