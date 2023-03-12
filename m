Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C8E6B6CA3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 00:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509096.784286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbVK6-0004cn-Bp; Sun, 12 Mar 2023 23:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509096.784286; Sun, 12 Mar 2023 23:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbVK6-0004aL-8m; Sun, 12 Mar 2023 23:41:54 +0000
Received: by outflank-mailman (input) for mailman id 509096;
 Sun, 12 Mar 2023 23:41:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mwuj=7E=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pbVK4-0004aF-Cw
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 23:41:52 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42dc288f-c12e-11ed-9571-85ef70e17bfa;
 Mon, 13 Mar 2023 00:33:17 +0100 (CET)
Received: by mail-qt1-x82a.google.com with SMTP id r5so11609684qtp.4
 for <xen-devel@lists.xenproject.org>; Sun, 12 Mar 2023 16:41:45 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:6618:4c00:8b45:5f2f])
 by smtp.gmail.com with ESMTPSA id
 i10-20020ac8004a000000b003b2d890752dsm4444257qtg.88.2023.03.12.16.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 16:41:43 -0700 (PDT)
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
X-Inumbo-ID: 42dc288f-c12e-11ed-9571-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678664503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YYf8IKPQjMmdVSpD++IIu0dqNQ4TJFmfxZjNuxNor9o=;
        b=KqED0EjmtxcaaOPdpeQUgPHtxZDwGNHwVbqthRe1dFef66ymtYtFtpFJ9NUFbr5Ui/
         iyvCl89W/q1qnTXAOtKSwMvBQSOxGividzqXKFUQe6upU4fYf69wzmAjSB5vHz8Qcfzl
         3OV0mzdoU3L6RKsGp/H3AUUIAajN9+nz/HEwCMC5W3uaLuU1XxXaBNl6bVwCfF8xCgVx
         CSQqBhdQOVYUU7rUGAqTRML+fEv0wwriGAKvvEseyXM8gTu8A47GCd9l1x5I5PSoY4Q+
         udxv4qzYB9WTTcLQZqgMhdmn0egU/vBPXOyqFWtqfMzGtBC8EAdhIvsink6tcS4DOHBX
         TBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678664503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYf8IKPQjMmdVSpD++IIu0dqNQ4TJFmfxZjNuxNor9o=;
        b=Shi8173x71hlIXGxeXH3IShiv2dzqQzeZwtbQBcrC0yedXBtnDZITfa4oUJhuJToa+
         32RpSyoYB9BVWZF4bFoe/rTwWxh/XuQ1AJJLdor/vG7djuCOZj0nWUB+yOln0jMSKwRu
         45WXHDXP6lEPEDcxvSSGf6RcIukxBHkQoJ39qAFCXQC3wKEQsbBxPrhmon3HI3cwRCAr
         bTY81SJmnKYeXOMe9/RffgF7GuOI6X0fNCUpTPuhhhoSk87vMerVsGihigDvxxuTjT6p
         QHDI3lT6hseYE+VAFD8KMXxBQPpWOoXso3p7u1oyOwE5mf2PDzvW5sDk16JdYCHtHajO
         cD5w==
X-Gm-Message-State: AO0yUKW1tfuL3MXmWKk8B4HxyeUJZteINfmD/IKjFxvGzZuxsV3YqnFy
	7pAVrVo0bXK2Uqf+k340WInjmAamsFE=
X-Google-Smtp-Source: AK7set/L8BhEK5+uYXiz54fZi5/q7FNowgXgtI0ud4BIk7wMuW23tMNaJB//njDy7JyNrTINFztDkQ==
X-Received: by 2002:a05:622a:1304:b0:3bf:a461:e6f0 with SMTP id v4-20020a05622a130400b003bfa461e6f0mr24732469qtk.31.1678664503620;
        Sun, 12 Mar 2023 16:41:43 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Woodhouse <dwmw@amazon.co.uk>
Cc: qemu-devel@nongnu.org,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH] xen: fix dm_restrict startup
Date: Sun, 12 Mar 2023 19:41:31 -0400
Message-Id: <20230312234131.46898-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QEMU is failing to signal it start when launched by libxl with
dm_restrict=1.  When xenstore_record_dm_state() is called, the
restrictions prevent xs_open() from succeeding.  QEMU can't write
running to the xenstore, and libxl fails the VM start up.

Pass in a open xenstore connection.  Let the call back use it and the
close it.  Use the completed boolean to only allow it to be called once.
This lets the xenstore connection be closed after the startup
indication.

Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirection to internal emulation")
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
I think xenstore_record_dm_state() only needs to indicate startup once,
so the completed bool makes sense.

 accel/xen/xen-all.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 00221e23c5..3843299843 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -30,17 +30,13 @@ xc_interface *xen_xc;
 xenforeignmemory_handle *xen_fmem;
 xendevicemodel_handle *xen_dmod;
 
-static void xenstore_record_dm_state(const char *state)
+static void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
 {
-    struct xs_handle *xs;
+    static bool completed;
     char path[50];
 
-    /* We now have everything we need to set the xenstore entry. */
-    xs = xs_open(0);
-    if (xs == NULL) {
-        fprintf(stderr, "Could not contact XenStore\n");
-        exit(1);
-    }
+    if (completed)
+        return;
 
     snprintf(path, sizeof (path), "device-model/%u/state", xen_domid);
     /*
@@ -53,6 +49,7 @@ static void xenstore_record_dm_state(const char *state)
         exit(1);
     }
 
+    completed = true;
     xs_close(xs);
 }
 
@@ -60,9 +57,10 @@ static void xenstore_record_dm_state(const char *state)
 static void xen_change_state_handler(void *opaque, bool running,
                                      RunState state)
 {
+    struct xs_handle *xs = opaque;
     if (running) {
         /* record state running */
-        xenstore_record_dm_state("running");
+        xenstore_record_dm_state(xs, "running");
     }
 }
 
@@ -92,6 +90,7 @@ static void xen_setup_post(MachineState *ms, AccelState *accel)
 static int xen_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
+    struct xs_handle *xs;
 
     xen_xc = xc_interface_open(0, 0, 0);
     if (xen_xc == NULL) {
@@ -111,7 +110,14 @@ static int xen_init(MachineState *ms)
         xc_interface_close(xen_xc);
         return -1;
     }
-    qemu_add_vm_change_state_handler(xen_change_state_handler, NULL);
+
+    xs = xs_open(0);
+    if (xs == NULL) {
+        fprintf(stderr, "Could not contact XenStore\n");
+        exit(1);
+    }
+
+    qemu_add_vm_change_state_handler(xen_change_state_handler, xs);
     /*
      * opt out of system RAM being allocated by generic code
      */
-- 
2.37.2


