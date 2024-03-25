Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F262D88986B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:39:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697647.1088609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognQ-0001J8-MX; Mon, 25 Mar 2024 09:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697647.1088609; Mon, 25 Mar 2024 09:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognQ-0001C2-Iv; Mon, 25 Mar 2024 09:39:12 +0000
Received: by outflank-mailman (input) for mailman id 697647;
 Mon, 25 Mar 2024 09:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWJZ=K7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rognP-000193-BF
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 09:39:11 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 883ef379-ea8b-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 10:39:10 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a4a39ab1a10so66662966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 02:39:10 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b00a4650ec48d0sm2891067ejb.140.2024.03.25.02.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 02:39:09 -0700 (PDT)
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
X-Inumbo-ID: 883ef379-ea8b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711359550; x=1711964350; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIM5k3CjT9Nw1rXmWFG3LUyacrKSLr0M9YlhGWJO8pY=;
        b=XJVMo5SHh75akJAC/nEUOl8MhUoevTSYzAYJv4ueURl6qt7FHPowsmD3Lo07GB4m1C
         S/kyxqVRTb8DVPSbplOSbz+ZiZhHlCtGF91yRYKCRM0oDorM3/RfTYBMxase4mUOEnQD
         GBtrgRKQzCjtn9YdMYaY5WVV66sUWgHjrPASEMRiA+ouDYxRauOAg4+EJ46uWo0/NMnn
         oeBceEyEiS/90x1Rz0R2mHl6rOD0G+BLHXJs3exMGJBU8BIKxHVFLX+Kff058I4TIH/h
         RKsIcxQ0LgBowlxES+LQwz0I2jJLZci3O0Ak/9t9Uw5XZpNheGpJt5/kfHcwQo1KYUQV
         KyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711359550; x=1711964350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIM5k3CjT9Nw1rXmWFG3LUyacrKSLr0M9YlhGWJO8pY=;
        b=ry7x2QdZeZlS8hqvcFho3hLSb3f+m3350UVaF0uh+WZ8MtMV5kXF3OTfV6jTsWZKQ3
         poQ5ssfd/AthnuLLnL2YGWwWf5zUWNZQEKPdBG8asIn8IlAmaXmW1kkYOSKL8DrUHuna
         1BSEfgJwy/JlQTyxLZ5D+A0I40JJIE6q1xwCU3kuieLWcDNQx6P9GzWdBDfTSLOvKPdE
         XNhoZvor6rz9JKZ+/gb0EWs4vwnpHsYwZ3hOXTj91NMGEqeAeSyqI5+Odim6cTSHXWTY
         ldJ2suNKJoTX0rcxTWvuLJ8NugGusu9HvH9ZbOD23YekmRtkrVSnO7lYmAYLy+fx6Trw
         rmxQ==
X-Gm-Message-State: AOJu0YzwPIVQExQZU7lt9rKMCtkkQzws/UDFeiwMnmRVTED0kruo6S8w
	3Twc93VtYHJI/6Eb4511wRPThNDP2y0MouQZoRHQfXl2kdp3COa7v5p7Mol4Bobw/A7PK6ik8Tf
	w
X-Google-Smtp-Source: AGHT+IFFM3XCbhGI12K+dE83gxQ3Se0cUgVXLDD58NPg/RxLYIuvc1dMnqatdb6UpHFlryNry75PSQ==
X-Received: by 2002:a17:906:8cb:b0:a47:ae0:160 with SMTP id o11-20020a17090608cb00b00a470ae00160mr4125668eje.73.1711359549783;
        Mon, 25 Mar 2024 02:39:09 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH 1/6] xen/arm: ffa: rename functions to use ffa_ prefix
