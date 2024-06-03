Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5629F8D85AE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 17:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734944.1141079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE9A6-0000D8-5H; Mon, 03 Jun 2024 14:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734944.1141079; Mon, 03 Jun 2024 14:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE9A6-0000Ai-1p; Mon, 03 Jun 2024 14:59:50 +0000
Received: by outflank-mailman (input) for mailman id 734944;
 Mon, 03 Jun 2024 14:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LFL5=NF=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sE9A4-0000Ab-Lt
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 14:59:48 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e84896b9-21b9-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 16:59:42 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a66e9eac48fso2267366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 07:59:42 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a685b935b5csm464114866b.206.2024.06.03.07.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 07:59:40 -0700 (PDT)
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
X-Inumbo-ID: e84896b9-21b9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1717426781; x=1718031581; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+JA14AOgEuKBKYAkFvlW6fpt/3ZUuvQg25+31+429CY=;
        b=k+xzKYs7zcOulCMfgoyL4KLhfELcAUzob6htf+kKUOi11Af0NzF7zQqOEBK5rH6uyV
         ZetTAwjowCwP/4G9bTjmZUVDZg4/Mjo1gN2vaJjzze9dXFBLsAp41Oug5G2iEjj5igux
         HJy/dzEqTjOrtcSQLZ+xhbgD2CvpE1LsGcBLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717426781; x=1718031581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JA14AOgEuKBKYAkFvlW6fpt/3ZUuvQg25+31+429CY=;
        b=BSZBLSnDLgIZAvLBK9WwHwl/nRisD1c3Xt2pvrIJ2pmN093EPVBTdt7+Y1D4kA0onz
         sKIzDRRp0yv4xkSEMhW9dqF3wVw4CfhS2hxGX2cYVismylSAKZVS8g0/Xk6Z/+atjfZy
         Ea/ggUr6EEiRF1nPUIv4FwolhprjPaj/TKh3oUBztgfjuDgWf3ZXVXpPtHAHCrz9OuUS
         rntNSGkfOMMnF5lW3EzbpiespXlGKbvbd7EgeIgU9Vkd2mV8mz7DrNKKMVgblAtYBjsr
         72KKg7gRQbM+9P7o9aGOjTfqstsWF1ILxX7X/LPIQEYB7gSOjjBKL6kI537EeBZv1fft
         Rd8w==
X-Gm-Message-State: AOJu0YwK5n9Nsl1D59+FNKQ2AjfoxxIor1H2jZVm3gXHSJtWgL1mfYSr
	VgPJilD1pzFIE2i5xpO1FC/Z62+ivG5eSkhLCgAbgGkcBe81LSmH7+rJH3IXNS6xMAgCeRcpuPL
	l
X-Google-Smtp-Source: AGHT+IGIdwQtkxRsIrywJihfXR582ob4fbTWFwhOGhA4eNRNhIzbkUvc081KuhaSxyV2ONFN7D9plA==
X-Received: by 2002:a17:906:56ca:b0:a68:f43f:6f31 with SMTP id a640c23a62f3a-a68f43f708fmr240161266b.64.1717426781323;
        Mon, 03 Jun 2024 07:59:41 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH] tools/misc: xen-hvmcrash: Inject #DF instead of overwriting RIP
Date: Mon,  3 Jun 2024 15:59:18 +0100
Message-Id: <27f4397093d92b53f89d625d682bd4b7145b65d8.1717426439.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen-hvmcrash would previously save records, overwrite the instruction
pointer with a bogus value, and then restore them to crash a domain
just enough to cause the guest OS to memdump.

This approach is found to be unreliable when tested on a guest running
Windows 10 x64, with some executions doing nothing at all.

Another approach would be to trigger NMIs. This approach is found to be
unreliable when tested on Linux (Ubuntu 22.04), as Linux will ignore
NMIs if it is not configured to handle such.

Injecting a double fault abort to all vCPUs is found to be more
reliable at crashing and invoking memdumps from Windows and Linux
domains.

