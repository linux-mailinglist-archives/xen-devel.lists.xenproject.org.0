Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE8ECB2F3C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 13:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182923.1505735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTJfr-0005B9-9z; Wed, 10 Dec 2025 12:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182923.1505735; Wed, 10 Dec 2025 12:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTJfr-00058A-71; Wed, 10 Dec 2025 12:52:07 +0000
Received: by outflank-mailman (input) for mailman id 1182923;
 Wed, 10 Dec 2025 12:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYpY=6Q=bounce.vates.tech=bounce-md_30504962.69396cf1.v1-245b427f5e91429eb116c3e7049f174d@srs-se1.protection.inumbo.net>)
 id 1vTJfp-000584-84
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 12:52:05 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 061dad58-d5c7-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 13:52:03 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dRFwd4dCwzFCWYyl
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 12:52:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 245b427f5e91429eb116c3e7049f174d; Wed, 10 Dec 2025 12:52:01 +0000
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
X-Inumbo-ID: 061dad58-d5c7-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765371121; x=1765641121;
	bh=8CytmQ/FbULeAYYu18F/ME3HWA3RoSA27CBhy1ssuhs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=FBFmrdHHyvNEZTZn6E9O1kAGLBnCXAFk9qXwvU9lT1QWH07bMzIndmoszQilfuyS/
	 6+9eAUK/fTBidp6+GRLtU4qCngGkolNUzHrm5qOXF+Hnqg6mGB2UtxWqozt5xVobNx
	 lnA8ioAJz7HQVwIjARwI1wczIc3XDPSSGYFngLEvKTPClwRnD9FMAx4qQxjTl7RII3
	 WbiheFTa40zmm7hWsApuI5OmmaKCkWvOMKZraSOZ1zUxo/n3KLUaIHQrpCD9zwHrT7
	 7BCBn2B9tUIpf51GnMcU/rgbYYjaq5PuH2utBL9HG/wUyMdfk7AST7G+jxrE4uP5gN
	 UySAuel8dD5Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765371121; x=1765631621; i=teddy.astie@vates.tech;
	bh=8CytmQ/FbULeAYYu18F/ME3HWA3RoSA27CBhy1ssuhs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=eTb6vlOacSGpXwaRIR5sAPG22/kACXSGrPzNYgsW4v/5T97hTcAuV/Mr3H633MPqU
	 bg8z/fWoW/CZ5BlcUpRAEah2wkivBsgi6BPuytBOq4Rx+50zH1nJFh14BQLDTB2hYR
	 BR6Gg1l+fhsCWIpmE14W5uU7C/RBYXgPQ4XCdAnzEPinzlBTtDbYw1/m4Ybwx8wD1t
	 dPCmKXpM/RvCPyVgLYVDz6pv9GMuEMO7Hg3ADLKurgnfw46rPJG5bdtC3oSTzFGYkD
	 k808djrypQmw4yjcRQ82jDhwrd/sSldq3pU75cn0Yel2GcWzYr3uSJ+nNZ660OhqMz
	 f6se5bl0EJrQA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20libxl:=20Add=20virtio=20(virtio-vga)=20display=20support?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765371120650
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>
Message-Id: <812ef472d775cf69b7ed4bab317df174c03e9ab2.1765371000.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.245b427f5e91429eb116c3e7049f174d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251210:md
Date: Wed, 10 Dec 2025 12:52:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Add "virtio" vga which uses the virtio-vga device provided by upstream QEMU.
It is VGA compatible and can be enlightened with virtio-gpu drivers which are
available since Linux 4.4 and as a part of KVM Windows drivers.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - rebased CHANGELOG.md

 CHANGELOG.md                     | 2 ++
 docs/man/xl.cfg.5.pod.in         | 6 +++++-
 tools/libs/light/libxl_dm.c      | 3 +++
 tools/libs/light/libxl_types.idl | 1 +
 tools/xl/xl_parse.c              | 2 ++
 5 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 3aaf598623..ed1ad61b0f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
 
 ### Added
+- On x86:
+  - Virtio-VGA display support for HVM guests
 
 ### Removed
  - On x86:
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 27c455210b..5952c36886 100644
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
index d64a573ff3..5e704ba25a 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -239,6 +239,7 @@ libxl_vga_interface_type = Enumeration("vga_interface_type", [
     (2, "STD"),
     (3, "NONE"),
     (4, "QXL"),
+    (5, "VIRTIO"),
     ], init_val = "LIBXL_VGA_INTERFACE_TYPE_UNKNOWN")
 
 libxl_vendor_device = Enumeration("vendor_device", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index af86d3186d..927adbd457 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2863,6 +2863,8 @@ skip_usbdev:
                 b_info->u.hvm.vga.kind = LIBXL_VGA_INTERFACE_TYPE_NONE;
             } else if (!strcmp(buf, "qxl")) {
                 b_info->u.hvm.vga.kind = LIBXL_VGA_INTERFACE_TYPE_QXL;
+            } else if (!strcmp(buf, "virtio")) {
+                b_info->u.hvm.vga.kind = LIBXL_VGA_INTERFACE_TYPE_VIRTIO;
             } else {
                 fprintf(stderr, "Unknown vga \"%s\" specified\n", buf);
                 exit(1);
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


