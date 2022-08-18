Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2855981C6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 12:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389440.626431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCN-0006nC-KP; Thu, 18 Aug 2022 10:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389440.626431; Thu, 18 Aug 2022 10:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdCN-0006fS-3d; Thu, 18 Aug 2022 10:56:27 +0000
Received: by outflank-mailman (input) for mailman id 389440;
 Thu, 18 Aug 2022 10:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avir=YW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oOdCK-00040G-I0
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 10:56:24 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65f25be7-1ee4-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 12:56:23 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id i19so1620520lfr.10
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 03:56:23 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 y27-20020a0565123f1b00b0048a85334a11sm176837lfa.143.2022.08.18.03.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 03:56:21 -0700 (PDT)
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
X-Inumbo-ID: 65f25be7-1ee4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dwUH8+8SakHd6rIJuXOrIWqBVbsAd/ZkeTcL8PFyO3Q=;
        b=dhsyGAA4xcAvoshdenrc/iiqcY91zHaq8eO0COlJz9r6uYwc9uzV9Zp5PxtMvWeM3I
         dftb4kkwr//XdcS2N3zpirdrvLaFN1Ng98z+rPEpWef9pEqvpXYBcryKcqZi/Rv2mSng
         CfDawlJZMC4ZjEc8gPjDKx5gcsdeTkZbXg5aRL2Ny5JCRoVUO4MxqvCusbUxydtmrMfS
         omcpDRMFhKIyi9jwklvEVen84f+8DOwUYsNaGVIyFJr82pJ3JSCmZw7AG8TZWhVa/97z
         AAMrAnmJ46RHiPStm1XqSAOzLRiyz42/WgCXhUuTQF1Hit3mp503hfcZLq0stE4cX+am
         SSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dwUH8+8SakHd6rIJuXOrIWqBVbsAd/ZkeTcL8PFyO3Q=;
        b=nZ0MI0UlT6WSxSALGfHkxKwks7E5om9vmcq+Iv/Hqp4YQlwOBCX3pZembAzxFgpvSH
         L/L03OmjR1x2lDRlGTyaDHzD34ngbL8w10oiRhphVHZ1MLZSDEtE9w9ZdJEWvHMnyb2d
         2Kv9x8pFbmC+aDoAIGX80cFJY/ubBWw017FdfC3i3MeGzCPv7XB9rQc/ozgNnSsTBdR3
         4KesHcMbmI5HmYtZflO6kgjxH7xC59ZE9pKRge+vQft+MF3OXSdaxfzbjZfmSDGb3g2J
         3myz5+BaWG1bprpNXDnTXz0RoMbdY8n+Ifxm76ihRAJv6K609BtRD0gquIFNLoXVJS8A
         px4A==
X-Gm-Message-State: ACgBeo0C8h2Ov94n646Yz0uCb5xPK/v4/yoB8LH33LxS5Atwcxd/FwKP
	cdAmaAZZS9GJSQEz6MMDyAnh35NN3XFEXg==
X-Google-Smtp-Source: AA6agR74ylScPjqCTvBmLCgxsQCOt3Coq6cFyM1tI5xqcCOMB4ibSSUCudNPJ3P2SfeM0qbSAibLgw==
X-Received: by 2002:ac2:5f77:0:b0:48b:38a4:2300 with SMTP id c23-20020ac25f77000000b0048b38a42300mr738427lfc.445.1660820182175;
        Thu, 18 Aug 2022 03:56:22 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 9/9] xen/arm: ffa: support sharing memory
Date: Thu, 18 Aug 2022 12:56:01 +0200
Message-Id: <20220818105601.1896082-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220818105601.1896082-1-jens.wiklander@linaro.org>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for a guest to share memory with an SP using FFA_MEM_SHARE,
FFA_MEM_RECLAIM and FFA_MEM_FRAG_TX. Small memory regions can be shared
using FFA_MEM_SHARE, but larger memory regions may need to be
transmitted in fragments with FFA_MEM_FRAG_TX. A memory region that
doesn't need to be shared any longer can be reclaimed with
FFA_MEM_RECLAIM once the SP doesn't use it any longer. This is checked
by the SPMC and not in control of the mediator.

