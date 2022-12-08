Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F01C6470C2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 14:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457126.714974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3GvK-0000aV-EL; Thu, 08 Dec 2022 13:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457126.714974; Thu, 08 Dec 2022 13:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3GvK-0000XD-Ak; Thu, 08 Dec 2022 13:26:50 +0000
Received: by outflank-mailman (input) for mailman id 457126;
 Thu, 08 Dec 2022 13:26:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MTro=4G=citrix.com=prvs=334a0184e=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1p3GvJ-0000X7-Dk
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 13:26:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5a6bbf2-76fb-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 14:26:46 +0100 (CET)
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
X-Inumbo-ID: f5a6bbf2-76fb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670506007;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ZPfarfZcEejGSJqVF4CTnChPnnzcwhgygBNP/5MhZXk=;
  b=UYEXhOl5b8/Jna+0iVYl60UPP6ZxImBwjDUGLfAvG7F4iuczwsDyjwWt
   tWOJK7uMJW4zmkDY8wf++KK5lNYVoEYWfo4b7t1TLiVtLp+D3MCqGsLqq
   tEB6CL+KpOpM8A2h3eFm+4T5y2SQfQHMLWfPbWYlgFDtpS9SXaREYJc2a
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87664792
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:joPi/aAzYZ8/yhVW/yLjw5YqxClBgxIJ4kV8jS/XYbTApG8jg2MAm
 mIdUWCGOfiIYTGnfNEga9yz/EhXupHUn9ZiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlA7gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4sVcHjge3
 PchAXNSdDeSt8+KxYmLVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/E58kk+q5wHXueiZcqXqepLYt4niVxwt0uFToGIqKJILWGpQP9qqej
 kDK1n/BLzoxDt2WzWag8zGRm7b+jDyuDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8tRCZJnFFBGQ7TGxbVywU0/TfpboDkUeaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8N5n9hO0yT5FWy13N2ZDBkBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66LNoYVMsAqLVXZpEmCgHJ8OEi0wSARfVwXY
 8/HIa5A815FYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PRaopUM+GALWNIgRtfrUyDg5B
 v4Db6NmPT0DCryhCsQWmKZPRW03wY8TXMyt95QNKLfcSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:Jq2DjKy/i1XwqTZQno+fKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.96,227,1665460800"; 
   d="scan'208";a="87664792"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH 1/2] x86/ucode: allow cpu_request_microcode() to skip memory allocation
Date: Thu, 8 Dec 2022 13:26:38 +0000
Message-ID: <20221208132639.29942-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

This is a preparatory step in order to do earlier microcode loading on
the boot CPU when the domain heap has not been initialized yet and
xmalloc still unavailable.

Add make_copy argument which will allow to load microcode directly from
the blob bypassing microcode_cache. Add const qualifiers where required.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c     | 17 +++++++++++------
 xen/arch/x86/cpu/microcode/core.c    | 18 +++++++++---------
 xen/arch/x86/cpu/microcode/intel.c   | 17 +++++++++++------
 xen/arch/x86/cpu/microcode/private.h | 18 ++++++++++++------
 4 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 8195707ee1..d4df3c4806 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -299,11 +299,11 @@ static int scan_equiv_cpu_table(const struct container_equiv_table *et)
     return -ESRCH;
 }
 
