Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E166869F839
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:39:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499640.770920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUrD2-000481-V7; Wed, 22 Feb 2023 15:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499640.770920; Wed, 22 Feb 2023 15:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUrD2-00045O-QO; Wed, 22 Feb 2023 15:39:08 +0000
Received: by outflank-mailman (input) for mailman id 499640;
 Wed, 22 Feb 2023 15:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr8H-0001MH-G9
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:13 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a36b5af-b2c6-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 16:34:10 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id i9so10367712lfc.6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:11 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:10 -0800 (PST)
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
X-Inumbo-ID: 5a36b5af-b2c6-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EBnqstd93+kMQVfeEulFqyhSQhNIu3e1sgUFJ4bxhc=;
        b=uOGa2/AjT1YEsddJLsepEfyIkRMybDZu5DbW5UIHDySSh4Ux2xCVd2QVsS45rgb43i
         kEQAu66NdQ/NaZOiVA0Y8Bn/inG1lws/N5EXhh2Dm5tt6Udcmj+lX2GMbBV8JRiQnh3j
         a2x+n5KsZZWXmiiLM9p2+z+ru18dE6WU5c+uZUhVUfk96YSPrWdPBvELsYgUFBMBMBfj
         RwWJ7uCUsYP72TsaH2SoT5EefN/SJhCd1IzzFOXWVayGUUr1hz8igMVppLJQ1HUaHzCW
         SB4w6xNg4aJ/l8VVjCxXA5d4D6ALfgxPeLL9V9r0wuK8007KHRibwZdGzcoMxQkzLWJ2
         38zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EBnqstd93+kMQVfeEulFqyhSQhNIu3e1sgUFJ4bxhc=;
        b=gdQb3vZR+v8Kkz9l882fjDhabGHVOGukRRpUS8By95OB8S/hg/kkIfoOqsfn5eBHx+
         l698Ownkx25+ZjZ1FN4CNi6KQZ1gJQ/vtIFLlefSdXF9h25mRslvx/FlXCJN/+kUxG5i
         nB2dg0QyVeYMcuSVl7Ngmlh5MbnvMgXMML5uxrFCWoVci4dW30exsVNHnxXYfeyaJSXC
         OmMu8bn8D3MCNc4tU8F0DG0aHQbb0Q0lxHzXDZ6bUmrs21+hgyznosG1xATnLYabxWUY
         fxZ8bkjtwEgsdbPww1GroieIRZROYfsRxMIoxJDTCFyn0wqSntQQVCQyfqXOpL7gIpl6
         lwiA==
X-Gm-Message-State: AO0yUKVspX0PMuuFkDlCHkpo+5puoR5gOdWXV8p08O7kLhnpgye3lHCg
	VPJcwlnGZ8foG3ji2E0fPdKpNlzCq6DthyiLO3E=
X-Google-Smtp-Source: AK7set/siyuKsdBS5hCv12Um9J1mP06l9QLSNfMmqFSvZxRjhoRsprVfaZLYg2Ob61HD0WF3EQs0kA==
X-Received: by 2002:ac2:4a88:0:b0:4d8:65c5:8684 with SMTP id l8-20020ac24a88000000b004d865c58684mr3719214lfp.58.1677080050928;
        Wed, 22 Feb 2023 07:34:10 -0800 (PST)
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
Subject: [XEN PATCH v7 20/20] xen/arm: ffa: support sharing large memory ranges
Date: Wed, 22 Feb 2023 16:33:17 +0100
Message-Id: <5a48b7c7a56b83138932850eb7f94f90604168e4.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
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
 xen/arch/arm/tee/ffa.c | 254 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 240 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 3557edc455d0..72c0249d8cad 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -326,6 +326,7 @@ struct ffa_ctx {
     uint32_t guest_vers;
     bool tx_is_mine;
     bool interrupted;
+    struct list_head frag_list;
     struct list_head shm_list;
     unsigned int shm_count;
     spinlock_t lock;
@@ -340,6 +341,18 @@ struct ffa_shm_mem {
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
 
@@ -512,6 +525,36 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
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
@@ -586,6 +629,14 @@ static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
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
@@ -955,6 +1006,8 @@ static int share_shm(struct ffa_shm_mem *shm)
     paddr_t last_pa;
     unsigned int n;
     paddr_t pa;
+    bool first;
+    int ret;
 
     ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
     if ( !shm->page_count )
@@ -994,13 +1047,23 @@ static int share_shm(struct ffa_shm_mem *shm)
 
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
@@ -1010,12 +1073,34 @@ static int share_shm(struct ffa_shm_mem *shm)
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
@@ -1092,8 +1177,53 @@ static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size_t blen,
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
@@ -1128,13 +1258,6 @@ static void handle_mem_share(struct cpu_user_regs *regs)
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
@@ -1195,11 +1318,41 @@ static void handle_mem_share(struct cpu_user_regs *regs)
     if ( !shm )
     {
         ret = FFA_RET_NO_MEMORY;
-        goto out_unlock;
+        goto out;
     }
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
     /*
      * Check that the Composite memory region descriptor fits.
      */
@@ -1238,7 +1391,75 @@ out_unlock:
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
             set_regs_success(regs, handle_lo, handle_hi);
     else
             set_regs_error(regs, ret);
@@ -1357,6 +1578,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         else
             set_regs_success(regs, 0, 0);
         return true;
+    case FFA_MEM_FRAG_TX:
+        handle_mem_frag_tx(regs);
+        return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -1396,6 +1620,7 @@ static int ffa_domain_init(struct domain *d)
         }
     }
 
+    INIT_LIST_HEAD(&ctx->frag_list);
     INIT_LIST_HEAD(&ctx->shm_list);
 
     d->arch.tee = ctx;
@@ -1560,6 +1785,7 @@ static bool ffa_probe(void)
 #endif
          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
+         !check_mandatory_feature(FFA_MEM_FRAG_TX) ||
          !check_mandatory_feature(FFA_MEM_RECLAIM) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
         return false;
-- 
2.34.1


