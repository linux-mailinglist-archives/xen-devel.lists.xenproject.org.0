Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64912ADD6D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 18:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23572.50443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXoJ-00034p-5g; Tue, 10 Nov 2020 17:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23572.50443; Tue, 10 Nov 2020 17:52:03 +0000
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
	id 1kcXoI-00033s-Uk; Tue, 10 Nov 2020 17:52:02 +0000
Received: by outflank-mailman (input) for mailman id 23572;
 Tue, 10 Nov 2020 17:52:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXoI-0002tQ-1o
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:52:02 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e143eab-38e6-4c54-bf75-18c9c219581d;
 Tue, 10 Nov 2020 17:51:53 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXo8-0006Yf-FX; Tue, 10 Nov 2020 17:51:52 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXo8-0007RC-6T; Tue, 10 Nov 2020 17:51:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXoI-0002tQ-1o
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:52:02 +0000
X-Inumbo-ID: 4e143eab-38e6-4c54-bf75-18c9c219581d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4e143eab-38e6-4c54-bf75-18c9c219581d;
	Tue, 10 Nov 2020 17:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=jy1w5XNZuUTCc1TfiWPlVdgsiUjSwSTRmbob0Mo3M8w=; b=vGmIm5oNBfIZPyG5jJ9ygAV5ek
	UsqOfobUUr8bxoI16S9Duq9sTq0yYu+i6bCXMpg97ioiw9faD79DIV5BP+bTamW21Hvc4abEGfZWI
	Fnz0hBnO5RHCHSJ3gv970qmjYPBHa+vKQZCiq2Q5xhobxZsnhrglyYrNWkPoTUj9hfSc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXo8-0006Yf-FX; Tue, 10 Nov 2020 17:51:52 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXo8-0007RC-6T; Tue, 10 Nov 2020 17:51:52 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 02/24] libxl: use LIBXL_DEFINE_DEVICE_LIST for pci devices
Date: Tue, 10 Nov 2020 17:51:25 +0000
Message-Id: <20201110175147.7067-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
References: <20201110175147.7067-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Remove open coded definition of libxl_device_pci_list().

NOTE: Using the macro also defines libxl_device_pci_list_free() so a prototype
      for it is added. Subsequent patches will make used of it.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/include/libxl.h        |  7 +++++++
 tools/libs/light/libxl_pci.c | 27 ++-------------------------
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index fbe4c81ba511..ee52d3cf7e7e 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -451,6 +451,12 @@
  */
 #define LIBXL_HAVE_CONFIG_PCIS 1
 
+/*
+ * LIBXL_HAVE_DEVICE_PCI_LIST_FREE indicates that the
+ * libxl_device_pci_list_free() function is defined.
+ */
+#define LIBXL_HAVE_DEVICE_PCI_LIST_FREE 1
+
 /*
  * libxl ABI compatibility
  *
@@ -2321,6 +2327,7 @@ int libxl_device_pci_destroy(libxl_ctx *ctx, uint32_t domid,
 
 libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
                                         int *num);
+void libxl_device_pci_list_free(libxl_device_pci* list, int num);
 
 /*
  * Turns the current process into a backend device service daemon
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 2ff1c64a3144..515e74fe5aae 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -2393,31 +2393,6 @@ static int libxl__device_pci_get_num(libxl__gc *gc, const char *be_path,
     return rc;
 }
 
-libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid, int *num)
-{
-    GC_INIT(ctx);
-    char *be_path;
-    unsigned int n, i;
-    libxl_device_pci *pcis = NULL;
-
-    *num = 0;
-
-    be_path = libxl__domain_device_backend_path(gc, 0, domid, 0,
-                                                LIBXL__DEVICE_KIND_PCI);
-    if (libxl__device_pci_get_num(gc, be_path, &n))
-        goto out;
-
-    pcis = calloc(n, sizeof(libxl_device_pci));
-
-    for (i = 0; i < n; i++)
-        libxl__device_pci_from_xs_be(gc, be_path, i, pcis + i);
-
-    *num = n;
-out:
-    GC_FREE;
-    return pcis;
-}
-
 void libxl__device_pci_destroy_all(libxl__egc *egc, uint32_t domid,
                                    libxl__multidev *multidev)
 {
@@ -2492,6 +2467,8 @@ static int libxl_device_pci_compare(const libxl_device_pci *d1,
     return COMPARE_PCI(d1, d2);
 }
 
+LIBXL_DEFINE_DEVICE_LIST(pci)
+
 #define libxl__device_pci_update_devid NULL
 
 DEFINE_DEVICE_TYPE_STRUCT(pci, PCI,
-- 
2.20.1


