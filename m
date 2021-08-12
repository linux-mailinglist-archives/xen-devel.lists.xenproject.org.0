Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C193E9BC7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 02:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166183.303480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDz2d-00052F-C3; Thu, 12 Aug 2021 00:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166183.303480; Thu, 12 Aug 2021 00:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDz2d-0004zN-8Y; Thu, 12 Aug 2021 00:57:51 +0000
Received: by outflank-mailman (input) for mailman id 166183;
 Thu, 12 Aug 2021 00:57:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4db+=ND=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mDz2b-0004zH-10
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 00:57:49 +0000
Received: from mail-qt1-x82d.google.com (unknown [2607:f8b0:4864:20::82d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1c70254-ef12-4253-9944-5b3a59bbb42d;
 Thu, 12 Aug 2021 00:57:47 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id l24so3738645qtj.4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Aug 2021 17:57:47 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:9a6d:dce3:ac2:6190])
 by smtp.gmail.com with ESMTPSA id i18sm485260qkk.115.2021.08.11.17.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 17:57:46 -0700 (PDT)
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
X-Inumbo-ID: f1c70254-ef12-4253-9944-5b3a59bbb42d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YZFpHqZ18RAHlwIBW8zPlfdiJZMmIECW9lTEa+PkGTg=;
        b=JaPiE5rMz/BT/SKoDeuKeIsM5ZL56sbHBv+sDzJMRWNJZrzDI+lnNCXLgoXeC1IPhH
         a4BXKZWyZlmJH57Fq//t/Ha1TVa+uf2COlut5ERX3R5Xu/SdPUPw3mJbCGro0uBQeHBr
         VVW7Pzo8qMB769qEkH1MNOt2ZfiEZwiJ91Z2bVQbinO7RroiQQLuEQQ7N2EJ6xZFhBMW
         iFKYInc6TpjqGAk+e/8iCMnvHQnRDjpasijWB56czwq5oMyU/gGDvMWFf8shdzBSPatY
         yP3+SmfGfS8tsfXiQWzpEx1qik9DMQRj8SUotZ15QbsSGBYQnFaD99schRjOgo5aHZVX
         8C6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YZFpHqZ18RAHlwIBW8zPlfdiJZMmIECW9lTEa+PkGTg=;
        b=omX+U0gy68GCNp0+tnvfhfW1rdUlxcJpykG9m6us5OaGYQqv7DViTCHQxOJmRewtTi
         FdOv3oGU4OViyqeFst1gNvxCHq7tdkN68D5eMmzu2q/CneEiQ85fmOrYpxYIUK3BxNpA
         2NlGDtQpo1oQmYpgsCaZggTRuShOmspn7uweyV5rEq9GeK5Unh8IIDk/XZJTd+f5o4pR
         0N+fZHBKPI7N1tZajNsau2nMxbHievAGFoUtm9VazF0XWxh3+OcgLO7VAKJxa0iOTd3e
         UnGGkWl23IRRJrfT3fLX/+jfHh+rQuzqGgfLfhTsRvfMvS9cD+OkkZN5PVzGGWKQMs8K
         Z2Uw==
X-Gm-Message-State: AOAM531fksa3zZ223EjqraVtokdzfatTCP1hHB3oQTniE1McYiTIKyQo
	dhFVF17tczfdFRvHbRoMEBCrkZ21RdI=
X-Google-Smtp-Source: ABdhPJxdDfySv+Iakuj0bi7vNSAhCiKDRa/EzM+GZXORGegIwLqWJtIM8BOVe8B7gPTvEvbWULRJWA==
X-Received: by 2002:a05:622a:1183:: with SMTP id m3mr1415553qtk.323.1628729867151;
        Wed, 11 Aug 2021 17:57:47 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pdurrant@amazon.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] libxl: Fix stubdom PCI passthrough
Date: Wed, 11 Aug 2021 20:57:00 -0400
Message-Id: <20210812005700.3159-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
reflected in the config" broken stubdom PCI passthrough when it moved
libxl__create_pci_backend later in the function.  xl pci-attach for a
running PV domain may also have been broken, but that was not verified.

The stubdomain is running (!starting) and PV, so it calls
libxl__wait_for_backend.  With the new placement of
libxl__create_pci_backend, the path does not exist and the call
immediately fails.
libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices

The wait is only relevant when the backend is already present.  num_devs
is already used to determine if the backend needs to be created.  Re-use
num_devs to determine if the backend wait is necessary.  The wait is
necessary to avoid racing with another PCI attachment reconfiguring the
front/back. If we are creating the backend, then we don't have to worry
about a racing reconfigure.

Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
reflected in the config")

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Add Fixes
Expand num_devs use in commit message
---
 tools/libs/light/libxl_pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 1a1c263080..19daf1d4ee 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -157,8 +157,10 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
     if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
         return ERROR_FAIL;
 
-    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
-        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
+    /* wait is only needed if the backend already exists (num_devs != NULL) */
+    if (num_devs && !starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
+        if (libxl__wait_for_backend(gc, be_path,
+                                    GCSPRINTF("%d", XenbusStateConnected)) < 0)
             return ERROR_FAIL;
     }
 
-- 
2.30.2


