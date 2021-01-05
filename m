Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4732EB1B4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 18:46:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62113.109805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqQ0-0005UA-GQ; Tue, 05 Jan 2021 17:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62113.109805; Tue, 05 Jan 2021 17:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqQ0-0005TI-AZ; Tue, 05 Jan 2021 17:46:52 +0000
Received: by outflank-mailman (input) for mailman id 62113;
 Tue, 05 Jan 2021 17:46:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kwqPy-0005QY-2Y
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 17:46:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqPx-0006IT-Ed; Tue, 05 Jan 2021 17:46:49 +0000
Received: from ec2-34-243-106-223.eu-west-1.compute.amazonaws.com
 ([34.243.106.223] helo=ip-10-0-70-185.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqPx-0008Uy-7J; Tue, 05 Jan 2021 17:46:49 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=K1MwrGPkpl0wTZhvU83OdsZZBnyluFntSpoxzfHcZw4=; b=pd3UgDS6lRoHTpLQ0b54nnhKA
	aniOe2Zq5KlCR8r94pnJAmP+utCoUQgQ4e8y4Jstfh2OKiHy6aWe8P0J7FFE8wEP/5cvtZ50+OT6c
	ZQ9mTOp2tThWwb7xS3pzX/Lk2PZ7hESE/haYOPJdw8EaP/ltr9ZLdkc31RxBKhS6tBSmM=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v7 3/7] libxl: stop setting 'vdevfn' in pci_struct_fill()
Date: Tue,  5 Jan 2021 17:46:38 +0000
Message-Id: <20210105174642.2754-4-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210105174642.2754-1-paul@xen.org>
References: <20210105174642.2754-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

There are only two call-sites. One always sets it to 0 (which is unnecessary
as the structure is already initialized to zero) and the other can simply set
the 'vdevfn' field directly (after proper structure initialization), avoiding
the need for a local variable.

A subsequent patch will also make use of pci_struct_fill() in a context
where 'vdevfn' may already have been set.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v7:
 - New in v7
---
 tools/libs/light/libxl_pci.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 74c2196ae3..6feedadc62 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -39,13 +39,12 @@ static unsigned int pci_encode_bdf(libxl_device_pci *pci)
 
 static void pci_struct_fill(libxl_device_pci *pci, unsigned int domain,
                             unsigned int bus, unsigned int dev,
-                            unsigned int func, unsigned int vdevfn)
+                            unsigned int func)
 {
     pci->domain = domain;
     pci->bus = bus;
     pci->dev = dev;
     pci->func = func;
-    pci->vdevfn = vdevfn;
 }
 
 static void libxl_create_pci_backend_device(libxl__gc *gc,
@@ -451,7 +450,7 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         new = pcis + *num;
 
         libxl_device_pci_init(new);
-        pci_struct_fill(new, dom, bus, dev, func, 0);
+        pci_struct_fill(new, dom, bus, dev, func);
 
         if (pci_info_xs_read(gc, new, "domid")) /* already assigned */
             continue;
@@ -2288,17 +2287,19 @@ static int libxl__device_pci_from_xs_be(libxl__gc *gc,
                                         libxl_devid nr, void *data)
 {
     char *s;
-    unsigned int domain = 0, bus = 0, dev = 0, func = 0, vdevfn = 0;
+    unsigned int domain = 0, bus = 0, dev = 0, func = 0;
     libxl_device_pci *pci = data;
 
+    libxl_device_pci_init(pci);
+
     s = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/dev-%d", be_path, nr));
     sscanf(s, PCI_BDF, &domain, &bus, &dev, &func);
 
+    pci_struct_fill(pci, domain, bus, dev, func);
+
     s = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/vdevfn-%d", be_path, nr));
     if (s)
-        vdevfn = strtol(s, (char **) NULL, 16);
-
-    pci_struct_fill(pci, domain, bus, dev, func, vdevfn);
+        pci->vdevfn = strtol(s, (char **) NULL, 16);
 
     s = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/opts-%d", be_path, nr));
     if (s) {
-- 
2.11.0


