Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6891102B
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 01:33:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLyg1-0000IO-1J; Wed, 01 May 2019 23:30:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/tq=TB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLyfz-0000IJ-AY
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 23:30:11 +0000
X-Inumbo-ID: 0ef92648-6c69-11e9-843c-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0ef92648-6c69-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 23:30:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 861742081C;
 Wed,  1 May 2019 23:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556753408;
 bh=Z6M/pf7bPFGhq4qyB2zUB0aMEBOgl1UBNwJ9SHMrByQ=;
 h=Date:From:To:cc:Subject:From;
 b=vglj5FofD2nzqLpubbn1Ie4vf/ky4TW6eiEfVu6MggwytHItlTR1L1U4YfHuF2kGG
 89jdv5KPXMrV4JmQ69NN6H4nPIFnJmluxDMyc+/1xc38RjKBX5DpKITYfrYVxCjPpS
 qKpOS68pFtnDaoA752vo+ypk6m7UWNLtfZNQ/Ht8=
Date: Wed, 1 May 2019 16:30:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: julien.grall@arm.com
Message-ID: <alpine.DEB.2.10.1905011628310.23881@sstabellini-ThinkPad-X260>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-239192802-1556753337=:23881"
Content-ID: <alpine.DEB.2.10.1905011629040.23881@sstabellini-ThinkPad-X260>
Subject: [Xen-devel] [PATCH] xen/arm: improve dom0less documentation
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-239192802-1556753337=:23881
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1905011629041.23881@sstabellini-ThinkPad-X260>

Improve Dom0-less documentation: include a complete configuration
example.

Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>

diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
index 4e342b7..e076e37 100644
--- a/docs/features/dom0less.pandoc
+++ b/docs/features/dom0less.pandoc
@@ -23,6 +23,70 @@ booted and the Xen tools to become available, domains created by Xen
 this way are started right away in parallel. Hence, their boot time is
 typically much shorter.
 
+
+Configuration
+-------------
+
+### Loading binaries into memory ###
+
+U-Boot needs to load not just Xen, the device tree binary, the dom0 kernel and
+ramdisk. It also needs to load the kernel and ramdisk of any additional domains
+to boot. For example if this is the bootcmd for Xen and Dom0:
+
+    tftpb 0x1280000 xen.dtb
+    tftpb 0x0x80000 xen-Image
+    tftpb 0x1400000 xen.ub
+    tftpb 0x9000000 xen-rootfs.cpio.gz.u-boot
+
+    bootm 0x1400000 0x9000000 0x1280000
+
+If we want to add one DomU with Image-DomU as the DomU kernel
+and ramdisk-DomU as DomU ramdisk:
+
+    tftpb 0x1280000 xen.dtb
+    tftpb 0x80000 xen-Image
+    tftpb 0x1400000 xen.ub
+    tftpb 0x9000000 xen-rootfs.cpio.gz.u-boot
+
+    tftpb 0x2000000 Image-DomU
+    tftpb 0x3000000 ramdisk-DomU
+
+    bootm 0x1400000 0x9000000 0x1280000
+
+
+### Device Tree configuration ###
+
+In addition to loading the necessary binaries, we also need to advertise
+the presence of the additional VM and its configuration. It is done via
+device tree adding a node under /chosen as follows:
+
+    domU1 {
+        compatible = "xen,domain";
+        memory = <0x20000>;
+        cpus = 1;
+        vpl011;
+
+        module@2000000 {
+            compatible = "multiboot,kernel", "multiboot,module";
+            reg = <0x2000000 0xffffff>;
+            bootargs = "console=ttyAMA0";
+        };
+
+        module@30000000 {
+            compatible = "multiboot,ramdisk", "multiboot,module";
+            reg = <0x3000000 0xffffff>;
+        };
+    };
+
+Where memory is the memory of the VM in KBs, cpus is the number of
+cpus. module@2000000 and module@3000000 advertise where the kernel and
+ramdisk are in memory.
+
+See docs/misc/arm/device-tree/booting.txt for more information.
+
+Limitations
+-----------
+
 Domains started by Xen at boot time currently have the following
 limitations:
 
--8323329-239192802-1556753337=:23881
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-239192802-1556753337=:23881--

