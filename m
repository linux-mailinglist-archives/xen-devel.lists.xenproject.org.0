Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785FD650DB7
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 15:46:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466152.725023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7HOu-0007GK-8n; Mon, 19 Dec 2022 14:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466152.725023; Mon, 19 Dec 2022 14:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7HOu-0007Dm-4y; Mon, 19 Dec 2022 14:45:56 +0000
Received: by outflank-mailman (input) for mailman id 466152;
 Mon, 19 Dec 2022 14:45:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUwz=4R=citrix.com=prvs=345b0463a=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1p7HOs-0006ib-0K
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 14:45:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6170f21-7fab-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 15:45:52 +0100 (CET)
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
X-Inumbo-ID: d6170f21-7fab-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671461152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ZYFxkj9X/U5+jpRj/Koq1z+I/rVSV2S71DiPtKUVOes=;
  b=FMK3ysi78ky7KbqQX5s+Y8jTEmip5jckgGd6u5oik0OJMdV1mvGl+P5G
   6HrtfW4S+pSqKEUQRRdJlW2A/Z+Fbfr6D0iHV0rSeKGWYT13eVYqFtRyc
   U8gn0S7oee2X+agTA0wjcgHnpxhdoh32bthA8nmZ4pS0ZogSQnHf+L4y0
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88063314
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JyxMPq2X4Rnh5D/ZIvbD5dxxkn2cJEfYwER7XKvMYLTBsI5bpzJUz
 mscC2iBbvuIYjb2edEja96zp00AsZ+DzIdnG1ZvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZnNKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfCmh25
 6wHc2A0T1O4hLiV+OylZ+llmZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWh+qyiXTuNTFJoUmRpII84nTJzRw327/oWDbQUozaHZsOxR/Ez
 o7A1yPQKTwXO+3E8z2cyl2Kpe2Xxi7Fe51HQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmPwKfJ5weSBkAfUyVMLtchsacLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aMiEtPz8dPn89bEg+4IPAmN8toxLGUYM2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD3272k5JAVdoKiN2bGKuOGphsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QRO8MhJFTZonE/NCZ8OlwBd2B1zckC1
 WqzK57wXR7294w8pNZJewvt+eBynX1vrY8ibZv60w6mwdKjWZJhcp9caAHmRrlgvMu5TPD9r
 4432z2il08OD4UTo0D/reYuELz9BSNgVM2p9ZAKK7brz8gPMDhJNsI9CIgJI+RN95m5XM+Tl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:Gj/bcKooFfZUkV+h5TxMcmkaV5oUeYIsimQD101hICG9vPbo7v
 xG/c5rrSMc7Qx6ZJhOo6HkBEDtewK/yXcx2/hzAV7AZmjbUQmTXeVfBOLZqlWKJ8S9zI5gPM
 xbAs9D4bPLfD5HZAXBjDVQ0exM/DBKys+VbC7loUtQcQ==
X-IronPort-AV: E=Sophos;i="5.96,255,1665460800"; 
   d="scan'208";a="88063314"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH v2 2/3] x86/ucode: allow cpu_request_microcode() to skip memory allocation
Date: Mon, 19 Dec 2022 14:45:32 +0000
Message-ID: <20221219144533.19836-3-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221219144533.19836-1-sergey.dyasli@citrix.com>
References: <20221219144533.19836-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This is a preparatory step in order to do earlier microcode loading on
the boot CPU when the domain heap has not been initialized yet and
xmalloc still unavailable.

Add make_copy argument which will allow to load microcode directly from
the blob bypassing microcode_cache.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

---
v1 --> v2:
- Don't add extra consts
---
 xen/arch/x86/cpu/microcode/amd.c     | 13 +++++++++----
 xen/arch/x86/cpu/microcode/core.c    |  2 +-
 xen/arch/x86/cpu/microcode/intel.c   | 13 +++++++++----
 xen/arch/x86/cpu/microcode/private.h | 15 +++++++++++----
 4 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 8195707ee1..4b097187a0 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -300,7 +300,7 @@ static int scan_equiv_cpu_table(const struct container_equiv_table *et)
 }
 
 static struct microcode_patch *cf_check cpu_request_microcode(
-    const void *buf, size_t size)
+    const void *buf, size_t size, bool make_copy)
 {
     const struct microcode_patch *saved = NULL;
     struct microcode_patch *patch = NULL;
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
+            patch = (struct microcode_patch *)saved;
     }
 
     if ( error && !patch )
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 452a7ca773..85c05e480d 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -244,7 +244,7 @@ static struct microcode_patch *parse_blob(const char *buf, size_t len)
 {
     alternative_vcall(ucode_ops.collect_cpu_info);
 
-    return alternative_call(ucode_ops.cpu_request_microcode, buf, len);
+    return alternative_call(ucode_ops.cpu_request_microcode, buf, len, true);
 }
 
 static void microcode_free_patch(struct microcode_patch *patch)
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f5ba6d76d7..f7fec4b4ed 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -324,7 +324,7 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
 }
 
 static struct microcode_patch *cf_check cpu_request_microcode(
-    const void *buf, size_t size)
+    const void *buf, size_t size, bool make_copy)
 {
     int error = 0;
     const struct microcode_patch *saved = NULL;
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
+            patch = (struct microcode_patch *)saved;
     }
 
     if ( error && !patch )
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index c085a10268..58c5dffd7b 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -23,15 +23,22 @@ struct microcode_ops {
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
     struct microcode_patch *(*cpu_request_microcode)(const void *buf,
-                                                     size_t size);
+                                                     size_t size,
+                                                     bool make_copy);
 
     /*
      * Obtain microcode-relevant details for the current CPU.  Results in
-- 
2.17.1


