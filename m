Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB1B6E078D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520494.808234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrCK-0002Zt-1Q; Thu, 13 Apr 2023 07:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520494.808234; Thu, 13 Apr 2023 07:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrCJ-0002Wq-QE; Thu, 13 Apr 2023 07:16:47 +0000
Received: by outflank-mailman (input) for mailman id 520494;
 Thu, 13 Apr 2023 07:16:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrCH-0001wd-6d
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:16:45 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09e05e9c-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:58 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id d7so28946978lfj.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:58 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:57 -0700 (PDT)
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
X-Inumbo-ID: 09e05e9c-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370158; x=1683962158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++rL2jsxUxRm5qFt5hBWNof5SzDBga+okTGdWBhdlBo=;
        b=G5BbTYqiSbzMXxtdyqd2Z8QovoHQoRitdheZIo/ph2u7styw58M7tIX9aUo0jRbZFp
         zGvyFwY5WjAOQYSNp+zNKFDZslgxwH8Lrry6Ewjw2bQtihPWJ0LOzaeimXOkRzQN8XIn
         NhXJv0joRONF4I0cwS0T/K4akUweFtNe+1pdDxb4UoJvRmegZJ9YsskTQSWX8bkDcqC1
         zqlqgI6+Mg0sNyiiFX2fYEmDi92IeVwfn/xpM0wzGVRWyWDZ9KTdMu6YKN5C+RuhV/7u
         ikBjLgVB0pWQ53RJ60asijR6aOIpv2Dxw1agHIajNs5KmbXD/6UNc4qAD3KlpLlGulBc
         Enbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370158; x=1683962158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++rL2jsxUxRm5qFt5hBWNof5SzDBga+okTGdWBhdlBo=;
        b=ht8X1T3lsuaOx8UN+mUAUJSyALWq/66Ms8iuS6SeDsqJ1EaFl6KVs+jKVjVnEFEFSF
         EMFEX51HvMn7UbKmdQm7NycfXE9Y1lbRyCx5BxP0fndnyMyjpG9Obo93xu9/puCBQCHy
         ro6Zxl3BbwHLal4tkh9FURp0KjMOXs5zM+LvP2owGduDuwqUb5KRr7dfjMDWPLj1pBkV
         fdcQ3OSRk/+gYAl8P/z0GgfEkxPiTbe/Toj+URA2FSRbXmWFuxI+1R/DI1nX3D2DZLBn
         CW/CFg8n4h9QfhyBeHLcOXpHNWsOCeN045DEmZJdjJYnLqj6jgW273q4/+TD9OqjTda1
         cCew==
X-Gm-Message-State: AAQBX9dfxtTWSW7ghvwT4Xv0CEkOq8e0uQGtJdyJU+1YObIIQoFKv/4I
	1Cs5WX34ZuzxgbWP2Ws9tr3nJFGhQHB2GShU0hA=
X-Google-Smtp-Source: AKy350bJBmtxrb0v4lr9dv4qiCmPEngcbPR6AmM3VYhlPBzTM5TLdZGlcVcxTV9g4xHfF2f26ISMCg==
X-Received: by 2002:ac2:4195:0:b0:4e1:8309:1db5 with SMTP id z21-20020ac24195000000b004e183091db5mr505672lfh.2.1681370158063;
        Thu, 13 Apr 2023 00:15:58 -0700 (PDT)
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
Subject: [XEN PATCH v8 19/22] xen/arm: ffa: support sharing large memory ranges
Date: Thu, 13 Apr 2023 09:14:21 +0200
Message-Id: <20230413071424.3273490-20-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
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
index 47ff899eca32..888e3f9265c2 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -356,6 +356,8 @@ struct ffa_ctx {
     /* FF-A version used by the guest */
     uint32_t guest_vers;
     bool rx_is_free;
+    /* Currently used fragment states, struct mem_frag_state */
+    struct list_head frag_list;
     /* Used shared memory objects, struct ffa_shm_mem */
     struct list_head shm_list;
     /* Number of allocated shared memory object */
@@ -372,6 +374,18 @@ struct ffa_shm_mem {
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
 static uint32_t ffa_version __ro_after_init;
 
@@ -535,6 +549,36 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
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
@@ -609,6 +653,14 @@ static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
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
@@ -977,6 +1029,8 @@ static int share_shm(struct ffa_shm_mem *shm)
     paddr_t last_pa;
     unsigned int n;
     paddr_t pa;
+    bool first;
+    int ret;
 
     ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
     ASSERT(shm->page_count);
@@ -1012,13 +1066,23 @@ static int share_shm(struct ffa_shm_mem *shm)
 
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
@@ -1028,12 +1092,34 @@ static int share_shm(struct ffa_shm_mem *shm)
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
@@ -1110,8 +1196,53 @@ static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size_t blen,
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
@@ -1146,13 +1277,6 @@ static void handle_mem_share(struct cpu_user_regs *regs)
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
@@ -1218,6 +1342,36 @@ static void handle_mem_share(struct cpu_user_regs *regs)
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
@@ -1256,7 +1410,75 @@ out_unlock:
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
@@ -1369,6 +1591,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         else
             set_regs_success(regs, 0, 0);
         return true;
+    case FFA_MEM_FRAG_TX:
+        handle_mem_frag_tx(regs);
+        return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -1410,6 +1635,7 @@ static int ffa_domain_init(struct domain *d)
         }
     }
 
+    INIT_LIST_HEAD(&ctx->frag_list);
     INIT_LIST_HEAD(&ctx->shm_list);
 
     d->arch.tee = ctx;
@@ -1586,6 +1812,7 @@ static bool ffa_probe(void)
          !check_mandatory_feature(FFA_MEM_SHARE_64) ||
          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
+         !check_mandatory_feature(FFA_MEM_FRAG_TX) ||
          !check_mandatory_feature(FFA_MEM_RECLAIM) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
         return false;
-- 
2.34.1


