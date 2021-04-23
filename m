Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460133696BC
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 18:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116490.222383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTb-0008Lc-Vo; Fri, 23 Apr 2021 16:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116490.222383; Fri, 23 Apr 2021 16:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTb-0008KR-Qn; Fri, 23 Apr 2021 16:16:19 +0000
Received: by outflank-mailman (input) for mailman id 116490;
 Fri, 23 Apr 2021 16:16:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6bT=JU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lZyTa-00082q-Gl
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 16:16:18 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e6bf307-89f6-4de9-bdfc-59e5a3de9c1a;
 Fri, 23 Apr 2021 16:16:05 +0000 (UTC)
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
X-Inumbo-ID: 3e6bf307-89f6-4de9-bdfc-59e5a3de9c1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619194565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gygj/Nak9hSpWoWROOHHTJ9LjxhWDQ/06rb6wnjdhUE=;
  b=Ot8oewyv79nC1P0zTJhLRtZsKlUTqhPAZTRcM4Mr+R2uVTAVvHiX0bj3
   pRe53h6ChY2oTvIAxD2GIr2q/3I4zj0K9vhu89295gzwK/UfiD8Fok0gG
   cuRWQpLh4r/L234gOlLMK0GAE19dg/Xui9CdLE/Z3j1LF8+NO5cpSsR+i
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: z/2hhoiwA5cKJsLlGK9/tD/q0N96IMJo3PCsZpF8PT7gKdu7nQ2uBJeTodjsW+Gh3Q+E7p9/UJ
 hY3OPLHfAmACvHXCgjhu+raJBAafNMn+nDPk8G/7Fn/dGaxoD4OhVhiPKnsFf5yml9xsFjIYI1
 gRSHDf/3LeJNqFaDAF2p7RR+QKk6odVgZu5+Uv1Fc6hL3I7Lk8OtKVpszpLhW2E1duknXuy5/U
 44LgaUDnHMmw3OpQj7UGhG44JONhE87ZBCa3UMH+1C4I/5THSZJ2FGtgNrsP0pfcP4kohqRter
 Orw=
X-SBRS: 5.1
X-MesageID: 42290097
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+qZ+da8YtjclBQLNrL5uk+FRcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUfD38Zn/+
 Nbf6B6YeeaMXFTh8z3+RT9Nt4mzsWO/qzAv5ak815GZ2hRGsJdxi1+DRuWFVAzYQFAC4YwGp
 b03Ls8mxOLf3MLYsOnQkQURuSrnayAqLvKQz4jQyQm5g6HkC+y5NfBfySw8x8CX1p0sNAf2E
 fflQiR3MSemtG9jiTRzmrCq6lR8eGRsudrIOyppowrJi73igCuDb4RFoGqmDwuuumg5BILvb
 D30nEdFv9+4X/QYW25yCGFs2aP7B8U53Dv0lOei3f4yPaJPQ4SMdZLho5Sb3Limigdlex8y6
 5C0ia4sJdaHHr77UDAzuXITB1jmw6Ip2Mjm4co/hlieLYZAYUwkaUvuGduVLsQFiPz744qVM
 N0CtvH2fpQeVSGK1jEo2hG2rWXLzsONybDZnJHlt2e0jBQknw85VAf3tYjknAJ8494Y4VY5t
 7DLr9jmNh1P4ErRJM4IN1Ebdq8C2TLTx6JGnmVO07bGKYOPG+IjJLr/rMv5qWPdIYTxJU/3L
 TNOWko9FIaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nyX7zuPSqfSE0/kseprvkFa/erGM
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5I6Vju104D2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gF6kiqX3T/kQXAQn+FQD27wbtAVIzhu8QDwokEMYNB9iIPj06i282NITpe9qosfE
 V/J7vjmrihpXa/+HvJ62kBAGscMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYgNkQ9jOCw
 5ZrVRv8aexJ5idrBpST+6PAya/tT8+tXiKR5ATlum//s/jYIo/FYtjcrd2Dx/3Gxt8nhtKpG
 9PZBQffFLWEirjhMye/dspLdCaU+M5oQ+wZeZItHrUtCyn1LwSb0peewTrbOm6rkIFQSFOil
 h47qkF6YDw5QqHGC8Ym+Q3MFpFdWKNJqlJZT71KLl8kqz3eQ12UGeBjSGbjRZ2YWbx60AOnA
 XaXFKpUOCODVxHtn9C1KH2tFtya2WGZkp1Lmt3qItnCA39yz5O+P7OYqq4yG2KbFQehukbLT
 HeeDMXSzkeseyfxVqQmDyYE28hyYhrNuvBDK47e7WW3n+2MoWHmeUHGPBTlawVfezGo6sOUe
 iFfRWSIy69A+Q12xaNrnJgITJqshAf4IbV8Qyg6HL90G80APLULlgjT7YHI8uE52yhQ/qTyp
 12gd88oOPYCBS7VveWjaXMKzJTIBLapmC7C/slrp1Zpqo+vrp+FZuza0q+6FhXmBElaMvknk
 IXR6p2pK3bMoh0ZsoIZmZX+EEqmNnnFjpYjiXmRuslOVcjgH/QM4nXv/7Gqb8zDlaAowW1M1
 +F6CFZ9+rEWSzG1bNyMdNBHU1GLEwnrHJl96eecoeVDgOgfeRK5kC7PX+wa6U1ctnwJZwA6h
 Jhp8iVlOqWfTfi0A/evTFnMrtDmlzXMP+aEUaJA6pU6NS0NlSHn7uy7MOyhDnxTyGna05wv/
 w3SWUAKsJZijcji4Ur0i+9Dqzvy3hV7Wdj3Q==
