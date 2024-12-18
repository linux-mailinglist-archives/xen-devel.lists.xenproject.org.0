Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EC49F6DA9
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 19:55:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860730.1272725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNzCG-0002gM-VM; Wed, 18 Dec 2024 18:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860730.1272725; Wed, 18 Dec 2024 18:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNzCG-0002es-Sd; Wed, 18 Dec 2024 18:55:00 +0000
Received: by outflank-mailman (input) for mailman id 860730;
 Wed, 18 Dec 2024 18:54:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNzCF-0002em-Ob
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 18:54:59 +0000
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 938fec8e-bd71-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 19:54:57 +0100 (CET)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9f60bf4so10840473a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 10:54:57 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9638feb1sm588614666b.148.2024.12.18.10.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 10:54:56 -0800 (PST)
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
X-Inumbo-ID: 938fec8e-bd71-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734548097; x=1735152897; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8103aj5lrJEj1q3pqVlywEA8Z37eSmoPB+FzM9bQTh8=;
        b=HRY5CAc7uNCS1Iwz/rZ42WjwdRMW7tM2lwksCREwY+w/Hc8odCqG6AskUW1FODDwIJ
         XSUupfDdtdo8xVT16YHmRLlolJXz1T0W5QeY3G2NIywUP19oaj0CJgdv2edVElzbBsh6
         jmNQr3yPUdKEFvNwCXt/nYAa7o9G7NlqPimhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734548097; x=1735152897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8103aj5lrJEj1q3pqVlywEA8Z37eSmoPB+FzM9bQTh8=;
        b=SIOqSGvBOncTHBabo+KMDP6CXs/FE9glaxAsjwitpYC5HqIWh8xZiSH8J7pcnBUnz1
         3CzX4cyvZ1bYFFegWpn443OSH+mJWu80hpyS6gN9kI636t0x88IZVZJaEDC5nbl6elpD
         a+nByIooMkb5T2S6JLgYUD/GAvAsgzhY6cJS+f+fRGpOSBWQSHFw5i7rtEhcVBmsEi4E
         hOxrATtiyfPEWpCrZ/XCZOygGJgtjqJFy6p7o1pwetg6S5vOO8B6GSNj9C5mJDKAV+zw
         K4z5HxAHKhLP+cH2IRRkL5qXMhkocY/1gI9f+L3+DJUK694EbgJFz5z5nuQCLECt/fJ+
         Ur8w==
X-Gm-Message-State: AOJu0Yz6Ywrz+W9a57oqjw0tbVWMOtcgJTBmLw6HmPsjZIMdT13ZW/sQ
	W1jgFz8056G3OvPsWkYmlNL8ZXLEp7IlbD4Or/ncgcjrhhKn0SYOb479Mh+3yizSn2bA65wIcM0
	oEw7zjA==
X-Gm-Gg: ASbGncu9hjor7+7EsfYUELSwteNjB1fIvuPUoXL1YVkPHJhuDbIjoXv4gmse3WDadlO
	x1I/LEVDgNE3OahYFTnu9OEValc4/6BUYDLH2udnIRCFh5Ajf0Q6S9Wk/8vECnp4pPkfnsjblGq
	mCj8ViiusCWineLEQifLoEV3oO5h1PdKP/y9s/7c2E+l4pWO2Acf76UlFMQEp9oukjiYb2zXSOA
	+hExoSxtq1ZF7MEvm3Gb/9FsFyHu2rerfiGrVG7SpUbBe0v/G+z4t1NZINxmD2DNy904uB06kkb
	gLpn5ZHm9dNk7p/0SjpsADZ65h77+rHBYNCc
X-Google-Smtp-Source: AGHT+IFb8b5rHNPaCvAiuqhDQKGrarCxaxWTHbvgqoCNRFC4fy2Lf4hIylAxu3ecEWq6MRvxqxKyTw==
X-Received: by 2002:a17:906:dc95:b0:aa6:8a1b:8b7c with SMTP id a640c23a62f3a-aabf46faf75mr352865766b.2.1734548096662;
        Wed, 18 Dec 2024 10:54:56 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2] tools/libxg: Don't gunzip the guests initrd
Date: Wed, 18 Dec 2024 18:54:53 +0000
Message-Id: <20241218185453.367465-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240904123121.3837140-1-andrew.cooper3@citrix.com>
References: <20240904123121.3837140-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Decompressing the kernel is necessary to inspect the ELF notes, but the
dombuilder will gunzip() secondary modules too.  Specifically gunzip(), no
other decompression algorithms.

This may have been necessary in the dim and distant past, but it is broken
today.  Linux specifically supports concatenating CPIO fragments of differing
compressions, and any attempt to interpret it with a single algorithm may
corrupt later parts.

This was an unexpected discovery while trying to test Xen's gunzip()
logic (Xen as a PVH guest, with a gzipped XTF kernel as dom0).

Intepreting secondary modules *should* be left as an exersize to the guest.
This reduces work done in dom0.

This is not expected to cause a practical different to guests these days.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * Rewrite the commit message.

If this does cause a problem, we can reintroduce it, but behind a config
option because it needs to not be on by default.

Linux's habit of prepending an uncompressed CPIO containing microcode is
likely to cause this logic to be skipped anyway.
---
 CHANGELOG.md                   |  2 ++
 tools/libs/guest/xg_dom_core.c | 40 ++++++----------------------------
 2 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 15f681459f22..61510e6a11c0 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -8,6 +8,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ### Changed
  - Fixed blkif protocol specification for sector sizes different than 512b.
+ - The dombuilder in libxenguest no longer un-gzips secondary modules, instead
+   leaving this to the guest kernel to do in guest context.
  - On x86:
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
    - Switched the xAPIC flat driver to use physical destination mode for external
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
2.39.5


