Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37902F1CBE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65105.115257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DG-0002fC-Px; Mon, 11 Jan 2021 17:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65105.115257; Mon, 11 Jan 2021 17:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DG-0002eh-MW; Mon, 11 Jan 2021 17:42:42 +0000
Received: by outflank-mailman (input) for mailman id 65105;
 Mon, 11 Jan 2021 17:42:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1DE-0002aB-OJ
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:42:40 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.169])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb0e6280-3445-41bb-b592-5befaa3f0abd;
 Mon, 11 Jan 2021 17:42:36 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgVM3P
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:31 +0100 (CET)
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
X-Inumbo-ID: fb0e6280-3445-41bb-b592-5befaa3f0abd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386955;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=8EOjWvQk239Wp/aWNifZAKC+Sjf+9ZihUrmLiKkJAAc=;
	b=S1kioc05rNbum7ScMsIe8sGAf2BhR5SDIpPpfZXni0frqonfBi9xWkGmlwDY6JikGQ
	8f0A+N86OJfkaWC6S1xaIPQbjHu5H7B/pBXtIcPZ25HNraz564+tqMwAyuZ89mgQhAE3
	SKp2DoquSB2vYoGHmKBKVETqyqKWYx7rLhUGKjaUWh1F4oQpHnN6JH+CyxSS1VNodZb/
	oB92lrRQzCnO0I+V1ixSVR/XNiiyzODTmYjU0fwPFc0vzB9r0UbWf4qHjb+UeCnd42LV
	g3eLIieN03M+h6rI8LSnCLRG62fSY/hZvgXhIBHMZuJJ+8DRHSW+6kyJnO+MTfdD1Cm3
	Q1cg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210111 10/39] tools: add xc_is_known_page_type to libxenctrl
Date: Mon, 11 Jan 2021 18:41:55 +0100
Message-Id: <20210111174224.24714-11-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
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
 

