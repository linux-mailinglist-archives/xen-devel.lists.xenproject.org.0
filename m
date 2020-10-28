Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9555129D055
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 15:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13629.34343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXmTQ-0000JL-Kw; Wed, 28 Oct 2020 14:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13629.34343; Wed, 28 Oct 2020 14:30:48 +0000
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
	id 1kXmTQ-0000Ir-H6; Wed, 28 Oct 2020 14:30:48 +0000
Received: by outflank-mailman (input) for mailman id 13629;
 Wed, 28 Oct 2020 14:30:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LDgn=ED=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kXmTP-0000IU-13
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 14:30:47 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37c6a7fb-b1bb-49f9-8be0-4fe999580628;
 Wed, 28 Oct 2020 14:30:41 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
 with ESMTPSA id D03373w9SEUV5Mc
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 28 Oct 2020 15:30:31 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LDgn=ED=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kXmTP-0000IU-13
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 14:30:47 +0000
X-Inumbo-ID: 37c6a7fb-b1bb-49f9-8be0-4fe999580628
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 37c6a7fb-b1bb-49f9-8be0-4fe999580628;
	Wed, 28 Oct 2020 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603895440;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=8EOjWvQk239Wp/aWNifZAKC+Sjf+9ZihUrmLiKkJAAc=;
	b=ivPRFXnGxrQjFfk6asYHhqTZi26eH2FBmOVi7PrYd1KIteAhN6/KIJBxRXViC2h5Dw
	o07Z89ZXmk8scebTQCcXQaTZ/5iw+7mOSM6Zr2kRisOAA6FgkKe0igexBDJyh57znJzz
	p7wbt/6dM+liiFk7I+fMWz68q19DD4xfbmj/JAhUfTczZLFBsQQY9QsRlvFEaMM6wXFK
	PiSKi8bT8GfAbVPJRBqBDGOE4KlcxVr9h4Gnz/FruHYMCt9eOIlXL6fiqQ8HzBI+6pa5
	2vVCK3gYmogcaZQ7oZoyLwnqA5fe3E7l2Shhq85bNy2wo++7O89IEzAxu8YM4+0MHsh7
	Katg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
	with ESMTPSA id D03373w9SEUV5Mc
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Wed, 28 Oct 2020 15:30:31 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 1/3] tools: add xc_is_known_page_type to libxenctrl
Date: Wed, 28 Oct 2020 15:30:22 +0100
Message-Id: <20201028143024.26833-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201028143024.26833-1-olaf@aepfle.de>
References: <20201028143024.26833-1-olaf@aepfle.de>
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
 

