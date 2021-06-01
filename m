Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A1C3977FA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135225.251385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo7D0-0004Lm-LT; Tue, 01 Jun 2021 16:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135225.251385; Tue, 01 Jun 2021 16:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo7D0-0004K7-Hv; Tue, 01 Jun 2021 16:25:38 +0000
Received: by outflank-mailman (input) for mailman id 135225;
 Tue, 01 Jun 2021 16:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo70z-0005Ec-3p
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:13:13 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.103])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8196cfa2-eb0f-448e-8912-37d6a2321964;
 Tue, 01 Jun 2021 16:11:45 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBe1Be
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:40 +0200 (CEST)
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
X-Inumbo-ID: 8196cfa2-eb0f-448e-8912-37d6a2321964
ARC-Seal: i=1; a=rsa-sha256; t=1622563900; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=K0Zx3LsjNuvmX6bb/7E8krJY0h3wiRmnd1Iea4Mn7/bvNh47ZNrEJFxkHe2izUzrXe
    +rwp5gHhr76tMqvWqJqJd0y99aZgsM1/xnRbTcSuzWUJ5v7wOW6hkW1DPvyBbnRHohOj
    Gytiyp7Ext008MkAWiOs9qNNV1ggeTwyfZfJ4AIIUU2Ui53tNvRSbSXvck/jX6UxB821
    DFrU/IziJg6ICyDO8Mzq8XYVk654MmPq0I4es24ug7WoGeG4MHRfCSQLesL9fvbOR064
    UyNcAiZhCOwxrVL8iNU5DyrRU6I0eIOBZq2uhCsR7jbJdT+SB1uzngSKYIrNM3zTjI4z
    kjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563900;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=aRD7fh9RvdtKI1U0FLi3WzkFwBE/k6ib8HdQNOs79bo=;
    b=CIv1T1c91pfhV264VbVU4AxCLfH/LvZWqdJQcBFiJCZHW5urMgZuWY1CLjYTyF1NQl
    O91kPoTN2t3D7GXTRt7aHLpCJ8odBdAuxINJfPGHJ/VlrinYWy6ySdGY9XhN2K0mZGBM
    dRlYR5Ag5RF1sBEVOSPEfvoXfU9EvRTIO84ARVie5QFWDVZpMhNBJMLsuob7IDFnvMMQ
    /zaM8SuQ9GjIPS8Cnl1ID47+N4tm3vG+ry3dy9lcW0rDGPkYUzqnGJRx7A1y5fOzlH3j
    rz56GRF2gcTq2u16zS2IftFX2rjYBhmXbxJpJ5atRMNchqD9OHGOPxoR2FByjaQlBkNY
    zRyQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563900;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=aRD7fh9RvdtKI1U0FLi3WzkFwBE/k6ib8HdQNOs79bo=;
    b=byQaCNEsLu+pjNRt4QtSeXJBkLjIgjSdqTqKhGGXeKKSvKGK2NJNo3fxUdWoBxNzqJ
    1TnNPfO6aE3yRpak2777FoyZJtiRArnz4o65jk+MyqoONsgTAkbQ97sPeKLXxXu1EugD
    J2Kj//lp0+bIG5No1GIxZrjLRTCOCsGrhE6nx+FqzykSJIESfmxnk5g3t6kp9cDmHfsJ
    KMuMdSvjOnX98h5HyvvPrbQArAkL65xJnGByHLNtXBY3PmYYgAJMWRfsgtsrlrGVxGzy
    1O606WYYHKHlYmtbViFvg+FQOVPJwVnRX5kkEEyG+UfqS4YZWlqAHmObCo66gobFXATs
    umsw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 34/38] tools: add API for expandable bitmaps
Date: Tue,  1 Jun 2021 18:11:14 +0200
Message-Id: <20210601161118.18986-35-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the incoming migration stream lacks info about what the highest pfn
will be, data structures can not be allocated upfront.

Add an API for expandable bitmaps, loosely based on pfn_set_populated.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.c | 40 ++++++++++++++++++++
 tools/libs/saverestore/common.h | 67 +++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/tools/libs/saverestore/common.c b/tools/libs/saverestore/common.c
