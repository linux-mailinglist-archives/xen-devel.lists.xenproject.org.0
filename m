Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAD23B9016
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148338.274157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytR9-0004aX-OM; Thu, 01 Jul 2021 09:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148338.274157; Thu, 01 Jul 2021 09:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytR9-0004YQ-Kf; Thu, 01 Jul 2021 09:56:47 +0000
Received: by outflank-mailman (input) for mailman id 148338;
 Thu, 01 Jul 2021 09:56:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytR7-0004XT-T6
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:56:45 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94438a9c-bd82-4226-aad3-be2c35a408c7;
 Thu, 01 Jul 2021 09:56:45 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619ue5Md
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:40 +0200 (CEST)
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
X-Inumbo-ID: 94438a9c-bd82-4226-aad3-be2c35a408c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133400;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=DqV9Bza4xh4lmngXwj1J3LSRM3kpJQsPapKBO4Z/YvI=;
    b=qRRlDNFKwfDufQp5NUYrSrgtwMMfk6ATaFHjiH2amRD/NqCWF8dxxGWit6C8hcwGvg
    PY3/9ws3knYQO0b3lWTEK/A+csdqAk7ICvmTYNqADEesAA13Ryhnwo+BmJNb5LIzXrPz
    EKYRdzSJjdYT8BsvqMfD9JPD3+lLP589pKAvCUuKDpgmSUV/JW2P64aAeLvixE6CYdYi
    U7sPBkFcM9v9OjhSZXzDnc7W70rQIhHTfBrmSVJtviidhqsSSP6FQOLraTibzvWbejf1
    Lib5d04DrwkNqIB50v5EgtPSt8d69WXfc30eQ2ehB57NnrZlLuZxPxnveDllsQDjy2sY
    NMbg==
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
Subject: [PATCH v20210701 02/40] tools: add API to work with sevaral bits at once
Date: Thu,  1 Jul 2021 11:55:57 +0200
Message-Id: <20210701095635.15648-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce new API to test if a fixed number of bits is clear or set,
and clear or set them all at once.

The caller has to make sure the input bitnumber is a multiple of BITS_PER_LONG.

This API avoids the loop over each bit in a known range just to see
if all of them are either clear or set.

Signed-off-by: Olaf Hering <olaf@aepfle.de>

v02:
- change return type from int to bool (jgross)
---
 tools/libs/ctrl/xc_bitops.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
index f0bac4a071..8e8c6efb45 100644
--- a/tools/libs/ctrl/xc_bitops.h
+++ b/tools/libs/ctrl/xc_bitops.h
@@ -3,6 +3,7 @@
 
 /* bitmap operations for single threaded access */
 
+#include <stdbool.h>
 #include <stdlib.h>
 #include <string.h>
 
@@ -77,4 +78,31 @@ static inline void bitmap_or(void *_dst, const void *_other,
         dst[i] |= other[i];
 }
 
+static inline bool test_bit_long_set(unsigned long nr_base, const void *_addr)
+{
+    const unsigned long *addr = _addr;
+    unsigned long val = addr[nr_base / BITS_PER_LONG];
+
+    return val == ~0;
+}
+
+static inline bool test_bit_long_clear(unsigned long nr_base, const void *_addr)
+{
+    const unsigned long *addr = _addr;
+    unsigned long val = addr[nr_base / BITS_PER_LONG];
+
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