Date: Mon, 25 Mar 2024 10:38:59 +0100
Message-Id: <20240325093904.3466092-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325093904.3466092-1-jens.wiklander@linaro.org>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare to separate into modules by renaming functions that will need
new names when becoming non-static in the following commit.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 125 +++++++++++++++++++++--------------------
 1 file changed, 65 insertions(+), 60 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 9a05dcede17a..0344a0f17e72 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -4,7 +4,7 @@
  *
  * Arm Firmware Framework for ARMv8-A (FF-A) mediator
  *
- * Copyright (C) 2023  Linaro Limited
+ * Copyright (C) 2023-2024  Linaro Limited
  *
  * References:
  * FF-A-1.0-REL: FF-A specification version 1.0 available at
@@ -473,7 +473,7 @@ static bool ffa_get_version(uint32_t *vers)
     return true;
 }
 
-static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
+static int32_t ffa_get_ret_code(const struct arm_smccc_1_2_regs *resp)
 {
     switch ( resp->a0 )
     {
@@ -504,7 +504,7 @@ static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t a2,
 
     arm_smccc_1_2_smc(&arg, &resp);
 
-    return get_ffa_ret_code(&resp);
+    return ffa_get_ret_code(&resp);
 }
 
 static int32_t ffa_features(uint32_t id)
@@ -546,7 +546,7 @@ static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
 
     arm_smccc_1_2_smc(&arg, &resp);
 
-    ret = get_ffa_ret_code(&resp);
+    ret = ffa_get_ret_code(&resp);
     if ( !ret )
     {
         *count = resp.a2;
@@ -654,15 +654,16 @@ static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
     return res;
 }
 
-static uint16_t get_vm_id(const struct domain *d)
+static uint16_t ffa_get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
     return d->domain_id + 1;
 }
 
-static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
-                     register_t v2, register_t v3, register_t v4, register_t v5,
-                     register_t v6, register_t v7)
+static void ffa_set_regs(struct cpu_user_regs *regs, register_t v0,
+                         register_t v1, register_t v2, register_t v3,
+                         register_t v4, register_t v5, register_t v6,
+                         register_t v7)
 {
         set_user_reg(regs, 0, v0);
         set_user_reg(regs, 1, v1);
@@ -674,15 +675,15 @@ static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
         set_user_reg(regs, 7, v7);
 }
 
-static void set_regs_error(struct cpu_user_regs *regs, uint32_t error_code)
+static void ffa_set_regs_error(struct cpu_user_regs *regs, uint32_t error_code)
 {
-    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
+    ffa_set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
 }
 
-static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
+static void ffa_set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
                              uint32_t w3)
 {
-    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
+    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
 }
 
 static void handle_version(struct cpu_user_regs *regs)
@@ -697,11 +698,11 @@ static void handle_version(struct cpu_user_regs *regs)
         vers = FFA_VERSION_1_1;
 
     ctx->guest_vers = vers;
-    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
+    ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
 }
 
-static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
-                                register_t rx_addr, uint32_t page_count)
+static uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
+				    register_t rx_addr, uint32_t page_count)
 {
     uint32_t ret = FFA_RET_INVALID_PARAMETERS;
     struct domain *d = current->domain;
@@ -789,7 +790,7 @@ static void rxtx_unmap(struct ffa_ctx *ctx)
     ctx->rx_is_free = false;
 }
 
-static uint32_t handle_rxtx_unmap(void)
+static uint32_t ffa_handle_rxtx_unmap(void)
 {
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
@@ -802,9 +803,10 @@ static uint32_t handle_rxtx_unmap(void)
     return FFA_RET_OK;
 }
 
-static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
-                                         uint32_t w4, uint32_t w5,
-                                         uint32_t *count, uint32_t *fpi_size)
+static int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2,
+                                             uint32_t w3, uint32_t w4,
+                                             uint32_t w5, uint32_t *count,
+                                             uint32_t *fpi_size)
 {
     int32_t ret = FFA_RET_DENIED;
     struct domain *d = current->domain;
@@ -883,7 +885,7 @@ out:
     return ret;
 }
 
