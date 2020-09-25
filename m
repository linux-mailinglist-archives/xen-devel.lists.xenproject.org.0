Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBD2278076
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 08:20:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLh5z-0006JQ-RX; Fri, 25 Sep 2020 06:20:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ocWZ=DC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kLh5x-0006JE-VG
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 06:20:37 +0000
X-Inumbo-ID: cc6fcf9c-8ef9-4873-b457-20cd9ff9e688
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc6fcf9c-8ef9-4873-b457-20cd9ff9e688;
 Fri, 25 Sep 2020 06:20:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601014836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HydUhBjCQg8PC04q+vrajPyPufEV57CkBmTz06o3YmE=;
 b=kAMw646nXmJU0VIGfX4SqtZezv9rCi2ZaLjDZpvVmAuB8IAE6030dzDTCRAsrodTsv24kL
 3ewBdEpwjMGI4aGk0+LBGUq0rrGBLnY5fwAAXUnyEhnX4kyrqCYPDYx5kSXs3kdYL1FFQM
 RlAbZLR2LyfNhu7Bfv9TJRfLXFX9BR4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55F04ABD1;
 Fri, 25 Sep 2020 06:20:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] tools/libxenguest: make xc_dom_loader interface
 private to libxenguest
Date: Fri, 25 Sep 2020 08:20:30 +0200
Message-Id: <20200925062031.12200-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200925062031.12200-1-jgross@suse.com>
References: <20200925062031.12200-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The pluggable kernel loader interface is used only internally of
libxenguest, so make it private. This removes a dependency on the Xen
internal header xen/libelf/libelf.h from xenguest.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/include/xenguest.h | 15 ---------------
 tools/libs/guest/xg_private.h       | 13 +++++++++++++
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/tools/libs/guest/include/xenguest.h b/tools/libs/guest/include/xenguest.h
index 279f06345c..dba6a21643 100644
--- a/tools/libs/guest/include/xenguest.h
+++ b/tools/libs/guest/include/xenguest.h
@@ -247,21 +247,6 @@ struct xc_dom_image {
     unsigned int max_vcpus;
 };
 
-/* --- pluggable kernel loader ------------------------------------- */
-
-struct xc_dom_loader {
-    char *name;
-    /* Sadly the error returns from these functions are not consistent: */
-    elf_negerrnoval (*probe) (struct xc_dom_image * dom);
-    elf_negerrnoval (*parser) (struct xc_dom_image * dom);
-    elf_errorstatus (*loader) (struct xc_dom_image * dom);
-
-    struct xc_dom_loader *next;
-};
-
-#define __init __attribute__ ((constructor))
-void xc_dom_register_loader(struct xc_dom_loader *loader);
-
 /* --- arch specific hooks ----------------------------------------- */
 
 struct xc_dom_arch {
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 0000b2b9b6..9940d554ef 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -41,6 +41,19 @@
 #endif
 #endif
 
+struct xc_dom_loader {
+    char *name;
+    /* Sadly the error returns from these functions are not consistent: */
+    elf_negerrnoval (*probe) (struct xc_dom_image * dom);
+    elf_negerrnoval (*parser) (struct xc_dom_image * dom);
+    elf_errorstatus (*loader) (struct xc_dom_image * dom);
+
+    struct xc_dom_loader *next;
+};
+
+#define __init __attribute__ ((constructor))
+void xc_dom_register_loader(struct xc_dom_loader *loader);
+
 char *xc_read_image(xc_interface *xch,
                     const char *filename, unsigned long *size);
 char *xc_inflate_buffer(xc_interface *xch,
-- 
2.26.2


