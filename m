Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92126F15E7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 12:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527252.819668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXo-0002iN-E8; Fri, 28 Apr 2023 10:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527252.819668; Fri, 28 Apr 2023 10:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXo-0002fc-9w; Fri, 28 Apr 2023 10:41:40 +0000
Received: by outflank-mailman (input) for mailman id 527252;
 Fri, 28 Apr 2023 10:41:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19My=AT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1psLXm-0002Ac-E9
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 10:41:38 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40cc4b21-e5b1-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 12:41:37 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so54569655e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 03:41:37 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002e71156b0fcsm20930378wrc.6.2023.04.28.03.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 03:41:35 -0700 (PDT)
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
X-Inumbo-ID: 40cc4b21-e5b1-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682678497; x=1685270497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjNbfk0xALFvPg/Q2nqnzUi1rQe3ybCNF8EPFcCfhsg=;
        b=doXKRnIfGtk8X1UsxlUlwUs3hgezFypzhgo49lzUFmiP+ZMYZMkyUe54ma48a0dfFM
         7sIZhmeAs+d0n7tHhabHuQLdK1Vmu0+FDPJuGtuoDCDueM1mRNwcH/Xie1W0kkDru9v7
         jZpqSfb6GMf4L325KbTUfsuDPledE0aHomcG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682678497; x=1685270497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjNbfk0xALFvPg/Q2nqnzUi1rQe3ybCNF8EPFcCfhsg=;
        b=LLr2kt+8+qj6aiJHK+Aw+lfLUmsPkakz1XdLnJSKh1Dnpruod5yDZwGLFfegB0wgr0
         FLyFIrL1OIWa0m9y5/odSWy92HEB3mosfmOF73jiIATVvikf6uoQ5QFIbgflNbHmV1R4
         38NPZyBWkujhh+IYbJ/k2tRYGdIWEFTPSc23ytprkS9/gv6rrUx62VwVCxhUNn6YCMNG
         dIgOkGFAoktLZOhDEw1AJEpbcloDL9rNdwdhfoR2U7ndnc9TSMPBatri9uSu1mBMIo8J
         +/EFou8q/bvFma6fMS6zoT3+hX0VQYA7SH+H8+zA4e39pOiQ2wml4gRiTj0YRoOukUCA
         1lSA==
X-Gm-Message-State: AC+VfDyF0+3pVPg6cjGMFIuTr9tEBJR4Fg5+d0AAwtMSvlT/z2gIHvJ6
	DXnQQ4n30CsacHdG2APNL84BgKZdOcNTxt0cyHQ=
X-Google-Smtp-Source: ACHHUZ5zmHCUIvKa4yobrBKZfiTv65xktyXqTmuejeBm+sYxeGHsM6c+JXMfu169jy8KdVYhontodg==
X-Received: by 2002:adf:dccc:0:b0:302:2d79:9f6e with SMTP id x12-20020adfdccc000000b003022d799f6emr2773957wrm.60.1682678496749;
        Fri, 28 Apr 2023 03:41:36 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/7] tools: Create xc_domain_getinfo_single()
Date: Fri, 28 Apr 2023 11:41:19 +0100
Message-Id: <20230428104124.1044-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's a stricter version of xc_domain_getinfo() where the returned domid
always matches the requested domid or the error code shows an error instead.
A few patches ahead usages of xc_domain_getinfo() are removed until only
xc_domain_getinfo_single() and xc_domain_getinfolist() remain.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
 tools/include/xenctrl.h     | 16 ++++++++++++++++
 tools/libs/ctrl/xc_domain.c | 23 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index f5bc7f58b6..685df1c7ba 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -703,6 +703,22 @@ int xc_vcpu_getaffinity(xc_interface *xch,
 int xc_domain_get_guest_width(xc_interface *xch, uint32_t domid,
                               unsigned int *guest_width);
 
+/**
+ * This function will return information about a single domain. It looks
+ * up the domain by the provided domid and succeeds if the domain exists
+ * and is accesible by the current domain, or fails otherwise. A buffer
+ * may optionally passed on the `info` parameter in order to retrieve
+ * information about the domain. The buffer is ignored if NULL is
+ * passed instead.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domid to lookup
+ * @parm info Optional domain information buffer (may be NULL)
+ * @return 0 on success, otherwise the call failed and info is undefined
+ */
+int xc_domain_getinfo_single(xc_interface *xch,
+                             uint32_t domid,
+                             xc_domaininfo_t *info);
 
 /**
  * This function will return information about one or more domains. It is
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index e939d07157..6b11775d4c 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -345,6 +345,29 @@ int xc_dom_vuart_init(xc_interface *xch,
     return rc;
 }
 
+int xc_domain_getinfo_single(xc_interface *xch,
+                             uint32_t domid,
+                             xc_domaininfo_t *info)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_getdomaininfo,
+        .domain = domid,
+    };
+
+    if ( do_domctl(xch, &domctl) < 0 )
+        return -1;
+
+    if ( domctl.u.getdomaininfo.domain != domid ) {
+        errno = ESRCH;
+        return -1;
+    }
+
+    if ( info )
+        *info = domctl.u.getdomaininfo;
+
+    return 0;
+}
+
 int xc_domain_getinfo(xc_interface *xch,
                       uint32_t first_domid,
                       unsigned int max_doms,
-- 
2.34.1


