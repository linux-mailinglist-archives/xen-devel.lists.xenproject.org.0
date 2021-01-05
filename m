Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335D22EB1B8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 18:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62117.109852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqQ5-0005h4-Ch; Tue, 05 Jan 2021 17:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62117.109852; Tue, 05 Jan 2021 17:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqQ4-0005fp-V7; Tue, 05 Jan 2021 17:46:56 +0000
Received: by outflank-mailman (input) for mailman id 62117;
 Tue, 05 Jan 2021 17:46:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kwqQ1-0005XS-ID
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 17:46:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqQ0-0006Iu-On; Tue, 05 Jan 2021 17:46:52 +0000
Received: from ec2-34-243-106-223.eu-west-1.compute.amazonaws.com
 ([34.243.106.223] helo=ip-10-0-70-185.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqQ0-0008Uy-HX; Tue, 05 Jan 2021 17:46:52 +0000
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
	 bh=3UwAO3+6UIsalZmR5nIJ2Wrt6//kBgYPmyOdrIp1odM=; b=Dx3y9Zm4sNBzfbKi16OuVAR3u
	dHnXh1vOWxN50fD0hCfV3y+hNphTVnCNUHVRPNk20R3FGI1gRmhk7EuR0L0p6cRmO2nSe6yiVDhT9
	n+InEBbiKyZjW4Km7K6fhk+9SoAO6u121rKcaoN/2VEQ+EVyH3uUqU6bXhpGaMZ4av+GM=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v7 7/7] libxl / libxlu: support 'xl pci-attach/detach' by name
Date: Tue,  5 Jan 2021 17:46:42 +0000
Message-Id: <20210105174642.2754-8-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210105174642.2754-1-paul@xen.org>
References: <20210105174642.2754-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch modifies libxlu_pci_parse_spec_string() to parse the new 'name'
parameter of PCI_SPEC_STRING detailed in the updated documention in
xl-pci-configuration(5) and populate the 'name' field of 'libxl_device_pci'.

If the 'name' field is non-NULL then both libxl_device_pci_add() and
libxl_device_pci_remove() will use it to look up the device BDF in
the list of assignable devices.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v7:
 - Re-worked (mainly because 'libxl_device_pci' already has a 'name' field)
 - Dropped Wei's A-b because of the re-work

v6:
 - Re-base
 - Slight modification to the patch name
 - Kept Wei's A-b since modifications are small
