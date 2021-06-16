Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CBB3A9B1A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142944.263667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1S-0001Zf-EB; Wed, 16 Jun 2021 12:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142944.263667; Wed, 16 Jun 2021 12:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1S-0001Tj-4Q; Wed, 16 Jun 2021 12:51:58 +0000
Received: by outflank-mailman (input) for mailman id 142944;
 Wed, 16 Jun 2021 12:51:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1Q-0006lZ-0A
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:51:56 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cece85ed-2d27-4fdd-8717-480416772f0b;
 Wed, 16 Jun 2021 12:51:43 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpatlv
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:36 +0200 (CEST)
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
X-Inumbo-ID: cece85ed-2d27-4fdd-8717-480416772f0b
ARC-Seal: i=1; a=rsa-sha256; t=1623847896; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dxOtudDpDUxA61h6q5gaxkGxLyyUZ0Qhf56ZBw5pvtCPzZyGAT+05ORT39AQQSr2GL
    cOJ6ZQ+jCQOg6eWlv4mIPMeZwPXlLrUjhw40KsAgIVPchaLrVNwOSsvZ26CanAJ5GDn1
    e3lyeeON91UPhwe+gTQpxToQRTj7Tu5bE7Z1CDguN+O3sjVy2cA7OqYNmgp0YIojewEN
    pXRkAItVbuHNTwsh0MO7jc+G6EnlEJUiFL0TYf+0rFGHHyJ1d60pzWPSjkMrrFRJwAks
    OqF2ASJoSouRjLhCM4oAeVO3vX123nYGdsINbfyx+CfEUdmh4lb0smVwYK+8JvrcDi3V
    OMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847896;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ikZ54MUbm6J0+L4XW5ARSvIze4KQJX0wbR+SClf730w=;
    b=Li9M5NuoXwVzfog2OtC6dmydfnROU2UPs+KqlXq/sizYlcp2z8JA1F1Fa7HPKCTfQF
    Cdf6ROhmdEJtMN7UeEf/BOI/r6KYbHTTXegtQksvsO/OIHkAisdDcCZ0tiwPqpuxIs10
    RrRHP/OMaMfNq47rot0BJL7SU+pSMqi11mCd9W7zZyc8BhS6nSEdtS17beoy3vugwAGF
    NLEGRJbGP4AkEjtjiuV7PtjA4LPq0lXBRZcGXIRAhxt3zAn/d5vtfdQmU+ggh1AUnJIj
    x5nM0HhegNmyIaGQENmES70rr4jjGH8tLlPEEjUnN/qTQGzV6unni4r0I3xCKNmFfbNA
    4JiA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847896;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ikZ54MUbm6J0+L4XW5ARSvIze4KQJX0wbR+SClf730w=;
    b=UIsPIfYTqJ11BJg4cVQSTqrMfNiTuot30qjQsOw8l2Zh0GFtCmMhXoLh+mS7NmkjR9
    KsOOPifUa9IHi4sxnQPt+CuIlzPk5Z2wpeBspqFbXJQ+T40WPYFOHvzYydzu/PJlU0w+
    vsqQvAW83UgmmIDfDCo5M5lMQKBF7i24W0tUQp350Omma930GaS4sTbUwQkamAEpnq2O
    GjjTvU3t8D/spCCn9oP7gPSiZmkjZbRAwnSjhGU9yRtrauVWgB9Ppg15cBkoWlid50jS
    r5Nfvbm3NyQgxiOdVBb3vHaWh25+ZlhHmP220QJTlJsn0mnlW+noM8fmZXTQhSOAJCVX
    3IAA==
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
Subject: [PATCH v20210616 07/36] tools: add sr_is_known_page_type to libsaverestore
Date: Wed, 16 Jun 2021 14:51:00 +0200
Message-Id: <20210616125129.26563-8-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
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
index ca2eb47a4f..c9cc4206e5 100644
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
 #endif
 /*
  * Local variables:

