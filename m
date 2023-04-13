Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2046E078A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520491.808214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrCG-00020i-9f; Thu, 13 Apr 2023 07:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520491.808214; Thu, 13 Apr 2023 07:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrCG-0001y3-64; Thu, 13 Apr 2023 07:16:44 +0000
Received: by outflank-mailman (input) for mailman id 520491;
 Thu, 13 Apr 2023 07:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrCE-0001wd-Ga
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:16:42 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0905fb16-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:57 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id x34so907330ljq.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:57 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:56 -0700 (PDT)
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
X-Inumbo-ID: 0905fb16-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370156; x=1683962156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZCEdSFHwslEgaIydy46nytop0ECS1ocVnr/aHKCQRk=;
        b=SeDjGg7l463KhgfWyWGSRKKBJwYa1xPY3KJchJoSqOmVer4k516NpP7GKfvOctp81R
         H+8IWvi+Jl5z9xCsyo9luagc2VZEZbTFXwgvZG0YiJSctGIT3rLgXHZRTY8GJpOGwsHA
         yJKv+V+FsiINqiHkCMUGI3rXN9jcjB0Rn4OcyIZ7Lnj0dME7Qg9UzTCIpgpg72Zq0EZw
         v3CTmvW+lZNGzxjsjy08f3HRr6Y02KIbzyrth9J5Zd8zjwY6wKOOv0AovCPC5uvLN005
         2gVBYZpcW4dtlLw8gFj79f+ZwmeI4EKlnKoZFBWwr4y42IfGY/i0U31ZVCWff6vlr54z
         V5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370156; x=1683962156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZCEdSFHwslEgaIydy46nytop0ECS1ocVnr/aHKCQRk=;
        b=eurVkONe0JzwW0Nl1xj6oWsXOyUROI4IkQ0omhRShD4BOzjncT45e3gmRCO+vkobHQ
         ms2xOFvqe38PAn8u6jpY9HsvDSvFfcKQDTOFxZjvGj2Vcvg5P0husbrpJGVqq6W6RdLT
         dKTXONpP/bn7Bl97W1EcGehTenF0uNblw7PWDXdemkQRVgPe0d414u3yJHDEslDu1RLx
         +1naRlD/s7Dj/k/rKcbzLHH8Lyb6HnY2W85RifNvxwvEIdlH5m74up1a2UvR+YS4v391
         l9ImGyBRLJYcBNCJ78JLLbBmk8PgMHvjplw9z8/v7F3fmhcIXTN96Q32zD9+VXREoP0P
         GKrA==
X-Gm-Message-State: AAQBX9eiEXDlTYTzP+rAqBpCV+k0SwScbY2Pg+wz6IVfTb+/L+aA+xVw
	MYrgMt1//TvfC6XaOqBmZ2B/TELq05FmenfAJY8=
X-Google-Smtp-Source: AKy350YK+HbgR9hM+KGDovRsTyxsnfWzKnI/0keGOj9aRz2024n97uAT+dey9VRIssh4Bkirsd3r+Q==
X-Received: by 2002:a2e:97c5:0:b0:2a7:75aa:40c with SMTP id m5-20020a2e97c5000000b002a775aa040cmr454342ljj.10.1681370156514;
        Thu, 13 Apr 2023 00:15:56 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v8 17/22] xen/arm: ffa: support sharing memory
Date: Thu, 13 Apr 2023 09:14:19 +0200
Message-Id: <20230413071424.3273490-18-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for a guest to share memory with an SP using FFA_MEM_SHARE.
Only memory regions small enough to be shared with a single call to
FFA_MEM_SHARE are supported.

With this commit we have a FF-A version 1.1 [1] mediator able to
communicate with a Secure Partition in secure world using shared memory.
The secure world must use FF-A version 1.1, but the guest is free to use
version 1.0 or version 1.1.

Adds a check that the SP supports the needed FF-A features
FFA_MEM_SHARE_64 or FFA_MEM_SHARE_32.