With this commit we have a FF-A version 1.1 [1] mediator able to
communicate with a Secure Partition in secure world. The secure world
must use FF-A version 1.1, but the guest is free to use version 1.0 or
version 1.1.

The implementation is the bare minimum to be able to communicate with
OP-TEE running as an SPMC at S-EL1.

[1] https://developer.arm.com/documentation/den0077/latest
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/ffa.c | 838 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 838 insertions(+)

diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
index d2872acc3474..d2ad49ae6de2 100644
--- a/xen/arch/arm/ffa.c
+++ b/xen/arch/arm/ffa.c
@@ -201,6 +201,107 @@ struct ffa_partition_info_1_1 {
     uint8_t uuid[16];
 };
 
+/* Constituent memory region descriptor */
+struct ffa_address_range {
+    uint64_t address;
+    uint32_t page_count;
+    uint32_t reserved;
+};
+
+/* Composite memory region descriptor */
+struct ffa_mem_region {
+    uint32_t total_page_count;
+    uint32_t address_range_count;
+    uint64_t reserved;
+    struct ffa_address_range address_range_array[];
+};
+
+/* Memory access permissions descriptor */
+struct ffa_mem_access_perm {
+    uint16_t endpoint_id;
+    uint8_t perm;
+    uint8_t flags;
+};
+
+/* Endpoint memory access descriptor */
+struct ffa_mem_access {
+    struct ffa_mem_access_perm access_perm;
+    uint32_t region_offs;
+    uint64_t reserved;
+};
+
+/* Lend, donate or share memory transaction descriptor */
+struct ffa_mem_transaction_1_0 {
+    uint16_t sender_id;
+    uint8_t mem_reg_attr;
+    uint8_t reserved0;
+    uint32_t flags;
+    uint64_t global_handle;
+    uint64_t tag;
+    uint32_t reserved1;
+    uint32_t mem_access_count;
+    struct ffa_mem_access mem_access_array[];
+};
+
+struct ffa_mem_transaction_1_1 {
+    uint16_t sender_id;
+    uint16_t mem_reg_attr;
+    uint32_t flags;
+    uint64_t global_handle;
+    uint64_t tag;
+    uint32_t mem_access_size;
+    uint32_t mem_access_count;
+    uint32_t mem_access_offs;
+    uint8_t reserved[12];
+};
+
+/* Calculate offset of struct ffa_mem_access from start of buffer */
+#define MEM_ACCESS_OFFSET(access_idx) \
+    ( sizeof(struct ffa_mem_transaction_1_1) + \
+      ( access_idx ) * sizeof(struct ffa_mem_access) )
+
+/* Calculate offset of struct ffa_mem_region from start of buffer */
+#define REGION_OFFSET(access_count, region_idx) \
+    ( MEM_ACCESS_OFFSET(access_count) + \
+      ( region_idx ) * sizeof(struct ffa_mem_region) )
+
+/* Calculate offset of struct ffa_address_range from start of buffer */
+#define ADDR_RANGE_OFFSET(access_count, region_count, range_idx) \
+    ( REGION_OFFSET(access_count, region_count) + \
+      ( range_idx ) * sizeof(struct ffa_address_range) )
+
+/*
+ * The parts needed from struct ffa_mem_transaction_1_0 or struct
+ * ffa_mem_transaction_1_1, used to provide an abstraction of difference in
+ * data structures between version 1.0 and 1.1. This is just an internal
+ * interface and can be changed without changing any ABI.
+ */
+struct ffa_mem_transaction_x {
+    uint16_t sender_id;
+    uint8_t mem_reg_attr;
+    uint8_t flags;
+    uint8_t mem_access_size;
+    uint8_t mem_access_count;
+    uint16_t mem_access_offs;
+    uint64_t global_handle;
+    uint64_t tag;
+};
+
+/* Endpoint RX/TX descriptor */
+struct ffa_endpoint_rxtx_descriptor_1_0 {
+    uint16_t sender_id;
+    uint16_t reserved;
+    uint32_t rx_range_count;
+    uint32_t tx_range_count;
+};
+
+struct ffa_endpoint_rxtx_descriptor_1_1 {
+    uint16_t sender_id;
+    uint16_t reserved;
+    uint32_t rx_region_offs;
+    uint32_t tx_region_offs;
+};
+
 struct ffa_ctx {
     void *rx;
     const void *tx;
@@ -210,8 +311,33 @@ struct ffa_ctx {
     uint32_t guest_vers;
     bool tx_is_mine;
     bool interrupted;
+    struct list_head frag_list;
+    struct list_head shm_list;
+    unsigned int shm_count;
     spinlock_t lock;
 };
+
+struct ffa_shm_mem {
+    struct list_head list;
+    uint16_t sender_id;
+    uint16_t ep_id;     /* endpoint, the one lending */
+    uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
+    unsigned int page_count;
+    struct page_info *pages[];
+};
+
+struct mem_frag_state {
+    struct list_head list;
+    struct ffa_shm_mem *shm;
+    uint32_t range_count;
+    unsigned int current_page_idx;
+    unsigned int frag_offset;
+    unsigned int range_offset;
+    const uint8_t *buf;
+    unsigned int buf_size;
+    struct ffa_address_range range;
+};
+
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t ffa_version __read_mostly;
 
@@ -226,6 +352,8 @@ static unsigned int subscr_vm_destroyed_count __read_mostly;
  *
  * ffa_page_count is the number of pages used in each of these buffers.
  *
+ * The TX buffer is protected from concurrent usage with ffa_tx_buffer_lock.
+ *
  * The RX buffer is protected from concurrent usage with ffa_rx_buffer_lock.
  * Note that the SPMC is also tracking the ownership of our RX buffer so
  * for calls which uses our RX buffer to deliver a result we must call
@@ -235,6 +363,7 @@ static void *ffa_rx __read_mostly;
 static void *ffa_tx __read_mostly;
 static unsigned int ffa_page_count __read_mostly;
 static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
+static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
 
 static bool ffa_get_version(uint32_t *vers)
 {
@@ -345,6 +474,78 @@ static int32_t ffa_rx_release(void)
     return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
 }
 
+static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
+                             register_t addr, uint32_t pg_count,
+                             uint64_t *handle)
+{
+    struct arm_smccc_1_2_regs arg = {
+        .a0 = FFA_MEM_SHARE_32,
+        .a1 = tot_len,
+        .a2 = frag_len,
+        .a3 = addr,
+        .a4 = pg_count,
+    };
+    struct arm_smccc_1_2_regs resp;
+
+    if ( IS_ENABLED(CONFIG_ARM_64) )
+        arg.a0 = FFA_MEM_SHARE_64;
+
+    arm_smccc_1_2_smc(&arg, &resp);
+
+    switch ( resp.a0 )
+    {
+    case FFA_ERROR:
+        if ( resp.a2 )
+            return resp.a2;
+        else
+            return FFA_RET_NOT_SUPPORTED;
+    case FFA_SUCCESS_32:
+        *handle = regpair_to_uint64(resp.a3, resp.a2);
+        return FFA_RET_OK;
+    case FFA_MEM_FRAG_RX:
+        *handle = regpair_to_uint64(resp.a2, resp.a1);
+        return resp.a3;
+    default:
+        return FFA_RET_NOT_SUPPORTED;
+    }
+}
+
+static int32_t ffa_mem_frag_tx(uint64_t handle, uint32_t frag_len,
+                               uint16_t sender_id)
+{
+    struct arm_smccc_1_2_regs arg = {
+        .a0 = FFA_MEM_FRAG_TX,
+        .a1 = handle & UINT32_MAX,
+        .a2 = handle >> 32,
+        .a3 = frag_len,
+        .a4 = (uint32_t)sender_id << 16,
+    };
+    struct arm_smccc_1_2_regs resp;
+
+    arm_smccc_1_2_smc(&arg, &resp);
+
+    switch ( resp.a0 )
+    {
+    case FFA_ERROR:
+        if ( resp.a2 )
+            return resp.a2;
+        else
+            return FFA_RET_NOT_SUPPORTED;
+    case FFA_SUCCESS_32:
+        return FFA_RET_OK;
+    case FFA_MEM_FRAG_RX:
+        return resp.a3;
+    default:
+            return FFA_RET_NOT_SUPPORTED;
+    }
+}
+
+static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
+                               uint32_t flags)
+{
+    return ffa_simple_call(FFA_MEM_RECLAIM, handle_lo, handle_hi, flags, 0);
+}
+
 static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
                                       uint8_t msg)
 {
@@ -413,6 +614,14 @@ static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
     set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
 }
 
