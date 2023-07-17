Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A71755CAC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564195.881623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIYH-0002zY-QM; Mon, 17 Jul 2023 07:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564195.881623; Mon, 17 Jul 2023 07:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIYH-0002lU-Cp; Mon, 17 Jul 2023 07:21:49 +0000
Received: by outflank-mailman (input) for mailman id 564195;
 Mon, 17 Jul 2023 07:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIYC-0005A3-3w
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:44 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94b723ef-2472-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:21:43 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb96e2b573so6547829e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:43 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:42 -0700 (PDT)
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
X-Inumbo-ID: 94b723ef-2472-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578503; x=1692170503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYbk+SQ1clAFmK5go+uqkAk7DJv+x5ZhyiBn1d+JtnA=;
        b=DmUDqOeFH5C44ZGDkFM3PkqofkSwHRJMvfsbxsupdpaHZW4yS3fDZ9v5H3gjFPCPCg
         9XI9ke7tCI9TcpjRNoJQi0nd/yfnHUCJ5Ac1kYRxolN+XE4xGhmmXcWUwKuyqVvTpduk
         h6lMFMYfP6oadjzRPmozbt/hCZB45Pow6gU4817UMcGDgAe794TT9KHMby91mED1jziD
         uzhdlHI/92rX7EVSGfe2iVx9k5/FUWmN6y26G7pUlBcSBeCfWYl9MpDALbBmUB6rUseD
         mB7L6QzpblVd4xFAbnqHOk8mV6VzHOSMfuYg+DP2cJhW0qdb1jUBvKRLHEe65pp+xvEm
         DyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578503; x=1692170503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYbk+SQ1clAFmK5go+uqkAk7DJv+x5ZhyiBn1d+JtnA=;
        b=Orc4PZ5OpZPbaEJUpvv7WrO8jQpZnmMQMCrEHWPnv2+kyUzzVkNIl5ATdVxOe9fzWQ
         5JNAlcJc8BPmr1bblFGAQrYjYpj5dfFtqvIcO/xaxXSd0ynrdQlHqR0sBTCJEyi2o/2J
         uazC5RtYPlMk1/7brQs5zi1qD38JJAJ61t1Pjarz0YsZfHnwGUb7OszgKjn17xEp4Kh+
         z1nqH+lZRiSvuvKeKfAqbcO23aH6mTEpFH8susrLa4cc/sn586X5mw8M74Yu9qR+6L//
         W2Xnyt0Ul+RsQ9pcQjOhAvywI22vDKkHfzKnfteXXSiZkAbMpyYl83iTHADmaCeq/7DP
         GJuQ==
X-Gm-Message-State: ABy/qLZep5nEF5oDQoLBFzA9m2cNdkM8YHgvdBRmHgKFwQJGvo+b4wVe
	rdNfSFwfj7t6WmjAw3rrvn0X8oWvdzgAGDDrrk4=
X-Google-Smtp-Source: APBJJlH1Ix6SPwWzCCwGRDwoDjYpw+Ehp1M/LkGTvIH5IapCCslJt7Avaps0XmBVGJzgrPTjRkp3Mg==
X-Received: by 2002:ac2:4e81:0:b0:4fb:89bb:bcc4 with SMTP id o1-20020ac24e81000000b004fb89bbbcc4mr6419533lfr.51.1689578502776;
        Mon, 17 Jul 2023 00:21:42 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v10 20/24] xen/arm: ffa: support sharing large memory ranges
Date: Mon, 17 Jul 2023 09:21:03 +0200
Message-Id: <20230717072107.753304-21-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for sharing large memory ranges transmitted in fragments
using FFA_MEM_FRAG_TX.

The implementation is the bare minimum to be able to communicate with
OP-TEE running as an SPMC at S-EL1.

Adds a check that the SP supports the needed FF-A feature
FFA_MEM_FRAG_TX.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 253 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 240 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index c623c51168b9..ac23b9edc74c 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -359,6 +359,8 @@ struct ffa_ctx {
      */
     uint16_t create_signal_count;
     bool rx_is_free;
+    /* Currently used fragment states, struct mem_frag_state */
+    struct list_head frag_list;
     /* Used shared memory objects, struct ffa_shm_mem */
     struct list_head shm_list;
     /* Number of allocated shared memory object */
@@ -375,6 +377,18 @@ struct ffa_shm_mem {
     struct page_info *pages[];
 };
 
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
 static uint32_t __ro_after_init ffa_version;
 
@@ -538,6 +552,36 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
     }
 }
 
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
 static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
                                uint32_t flags)
 {
@@ -627,6 +671,14 @@ static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
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
@@ -999,6 +1051,8 @@ static int share_shm(struct ffa_shm_mem *shm)
     paddr_t last_pa;
     unsigned int n;
     paddr_t pa;
+    bool first;
+    int ret;
 
     ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
     ASSERT(shm->page_count);
@@ -1034,13 +1088,23 @@ static int share_shm(struct ffa_shm_mem *shm)
 
     tot_len = ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,
                                 region_descr->address_range_count);
