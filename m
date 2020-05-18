Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D031D6E7D
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:15:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUNb-0000Ub-Af; Mon, 18 May 2020 01:15:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUNZ-0000Tc-T9
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:15:41 +0000
X-Inumbo-ID: 04190766-98a5-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04190766-98a5-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 01:15:09 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d7so6813755qtn.11
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JJdKgFtG+bONqBhd+RWucBrJtCEa7OPLIkXsUE/WDhQ=;
 b=DDBsN0ImDbg3aGNryJgVfeLZMpkcHZ+zwVHOUZyi+n2hIFyRIu+PorKZrKoLFMPqcJ
 zTuktIU74Od2MUUWjjT/v9QU1DfndYDHwjoOglPBuex8VreAvu4YDmywQ4pKT1F+YaFF
 aYPHn7cY7A6nnkaVNMHU9cg8fkf8eYiBral4bYA4yRNvnRoNOiVgoc2FM49NBOLIjStP
 at9Bd8BrBjR4HyQj4Jdr0AWohFpgbk1AKfFYIDPm5QCaEmw42Itn0Hh8Pj+3bnC6Tkeb
 X1/htWOFt/9I/yx1FZU6ZnofyhBDQT7aqI5rzZ39KZQigLp0TjmGVgwyGeJt1qbtPRkv
 LX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JJdKgFtG+bONqBhd+RWucBrJtCEa7OPLIkXsUE/WDhQ=;
 b=QI4tE3edhlQaOeRBil7lNfWWyJulKJ9sEc0k/BU/7rSgYBOGZWw5zm7qKvAh6rVTAs
 +aeswPfhF8Cm3Vk5rJjU9tXGAbtKkIZJrJFBfBBZOAXw3pe0Oih9ec4zGoYNEhy1alQG
 QGAr3FCyjIcghOAZnRXA4kAcCZbd6lBozklRTpL9Dho+4nI/6SJHQCyAngXcPpRO1fmv
 Z8bhIolF9jRNusJvcDYcHihySTdiv//f11qSJdlafd9ew+TVGKODWEfoiOkNL84G1Y6w
 zqZJaSEIPdW5nQ0kr+TopHcdhrH/MQKlMdhSDdn718taZgKsx3Ss8d0omMFSHomSc7Hb
 jx5g==
X-Gm-Message-State: AOAM531PSiABilB2aBWlRgmN2BsQh+yoDeHUYVOxzhgW4q5ZD5il4Ycs
 e28S0UODKdumZAB37f6P/amw2f2A
X-Google-Smtp-Source: ABdhPJxIf0bJvjq7YXR6BoChI1jyG+3VBrrw0r5jpB2Qewv8LrG29Lf/VzYbpSPfnZ9wkBWqtWHMWg==
X-Received: by 2002:ac8:543:: with SMTP id c3mr13667629qth.8.1589764508809;
 Sun, 17 May 2020 18:15:08 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:15:08 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 12/18] libxl: Refactor kill_device_model to
 libxl__kill_xs_path
Date: Sun, 17 May 2020 21:13:47 -0400
Message-Id: <20200518011353.326287-13-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Move kill_device_model to libxl__kill_xs_path so we have a helper to
kill a process from a pid stored in xenstore.  We'll be using it to kill
vchan-qmp-proxy.

libxl__kill_xs_path takes a "what" string for use in printing error
messages.  kill_device_model is retained in libxl_dm.c to provide the
string.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v6:
 - Add Acked-by: Ian Jackson
---
 tools/libxl/libxl_aoutils.c  | 32 ++++++++++++++++++++++++++++++++
 tools/libxl/libxl_dm.c       | 27 +--------------------------
 tools/libxl/libxl_internal.h |  3 +++
 3 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/tools/libxl/libxl_aoutils.c b/tools/libxl/libxl_aoutils.c
index 1be858c93c..c4c095a5ba 100644
--- a/tools/libxl/libxl_aoutils.c
+++ b/tools/libxl/libxl_aoutils.c
@@ -626,6 +626,38 @@ void libxl__kill(libxl__gc *gc, pid_t pid, int sig, const char *what)
                 what, (unsigned long)pid, sig);
 }
 
+/* Generic function to signal (HUP) a pid stored in xenstore */
+int libxl__kill_xs_path(libxl__gc *gc, const char *xs_path_pid,
+                        const char *what)
+{
+    const char *xs_pid;
+    int ret, pid;
+
+    ret = libxl__xs_read_checked(gc, XBT_NULL, xs_path_pid, &xs_pid);
+    if (ret || !xs_pid) {
+        LOG(ERROR, "unable to find %s pid in %s", what, xs_path_pid);
+        ret = ret ? : ERROR_FAIL;
+        goto out;
+    }
+    pid = atoi(xs_pid);
+
+    ret = kill(pid, SIGHUP);
+    if (ret < 0 && errno == ESRCH) {
+        LOG(ERROR, "%s already exited", what);
+        ret = 0;
+    } else if (ret == 0) {
+        LOG(DEBUG, "%s signaled", what);
+        ret = 0;
+    } else {
+        LOGE(ERROR, "failed to kill %s [%d]", what, pid);
+        ret = ERROR_FAIL;
+        goto out;
+    }
+
+out:
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index a4f8866d33..478e6540df 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -3235,32 +3235,7 @@ out:
 /* Generic function to signal a Qemu instance to exit */
 static int kill_device_model(libxl__gc *gc, const char *xs_path_pid)
 {
-    const char *xs_pid;
-    int ret, pid;
-
-    ret = libxl__xs_read_checked(gc, XBT_NULL, xs_path_pid, &xs_pid);
-    if (ret || !xs_pid) {
-        LOG(ERROR, "unable to find device model pid in %s", xs_path_pid);
-        ret = ret ? : ERROR_FAIL;
-        goto out;
-    }
-    pid = atoi(xs_pid);
-
-    ret = kill(pid, SIGHUP);
-    if (ret < 0 && errno == ESRCH) {
-        LOG(ERROR, "Device Model already exited");
-        ret = 0;
-    } else if (ret == 0) {
-        LOG(DEBUG, "Device Model signaled");
-        ret = 0;
-    } else {
-        LOGE(ERROR, "failed to kill Device Model [%d]", pid);
-        ret = ERROR_FAIL;
-        goto out;
-    }
-
-out:
-    return ret;
+    return libxl__kill_xs_path(gc, xs_path_pid, "Device Model");
 }
 
 /* Helper to destroy a Qdisk backend */
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index f2f76439ec..c939557b2e 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -2711,6 +2711,9 @@ int libxl__async_exec_start(libxl__async_exec_state *aes);
 bool libxl__async_exec_inuse(const libxl__async_exec_state *aes);
 
 _hidden void libxl__kill(libxl__gc *gc, pid_t pid, int sig, const char *what);
+/* kill SIGHUP a pid stored in xenstore */
+_hidden int libxl__kill_xs_path(libxl__gc *gc, const char *xs_path_pid,
+                                const char *what);
 
 /*----- device addition/removal -----*/
 
-- 
2.25.1


