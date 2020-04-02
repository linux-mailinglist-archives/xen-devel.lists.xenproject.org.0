Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF9919C64A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 17:46:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK23N-00040H-Qb; Thu, 02 Apr 2020 15:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jjwm=5S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jK23L-0003xe-Hg
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 15:46:47 +0000
X-Inumbo-ID: 1a86b2ac-74f9-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a86b2ac-74f9-11ea-b4f4-bc764e2007e4;
 Thu, 02 Apr 2020 15:46:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A62C9AE50;
 Thu,  2 Apr 2020 15:46:20 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 07/12] xen: provide version information in hypfs
Date: Thu,  2 Apr 2020 17:46:11 +0200
Message-Id: <20200402154616.16927-8-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200402154616.16927-1-jgross@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Provide version and compile information in /buildinfo/ node of the
Xen hypervisor file system. As this information is accessible by dom0
only no additional security problem arises.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V3:
- new patch

V4:
- add __read_mostly annotations (Jan Beulich)
---
 docs/misc/hypfs-paths.pandoc | 45 ++++++++++++++++++++++++++++++++++++++++++++
 xen/common/kernel.c          | 45 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index b9f50f6998..e392feff27 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -103,3 +103,48 @@ A populated Xen hypervisor file system might look like the following example:
 #### /
 
 The root of the hypervisor file system.
+
+#### /buildinfo/
+
+A directory containing static information generated while building the
+hypervisor.
+
+#### /buildinfo/changeset = STRING
+
+Git commit of the hypervisor.
+
+#### /buildinfo/compileinfo/
+
+A directory containing information about compilation of Xen.
+
+#### /buildinfo/compileinfo/compile_by = STRING
+
+Information who compiled the hypervisor.
+
+#### /buildinfo/compileinfo/compile_date = STRING
+
+Date of the hypervisor compilation.
+
+#### /buildinfo/compileinfo/compile_domain = STRING
+
+Information about the compile domain.
+
+#### /buildinfo/compileinfo/compiler = STRING
+
+The compiler used to build Xen.
+
+#### /buildinfo/version/
+
+A directory containing version information of the hypervisor.
+
+#### /buildinfo/version/extra = STRING
+
+Extra version information.
+
+#### /buildinfo/version/major = INTEGER
+
+The major version of Xen.
+
+#### /buildinfo/version/minor = INTEGER
+
+The minor version of Xen.
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 22941cec94..da6e4b4444 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -13,6 +13,7 @@
 #include <xen/paging.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
+#include <xen/hypfs.h>
 #include <xsm/xsm.h>
 #include <asm/current.h>
 #include <public/version.h>
@@ -373,6 +374,50 @@ void __init do_initcalls(void)
         (*call)();
 }
 
+static unsigned int __read_mostly major_version;
+static unsigned int __read_mostly minor_version;
+
+static HYPFS_DIR_INIT(buildinfo, "buildinfo");
+static HYPFS_DIR_INIT(compileinfo, "compileinfo");
+static HYPFS_DIR_INIT(version, "version");
+static HYPFS_UINT_INIT(major, "major", major_version);
+static HYPFS_UINT_INIT(minor, "minor", minor_version);
+static HYPFS_STRING_INIT(changeset, "changeset");
+static HYPFS_STRING_INIT(compiler, "compiler");
+static HYPFS_STRING_INIT(compile_by, "compile_by");
+static HYPFS_STRING_INIT(compile_date, "compile_date");
+static HYPFS_STRING_INIT(compile_domain, "compile_domain");
+static HYPFS_STRING_INIT(extra, "extra");
+
+static int __init buildinfo_init(void)
+{
+    hypfs_add_dir(&hypfs_root, &buildinfo, true);
+
+    hypfs_string_set_reference(&changeset, xen_changeset());
+    hypfs_add_leaf(&buildinfo, &changeset, true);
+
+    hypfs_add_dir(&buildinfo, &compileinfo, true);
+    hypfs_string_set_reference(&compiler, xen_compiler());
+    hypfs_string_set_reference(&compile_by, xen_compile_by());
+    hypfs_string_set_reference(&compile_date, xen_compile_date());
+    hypfs_string_set_reference(&compile_domain, xen_compile_domain());
+    hypfs_add_leaf(&compileinfo, &compiler, true);
+    hypfs_add_leaf(&compileinfo, &compile_by, true);
+    hypfs_add_leaf(&compileinfo, &compile_date, true);
+    hypfs_add_leaf(&compileinfo, &compile_domain, true);
+
+    major_version = xen_major_version();
+    minor_version = xen_minor_version();
+    hypfs_add_dir(&buildinfo, &version, true);
+    hypfs_string_set_reference(&extra, xen_extra_version());
+    hypfs_add_leaf(&version, &extra, true);
+    hypfs_add_leaf(&version, &major, true);
+    hypfs_add_leaf(&version, &minor, true);
+
+    return 0;
+}
+__initcall(buildinfo_init);
+
 # define DO(fn) long do_##fn
 
 #endif
-- 
2.16.4


