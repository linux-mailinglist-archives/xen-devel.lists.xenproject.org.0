Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA0839779C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134983.251034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zZ-0006xy-OU; Tue, 01 Jun 2021 16:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134983.251034; Tue, 01 Jun 2021 16:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zZ-0006vi-GC; Tue, 01 Jun 2021 16:11:45 +0000
Received: by outflank-mailman (input) for mailman id 134983;
 Tue, 01 Jun 2021 16:11:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zX-0005Ec-0s
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:43 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e280699-7760-4a0f-adfb-a44356807a37;
 Tue, 01 Jun 2021 16:11:32 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBR1BA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:27 +0200 (CEST)
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
X-Inumbo-ID: 5e280699-7760-4a0f-adfb-a44356807a37
ARC-Seal: i=1; a=rsa-sha256; t=1622563887; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gISW+Gu/ZVcbfMZyUxvVAXMjU8BS7D4pv8ZvtGeCsbYtzWqCA8j3ayIU4wTvSrvgP3
    G4bitN66zGnxrgW8IA+Jwhtao7w/EJbsyGyoD7ZuCTKbKuc0SScyaLIYKI/ZJNsqasaD
    nMg4BSvuJzosmK80Y6psVd6yRFxEIX0xio6kPTuB/Kr3+m7mhwlOCTPG1+HSKpW+3/KI
    1yxeDyy8d9vLXeeiJU3WtpqyxVUFPTE42CefxTWO7yo3QvuiH0HpIeY3GlXqNj3dmuxs
    aR0cmj7G2aabMfEPmyxz2HuerX+b8IBbuPOnefG3/3wnyO59Jg/1MwAuFoqgEtQz9uh6
    GrGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563887;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=8EOjWvQk239Wp/aWNifZAKC+Sjf+9ZihUrmLiKkJAAc=;
    b=jQtdKSlb9FH79dzWoVHsq+ujCn1n/8KRNjKaVo8a5JhPySvEmEgswqcmPRAhLxmZnN
    rPIrQgwycooC1awY+AEii3QeQOGCQaoAgjlLPa0igEwBv9il2BiI/L0vTkxKTFiud2ed
    Pt+l/YLilb0RC0KipK0/QP7mbBgDd6aVawfYDz7hUUZBXeA8KWdcxjwvix2IuJViwL7O
    wvfvpHBeJUCbfvEMqAWFAEAiNUQyOikhs95pEN3ZEXOZR3fpBURQphfQy1usoZu22LeI
    3jG9+TzBJLiP7K0phGwU8FqYuVIx/RicY4Tlp/3PU77+JXE7EpQmAILFHJd866+JSQg5
    NKYg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563887;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=8EOjWvQk239Wp/aWNifZAKC+Sjf+9ZihUrmLiKkJAAc=;
    b=eO8dXLOMjMQzUxkYPzl55FUozhW0zM/NyzUQ5Bsb7bzJrJxU2+ycgTzHyD53pMVHkg
    CtnaH/07//v16yl0yAZ0oDD9Mru5KiGvB8jRPtZXXbqaR97ySCpMFXIz66Agm0fPozmr
    M6mzR8HMMWFpOexfNKUiJvVJSlgBxui1QDv56AKqJlBV5CAPG7k38+j/M4fwHt/2KfnK
    zhMD+IKME9f9fgm1oQQYEdADxcZ5P53VoGUz/XKvv3RjIX6x80yKdU7NmJLpRRW5tCyv
    01DhK8f0YTK7x/5V0qOBbBit+J/eUSm/TzLLpqFMaFrSg/+fp57Lu7KwzDBWRMzleVrv
    phFQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 05/38] tools: add xc_is_known_page_type to libxenctrl
Date: Tue,  1 Jun 2021 18:10:45 +0200
Message-Id: <20210601161118.18986-6-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Users of xc_get_pfn_type_batch may want to sanity check the data
returned by Xen. Add a simple helper for this purpose.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/ctrl/xc_private.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index 5d2c7274fb..afb08aafe1 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -421,6 +421,39 @@ void *xc_map_foreign_ranges(xc_interface *xch, uint32_t dom,
 int xc_get_pfn_type_batch(xc_interface *xch, uint32_t dom,
                           unsigned int num, xen_pfn_t *);
 
+/* Sanitiy check for types returned by Xen */
+static inline bool xc_is_known_page_type(xen_pfn_t type)
+{
+    bool ret;
+
+    switch (type)
+    {
+    case XEN_DOMCTL_PFINFO_NOTAB:
+
+    case XEN_DOMCTL_PFINFO_L1TAB:
+    case XEN_DOMCTL_PFINFO_L1TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L2TAB:
+    case XEN_DOMCTL_PFINFO_L2TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L3TAB:
+    case XEN_DOMCTL_PFINFO_L3TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L4TAB:
+    case XEN_DOMCTL_PFINFO_L4TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_XTAB:
+    case XEN_DOMCTL_PFINFO_XALLOC:
+    case XEN_DOMCTL_PFINFO_BROKEN:
+        ret = true;
+        break;
+    default:
+        ret = false;
+        break;
+    }
+    return ret;
+}
+
 void bitmap_64_to_byte(uint8_t *bp, const uint64_t *lp, int nbits);
 void bitmap_byte_to_64(uint64_t *lp, const uint8_t *bp, int nbits);
 

