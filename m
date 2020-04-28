Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E651E1BB4FA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:07:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHWQ-0001Om-N8; Tue, 28 Apr 2020 04:07:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHWP-0001Nr-49
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:07:01 +0000
X-Inumbo-ID: 9fb25ad8-8905-11ea-9887-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fb25ad8-8905-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 04:06:23 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id t3so20591207qkg.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6DQChgQe+3bSXOEkWGb6D1mzdbV5n3lQYWfTuCEquu8=;
 b=Xse0tAdbdB+fF1IFKZRUS6Q/2MFCrE/2W06iDpxBq7FbgQC2NuqemaAC+9W8hkPvjG
 RqfHvzkCNFw0RhDpx9gbkTyscUSqwwx27vcOZ1aHw5AXlhA3p19LUHtcuLW9qT0rcsI/
 /pLIQBDW1oqSM1YXXe8B9TaNlKsAxzYdv2ynChzZ0jal7NlQkA2iv2vgm6kVyjxYV0mU
 EzOazIJ39GlhuF4YzXL88CYZdy6D0bDW8MeGEKZnogBP8RgM9o2RQ0LG5BgqEe/J25JC
 LayBQ9TrDy0f+tJ1kOiciYt4/bP2/3/BrMzrNzGT88IcBzcLK1ZAXO3tqJXCd3634KMe
 2e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6DQChgQe+3bSXOEkWGb6D1mzdbV5n3lQYWfTuCEquu8=;
 b=sZsnEMzYTmNbsL0N9pv7MsKQkm3fquB0vI8C3wbp5zTx+1d5Mq4FXi1wmYOiNH8CfR
 /HqzCZuzJp7Fwdo/VxpVXwgC0lH9oQsdj6t26vE8tZUpxlmuBgwfNiFkUs1Sb1cPcb/Q
 r81p2O9ZDHnG3iXPdm6VWM/PAorTB18Pd2FidFIPRQ1mQNP4F2QpeFRc0xWaahxM9aiT
 eVpeo24npYbSgCwjgDt9EEf3PaDEIgVyu+3qqcE8X92vtp/Zw+2NGryBs7c325/3aMDq
 8nrPkK/OIlwABj3ugPpQ19lt5sqkaJhmUORuIE3Da7CQK8D+MbC6K1+sCf8kq11/bxI9
 mv6A==
X-Gm-Message-State: AGi0PuawhNxJC+gG5krOqTo/KuYnaViA9wbgJNpgIxvibioUynPWm4xN
 cfsg+8WuxWJW+ZAD/olMGDR2rQbJ
X-Google-Smtp-Source: APiQypL32vsxRZanS1NtlmQKFUKLhxnlSdDfEXm+decCbPDZhmOs0AEQ68A8akHQ39nI7acivelvmQ==
X-Received: by 2002:a05:620a:13b9:: with SMTP id
 m25mr25458664qki.456.1588046782950; 
 Mon, 27 Apr 2020 21:06:22 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:06:22 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 19/21] libxl: Refactor kill_device_model to
 libxl__kill_xs_path
Date: Tue, 28 Apr 2020 00:04:31 -0400
Message-Id: <20200428040433.23504-20-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
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
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Move kill_device_model to libxl__kill_xs_path so we have a helper to
kill a process from a pid stored in xenstore.  We'll be using it to kill
vchan-qmp-proxy.

libxl__kill_xs_path takes a "what" string for use in printing error
messages.  kill_device_model is retained in libxl_dm.c to provide the
string.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
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
index a57c13bdf4..10ca4226ba 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -3397,32 +3397,7 @@ out:
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
index 00cfbe1fac..32aa797714 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -2707,6 +2707,9 @@ int libxl__async_exec_start(libxl__async_exec_state *aes);
 bool libxl__async_exec_inuse(const libxl__async_exec_state *aes);
 
 _hidden void libxl__kill(libxl__gc *gc, pid_t pid, int sig, const char *what);
+/* kill SIGHUP a pid stored in xenstore */
+_hidden int libxl__kill_xs_path(libxl__gc *gc, const char *xs_path_pid,
+                                const char *what);
 
 /*----- device addition/removal -----*/
 
-- 
2.20.1


