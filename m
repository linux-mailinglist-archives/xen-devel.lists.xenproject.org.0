Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1C845EEBA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232860.404043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxG-0007YV-UP; Fri, 26 Nov 2021 13:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232860.404043; Fri, 26 Nov 2021 13:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxF-0007Mz-SK; Fri, 26 Nov 2021 13:07:53 +0000
Received: by outflank-mailman (input) for mailman id 232860;
 Fri, 26 Nov 2021 13:07:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavZ-0003W9-5Y
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e6fb575-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:06:07 +0100 (CET)
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
X-Inumbo-ID: 9e6fb575-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jYHmGb285zp19wAOZwPVRqBng1R2DTOnh2y5+lEruAo=;
  b=eFWIdKg08En0EXpWFrQKbybFrQHq1XyI131FyMmdtcK5G4gmQn2ciBDO
   q5zDZMmAGmIOCH6EBBweOYkDEyLll1GcA2sZE3UqFqfiGncngewmEGbzv
   ZqXPv5E/zwxyPU/QtsCdmOyl9DXE1k+SdjtFjRgm0lWC+rETSNZe1IIUd
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: U4Ug72oaXHFOpynjTFMgYcJ7VtoRUHaNSFIGy/weFoqd02iDgsJNloaZRxwiZT3fqp2M6dOr4a
 TpiitZgWTnpNPbjc4e7TtV6fyHaEKY1DydubLT+R/TtETX6sXZP+LcoF2iy3pN/WKEY3zJHVTr
 p+q0YhRUiQMn6rlg4sFu8+OUEYdZYwX8RImJ83Pzr96RMSa19s0P9081yE4KsrIgV64e2W2gL1
 bW8v+nCjyGsOaXYJugzxS8hYlmzowQJCsL5ao7hh0zPRqYHuuM02yRQBu484Ax3meL42UjD1W6
 BbK2pOEndhtqpG1TLdWq0tnC
X-SBRS: 5.1
X-MesageID: 58696039
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:10XO0K1deY95f0Kp7PbD5Vd2kn2cJEfYwER7XKvMYLTBsI5bpzQOn
 GdOWTqEbvjZajajetEiao2y9xgEvJHVyt83TQU9pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wbBh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhltBMl
 vNAn5KLbkQAE47BgLkbfylUOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t1p4fQ66FN
 qL1bxJAZwrGPwB2a20VEbQngeKspiTfYhFH/Qf9Sa0fvDGIkV0ZPKLWGNjIft2HQ+1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTWo0IE6aj3uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGWfohcWVt5UEus7wAKA0KzZ50CeHGdsZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBWYCWHEiQCEL2P6giawQgwqSSPpTHIfg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4ZdN7BJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdwPiN2dDB0wWirhRdMPS
 BSI0e+2zMUOVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOhD+9zhVzwP1hZ
 czznSOQ4ZAyUv8PIN2eHbp17FPW7npmmTO7qW7Tk3xLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Di9vmra8WnOnO/2ddKdTgidCFnbbir+50/XrPSeWJORTB+Y8I9NJt8IuSJaYwOzbyWl
 px8M2cFoGfCaYrvdV/XNys9Mey3Bv6SbxsTZEQRALph4FB7Ca7H0UvVX8JfkWAP+LMxwPhqY
 eMCfsncUP1DRi6eo2YWbIXnrZwkfxOu3FrcMy2gaTk5XphhWw2WpYO0IlqxrHEDXnitqM8zg
 7y8zQeHE5ANcBtvUZTNY/W1wlLv4XVEwLBuX1HFK8V4cVn39NQ4MDT4i/I6epleKRjKyjaA+
 RyRBBMU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTqtqqu4Z
 OhTw/XtC9E9nQ5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiENZ+3EFMVIwZ5PO2P2etNx2vX5PUxZk77+DV27PyMVkALZ0uAjylULb1UNoI5w
 Lh+5J5KulLn0hd6YMybii109niXKi1SWqoqgZgWHYv3h1d50VpFe5HdVnf77Zznhw+g6aX2z
 ut4XJb/uok=
