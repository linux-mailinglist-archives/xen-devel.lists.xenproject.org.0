Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAcnGHGwpWkiEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:44:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA81DC15A
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:44:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244373.1543828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Rp-0006Mj-F4; Mon, 02 Mar 2026 15:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244373.1543828; Mon, 02 Mar 2026 15:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Rp-0006JG-9n; Mon, 02 Mar 2026 15:44:41 +0000
Received: by outflank-mailman (input) for mailman id 1244373;
 Mon, 02 Mar 2026 15:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7KG=BC=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vx5Rn-0006Gr-Ro
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:44:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b6f7fd03-164e-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 16:44:36 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E77F14BF;
 Mon,  2 Mar 2026 07:44:29 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.82.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DC4A3F73B;
 Mon,  2 Mar 2026 07:44:34 -0800 (PST)
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
X-Inumbo-ID: b6f7fd03-164e-11f1-b164-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 1/4] xen/arm: ffa: Add start_index to VM partinfo helper
Date: Mon,  2 Mar 2026 16:44:10 +0100
Message-ID: <59113d382b0f31ae51152887a0afaeb10dcf8420.1772464956.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772464956.git.bertrand.marquis@arm.com>
References: <cover.1772464956.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1FFA81DC15A
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
	RCVD_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.946];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,linaro.org:email]
X-Rspamd-Action: no action

Windowed GET_REGS retrieval needs to emit VM entries starting from an
arbitrary index, but ffa_get_vm_partinfo() always starts from index 0.

Add a start_index parameter to ffa_get_vm_partinfo() and skip entries
until the local index reaches start_index. Update
ffa_handle_partition_info_get() to pass start_index=0 to preserve
existing behavior.

No functional changes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Changes since v1:
- Add Jens R-b
---
 xen/arch/arm/tee/ffa_partinfo.c | 61 +++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index fdb03dae9a0c..6a6f3ffb822e 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -167,14 +167,15 @@ out:
     return ret;
 }
 
-static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t *vm_count,
-                                   void **dst_buf, void *end_buf,
-                                   uint32_t dst_size)
+static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t start_index,
+                                   uint32_t *vm_count, void **dst_buf,
+                                   void *end_buf, uint32_t dst_size)
 {
     struct domain *d = current->domain;
     struct ffa_ctx *curr_ctx = d->arch.tee;
     struct ffa_ctx *dest_ctx;
     uint32_t count = 0;
+    uint32_t idx = 0;
     int32_t ret = FFA_RET_OK;
     /*
      * We do not have UUID info for VMs so use the 1.0 structure so that we set
@@ -202,17 +203,21 @@ static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t *vm_count,
     if ( ACCESS_ONCE(curr_ctx->guest_vers) >= FFA_VERSION_1_2 )
     {
         /* Add caller VM information */
-        info.id = curr_ctx->ffa_id;
-        info.execution_context = curr_ctx->num_vcpus;
-        info.partition_properties = FFA_PART_VM_PROP;
-        if ( is_64bit_domain(d) )
-            info.partition_properties |= FFA_PART_PROP_AARCH64_STATE;
-
-        ret = ffa_copy_info(dst_buf, end_buf, &info, dst_size, sizeof(info));
-        if ( ret )
-            return ret;
+        if ( start_index == 0)
+        {
+            info.id = curr_ctx->ffa_id;
+            info.execution_context = curr_ctx->num_vcpus;
+            info.partition_properties = FFA_PART_VM_PROP;
+            if ( is_64bit_domain(d) )
+                info.partition_properties |= FFA_PART_PROP_AARCH64_STATE;
 
-        count++;
+            ret = ffa_copy_info(dst_buf, end_buf, &info, dst_size,
+                                sizeof(info));
+            if ( ret )
+                return ret;
+            count++;
+        }
+        idx++;
     }
 
     if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
@@ -231,21 +236,25 @@ static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t *vm_count,
             if ( dest_ctx == curr_ctx )
                 continue;
 
-            info.id = dest_ctx->ffa_id;
-            info.execution_context = dest_ctx->num_vcpus;
-            info.partition_properties = FFA_PART_VM_PROP;
-            if ( dest_ctx->is_64bit )
-                info.partition_properties |= FFA_PART_PROP_AARCH64_STATE;
-
-            ret = ffa_copy_info(dst_buf, end_buf, &info, dst_size,
-                                sizeof(info));
-            if ( ret )
+            if ( idx >= start_index )
             {
-                read_unlock(&ffa_ctx_list_rwlock);
-                return ret;
+                info.id = dest_ctx->ffa_id;
+                info.execution_context = dest_ctx->num_vcpus;
+                info.partition_properties = FFA_PART_VM_PROP;
+                if ( dest_ctx->is_64bit )
+                    info.partition_properties |= FFA_PART_PROP_AARCH64_STATE;
+
+                ret = ffa_copy_info(dst_buf, end_buf, &info, dst_size,
+                                    sizeof(info));
+                if ( ret )
+                {
+                    read_unlock(&ffa_ctx_list_rwlock);
+                    return ret;
+                }
+                count++;
             }
 
-            count++;
+            idx++;
         }
         read_unlock(&ffa_ctx_list_rwlock);
     }
@@ -355,7 +364,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
             goto out_rx_release;
     }
 
-    ret = ffa_get_vm_partinfo(uuid, &ffa_vm_count, &dst_buf, end_buf,
+    ret = ffa_get_vm_partinfo(uuid, 0, &ffa_vm_count, &dst_buf, end_buf,
                               dst_size);
 
 out_rx_release:
-- 
2.52.0


