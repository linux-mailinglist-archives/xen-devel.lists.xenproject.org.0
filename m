Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2691B249A7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 14:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079871.1440553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAoN-0005WX-Sq; Wed, 13 Aug 2025 12:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079871.1440553; Wed, 13 Aug 2025 12:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAoN-0005Uy-Pq; Wed, 13 Aug 2025 12:42:35 +0000
Received: by outflank-mailman (input) for mailman id 1079871;
 Wed, 13 Aug 2025 12:42:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1rXT=2Z=bounce.vates.tech=bounce-md_30504962.689c8833.v1-55b4d820cc2b4db4851404e9de6bfbb6@srs-se1.protection.inumbo.net>)
 id 1umAoM-0005UN-9f
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 12:42:34 +0000
Received: from mail145-23.atl61.mandrillapp.com
 (mail145-23.atl61.mandrillapp.com [198.2.145.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8b04216-7842-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 14:42:29 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-23.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4c27LW3xBzz1XLF5j
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 12:42:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 55b4d820cc2b4db4851404e9de6bfbb6; Wed, 13 Aug 2025 12:42:27 +0000
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
X-Inumbo-ID: f8b04216-7842-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755088947; x=1755358947;
	bh=IEtpRl8bINQORp9a9aA+RHl0fhkvpOHNK0UFdgc2xjw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ymK08R3waAjDw6ob0/G3sTASazOCqCla0G0gKlmO4tw+Lqac9DU0osvo+ITZ53Inx
	 A/swQgbHbyCSuW3SdNcZcAL8jY17c+YhrxjoGJTrEzNuan9L/+d5CNcwv5jmLA9NLv
	 pfjthpPiAunkV4xvNoTkviEekl88MPKJ3QBBbxI0uPWtQliSYj0UXOD1usV+lTBcGm
	 L3VgFHKLoFq/PmkJhSN95tekN2DXDmR3ItmMzPZbQKIxGuUF+sHH8HuDw1wTG5TPTI
	 ik8OFrKmm7Jfxye+ZA3ZLFKwSrvgTmljYiU1iEY69btCUmPol3aoIxRTszJXYNCEA7
	 q+e/LbAvJ0QkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755088947; x=1755349447; i=teddy.astie@vates.tech;
	bh=IEtpRl8bINQORp9a9aA+RHl0fhkvpOHNK0UFdgc2xjw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=n21Gt+9FbkAn48e7dmkHVPUrd5wZz8CNG8Tas3gEffJ6OoNXd86Wh1MlFoKavQP1C
	 QDh+NbZgBVit6mFMThNzdLDTtBObRyJaY7oef/Acbqke+/qopWIhTN/s8OZ5fYJuuE
	 KiK98u1Lyn79TaozEa36W6Nn/KOoPuKmnYlQ+RwDek5ksMulk+8XXIvfl+mLtYeJ/A
	 yPGGvuZJCUca3K8ciMiO8EuzVLl9LojjilrTdIY3GApG9m9qnTRjzbBUyQknFJqkaA
	 x3OWmJUllBUgLAHk9D0oxibcIz3XR6NdHfAAoKf97dQzpkyDqffB6UgwesL7SRdk8X
	 RF/e+o0niGF2g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20libxl:=20Add=20virtio=20(virtio-vga)=20display=20support?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755088946657
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>
Message-Id: <95a54f6c4296b03db5265da50a98f03c53858677.1755088831.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.55b4d820cc2b4db4851404e9de6bfbb6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250813:md
Date: Wed, 13 Aug 2025 12:42:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Add "virtio" vga which uses the virtio-vga device provided by upstream QEMU.
It is VGA compatible and can be enlightened with virtio-gpu drivers which are
available since Linux 4.4 and as a part of KVM Windows drivers.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 CHANGELOG.md                     | 1 +
 docs/man/xl.cfg.5.pod.in         | 6 +++++-
 tools/libs/light/libxl_dm.c      | 3 +++
 tools/libs/light/libxl_types.idl | 1 +
 tools/xl/xl_parse.c              | 2 ++
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..88ff5b9a77 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -26,6 +26,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
      capability usage is not yet supported on PVH dom0).
    - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
+   - Virtio-VGA display support for HVM guests
 
  - On Arm:
     - Ability to enable stack protector
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index f0c920b39d..445064ff6e 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2566,6 +2566,8 @@ default and minimum is 8 MB.
 For QXL vga, both the default and minimal are 128MB.
 If B<videoram> is set less than 128MB, an error will be triggered.
 
+When using virtio, this parameter is ignored.
+
 =item B<stdvga=BOOLEAN>
 
 Specifies a standard VGA card with VBE (VESA BIOS Extensions) as the
@@ -2579,7 +2581,7 @@ B<This option is deprecated, use vga="stdvga" instead>.
 =item B<vga="STRING">
 
 Selects the emulated video card.
-Options are: B<none>, B<stdvga>, B<cirrus> and B<qxl>.
+Options are: B<none>, B<stdvga>, B<cirrus>, B<qxl> and B<virtio>.
 The default is B<cirrus>.
 
 In general, QXL should work with the Spice remote display protocol
@@ -2587,6 +2589,8 @@ for acceleration, and a QXL driver is necessary in the guest in that case.
 QXL can also work with the VNC protocol, but it will be like a standard
 VGA card without acceleration.
 
+virtio uses the VGA compatible variant of virtio-gpu.
+
 =item B<vnc=BOOLEAN>
 
 Allow access to the display via the VNC protocol.  This enables the
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 511ec76a65..a561ba695a 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1210,6 +1210,9 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                 GCSPRINTF("qxl-vga,vram_size_mb=%"PRIu64",ram_size_mb=%"PRIu64,
                 (b_info->video_memkb/2/1024), (b_info->video_memkb/2/1024) ) );
             break;
+        case LIBXL_VGA_INTERFACE_TYPE_VIRTIO:
+            flexarray_append_pair(dm_args, "-device", "virtio-vga");
+            break;
         default:
             LOGD(ERROR, guest_domid, "Invalid emulated video card specified");
             return ERROR_INVAL;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index a6030a2dbd..577fd6d90d 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -238,6 +238,7 @@ libxl_vga_interface_type = Enumeration("vga_interface_type", [
     (2, "STD"),
     (3, "NONE"),
     (4, "QXL"),
+    (5, "VIRTIO"),
     ], init_val = "LIBXL_VGA_INTERFACE_TYPE_UNKNOWN")
 
 libxl_vendor_device = Enumeration("vendor_device", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 90c9386f5b..cc68d42dca 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2833,6 +2833,8 @@ skip_usbdev:
                 b_info->u.hvm.vga.kind = LIBXL_VGA_INTERFACE_TYPE_NONE;
             } else if (!strcmp(buf, "qxl")) {
                 b_info->u.hvm.vga.kind = LIBXL_VGA_INTERFACE_TYPE_QXL;
+            } else if (!strcmp(buf, "virtio")) {
+                b_info->u.hvm.vga.kind = LIBXL_VGA_INTERFACE_TYPE_VIRTIO;
             } else {
                 fprintf(stderr, "Unknown vga \"%s\" specified\n", buf);
                 exit(1);
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