This patch modifies the xen-hvmcrash tool to inject #DF to all vCPUs
belonging to the specified domain, instead of overwriting RIP.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 tools/misc/xen-hvmcrash.c | 77 +++++++--------------------------------
 1 file changed, 13 insertions(+), 64 deletions(-)

diff --git a/tools/misc/xen-hvmcrash.c b/tools/misc/xen-hvmcrash.c
index 1d058fa40a47..8ef1beb388f8 100644
--- a/tools/misc/xen-hvmcrash.c
+++ b/tools/misc/xen-hvmcrash.c
@@ -38,22 +38,21 @@
 #include <sys/stat.h>
 #include <arpa/inet.h>
 
+#define XC_WANT_COMPAT_DEVICEMODEL_API
 #include <xenctrl.h>
 #include <xen/xen.h>
 #include <xen/domctl.h>
 #include <xen/hvm/save.h>
 
+#define X86_ABORT_DF 8
+
 int
 main(int argc, char **argv)
 {
     int domid;
     xc_interface *xch;
     xc_domaininfo_t dominfo;
-    int ret;
-    uint32_t len;
-    uint8_t *buf;
-    uint32_t off;
-    struct hvm_save_descriptor *descriptor;
+    int vcpu_id, ret;
 
     if (argc != 2 || !argv[1] || (domid = atoi(argv[1])) < 0) {
         fprintf(stderr, "usage: %s <domid>\n", argv[0]);
@@ -77,66 +76,16 @@ main(int argc, char **argv)
         exit(1);
     }
 
-    ret = xc_domain_pause(xch, domid);
-    if (ret < 0) {
-        perror("xc_domain_pause");
-        exit(-1);
-    }
-
-    /*
-     * Calling with zero buffer length should return the buffer length
-     * required.
-     */
-    ret = xc_domain_hvm_getcontext(xch, domid, 0, 0);
-    if (ret < 0) {
-        perror("xc_domain_hvm_getcontext");
-        exit(1);
-    }
-    
-    len = ret;
-    buf = malloc(len);
-    if (buf == NULL) {
-        perror("malloc");
-        exit(1);
-    }
-
-    ret = xc_domain_hvm_getcontext(xch, domid, buf, len);
-    if (ret < 0) {
-        perror("xc_domain_hvm_getcontext");
-        exit(1);
-    }
-
-    off = 0;
-
-    while (off < len) {
-        descriptor = (struct hvm_save_descriptor *)(buf + off);
-
-        off += sizeof (struct hvm_save_descriptor);
-
-        if (descriptor->typecode == HVM_SAVE_CODE(CPU)) {
-            HVM_SAVE_TYPE(CPU) *cpu;
-
-            /* Overwrite EIP/RIP with some recognisable but bogus value */
-            cpu = (HVM_SAVE_TYPE(CPU) *)(buf + off);
-            printf("CPU[%d]: RIP = %" PRIx64 "\n", descriptor->instance, cpu->rip);
-            cpu->rip = 0xf001;
-        } else if (descriptor->typecode == HVM_SAVE_CODE(END)) {
-            break;
+    for (vcpu_id = 0; vcpu_id <= dominfo.max_vcpu_id; vcpu_id++) {
+        printf("Injecting #DF to vcpu ID #%d...\n", vcpu_id);
+        ret = xc_hvm_inject_trap(xch, domid, vcpu_id,
+                                X86_ABORT_DF,
+                                XEN_DMOP_EVENT_hw_exc, 0,
+                                NULL, NULL);
+        if (ret < 0) {
+            fprintf(stderr, "Could not inject #DF to vcpu ID #%d\n", vcpu_id);
+            perror("xc_hvm_inject_trap");
         }
-
-        off += descriptor->length;
-    }
-
-    ret = xc_domain_hvm_setcontext(xch, domid, buf, len);
-    if (ret < 0) {
-        perror("xc_domain_hvm_setcontext");
-        exit(1);
-    }
-
-    ret = xc_domain_unpause(xch, domid);
-    if (ret < 0) {
-        perror("xc_domain_unpause");
-        exit(1);
     }
 
     return 0;
-- 
2.34.1