-    if ( tot_len > max_frag_len )
-        return FFA_RET_NOT_SUPPORTED;
 
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
     addr_range = region_descr->address_range_array;
     frag_len = ADDR_RANGE_OFFSET(descr->mem_access_count, region_count, 1);
     last_pa = page_to_maddr(shm->pages[0]);
     init_range(addr_range, last_pa);
+    first = true;
     for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
     {
         pa = page_to_maddr(shm->pages[n]);
@@ -1050,12 +1114,34 @@ static int share_shm(struct ffa_shm_mem *shm)
             continue;
         }
 
-        frag_len += sizeof(*addr_range);
-        addr_range++;
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
         init_range(addr_range, pa);
     }
 
-    return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
+    if ( first )
+        return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
+    else
+        return ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
 }
 
 static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size_t blen,
@@ -1132,8 +1218,53 @@ static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size_t blen,
     return 0;
 }
 
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
 static void handle_mem_share(struct cpu_user_regs *regs)
 {
+    static uint64_t next_handle = FFA_HANDLE_HYP_FLAG;
     uint32_t tot_len = get_user_reg(regs, 1);
     uint32_t frag_len = get_user_reg(regs, 2);
     uint64_t addr = get_user_reg(regs, 3);
@@ -1168,13 +1299,6 @@ static void handle_mem_share(struct cpu_user_regs *regs)
         goto out_set_ret;
     }
 
-    /* We currently only support a single fragment */
-    if ( frag_len != tot_len )
-    {
-        ret = FFA_RET_NOT_SUPPORTED;
-        goto out_set_ret;
-    }
-
     spin_lock(&ctx->lock);
 
     if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
@@ -1240,6 +1364,36 @@ static void handle_mem_share(struct cpu_user_regs *regs)
     shm->sender_id = trans.sender_id;
     shm->ep_id = read_atomic(&mem_access->access_perm.endpoint_id);
 
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
+        s->buf_size = FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE;
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
     /*
      * Check that the Composite memory region descriptor fits.
      */
@@ -1278,7 +1432,75 @@ out_unlock:
     spin_unlock(&ctx->lock);
 
 out_set_ret:
-    if ( ret == 0)
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
+    struct ffa_ctx *ctx = d->arch.tee;
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
+        goto out_free_s;
+    }
+
+    ret = add_mem_share_frag(s, 0, frag_len);
+    if ( ret < 0 )
+        goto out_free_s;
+
+    /* Note that share_shm() uses our tx buffer */
+    spin_lock(&ffa_tx_buffer_lock);
+    ret = share_shm(s->shm);
+    spin_unlock(&ffa_tx_buffer_lock);
+    if ( ret < 0 )
+        goto out_free_s;
+    list_add_tail(&s->shm->list, &ctx->shm_list);
+out_free_s:
+    if ( ret < 0 )
+        free_ffa_shm_mem(ctx, s->shm);
+    list_del(&s->list);
+    xfree(s);
+out:
+    spin_unlock(&ctx->lock);
+
+    if ( ret > 0 )
+            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, sender_id);
+    else if ( ret == 0)
             set_regs_success(regs, handle_lo, handle_hi);
     else
             set_regs_error(regs, ret);
@@ -1391,6 +1613,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         else
             set_regs_success(regs, 0, 0);
         return true;
+    case FFA_MEM_FRAG_TX:
+        handle_mem_frag_tx(regs);
+        return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -1432,6 +1657,7 @@ static int ffa_domain_init(struct domain *d)
     }
     ctx->create_signal_count = n;
 
+    INIT_LIST_HEAD(&ctx->frag_list);
     INIT_LIST_HEAD(&ctx->shm_list);
 
     return 0;
@@ -1625,6 +1851,7 @@ static bool ffa_probe(void)
          !check_mandatory_feature(FFA_MEM_SHARE_64) ||
          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
+         !check_mandatory_feature(FFA_MEM_FRAG_TX) ||
          !check_mandatory_feature(FFA_MEM_RECLAIM) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
         return false;
-- 
2.34.1


