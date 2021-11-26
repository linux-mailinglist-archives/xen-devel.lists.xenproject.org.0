Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1272C45EE87
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232762.403728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauZ-00079d-MG; Fri, 26 Nov 2021 13:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232762.403728; Fri, 26 Nov 2021 13:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauZ-00071M-8M; Fri, 26 Nov 2021 13:05:07 +0000
Received: by outflank-mailman (input) for mailman id 232762;
 Fri, 26 Nov 2021 13:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauV-0003W9-UC
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:04 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7790ee42-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:02 +0100 (CET)
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
X-Inumbo-ID: 7790ee42-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=68x0fT4tZlqz9kHnlGXMQc+oz8hTkbs5wEWSP4Ikepk=;
  b=L2hevmt+OBV/h2oFXjxZk53rZkomfGfTElgO1w1Cvz3/QDRb8my2v6yQ
   7vGcJX4IMvMcGN2M97xETiv01Q6K8AxGfj3Mn3cpgvU49FGkMTi/JSFwD
   EEJnvptprbtTBEPGB6YrsQ216aLBS6K2Lkft/vWTfEpwxbPGK2q4dG5D6
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7oAFDYuEYgaCKzyUVMpfzCGZeKaLzz0oIodgWpZhGW06SdI24LD3zuOxByjunmQjbb+ySe7W3J
 TumNNC8JrmLf1zGvEJq05WqtE/26F0VyPyVuIEtdmPKxYgCQcTGJqVEQrNm7Crk43MvtCPqnji
 GyjmzVAK3r0L9zImEWftvgsoqKHcnqCE0z1ooATRWTibo+nr6j8zhcUUh+kCXR8Bojj6NhOYk7
 O2LuP2mYoLEqXazuhI9lxC9SV4Viqa8OdXLQqltH9OSkC52uqW53iud/zAz8wiJMu3f8FxC9xN
 4mOWzZZtRJZdsHHsaoaAYpON
X-SBRS: 5.1
X-MesageID: 58676346
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RqW/8a5TWXtcczz7n6KgkAxRtM3AchMFZxGqfqrLsTDasY5as4F+v
 mIcWGGFMq6OZ2fzKNF0Ot+08kJXvZHRmtZnSgtsqi8yHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 /B2l5mQSVsSZYKdwdwtdhdfM3hkMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTTaiBO
 ZFFN1KDajzkQC0IEU0GCqkTo+GiqWPlchRWmg2K8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u12bkBhAXMvSPxDzD9Wij7sfUhj/yUo8WELy+99ZpjUeVy2hVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWqbEm/85eU8QjpFnlMFV8naygkFBEKtoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNt1shPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWA3jaD/LF7rlxBHkJPm6gLu1mSw28zb645lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIERMsYsK17bon01DaJ144wLuBN3+U3YE
 c3GGftA8F5AUfg3pNZIb7t1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3mGmaZOfAtiBSVqWvjLRzl/K7frzvxOQzp6VZc8ANoJJuRYokiivruSo
 yzmBBYHkAGXaL+uAVziV02PoYjHBf5XxU/X9wR2Vbpx83R8M4up8okFcJ47Iesu+OB5lKYmR
 PgZYcSQRP9IT22fqTgaaJD8qq1kdQiq2l3Sb3b0PmBncs4yXRHN9//lYhDrqHsEAB2ouJZsu
 LanzA7aH8YOHlwwEMbMZfuz5FqtpnxByvlqVk7FL4ALKkXh+YRnMQLrifozL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSDpzit245NVuqMbAvxbmKs9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy7IF6wu7X
 kWDpotTNbmTYZ63FVcQIEwub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4YNE/3
 OMsmM8K8Aju2BMlP+GPgj1Q62nRfGcLVL8qt81CDYLm4ubxJoquvXAI5vfK3ayy