-static int32_t handle_rx_release(void)
+static int32_t ffa_handle_rx_release(void)
 {
     int32_t ret = FFA_RET_DENIED;
     struct domain *d = current->domain;
@@ -916,7 +918,7 @@ static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
         mask = GENMASK_ULL(31, 0);
 
     src_dst = get_user_reg(regs, 1);
-    if ( (src_dst >> 16) != get_vm_id(d) )
+    if ( (src_dst >> 16) != ffa_get_vm_id(d) )
     {
         resp.a0 = FFA_ERROR;
         resp.a2 = FFA_RET_INVALID_PARAMETERS;
@@ -949,8 +951,9 @@ static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
     }
 
 out:
-    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & mask,
-             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & mask);
+    ffa_set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & mask,
+                 resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
+                 resp.a7 & mask);
 }
 
 /*
@@ -1249,7 +1252,7 @@ static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size_t blen,
     return 0;
 }
 
-static void handle_mem_share(struct cpu_user_regs *regs)
+static void ffa_handle_mem_share(struct cpu_user_regs *regs)
 {
     uint32_t tot_len = get_user_reg(regs, 1);
     uint32_t frag_len = get_user_reg(regs, 2);
@@ -1318,7 +1321,7 @@ static void handle_mem_share(struct cpu_user_regs *regs)
         goto out_unlock;
     }
 
-    if ( trans.sender_id != get_vm_id(d) )
+    if ( trans.sender_id != ffa_get_vm_id(d) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
         goto out_unlock;
@@ -1402,9 +1405,9 @@ out_unlock:
 
 out_set_ret:
     if ( ret == 0)
-            set_regs_success(regs, handle_lo, handle_hi);
+            ffa_set_regs_success(regs, handle_lo, handle_hi);
     else
-            set_regs_error(regs, ret);
+            ffa_set_regs_error(regs, ret);
 }
 
 /* Must only be called with ctx->lock held */
@@ -1419,7 +1422,7 @@ static struct ffa_shm_mem *find_shm_mem(struct ffa_ctx *ctx, uint64_t handle)
     return NULL;
 }
 
-static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
+static int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags)
 {
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
@@ -1471,41 +1474,42 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         handle_version(regs);
         return true;
     case FFA_ID_GET:
-        set_regs_success(regs, get_vm_id(d), 0);
+        ffa_set_regs_success(regs, ffa_get_vm_id(d), 0);
         return true;
     case FFA_RXTX_MAP_32:
     case FFA_RXTX_MAP_64:
-        e = handle_rxtx_map(fid, get_user_reg(regs, 1), get_user_reg(regs, 2),
-                            get_user_reg(regs, 3));
+        e = ffa_handle_rxtx_map(fid, get_user_reg(regs, 1),
+				get_user_reg(regs, 2), get_user_reg(regs, 3));
         if ( e )
-            set_regs_error(regs, e);
+            ffa_set_regs_error(regs, e);
         else
-            set_regs_success(regs, 0, 0);
+            ffa_set_regs_success(regs, 0, 0);
         return true;
     case FFA_RXTX_UNMAP:
-        e = handle_rxtx_unmap();
+        e = ffa_handle_rxtx_unmap();
         if ( e )
-            set_regs_error(regs, e);
+            ffa_set_regs_error(regs, e);
         else
-            set_regs_success(regs, 0, 0);
+            ffa_set_regs_success(regs, 0, 0);
         return true;
     case FFA_PARTITION_INFO_GET:
-        e = handle_partition_info_get(get_user_reg(regs, 1),
-                                      get_user_reg(regs, 2),
-                                      get_user_reg(regs, 3),
-                                      get_user_reg(regs, 4),
-                                      get_user_reg(regs, 5), &count, &fpi_size);
+        e = ffa_handle_partition_info_get(get_user_reg(regs, 1),
+                                          get_user_reg(regs, 2),
+                                          get_user_reg(regs, 3),
+                                          get_user_reg(regs, 4),
+                                          get_user_reg(regs, 5), &count,
+                                          &fpi_size);
         if ( e )
-            set_regs_error(regs, e);
+            ffa_set_regs_error(regs, e);
         else
-            set_regs_success(regs, count, fpi_size);
+            ffa_set_regs_success(regs, count, fpi_size);
         return true;
     case FFA_RX_RELEASE:
-        e = handle_rx_release();
+        e = ffa_handle_rx_release();
         if ( e )
-            set_regs_error(regs, e);
+            ffa_set_regs_error(regs, e);
         else
-            set_regs_success(regs, 0, 0);
+            ffa_set_regs_success(regs, 0, 0);
         return true;
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
@@ -1513,21 +1517,21 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         return true;
     case FFA_MEM_SHARE_32:
     case FFA_MEM_SHARE_64:
-        handle_mem_share(regs);
+        ffa_handle_mem_share(regs);
         return true;
     case FFA_MEM_RECLAIM:
-        e = handle_mem_reclaim(regpair_to_uint64(get_user_reg(regs, 2),
-                                                 get_user_reg(regs, 1)),
-                               get_user_reg(regs, 3));
+        e = ffa_handle_mem_reclaim(regpair_to_uint64(get_user_reg(regs, 2),
+                                                     get_user_reg(regs, 1)),
+                                   get_user_reg(regs, 3));
         if ( e )
-            set_regs_error(regs, e);
+            ffa_set_regs_error(regs, e);
         else
-            set_regs_success(regs, 0, 0);
+            ffa_set_regs_success(regs, 0, 0);
         return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
-        set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         return true;
     }
 }