[1] https://developer.arm.com/documentation/den0077/latest
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 483 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 483 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index f3e05911e16e..438e0b21d1ea 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -299,6 +299,38 @@ struct ffa_mem_transaction_1_1 {
     uint8_t reserved[12];
 };
 
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
+struct ffa_mem_transaction_int {
+    uint16_t sender_id;
+    uint8_t mem_reg_attr;
+    uint8_t flags;
+    uint8_t mem_access_size;
+    uint8_t mem_access_count;
+    uint16_t mem_access_offs;
+    uint64_t handle;
+    uint64_t tag;
+};
+
 /* Endpoint RX/TX descriptor */
 struct ffa_endpoint_rxtx_descriptor_1_0 {
     uint16_t sender_id;
@@ -324,9 +356,22 @@ struct ffa_ctx {
     /* FF-A version used by the guest */
     uint32_t guest_vers;
     bool rx_is_free;
+    /* Used shared memory objects, struct ffa_shm_mem */
+    struct list_head shm_list;
+    /* Number of allocated shared memory object */
+    unsigned int shm_count;
     spinlock_t lock;
 };
 
+struct ffa_shm_mem {
+    struct list_head list;
+    uint16_t sender_id;
+    uint16_t ep_id;     /* endpoint, the one lending */
+    uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
+    unsigned int page_count;
+    struct page_info *pages[];
+};
+
 /* Negotiated FF-A version to use with the SPMC */
 static uint32_t ffa_version __ro_after_init;
 
@@ -348,6 +393,7 @@ static uint16_t subscr_vm_destroyed_count __read_mostly;
 static void *ffa_rx __read_mostly;
 static void *ffa_tx __read_mostly;
 static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
+static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
 
 static bool ffa_get_version(uint32_t *vers)
 {
@@ -454,6 +500,41 @@ static int32_t ffa_rx_release(void)
     return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
 }
 
+static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
+                             register_t addr, uint32_t pg_count,
+                             uint64_t *handle)
+{
+    struct arm_smccc_1_2_regs arg = {
+        .a0 = FFA_MEM_SHARE_64,
+        .a1 = tot_len,
+        .a2 = frag_len,
+        .a3 = addr,
+        .a4 = pg_count,
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
+        *handle = regpair_to_uint64(resp.a3, resp.a2);
+        return FFA_RET_OK;
+    case FFA_MEM_FRAG_RX:
+        *handle = regpair_to_uint64(resp.a2, resp.a1);
+        if ( resp.a3 > INT32_MAX ) /* Impossible value */
+            return FFA_RET_ABORTED;
+        return resp.a3 & INT32_MAX;
+    default:
+        return FFA_RET_NOT_SUPPORTED;
+    }
+}
+
 static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
                                       uint8_t msg)
 {
@@ -781,6 +862,400 @@ out:
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
+            /* Only normal RAM for now */
+            if ( !p2m_is_ram(t) )
+                return FFA_RET_DENIED;
+            pg_idx++;
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
+ * the buffer from concurrent use.
+ */
+static int share_shm(struct ffa_shm_mem *shm)
+{
+    const uint32_t max_frag_len = FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE;
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
+
+    ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
+    ASSERT(shm->page_count);
+
+    descr = buf;
+    memset(descr, 0, sizeof(*descr));
+    descr->sender_id = shm->sender_id;
+    descr->handle = shm->handle;
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
+    if ( tot_len > max_frag_len )
+        return FFA_RET_NOT_SUPPORTED;
+
+    addr_range = region_descr->address_range_array;
+    frag_len = ADDR_RANGE_OFFSET(descr->mem_access_count, region_count, 1);
+    last_pa = page_to_maddr(shm->pages[0]);
+    init_range(addr_range, last_pa);
+    for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
+    {
+        pa = page_to_maddr(shm->pages[n]);
+        if ( last_pa + FFA_PAGE_SIZE == pa )
+        {
+            addr_range->page_count++;
+            continue;
+        }
+
+        frag_len += sizeof(*addr_range);
+        addr_range++;
+        init_range(addr_range, pa);
+    }
+
+    return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
+}
+
+static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size_t blen,
+                                struct ffa_mem_transaction_int *trans)
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
+        trans->handle = descr->handle;
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
+        trans->handle = descr->handle;
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
+     * tranfering the values into a struct ffa_mem_transaction_int below.
+     * The fields in struct ffa_mem_transaction_int are wide enough to hold
+     * any valid value so being out of range means that something is wrong.
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
+static void handle_mem_share(struct cpu_user_regs *regs)
+{
+    uint32_t tot_len = get_user_reg(regs, 1);
+    uint32_t frag_len = get_user_reg(regs, 2);
+    uint64_t addr = get_user_reg(regs, 3);
+    uint32_t page_count = get_user_reg(regs, 4);
+    const struct ffa_mem_region *region_descr;
+    const struct ffa_mem_access *mem_access;
+    struct ffa_mem_transaction_int trans;
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
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
+        goto out_set_ret;
+    }
+
+    /* Check that fragment length doesn't exceed total length */
+    if ( frag_len > tot_len )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_set_ret;
+    }
+
+    /* We currently only support a single fragment */
+    if ( frag_len != tot_len )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out_set_ret;
+    }
+
+    spin_lock(&ctx->lock);
+
+    if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
+        goto out_unlock;
+
+    ret = read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &trans);
+    if ( ret )
+        goto out_unlock;
+
+    if ( trans.mem_reg_attr != FFA_NORMAL_MEM_REG_ATTR )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out_unlock;
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
+    if ( !page_count )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_unlock;
+    }
+
+    shm = alloc_ffa_shm_mem(ctx, page_count);
+    if ( !shm )
+    {
+        ret = FFA_RET_NO_MEMORY;
+        goto out_unlock;
+    }
+    shm->sender_id = trans.sender_id;
+    shm->ep_id = read_atomic(&mem_access->access_perm.endpoint_id);
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
+out_set_ret:
+    if ( ret == 0)
+            set_regs_success(regs, handle_lo, handle_hi);
+    else
+            set_regs_error(regs, ret);
+}
+
 static bool ffa_handle_call(struct cpu_user_regs *regs)
 {
     uint32_t fid = get_user_reg(regs, 0);
@@ -838,6 +1313,10 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_MSG_SEND_DIRECT_REQ_64:
         handle_msg_send_direct_req(regs, fid);
         return true;
+    case FFA_MEM_SHARE_32:
+    case FFA_MEM_SHARE_64:
+        handle_mem_share(regs);
+        return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -879,6 +1358,8 @@ static int ffa_domain_init(struct domain *d)
         }
     }
 
+    INIT_LIST_HEAD(&ctx->shm_list);
+
     d->arch.tee = ctx;
 
     return 0;
@@ -1050,7 +1531,9 @@ static bool ffa_probe(void)
     if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
          !check_mandatory_feature(FFA_RX_RELEASE) ||
          !check_mandatory_feature(FFA_RXTX_MAP_64) ||
+         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
+         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
         return false;
 
-- 
2.34.1


