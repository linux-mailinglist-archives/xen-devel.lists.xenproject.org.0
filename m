Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBFB7695DF
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572969.897221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoa-0006S8-44; Mon, 31 Jul 2023 12:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572969.897221; Mon, 31 Jul 2023 12:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoZ-0006PJ-Qq; Mon, 31 Jul 2023 12:15:55 +0000
Received: by outflank-mailman (input) for mailman id 572969;
 Mon, 31 Jul 2023 12:15:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRoX-0003r0-IM
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:53 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe2a3de0-2f9b-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 14:15:52 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe3b86cec1so796177e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:52 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:51 -0700 (PDT)
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
X-Inumbo-ID: fe2a3de0-2f9b-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805752; x=1691410552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOD/fTW4qR3MvnkEx+WBHt8FnCjpvsBZaFI+mewckws=;
        b=r9L0kw2Uh45MiFpmt6ntDguYPitlL6+6FglkdTG0yVMv8wmGb2I5zbV5K2ZOtg+Dst
         JlWyjo8v9XyBkBBVt5j8cIxLBpZuex/SSxUAs0sIQH2NVbc7jUQm2EHa1YVPyY4ZB1Fg
         UX45A3DRVTC+c7JncuiFLeoQld8/glpX9AcMfT7DJgs3b4RJ2Xw8DuzpzCwULQ7QrI7Q
         NP2VitBXKqfIsDvZVGyeHFoZc8kOvsaKd658/20yGnHhBFQEfMmhBOYg8X7cMqcG9yaz
         v6/wJMZommqs86F1pkGtN2job5cMYdvOGKsA7fo04IMG3FRphHLnmO/HgXc6aacq4kuy
         dx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805752; x=1691410552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOD/fTW4qR3MvnkEx+WBHt8FnCjpvsBZaFI+mewckws=;
        b=axOrKJmjuKZ1nKS+uMBqXirSnUXoFrrRAXV3dei3v/77RBgoIzacrREqgLFWkm1cNw
         OoNLldZpapzfPGirBRE43FLQUr5gjabSnDH+FyEjUfJ9Ya1SP7ePmm5cYgfDreyI8FQU
         Q7O40JElSZkyVQ6bt0jVLl4L/bg/+F6DlBOgzA43NW4UCOlrP4dSJsniMCQA6PTChkJh
         clr8vTOGtr1uyPost5uS+j2p2yZRmBija7VuKco32j+UpV+yGachj8afQZRu3h8q2pv8
         8NzWmWy2osTp1G4lVQJSZ9PKElAz4b8RsFkDR3XWydEnSlZezUTnHV5nV/3Jij15B5o8
         WmXA==
X-Gm-Message-State: ABy/qLYYBGr5D+Itvu0tCo9kppLhXyYNHlk9lh9EDE4aXJR7HYXHqlXl
	CWJ3U6mfs61YzOkTw+aN8j1N/W4j2GvDO6kkQU8=
X-Google-Smtp-Source: APBJJlGBfdFlJGG6imObY22ExZ5FWXAcbu98zQ2+8T/z82liu1HGaOD6Dodya2U3hAm9S+mIOgdzUQ==
X-Received: by 2002:a05:6512:3b13:b0:4fe:c53:1824 with SMTP id f19-20020a0565123b1300b004fe0c531824mr7430714lfv.40.1690805751906;
        Mon, 31 Jul 2023 05:15:51 -0700 (PDT)
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
Subject: [XEN PATCH v11 09/14] xen/arm: ffa: support sharing memory
Date: Mon, 31 Jul 2023 14:15:31 +0200
Message-Id: <20230731121536.934239-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
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
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
v10->v11
- Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c | 486 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 486 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 9927fdf78af5..74e3ef50091e 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -297,6 +297,38 @@ struct ffa_mem_transaction_1_1 {
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
@@ -327,9 +359,22 @@ struct ffa_ctx {
      */
     uint16_t create_signal_count;
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
 static uint32_t __ro_after_init ffa_version;
 
@@ -351,6 +396,7 @@ static uint16_t subscr_vm_destroyed_count __read_mostly;
 static void *ffa_rx __read_mostly;
 static void *ffa_tx __read_mostly;
 static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
+static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
 
 static bool ffa_get_version(uint32_t *vers)
 {
@@ -457,6 +503,41 @@ static int32_t ffa_rx_release(void)
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
@@ -805,6 +886,403 @@ out:
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
+    uint64_t page_count;
+
+    for ( n = 0; n < range_count; n++ )
+    {
+        page_count = read_atomic(&range[n].page_count);
+        addr = read_atomic(&range[n].address);
+        for ( m = 0; m < page_count; m++ )
+        {
+            if ( pg_idx >= shm->page_count )
+                return FFA_RET_INVALID_PARAMETERS;
+
+            gfn = gaddr_to_gfn(addr + m * FFA_PAGE_SIZE);
+            shm->pages[pg_idx] = get_page_from_gfn(d, gfn_x(gfn), &t,
+						   P2M_ALLOC);
+            if ( !shm->pages[pg_idx] )
+                return FFA_RET_DENIED;
+            /* Only normal RW RAM for now */
+            if ( t != p2m_ram_rw )
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
+    if ( !shm )
+        return;
+
+    ASSERT(ctx->shm_count > 0);
+    ctx->shm_count--;
+    put_shm_pages(shm);
+    xfree(shm);
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
@@ -862,6 +1340,10 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_MSG_SEND_DIRECT_REQ_64:
         handle_msg_send_direct_req(regs, fid);
         return true;
+    case FFA_MEM_SHARE_32:
+    case FFA_MEM_SHARE_64:
+        handle_mem_share(regs);
+        return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -904,6 +1386,8 @@ static int ffa_domain_init(struct domain *d)
     }
     ctx->create_signal_count = subscr_vm_created_count;
 
+    INIT_LIST_HEAD(&ctx->shm_list);
+
     return 0;
 }
 
@@ -1094,7 +1578,9 @@ static bool ffa_probe(void)
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


