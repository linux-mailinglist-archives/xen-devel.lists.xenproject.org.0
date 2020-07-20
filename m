Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCABE225D5D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 13:25:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxTtx-0006yP-Nb; Mon, 20 Jul 2020 11:24:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ibwy=A7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jxTtw-0006yK-BX
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 11:24:08 +0000
X-Inumbo-ID: 861d1629-ca7b-11ea-9f85-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 861d1629-ca7b-11ea-9f85-12813bfff9fa;
 Mon, 20 Jul 2020 11:24:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1930AB7A;
 Mon, 20 Jul 2020 11:24:12 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3] docs: specify stability of hypfs path documentation
Date: Mon, 20 Jul 2020 13:21:37 +0200
Message-Id: <20200720112137.27327-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In docs/misc/hypfs-paths.pandoc the supported paths in the hypervisor
file system are specified. Make it more clear that path availability
might change, e.g. due to scope widening or narrowing (e.g. being
limited to a specific architecture).

Signed-off-by: Juergen Gross <jgross@suse.com>
Release-acked-by: Paul Durrant <paul@xen.org>
---
V2: reworded as requested by Jan Beulich
V3: reworded again as suggested by George Dunlap
---
 docs/misc/hypfs-paths.pandoc | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index a111c6f25c..68d83d9245 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -5,6 +5,9 @@ in the Xen hypervisor file system (hypfs).
 
 The hypervisor file system can be accessed via the xenhypfs tool.
 
+The availability of the hypervisor file system depends on the hypervisor
+config option CONFIG_HYPFS, which is on per default.
+
 ## Notation
 
 The hypervisor file system is similar to the Linux kernel's sysfs.
@@ -64,6 +67,23 @@ the list elements separated by spaces, e.g. "dom0 PCID-on".
 The entry would be writable and it would exist on X86 only and only if the
 hypervisor is configured to support PV guests.
 
+# Stability
+
+Path *presence* is not stable, but path *meaning* is always stable: if a tool
+you write finds a path present, it can rely on behavior in future versions of
+the hypervisors, and in different configurations.  Specifically:
+
+1. Conditions under which paths are used may be extended, restricted, or
+   removed.  For example, a path that’s always available only on ARM systems
+   may become available on x86; or a path available on both systems may be
+   restricted to only appearing on ARM systems.  Paths may also disappear
+   entirely.
+2. However, the meaning of a path will never change.  If a path is present,
+   it will always have exactly the meaning that it always had.  In order to
+   maintain this, removed paths should be retained with the tag [REMOVED].
+   The path may be restored *only* if the restored version of the path is
+   compatible with the previous functionality.
+
 ## Example
 
 A populated Xen hypervisor file system might look like the following example:
-- 
2.26.2


