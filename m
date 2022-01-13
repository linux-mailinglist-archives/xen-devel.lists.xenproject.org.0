Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E8148D131
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 05:02:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256977.441320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7rJb-0001F7-Ud; Thu, 13 Jan 2022 04:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256977.441320; Thu, 13 Jan 2022 04:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7rJb-0001CG-RW; Thu, 13 Jan 2022 04:02:19 +0000
Received: by outflank-mailman (input) for mailman id 256977;
 Thu, 13 Jan 2022 04:02:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qLSn=R5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1n7rJa-0001CA-7b
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 04:02:18 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9827e0cd-7425-11ec-bd6f-bfb69f65cdc7;
 Thu, 13 Jan 2022 05:02:17 +0100 (CET)
Received: by mail-qk1-x732.google.com with SMTP id t24so5824070qkg.11
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jan 2022 20:02:16 -0800 (PST)
Received: from shine.lan ([2001:470:8:67e:408:e042:ffb0:37c3])
 by smtp.gmail.com with ESMTPSA id r13sm1405042qtw.41.2022.01.12.20.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 20:02:14 -0800 (PST)
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
X-Inumbo-ID: 9827e0cd-7425-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DBWu0u1ioGoIf6w911lbvsGyju3nJBRJDn0APwiIJQ0=;
        b=IjUx0htfjzD6YClJLLRQ/AXr5H24pSPMe9mrSLkmfjmKpvqPZkEOz5gTAxIIDME2n2
         yoAHP3swY+Av0eTMB0NOFuto5MxlE1HofbIlD9ILXEeOukVGSV0NIsubXl4TPHupXHqw
         epPsnTlPEjAzAi7H9pjIYOwIbrIfk+njxvimcwKGoJuvdFqZPBupW5y2pTsp4Vc+4cin
         WGyTVd1MIx2Um0+AhKfBoxvOWAg+bs87twMbCxFLHC/LFTdJF6jYEY8VO7AbpTwpeVuC
         O/Oem6yK4lGjFuVmVrcsx9M1lrK7FP55riErGn4geS/6hKfSgeuBDayEb/s7XbxahKT8
         ZsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DBWu0u1ioGoIf6w911lbvsGyju3nJBRJDn0APwiIJQ0=;
        b=7u7sXC11PGjdov6vR3l0o/FYiSarxsgDoVQXC3TZYX0niyrU/A/e18WPSZ6Vkd/80C
         Vhyqzodaurd9zAihv4antLZaWWTylpdkmU6u4t4aPyS2W0Fx32FaI/+sJrpS9EdJzV4q
         fk56d0AeB2ZcNZPhjH4wCGxnSy90zbugfJXZwCxSABN5wD1z3qVr1lgd0Rd+Grf5zqPZ
         LV2oiXiF22jBbS2zCy+zNCaAumdFlVziMtjoKhIaMfDLvsiWxfbIklbCwkz+nMb9JsGP
         Pt4oGvqXycpnd1eM31RIyzkZuIucRvq/5QgUHcJ1+kJyrJnJBak2V6WA3Nufp5wGXtqG
         s0tA==
X-Gm-Message-State: AOAM532PCLgjRHXsxWv7Ql5UK8bCIQc/j9GzY0iZXcavk6mUe6QUVtjV
	/R9LrI8pPeD5qidkKUs+msvDVQIdyTI=
X-Google-Smtp-Source: ABdhPJyPu4bPPAzCccREb9mXSO2xh8hZnWmJ/2KQ6PplfjjfpGh7QLIieu1QH9QkSdxSuf5Tej2Mpg==
X-Received: by 2002:a37:9f05:: with SMTP id i5mr2054693qke.385.1642046534981;
        Wed, 12 Jan 2022 20:02:14 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4] libxl/PCI: Fix PV hotplug & stubdom coldplug
Date: Wed, 12 Jan 2022 23:01:42 -0500
Message-Id: <20220113040142.20503-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
reflected in the config" broken PCI hotplug (xl pci-attach) for PV
domains when it moved libxl__create_pci_backend() later in the function.

This also broke HVM + stubdom PCI passthrough coldplug.  For that, the
PCI devices are hotplugged to a running PV stubdom, and then the QEMU
QMP device_add commands are made to QEMU inside the stubdom.

A running PV domain calls libxl__wait_for_backend().  With the current
placement of libxl__create_pci_backend(), the path does not exist and
the call immediately fails:
libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices

The wait is only relevant when:
1) The domain is PV
3) The domain is running
2) The backend is already present

1) xen-pcifront is only used for PV.  It does not load for HVM domains
   where QEMU is used.

2) If the domain is not running (starting), then the frontend state will
   be Initialising.  xen-pciback waits for the frontend to transition to
   at Initialised before attempting to connect.  So a wait for a
   non-running domain is not applicable as the backend will not
   transition to Connected.

3) For presence, num_devs is already used to determine if the backend
   needs to be created.  Re-use num_devs to determine if the backend
   wait is necessary.  The wait is necessary to avoid racing with
   another PCI attachment reconfiguring the front/back or changing to
   some other state like closing.  If we are creating the backend, then
   we don't have to worry about the state since it is being created.

Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
reflected in the config")

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Alternative to Jan's patch:
https://lore.kernel.org/xen-devel/5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com/

v4:
Use if (rc) return rc
Capitalize comment sentence
Change commit message

v3:
Change title & commit message

v2:
Add Fixes
Expand num_devs use in commit message
---
 tools/libs/light/libxl_pci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 4c2d7aeefb..4bbbfe9f16 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -157,9 +157,11 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
     if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
         return ERROR_FAIL;
 
-    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
-        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
-            return ERROR_FAIL;
+    /* Wait is only needed if the backend already exists (num_devs != NULL) */
+    if (num_devs && !starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
+        rc = libxl__wait_for_backend(gc, be_path,
+                                     GCSPRINTF("%d", XenbusStateConnected));
+        if (rc) return rc;
     }
 
     back = flexarray_make(gc, 16, 1);
-- 
2.32.0


