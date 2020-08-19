Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD624A460
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:53:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8RK1-0003ke-Ia; Wed, 19 Aug 2020 16:52:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP9Y=B5=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1k8RK0-0003kZ-LG
 for xen-devel@lists.xen.org; Wed, 19 Aug 2020 16:52:20 +0000
X-Inumbo-ID: 7fe40239-f4b7-49b4-9c41-a29fe5a3a1f3
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fe40239-f4b7-49b4-9c41-a29fe5a3a1f3;
 Wed, 19 Aug 2020 16:52:19 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g26so22234013qka.3
 for <xen-devel@lists.xen.org>; Wed, 19 Aug 2020 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=o8NsCKzA6WRTBrSnDhC70WmZpWrA7tMMr87qsIxTF40=;
 b=or7mw6CE7ZHJHTWLAA6az4SyS7RVqBPInRmZK8ZHWu3vO1uHeLX/S0uMydfzMh+kcd
 61SUhJMTUBrjxAlLWs1Q3b3i6ubUTt3HieM9LcY/iPIhDVDEE/Q4oX9VOd72QOB+J4C8
 8dwNcbPalbBDTwreaVrhasg3D74OdKzq1tT7PuhhLTCXpHBv3lKKGxht02ov19IE6x+O
 SedYMSnsR9wYID9j52cVn40ms/ujJLmJXJx2uixjy3Q6ui4de0ZT+08ORPSvNGTcvJuO
 orwV7NPVWK0iGWFeEJ1mXHk90lmEjqEbZGsiqg2NgTg7W1/6oUNGqcOnZi2NbnCbzWX3
 OsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=o8NsCKzA6WRTBrSnDhC70WmZpWrA7tMMr87qsIxTF40=;
 b=cANjJX/b10vplHg+5u6tlJzZY3jj4GPrqC/cxJ2SbBRg/6SHtvPLgcyxz+ciNN+qqG
 4LCzdvjvcCQObx2/dih3+LmQTNSmWcyt1AL3HAlk1vd/7rM2GW22LrjNHSLluaZ7mWhL
 8HK82pA4vZFgx4CAf4EIj378e8Ns5i4RM+ItSs/zfHaYyzemscmG6c8FUkKi8DmZjgBY
 rbAK0C4OYBat3BOdmfDefkKnVNH9GbDscur8YIqM/oTS5U/aJ3FarWFL2gJPPHEq5Rd0
 7LwzGonCt4x6aezvlgr26gnB6DHK9rNLGLngOP4egq0HTsDceL2Oqc6jZDciGEaDqhhS
 Ds1Q==
X-Gm-Message-State: AOAM531MVRwb2blQ9IFqeDed0tRbMwSk4V4phUzuhqeTvXAzfHrcMUs0
 07eX18bRQv25qV0TdArdtzJOULyR5FoFu4JE
X-Google-Smtp-Source: ABdhPJyFJtKozsnnsbOOoPYSGupD2wNujEjLeKexbnZ0L7bSO4PguO/vorL+e12kdCtmqli1SHtZcw==
X-Received: by 2002:a37:84c:: with SMTP id 73mr22337947qki.464.1597855939132; 
 Wed, 19 Aug 2020 09:52:19 -0700 (PDT)
Received: from TestCloud1.don.dslutz.org.zatium.us
 (pool-96-230-225-98.bstnma.fios.verizon.net. [96.230.225.98])
 by smtp.googlemail.com with ESMTPSA id
 128sm25105832qkk.101.2020.08.19.09.52.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 09:52:18 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com
To: xen-devel@lists.xen.org
Cc: Aravind Gopalakrishnan <Aravind.Gopalakrishnan@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Eddie Dong <eddie.dong@intel.com>, Ian Campbell <ian.campbell@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Keir Fraser <keir@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Don Slutz <dslutz@verizon.com>, Don Slutz <don.slutz@gmail.com>
Subject: [Xen-devel] [XEN PATCH v14 1/8] tools: Add vga=vmware
Date: Wed, 19 Aug 2020 12:51:55 -0400
Message-Id: <34a50dc69e4c5722597e02a4df4e3da6d6586ec7.1597854907.git.don.slutz@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
In-Reply-To: <cover.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Don Slutz <dslutz@verizon.com>

This allows use of QEMU's VMware emulated video card

