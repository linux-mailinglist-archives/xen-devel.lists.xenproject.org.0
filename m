Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B057A6A8541
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505050.777596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxL-0001eA-IV; Thu, 02 Mar 2023 15:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505050.777596; Thu, 02 Mar 2023 15:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxL-0001XE-86; Thu, 02 Mar 2023 15:34:55 +0000
Received: by outflank-mailman (input) for mailman id 505050;
 Thu, 02 Mar 2023 15:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ucY8=62=casper.srs.infradead.org=BATV+a1ad97f05afd282148df+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxJ-0001Jw-0C
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:34:53 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2002737-b90f-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pXkx4-002UNL-GG; Thu, 02 Mar 2023 15:34:39 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uzB-1f; Thu, 02 Mar 2023 15:34:38 +0000
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
X-Inumbo-ID: c2002737-b90f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=hO9boeY37hI66edoKGp/We1ozdCgGmP7lbWXFd91Vmg=; b=XEw5/n84HVx/f6TpZQyopNgrJO
	jGzibgq8/nq92uNWAx2ml1yf0nb7kz9OG+jPVpu0zp+J+dCmFYpnnGtmtr43ouNrSDdku+iQXkFWJ
	BCI2FPJ2rh+NiRKrjSsSc10InnYmPq5EFD3Ou8R8SlkzBviIaehalog7XLvfoL0zmG8JffYffUhfT
	YRkIeFB8kgo1kAKwcRP8OkWIhea4tMbxuf8JEAcglYjWXT3Dc8uUOrq9QVVXHOb5BufSXXVGV+9W7
	4gXnSSHgOsMPb0f6ODCoqsZ9aB6BeBipEeIU7Finm1wZHN7wBqZPyWrJuOrq4YI8FGnZ/KB+eW5AD
	GITmZOlA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 14/25] hw/xen: Move xenstore_store_pv_console_info to xen_console.c
Date: Thu,  2 Mar 2023 15:34:24 +0000
Message-Id: <20230302153435.1170111-15-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

There's no need for this to be in the Xen accel code, and as we want to
use the Xen console support with KVM-emulated Xen we'll want to have a
platform-agnostic version of it. Make it use GString to build up the
path while we're at it.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 accel/xen/xen-all.c   | 61 -------------------------------------------
 hw/char/xen_console.c | 45 +++++++++++++++++++++++++++++--
 include/hw/xen/xen.h  |  2 --
 3 files changed, 43 insertions(+), 65 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 425216230f..2d51c41e40 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -29,67 +29,6 @@ xc_interface *xen_xc;
 xenforeignmemory_handle *xen_fmem;
 xendevicemodel_handle *xen_dmod;
 
-static int store_dev_info(int domid, Chardev *cs, const char *string)
-{
-    struct xs_handle *xs = NULL;
-    char *path = NULL;
-    char *newpath = NULL;
-    char *pts = NULL;
-    int ret = -1;
-
-    /* Only continue if we're talking to a pty. */
-    if (!CHARDEV_IS_PTY(cs)) {
-        return 0;
-    }
-    pts = cs->filename + 4;
-
-    /* We now have everything we need to set the xenstore entry. */
-    xs = xs_open(0);
-    if (xs == NULL) {
-        fprintf(stderr, "Could not contact XenStore\n");
-        goto out;
-    }
-
-    path = xs_get_domain_path(xs, domid);
-    if (path == NULL) {
-        fprintf(stderr, "xs_get_domain_path() error\n");
-        goto out;
-    }
-    newpath = realloc(path, (strlen(path) + strlen(string) +
-                strlen("/tty") + 1));
-    if (newpath == NULL) {
-        fprintf(stderr, "realloc error\n");
-        goto out;
-    }
-    path = newpath;
-
-    strcat(path, string);
-    strcat(path, "/tty");
-    if (!xs_write(xs, XBT_NULL, path, pts, strlen(pts))) {
-        fprintf(stderr, "xs_write for '%s' fail", string);
-        goto out;
-    }
-    ret = 0;
-
-out:
-    free(path);
-    xs_close(xs);
-
-    return ret;
-}
-
-void xenstore_store_pv_console_info(int i, Chardev *chr)
-{
-    if (i == 0) {
-        store_dev_info(xen_domid, chr, "/console");
-    } else {
-        char buf[32];
-        snprintf(buf, sizeof(buf), "/device/console/%d", i);
-        store_dev_info(xen_domid, chr, buf);
-    }
-}
-
-
 static void xenstore_record_dm_state(const char *state)
 {
     struct xs_handle *xs;
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index ad8638a86d..c7a19c0e7c 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -173,6 +173,48 @@ static void xencons_send(struct XenConsole *con)
 
 /* -------------------------------------------------------------------- */
 
+static int store_con_info(struct XenConsole *con)
+{
+    Chardev *cs = qemu_chr_fe_get_driver(&con->chr);
+    char *pts = NULL;
+    char *dom_path;
+    GString *path;
+    int ret = -1;
+
+    /* Only continue if we're talking to a pty. */
+    if (!CHARDEV_IS_PTY(cs)) {
+        return 0;
+    }
+    pts = cs->filename + 4;
+
+    dom_path = qemu_xen_xs_get_domain_path(xenstore, xen_domid);
+    if (!dom_path) {
+        return 0;
+    }
+
+    path = g_string_new(dom_path);
+    free(dom_path);
+
+    if (con->xendev.dev) {
+        g_string_append_printf(path, "/device/console/%d", con->xendev.dev);
+    } else {
+        g_string_append(path, "/console");
+    }
+    g_string_append(path, "/tty");
+
+    if (xenstore_write_str(con->console, path->str, pts)) {
+        fprintf(stderr, "xenstore_write_str for '%s' fail", path->str);
+        goto out;
+    }
+    ret = 0;
+
+out:
+    g_string_free(path, true);
+    free(path);
+
+    return ret;
+}
+
 static int con_init(struct XenLegacyDevice *xendev)
 {
     struct XenConsole *con = container_of(xendev, struct XenConsole, xendev);
@@ -215,8 +257,7 @@ static int con_init(struct XenLegacyDevice *xendev)
                          &error_abort);
     }
 
-    xenstore_store_pv_console_info(con->xendev.dev,
-                                   qemu_chr_fe_get_driver(&con->chr));
+    store_con_info(con);
 
 out:
     g_free(type);
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 03983939f9..56b1c2a827 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -39,8 +39,6 @@ int xen_is_pirq_msi(uint32_t msi_data);
 
 qemu_irq *xen_interrupt_controller_init(void);
 
-void xenstore_store_pv_console_info(int i, Chardev *chr);
-
 void xen_register_framebuffer(struct MemoryRegion *mr);
 
 #endif /* QEMU_HW_XEN_H */
-- 
2.39.0


