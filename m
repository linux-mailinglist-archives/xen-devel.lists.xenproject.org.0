Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0525AB63DA
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983860.1370053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6Iu-0004oG-Lg; Wed, 14 May 2025 07:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983860.1370053; Wed, 14 May 2025 07:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6Iu-0004m0-H8; Wed, 14 May 2025 07:13:24 +0000
Received: by outflank-mailman (input) for mailman id 983860;
 Wed, 14 May 2025 07:13:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkt7=X6=boeing.com=sookyung.ahn@srs-se1.protection.inumbo.net>)
 id 1uF6It-0004Xa-8z
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:13:23 +0000
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net
 [130.76.20.194]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9142e51-3092-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 09:13:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 54E7DH0Y014578; Wed, 14 May 2025 00:13:17 -0700
Received: from phx-av-01.mbs.boeing.net (phx-av-01.mbs.boeing.net
 [137.136.102.153])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 54E7DDtd014540
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 00:13:14 -0700
Received: from localhost (localhost [127.0.0.1])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 54E7DDpV008750; Wed, 14 May 2025 00:13:13 -0700
Received: from localhost.localdomain ([144.112.81.43])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id
 54E7CtL3007958; Wed, 14 May 2025 00:13:02 -0700
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
X-Inumbo-ID: e9142e51-3092-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1747206797;
	bh=SqhQ9oLNBoOgUzMMxOjrt8HiB1Bp3rr566Xpah5pmvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtyXEAkx21/9WQleAn0FTSHD1Z45whBPDqdu+nbLxqqZS1/7OoQA+AOqdnwHmwq0V
	 5AdBFg7Zc1EA535yxkEACTlVu/3zYltHK3VwZ7vRaYEznVnpZt4AsRG8glqZoIJwYn
	 XmzWfjGTu4+YX/+Iqg7tebvIP38Tj0WI3uxjhREop0IJZ89GAFq4fg0K3XQTNAScSF
	 IwVmDjkeh5nuhqYtLjdvt1+fSJH/BwT8yxeHXWItdu4HcaYnZYKNhfCL/9KahoL0V1
	 HFcI3zEjcSGOcFOZf+NYkGe1960W2l1aUP7KNKbxqubNFjHO2BO9zj7uhRSVA9CNrZ
	 sZnDMtCfFecuw==
From: Sookyung Ahn <sookyung.ahn@boeing.com>
To: xen-devel@lists.xenproject.org
Cc: matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
        Anderson.Choi@boeing.com, brian.j.wood2@boeing.com,
        haesun.kim@boeing.com, Sookyung Ahn <sookyung.ahn@boeing.com>
Subject: [RFC PATCH 2/2] add document minimal_xen_tools.pandoc
Date: Wed, 14 May 2025 07:12:50 +0000
Message-Id: <0267d6a430a11b9387d56514f963b6a5c6033450.1747205627.git.sookyung.ahn@boeing.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747205627.git.sookyung.ahn@boeing.com>
References: <cover.1747205627.git.sookyung.ahn@boeing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

---
 docs/designs/minimal_xen_tools.pandoc | 147 ++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 docs/designs/minimal_xen_tools.pandoc