IronPort-HdrOrdr: A9a23:edKFH6BSnCfsZlPlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58696039"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH 18/65] xen/hypfs: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:33:59 +0000
Message-ID: <20211126123446.32324-19-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 xen/common/hypfs.c         | 57 +++++++++++++++++++++++-----------------------
 xen/common/sched/cpupool.c | 25 ++++++++++----------
 xen/include/xen/hypfs.h    | 49 +++++++++++++++++++--------------------
 3 files changed, 65 insertions(+), 66 deletions(-)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 1526bcc52810..0d22396f5dd7 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -113,12 +113,13 @@ static void hypfs_unlock(void)
     }
 }
 
-const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry *entry)
+const struct hypfs_entry *cf_check hypfs_node_enter(
+    const struct hypfs_entry *entry)
 {
     return entry;
 }
 
-void hypfs_node_exit(const struct hypfs_entry *entry)
+void cf_check hypfs_node_exit(const struct hypfs_entry *entry)
 {
 }
 
@@ -289,16 +290,14 @@ static int hypfs_get_path_user(char *buf,
     return 0;
 }
 
-struct hypfs_entry *hypfs_leaf_findentry(const struct hypfs_entry_dir *dir,
-                                         const char *name,
-                                         unsigned int name_len)
+struct hypfs_entry *cf_check hypfs_leaf_findentry(
+    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len)
 {
     return ERR_PTR(-ENOTDIR);
 }
 
-struct hypfs_entry *hypfs_dir_findentry(const struct hypfs_entry_dir *dir,
-                                        const char *name,
-                                        unsigned int name_len)
+struct hypfs_entry *cf_check hypfs_dir_findentry(
+    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len)
 {
     struct hypfs_entry *entry;
 
@@ -360,7 +359,7 @@ static struct hypfs_entry *hypfs_get_entry(const char *path)
     return hypfs_get_entry_rel(&hypfs_root, path + 1);
 }
 
-unsigned int hypfs_getsize(const struct hypfs_entry *entry)
+unsigned int cf_check hypfs_getsize(const struct hypfs_entry *entry)
 {
     return entry->size;
 }
@@ -396,7 +395,7 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
     return 0;
 }
 
