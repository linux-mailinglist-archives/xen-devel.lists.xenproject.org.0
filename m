Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F7519C645
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 17:46:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK23I-0003tn-5D; Thu, 02 Apr 2020 15:46:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jjwm=5S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jK23G-0003sa-IQ
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 15:46:42 +0000
X-Inumbo-ID: 1a87c606-74f9-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a87c606-74f9-11ea-b4f4-bc764e2007e4;
 Thu, 02 Apr 2020 15:46:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E8619AE52;
 Thu,  2 Apr 2020 15:46:20 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
Date: Thu,  2 Apr 2020 17:46:12 +0200
Message-Id: <20200402154616.16927-9-jgross@suse.com>
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

Add the /buildinfo/config entry to the hypervisor filesystem. This
entry contains the .config file used to build the hypervisor.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- store data in gzip format
- use binfile mechanism to create data file
- move code to kernel.c

V6:
- add config item for the /buildinfo/config (Jan Beulich)
- make config related variables const in kernel.h (Jan Beulich)

V7:
- update doc (Jan Beulich)
- use "rm -f" in Makefile (Jan Beulich)
---
 .gitignore                   |  2 ++
 docs/misc/hypfs-paths.pandoc |  4 ++++
 xen/common/Kconfig           | 10 ++++++++++
 xen/common/Makefile          | 12 ++++++++++++
 xen/common/kernel.c          | 15 +++++++++++++++
 xen/include/xen/kernel.h     |  3 +++
 6 files changed, 46 insertions(+)

diff --git a/.gitignore b/.gitignore
index fd5610718d..bc8e053ccb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -297,6 +297,8 @@ xen/arch/*/efi/boot.c
 xen/arch/*/efi/compat.c
 xen/arch/*/efi/efi.h
 xen/arch/*/efi/runtime.c
+xen/common/config_data.S
+xen/common/config.gz
 xen/include/headers*.chk
 xen/include/asm
 xen/include/asm-*/asm-offsets.h
diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index e392feff27..f134c505d6 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -133,6 +133,10 @@ Information about the compile domain.
 
 The compiler used to build Xen.
 
+#### /buildinfo/config = STRING [CONFIG_HYPFS_CONFIG]
+
+The contents of the `xen/.config` file at the time of the hypervisor build.
+
 #### /buildinfo/version/
 
 A directory containing version information of the hypervisor.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index a6914fcae9..c3303c8dfe 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -353,6 +353,16 @@ config DOM0_MEM
 
 	  Leave empty if you are not sure what to specify.
 
+config HYPFS_CONFIG
+	bool "Provide hypervisor .config via hypfs entry"
+	default y
+	---help---
+	  When enabled the contents of the .config file used to build the
+	  hypervisor are provided via the hypfs entry /buildinfo/config.
+
+	  Disable this option in case you want to spare some memory or you
+	  want to hide the .config contents from dom0.
+
 config TRACEBUFFER
 	bool "Enable tracing infrastructure" if EXPERT = "y"
 	default y
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 022e5f7ca3..3ae9f3420b 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
 obj-y += bsearch.o
+obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
@@ -73,3 +74,14 @@ obj-$(CONFIG_UBSAN) += ubsan/
 
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
+
+config.gz: ../.config
+	gzip -c $< >$@
+
+config_data.o: config.gz
+
+config_data.S: $(XEN_ROOT)/xen/tools/binfile
+	$(XEN_ROOT)/xen/tools/binfile $@ config.gz xen_config_data
+
+clean::
+	rm -f config_data.S config.gz 2>/dev/null
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index da6e4b4444..4b7bc28afb 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -389,6 +389,16 @@ static HYPFS_STRING_INIT(compile_date, "compile_date");
 static HYPFS_STRING_INIT(compile_domain, "compile_domain");
 static HYPFS_STRING_INIT(extra, "extra");
 
+#ifdef CONFIG_HYPFS_CONFIG
+static struct hypfs_entry_leaf config = {
+    .e.type = XEN_HYPFS_TYPE_STRING,
+    .e.encoding = XEN_HYPFS_ENC_GZIP,
+    .e.name = "config",
+    .e.read = hypfs_read_leaf,
+    .content = &xen_config_data
+};
+#endif
+
 static int __init buildinfo_init(void)
 {
     hypfs_add_dir(&hypfs_root, &buildinfo, true);
@@ -414,6 +424,11 @@ static int __init buildinfo_init(void)
     hypfs_add_leaf(&version, &major, true);
     hypfs_add_leaf(&version, &minor, true);
 
+#ifdef CONFIG_HYPFS_CONFIG
+    config.e.size = xen_config_data_size;
+    hypfs_add_leaf(&buildinfo, &config, true);
+#endif
+
     return 0;
 }
 __initcall(buildinfo_init);
diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index 548b64da9f..02e3281f52 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -100,5 +100,8 @@ extern enum system_state {
 
 bool_t is_active_kernel_text(unsigned long addr);
 
+extern const char xen_config_data;
+extern const unsigned int xen_config_data_size;
+
 #endif /* _LINUX_KERNEL_H */
 
-- 
2.16.4


