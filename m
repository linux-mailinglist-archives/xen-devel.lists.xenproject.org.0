Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341388986F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697648.1088622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognU-0001kr-3y; Mon, 25 Mar 2024 09:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697648.1088622; Mon, 25 Mar 2024 09:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rognU-0001iH-0B; Mon, 25 Mar 2024 09:39:16 +0000
Received: by outflank-mailman (input) for mailman id 697648;
 Mon, 25 Mar 2024 09:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWJZ=K7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rognS-0001fs-N3
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 09:39:14 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8925edf5-ea8b-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 10:39:11 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso5582588a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 02:39:11 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b00a4650ec48d0sm2891067ejb.140.2024.03.25.02.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 02:39:10 -0700 (PDT)
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
X-Inumbo-ID: 8925edf5-ea8b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711359551; x=1711964351; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtKMkPrD3bbUTAe9JMaiR4498NfrGxZFJfJBgZJEUYQ=;
        b=IGxEWobmXXsZdvIiw0NIf7+pJIJHOGY7/90CM8G29bMe4cI1h1t0bM/SniO+rddRx1
         +sazB+I3t0KdgeqCRVBZ2Zi1n/47pTO/mEhU1937BRLm3ecr644aIVl6Pj+w0PDP750o
         lXBEfye3QuRaAxkSbr6GuVwPa3uauhuDEljy7ZYlA+n7rHwAr9cdjrZDQZZ1d/eVtGIQ
         J3lM2QJkAMQsX9CeiUSdF+dEVqzfW0CTDCp/yn5tTHVXQf5P1pSIoJppHPsBs05/88Uf
         dDZKxKKXhkHKS+hZFq3wapdVIo2NBLACKFsuO9LlcZ+LOSET92bFaT/8XhYACpyQ+z7C
         J1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711359551; x=1711964351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtKMkPrD3bbUTAe9JMaiR4498NfrGxZFJfJBgZJEUYQ=;
        b=Hexw0IheVfmFQd/tfm6g2PFb1CuROAt25qKspOVv8kJWOgAwTM6e5iAac29oe3gCyn
         wx9q+20V4hs+s7Pet60p8ohN9Sz3Gc54mb42KXqNLnQAjseNHDh9GNufCKq13Za5lmlT
         YNKFwTm+hXjGTwiKEhfkRbXkBkrl988sb56uh5IyrUPTpW+rO6KJrcHaP+tJMSi4rvI8
         rzUEZmpnq5AfI0URMyAP/iIp3rLb7mF4Dwgp+XYpKGWPwPAIH8gdfqIXeP1lzabzKRzM
         FWd3+4AjTalRjxmpohA3Bjsuo6CgkRKzTLXbuAc5hlPZch72dmube7UVbz1Fns93RrKj
         hDkw==
X-Gm-Message-State: AOJu0YyyAiT1eejzQWYNIQHg+EIgJbaJh8IjzXMAgtUeJDUAR+ydlKUx
	LYB/CmPsasw8LVoALEMiEoXgfBSs1NYg1eOXoegBISVy1H0VzE7RYrIWjSC5/BJm+SwmbJ+xac5
	L
X-Google-Smtp-Source: AGHT+IFEshPJz3eT1WpnGM/g8jA36vOf7jHJ/wJtxEy4DoWw66uuIwvxTVFyr8bGG52dsEvMmzOn+A==
X-Received: by 2002:a17:907:1002:b0:a46:e921:ae3f with SMTP id ox2-20020a170907100200b00a46e921ae3fmr4067032ejb.13.1711359550939;
        Mon, 25 Mar 2024 02:39:10 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH 2/6] xen/arm: ffa: move common things to ffa_private.h
Date: Mon, 25 Mar 2024 10:39:00 +0100
Message-Id: <20240325093904.3466092-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325093904.3466092-1-jens.wiklander@linaro.org>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare to separate ffa.c into modules by moving common things into the
new internal header file ffa_private.h.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c         | 298 +-----------------------------
 xen/arch/arm/tee/ffa_private.h | 318 +++++++++++++++++++++++++++++++++
 2 files changed, 319 insertions(+), 297 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_private.h

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 0344a0f17e72..259851f20bdb 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -63,204 +63,7 @@
 #include <asm/tee/ffa.h>
 #include <asm/tee/tee.h>
 