IronPort-HdrOrdr: A9a23:RzLJtawemZW0Xs9NectoKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58676346"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 22/65] xen/decompress: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:03 +0000
Message-ID: <20211126123446.32324-23-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/guest/xg_dom_decompress_unsafe.h | 4 ++++
 xen/common/bunzip2.c                        | 2 +-
 xen/common/decompress.c                     | 2 +-
 xen/common/unlzma.c                         | 2 +-
 xen/common/zstd/zstd_common.c               | 4 ++--
 xen/common/zstd/zstd_internal.h             | 4 ++--
 6 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/libs/guest/xg_dom_decompress_unsafe.h b/tools/libs/guest/xg_dom_decompress_unsafe.h
index 4e0bf23aa587..98b8a8a40971 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe.h
+++ b/tools/libs/guest/xg_dom_decompress_unsafe.h
@@ -8,6 +8,10 @@ typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
                           void (*error)(const char *x));
 #endif
 
+#ifndef cf_check
+#define cf_check
+#endif
+
 int xc_dom_decompress_unsafe(
     decompress_fn fn, struct xc_dom_image *dom, void **blob, size_t *size)
     __attribute__((visibility("internal")));
diff --git a/xen/common/bunzip2.c b/xen/common/bunzip2.c
index 2087cfbbedc8..782b589a8b01 100644
--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -607,7 +607,7 @@ static int __init read_bunzip(struct bunzip_data *bd, unsigned char *outbuf, int
 	goto decode_next_byte;
 }
 
-static int __init nofill(void *buf, unsigned int len)
+static int __init cf_check nofill(void *buf, unsigned int len)
 {
 	return -1;
 }
diff --git a/xen/common/decompress.c b/xen/common/decompress.c
index 79e60f4802d5..989336983f61 100644
--- a/xen/common/decompress.c
+++ b/xen/common/decompress.c
@@ -3,7 +3,7 @@
 #include <xen/string.h>
 #include <xen/decompress.h>
 
-static void __init error(const char *msg)
+static void __init cf_check error(const char *msg)
 {
     printk("%s\n", msg);
 }
diff --git a/xen/common/unlzma.c b/xen/common/unlzma.c
index d0ef78eef0d1..6cd99023adf6 100644
--- a/xen/common/unlzma.c
+++ b/xen/common/unlzma.c
@@ -76,7 +76,7 @@ struct rc {
 #define RC_MODEL_TOTAL_BITS 11
 
 
-static int __init nofill(void *buffer, unsigned int len)
+static int __init cf_check nofill(void *buffer, unsigned int len)
 {
 	return -1;
 }
diff --git a/xen/common/zstd/zstd_common.c b/xen/common/zstd/zstd_common.c
index 9a85e938cdd6..5c44e5db7671 100644
--- a/xen/common/zstd/zstd_common.c
+++ b/xen/common/zstd/zstd_common.c
@@ -54,12 +54,12 @@ void *__init ZSTD_stackAllocAll(void *opaque, size_t *size)
 	return stack_push(stack, *size);
 }
 
-void *__init ZSTD_stackAlloc(void *opaque, size_t size)
+void *__init cf_check ZSTD_stackAlloc(void *opaque, size_t size)
 {
 	ZSTD_stack *stack = (ZSTD_stack *)opaque;
 	return stack_push(stack, size);
 }
-void __init ZSTD_stackFree(void *opaque, void *address)
+void __init cf_check ZSTD_stackFree(void *opaque, void *address)
 {
 	(void)opaque;
 	(void)address;
diff --git a/xen/common/zstd/zstd_internal.h b/xen/common/zstd/zstd_internal.h
index b7dd14f6ce79..94f8c586220e 100644
--- a/xen/common/zstd/zstd_internal.h
+++ b/xen/common/zstd/zstd_internal.h
@@ -351,8 +351,8 @@ typedef struct {
 ZSTD_customMem ZSTD_initStack(void *workspace, size_t workspaceSize);
 
 void *ZSTD_stackAllocAll(void *opaque, size_t *size);
-void *ZSTD_stackAlloc(void *opaque, size_t size);
-void ZSTD_stackFree(void *opaque, void *address);
+void *cf_check ZSTD_stackAlloc(void *opaque, size_t size);
+void cf_check ZSTD_stackFree(void *opaque, void *address);
 
 /*======  common function  ======*/
 
-- 
2.11.0