NOTE: vga=vmware is not supported by device_model_version=qemu-xen-traditional

Signed-off-by: Don Slutz <dslutz@verizon.com>
CC: Don Slutz <don.slutz@gmail.com>
---
Acked-by: Ian Campbell <ian.campbell@citrix.com>
Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

v14:
  Reworked to current code.
  Added below --- Reviewed-by: Konrad Rzeszutek 

v13:
  Added Acked-by: Ian Campbell

v12:
  Dropped LIBXL_HAVE_LIBXL_VGA_INTERFACE_TYPE_VMWARE
  This means that the later patch that defines LIBXL_HAVE_VMWARE
  is now also required.

v11:
  Dropped support for Qemu-trad.
  Also changed later patchs to not need this one.

v10: New at v10.

  Was part of "tools: Add vmware_hwver support"


 docs/man/xl.cfg.5.pod.in    | 4 +++-
 tools/libxl/libxl_dm.c      | 9 +++++++++
 tools/libxl/libxl_types.idl | 1 +
 tools/xl/xl_parse.c         | 2 ++
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 0532739..a9eae96 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2396,7 +2396,7 @@ B<This option is deprecated, use vga="stdvga" instead>.
 =item B<vga="STRING">
 
 Selects the emulated video card.
-Options are: B<none>, B<stdvga>, B<cirrus> and B<qxl>.
+Options are: B<none>, B<stdvga>, B<cirrus>, B<vmware> and B<qxl>.
 The default is B<cirrus>.
 
 In general, QXL should work with the Spice remote display protocol
@@ -2404,6 +2404,8 @@ for acceleration, and a QXL driver is necessary in the guest in that case.
 QXL can also work with the VNC protocol, but it will be like a standard
 VGA card without acceleration.
 
+NOTE: B<vmware> is not supported on B<device_model_version = "qemu-xen-traditional">
+
 =item B<vnc=BOOLEAN>
 
 Allow access to the display via the VNC protocol.  This enables the
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index f2dc569..415c12e 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -808,6 +808,10 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
         case LIBXL_VGA_INTERFACE_TYPE_NONE:
             flexarray_append_pair(dm_args, "-vga", "none");
             break;
+        case LIBXL_VGA_INTERFACE_TYPE_VMWARE:
+            LOG(ERROR, "vga=vmware is not supported by "
+                "qemu-xen-traditional");
+            return ERROR_INVAL;
         case LIBXL_VGA_INTERFACE_TYPE_QXL:
             break;
         default:
@@ -1446,6 +1450,11 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                 GCSPRINTF("qxl-vga,vram_size_mb=%"PRIu64",ram_size_mb=%"PRIu64,
                 (b_info->video_memkb/2/1024), (b_info->video_memkb/2/1024) ) );
             break;
+        case LIBXL_VGA_INTERFACE_TYPE_VMWARE:
+            flexarray_append_pair(dm_args, "-device",
+                GCSPRINTF("vmware-svga,vgamem_mb=%d",
+                libxl__sizekb_to_mb(b_info->video_memkb)));
+            break;
         default:
             LOGD(ERROR, guest_domid, "Invalid emulated video card specified");
             return ERROR_INVAL;
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index 9d3f05f..36350d2 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -220,6 +220,7 @@ libxl_vga_interface_type = Enumeration("vga_interface_type", [
     (2, "STD"),
     (3, "NONE"),
     (4, "QXL"),
+    (5, "VMWARE"),
     ], init_val = "LIBXL_VGA_INTERFACE_TYPE_UNKNOWN")
 
 libxl_vendor_device = Enumeration("vendor_device", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 61b4ef7..c74a9e3 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2590,6 +2590,8 @@ skip_usbdev:
                 b_info->u.hvm.vga.kind = LIBXL_VGA_INTERFACE_TYPE_NONE;
             } else if (!strcmp(buf, "qxl")) {
                 b_info->u.hvm.vga.kind = LIBXL_VGA_INTERFACE_TYPE_QXL;
+            } else if (!strcmp(buf, "vmware")) {
+                b_info->u.hvm.vga.kind = LIBXL_VGA_INTERFACE_TYPE_VMWARE;
             } else {
                 fprintf(stderr, "Unknown vga \"%s\" specified\n", buf);
                 exit(1);
-- 
1.8.3.1


