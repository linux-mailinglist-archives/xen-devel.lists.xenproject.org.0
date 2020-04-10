Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC071A48A8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 18:50:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMwqm-0007Lk-Rw; Fri, 10 Apr 2020 16:49:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PXqy=52=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jMwql-0007Lf-3A
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 16:49:51 +0000
X-Inumbo-ID: 4a0bc00c-7b4b-11ea-845b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a0bc00c-7b4b-11ea-845b-12813bfff9fa;
 Fri, 10 Apr 2020 16:49:50 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB7E720769;
 Fri, 10 Apr 2020 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586537389;
 bh=NMyKX9Vm5M/+ytGCVt+HkWqn+19KHLHUeuCyTsgRHlM=;
 h=From:To:Cc:Subject:Date:From;
 b=uA+q4ygfO0274XjDCULhgww7Ac4ysWw4MHcR/hQfhkRuq39SjMsSKBYjyKa1HNB5X
 qRHi2GqI7UhsB6vF0QWRUfXAWgxM4r2fYGPcBtgeNWtuj1QPs2uvgxbsM5ZrIwWN2t
 CWfgdyx8sJVebVYxInki81zZQNrli/Uf1/qcjwqE=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] Introduce a description of a new optional tag for Backports
Date: Fri, 10 Apr 2020 09:49:42 -0700
Message-Id: <20200410164942.9747-1-sstabellini@kernel.org>
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
 konrad.wilk@oracle.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 jbeulich@suse.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Create a new document under docs/process to describe our special tags.
For now, only add the new backport tag.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
Acked-by: Wei Liu <wl@xen.org>
CC: jbeulich@suse.com
CC: george.dunlap@citrix.com
CC: julien@xen.org
CC: lars.kurth@citrix.com
CC: andrew.cooper3@citrix.com
CC: konrad.wilk@oracle.com

---

This is the original thread: https://marc.info/?l=xen-devel&m=157324027614941

The backport tag was agreed upon. George requested the file to be
renamed to something more generic, where we could add more information
later.

I kept the original content and acked-by. I renamed the file to
tags.pandoc.
---
 docs/process/tags.pandoc | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 docs/process/tags.pandoc

diff --git a/docs/process/tags.pandoc b/docs/process/tags.pandoc
new file mode 100644
index 0000000000..e570efdcc8
--- /dev/null
+++ b/docs/process/tags.pandoc
@@ -0,0 +1,23 @@
+Backport Tag
+------------
+
+A backport tag is an optional tag in the commit message to request a
+given commit to be backported to the stable trees:
+
+    Backport: all
+
+It marks a commit for being a candidate for backports to all relevant
+trees.
+
+    Backport: 4.9+
+
+It marks a commit for being a candidate for backports to all stable
+trees from 4.9 onward.
+
+Maintainers request the Backport tag to be added on commit.
+Contributors are also welcome to mark their patches with the Backport
+tag when they deem appropriate. Maintainers will request for it to be
+removed when that is not the case.
+
+Please note that the Backport tag is a **request** for backport, which
+will still need to be evaluated by the stable tree maintainers.
-- 
2.17.1


