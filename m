Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB0277845
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 20:09:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLVfr-0000sM-Dw; Thu, 24 Sep 2020 18:08:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzBE=DB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kLVfp-0000sH-O7
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 18:08:54 +0000
X-Inumbo-ID: f5775a3d-eacc-48c9-a2bb-e2a9d8c23263
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5775a3d-eacc-48c9-a2bb-e2a9d8c23263;
 Thu, 24 Sep 2020 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600970931;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=YT9wfG1zTzhMDJc3uK98Zp+SbMv1kIlZ8IYxWgh16Mg=;
 b=hpDZc7EybC7nujxrffzcH83K70evPstDP1UymbwI9kAVohSXl3qvMOPhzhoERnNHir
 BGBD/J464a+CZvA6WCQZz49mxaOzTTPRypiGK6tecflVwMbSnRY90ixCjC0P3bAME6Aw
 v9bOW3Mk0BDDukSrX4eE/AYGQxoKaRunvL5s5FRH2yytltExHrdXTNAcvKzBSMkiBft8
 Hi/Eu502PSql39DtyvGagGpJgoc+b6IzLIW4zS+YRFRBX9qs2BfiEE9QBita5JsDmGUu
 f2Vwj1gNQuIOSvexN2Xn8rBNNA9RnEpLpnkSIWETPpknVRH8oRVgY3X+LjWTj34h9Rbs
 rrow==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G5Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id 60ad29w8OI8kPzI
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 24 Sep 2020 20:08:46 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v1] libxc/bitops: increase potential size of bitmaps
Date: Thu, 24 Sep 2020 20:08:43 +0200
Message-Id: <20200924180843.30452-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

If the bitmap is used to represent domU pages, the amount of memory is
limited to 8TB due to the 32bit value. Adjust the code to use 64bit
values as input. All callers already use some form of 64bit as input,
so no further adjustment is required.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/ctrl/xc_bitops.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
index 0951e8267d..3d3a09772a 100644
--- a/tools/libs/ctrl/xc_bitops.h
+++ b/tools/libs/ctrl/xc_bitops.h
@@ -14,52 +14,52 @@
 #define BITMAP_SHIFT(_nr) ((_nr) % 8)
 
 /* calculate required space for number of bytes needed to hold nr_bits */
-static inline int bitmap_size(int nr_bits)
+static inline unsigned long bitmap_size(unsigned long nr_bits)
 {
     return (nr_bits + 7) / 8;
 }
 
-static inline void *bitmap_alloc(int nr_bits)
+static inline void *bitmap_alloc(unsigned long nr_bits)
 {
     return calloc(1, bitmap_size(nr_bits));
 }
 
-static inline void bitmap_set(void *addr, int nr_bits)
+static inline void bitmap_set(void *addr, unsigned long nr_bits)
 {
     memset(addr, 0xff, bitmap_size(nr_bits));
 }
 
-static inline void bitmap_clear(void *addr, int nr_bits)
+static inline void bitmap_clear(void *addr, unsigned long nr_bits)
 {
     memset(addr, 0, bitmap_size(nr_bits));
 }
 
-static inline int test_bit(int nr, const void *_addr)
+static inline int test_bit(unsigned long nr, const void *_addr)
 {
     const char *addr = _addr;
     return (BITMAP_ENTRY(nr, addr) >> BITMAP_SHIFT(nr)) & 1;
 }
 
-static inline void clear_bit(int nr, void *_addr)
+static inline void clear_bit(unsigned long nr, void *_addr)
 {
     char *addr = _addr;
     BITMAP_ENTRY(nr, addr) &= ~(1UL << BITMAP_SHIFT(nr));
 }
 
-static inline void set_bit(int nr, void *_addr)
+static inline void set_bit(unsigned long nr, void *_addr)
 {
     char *addr = _addr;
     BITMAP_ENTRY(nr, addr) |= (1UL << BITMAP_SHIFT(nr));
 }
 
-static inline int test_and_clear_bit(int nr, void *addr)
+static inline int test_and_clear_bit(unsigned long nr, void *addr)
 {
     int oldbit = test_bit(nr, addr);
     clear_bit(nr, addr);
     return oldbit;
 }
 
-static inline int test_and_set_bit(int nr, void *addr)
+static inline int test_and_set_bit(unsigned long nr, void *addr)
 {
     int oldbit = test_bit(nr, addr);
     set_bit(nr, addr);
@@ -67,11 +67,11 @@ static inline int test_and_set_bit(int nr, void *addr)
 }
 
 static inline void bitmap_or(void *_dst, const void *_other,
-                             int nr_bits)
+                             unsigned long nr_bits)
 {
     char *dst = _dst;
     const char *other = _other;
-    int i;
+    unsigned long i;
     for ( i = 0; i < bitmap_size(nr_bits); ++i )
         dst[i] |= other[i];
 }

