Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166F14794CC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:32:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248832.429224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIxw-0007lE-D0; Fri, 17 Dec 2021 19:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248832.429224; Fri, 17 Dec 2021 19:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIxw-0007hg-9Y; Fri, 17 Dec 2021 19:32:28 +0000
Received: by outflank-mailman (input) for mailman id 248832;
 Fri, 17 Dec 2021 19:32:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1myIxt-0007M8-T0
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:32:26 +0000
Received: from sender3-of-o51.zoho.com (sender3-of-o51.zoho.com
 [136.143.184.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f0f9589-5f70-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 20:32:25 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639769524862112.54010405527049;
 Fri, 17 Dec 2021 11:32:04 -0800 (PST)
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
X-Inumbo-ID: 0f0f9589-5f70-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1639769527; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ljqU0Yxk3HOkGSLVjYIS2HhHILvsIGXieSamAN+iNBVQ9PVTmH6ko/dwbVmzJb9uWWixOY8DncM+cOj1W3e3Q8BrI49IAr4u7ozv0kwr81VrKhCPmqs+R6PBRJK6kLHsbqN0mH9lccbTQ9ewTLLOg3x7ueCupcTvjz1+ujXLpfo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639769527; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/VbuytX0Q+D4LsMewdpZJiBY6pOL9LLoWZ6MNlm7AeU=; 
	b=acWHGoec9Ohbik9eZLOlMvS1ou5Gi8WYhZjPTx6gfGGSEsksx5C0HdGmXEHdBllp1SPBa1jIt4SJpFKuC+3DXswaeJeZ85Nl5BV4xDDktK7L7dDTsJ54UPxf4fTx9vsjdu9pWwaqbgwvcmF7CyEcwtl7uh0CIA5W3BEwRZ4i+A8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639769527;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/VbuytX0Q+D4LsMewdpZJiBY6pOL9LLoWZ6MNlm7AeU=;
	b=asPoXZYjr1hLb56DR0cGtZIIuASHvFviAHV2eIRSizQBKqfv6dt2v462I/kFZ/TS
	ZWPP8zdV2w3nbXHrvewYoT7HmxiD3mDxoC1J3LPuwWs6Lu125ss8+ThOK2KDdHPziNU
	ioD2dR5f7aARK0SL+M1F4z4aRVdAgRpL5BkMQoEY=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
	Christopher Clark <christopher.clark@starlab.io>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC 01/10] introduce hyperlaunch kconfig and core
Date: Fri, 17 Dec 2021 18:34:27 -0500
Message-Id: <20211217233437.13791-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217233437.13791-1-dpsmith@apertussolutions.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Christopher Clark <christopher.w.clark@gmail.com>

Add a CONFIG_HYPERLAUNCH to allow enabling/disabling the hyperlaunch code
paths. Introduce an initial use of the hyperlaunch_enabled variable to suppress
the warning about multiple initrd candidates when multiboot modules are
detected when the hyperlaunch boolean is true.

Added to common code since this option will apply to all architectures.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c    |  4 +++-
 xen/common/Kconfig      | 10 ++++++++++
 xen/common/Makefile     |  1 +
 xen/common/setup.c      |  8 ++++++++
 xen/include/xen/setup.h | 14 ++++++++++++++
 5 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/setup.c
 create mode 100644 xen/include/xen/setup.h

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f40a9fe5d3..190d7aefb5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -26,6 +26,7 @@
 #include <xen/nodemask.h>
 #include <xen/virtual_region.h>
 #include <xen/watchdog.h>
+#include <xen/setup.h>
 #include <public/version.h>
 #ifdef CONFIG_COMPAT
 #include <compat/platform.h>
@@ -1891,7 +1892,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? "" : "not ");
 
     initrdidx = find_first_bit(module_map, mbi->mods_count);
-    if ( bitmap_weight(module_map, mbi->mods_count) > 1 )
+    if ( !hyperlaunch_enabled &&
+         bitmap_weight(module_map, mbi->mods_count) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
                initrdidx);
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index db687b1785..5e6aad644e 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -331,6 +331,16 @@ config ARGO
 
 	  If unsure, say N.
 
+config HYPERLAUNCH
+	bool "Hyperlaunch support (UNSUPPORTED)" if UNSUPPORTED
+	---help---
+	  Enables launch of multiple VMs at host boot as an alternative
+	  method of starting a Xen system.
+
+	  This feature is currently experimental.
+
+	  If unsure, say N.
+
 source "common/sched/Kconfig"
 
 config CRYPTO
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 141d7d40d3..a6337e065a 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -35,6 +35,7 @@ obj-y += rangeset.o
 obj-y += radix-tree.o
 obj-y += rcupdate.o
 obj-y += rwlock.o
+obj-y += setup.o
 obj-y += shutdown.o
 obj-y += softirq.o
 obj-y += smp.o
diff --git a/xen/common/setup.c b/xen/common/setup.c
new file mode 100644
index 0000000000..e18ea14fe0
--- /dev/null
+++ b/xen/common/setup.c
@@ -0,0 +1,8 @@
+#include <xen/types.h>
+#include <xen/init.h>
+
+#ifdef CONFIG_HYPERLAUNCH
+
+bool __initdata hyperlaunch_enabled;
+
+#endif
diff --git a/xen/include/xen/setup.h b/xen/include/xen/setup.h
new file mode 100644
index 0000000000..6fbe87860e
--- /dev/null
+++ b/xen/include/xen/setup.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef XEN_SETUP_H
+#define XEN_SETUP_H
+
+#include <asm/setup.h>
+
+#ifdef CONFIG_HYPERLAUNCH
+extern bool hyperlaunch_enabled;
+#else
+#define hyperlaunch_enabled false
+#endif
+
+#endif /* XEN_SETUP_H */
-- 
2.20.1