-static struct microcode_patch *cf_check cpu_request_microcode(
-    const void *buf, size_t size)
+static const struct microcode_patch *cf_check cpu_request_microcode(
+    const void *buf, size_t size, bool make_copy)
 {
     const struct microcode_patch *saved = NULL;
-    struct microcode_patch *patch = NULL;
+    const struct microcode_patch *patch = NULL;
     size_t saved_size = 0;
     int error = 0;
 
@@ -411,9 +411,14 @@ static struct microcode_patch *cf_check cpu_request_microcode(
 
     if ( saved )
     {
-        patch = xmemdup_bytes(saved, saved_size);
-        if ( !patch )
-            error = -ENOMEM;
+        if ( make_copy )
+        {
+            patch = xmemdup_bytes(saved, saved_size);
+            if ( !patch )
+                error = -ENOMEM;
+        }
+        else
+            patch = saved;
     }
 
     if ( error && !patch )
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 452a7ca773..924a2bd7b5 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -99,7 +99,7 @@ static bool ucode_in_nmi = true;
 bool __read_mostly opt_ucode_allow_same;
 
 /* Protected by microcode_mutex */
-static struct microcode_patch *microcode_cache;
+static const struct microcode_patch *microcode_cache;
 
 void __init microcode_set_module(unsigned int idx)
 {
@@ -240,20 +240,20 @@ static const struct microcode_patch *nmi_patch = ZERO_BLOCK_PTR;
  * patch is found and an error occurs during the parsing process. Otherwise
  * return NULL.
  */
-static struct microcode_patch *parse_blob(const char *buf, size_t len)
+static const struct microcode_patch *parse_blob(const char *buf, size_t len)
 {
     alternative_vcall(ucode_ops.collect_cpu_info);
 
-    return alternative_call(ucode_ops.cpu_request_microcode, buf, len);
+    return alternative_call(ucode_ops.cpu_request_microcode, buf, len, true);
 }
 
-static void microcode_free_patch(struct microcode_patch *patch)
+static void microcode_free_patch(const struct microcode_patch *patch)
 {
-    xfree(patch);
+    xfree((void *)patch);
 }
 
 /* Return true if cache gets updated. Otherwise, return false */
-static bool microcode_update_cache(struct microcode_patch *patch)
+static bool microcode_update_cache(const struct microcode_patch *patch)
 {
     ASSERT(spin_is_locked(&microcode_mutex));
 
@@ -565,7 +565,7 @@ static long cf_check microcode_update_helper(void *data)
     int ret;
     struct ucode_buf *buffer = data;
     unsigned int cpu, updated;
-    struct microcode_patch *patch;
+    const struct microcode_patch *patch;
 
     /* cpu_online_map must not change during update */
     if ( !get_cpu_maps() )
@@ -648,7 +648,7 @@ static long cf_check microcode_update_helper(void *data)
      *   this requirement can be relaxed in the future. Right now, this is
      *   conservative and good.
      */
-    ret = stop_machine_run(do_microcode_update, patch, NR_CPUS);
+    ret = stop_machine_run(do_microcode_update, (void *)patch, NR_CPUS);
 
     updated = atomic_read(&cpu_updated);
     if ( updated > 0 )
@@ -738,7 +738,7 @@ static int __init early_microcode_update_cpu(void)
     int rc = 0;
     const void *data = NULL;
     size_t len;
-    struct microcode_patch *patch;
+    const struct microcode_patch *patch;
 
     if ( ucode_blob.size )
     {
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f5ba6d76d7..017f37e43d 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -323,12 +323,12 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
     return 0;
 }
 
-static struct microcode_patch *cf_check cpu_request_microcode(
-    const void *buf, size_t size)
+static const struct microcode_patch *cf_check cpu_request_microcode(
+    const void *buf, size_t size, bool make_copy)
 {
     int error = 0;
     const struct microcode_patch *saved = NULL;
-    struct microcode_patch *patch = NULL;
+    const struct microcode_patch *patch = NULL;
 
     while ( size )
     {
@@ -364,10 +364,15 @@ static struct microcode_patch *cf_check cpu_request_microcode(
 
     if ( saved )
     {
-        patch = xmemdup_bytes(saved, get_totalsize(saved));
+        if ( make_copy )
+        {
+            patch = xmemdup_bytes(saved, get_totalsize(saved));
 
-        if ( !patch )
-            error = -ENOMEM;
+            if ( !patch )
+                error = -ENOMEM;
+        }
+        else
+            patch = saved;
     }
 
     if ( error && !patch )
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index c085a10268..98657d39c3 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -23,16 +23,22 @@ struct microcode_ops {
      * older that what is running in the CPU.  This is a feature, to better
      * cope with corner cases from buggy firmware.)
      *
-     * If one is found, allocate and return a struct microcode_patch
-     * encapsulating the appropriate microcode patch.  Does not alias the
-     * original buffer.  Must be suitable to be freed with a single xfree().
+     * If one is found, behaviour depends on the make_copy argument:
+     *
+     *     true: allocate and return a struct microcode_patch encapsulating
+     *           the appropriate microcode patch.  Does not alias the original
+     *           buffer.  Must be suitable to be freed with a single xfree().
+     *
+     *    false: return a pointer to the patch within the original buffer.
+     *           This is useful for early microcode loading when xmalloc might
+     *           not be available yet.
      *
      * If one is not found, (nothing matches the current CPU), return NULL.
      * Also may return ERR_PTR(-err), e.g. bad container, out of memory.
      */
-    struct microcode_patch *(*cpu_request_microcode)(const void *buf,
-                                                     size_t size);
-
+    const struct microcode_patch *(*cpu_request_microcode)(const void *buf,
+                                                           size_t size,
+                                                           bool make_copy);
     /*
      * Obtain microcode-relevant details for the current CPU.  Results in
      * per_cpu(cpu_sig).
-- 
2.17.1


