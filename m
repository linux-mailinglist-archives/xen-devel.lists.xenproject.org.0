Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C877E1D90DD
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 09:21:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jawZA-0004rY-Un; Tue, 19 May 2020 07:21:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aMO8=7B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jawZ9-0004r0-FO
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 07:21:31 +0000
X-Inumbo-ID: 5110d970-99a1-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5110d970-99a1-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 07:21:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6607B227;
 Tue, 19 May 2020 07:21:13 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v10 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
Date: Tue, 19 May 2020 09:21:02 +0200
Message-Id: <20200519072106.26894-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200519072106.26894-1-jgross@suse.com>
References: <20200519072106.26894-1-jgross@suse.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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

V8:
- add dependency top CONFIG_HYPFS
- use macro for definition of leaf (Jan Beulich)

V9:
- adjust type of xen_config_data (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                   |  2 ++
 docs/misc/hypfs-paths.pandoc |  4 ++++
 xen/common/Kconfig           | 11 +++++++++++
 xen/common/Makefile          | 12 ++++++++++++
 xen/common/kernel.c          | 11 +++++++++++
 xen/include/xen/kernel.h     |  3 +++
 6 files changed, 43 insertions(+)

diff --git a/.gitignore b/.gitignore
index 6171b3b43f..b8bdb25040 100644
--- a/.gitignore
+++ b/.gitignore
@@ -298,6 +298,8 @@ xen/arch/*/efi/boot.c
 xen/arch/*/efi/compat.c
 xen/arch/*/efi/efi.h
 xen/arch/*/efi/runtime.c
+xen/common/config_data.S
+xen/common/config.gz
 xen/include/headers*.chk
 xen/include/asm
 xen/include/asm-*/asm-offsets.h
diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index d730caf394..9a76bc383b 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -135,6 +135,10 @@ Information about the compile domain.
 
 The compiler used to build Xen.
 
+#### /buildinfo/config = STRING [CONFIG_HYPFS_CONFIG]
+
+The contents of the `xen/.config` file at the time of the hypervisor build.
+
 #### /buildinfo/version/
 
 A directory containing version information of the hypervisor.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index e768ea36b2..065f2ee454 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -127,6 +127,17 @@ config HYPFS
 
 	  If unsure, say Y.
 
+config HYPFS_CONFIG
+	bool "Provide hypervisor .config via hypfs entry"
+	default y
+	depends on HYPFS
+	---help---
+	  When enabled the contents of the .config file used to build the
+	  hypervisor are provided via the hypfs entry /buildinfo/config.
+
+	  Disable this option in case you want to spare some memory or you
+	  want to hide the .config contents from dom0.
+
 config KEXEC
 	bool "kexec support"
 	default y
diff --git a/xen/common/Makefile b/xen/common/Makefile
index bf7d0e25a3..3d61239fbf 100644
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
index db7bd23fcb..f464fe02ed 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -390,6 +390,10 @@ static HYPFS_STRING_INIT(compile_date, "compile_date");
 static HYPFS_STRING_INIT(compile_domain, "compile_domain");
 static HYPFS_STRING_INIT(extra, "extra");
 
+#ifdef CONFIG_HYPFS_CONFIG
+static HYPFS_STRING_INIT(config, "config");
+#endif
+
 static int __init buildinfo_init(void)
 {
     hypfs_add_dir(&hypfs_root, &buildinfo, true);
@@ -415,6 +419,13 @@ static int __init buildinfo_init(void)
     hypfs_add_leaf(&version, &major, true);
     hypfs_add_leaf(&version, &minor, true);
 
+#ifdef CONFIG_HYPFS_CONFIG
+    config.e.encoding = XEN_HYPFS_ENC_GZIP;
+    config.e.size = xen_config_data_size;
+    config.content = xen_config_data;
+    hypfs_add_leaf(&buildinfo, &config, true);
+#endif
+
     return 0;
 }
 __initcall(buildinfo_init);
diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index 548b64da9f..8cd142032d 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -100,5 +100,8 @@ extern enum system_state {
 
 bool_t is_active_kernel_text(unsigned long addr);
 
+extern const char xen_config_data[];
+extern const unsigned int xen_config_data_size;
+
 #endif /* _LINUX_KERNEL_H */
 
-- 
2.26.1


