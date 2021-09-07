Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CCB40239A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 08:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180441.327109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUyI-0002aE-O3; Tue, 07 Sep 2021 06:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180441.327109; Tue, 07 Sep 2021 06:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUyI-0002YD-KE; Tue, 07 Sep 2021 06:52:42 +0000
Received: by outflank-mailman (input) for mailman id 180441;
 Tue, 07 Sep 2021 06:52:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qx60=N5=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mNUyH-0002Y7-F7
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 06:52:41 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 31791194-0fa8-11ec-b0d7-12813bfff9fa;
 Tue, 07 Sep 2021 06:52:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B06AF31B;
 Mon,  6 Sep 2021 23:52:39 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DA4C3F5A1;
 Mon,  6 Sep 2021 23:52:38 -0700 (PDT)
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
X-Inumbo-ID: 31791194-0fa8-11ec-b0d7-12813bfff9fa
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH] xen/design: Add design for EFI dom0less system start
Date: Tue,  7 Sep 2021 07:52:28 +0100
Message-Id: <20210907065228.21794-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Add a design describing a proposal to improve the EFI
configuration file, adding keywords to describe domU
guests and allowing to start a dom0less system.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/designs/efi-arm-dom0less.md | 105 +++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 docs/designs/efi-arm-dom0less.md

diff --git a/docs/designs/efi-arm-dom0less.md b/docs/designs/efi-arm-dom0less.md
new file mode 100644
index 0000000000..8d8fa2243f
--- /dev/null
+++ b/docs/designs/efi-arm-dom0less.md
@@ -0,0 +1,105 @@
+# Xen EFI configuration file
+
+The current configuration file used by Xen when it is started as an EFI
+application is considering only the dom0 guest and doesn't have any
+property to describe and load in memory domU guests.
+Hence currently it's impossible to start a dom0less system using EFI.
+
+# Objective
+
+This document describes the proposed improvement to the Xen EFI
+configuration file to list properly both the dom0 guest and the domU
+guests as well.
+The final goal is to be able to start a dom0less system using EFI.
+
+# Current Xen EFI configuration file
+
+The current configuration file is described by the documentation page
+https://xenbits.xenproject.org/docs/unstable/misc/efi.html.
+
+Here an example:
+
+```
+[global]
+default=section1
+
+[section1]
+options=console=vga,com1 com1=57600 loglvl=all noreboot
+kernel=vmlinuz-3.0.31-0.4-xen [domain 0 command line options]
+ramdisk=initrd-3.0.31-0.4-xen
+xsm=<filename>
+dtb=devtree.dtb
+```
+
+# Proposed improvement
+
+The proposed improvement to the current configuration file is the
+introduction of new keywords to describe additional domUs.
+
+Here follows the proposed new keywords:
+  - domu#_kernel=<kernel file> [domU command line options]
+    - Mandatory kernel file for the domU#
+  - domu#_ramdisk=<ramdisk file>
+    - Optional ramdisk file for the domU#
+  - domu#_dtb=<dtb file>
+    - Optional dtb fragment file for the domU#, it is used for device
+      assignment (passthrough).
+  - domu#_property=cpus=2
+    - Properties that should be added to the dtb in the domU node to
+      properly describe the domU guest. Refer to the documentation:
+      https://xenbits.xenproject.org/docs/unstable/misc/arm/device-tree/booting.txt,
+      section "Creating Multiple Domains directly from Xen".
+
+For all the keywords above, the # is a number that uniquely identifies
+the guest.
+The keywords domu#_kernel, domu#_ramdisk, domu#_dtb are unique, therefore there
+must not be specified the same keyword twice in a section.
+The # number is not enforcing any domid, it is just used to link each property
+to the right guest, so there can be domu1_* guests that are started with domid 2
+and so on.
+
+The domu#_property can appear multiple times and it specifies an additional
+property to be listed in the domU node inside the device tree, Xen will
+not check if the same content is specified multiple times.
+
+There are some property whose name starts with an hash symbol (#address-cells,
+#size-cells), in this case the line will be considered as a comment, so to
+specify them, they have to be listed without the hash symbol, the documentation
+will be updated as well to see the implemented handling of these special
+properties.
+
+# Example of a configuration file describing a dom0less system
+
+The following configuration file is describing a dom0less system starting two
+guests.
+
+```
+[global]
+default=xen
+
+[xen]
+# Xen boot arguments
+options=noreboot console=dtuart dtuart=serial0 bootscrub=0
+# Xen device tree
+dtb=devtree.dtb
+
+# Guest 1
+domu1_property=address-cells=2
+domu1_property=size-cells=2
+domu1_kernel=Image-domu1.bin console=ttyAMA0 root=/dev/ram0 rw
+domu1_property=cpus=1
+domu1_property=memory=0xC0000
+domu1_dtb=domu.dtb
+
+# Guest 2
+domu2_kernel=Image-domu2.bin console=ttyAMA0 root=/dev/ram0 rw
+domu2_property=cpus=2
+domu2_property=memory=0x100000
+domu2_property=vpl011
+```
+
+In this example the Guest 1 is loading Image-domu1.bin as kernel and it is using
+the passed boot arguments, it is also loading a device tree snippet for device
+passthrough.
+The second guest, Guest 2, is using another kernel and it will use the vpl011
+device.
-- 
2.17.1


