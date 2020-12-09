Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC42D45EA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 16:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48402.85586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn1o1-0000OZ-MU; Wed, 09 Dec 2020 15:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48402.85586; Wed, 09 Dec 2020 15:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn1o1-0000OC-J6; Wed, 09 Dec 2020 15:55:05 +0000
Received: by outflank-mailman (input) for mailman id 48402;
 Wed, 09 Dec 2020 15:55:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0kem=FN=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kn1nz-0000O2-TZ
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 15:55:04 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.160])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 193b3f80-78c8-41b1-9d02-4ede601b9ffe;
 Wed, 09 Dec 2020 15:55:01 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.6.3 DYNA|AUTH)
 with ESMTPSA id 007720wB9Fst0b8
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Dec 2020 16:54:55 +0100 (CET)
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
X-Inumbo-ID: 193b3f80-78c8-41b1-9d02-4ede601b9ffe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1607529300;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
	bh=OFKa3btZzlVY9IFyVAhE+lCMTDnS9LRZ3EMEfMGxlXM=;
	b=Gvx2UPoo8egL6unaM2cLF+QU4V2KXJD43rGE9TtcF5aPEiIYMcV7CKBpK1Q6VkLk3c
	LOUlELThVMO30qszvH91zMApd6zN6ONeyqQT4rUeaAdAKDExaBIlZv9VqfoxcWV65H44
	FbNSCNVcRVlgDZTty2uYXWzknyJDDSy690NI7E5gNFkA4rcBxiJzvO+B67CnLLWvYePs
	KRLWidGi4Wav9ykskYz1hbqRhQihKiJCvL1ocRSFtLFRoy0/jryfYtzqbmDG6iyqHXOR
	jS2QEcxJUn/QDwgozz0P72m5TmgupcMhbJfq8uZddKqPjvc/W/28wDJs4KEsRiDh+fgf
	62Dw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3KJf+TWodQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 1/3] tools: allocate bitmaps in units of unsigned long
Date: Wed,  9 Dec 2020 16:54:49 +0100
Message-Id: <20201209155452.28376-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate enough memory so that the returned pointer can be safely
accessed as an array of unsigned long.

The actual bitmap size in units of bytes, as returned by bitmap_size,
remains unchanged.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/ctrl/xc_bitops.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
index 3d3a09772a..d6c5ea5138 100644
--- a/tools/libs/ctrl/xc_bitops.h
+++ b/tools/libs/ctrl/xc_bitops.h
@@ -21,7 +21,10 @@ static inline unsigned long bitmap_size(unsigned long nr_bits)
 
 static inline void *bitmap_alloc(unsigned long nr_bits)
 {
-    return calloc(1, bitmap_size(nr_bits));
+    unsigned long longs;
+
+    longs = (nr_bits + BITS_PER_LONG - 1) / BITS_PER_LONG;
+    return calloc(longs, sizeof(unsigned long));
 }
 
 static inline void bitmap_set(void *addr, unsigned long nr_bits)

