Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4402973A9
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11219.29865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzu7-00020Q-8R; Fri, 23 Oct 2020 16:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11219.29865; Fri, 23 Oct 2020 16:26:59 +0000
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
	id 1kVzu7-0001zO-35; Fri, 23 Oct 2020 16:26:59 +0000
Received: by outflank-mailman (input) for mailman id 11219;
 Fri, 23 Oct 2020 16:26:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVzu5-0000v2-HE
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:57 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf6a7257-063a-40c2-9d1c-081ae0f7b8be;
 Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVztV-0008O2-6X; Fri, 23 Oct 2020 16:26:21 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqk-000376-7K; Fri, 23 Oct 2020 16:23:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVzu5-0000v2-HE
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:57 +0000
X-Inumbo-ID: bf6a7257-063a-40c2-9d1c-081ae0f7b8be
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bf6a7257-063a-40c2-9d1c-081ae0f7b8be;
	Fri, 23 Oct 2020 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=TwtfBZ1TBMcZx0WwXud6JOyhwZrUvxUUMk2BtEGrrXI=; b=PHGk+IBka0LiWVfU4vT9v9Myv
	iiBrJ0Dt5HDFp9njxUh4fYZt+K+LX+9nJslKhWFaBCjuQWNAx3P5kuxj7ghRjuYGF3/QRxfykH5z6
	0YFMvzcH/zj8+AdJBYuAh1XdGGR+U0MLRrew4cPVX56ejNbYmX6a7LEeaatWmU9iNPebU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVztV-0008O2-6X; Fri, 23 Oct 2020 16:26:21 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqk-000376-7K; Fri, 23 Oct 2020 16:23:30 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 12/25] libxl: add libxl_device_pci_assignable_list_free()...
Date: Fri, 23 Oct 2020 16:23:01 +0000
Message-Id: <20201023162314.2235-13-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

... to be used by callers of libxl_device_pci_assignable_list().

Currently there is no API for callers of libxl_device_pci_assignable_list()
to free the list. The xl function pciassignable_list() calls
libxl_device_pci_dispose() on each element of the returned list, but
libxl_pci_assignable() in libxl_pci.c does not. Neither does the implementation
of libxl_device_pci_assignable_list() call libxl_device_pci_init().

This patch adds the new API function, makes sure it is used everywhere and
also modifies libxl_device_pci_assignable_list() to initialize list
entries rather than just zeroing them.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: David Scott <dave@recoil.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl_pci.c         | 14 ++++++++++++--
 tools/ocaml/libs/xl/xenlight_stubs.c |  3 +--
 tools/xl/xl_pci.c                    |  3 +--
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ee52d3cf7e..8225809d94 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -458,6 +458,12 @@
 #define LIBXL_HAVE_DEVICE_PCI_LIST_FREE 1
 
 /*
+ * LIBXL_HAVE_DEVICE_PCI_ASSIGNABLE_LIST_FREE indicates that the
+ * libxl_device_pci_assignable_list_free() function is defined.
+ */
+#define LIBXL_HAVE_DEVICE_PCI_ASSIGNABLE_LIST_FREE 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
@@ -2369,6 +2375,7 @@ int libxl_device_events_handler(libxl_ctx *ctx,
 int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
 int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
 libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
+void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num);
 
 /* CPUID handling */
 int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str);
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 3162facb37..e858509609 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -438,7 +438,7 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         pcis = new;
         new = pcis + *num;
 
-        memset(new, 0, sizeof(*new));
+        libxl_device_pci_init(new);
         pci_struct_fill(new, dom, bus, dev, func, 0);
 
         if (pci_info_xs_read(gc, new, "domid")) /* already assigned */
@@ -453,6 +453,16 @@ out:
     return pcis;
 }
 
+void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num)
+{
+    int i;
+
+    for (i = 0; i < num; i++)
+        libxl_device_pci_dispose(&list[i]);
+
+    free(list);
+}
+
 /* Unbind device from its current driver, if any.  If driver_path is non-NULL,
  * store the path to the original driver in it. */
 static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
@@ -1470,7 +1480,7 @@ static int libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
             pcis[i].func == pci->func)
             break;
     }
-    free(pcis);
+    libxl_device_pci_assignable_list_free(pcis, num);
     return i != num;
 }
 
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
index 1181971da4..352a00134d 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -894,9 +894,8 @@ value stub_xl_device_pci_assignable_list(value ctx)
 		Field(list, 1) = temp;
 		temp = list;
 		Store_field(list, 0, Val_device_pci(&c_list[i]));
-		libxl_device_pci_dispose(&c_list[i]);
 	}
-	free(c_list);
+	libxl_device_pci_assignable_list_free(c_list, nb);
 
 	CAMLreturn(list);
 }
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index 7c0f102ac7..f71498cbb5 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -164,9 +164,8 @@ static void pciassignable_list(void)
     for (i = 0; i < num; i++) {
         printf("%04x:%02x:%02x.%01x\n",
                pcis[i].domain, pcis[i].bus, pcis[i].dev, pcis[i].func);
-        libxl_device_pci_dispose(&pcis[i]);
     }
-    free(pcis);
+    libxl_device_pci_assignable_list_free(pcis, num);
 }
 
 int main_pciassignable_list(int argc, char **argv)
-- 
2.11.0


