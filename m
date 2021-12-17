Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890194794DC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248845.429257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIye-0000z3-6x; Fri, 17 Dec 2021 19:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248845.429257; Fri, 17 Dec 2021 19:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIye-0000vd-2A; Fri, 17 Dec 2021 19:33:12 +0000
Received: by outflank-mailman (input) for mailman id 248845;
 Fri, 17 Dec 2021 19:33:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1myIyc-0007M8-JW
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:33:10 +0000
Received: from sender3-of-o50.zoho.com (sender3-of-o50.zoho.com
 [136.143.184.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29af6198-5f70-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 20:33:09 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639769529700190.38888754714014;
 Fri, 17 Dec 2021 11:32:09 -0800 (PST)
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
X-Inumbo-ID: 29af6198-5f70-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1639769531; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FtIm41ruqTOp600k8iYbUBpQv3WAX7IwUdUHTw7zP4Z0Zwww4S0m8CW6zUfCts269WM9CieFWRUQVe3faX4y4abhxKuTRBXvqpjK9P7nEabSfs3lDZFLc4xzFCdPWwumDGXJSRIyhJIgCTR6BVOazSZZtj4OQnBca3fJIbyEhOI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639769531; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=UFJoq4z4heOloPDSzW6Y95pMjws+Z0IPoCLVo0DLBwc=; 
	b=TknipIJcJuInWq7Qo2q68MJViEys3ao5EbmBT6NiLaUK0O4p4uVbVDdqlPLucI2CaUPc+lZLmzafA8lXZz1xh655dwNMe5TWhDnaomqJV9GXWL8UBYyGx9CHMjWMxjNGDejz0eNi+hTpmXXMbedTfLDkTPgSJjl2Ly5jU2l0C9U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639769531;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UFJoq4z4heOloPDSzW6Y95pMjws+Z0IPoCLVo0DLBwc=;
	b=AfK9C+bK4+ZpY4RCIV0wq23hN8eXzLZLpn3LTPAcd5/vOsKyJ/knuJh6yOYfKNtt
	gnm/Bb1RFzSVY6PwuUKaFQGukqaLbXUrpGM09GOBxYUjq1XQFDsc7f5Paa5+Phtgul5
	HZPG8poVOpgUNE1ZWCINdpIeFTO6KtNUChS1a5v4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.clark@starlab.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC 04/10] device-tree: split agnostic device-tree from arm
Date: Fri, 17 Dec 2021 18:34:30 -0500
Message-Id: <20211217233437.13791-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217233437.13791-1-dpsmith@apertussolutions.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit is purely for RFC to highlight some concerns and changes necessary
in order for hyperlaunch to utilize device tree as the boot configuration
container.

Despite being in common, the core device tree support enabled through
CONFIG_HAS_DEVICE_TREE will not build for an x86 configuration. This is due to
the fact that despite `struct device` appearing to be intended as a common data
structure is in fact unique on x86 and Arm. There is code in
xen/common/device_tree.c and include/xen/iommu.h that uses struct members found
in Arm's `struct device` that are not present in x86's version. This obviously
ends in compilation errors when enabling CONFIG_HAS_DEVICE_TREE on x86.

As a result this commit seeks to separate between requiring the ability to
parse DTB files and obtaining hardware definition from those DTB files. The
Kconfig parameter CORE_DEVICE_TREE was introduced for when only the former is
necessary and not the latter. It specifically allows for the inclusion of the
device tree parsing code without enabling the areas that make use of Arm
specific `struct device`.

For the RFC when the Arm specific `struct device` is referenced within device
tree parsing code, check for Arm has been added as an interim solution until a
long term solution, that is beyond the scope of the hyperlaunch patch set, can
be proposed and implemented.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/common/Kconfig            | 5 +++++
 xen/common/Makefile           | 4 ++--
 xen/common/device_tree.c      | 2 ++
 xen/include/xen/device_tree.h | 4 ++++
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5e6aad644e..aece21c9e5 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -31,8 +31,12 @@ config HAS_ALTERNATIVE
 config HAS_COMPAT
 	bool
 
+config CORE_DEVICE_TREE
+	bool
+
 config HAS_DEVICE_TREE
 	bool
+	select CORE_DEVICE_TREE
 
 config HAS_EX_TABLE
 	bool
@@ -333,6 +337,7 @@ config ARGO
 
 config HYPERLAUNCH
 	bool "Hyperlaunch support (UNSUPPORTED)" if UNSUPPORTED
+	select CORE_DEVICE_TREE
 	---help---
 	  Enables launch of multiple VMs at host boot as an alternative
 	  method of starting a Xen system.
diff --git a/xen/common/Makefile b/xen/common/Makefile
index a6337e065a..f22aec72a0 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
-obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
+obj-$(CONFIG_CORE_DEVICE_TREE) += device_tree.o
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
@@ -73,7 +73,7 @@ obj-y += sched/
 obj-$(CONFIG_UBSAN) += ubsan/
 
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
-obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
+obj-$(CONFIG_CORE_DEVICE_TREE) += libfdt/
 
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(BASEDIR)/)$(KCONFIG_CONFIG)
 config.gz: $(CONF_FILE)
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 4aae281e89..d92fad2998 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2012,9 +2012,11 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
             ((char *)pp->value)[sz - 1] = 0;
             dt_dprintk("fixed up name for %s -> %s\n", pathp,
                        (char *)pp->value);
+#ifdef CONFIG_ARM
             /* Generic device initialization */
             np->dev.type = DEV_DT;
             np->dev.of_node = np;
+#endif
         }
     }
     if ( allnextpp )
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index fd6cd00b43..ca9f7672e9 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -101,9 +101,12 @@ struct dt_device_node {
      */
     struct list_head domain_list;
 
+#ifdef CONFIG_ARM
     struct device dev;
+#endif
 };
 
+#ifdef CONFIG_ARM
 #define dt_to_dev(dt_node)  (&(dt_node)->dev)
 
 static inline struct dt_device_node *dev_to_dt(struct device *dev)
@@ -112,6 +115,7 @@ static inline struct dt_device_node *dev_to_dt(struct device *dev)
 
     return container_of(dev, struct dt_device_node, dev);
 }
+#endif
 
 #define MAX_PHANDLE_ARGS 16
 struct dt_phandle_args {
-- 
2.20.1


