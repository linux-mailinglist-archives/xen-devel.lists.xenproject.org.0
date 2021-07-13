Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C113C7657
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155669.287416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mxz-0003kA-Tn; Tue, 13 Jul 2021 18:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155669.287416; Tue, 13 Jul 2021 18:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mxz-0003hX-Pt; Tue, 13 Jul 2021 18:17:11 +0000
Received: by outflank-mailman (input) for mailman id 155669;
 Tue, 13 Jul 2021 18:17:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MoU-0002kr-V7
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:07:22 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bea7630-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:29 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6NtBB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:23 +0200 (CEST)
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
X-Inumbo-ID: 0bea7630-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199584;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=JrGxNpYov5voRDtMV5w4X2CbyE19s8jrygFtsIfZxys=;
    b=dqjaMd1F8I7hTN9jlHVKhrUl1RimwUM5FkZ/HrMgw2O9/o9nPFeQIRAvTK3NJB2UxS
    1iQbMgtVB66RRjrQQ/eopanr+m8VLVVBKcnuKfLOwoSvaTYBp3hlQ+cjS+NETGmKjrDX
    +DOEexmLpBJHCJSy5nd1pJiDetjG8qx5JM9bVmg8sZGICKgkCh5J0s3YGE7awkNK47jb
    mZqJ68kCoKtUzPPCrWPzAWRFfxwoA3UF3LeeqbGoILqjThjSSILUxEe2Wco34lFijEj/
    RlSNFtmhun3avVAe0NlYr5yoF8PQRNefs+rwHzSMsbnnpBRnCw8sv0n8b5RsCmBz0Hkj
    o9LQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210713 29/31] tools: add API for expandable bitmaps
Date: Tue, 13 Jul 2021 20:06:03 +0200
Message-Id: <20210713180605.12096-30-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the incoming migration stream lacks info about what the highest pfn
will be, some data structures can not be allocated upfront.

Add an API for expandable bitmaps, loosely based on pfn_set_populated.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.c | 39 +++++++++++++++++++
 tools/libs/guest/xg_sr_common.h | 67 +++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index cabde4ef74..6d495ba72d 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -163,6 +163,45 @@ static void __attribute__((unused)) build_assertions(void)
     BUILD_BUG_ON(sizeof(struct xc_sr_rec_hvm_params)        != 8);
 }
 
+/*
+ * Expand the tracking structures as needed.
+ * To avoid realloc()ing too excessively, the size increased to the nearest
+ * power of two large enough to contain the required number of bits.
+ */
+bool _sr_bitmap_expand(struct sr_bitmap *bm, unsigned long bits)
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
+    new_max |= sizeof(unsigned long) > 4 ? new_max >> 32 : 0;
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
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 8981c21acd..686a9614c2 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -18,6 +18,73 @@ const char *rec_type_to_str(uint32_t type);
 struct xc_sr_context;
 struct xc_sr_record;
 
+struct sr_bitmap
+{
+    void *p;
+    unsigned long bits;
+};
+
+extern bool _sr_bitmap_expand(struct sr_bitmap *bm, unsigned long bits);
+
+static inline bool sr_bitmap_expand(struct sr_bitmap *bm, unsigned long bits)
+{
+    if (bits > bm->bits)
+        return _sr_bitmap_expand(bm, bits);
+    return true;
+}
+
+static inline void sr_bitmap_free(struct sr_bitmap *bm)
+{
+    free(bm->p);
+    bm->p = NULL;
+}
+
+static inline bool sr_set_bit(unsigned long bit, struct sr_bitmap *bm)
+{
+    if (sr_bitmap_expand(bm, bit) == false)
+        return false;
+
+    set_bit(bit, bm->p);
+    return true;
+}
+
+static inline bool sr_test_bit(unsigned long bit, struct sr_bitmap *bm)
+{
+    if (bit > bm->bits)
+        return false;
+    return !!test_bit(bit, bm->p);
+}
+
+static inline void sr_clear_bit(unsigned long bit, struct sr_bitmap *bm)
+{
+    if (bit <= bm->bits)
+        clear_bit(bit, bm->p);
+}
+
+static inline bool sr_test_and_clear_bit(unsigned long bit, struct sr_bitmap *bm)
+{
+    if (bit > bm->bits)
+        return false;
+    return !!test_and_clear_bit(bit, bm->p);
+}
+
+/* No way to report potential allocation error, bitmap must be expanded prior usage */
+static inline bool sr_test_and_set_bit(unsigned long bit, struct sr_bitmap *bm)
+{
+    if (bit > bm->bits)
+        return false;
+    return !!test_and_set_bit(bit, bm->p);
+}
+
+static inline bool sr_set_long_bit(unsigned long base_bit, struct sr_bitmap *bm)
+{
+    if (sr_bitmap_expand(bm, base_bit + BITS_PER_LONG) == false)
+        return false;
+
+    set_bit_long(base_bit, bm->p);
+    return true;
+}
+
 /**
  * Save operations.  To be implemented for each type of guest, for use by the
  * common save algorithm.

