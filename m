Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BAB6DFDFD
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 20:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520312.807767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfYu-00028p-8T; Wed, 12 Apr 2023 18:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520312.807767; Wed, 12 Apr 2023 18:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfYu-00025V-5F; Wed, 12 Apr 2023 18:51:20 +0000
Received: by outflank-mailman (input) for mailman id 520312;
 Wed, 12 Apr 2023 18:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3LfV=AD=casper.srs.infradead.org=BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pmfYt-0001qk-4D
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 18:51:19 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00c6275a-d963-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 20:51:15 +0200 (CEST)
Received: from [2001:8b0:10b:5::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pmfYf-0077lE-7x; Wed, 12 Apr 2023 18:51:06 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmfYe-001r1R-2I; Wed, 12 Apr 2023 19:51:04 +0100
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
X-Inumbo-ID: 00c6275a-d963-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=pvefxXf1YhjL3JSf+V8JRgGjqQjxWW3E4QNSUXU8Vyk=; b=TjPE0dW5/ekjTjDaeeWQk5fUJV
	nNUgr4r4gwcl33okRN07A5zJwF7Q0B4b01PnDXOtfu3v7VarXGfsZZNSPBiwmIfLc2EdIZ2EGBo4o
	QTqoNs4SeLgJml9Y/6rUfD8FuNIh2wI+nWzJS/7XYaEwpMo+wj7PQJ9f5m1MKj8o0U6AFB1l5km3X
	rElR8Zf42jdPGjQ1hHcqk1DSpdw5yW/z9RBJwQGSUYukk2JFnGU7rFkK9jtVNSx3ySS6kedTvELwC
	pvVDHGxtrOnUPo8v7MBvIwMGNL0HzMnLXSZ8RfjifLwUOnrHdF05EhNKDHsy1O0kxGie2f4iVThoa
	QyhSoxew==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 4/5] hw/xen: Fix double-free in xen_console store_con_info()
Date: Wed, 12 Apr 2023 19:51:01 +0100
Message-Id: <20230412185102.441523-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412185102.441523-1-dwmw2@infradead.org>
References: <20230412185102.441523-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Coverity spotted a double-free (CID 1508254); we g_string_free(path) and
then for some reason immediately call free(path) too.

We should just use g_autoptr() for it anyway, which simplifies the code
a bit.

Fixes: 7a8a749da7d3 ("hw/xen: Move xenstore_store_pv_console_info to xen_console.c")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/char/xen_console.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index c7a19c0e7c..810dae3f44 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -178,8 +178,7 @@ static int store_con_info(struct XenConsole *con)
     Chardev *cs = qemu_chr_fe_get_driver(&con->chr);
     char *pts = NULL;
     char *dom_path;
-    GString *path;
-    int ret = -1;
+    g_autoptr(GString) path = NULL;
 
     /* Only continue if we're talking to a pty. */
     if (!CHARDEV_IS_PTY(cs)) {
@@ -204,15 +203,9 @@ static int store_con_info(struct XenConsole *con)
 
     if (xenstore_write_str(con->console, path->str, pts)) {
         fprintf(stderr, "xenstore_write_str for '%s' fail", path->str);
-        goto out;
+        return -1;
     }
-    ret = 0;
-
-out:
-    g_string_free(path, true);
-    free(path);
-
-    return ret;
+    return 0;
 }
 
 static int con_init(struct XenLegacyDevice *xendev)
-- 
2.39.2