-/* Error codes */
-#define FFA_RET_OK                      0
-#define FFA_RET_NOT_SUPPORTED           -1
-#define FFA_RET_INVALID_PARAMETERS      -2
-#define FFA_RET_NO_MEMORY               -3
-#define FFA_RET_BUSY                    -4
-#define FFA_RET_INTERRUPTED             -5
-#define FFA_RET_DENIED                  -6
-#define FFA_RET_RETRY                   -7
-#define FFA_RET_ABORTED                 -8
-
-/* FFA_VERSION helpers */
-#define FFA_VERSION_MAJOR_SHIFT         16U
-#define FFA_VERSION_MAJOR_MASK          0x7FFFU
-#define FFA_VERSION_MINOR_SHIFT         0U
-#define FFA_VERSION_MINOR_MASK          0xFFFFU
-#define MAKE_FFA_VERSION(major, minor)  \
-        ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT) | \
-         ((minor) & FFA_VERSION_MINOR_MASK))
-
-#define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
-#define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
-/* The minimal FF-A version of the SPMC that can be supported */
-#define FFA_MIN_SPMC_VERSION    FFA_VERSION_1_1
-
-/*
- * This is the version we want to use in communication with guests and SPs.
- * During negotiation with a guest or a SP we may need to lower it for
- * that particular guest or SP.
- */
-#define FFA_MY_VERSION_MAJOR    1U
-#define FFA_MY_VERSION_MINOR    1U
-#define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
-                                                 FFA_MY_VERSION_MINOR)
-
-/*
- * The FF-A specification explicitly works with 4K pages as a measure of
- * memory size, for example, FFA_RXTX_MAP takes one parameter "RX/TX page
- * count" which is the number of contiguous 4K pages allocated. Xen may use
- * a different page size depending on the configuration to avoid confusion
- * with PAGE_SIZE use a special define when it's a page size as in the FF-A
- * specification.
- */
-#define FFA_PAGE_SIZE                   SZ_4K
-
-/*
- * The number of pages used for each of the RX and TX buffers shared with
- * the SPMC.
- */
-#define FFA_RXTX_PAGE_COUNT             1
-
-/*
- * Limit the number of pages RX/TX buffers guests can map.
- * TODO support a larger number.
- */
-#define FFA_MAX_RXTX_PAGE_COUNT         1
-
-/*
- * Limit for shared buffer size. Please note that this define limits
- * number of pages.
- *
- * FF-A doesn't have any direct requirements on GlobalPlatform or vice
- * versa, but an implementation can very well use FF-A in order to provide
- * a GlobalPlatform interface on top.
- *
- * Global Platform specification for TEE requires that any TEE
- * implementation should allow to share buffers with size of at least
- * 512KB, defined in TEEC-1.0C page 24, Table 4-1,
- * TEEC_CONFIG_SHAREDMEM_MAX_SIZE.
- * Due to overhead which can be hard to predict exactly, double this number
- * to give a safe margin.
- */
-#define FFA_MAX_SHM_PAGE_COUNT          (2 * SZ_512K / FFA_PAGE_SIZE)
-
-/*
- * Limits the number of shared buffers that guest can have at once. This
- * is to prevent case, when guests trick XEN into exhausting its own
- * memory by allocating many small buffers. This value has been chosen
- * arbitrarily.
- */
-#define FFA_MAX_SHM_COUNT               32
-
-/*
- * The time we wait until trying to tear down a domain again if it was
- * blocked initially.
- */
-#define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
-
-/* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
-#define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
-#define FFA_HANDLE_INVALID              0xffffffffffffffffULL
-
-/*
- * Memory attributes: Normal memory, Write-Back cacheable, Inner shareable
- * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
- */
-#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
-/*
- * Memory access permissions: Read-write
- * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
- */
-#define FFA_MEM_ACC_RW                  0x2U
-
-/* FF-A-1.1-REL0 section 10.11.4 Flags usage, page 184-187 */
-/* Clear memory before mapping in receiver */
-#define FFA_MEMORY_REGION_FLAG_CLEAR            BIT(0, U)
-/* Relayer may time slice this operation */
-#define FFA_MEMORY_REGION_FLAG_TIME_SLICE       BIT(1, U)
-/* Clear memory after receiver relinquishes it */
-#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH BIT(2, U)
-/* Share memory transaction */
-#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (1U << 3)
-
-/*
- * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
- * BIT(31): Framework or partition message
- * BIT(7-0): Message type for frameworks messages
- */
-#define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
-#define FFA_MSG_TYPE_MASK               0xFFU;
-#define FFA_MSG_PSCI                    0x0U
-#define FFA_MSG_SEND_VM_CREATED         0x4U
-#define FFA_MSG_RESP_VM_CREATED         0x5U
-#define FFA_MSG_SEND_VM_DESTROYED       0x6U
-#define FFA_MSG_RESP_VM_DESTROYED       0x7U
-
-/*
- * Flags to determine partition properties in FFA_PARTITION_INFO_GET return
- * message:
- * BIT(0): Supports receipt of direct requests
- * BIT(1): Can send direct requests
- * BIT(2): Can send and receive indirect messages
- * BIT(3): Supports receipt of notifications
- * BIT(4-5): Partition ID is a PE endpoint ID
- * BIT(6): Partition must be informed about each VM that is created by
- *         the Hypervisor
- * BIT(7): Partition must be informed about each VM that is destroyed by
- *         the Hypervisor
- * BIT(8): Partition runs in the AArch64 execution state else AArch32
- *         execution state
- */
-#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
-#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
-#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
-#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
-#define FFA_PART_PROP_IS_TYPE_MASK      (3U << 4)
-#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
-#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
-#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
-#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
-#define FFA_PART_PROP_NOTIF_CREATED     BIT(6, U)
-#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7, U)
-#define FFA_PART_PROP_AARCH64_STATE     BIT(8, U)
-
-/*
- * Flag used as parameter to FFA_PARTITION_INFO_GET to return partition
- * count only.
- */
-#define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
-
-/* Function IDs */
-#define FFA_ERROR                       0x84000060U
-#define FFA_SUCCESS_32                  0x84000061U
-#define FFA_SUCCESS_64                  0xC4000061U
-#define FFA_INTERRUPT                   0x84000062U
-#define FFA_VERSION                     0x84000063U
-#define FFA_FEATURES                    0x84000064U
-#define FFA_RX_ACQUIRE                  0x84000084U
-#define FFA_RX_RELEASE                  0x84000065U
-#define FFA_RXTX_MAP_32                 0x84000066U
-#define FFA_RXTX_MAP_64                 0xC4000066U
-#define FFA_RXTX_UNMAP                  0x84000067U
-#define FFA_PARTITION_INFO_GET          0x84000068U
-#define FFA_ID_GET                      0x84000069U
-#define FFA_SPM_ID_GET                  0x84000085U
-#define FFA_MSG_WAIT                    0x8400006BU
-#define FFA_MSG_YIELD                   0x8400006CU
-#define FFA_RUN                         0x8400006DU
-#define FFA_MSG_SEND2                   0x84000086U
-#define FFA_MSG_SEND_DIRECT_REQ_32      0x8400006FU
-#define FFA_MSG_SEND_DIRECT_REQ_64      0xC400006FU
-#define FFA_MSG_SEND_DIRECT_RESP_32     0x84000070U
-#define FFA_MSG_SEND_DIRECT_RESP_64     0xC4000070U
-#define FFA_MEM_DONATE_32               0x84000071U
-#define FFA_MEM_DONATE_64               0xC4000071U
-#define FFA_MEM_LEND_32                 0x84000072U
-#define FFA_MEM_LEND_64                 0xC4000072U
-#define FFA_MEM_SHARE_32                0x84000073U
-#define FFA_MEM_SHARE_64                0xC4000073U
-#define FFA_MEM_RETRIEVE_REQ_32         0x84000074U
-#define FFA_MEM_RETRIEVE_REQ_64         0xC4000074U
-#define FFA_MEM_RETRIEVE_RESP           0x84000075U
-#define FFA_MEM_RELINQUISH              0x84000076U
-#define FFA_MEM_RECLAIM                 0x84000077U
-#define FFA_MEM_FRAG_RX                 0x8400007AU
-#define FFA_MEM_FRAG_TX                 0x8400007BU
-#define FFA_MSG_SEND                    0x8400006EU
-#define FFA_MSG_POLL                    0x8400006AU
+#include "ffa_private.h"
 
 /*
  * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
@@ -382,39 +185,6 @@ struct ffa_endpoint_rxtx_descriptor_1_1 {
     uint32_t tx_region_offs;
 };
 
-struct ffa_ctx {
-    void *rx;
-    const void *tx;
-    struct page_info *rx_pg;
-    struct page_info *tx_pg;
-    /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
-    unsigned int page_count;
-    /* FF-A version used by the guest */
-    uint32_t guest_vers;
-    bool rx_is_free;
-    /* Used shared memory objects, struct ffa_shm_mem */
-    struct list_head shm_list;
-    /* Number of allocated shared memory object */
-    unsigned int shm_count;
-    /*
-     * tx_lock is used to serialize access to tx
-     * rx_lock is used to serialize access to rx
-     * lock is used for the rest in this struct
-     */
-    spinlock_t tx_lock;
-    spinlock_t rx_lock;
-    spinlock_t lock;
-    /* Used if domain can't be torn down immediately */
-    struct domain *teardown_d;
-    struct list_head teardown_list;
-    s_time_t teardown_expire;
-    /*
-     * Used for ffa_domain_teardown() to keep track of which SPs should be
-     * notified that this guest is being destroyed.
-     */
-    unsigned long vm_destroy_bitmap[];
-};
-
 struct ffa_shm_mem {
     struct list_head list;
     uint16_t sender_id;
@@ -473,40 +243,6 @@ static bool ffa_get_version(uint32_t *vers)
     return true;
 }
 
