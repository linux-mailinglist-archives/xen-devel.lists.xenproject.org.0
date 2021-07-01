Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F353B9048
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148497.274543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWm-0000MN-3k; Thu, 01 Jul 2021 10:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148497.274543; Thu, 01 Jul 2021 10:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWl-0000E6-S5; Thu, 01 Jul 2021 10:02:35 +0000
Received: by outflank-mailman (input) for mailman id 148497;
 Thu, 01 Jul 2021 10:02:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytSH-0004r4-Ht
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:57 +0000
Received: from mo4-p04-ob.smtp.rzone.de (unknown [85.215.255.123])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fea3b19-9598-4b0d-8e2a-c7057ee0a005;
 Thu, 01 Jul 2021 09:57:03 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uv5Nj
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:57 +0200 (CEST)
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
X-Inumbo-ID: 0fea3b19-9598-4b0d-8e2a-c7057ee0a005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133418;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=i+CtqX1HY7Q0UrDFSipaIMys+n7R0U7HixGDrxWfeJY=;
    b=hO+V6Ivo6IqbiuUjPoOD4+qcc8FkwAB9Ci1Ygzs+u7DBYKfrbswow5XDZaZiMnqPDM
    j4EEfMoB/HMaP2JxuESRHJbw5SNvW8fDAy26jNIE73+Lx5sYncXt2/sYF1wNR9d/Urm0
    zhq4gle6Hkg946CQEFSV9rt3g7rOukJXm6yTuhRnkLoEajBapO9Qzo0yW8DI45mw8uTu
    WR5nk4+xYe6xOloLF0VlHUWVhEij2IQrcKhuUApPZ3w/czVD+Wx5J5IbbwD0RRNNn5Uh
    RTLOSFZowP0fiHcvjCDqKqihtd7EJmo5NeoPgUNim8sP+XpjZM+npzvS3J8LdYWXjEjD
    Idbw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210701 38/40] tools: add API for expandable bitmaps
Date: Thu,  1 Jul 2021 11:56:33 +0200
Message-Id: <20210701095635.15648-39-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the incoming migration stream lacks info about what the highest pfn
will be, some data structures can not be allocated upfront.

Add an API for expandable bitmaps, loosely based on pfn_set_populated.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.c | 39 +++++++++++++++++++
 tools/libs/saverestore/common.h | 67 +++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/tools/libs/saverestore/common.c b/tools/libs/saverestore/common.c
index 7da7fa4e2c..e96173eea2 100644
--- a/tools/libs/saverestore/common.c
+++ b/tools/libs/saverestore/common.c
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
diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index bb7e437291..e6a269c482 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -30,6 +30,73 @@ const char *rec_type_to_str(uint32_t type);
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