index 7da7fa4e2c..9f1af4e671 100644
--- a/tools/libs/saverestore/common.c
+++ b/tools/libs/saverestore/common.c
@@ -163,6 +163,46 @@ static void __attribute__((unused)) build_assertions(void)
     BUILD_BUG_ON(sizeof(struct xc_sr_rec_hvm_params)        != 8);
 }
 
+/*
+ * Expand the tracking structures as needed.
+ * To avoid realloc()ing too excessively, the size increased to the nearest
+ * power of two large enough to contain the required number of bits.
+ */
+bool _xg_sr_bitmap_expand(struct xg_sr_bitmap *bm, unsigned long bits)
+{
+    size_t new_max;
+    size_t old_sz, new_sz;
+    void *p;
+
+    if (bits <= bm->bits)
+        return true;
+
+    /* Round up to the nearest power of two larger than bit, less 1. */
+    new_max = bits;
+    new_max |= new_max >> 1;
+    new_max |= new_max >> 2;
+    new_max |= new_max >> 4;
+    new_max |= new_max >> 8;
+    new_max |= new_max >> 16;
+    if ( sizeof(unsigned long) > 4 )
+        new_max |= new_max >> 32;
+
+    /* Allocate units of unsigned long */
+    new_max = (new_max + BITS_PER_LONG - 1) & ~(BITS_PER_LONG - 1);
+
+    old_sz = bitmap_size(bm->bits);
+    new_sz = bitmap_size(new_max);
+    p = realloc(bm->p, new_sz);
+    if (!p)
+        return false;
+
+    memset(p + old_sz, 0, new_sz - old_sz);
+    bm->p = p;
+    bm->bits = new_max;
+
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index cf8d6545e2..5241e50f5e 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -30,6 +30,73 @@ const char *rec_type_to_str(uint32_t type);
 struct xc_sr_context;
 struct xc_sr_record;
 
+struct xg_sr_bitmap
+{
+    void *p;
+    unsigned long bits;
+};
+
+extern bool _xg_sr_bitmap_expand(struct xg_sr_bitmap *bm, unsigned long bits);
+
+static inline bool xg_sr_bitmap_expand(struct xg_sr_bitmap *bm, unsigned long bits)
+{
+    if (bits > bm->bits)
+        return _xg_sr_bitmap_expand(bm, bits);
+    return true;
+}
+
+static inline void xg_sr_bitmap_free(struct xg_sr_bitmap *bm)
+{
+    free(bm->p);
+    bm->p = NULL;
+}
+
+static inline bool xg_sr_set_bit(unsigned long bit, struct xg_sr_bitmap *bm)
+{
+    if (xg_sr_bitmap_expand(bm, bit) == false)
+        return false;
+
+    set_bit(bit, bm->p);
+    return true;
+}
+
+static inline bool xg_sr_test_bit(unsigned long bit, struct xg_sr_bitmap *bm)
+{
+    if (bit > bm->bits)
+        return false;
+    return !!test_bit(bit, bm->p);
+}
+
+static inline void xg_sr_clear_bit(unsigned long bit, struct xg_sr_bitmap *bm)
+{
+    if (bit <= bm->bits)
+        clear_bit(bit, bm->p);
+}
+
+static inline bool xg_sr_test_and_clear_bit(unsigned long bit, struct xg_sr_bitmap *bm)
+{
+    if (bit > bm->bits)
+        return false;
+    return !!test_and_clear_bit(bit, bm->p);
+}
+
+/* No way to report potential allocation error, bitmap must be expanded prior usage */
+static inline bool xg_sr_test_and_set_bit(unsigned long bit, struct xg_sr_bitmap *bm)
+{
+    if (bit > bm->bits)
+        return false;
+    return !!test_and_set_bit(bit, bm->p);
+}
+
+static inline bool xg_sr_set_long_bit(unsigned long base_bit, struct xg_sr_bitmap *bm)
+{
+    if (xg_sr_bitmap_expand(bm, base_bit + BITS_PER_LONG) == false)
+        return false;
+
+    set_bit_long(base_bit, bm->p);
+    return true;
+}
+
 /**
  * Save operations.  To be implemented for each type of guest, for use by the
  * common save algorithm.

