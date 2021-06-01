Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41620397798
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134979.250989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zP-0005ZO-2T; Tue, 01 Jun 2021 16:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134979.250989; Tue, 01 Jun 2021 16:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zO-0005XO-Uh; Tue, 01 Jun 2021 16:11:34 +0000
Received: by outflank-mailman (input) for mailman id 134979;
 Tue, 01 Jun 2021 16:11:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zN-0005Ec-0g
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:33 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13ab766b-3fdb-4683-ae05-9169682260c7;
 Tue, 01 Jun 2021 16:11:31 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBP1B6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:25 +0200 (CEST)
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
X-Inumbo-ID: 13ab766b-3fdb-4683-ae05-9169682260c7
ARC-Seal: i=1; a=rsa-sha256; t=1622563885; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Q8tN60+RqOha/MCXIQ5n8Okf/eCE4XN4QKhcqJNEH4fZXpfnhdq1Mhn5RraxGGhURH
    bR2V3bg8mIRVxZhQd9j1M3EBFN4HTux1HLo56QpEB/Gxbo6JOG1f0QcftuzC+MeDRv7i
    wU77+TyThcRMJ1EdIUcxG4X3nP+Sq8mODjxlYfaeKbwmClPa7woA6uNk3tI6v1hrf4O5
    IXwfnpqnCWi6HP6WdFWLjThkI5sNIypXP2ec7UnoBCaAc3Ifuh15qusQ4JMHU/p25Vef
    dCUcnFHg/OdvfpwLvwXct7TJtQjpbWaoZMQEHXea/r6wj6xn/I1WCc1gmhtDhRybPImn
    XJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563885;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ti7wpap7OKPtBty/ilhF07cZXxS6hyTWcz0abirc9Nk=;
    b=NlPTluv9dqlH2y81U97VooLLFW933ZhYmDeUIoPU04RBuEqy11hEOu/YqD9RUud8AG
    4EmoFn+72H4J0QwM2rqMQ+EB9PxXbwBFfMbqKNQgMh4QkT4SrDhgMoyrDy2bBOTJevK9
    8FryrKOg/HxOAfYTCtBtIu+5HzYTMf7tuak3wWU2Lqb3wQ+461DDPpdfr2IyZcllc6hf
    oN8FNN5l7cEBd3zVMyhJ8yCoUdKYh7HsLXRpiArQbdvtPE+Jqv9M2Y5n2luWdb4VkwOn
    Wk2S1SfZ2N3FsRTDqx0vi25FVmC6vCvuaZogANWP4q6kjCjw+Ft10E7yupTRpZizgIbb
    5zPQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563885;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ti7wpap7OKPtBty/ilhF07cZXxS6hyTWcz0abirc9Nk=;
    b=elofRk4c6+a0/b7PP9QcqvXDvSWVEb5gDa8oAMVpm4vMk6jdtWIkhVRdaQG6anPHjs
    rze8P0ywimL3CGv4VwC2MCHyx5V03dXo6+yaNiNPsEstbtFafrFTBl8btXejoOGbNWQw
    4QWm/GibrNHC3k0EwzwNOOl+asl/XaG+4lZkBlOmCD9izIGAth3l2WKT4/3T6k4fMsJT
    CKDyLDJoVQccGr6oXvtIjFRouK+g7tijGkc2NSnCIOxG2T4PAyQYtjTf1PkxF+z4VDir
    0nRHFlteuEjT/O09+DlcuzGLtnr+QcO0sEpeCQhByhMSKQk1JtMsSzqVrN14Wok3nZRq
    eVxQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 01/38] tools: add API to work with sevaral bits at once
Date: Tue,  1 Jun 2021 18:10:41 +0200
Message-Id: <20210601161118.18986-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
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