-static const struct hypfs_entry *hypfs_dyndir_enter(
+static const struct hypfs_entry *cf_check hypfs_dyndir_enter(
     const struct hypfs_entry *entry)
 {
     const struct hypfs_dyndir_id *data;
@@ -407,7 +406,7 @@ static const struct hypfs_entry *hypfs_dyndir_enter(
     return data->template->e.funcs->enter(&data->template->e);
 }
 
-static struct hypfs_entry *hypfs_dyndir_findentry(
+static struct hypfs_entry *cf_check hypfs_dyndir_findentry(
     const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len)
 {
     const struct hypfs_dyndir_id *data;
@@ -418,8 +417,8 @@ static struct hypfs_entry *hypfs_dyndir_findentry(
     return data->template->e.funcs->findentry(data->template, name, name_len);
 }
 
-static int hypfs_read_dyndir(const struct hypfs_entry *entry,
-                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
+static int cf_check hypfs_read_dyndir(
+    const struct hypfs_entry *entry, XEN_GUEST_HANDLE_PARAM(void) uaddr)
 {
     const struct hypfs_dyndir_id *data;
 
@@ -463,8 +462,8 @@ unsigned int hypfs_dynid_entry_size(const struct hypfs_entry *template,
     return DIRENTRY_SIZE(snprintf(NULL, 0, template->name, id));
 }
 
-int hypfs_read_dir(const struct hypfs_entry *entry,
-                   XEN_GUEST_HANDLE_PARAM(void) uaddr)
+int cf_check hypfs_read_dir(const struct hypfs_entry *entry,
+                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
 {
     const struct hypfs_entry_dir *d;
     const struct hypfs_entry *e;
@@ -510,8 +509,8 @@ int hypfs_read_dir(const struct hypfs_entry *entry,
     return 0;
 }
 
-int hypfs_read_leaf(const struct hypfs_entry *entry,
-                    XEN_GUEST_HANDLE_PARAM(void) uaddr)
+int cf_check hypfs_read_leaf(
+    const struct hypfs_entry *entry, XEN_GUEST_HANDLE_PARAM(void) uaddr)
 {
     const struct hypfs_entry_leaf *l;
     unsigned int size = entry->funcs->getsize(entry);
@@ -555,9 +554,9 @@ static int hypfs_read(const struct hypfs_entry *entry,
     return ret;
 }
 
-int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
-                     unsigned int ulen)
+int cf_check hypfs_write_leaf(
+    struct hypfs_entry_leaf *leaf, XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+    unsigned int ulen)
 {
     char *buf;
     int ret;
@@ -596,9 +595,9 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
     return ret;
 }
 
-int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
-                     unsigned int ulen)
+int cf_check hypfs_write_bool(
+    struct hypfs_entry_leaf *leaf, XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+    unsigned int ulen)
 {
     bool buf;
 
@@ -618,9 +617,9 @@ int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
     return 0;
 }
 
-int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
-                       XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
-                       unsigned int ulen)
+int cf_check hypfs_write_custom(
+    struct hypfs_entry_leaf *leaf, XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+    unsigned int ulen)
 {
     struct param_hypfs *p;
     char *buf;
@@ -653,9 +652,9 @@ int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
     return ret;
 }
 
-int hypfs_write_deny(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
-                     unsigned int ulen)
+int cf_check hypfs_write_deny(
+    struct hypfs_entry_leaf *leaf, XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+    unsigned int ulen)
 {
     return -EACCES;
 }
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index b9d4babd0d8a..07f984a659cd 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -1026,8 +1026,8 @@ static struct notifier_block cpu_nfb = {
 
 static HYPFS_DIR_INIT(cpupool_pooldir, "%u");
 
-static int cpupool_dir_read(const struct hypfs_entry *entry,
-                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
+static int cf_check cpupool_dir_read(
+    const struct hypfs_entry *entry, XEN_GUEST_HANDLE_PARAM(void) uaddr)
 {
     int ret = 0;
     struct cpupool *c;
@@ -1050,7 +1050,8 @@ static int cpupool_dir_read(const struct hypfs_entry *entry,
     return ret;
 }
 
-static unsigned int cpupool_dir_getsize(const struct hypfs_entry *entry)
+static unsigned int cf_check cpupool_dir_getsize(
+    const struct hypfs_entry *entry)
 {
     const struct cpupool *c;
     unsigned int size = 0;
@@ -1061,7 +1062,7 @@ static unsigned int cpupool_dir_getsize(const struct hypfs_entry *entry)
     return size;
 }
 
-static const struct hypfs_entry *cpupool_dir_enter(
+static const struct hypfs_entry *cf_check cpupool_dir_enter(
     const struct hypfs_entry *entry)
 {
     struct hypfs_dyndir_id *data;
@@ -1076,14 +1077,14 @@ static const struct hypfs_entry *cpupool_dir_enter(
     return entry;
 }
 
-static void cpupool_dir_exit(const struct hypfs_entry *entry)
+static void cf_check cpupool_dir_exit(const struct hypfs_entry *entry)
 {
     spin_unlock(&cpupool_lock);
 
     hypfs_free_dyndata();
 }
 
-static struct hypfs_entry *cpupool_dir_findentry(
+static struct hypfs_entry *cf_check cpupool_dir_findentry(
     const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len)
 {
     unsigned long id;
@@ -1102,8 +1103,8 @@ static struct hypfs_entry *cpupool_dir_findentry(
     return hypfs_gen_dyndir_id_entry(&cpupool_pooldir, id, cpupool);
 }
 
-static int cpupool_gran_read(const struct hypfs_entry *entry,
-                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
+static int cf_check cpupool_gran_read(
+    const struct hypfs_entry *entry, XEN_GUEST_HANDLE_PARAM(void) uaddr)
 {
     const struct hypfs_dyndir_id *data;
     const struct cpupool *cpupool;
@@ -1121,7 +1122,7 @@ static int cpupool_gran_read(const struct hypfs_entry *entry,
     return copy_to_guest(uaddr, gran, strlen(gran) + 1) ? -EFAULT : 0;
 }
 
-static unsigned int hypfs_gran_getsize(const struct hypfs_entry *entry)
+static unsigned int cf_check hypfs_gran_getsize(const struct hypfs_entry *entry)
 {
     const struct hypfs_dyndir_id *data;
     const struct cpupool *cpupool;
@@ -1136,9 +1137,9 @@ static unsigned int hypfs_gran_getsize(const struct hypfs_entry *entry)
     return strlen(gran) + 1;
 }
 
-static int cpupool_gran_write(struct hypfs_entry_leaf *leaf,
-                              XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
-                              unsigned int ulen)
+static int cf_check cpupool_gran_write(
+    struct hypfs_entry_leaf *leaf, XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+    unsigned int ulen)
 {
     const struct hypfs_dyndir_id *data;
     struct cpupool *cpupool;
diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index e9d4c2555bd7..1b65a9188c6c 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -168,31 +168,30 @@ void hypfs_add_dyndir(struct hypfs_entry_dir *parent,
                       struct hypfs_entry_dir *template);
 int hypfs_add_leaf(struct hypfs_entry_dir *parent,
                    struct hypfs_entry_leaf *leaf, bool nofault);
-const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry *entry);
-void hypfs_node_exit(const struct hypfs_entry *entry);
-int hypfs_read_dir(const struct hypfs_entry *entry,
-                   XEN_GUEST_HANDLE_PARAM(void) uaddr);
-int hypfs_read_leaf(const struct hypfs_entry *entry,
-                    XEN_GUEST_HANDLE_PARAM(void) uaddr);
-int hypfs_write_deny(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
-                     unsigned int ulen);
-int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
-                     unsigned int ulen);
-int hypfs_write_bool(struct hypfs_entry_leaf *leaf,
-                     XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
-                     unsigned int ulen);
-int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
-                       XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
-                       unsigned int ulen);
-unsigned int hypfs_getsize(const struct hypfs_entry *entry);
-struct hypfs_entry *hypfs_leaf_findentry(const struct hypfs_entry_dir *dir,
-                                         const char *name,
-                                         unsigned int name_len);
-struct hypfs_entry *hypfs_dir_findentry(const struct hypfs_entry_dir *dir,
-                                        const char *name,
-                                        unsigned int name_len);
+const struct hypfs_entry *cf_check hypfs_node_enter(
+    const struct hypfs_entry *entry);
+void cf_check hypfs_node_exit(const struct hypfs_entry *entry);
+int cf_check hypfs_read_dir(const struct hypfs_entry *entry,
+                            XEN_GUEST_HANDLE_PARAM(void) uaddr);
+int cf_check hypfs_read_leaf(const struct hypfs_entry *entry,
+                             XEN_GUEST_HANDLE_PARAM(void) uaddr);
+int cf_check hypfs_write_deny(struct hypfs_entry_leaf *leaf,
+                              XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                              unsigned int ulen);
+int cf_check hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
+                              XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                              unsigned int ulen);
+int cf_check hypfs_write_bool(struct hypfs_entry_leaf *leaf,
+                              XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                              unsigned int ulen);
+int cf_check hypfs_write_custom(struct hypfs_entry_leaf *leaf,
+                                XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                                unsigned int ulen);
+unsigned int cf_check hypfs_getsize(const struct hypfs_entry *entry);
+struct hypfs_entry *cf_check hypfs_leaf_findentry(
+    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len);
+struct hypfs_entry *cf_check hypfs_dir_findentry(
+    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len);
 void *hypfs_alloc_dyndata(unsigned long size);
 #define hypfs_alloc_dyndata(type) ((type *)hypfs_alloc_dyndata(sizeof(type)))
 void *hypfs_get_dyndata(void);
-- 
2.11.0