-static int32_t ffa_get_ret_code(const struct arm_smccc_1_2_regs *resp)
-{
-    switch ( resp->a0 )
-    {
-    case FFA_ERROR:
-        if ( resp->a2 )
-            return resp->a2;
-        else
-            return FFA_RET_NOT_SUPPORTED;
-    case FFA_SUCCESS_32:
-    case FFA_SUCCESS_64:
-        return FFA_RET_OK;
-    default:
-        return FFA_RET_NOT_SUPPORTED;
-    }
-}
-
-static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t a2,
-                               register_t a3, register_t a4)
-{
-    const struct arm_smccc_1_2_regs arg = {
-        .a0 = fid,
-        .a1 = a1,
-        .a2 = a2,
-        .a3 = a3,
-        .a4 = a4,
-    };
-    struct arm_smccc_1_2_regs resp;
-
-    arm_smccc_1_2_smc(&arg, &resp);
-
-    return ffa_get_ret_code(&resp);
-}
-
 static int32_t ffa_features(uint32_t id)
 {
     return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
@@ -654,38 +390,6 @@ static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
     return res;
 }
 
-static uint16_t ffa_get_vm_id(const struct domain *d)
-{
-    /* +1 since 0 is reserved for the hypervisor in FF-A */
-    return d->domain_id + 1;
-}
-
-static void ffa_set_regs(struct cpu_user_regs *regs, register_t v0,
-                         register_t v1, register_t v2, register_t v3,
-                         register_t v4, register_t v5, register_t v6,
-                         register_t v7)
-{
-        set_user_reg(regs, 0, v0);
-        set_user_reg(regs, 1, v1);
-        set_user_reg(regs, 2, v2);
-        set_user_reg(regs, 3, v3);
-        set_user_reg(regs, 4, v4);
-        set_user_reg(regs, 5, v5);
-        set_user_reg(regs, 6, v6);
-        set_user_reg(regs, 7, v7);
-}
-
-static void ffa_set_regs_error(struct cpu_user_regs *regs, uint32_t error_code)
-{
-    ffa_set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
-}
-
-static void ffa_set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
-                             uint32_t w3)
-{
-    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
-}
-
 static void handle_version(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
new file mode 100644
index 000000000000..8352b6b55a9a
--- /dev/null
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -0,0 +1,318 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023  Linaro Limited
+ */
+
+#ifndef __FFA_PRIVATE_H__
+#define __FFA_PRIVATE_H__
+
+#include <xen/const.h>
+#include <xen/sizes.h>
+#include <xen/types.h>
+#include <xen/mm.h>
+#include <xen/list.h>
+#include <xen/spinlock.h>
+#include <xen/sched.h>
+#include <xen/time.h>
+
+/* Error codes */
+#define FFA_RET_OK                      0
+#define FFA_RET_NOT_SUPPORTED           -1
+#define FFA_RET_INVALID_PARAMETERS      -2
+#define FFA_RET_NO_MEMORY               -3
+#define FFA_RET_BUSY                    -4
+#define FFA_RET_INTERRUPTED             -5
+#define FFA_RET_DENIED                  -6
+#define FFA_RET_RETRY                   -7
+#define FFA_RET_ABORTED                 -8
+
+/* FFA_VERSION helpers */
+#define FFA_VERSION_MAJOR_SHIFT         16U
+#define FFA_VERSION_MAJOR_MASK          0x7FFFU
+#define FFA_VERSION_MINOR_SHIFT         0U
+#define FFA_VERSION_MINOR_MASK          0xFFFFU
+#define MAKE_FFA_VERSION(major, minor)  \
+        ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT) | \
+         ((minor) & FFA_VERSION_MINOR_MASK))
+
+#define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
+#define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
+/* The minimal FF-A version of the SPMC that can be supported */
+#define FFA_MIN_SPMC_VERSION    FFA_VERSION_1_1
+
+/*
+ * This is the version we want to use in communication with guests and SPs.
+ * During negotiation with a guest or a SP we may need to lower it for
+ * that particular guest or SP.
+ */
+#define FFA_MY_VERSION_MAJOR    1U
+#define FFA_MY_VERSION_MINOR    1U
+#define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
+                                                 FFA_MY_VERSION_MINOR)
+
+/*
+ * The FF-A specification explicitly works with 4K pages as a measure of
+ * memory size, for example, FFA_RXTX_MAP takes one parameter "RX/TX page
+ * count" which is the number of contiguous 4K pages allocated. Xen may use
+ * a different page size depending on the configuration to avoid confusion
+ * with PAGE_SIZE use a special define when it's a page size as in the FF-A
+ * specification.
+ */
+#define FFA_PAGE_SIZE                   SZ_4K
+
+/*
+ * The number of pages used for each of the RX and TX buffers shared with
+ * the SPMC.
+ */
+#define FFA_RXTX_PAGE_COUNT             1
+
+/*
+ * Limit the number of pages RX/TX buffers guests can map.
+ * TODO support a larger number.
+ */
+#define FFA_MAX_RXTX_PAGE_COUNT         1
+
+/*
+ * Limit for shared buffer size. Please note that this define limits
+ * number of pages.
+ *
+ * FF-A doesn't have any direct requirements on GlobalPlatform or vice
+ * versa, but an implementation can very well use FF-A in order to provide
+ * a GlobalPlatform interface on top.
+ *
+ * Global Platform specification for TEE requires that any TEE
+ * implementation should allow to share buffers with size of at least
+ * 512KB, defined in TEEC-1.0C page 24, Table 4-1,
+ * TEEC_CONFIG_SHAREDMEM_MAX_SIZE.
+ * Due to overhead which can be hard to predict exactly, double this number
+ * to give a safe margin.
+ */
+#define FFA_MAX_SHM_PAGE_COUNT          (2 * SZ_512K / FFA_PAGE_SIZE)
+
+/*
+ * Limits the number of shared buffers that guest can have at once. This
+ * is to prevent case, when guests trick XEN into exhausting its own
+ * memory by allocating many small buffers. This value has been chosen
+ * arbitrarily.
+ */
+#define FFA_MAX_SHM_COUNT               32
+
+/*
+ * The time we wait until trying to tear down a domain again if it was
+ * blocked initially.
+ */
+#define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
+
+/* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
+#define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
+#define FFA_HANDLE_INVALID              0xffffffffffffffffULL
+
+/*
+ * Memory attributes: Normal memory, Write-Back cacheable, Inner shareable
+ * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
+ */
+#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
+/*
+ * Memory access permissions: Read-write
+ * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
+ */
+#define FFA_MEM_ACC_RW                  0x2U
+
+/* FF-A-1.1-REL0 section 10.11.4 Flags usage, page 184-187 */
+/* Clear memory before mapping in receiver */
+#define FFA_MEMORY_REGION_FLAG_CLEAR            BIT(0, U)
+/* Relayer may time slice this operation */
+#define FFA_MEMORY_REGION_FLAG_TIME_SLICE       BIT(1, U)
+/* Clear memory after receiver relinquishes it */
+#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH BIT(2, U)
+/* Share memory transaction */
+#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (1U << 3)
+
+/*
+ * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
+ * BIT(31): Framework or partition message
+ * BIT(7-0): Message type for frameworks messages
+ */
+#define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
+#define FFA_MSG_TYPE_MASK               0xFFU;
+#define FFA_MSG_PSCI                    0x0U
+#define FFA_MSG_SEND_VM_CREATED         0x4U
+#define FFA_MSG_RESP_VM_CREATED         0x5U
+#define FFA_MSG_SEND_VM_DESTROYED       0x6U
+#define FFA_MSG_RESP_VM_DESTROYED       0x7U
+
+/*
+ * Flags to determine partition properties in FFA_PARTITION_INFO_GET return
+ * message:
+ * BIT(0): Supports receipt of direct requests
+ * BIT(1): Can send direct requests
+ * BIT(2): Can send and receive indirect messages
+ * BIT(3): Supports receipt of notifications
+ * BIT(4-5): Partition ID is a PE endpoint ID
+ * BIT(6): Partition must be informed about each VM that is created by
+ *         the Hypervisor
+ * BIT(7): Partition must be informed about each VM that is destroyed by
+ *         the Hypervisor
+ * BIT(8): Partition runs in the AArch64 execution state else AArch32
+ *         execution state
+ */
+#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
+#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
+#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
+#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
+#define FFA_PART_PROP_IS_TYPE_MASK      (3U << 4)
+#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
+#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
+#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
+#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
+#define FFA_PART_PROP_NOTIF_CREATED     BIT(6, U)
+#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7, U)
+#define FFA_PART_PROP_AARCH64_STATE     BIT(8, U)
+
+/*
+ * Flag used as parameter to FFA_PARTITION_INFO_GET to return partition
+ * count only.
+ */
+#define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
+
+/* Function IDs */
+#define FFA_ERROR                       0x84000060U
+#define FFA_SUCCESS_32                  0x84000061U
+#define FFA_SUCCESS_64                  0xC4000061U
+#define FFA_INTERRUPT                   0x84000062U
+#define FFA_VERSION                     0x84000063U
+#define FFA_FEATURES                    0x84000064U
+#define FFA_RX_ACQUIRE                  0x84000084U
+#define FFA_RX_RELEASE                  0x84000065U
+#define FFA_RXTX_MAP_32                 0x84000066U
+#define FFA_RXTX_MAP_64                 0xC4000066U
+#define FFA_RXTX_UNMAP                  0x84000067U
+#define FFA_PARTITION_INFO_GET          0x84000068U
+#define FFA_ID_GET                      0x84000069U
+#define FFA_SPM_ID_GET                  0x84000085U
+#define FFA_MSG_WAIT                    0x8400006BU
+#define FFA_MSG_YIELD                   0x8400006CU
+#define FFA_RUN                         0x8400006DU
+#define FFA_MSG_SEND2                   0x84000086U
+#define FFA_MSG_SEND_DIRECT_REQ_32      0x8400006FU
+#define FFA_MSG_SEND_DIRECT_REQ_64      0xC400006FU
+#define FFA_MSG_SEND_DIRECT_RESP_32     0x84000070U
+#define FFA_MSG_SEND_DIRECT_RESP_64     0xC4000070U
+#define FFA_MEM_DONATE_32               0x84000071U
+#define FFA_MEM_DONATE_64               0xC4000071U
+#define FFA_MEM_LEND_32                 0x84000072U
+#define FFA_MEM_LEND_64                 0xC4000072U
+#define FFA_MEM_SHARE_32                0x84000073U
+#define FFA_MEM_SHARE_64                0xC4000073U
+#define FFA_MEM_RETRIEVE_REQ_32         0x84000074U
+#define FFA_MEM_RETRIEVE_REQ_64         0xC4000074U
+#define FFA_MEM_RETRIEVE_RESP           0x84000075U
+#define FFA_MEM_RELINQUISH              0x84000076U
+#define FFA_MEM_RECLAIM                 0x84000077U
+#define FFA_MEM_FRAG_RX                 0x8400007AU
+#define FFA_MEM_FRAG_TX                 0x8400007BU
+#define FFA_MSG_SEND                    0x8400006EU
+#define FFA_MSG_POLL                    0x8400006AU
+
+struct ffa_ctx {
+    void *rx;
+    const void *tx;
+    struct page_info *rx_pg;
+    struct page_info *tx_pg;
+    /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
+    unsigned int page_count;
+    /* FF-A version used by the guest */
+    uint32_t guest_vers;
+    bool rx_is_free;
+    /* Used shared memory objects, struct ffa_shm_mem */
+    struct list_head shm_list;
+    /* Number of allocated shared memory object */
+    unsigned int shm_count;
+    /*
+     * tx_lock is used to serialize access to tx
+     * rx_lock is used to serialize access to rx
+     * lock is used for the rest in this struct
+     */
+    spinlock_t tx_lock;
+    spinlock_t rx_lock;
+    spinlock_t lock;
+    /* Used if domain can't be torn down immediately */
+    struct domain *teardown_d;
+    struct list_head teardown_list;
+    s_time_t teardown_expire;
+    /*
+     * Used for ffa_domain_teardown() to keep track of which SPs should be
+     * notified that this guest is being destroyed.
+     */
+    unsigned long vm_destroy_bitmap[];
+};
+
+static inline uint16_t ffa_get_vm_id(const struct domain *d)
+{
+    /* +1 since 0 is reserved for the hypervisor in FF-A */
+    return d->domain_id + 1;
+}
+
+static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v0,
+                                register_t v1, register_t v2, register_t v3,
+                                register_t v4, register_t v5, register_t v6,
+                                register_t v7)
+{
+        set_user_reg(regs, 0, v0);
+        set_user_reg(regs, 1, v1);
+        set_user_reg(regs, 2, v2);
+        set_user_reg(regs, 3, v3);
+        set_user_reg(regs, 4, v4);
+        set_user_reg(regs, 5, v5);
+        set_user_reg(regs, 6, v6);
+        set_user_reg(regs, 7, v7);
+}
+
+static inline void ffa_set_regs_error(struct cpu_user_regs *regs,
+                                      uint32_t error_code)
+{
+    ffa_set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
+}
+
+static inline void ffa_set_regs_success(struct cpu_user_regs *regs,
+                                        uint32_t w2, uint32_t w3)
+{
+    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
+}
+
+static inline int32_t ffa_get_ret_code(const struct arm_smccc_1_2_regs *resp)
+{
+    switch ( resp->a0 )
+    {
+    case FFA_ERROR:
+        if ( resp->a2 )
+            return resp->a2;
+        else
+            return FFA_RET_NOT_SUPPORTED;
+    case FFA_SUCCESS_32:
+    case FFA_SUCCESS_64:
+        return FFA_RET_OK;
+    default:
+        return FFA_RET_NOT_SUPPORTED;
+    }
+}
+
+static inline int32_t ffa_simple_call(uint32_t fid, register_t a1,
+                                      register_t a2, register_t a3,
+                                      register_t a4)
+{
+    const struct arm_smccc_1_2_regs arg = {
+        .a0 = fid,
+        .a1 = a1,
+        .a2 = a2,
+        .a3 = a3,
+        .a4 = a4,
+    };
+    struct arm_smccc_1_2_regs resp;
+
+    arm_smccc_1_2_smc(&arg, &resp);
+
+    return ffa_get_ret_code(&resp);
+}
+
+#endif /*__FFA_PRIVATE_H__*/
-- 
2.34.1


