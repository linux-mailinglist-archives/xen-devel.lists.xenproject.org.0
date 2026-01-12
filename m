Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B3AD16C52
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 07:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201014.1516791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfXc0-0004wt-3x; Tue, 13 Jan 2026 06:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201014.1516791; Tue, 13 Jan 2026 06:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfXbz-0004rx-Vx; Tue, 13 Jan 2026 06:10:39 +0000
Received: by outflank-mailman (input) for mailman id 1201014;
 Mon, 12 Jan 2026 22:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O4l3=7R=deutnet.info=agriveaux@srs-se1.protection.inumbo.net>)
 id 1vfQf0-0002f2-3N
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 22:45:18 +0000
Received: from srv1.deutnet.info (srv1.deutnet.info [2a01:4f8:c2c:6846::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d0feeac-f008-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 23:45:16 +0100 (CET)
Received: from agriveaux by srv1.deutnet.info with local (Exim 4.98.2)
 (envelope-from <agriveaux@deutnet.info>) id 1vfQex-00000003wqR-0nRg;
 Mon, 12 Jan 2026 23:45:15 +0100
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
X-Inumbo-ID: 5d0feeac-f008-11f0-9ccf-f158ae23cfc8
Date: Mon, 12 Jan 2026 23:45:15 +0100
From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, agriveaux@deutnet.info
Subject: [PATCH XEN] tools: Update HVM example whith AHCI, stdvga, tablet and
 UEFI.
Message-ID: <aWV5e1kIRkCecPcm@deutnet.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Update HVM example file whith options:
- AHCI
- stdvga
- tablet
- UEFI

Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
---
 tools/examples/xlexample.hvm | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/examples/xlexample.hvm b/tools/examples/xlexample.hvm
index df9fe07653..8b615edb5c 100644
--- a/tools/examples/xlexample.hvm
+++ b/tools/examples/xlexample.hvm
@@ -41,7 +41,20 @@ vif = [ '' ]
 # A list of `diskspec' entries as described in
 # docs/misc/xl-disk-configuration.txt
 disk = [ '/dev/vg/guest-volume,raw,xvda,rw' ]
+# Enable to use an AHCI emulated disk instead of IDE
+# (AHCI via emulated ich9 disk controller)
+#hdtype=ahci
+
+# Enable standard vga card for resolution better than 1280x1024 at 32bpp.
+#vga="stdvga"
 
 # Guest VGA console configuration, either SDL or VNC
 sdl = 1
 #vnc = 1
+
+# Enable to use a pointer device using absolute coordinates
+# (VNC work better in this mode).
+#usbdevice=['tablet']
+
+# Enable UEFI via ovmf firmware.
+#firmware="ovmf"
-- 
2.47.3


