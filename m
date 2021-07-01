Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8753B9021
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148355.274257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRZ-0000MP-Fc; Thu, 01 Jul 2021 09:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148355.274257; Thu, 01 Jul 2021 09:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRZ-0000Hk-7D; Thu, 01 Jul 2021 09:57:13 +0000
Received: by outflank-mailman (input) for mailman id 148355;
 Thu, 01 Jul 2021 09:57:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRW-0004XT-Rt
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:10 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c60b6e97-d7a6-4b2a-a322-8cfde3b17073;
 Thu, 01 Jul 2021 09:56:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619ui5Mq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:44 +0200 (CEST)
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
X-Inumbo-ID: c60b6e97-d7a6-4b2a-a322-8cfde3b17073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133404;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=deA9YRVAOQ9im7B/3eOo3ZnuGujRxb1REyjDaCpxsfY=;
    b=ArRTIdul3rn/jRUBaAMtWUjGSvhOeN0c6D25JquFZzJlpSlu3P2UqIQYqBDbCGwQAz
    4LQUy0Vg4i+wmTHxvFW3F1mxWXSmwNyv4jBz2FdL/n0FQSUrqpwJpGPp0bizAWHIt+vt
    dMw4APZU8EWIUaL+/xg5WdwEJ1qtIkIMhmqSYLDyBUVBhGziDzlUmEDAwwUsE/cjScCE
    grgpPzR7B/03fXb8fsN40E+jlWIerDK/UKoGHqjifE64ierjRRJUk3vnT3w/O/yVx9+L
    2/46uUjfv/wGpTz9lN4C6WCm9VkWRVKsDTjqgd0C+n0hB/D3mrf56htE97a8wolGbWzs
    s+gg==
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
Subject: [PATCH v20210701 10/40] tools: add xc_is_known_page_type to libxenctrl
Date: Thu,  1 Jul 2021 11:56:05 +0200
Message-Id: <20210701095635.15648-11-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Users of xc_get_pfn_type_batch may want to sanity check the data
returned by Xen. Add a simple helper for this purpose.

Signed-off-by: Olaf Hering <olaf@aepfle.de>

v02:
- rename xc_is_known_page_type to sr_is_known_page_type
- move from ctrl/xc_private.h to saverestore/common.h (jgross)
---
 tools/libs/saverestore/common.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index ca2eb47a4f..07c506360c 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -467,6 +467,39 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 /* Handle a STATIC_DATA_END record. */
 int handle_static_data_end(struct xc_sr_context *ctx);
 
+/* Sanitiy check for types returned by Xen */
+static inline bool sr_is_known_page_type(xen_pfn_t type)
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
+    case XEN_DOMCTL_PFINFO_XALLOC: /* Synthetic type in Xen 4.2 - 4.5 */
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
 #endif
 /*
  * Local variables:

