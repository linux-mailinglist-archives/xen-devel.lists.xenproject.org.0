Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB563A9B0D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142934.263591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1C-00079z-1C; Wed, 16 Jun 2021 12:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142934.263591; Wed, 16 Jun 2021 12:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1B-00076F-Po; Wed, 16 Jun 2021 12:51:41 +0000
Received: by outflank-mailman (input) for mailman id 142934;
 Wed, 16 Jun 2021 12:51:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1A-00075D-8n
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:51:40 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.164])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e989e65-495b-4d05-8988-fae5248b83ef;
 Wed, 16 Jun 2021 12:51:39 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpXtlp
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:33 +0200 (CEST)
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
X-Inumbo-ID: 1e989e65-495b-4d05-8988-fae5248b83ef
ARC-Seal: i=1; a=rsa-sha256; t=1623847894; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=FeGjylmrxkl+Ci1PpMJGW1Tax2bnjr7O4fv8cyrOoEZvjjd28zNOYElLMC/KY6smkZ
    MR/Ql/hggF3Op+FrIVRcBDIT0Xjd53gWafL8smW/Ze4Ais3Qn6WkRwNFyEV7rques3NI
    3kWV42VBxgxLKEKiTebKmgHaC8/ugSPPwlSZnGT7tsOtT2EvMIck+oxUMs7tQzPyi/QY
    cLpdl19/1WkfVvwKvuDQkZVQOgq/DSk3s1D9uGJ6qNgw6+e5RkncKEXiCFOfmzENnztA
    Ihg+zfDU3UIcjvZkxOpQVg2fn2lVcgZMlZUVXRf/z8BMGgmUgAp8h4wKkGFMd7kDq654
    kJ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847894;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=DqV9Bza4xh4lmngXwj1J3LSRM3kpJQsPapKBO4Z/YvI=;
    b=kh+V1rAx7xgK2zFpG6lcaLCQakgeMdWrwOYnXxg8ivaAECy3YwjOPQ617eESscoi8d
    31+z2zGp4Nd8vEaoj8h00aVnVZTdPSzsBL4XWvGOac3xjFx4oIkfBuswAH83QrHL2pSm
    0EYkkAMZLD4ZpWms/eLy33qxc6oXwFCVdbuw6iACNwmOv/WKNLPCpVRVMgDYJV0TUCDe
    EeMggkNZ4Mby7iJw0gEYIVXQkPOSZYM167QgaD8F42jdndQSR82EYkEfg3oFlt7D2j8r
    UyluyDkkau2rCTNlgNnNmh/Z3pqihoJSEVChtoDm1BN2AmSLG2gUM6s3+DaM2vDUXf/f
    M0wQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847894;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=DqV9Bza4xh4lmngXwj1J3LSRM3kpJQsPapKBO4Z/YvI=;
    b=ChJfkLUGcpV13DyNrpdOMxO0gJbRtLCxPMzv0Spyvh1kCIfFls2vLalZ4Mdeg1GSDG
    mo4tAr7da5bWH5afDonQsTr7EAUfYdKNAqKktQS9YbRSVXp8EuNcqHQJBS2HgJoudS7l
    MHa5q/KfOoa0USuMnvUQKM/RdidnYaaoQ+DZjGw1KysmVq1zhujC5e/p382DutvOVQbZ
    H5u1fSJv7zJz7vIxIdzmRVp9hMFfoV3b6USJGzrIKD/j6hxles3STf8pYZMynfZ6VxjA
    /KIQHWTE5UFpFwaaOlAxLLv/jfVuGuSMPjRmWzxwvrAzlMxRJAOJ2KXvjFv6cp9YkB39
    Dm6g==
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
Subject: [PATCH v20210616 02/36] tools: add API to work with sevaral bits at once
Date: Wed, 16 Jun 2021 14:50:55 +0200
Message-Id: <20210616125129.26563-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
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