diff --git a/docs/designs/minimal_xen_tools.pandoc b/docs/designs/minimal_xen_tools.pandoc
new file mode 100644
index 0000000000..32e0e8d002
--- /dev/null
+++ b/docs/designs/minimal_xen_tools.pandoc
@@ -0,0 +1,147 @@
+- [Minimal Xen-tools](#minimal-xen-tools)
+  - [`xen-tools` : full vs minimal](#xen-tools--full-vs-minimal)
+  - [Components of minimal `xen-tools`](#components-of-minimal-xen-tools)
+  - [How to enable minimal `xen-tools`](#how-to-enable-minimal-xen-tools)
+  - [How to include a component which is excluded](#how-to-include-a-component-which-is-excluded)
+    - [Library](#library)
+    - [Tool](#tool)
+
+# Minimal Xen-tools
+
+Purpose : To enhance `xen-tools` for users who require only a minimal subset of its functionality, particularly in safety-critical domains such as aerospace. 
+
+## `xen-tools` : full vs minimal
+
+- total size of **full** `xen-tools` and **minimal** `xen-tools`
+
+|      | full         | minimal        |
+|------| ------------ | ------------ |
+|ipks  | 8.1M (8216K) | **1.3M** (1276K) |
+|image | 26M (25944K) | **4.6M** (4664)K |
+
+## Components of minimal `xen-tools`
+
+| `xen-tools-`        | included | Rationale                                                    | remark  |
+|---------------------| -------- | ------------------------------------------------------------ | ------- |
+| libxencall          | yes      | library to provide hypercall interface                       |         |
+| libxenctrl          | yes      | library to provide interface for the ARINC 653 scheduler     | partially included |
+| libxendevicemodel   | no       | library to support device model. Not needed                  |         |
+| libxenevtchn        | no       | library to support event channel. Not needed with static event channel | |
+| libxenforeignmemory | yes      | library to support  memory management for hypercall buffer                       |         |
+| libxengnttab        | no       | library to support grant table. We are plainning to use static shared memory instaed of grant table to avoid dynamic memory allocation. | |
+| libxenguest         | no       | library to support control and manage the domUs. Not required with dom0less | |
+| libxenhypfs         | no       | library to provide interface for hypervisor fs. We don't access hypervisor fs. | |
+| libxenlight         | no       | library to support `xl`. We don't use `xl` at all            | |
+| libxenstat          | no       | library to monitor statistic data of domUs with `xentop`. We don't use it | |
+| libxenstore         | no       | library to access `XenStore`. We don't use `XenStore`. | |
+| libxenutil          | no       | library to provide common utilities. | |
+| libxenvchan         | no       | library to provide interface for vchan(vitual channel). We don't use vchan | |
+| libxentoolcore      | yes      | managing libraries' handlers                                 |         |
+| libxentoollog       | yes      | library to provide logging interface                         | can be removed |
+| 9pfsd               | no       | network file system protocol.                                | had dependency on `XenStore` |
+| consold             | no       | `ctrl-a` ×3 replaces it                                        |         |
+| dev                 | yes      | header files                                                 |         |
+| flask               | yes      | Xen security policy framework (XSM/FLASK)                    | disabled |
+| flask-tools         | yes      | tools to manage FLASK policy                                 | disabled |
+| fuzz                | no       | FUZZ test tool                                               |         |
+| fsimage             | yes      | file system image generator for domUs; depends on `pygrub`   |         |
+| hvmloader           | no       | legacy BIOS loader for HVM guests                            |         |
+| libacpi             | no       | Advanced Configuration and Power Interface                   | disabled |
+| pygrub              | yes      | bootloader parser for domU kernels                           | enabled |
+| reums               | yes      | tool for failover of domUs via periodic backup; requires `libnl3` | need to check dependency with `libxenlight` (xl) |
+| scripts-block       | yes      | scripts for block device                                     |         |
+| scripts-common      | yes      | scripts for common utilities                                 |         |
+| scripts-network     | yes      | scripts for domU network setup                               |         |
+| shim                | yes      | EFI loader to launch Xen as a bootloader                     | disabled  |
+| xenpaging           | no       | domain paging tools not used                                 |           |
+| xenpmd              | no       | xen power management daemon                                  | had dependency on `XenStore` |
+| xenstored           | no       | Xen Store Daemon providing simple tree-like database         | had dependency on `XenStore`, and event channel |
+| xenwatchdogd        | no       | watchdog daemon. Not needed                                  |           |
+| volatiles           | yes      | runtime files (e.g. sockets, pid) for Xen tools              |           |
+| xencommons          | yes      | startup script for Xen toolstack                             |           |
+| xendomains          | yes      | init scirpt to autostart and shutdown domUs at boot/shutdown |           |
+| xentrace            | no       | trace Xen internal events. kind of debugging and monitoring tool. Not needed |  |
+| xenmon              | no       | live trace monitor                                           | requires `xentrace` |
+
+## How to enable minimal `xen-tools`
+
+- Ensure the following lines are present in `local.conf`:
+
+``` conf
+# Enable minimal-xen-tools mode
+ENABLE_MINIMAL_XEN_TOOLS = "true"
+# Append minimal-xen-tools feature to xen-tools build configuration
+PACKAGECONFIG:append:pn-xen-tools = " minimal-xen-tools"
+```
+
+- `minimal-xen-tools` will be enabled if `ENABLE_MINIMAL_XEN_TOOLS` is set to `true`
+
+## How to include a component which is excluded
+
+### Library
+
+- Modify `xen/tools/libs/Makefile` and `xen/tools/libs/uselibs.mk` as follows to include the library's source code in the build
+
+@xen/tools/libs/Makefile
+
+```makefile
+ifeq ($(CONFIG_MINIMAL_TOOLS),y)
+SUBDIRS-y :=
+SUBDIRS-y += toolcore
+SUBDIRS-y += toollog
+SUBDIRS-y += call
+SUBDIRS-y += foreignmemory
+SUBDIRS-y += ctrl
+SUBDIRS-y += xxx            # include 'xxx' to build 
+endif
+```
+
+@xen/tools/libs/uselibs.mk
+
+```makefile
+ifeq ($(CONFIG_MINIMAL_TOOLS),y)
+    LIBS_LIBS += toolcore
+    USELIBS_toolcore := 
+    LIBS_LIBS += toollog
+    USELIBS_toollog :=
+    LIBS_LIBS += call
+    USELIBS_call := toollog toolcore
+    LIBS_LIBS += foreignmemory
+    USELIBS_foreignmemory := toollog toolcore
+    LIBS_LIBS += ctrl
+    USELIBS_ctrl := toollog call foreignmemory
+    LIBS_LIBS += xxx    # add 'xxx'
+    USELIBS_xxx := toollog toolcore aaa   # dependency of 'xxx'      
+else
+    LIBS_LIBS += toolcore
+
+```
+
+- Modify `xen/tools/libs/ctrl/Makefile.common` if you want to include part of `libxenctrl`
+
+### Tool
+
+- Modify `xen/tools/Makefile` as follows to include the source code in the build
+
+``` makefile
+ifeq ($(CONFIG_MINIMAL_TOOLS),y)
+SUBDIRS-y :=
+SUBDIRS-y += libs
+SUBDIRS-y += flask
+SUBDIRS-y += hotplug
+SUBDIRS-y += xxx          # include 'xxx' to build 
+SUBDIRS-$(CONFIG_X86) += firmware
+SUBDIRS-$(CONFIG_LIBFSIMAGE) += libfsimage
+
+# do not recurse in to a dir we are about to delete
+ifneq "$(MAKECMDGOALS)" "distclean"
+SUBDIRS-$(CONFIG_QEMU_TRAD) += qemu-xen-traditional-dir
+SUBDIRS-$(CONFIG_QEMU_XEN) += qemu-xen-dir
+endif
+#SUBDIRS-y += python
+SUBDIRS-$(CONFIG_PYGRUB) += pygrub
+SUBDIRS-$(OCAML_TOOLS) += ocaml
+endif
+```
+
+- The `xen/tools/configure.ac` file should also be modified appropriately as needed. In this case, you should ensure that updating `configure` file and executing it during the build.
-- 
2.34.1