+static void set_regs_frag_rx(struct cpu_user_regs *regs, uint32_t handle_lo,
+                             uint32_t handle_hi, uint32_t frag_offset,
+                             uint16_t sender_id)
+{
+    set_regs(regs, FFA_MEM_FRAG_RX, handle_lo, handle_hi, frag_offset,
+             (uint32_t)sender_id << 16, 0, 0, 0);
+}
+
 static void handle_version(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
@@ -673,6 +882,611 @@ out:
              resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & mask);
 }
 
+/*
+ * Gets all page and assigns them to the supplied shared memory object. If
+ * this function fails then the caller is still expected to call
+ * put_shm_pages() as a cleanup.
+ */
+static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
+                         const struct ffa_address_range *range,
+                         uint32_t range_count, unsigned int start_page_idx,
+                         unsigned int *last_page_idx)
+{
+    unsigned int pg_idx = start_page_idx;
+    gfn_t gfn;
+    unsigned int n;
+    unsigned int m;
+    p2m_type_t t;
+    uint64_t addr;
+
+    for ( n = 0; n < range_count; n++ )
+    {
+        for ( m = 0; m < range[n].page_count; m++ )
+        {
+            if ( pg_idx >= shm->page_count )
+                return FFA_RET_INVALID_PARAMETERS;
+
+            addr = read_atomic(&range[n].address);
+            gfn = gaddr_to_gfn(addr + m * FFA_PAGE_SIZE);
+            shm->pages[pg_idx] = get_page_from_gfn(d, gfn_x(gfn), &t,
+						   P2M_ALLOC);
+            if ( !shm->pages[pg_idx] )
+                return FFA_RET_DENIED;
+            pg_idx++;
+            /* Only normal RAM for now */
+            if ( !p2m_is_ram(t) )
+                return FFA_RET_DENIED;
+        }
+    }
+
+    *last_page_idx = pg_idx;
+
+    return FFA_RET_OK;
+}
+
+static void put_shm_pages(struct ffa_shm_mem *shm)
+{
+    unsigned int n;
+
+    for ( n = 0; n < shm->page_count && shm->pages[n]; n++ )
+    {
+        put_page(shm->pages[n]);
+        shm->pages[n] = NULL;
+    }
+}
+
+static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
+                                             unsigned int page_count)
+{
+    struct ffa_shm_mem *shm;
+
+    if ( page_count >= FFA_MAX_SHM_PAGE_COUNT ||
+         ctx->shm_count >= FFA_MAX_SHM_COUNT )
+        return NULL;
+
+    shm = xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
+    if ( shm )
+    {
+        ctx->shm_count++;
+        shm->page_count = page_count;
+    }
+
+    return shm;
+}
+
+static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *shm)
+{
+    if ( shm ) {
+        ASSERT(ctx->shm_count > 0);
+        ctx->shm_count--;
+        put_shm_pages(shm);
+        xfree(shm);
+    }
+}
+
+static void init_range(struct ffa_address_range *addr_range,
+                       paddr_t pa)
+{
+    memset(addr_range, 0, sizeof(*addr_range));
+    addr_range->address = pa;
+    addr_range->page_count = 1;
+}
+
+/*
+ * This function uses the ffa_tx buffer to transmit the memory transaction
+ * descriptor. The function depends ffa_tx_buffer_lock to be used to guard
+ * the buffer from concurent use.
+ */
+static int share_shm(struct ffa_shm_mem *shm)
+{
+    const uint32_t max_frag_len = ffa_page_count * FFA_PAGE_SIZE;
+    struct ffa_mem_access *mem_access_array;
+    struct ffa_mem_transaction_1_1 *descr;
+    struct ffa_address_range *addr_range;
+    struct ffa_mem_region *region_descr;
+    const unsigned int region_count = 1;
+    void *buf = ffa_tx;
+    uint32_t frag_len;
+    uint32_t tot_len;
+    paddr_t last_pa;
+    unsigned int n;
+    paddr_t pa;
+    bool first;
+    int ret;
+
+    ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
+    if ( !shm->page_count )
+    {
+        ASSERT_UNREACHABLE();
+        return FFA_RET_INVALID_PARAMETERS;
+    }
+
+    descr = buf;
+    memset(descr, 0, sizeof(*descr));
+    descr->sender_id = shm->sender_id;
+    descr->global_handle = shm->handle;
+    descr->mem_reg_attr = FFA_NORMAL_MEM_REG_ATTR;
+    descr->mem_access_count = 1;
+    descr->mem_access_size = sizeof(*mem_access_array);
+    descr->mem_access_offs = MEM_ACCESS_OFFSET(0);
+
+    mem_access_array = buf + descr->mem_access_offs;
+    memset(mem_access_array, 0, sizeof(*mem_access_array));
+    mem_access_array[0].access_perm.endpoint_id = shm->ep_id;
+    mem_access_array[0].access_perm.perm = FFA_MEM_ACC_RW;
+    mem_access_array[0].region_offs = REGION_OFFSET(descr->mem_access_count, 0);
+
+    region_descr = buf + mem_access_array[0].region_offs;
+    memset(region_descr, 0, sizeof(*region_descr));
+    region_descr->total_page_count = shm->page_count;
+
+    region_descr->address_range_count = 1;
+    last_pa = page_to_maddr(shm->pages[0]);
+    for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
+    {
+        pa = page_to_maddr(shm->pages[n]);
+        if ( last_pa + FFA_PAGE_SIZE == pa )
+            continue;
+        region_descr->address_range_count++;
+    }
+
+    tot_len = ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,
+                                region_descr->address_range_count);
+
+    /*
+     * Sharing memory with secure world may have to be done with multiple
+     * calls depending on how many address ranges will be needed. If we're
+     * sharing physically contiguous memory we will only need one range but
+     * we will also need to deal with the worst case where all physical
+     * pages are non-contiguous. For the first batch of address ranges we
+     * call ffa_mem_share() and for all that follows ffa_mem_frag_tx().
+     *
+     * We use frag_len to keep track of how far into the transmit buffer we
+     * have gone.
+     */
+    addr_range = region_descr->address_range_array;
+    frag_len = ADDR_RANGE_OFFSET(descr->mem_access_count, region_count, 1);
+    last_pa = page_to_maddr(shm->pages[0]);
+    init_range(addr_range, last_pa);
+    first = true;
+    for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
+    {
+        pa = page_to_maddr(shm->pages[n]);
+        if ( last_pa + FFA_PAGE_SIZE == pa )
+        {
+            addr_range->page_count++;
+            continue;
+        }
+
+        if ( frag_len == max_frag_len )
+        {
+            if ( first )
+            {
+                ret = ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
+                first = false;
+            }
+            else
+            {
+                ret = ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
+            }
+            if ( ret <= 0 )
+                return ret;
+            frag_len = sizeof(*addr_range);
+            addr_range = buf;
+        }
+        else
+        {
+            frag_len += sizeof(*addr_range);
+            addr_range++;
+        }
+        init_range(addr_range, pa);
+    }
+
+    if ( first )
+        return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
+    else
+        return ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
+}
+
+static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size_t blen,
+                                struct ffa_mem_transaction_x *trans)
+{
+    uint16_t mem_reg_attr;
+    uint32_t flags;
+    uint32_t count;
+    uint32_t offs;
+    uint32_t size;
+
+    if ( ffa_vers >= FFA_VERSION_1_1 )
+    {
+        const struct ffa_mem_transaction_1_1 *descr;
+
+        if ( blen < sizeof(*descr) )
+            return FFA_RET_INVALID_PARAMETERS;
+
+        descr = buf;
+        trans->sender_id = descr->sender_id;
+        mem_reg_attr = descr->mem_reg_attr;
+        flags = descr->flags;
+        trans->global_handle = descr->global_handle;
+        trans->tag = descr->tag;
+
+        count = descr->mem_access_count;
+        size = descr->mem_access_size;
+        offs = descr->mem_access_offs;
+    }
+    else
+    {
+        const struct ffa_mem_transaction_1_0 *descr;
+
+        if ( blen < sizeof(*descr) )
+            return FFA_RET_INVALID_PARAMETERS;
+
+        descr = buf;
+        trans->sender_id = descr->sender_id;
+        mem_reg_attr = descr->mem_reg_attr;
+        flags = descr->flags;
+        trans->global_handle = descr->global_handle;
+        trans->tag = descr->tag;
+
+        count = descr->mem_access_count;
+        size = sizeof(struct ffa_mem_access);
+        offs = offsetof(struct ffa_mem_transaction_1_0, mem_access_array);
+    }
+    /*
+     * Make sure that "descr" which is shared with the guest isn't accessed
+     * again after this point.
+     */
+    barrier();
+
+    /*
+     * We're doing a rough check to see that no information is lost when
+     * tranfering the values into a struct ffa_mem_transaction_x below. The
+     * fields in struct ffa_mem_transaction_x are wide enough to hold any
+     * valid value so being out of range means that something is wrong.
+     */
+    if ( mem_reg_attr > UINT8_MAX || flags > UINT8_MAX || size > UINT8_MAX ||
+        count > UINT8_MAX || offs > UINT16_MAX )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    /* Check that the endpoint memory access descriptor array fits */
+    if ( size * count + offs > blen )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    trans->mem_reg_attr = mem_reg_attr;
+    trans->flags = flags;
+    trans->mem_access_size = size;
+    trans->mem_access_count = count;
+    trans->mem_access_offs = offs;
+
+    return 0;
+}
+
+static int add_mem_share_frag(struct mem_frag_state *s, unsigned int offs,
+                              unsigned int frag_len)
+{
+    struct domain *d = current->domain;
+    unsigned int o = offs;
+    unsigned int l;
+    int ret;
+
+    if ( frag_len < o )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    /* Fill up the first struct ffa_address_range */
+    l = min_t(unsigned int, frag_len - o, sizeof(s->range) - s->range_offset);
+    memcpy((uint8_t *)&s->range + s->range_offset, s->buf + o, l);
+    s->range_offset += l;
+    o += l;
+    if ( s->range_offset != sizeof(s->range) )
+        goto out;
+    s->range_offset = 0;
+
+    while ( true )
+    {
+        ret = get_shm_pages(d, s->shm, &s->range, 1, s->current_page_idx,
+                            &s->current_page_idx);
+        if ( ret )
+            return ret;
+        if ( s->range_count == 1 )
+            return 0;
+        s->range_count--;
+        if ( frag_len - o < sizeof(s->range) )
+            break;
+        memcpy(&s->range, s->buf + o, sizeof(s->range));
+        o += sizeof(s->range);
+    }
+
+    /* Collect any remaining bytes for the next struct ffa_address_range */
+    s->range_offset = frag_len - o;
+    memcpy(&s->range, s->buf + o, frag_len - o);
+out:
+    s->frag_offset += frag_len;
+
+    return s->frag_offset;
+}
+
+static void handle_mem_share(struct cpu_user_regs *regs)
+{
+    static uint64_t next_handle = FFA_HANDLE_HYP_FLAG;
+    uint32_t tot_len = get_user_reg(regs, 1);
+    uint32_t frag_len = get_user_reg(regs, 2);
+    uint64_t addr = get_user_reg(regs, 3);
+    uint32_t page_count = get_user_reg(regs, 4);
+    const struct ffa_mem_region *region_descr;
+    const struct ffa_mem_access *mem_access;
+    struct ffa_mem_transaction_x trans;
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.ffa;
+    struct ffa_shm_mem *shm = NULL;
+    unsigned int last_page_idx = 0;
+    register_t handle_hi = 0;
+    register_t handle_lo = 0;
+    int ret = FFA_RET_DENIED;
+    uint32_t range_count;
+    uint32_t region_offs;
+
+    /*
+     * We're only accepting memory transaction descriptors via the rx/tx
+     * buffer.
+     */
+    if ( addr )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out_unlock;
+    }
+
+    /* Check that fragment length doesn't exceed total length */
+    if ( frag_len > tot_len )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_unlock;
+    }
+
+    spin_lock(&ctx->lock);
+
+    if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
+        goto out_unlock;
+
+    if ( !ffa_page_count )
+    {
+        ret = FFA_RET_NO_MEMORY;
+        goto out_unlock;
+    }
+
+    ret = read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &trans);
+    if ( ret )
+        goto out_unlock;
+
+    if ( trans.mem_reg_attr != FFA_NORMAL_MEM_REG_ATTR )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out;
+    }
+
+    /* Only supports sharing it with one SP for now */
+    if ( trans.mem_access_count != 1 )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out_unlock;
+    }
+
+    if ( trans.sender_id != get_vm_id(d) )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_unlock;
+    }
+
+    /* Check that it fits in the supplied data */
+    if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
+        goto out_unlock;
+
+    mem_access = ctx->tx + trans.mem_access_offs;
+    if ( read_atomic(&mem_access->access_perm.perm) != FFA_MEM_ACC_RW )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out_unlock;
+    }
+
+    region_offs = read_atomic(&mem_access->region_offs);
+    if ( sizeof(*region_descr) + region_offs > frag_len )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out_unlock;
+    }
+
+    region_descr = ctx->tx + region_offs;
+    range_count = read_atomic(&region_descr->address_range_count);
+    page_count = read_atomic(&region_descr->total_page_count);
+
+    shm = alloc_ffa_shm_mem(ctx, page_count);
+    if ( !shm )
+    {
+        ret = FFA_RET_NO_MEMORY;
+        goto out;
+    }
+    shm->sender_id = trans.sender_id;
+    shm->ep_id = read_atomic(&mem_access->access_perm.endpoint_id);
+
+    if ( frag_len != tot_len )
+    {
+        struct mem_frag_state *s = xzalloc(struct mem_frag_state);
+
+        if ( !s )
+        {
+            ret = FFA_RET_NO_MEMORY;
+            goto out;
+        }
+        s->shm = shm;
+        s->range_count = range_count;
+        s->buf = ctx->tx;
+        s->buf_size = ffa_page_count * FFA_PAGE_SIZE;
+        ret = add_mem_share_frag(s, sizeof(*region_descr)  + region_offs,
+                                 frag_len);
+        if ( ret <= 0 )
+        {
+            xfree(s);
+            if ( ret < 0 )
+                goto out;
+        }
+        else
+        {
+            shm->handle = next_handle++;
+            uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
+            list_add_tail(&s->list, &ctx->frag_list);
+        }
+        goto out_unlock;
+    }
+
+    /*
+     * Check that the Composite memory region descriptor fits.
+     */
+    if ( sizeof(*region_descr) + region_offs +
+         range_count * sizeof(struct ffa_address_range) > frag_len )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+
+    ret = get_shm_pages(d, shm, region_descr->address_range_array, range_count,
+                        0, &last_page_idx);
+    if ( ret )
+        goto out;
+    if ( last_page_idx != shm->page_count )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+
+    /* Note that share_shm() uses our tx buffer */
+    spin_lock(&ffa_tx_buffer_lock);
+    ret = share_shm(shm);
+    spin_unlock(&ffa_tx_buffer_lock);
+    if ( ret )
+        goto out;
+
+    list_add_tail(&shm->list, &ctx->shm_list);
+
+    uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
+
+out:
+    if ( ret )
+        free_ffa_shm_mem(ctx, shm);
+out_unlock:
+    spin_unlock(&ctx->lock);
+
+    if ( ret > 0 )
+            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, trans.sender_id);
+    else if ( ret == 0)
+            set_regs_success(regs, handle_lo, handle_hi);
+    else
+            set_regs_error(regs, ret);
+}
+
+static struct mem_frag_state *find_frag_state(struct ffa_ctx *ctx,
+                                              uint64_t handle)
+{
+    struct mem_frag_state *s;
+
+    list_for_each_entry(s, &ctx->frag_list, list)
+        if ( s->shm->handle == handle )
+            return s;
+
+    return NULL;
+}
+
+static void handle_mem_frag_tx(struct cpu_user_regs *regs)
+{
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.ffa;
+    uint32_t frag_len = get_user_reg(regs, 3);
+    uint32_t handle_lo = get_user_reg(regs, 1);
+    uint32_t handle_hi = get_user_reg(regs, 2);
+    uint64_t handle = regpair_to_uint64(handle_hi, handle_lo);
+    struct mem_frag_state *s;
+    uint16_t sender_id = 0;
+    int ret;
+
+    spin_lock(&ctx->lock);
+    s = find_frag_state(ctx, handle);
+    if ( !s )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+    sender_id = s->shm->sender_id;
+
+    if ( frag_len > s->buf_size )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+
+    ret = add_mem_share_frag(s, 0, frag_len);
+    if ( ret == 0 )
+    {
+        /* Note that share_shm() uses our tx buffer */
+        spin_lock(&ffa_tx_buffer_lock);
+        ret = share_shm(s->shm);
+        spin_unlock(&ffa_tx_buffer_lock);
+        if ( ret == 0 )
+            list_add_tail(&s->shm->list, &ctx->shm_list);
+        else
+            free_ffa_shm_mem(ctx, s->shm);
+    }
+    else if ( ret < 0 )
+        free_ffa_shm_mem(ctx, s->shm);
+    list_del(&s->list);
+    xfree(s);
+out:
+    spin_unlock(&ctx->lock);
+
+    if ( ret > 0 )
+            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, sender_id);
+    else if ( ret == 0)
+            set_regs_success(regs, handle_lo, handle_hi);
+    else
+            set_regs_error(regs, ret);
+}
+
+static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
+{
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.ffa;
+    struct ffa_shm_mem *shm;
+    register_t handle_hi;
+    register_t handle_lo;
+    int ret;
+
+    spin_lock(&ctx->lock);
+    list_for_each_entry(shm, &ctx->shm_list, list)
+    {
+        if ( shm->handle == handle )
+            goto found_it;
+    }
+    shm = NULL;
+    ret = FFA_RET_INVALID_PARAMETERS;
+    goto out;
+found_it:
+
+    uint64_to_regpair(&handle_hi, &handle_lo, handle);
+    ret = ffa_mem_reclaim(handle_lo, handle_hi, flags);
+    if ( ret )
+    {
+        shm = NULL;
+        goto out;
+    }
+
+    list_del(&shm->list);
+
+out:
+    free_ffa_shm_mem(ctx, shm);
+    spin_unlock(&ctx->lock);
+
+
+    return ret;
+}
+
 bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
 {
     struct domain *d = current->domain;
@@ -733,6 +1547,24 @@ bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
 #endif
         handle_msg_send_direct_req(regs, fid);
         return true;
+    case FFA_MEM_SHARE_32:
+#ifdef CONFIG_ARM_64
+    case FFA_MEM_SHARE_64:
+#endif
+        handle_mem_share(regs);
+        return true;
+    case FFA_MEM_RECLAIM:
+        e = handle_mem_reclaim(regpair_to_uint64(get_user_reg(regs, 2),
+                                                 get_user_reg(regs, 1)),
+                               get_user_reg(regs, 3));
+        if ( e )
+            set_regs_error(regs, e);
+        else
+            set_regs_success(regs, 0, 0);
+        return true;
+    case FFA_MEM_FRAG_TX:
+        handle_mem_frag_tx(regs);
+        return true;
 
     default:
         printk(XENLOG_ERR "ffa: unhandled fid 0x%x\n", fid);
@@ -768,6 +1600,9 @@ int ffa_domain_init(struct domain *d, bool ffa_enabled)
         }
     }
 
+    INIT_LIST_HEAD(&ctx->frag_list);
+    INIT_LIST_HEAD(&ctx->shm_list);
+
     d->arch.ffa = ctx;
 
     return 0;
@@ -923,6 +1758,9 @@ static int __init ffa_init(void)
          !check_mandatory_feature(FFA_RXTX_MAP_32) ||
 #endif
          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
+         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
+         !check_mandatory_feature(FFA_MEM_FRAG_TX) ||
+         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
         return 0;
 
-- 
2.31.1


