Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19933A9BAA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143066.263911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVH4-0000bI-Sy; Wed, 16 Jun 2021 13:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143066.263911; Wed, 16 Jun 2021 13:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVH4-0000WP-Np; Wed, 16 Jun 2021 13:08:06 +0000
Received: by outflank-mailman (input) for mailman id 143066;
 Wed, 16 Jun 2021 13:08:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV28-00075D-99
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:40 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.173])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e7ffb82-5835-4a90-9d45-0c35951b5587;
 Wed, 16 Jun 2021 12:51:55 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpntmU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:49 +0200 (CEST)
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
X-Inumbo-ID: 1e7ffb82-5835-4a90-9d45-0c35951b5587
ARC-Seal: i=1; a=rsa-sha256; t=1623847909; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=q8VD0jm7Rew2fXNFlWlOaluFjoDypQ44Ob95CamwqiR+wFbK3aoPdeWBNP7Adyjzne
    yy2SZMgDjWgqkigG4/sdsBn/oGb12CzvBW+3Qb0Qq9ufdvKNKw85v41ikb8g8rnt+o4b
    M7EwndFm5bcRBLyW1EfDdkrEG2V/u9XrbEr5HBD6XwVfHcbSg/YVxGY9LtaDuKZ6O/TA
    KEID/JqBJVq057/DMijJlIsy7b3KZkozr8FcxRKmXP3zeQrVEjeG0En//q9cHI5E5CPB
    eYk4XJBzRjoeGv7kqf9hM4o7yL1r5JH8a1T7JkB6YawWDINI3pxdH3bq8lO55OF1kEzR
    hkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847909;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=zRM6/H2oQQ+NxJB9cpmsAqIVMl48wKfvMp6dg0xJ0jg=;
    b=ViIRyMbhJ2GR4h7fsY7ePjIySyiPiqm73DE6zoKgQkE/O4VDkNLugmMiD+Vvyp5V9x
    WCwZsVjXfvjSN1hMmKBDFwhBbcvB95Lu/jf6th14rlrDL4fREJ5WiYCkAAo2I/Pd2wqM
    3cGrx86CSgW5OZFexKeCXM94BHF6G9zb5yt65YNgP0ZJmWrIk1mZdbVuErqcqSgdbxkx
    rVrSiaa3WGEk/3GRm5X9tMfiIhHVniPWoopomhrpiS7aiFhW/3Cr7E7UQHNhHqLKfjRW
    ELtrQk/gVKSKbVzv8BUh6X9U3EX1UcAXDbom7rjaPKeVuHNKwwcFF3fQm3BPMfTjesxB
    NHHw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847909;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=zRM6/H2oQQ+NxJB9cpmsAqIVMl48wKfvMp6dg0xJ0jg=;
    b=FyYXt8+mf0DOlOUBmaijcaYECM/KBmEV/qHq+vM9apZ2vEz/9dbrx5zMW4NwsK32Av
    IbZrxGT2tm0DciNpmZ76RpPlvNL4jTF6zDJUzZfQgIoWNZ3hpV4v56u55k2D9xha6Jfj
    6dHb0xTMZ3UgMbgv8YxQYDpzpNI6igcnmJu8WKFD7iVTs1ODe8rxrleursPbIpxkwXRc
    6fXS1k1oDbl5hb7Rn6aNOR/97+JyPWaSAQbxO+jWIiJcPsU5XIXjTIhTGmTbMkcu7G34
    9KivIKBrVt+sFYa48GAgS1ssJZ54TE+TluJHI2w5kvnCoHUZdnJ99l5bPARgxZZBUaar
    TLoA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210616 34/36] tools: add API for expandable bitmaps
Date: Wed, 16 Jun 2021 14:51:27 +0200
Message-Id: <20210616125129.26563-35-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the incoming migration stream lacks info about what the highest pfn
will be, data structures can not be allocated upfront.

Add an API for expandable bitmaps, loosely based on pfn_set_populated.

Signed-off-by: Olaf Hering <olaf@aepfle.de>

v02:
- remove xg_ prefix from functions
---
 tools/libs/saverestore/common.c | 40 ++++++++++++++++++++
 tools/libs/saverestore/common.h | 67 +++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/tools/libs/saverestore/common.c b/tools/libs/saverestore/common.c
index 7da7fa4e2c..8b4e402df5 100644
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
index 60bbba6aa9..43aa1a7b86 100644
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