---
 tools/libs/light/libxl_pci.c | 43 ++++++++++++++++++++++++++++++++++++++-----
 tools/libs/util/libxlu_pci.c |  7 ++++++-
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 9e3a90dcda..1a1c263080 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -58,6 +58,8 @@ static void libxl_create_pci_backend_device(libxl__gc *gc,
     flexarray_append(back, GCSPRINTF(PCI_BDF, pci->domain, pci->bus, pci->dev, pci->func));
     if (pci->vdevfn)
         flexarray_append_pair(back, GCSPRINTF("vdevfn-%d", num), GCSPRINTF("%x", pci->vdevfn));
+    if (pci->name)
+        flexarray_append_pair(back, GCSPRINTF("name-%d", num), GCSPRINTF("%s", pci->name));
     flexarray_append(back, GCSPRINTF("opts-%d", num));
     flexarray_append(back,
               GCSPRINTF("msitranslate=%d,power_mgmt=%d,permissive=%d,rdm_policy=%s",
@@ -282,6 +284,7 @@ retry_transaction2:
     xs_rm(ctx->xsh, t, GCSPRINTF("%s/vdev-%d", be_path, i));
     xs_rm(ctx->xsh, t, GCSPRINTF("%s/opts-%d", be_path, i));
     xs_rm(ctx->xsh, t, GCSPRINTF("%s/vdevfn-%d", be_path, i));
+    xs_rm(ctx->xsh, t, GCSPRINTF("%s/name-%d", be_path, i));
     libxl__xs_printf(gc, t, num_devs_path, "%d", num - 1);
     for (j = i + 1; j < num; j++) {
         tmppath = GCSPRINTF("%s/state-%d", be_path, j);
@@ -314,6 +317,12 @@ retry_transaction2:
             xs_write(ctx->xsh, t, GCSPRINTF("%s/vdevfn-%d", be_path, j - 1), tmp, strlen(tmp));
             xs_rm(ctx->xsh, t, tmppath);
         }
+        tmppath = GCSPRINTF("%s/name-%d", be_path, j);
+        tmp = libxl__xs_read(gc, t, tmppath);
+        if (tmp) {
+            xs_write(ctx->xsh, t, GCSPRINTF("%s/name-%d", be_path, j - 1), tmp, strlen(tmp));
+            xs_rm(ctx->xsh, t, tmppath);
+        }
     }
     if (!xs_transaction_end(ctx->xsh, t, 0))
         if (errno == EAGAIN)
@@ -1589,6 +1598,12 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     libxl_device_pci_copy(CTX, &pas->pci, pci);
     pci = &pas->pci;
 
+    /* If the device is named then we need to look up the BDF */
+    if (pci->name) {
+        rc = name2bdf(gc, pci);
+        if (rc) goto out;
+    }
+
     pas->starting = starting;
     pas->callback = device_pci_add_stubdom_done;
 
@@ -1739,11 +1754,19 @@ static void device_pci_add_done(libxl__egc *egc,
     libxl_device_pci *pci = &pas->pci;
 
     if (rc) {
-        LOGD(ERROR, domid,
-             "libxl__device_pci_add  failed for "
-             "PCI device %x:%x:%x.%x (rc %d)",
-             pci->domain, pci->bus, pci->dev, pci->func,
-             rc);
+        if (pci->name) {
+            LOGD(ERROR, domid,
+                 "libxl__device_pci_add failed for "
+                 "PCI device '%s' (rc %d)",
+                 pci->name,
+                 rc);
+        } else {
+            LOGD(ERROR, domid,
+                 "libxl__device_pci_add failed for "
+                 "PCI device %x:%x:%x.%x (rc %d)",
+                 pci->domain, pci->bus, pci->dev, pci->func,
+                 rc);
+        }
         pci_info_xs_remove(gc, pci, "domid");
     }
     libxl_device_pci_dispose(pci);
@@ -2250,6 +2273,12 @@ static void libxl__device_pci_remove_common(libxl__egc *egc,
     libxl_device_pci_copy(CTX, &prs->pci, pci);
     pci = &prs->pci;
 
+    /* If the device is named then we need to look up the BDF */
+    if (pci->name) {
+        rc = name2bdf(gc, pci);
+        if (rc) goto out;
+    }
+
     prs->force = force;
     libxl__xswait_init(&prs->xswait);
     libxl__ev_qmp_init(&prs->qmp);
@@ -2372,6 +2401,10 @@ static int libxl__device_pci_from_xs_be(libxl__gc *gc,
     if (s)
         pci->vdevfn = strtol(s, (char **) NULL, 16);
 
+    s = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/name-%d", be_path, nr));
+    if (s)
+        pci->name = strdup(s);
+
     s = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/opts-%d", be_path, nr));
     if (s) {
         char *saveptr;
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 05472a0bd1..ad88fee088 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -147,6 +147,7 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pci,
 {
     const char *ptr = str;
     bool bdf_present = false;
+    bool name_present = false;
     int ret;
 
     /* Attempt to parse 'bdf' as positional parameter */
@@ -189,6 +190,10 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pci,
             pci->power_mgmt = atoi(val);
         } else if (!strcmp(key, "rdm_policy")) {
             ret = parse_rdm_policy(cfg, &pci->rdm_policy, val);
+        } else if (!strcmp(key, "name")) {
+            name_present = true;
+            pci->name = strdup(val);
+            if (!pci->name) ret = ERROR_NOMEM;
         } else {
             XLU__PCI_ERR(cfg, "Unknown PCI_SPEC_STRING option: %s", key);
             ret = ERROR_INVAL;
@@ -201,7 +206,7 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pci,
             return ret;
     }
 
-    if (!bdf_present)
+    if (!(bdf_present ^ name_present))
         return ERROR_INVAL;
 
     return 0;
-- 
2.11.0


