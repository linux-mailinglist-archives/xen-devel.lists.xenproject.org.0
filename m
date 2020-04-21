Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF251B2F1C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 20:30:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQxeX-0002p3-Dx; Tue, 21 Apr 2020 18:29:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HO9m=6F=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jQxeW-0002oy-Hx
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 18:29:48 +0000
X-Inumbo-ID: 148b818e-83fe-11ea-b4f4-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 148b818e-83fe-11ea-b4f4-bc764e2007e4;
 Tue, 21 Apr 2020 18:29:48 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21FCB206B9;
 Tue, 21 Apr 2020 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587493787;
 bh=gPYLioEdR97tixnLWErX6tDm6h4U0yFb+6/sLVniAGs=;
 h=From:To:Cc:Subject:Date:From;
 b=DTYWyTaz5529QGg3jN5POOeo6GndaQxhZaHvyO7V3/GcmJCFum2RkLs3Ede5xnO+S
 8ioVKufkZPDJSnRVCMu+InCLVYu8q49JrRwu49W8eiFrklD4ZkWfcbEq3Sm9j2W4r8
 peH9OsIFgG0sM6PfG8AX9FZHsUQlny2llcdz3P40=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] Introduce a description of the Backport and Fixes tags
Date: Tue, 21 Apr 2020 11:29:46 -0700
Message-Id: <20200421182946.27337-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: lars.kurth@citrix.com, sstabellini@kernel.org, julien@xen.org,
 konrad.wilk@oracle.com, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, george.dunlap@citrix.com,
 jbeulich@suse.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Create a new document under docs/process to describe our special tags.
Add a description of the Fixes tag and the new Backport tag. Also
clarify that lines with tags should not be split.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Acked-by: Wei Liu <wl@xen.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: jbeulich@suse.com
CC: george.dunlap@citrix.com
CC: julien@xen.org
CC: lars.kurth@citrix.com
CC: andrew.cooper3@citrix.com
CC: konrad.wilk@oracle.com

---

Changes in v4:
- fix example
- use released trees instead of stable trees
- add (or in addition)

---
 docs/process/tags.pandoc | 55 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 docs/process/tags.pandoc

diff --git a/docs/process/tags.pandoc b/docs/process/tags.pandoc
new file mode 100644
index 0000000000..1841cb87a8
--- /dev/null
+++ b/docs/process/tags.pandoc
@@ -0,0 +1,55 @@
+Tags: No line splitting
+-----------------------
+Do not split a tag across multiple lines, tags are exempt from the
+"wrap at 75 columns" rule in order to simplify parsing scripts.  For
+example:
+
+        Fixes: 67d01cdb5518 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
+
+
+Fixes Tag
+---------
+
+If your patch fixes a bug in a specific commit, e.g. you found an issue using
+``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
+the SHA-1 ID, and the one line summary.
+
+The following ``git config`` settings can be used to add a pretty format for
+outputting the above style in the ``git log`` or ``git show`` commands:
+
+        [core]
+                abbrev = 12
+        [pretty]
+                fixes = Fixes: %h (\"%s\")
+
+
+Backport Tag
+------------
+
+A backport tag is an optional tag in the commit message to request a
+given commit to be backported to the released trees:
+
+    Backport: 4.9+
+
+It marks a commit for being a candidate for backports to all released
+trees from 4.9 onward.
+
+The backport requester is expected to specify which currently supported
+releases need the backport; but encouraged to specify a release as far
+back as possible which applies. If the requester doesn't know the oldest
+affected tree, they are encouraged to append a comment like the
+following:
+
+    Backport: 4.9+ # maybe older
+
+Maintainers request the Backport tag to be added on commit. Contributors
+are welcome to mark their patches with the Backport tag when they deem
+appropriate. Maintainers will request for it to be removed when that is
+not the case.
+
+Please note that the Backport tag is a **request** for backport, which
+will still need to be evaluated by the maintainers. Maintainers might
+ask the requester to help with the backporting work if it is not
+trivial.
+
+When possible, please use the Fixes tag instead (or in addition).
-- 
2.17.1


