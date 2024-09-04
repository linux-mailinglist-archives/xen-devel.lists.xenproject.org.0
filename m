Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C031596BC84
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790235.1199972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpFo-0003C4-Kn; Wed, 04 Sep 2024 12:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790235.1199972; Wed, 04 Sep 2024 12:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpFo-00039a-Ga; Wed, 04 Sep 2024 12:36:56 +0000
Received: by outflank-mailman (input) for mailman id 790235;
 Wed, 04 Sep 2024 12:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slpAU-00086h-Nb
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:31:26 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a2e1f62-6ab9-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 14:31:26 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a86859e2fc0so738757866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 05:31:26 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d71b4sm804608166b.160.2024.09.04.05.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 05:31:23 -0700 (PDT)
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
X-Inumbo-ID: 9a2e1f62-6ab9-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725453085; x=1726057885; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmZ6PfZMZePpyM0GA2le7epa2mav3GCg/JuHCI8H30A=;
        b=e9W1IvK1tOvl90XJvtQpl+K/+GlX9I/G/TUtdIVaGZv2wrycB6ofwB9vmm7trVUOwH
         Ch7VUZUZsMjTkC7v87mKWIkMKG+DGLDGrCKTLhPhl9GUKkcBzw8LOKI09YW7yJ3mpyzS
         8ghsuV3D3uBrcOun76Sulb6jiC8MVRoyYxKvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725453085; x=1726057885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmZ6PfZMZePpyM0GA2le7epa2mav3GCg/JuHCI8H30A=;
        b=jB9Loa//BJrjZ/gDWpLPao9yVmy4th+ghhTyoPyMSKRw4aex6646DAKba55fhT4Daw
         og6dfgSdfWUXFY8JBZb+uEMUqAOm4RrJ51dcvoip38n6FFBNqfUg/+BLgTZKzwFKIKnq
         NdG3tOrDIC8PanYRAk+WttDn00VqxMuJzPb0PpEGZPTTImEEdhW960q8se9QTzKw69Xt
         fTSwIO9mMdfu3h9JlrobjvSPRX3Gr+dfkA92BSvco/kNdvhzgoxct1llD7iJB3ywzIGm
         7ZvPZcvgBbU0wxbkmVsIjc2x3EnPYD0RfK6G5DeXgGywgofH0ouUAupm8IpcJEU+nv90
         4qyg==
X-Gm-Message-State: AOJu0YxZBA39QFcEerMMb691JS3mVZgk+eX5uRWeCPtXCRD6AQ811652
	yViX6G3Iagc77FlR33mB8ssUWuWAySJ+4cKVx+cWpC9/bGh2o3UxyfyieolT8RmW0M68A1fN/v9
	M
X-Google-Smtp-Source: AGHT+IEyutWxf33+7ZhDXKTjQ9flOnSbiSzsOxZuT1t8Y/ztjC8d1B55MGKjmXV0UuXEglJ5e9UoHw==
X-Received: by 2002:a17:907:e8d:b0:a86:899d:6459 with SMTP id a640c23a62f3a-a8a32eda727mr305637666b.38.1725453084289;
        Wed, 04 Sep 2024 05:31:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] tools/libxg: Don't gunzip the guests initrd
Date: Wed,  4 Sep 2024 13:31:21 +0100
Message-Id: <20240904123121.3837140-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When booting guests, compressed first executables (the kernel itself for
direct-boot, or firmware binaries) need decompressing in order to inspect the
ELF notes or other relevant headers.

However for unclear reasons, libxenguest will also gunzip() all modules which
happen to be compressed (typically a direct-boot kernel's initrd), before
loading the contents into guest memory.

This was an unexpected discovery while trying to test Xen's gunzip()
logic (Xen as a PVH guest, with a gzipped XTF kernel as dom0).

More generally, it is work that we should not be doing in the domain builder;
it can and should be done in guest context.

This is unlikely to cause any issues; a kernel incapable of decompression
wouldn't have a compressed initrd to start with, and these days there are
other algorithms typically preferred over gzip.

Furthermore, this change also fixes a bug with Linux guests.  Linux is happy
consuming a initrd constructed of multiple CPIO fragments, including with
differing compression, and Xen gunzip()'ing from the start would result in all
subsequent fragments being silently dropped during load.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Furthermore, Linux's habit of prepending an uncompressed CPIO containing
microcode will also stop it being recognised as a compressed blob.
---
 CHANGELOG.md                   |  2 ++
 tools/libs/guest/xg_dom_core.c | 40 ++++++----------------------------
 2 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5521ae5bb37a..342d8c6073be 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.20.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - The dombuilder in libxenguest no longer un-gzips secondary modules, instead
+   leaving this to the guest kernel to do in guest context.
  - On x86:
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
 
diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
index f5521d528be1..595b0a667c03 100644
--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -980,37 +980,24 @@ int xc_dom_mem_init(struct xc_dom_image *dom, unsigned int mem_mb)
 
 static int xc_dom_build_module(struct xc_dom_image *dom, unsigned int mod)
 {
-    size_t unziplen, modulelen;
+    size_t modulelen;
     void *modulemap;
     char name[10];
 
-    if ( !dom->modules[mod].seg.vstart )
-        unziplen = xc_dom_check_gzip(dom->xch,
-                                     dom->modules[mod].blob, dom->modules[mod].size);
-    else
-        unziplen = 0;
+    modulelen = dom->modules[mod].size;
 
-    modulelen = max(unziplen, dom->modules[mod].size);
-    if ( dom->max_module_size )
+    if ( dom->max_module_size && modulelen > dom->max_module_size )
     {
-        if ( unziplen && modulelen > dom->max_module_size )
-        {
-            modulelen = min(unziplen, dom->modules[mod].size);
-            if ( unziplen > modulelen )
-                unziplen = 0;
-        }
-        if ( modulelen > dom->max_module_size )
-        {
-            xc_dom_panic(dom->xch, XC_INVALID_KERNEL,
-                         "module %u image too large", mod);
-            goto err;
-        }
+        xc_dom_panic(dom->xch, XC_INVALID_KERNEL,
+                     "module %u image too large", mod);
+        goto err;
     }
 
     snprintf(name, sizeof(name), "module%u", mod);
     if ( xc_dom_alloc_segment(dom, &dom->modules[mod].seg, name,
                               dom->modules[mod].seg.vstart, modulelen) != 0 )
         goto err;
+
     modulemap = xc_dom_seg_to_ptr(dom, &dom->modules[mod].seg);
     if ( modulemap == NULL )
     {
@@ -1018,21 +1005,8 @@ static int xc_dom_build_module(struct xc_dom_image *dom, unsigned int mod)
                   __FUNCTION__, mod);
         goto err;
     }
-    if ( unziplen )
-    {
-        if ( xc_dom_do_gunzip(dom->xch, dom->modules[mod].blob, dom->modules[mod].size,
-                              modulemap, unziplen) != -1 )
-            return 0;
-        if ( dom->modules[mod].size > modulelen )
-            goto err;
-    }
 
-    /* Fall back to handing over the raw blob. */
     memcpy(modulemap, dom->modules[mod].blob, dom->modules[mod].size);
-    /* If an unzip attempt was made, the buffer may no longer be all zero. */
-    if ( unziplen > dom->modules[mod].size )
-        memset(modulemap + dom->modules[mod].size, 0,
-               unziplen - dom->modules[mod].size);
 
     return 0;
 
-- 
2.39.2