X-IronPort-AV: E=Sophos;i="5.82,246,1613451600"; 
   d="scan'208";a="42290097"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 4/8] libxl: Use -device for cd-rom drives
Date: Fri, 23 Apr 2021 17:15:54 +0100
Message-ID: <20210423161558.224367-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423161558.224367-1-anthony.perard@citrix.com>
References: <20210423161558.224367-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This allows to set an `id` on the device instead of only the drive. We
are going to need the `id` with the "eject" and
"blockdev-change-media" QMP command as using `device` parameter on
those is deprecated. (`device` is the `id` of the `-drive` on the
command line).

We set the same `id` on both -device and -drive as QEMU doesn't
complain and we can then either do "eject id=$id" or "eject
device=$id".

Using "-drive + -device" instead of only "-drive" has been
available since at least QEMU 0.15, and seems to be the preferred way as it
separates the host part (-drive which describe the disk image location
and format) from the guest part (-device which describe the emulated
device). More information in qemu.git/docs/qdev-device-use.txt .

Changing the command line during migration for the cdrom seems fine.
Also the documentation about migration in QEMU explains that the device
state ID is "been formed from a bus name and device address", so
second IDE bus and first device address on bus is still thus and
doesn't matter if written "-drive if=ide,index=2" or "-drive
ide-cd,bus=ide.1,unit=0".
See qemu.git/docs/devel/migration.rst .

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_dm.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 0a0c1ef7c62e..5b01cf284163 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1913,6 +1913,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             }
 
             if (disks[i].is_cdrom) {
+                const char *drive_id;
                 if (disk > 4) {
                     LOGD(WARN, guest_domid, "Emulated CDROM can be only one of the first 4 disks.\n"
                          "Disk %s will be available via PV drivers but not as an "
@@ -1920,13 +1921,22 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                          disks[i].vdev);
                     continue;
                 }
-                drive = libxl__sprintf(gc,
-                         "if=ide,index=%d,readonly=on,media=cdrom,id=ide-%i",
-                         disk, dev_number);
+
+                drive_id = GCSPRINTF("ide-%i", dev_number);
+                drive = GCSPRINTF("if=none,readonly=on,id=%s", drive_id);
 
                 if (target_path)
                     drive = libxl__sprintf(gc, "%s,file=%s,format=%s",
                                            drive, target_path, format);
+
+                flexarray_vappend(dm_args,
+                    "-drive", drive,
+                    "-device",
+                    GCSPRINTF("ide-cd,id=%s,drive=%s,bus=ide.%u,unit=%u",
+                              drive_id, drive_id,
+                              disk / 2, disk % 2),
+                    NULL);
+                continue;
             } else {
                 /*
                  * Explicit sd disks are passed through as is.
-- 
Anthony PERARD


