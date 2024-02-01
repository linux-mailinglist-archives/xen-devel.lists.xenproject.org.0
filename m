Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7860C845FF1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 19:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674672.1049774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbpq-00038t-7f; Thu, 01 Feb 2024 18:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674672.1049774; Thu, 01 Feb 2024 18:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbpq-000366-46; Thu, 01 Feb 2024 18:30:50 +0000
Received: by outflank-mailman (input) for mailman id 674672;
 Thu, 01 Feb 2024 18:30:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzG+=JK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rVbpo-00020T-6r
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 18:30:48 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 044cf4dc-c130-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 19:30:47 +0100 (CET)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-42aa4a9d984so11308851cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 10:30:47 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 pf8-20020a056214498800b0068c75141e73sm25824qvb.2.2024.02.01.10.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 10:30:45 -0800 (PST)
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
X-Inumbo-ID: 044cf4dc-c130-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706812245; x=1707417045; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXQTUemsN74RnAn1dvvGsbLMWeFxaQCoGiu+7AK6fc4=;
        b=SjxheN/pBiJVZYu+sYdtU9tg1XNVwzY0B7Kh+2HmsLLciLH0jtqvy2EBGLXX2be/wg
         8t8+mEvC2IFcxiRqLjH5iMDDVFjZAQFByQOeKQY4W/3WVeiKCyMpUJHewjvyBuXia6Kv
         h9/+ygNJFtE9+G78RYVnv8oSdrhqjX5PLhqpzDCw9dZlPkBhSqFqtaYs3IEA8RdF7oAm
         l4sGB4nUFZkXfa7gwO5+aNvxs9DqKL2bBNXXB31636HJ0jCstFnkpymBDCvQf3LIwfbW
         aZ8Jg2GniWgc5Z64LXwI5cQbektaq5meX+AnnNyIEOwDZBulFp520Mi4pw2ADg3y9dHb
         mwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706812245; x=1707417045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXQTUemsN74RnAn1dvvGsbLMWeFxaQCoGiu+7AK6fc4=;
        b=YBHrwK9bOWf0PpuiLY0Ad9Ux1s2q57y0aSp6QrZsZb3XKWfbqBljzPqyvYVffUc766
         VB5sH4rj0l0rQjno0wA/qhlsLJO5A0VfkDYP+rwe/qDoTECBTpc10cHyifD3XdTeNWYv
         krOh9M9y0p1y+he+vCTlfEaMMFdsGAI0vYyaYuxSPlInrgs9JVuA9rngtwB0Wv5rpwTi
         DupH8t6xe4m6t9GlOJN/GU65ZkCVSzj/In85x5J5NVd3DEEHZvHCh9Cagy7hlFGmD5Ys
         UlnKnXkySx0ZIbPfHOsYIpDEG6lGs3Yz5BRyPYKoce6jaQyzYPC9nGNFYuOMNQKXWcDV
         LDwA==
X-Gm-Message-State: AOJu0YwMzOYeGY5lfYgXEBoI5FUztr4kVozuBa2u0P+zadDcXzCUHl9N
	eGsoMUJFzWxsOEG5YvFP+RlrpalZhWQpzeTkcQdRZi40J6di0ybQ8zJ938oz
X-Google-Smtp-Source: AGHT+IEWx00EhNjwiB+5VOyp/liVH8EKonyCySzNRm7Zbu9GgKjuetHeeXTeHp5nysA4xxULR3fIIg==
X-Received: by 2002:ad4:5be2:0:b0:681:24e9:f6fe with SMTP id k2-20020ad45be2000000b0068124e9f6femr5967924qvc.35.1706812245609;
        Thu, 01 Feb 2024 10:30:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWYFDkfLuco0XGfZ2n8zscgoQvWNCJdEScd5K+8Z4tSpZGAoRMcrxsEdlXh8eCkD3sD4dIKh1Yows0O6mWbb1ExfPkdNMvWeZrfNSwJROCCT3LUn65Df4Ii+lALcKfJNxc9wJUgnOA=
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 4/4] libxl: Support blktap with HVM device model
Date: Thu,  1 Feb 2024 13:30:24 -0500
Message-ID: <20240201183024.145424-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201183024.145424-1-jandryuk@gmail.com>
References: <20240201183024.145424-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

blktap exposes disks over UNIX socket Network Block Device (NBD).
Modify libxl__device_disk_find_local_path() to provide back the
QEMU-formatted NBD path.  This allows tapdisk to be used for booting an
HVM.

Use the nbd+unix:/// format specified by the protocol at
https://github.com/NetworkBlockDevice/nbd/blob/master/doc/uri.md

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_disk.c | 17 +++++++++++++----
 tools/libs/light/libxl_dm.c   |  1 -
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 59ff996837..b65cad33cc 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -1317,7 +1317,8 @@ char *libxl__device_disk_find_local_path(libxl__gc *gc,
      * If the format isn't raw and / or we're using a script, then see
      * if the script has written a path to the "cooked" node
      */
-    if (disk->script && guest_domid != INVALID_DOMID) {
+    if ((disk->script && guest_domid != INVALID_DOMID) ||
+        disk->backend == LIBXL_DISK_BACKEND_TAP) {
         libxl__device device;
         char *be_path, *pdpath;
         int rc;
@@ -1337,10 +1338,18 @@ char *libxl__device_disk_find_local_path(libxl__gc *gc,
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
+        } else
+            LOGD(DEBUG, guest_domid,
+                "No physical-device-path, can't access locally.");
 
         goto out;
     }
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 14b593110f..f7c796011d 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1915,7 +1915,6 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                     continue;
                 }
 
-                assert(disks[i].backend != LIBXL_DISK_BACKEND_TAP);
                 target_path = libxl__device_disk_find_local_path(gc,
                                     guest_domid, &disks[i], true);
 
-- 
2.43.0