@@ -1593,12 +1597,12 @@ static int ffa_domain_init(struct domain *d)
 
     for ( n = 0; n < subscr_vm_created_count; n++ )
     {
-        res = ffa_direct_req_send_vm(subscr_vm_created[n], get_vm_id(d),
+        res = ffa_direct_req_send_vm(subscr_vm_created[n], ffa_get_vm_id(d),
                                      FFA_MSG_SEND_VM_CREATED);
         if ( res )
         {
             printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
-                   get_vm_id(d), subscr_vm_created[n], res);
+                   ffa_get_vm_id(d), subscr_vm_created[n], res);
             break;
         }
     }
@@ -1620,13 +1624,13 @@ static void send_vm_destroyed(struct domain *d)
         if ( !test_bit(n, ctx->vm_destroy_bitmap) )
             continue;
 
-        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id(d),
+        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_vm_id(d),
                                      FFA_MSG_SEND_VM_DESTROYED);
 
         if ( res )
         {
             printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of vm_id %u to %u: res %d\n",
-                   d, get_vm_id(d), subscr_vm_destroyed[n], res);
+                   d, ffa_get_vm_id(d), subscr_vm_destroyed[n], res);
         }
 
         /*
@@ -1640,7 +1644,7 @@ static void send_vm_destroyed(struct domain *d)
     }
 }
 
-static void reclaim_shms(struct domain *d)
+static void ffa_reclaim_shms(struct domain *d)
 {
     struct ffa_ctx *ctx = d->arch.tee;
     struct ffa_shm_mem *shm, *tmp;
@@ -1699,7 +1703,7 @@ static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_time)
     struct ffa_ctx *next_ctx = NULL;
 
     send_vm_destroyed(ctx->teardown_d);
-    reclaim_shms(ctx->teardown_d);
+    ffa_reclaim_shms(ctx->teardown_d);
 
     if ( ctx->shm_count ||
          !bitmap_empty(ctx->vm_destroy_bitmap, subscr_vm_destroyed_count) )
@@ -1719,7 +1723,8 @@ static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_time)
     {
         /*
          * domain_destroy() might have been called (via put_domain() in
-         * reclaim_shms()), so we can't touch the domain structure anymore.
+         * ffa_reclaim_shms()), so we can't touch the domain structure
+         * anymore.
          */
         xfree(ctx);
 
-- 
2.34.1


