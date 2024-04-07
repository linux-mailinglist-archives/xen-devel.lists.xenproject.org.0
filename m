Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6224089B409
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 22:50:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701684.1096027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtZSv-00063X-73; Sun, 07 Apr 2024 20:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701684.1096027; Sun, 07 Apr 2024 20:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtZSv-00061p-3E; Sun, 07 Apr 2024 20:50:13 +0000
Received: by outflank-mailman (input) for mailman id 701684;
 Sun, 07 Apr 2024 20:50:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CRZ/=LM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rtZSt-0005XS-Ch
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2024 20:50:11 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bcf080c-f520-11ee-a1ef-f123f15fe8a2;
 Sun, 07 Apr 2024 22:50:09 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-78d57bd577dso99044185a.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 13:50:09 -0700 (PDT)
Received: from shine.lan
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 op3-20020a05620a534300b0078a593b54e6sm2512745qkn.96.2024.04.07.13.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 13:50:07 -0700 (PDT)
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
X-Inumbo-ID: 6bcf080c-f520-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712523008; x=1713127808; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZDvIUsAKPV206Pd7mJP42UrMWzTymOhx8HDziGsICo=;
        b=nmd2oqZzt/S1y3MZrB+gnyY74DWnepC6jgRdQInSEjQdBGe8W2M1yW+jECCt4vSiCF
         Pc/cL0yGfR4YIsHxNJ7Uy0v0EE3q7Is0kmLOFOSxDhGMHGmS/0PWQSwiJXwje898gyEP
         5Dqltt5m9MsPzFOnqDXWZMX9VQ99aMRGY6xBBMEvgSsSvSMLSVAAx4Gm3/mCyZWyTeKP
         v6+9atH21MaLP0s1r5OsPXu+Cqd/NOeMUtkLN5pjzHUX3uX7vO8XCsz2KTl0ooyWkuVf
         t8B7mbHBVgcTKJJMlncj70ONpSLshaXhNnenY0f4Yd/t+H6kADpjLUXEoNfAzCDRZgeE
         +U9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712523008; x=1713127808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZDvIUsAKPV206Pd7mJP42UrMWzTymOhx8HDziGsICo=;
        b=T28fcxe2C8kfsI8VAajr4oQcg7MLIBZmt/0yLL5iyjF8hRlf7D2/QmyI+rSXo5d1jl
         8OUcp2elXPHVsdLGAEKwnUct1BABVcq58jceR5RKAhJvvnJTT0J5vq38Dlu2EOceLLIA
         K1w46dLcpPLmgh0jME5V3Z4j//N/VtaADekS1lF1USAO79uL4slHNNAExkpN/Yl/YzzB
         Aes/8GmQQ/eBTe/H8lf0UFX8ZlUJ23TEN1TVcIbzNF8dygDU4f2et0lTxlRtpeeBu5XE
         epR7irsjZdgpHeBeRoQXVI1JrV0St+zc/OIXK0rlpVCEzX0VMKzCdsshmcXzIyq8Eu+e
         pdpA==
X-Gm-Message-State: AOJu0Ywa8XgkxZH79Vwpudc5+jStg4K41zOLhEuzKBrzeo2LFA3AHgqu
	LK7rMwPLG2BoyQVW5ucn26xJ/GXyudkw9U0rRs4Y1pWwQjVdSqXBwIEvTc/0
X-Google-Smtp-Source: AGHT+IHUCCTAjf79Y8ZrkaloLomDLgJ1qtrOdgfyTEx1LMnfPTvwUnlErnzAeFfIv6z7S6NKdYtEmg==
X-Received: by 2002:ae9:ea03:0:b0:78b:e7ed:2a08 with SMTP id f3-20020ae9ea03000000b0078be7ed2a08mr7479809qkg.41.1712523007822;
        Sun, 07 Apr 2024 13:50:07 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 2/3] libxl: Support blktap with HVM device model
Date: Sun,  7 Apr 2024 16:49:52 -0400
Message-Id: <20240407204953.60442-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407204953.60442-1-jandryuk@gmail.com>
References: <20240407204953.60442-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

blktap exposes disks over UNIX socket Network Block Device (NBD).
Modify libxl__device_disk_find_local_path() to provide back the
QEMU-formatted NBD path.  This allows tapdisk to be used for booting an
HVM.

Use the nbd+unix:/// format specified by the protocol at
https://github.com/NetworkBlockDevice/nbd/blob/master/doc/uri.md

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Add Anthony's R-b
Add matching { } to else
---
 tools/libs/light/libxl_disk.c | 18 ++++++++++++++----
 tools/libs/light/libxl_dm.c   |  1 -
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 819d34933b..432970f5a7 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -1724,7 +1724,8 @@ char *libxl__device_disk_find_local_path(libxl__gc *gc,
      * If the format isn't raw and / or we're using a script, then see
      * if the script has written a path to the "cooked" node
      */
-    if (disk->script && guest_domid != INVALID_DOMID) {
+    if ((disk->script && guest_domid != INVALID_DOMID) ||
+        disk->backend == LIBXL_DISK_BACKEND_TAP) {
         libxl__device device;
         char *be_path, *pdpath;
         int rc;
@@ -1744,10 +1745,19 @@ char *libxl__device_disk_find_local_path(libxl__gc *gc,
         LOGD(DEBUG, guest_domid, "Attempting to read node %s", pdpath);
         path = libxl__xs_read(gc, XBT_NULL, pdpath);
 
-        if (path)
+        if (path) {
             LOGD(DEBUG, guest_domid, "Accessing cooked block device %s", path);
-        else
-            LOGD(DEBUG, guest_domid, "No physical-device-path, can't access locally.");
+
+            /* tapdisk exposes disks locally over UNIX socket NBD. */
+            if (disk->backend == LIBXL_DISK_BACKEND_TAP) {
+                path = libxl__sprintf(gc, "nbd+unix:///?socket=%s", path);
+                LOGD(DEBUG, guest_domid,
+                     "Directly accessing local TAP target %s", path);
+            }
+        } else {
+            LOGD(DEBUG, guest_domid,
+                "No physical-device-path, can't access locally.");
+	}
 
         goto out;
     }
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 0b03a7c747..1a24e7961a 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1915,7 +1915,6 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                     continue;
                 }
 
-                assert(disks[i].backend != LIBXL_DISK_BACKEND_TAP);
                 target_path = libxl__device_disk_find_local_path(gc,
                                     guest_domid, &disks[i], true);
 
-- 
2.39.2


