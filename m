Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE90F29F2DA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14413.35608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBb0-0003NI-GQ; Thu, 29 Oct 2020 17:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14413.35608; Thu, 29 Oct 2020 17:20:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBb0-0003Mk-AZ; Thu, 29 Oct 2020 17:20:18 +0000
Received: by outflank-mailman (input) for mailman id 14413;
 Thu, 29 Oct 2020 17:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBay-0003MD-No
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:16 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aab968a0-fda7-4de8-b9f9-2d4afecf3e0d;
 Thu, 29 Oct 2020 17:20:15 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THK83f7
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:08 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBay-0003MD-No
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:16 +0000
X-Inumbo-ID: aab968a0-fda7-4de8-b9f9-2d4afecf3e0d
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.20])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id aab968a0-fda7-4de8-b9f9-2d4afecf3e0d;
	Thu, 29 Oct 2020 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992014;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=8EOjWvQk239Wp/aWNifZAKC+Sjf+9ZihUrmLiKkJAAc=;
	b=ebHuVvb9I0JhokgnvvB108AaZ3uzxamS+m3vMJQB3RA5DsHUOfuauo7wxMi2aS4Mm+
	u8NrCVYpYNNl4wQBZQKlbC26m2VQom6iUaRc7o2x1peL2pOYkLjPiOYcXWPXcVSvm32P
	qbidfvNSbia/ylUA5ZHdKh/XREycotHAaCU0gU6e3Qldw205+cS9HV+H8gdUzyXflR3v
	lsFl48ckqEZFQJJxQcMpyKxztdmZksgu7flGhp29CMSn5dl70lZcaPn3IXQMPv2hRDE7
	ga0KDPFDWzMqZ/Ly56xc+N7lrn+eZr46INlYT+3+jZGrz6z/eaN6Yv3LvbY8rVgAXSKt
	qtHQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THK83f7
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:08 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 02/23] tools: add xc_is_known_page_type to libxenctrl
Date: Thu, 29 Oct 2020 18:19:42 +0100
Message-Id: <20201029172004.17219-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
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
 

