Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE972D45E9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 16:55:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48404.85611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn1o6-0000Sa-76; Wed, 09 Dec 2020 15:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48404.85611; Wed, 09 Dec 2020 15:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn1o6-0000Rr-36; Wed, 09 Dec 2020 15:55:10 +0000
Received: by outflank-mailman (input) for mailman id 48404;
 Wed, 09 Dec 2020 15:55:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0kem=FN=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kn1o4-0000O2-KB
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 15:55:08 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.164])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31da302d-6595-43d6-aebb-98ed20980d29;
 Wed, 09 Dec 2020 15:55:03 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.6.3 DYNA|AUTH)
 with ESMTPSA id 007720wB9Fsx0bB
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Dec 2020 16:54:59 +0100 (CET)
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
X-Inumbo-ID: 31da302d-6595-43d6-aebb-98ed20980d29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1607529303;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=ti7wpap7OKPtBty/ilhF07cZXxS6hyTWcz0abirc9Nk=;
	b=IqFVHRvEQJI8EdzsqLVU4d73cnsrkHaKATHpes1Gv8xzJG4nRbXnMc3Tsg9ovNcrXA
	Gcq+2lQHFp4cP9disWVwv3+8cc6XI3esQCp/bR+fbUAcNeA4roRNJYVglLxlHCfia2z8
	CIBPXUPnO/YhoOm/0ayf8RUP1ZOeGUPZ9yxMPRRDKgh5gR3GZBVOW3n8N5qXWV7WMI0G
	oAOs9cLvagI3VwzJGL4OI7K0DVSMoFSLyPvL2wifIUDHkpC5TLknyFHtf3EJdXHIp1Ti
	XOMV350sUKuZiuFQUcyfPHxuzVBujESqdPlcwM3YGtiZI6HOoxjw1FfABNz011hsTnKf
	Socw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3KJf+TWodQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 3/3] tools: add API to work with sevaral bits at once
Date: Wed,  9 Dec 2020 16:54:51 +0100
Message-Id: <20201209155452.28376-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201209155452.28376-1-olaf@aepfle.de>
References: <20201209155452.28376-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce new API to test if a fixed number of bits is clear or set,
and clear or set them all at once.

The caller has to make sure the input bitnumber is a multiply of BITS_PER_LONG.

This API avoids the loop over each bit in a known range just to see
if all of them are either clear or set.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/ctrl/xc_bitops.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
index f0bac4a071..92f38872fb 100644
--- a/tools/libs/ctrl/xc_bitops.h
+++ b/tools/libs/ctrl/xc_bitops.h
@@ -77,4 +77,29 @@ static inline void bitmap_or(void *_dst, const void *_other,
         dst[i] |= other[i];
 }
 
+static inline int test_bit_long_set(unsigned long nr_base, const void *_addr)
+{
+    const unsigned long *addr = _addr;
+    unsigned long val = addr[nr_base / BITS_PER_LONG];
+    return val == ~0;
+}
+
+static inline int test_bit_long_clear(unsigned long nr_base, const void *_addr)
+{
+    const unsigned long *addr = _addr;
+    unsigned long val = addr[nr_base / BITS_PER_LONG];
+    return val == 0;
+}
+
+static inline void clear_bit_long(unsigned long nr_base, void *_addr)
+{
+    unsigned long *addr = _addr;
+    addr[nr_base / BITS_PER_LONG] = 0;
+}
+
+static inline void set_bit_long(unsigned long nr_base, void *_addr)
+{
+    unsigned long *addr = _addr;
+    addr[nr_base / BITS_PER_LONG] = ~0;
+}
 #endif  /* XC_BITOPS_H */

