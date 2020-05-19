Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213C31D8D64
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:57:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarV0-0000gy-5g; Tue, 19 May 2020 01:56:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarUy-0000fm-MX
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:56:52 +0000
X-Inumbo-ID: eb926a78-9973-11ea-ae69-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb926a78-9973-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 01:56:14 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id z9so5758822qvi.12
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SW7ozKClvM3WIhe8ybZkG6u5ih1lmHf7uAbI1XBrLpc=;
 b=CnKwwadtEAFYg1zazlGc4X/IU4eFWCwKZvHufvQ1e2crzFfRNLG2+PnUTwx8Rfz/TN
 s4/o/YpwsIHG54JsFcb2ekxpk31n/3WxquR9sQf+0OJkXy4l39YyW1pVqRqBPxCUGg8V
 ps08GLBOpQfc4ztTbITjxjiMPnsSvOiNPdwKH99MSgd0Ma1EHuzAV9+UlZKKeYWfZzBU
 yz6aTYI8a4gXCa9IQ0v1Ci3n46ZT/cg46lqD5kq9nzp65raXWuLf7i0Kj/z0Ay6f8pEs
 ByVay6MQx/r4W36o+J3yD5ieVOGzWLDVs3Nnl9msX79DzHiU7X6x/nu2yuT66wvvMy26
 Y80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SW7ozKClvM3WIhe8ybZkG6u5ih1lmHf7uAbI1XBrLpc=;
 b=P6SRfCpPvo6ClTWrockIOjcK2zpoxpWXHl38bdDsoz044v8rooQXr/LKw5IQWMK0Zb
 QkdQdIrkNZVnzZhhcYp2vpc4CZzogG/Cx6POp8EWSK0h8FQd2D5AbnuJrpw7xmvBTLGa
 27okBpwj2lf19GM4dTI0DBLDYDn2FhJrSuA8Om4q/HN3XJteCIWcfdi7ZDvKgr4rTsSb
 ApvoAQTKG9AhkuVnF5IMZXI9g1BUBbo1C42eNoMzbR1XO8XfDe/lvFIDD9lyefvj1hJb
 v4V7vR6a7sc/eUVCmIaxNxnOixTZp6rG5Wx26vhGyfT20lNXWhjDT6/T7A/rKntN1dcN
 MNag==
X-Gm-Message-State: AOAM533ZOKjjmML/RqCjf1idBnMVzG8Ea2iMVxIK6X7AJVy7MPOvVets
 NBa0XQC6rOY3hgqbhPdQHNqJiwbn
X-Google-Smtp-Source: ABdhPJxYFWLxUw/CqXdV+vgU4A067EXnFnHEE1WVte0qJKFDwTeC4vjmLzBBFixMy64+ZUjHFScS2Q==
X-Received: by 2002:a0c:e48f:: with SMTP id n15mr17472904qvl.73.1589853373326; 
 Mon, 18 May 2020 18:56:13 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:12 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 13/19] libxl: Refactor kill_device_model to
 libxl__kill_xs_path
Date: Mon, 18 May 2020 21:54:57 -0400
Message-Id: <20200519015503.115236-14-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
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
index 62d0d46c98..6829b4bdb5 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -3225,32 +3225,7 @@ out:
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


