Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C18D8AC9DF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 11:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709844.1108852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryqLb-0001nt-N6; Mon, 22 Apr 2024 09:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709844.1108852; Mon, 22 Apr 2024 09:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryqLb-0001m2-Jt; Mon, 22 Apr 2024 09:52:27 +0000
Received: by outflank-mailman (input) for mailman id 709844;
 Mon, 22 Apr 2024 09:52:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ds6W=L3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ryqLZ-0001X4-VS
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 09:52:25 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05b2b778-008e-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 11:52:25 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so3080018f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 02:52:25 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d590a000000b003437ad152f9sm11472139wrd.105.2024.04.22.02.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 02:52:24 -0700 (PDT)
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
X-Inumbo-ID: 05b2b778-008e-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713779544; x=1714384344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drPZty86Abw56CZZyAdI896Rwj7S92fYFAWqWuFlrdo=;
        b=irnFghkAxR7Y89jmIUcAuiGXdCTrcIbe0X5qLDAe2oSIfLlPtaZcCZhg69Hqaner1g
         BojaK/fAcx/O4w1s7AGZnR1Ip+lg+vW3kYDuI/W7z9k8ZkMJAdNLxM03sK9bP1foQOMR
         MBfn1muLwkvKmTbBUurowt6x8WtPZ+eRyJT84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713779544; x=1714384344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drPZty86Abw56CZZyAdI896Rwj7S92fYFAWqWuFlrdo=;
        b=qnin4EjR0Euv8EGIa0L91weWZfyvzivK18kArdxzPbfc85lXTe3b3pOIaXNRgIxApv
         X3MtXtxijvx0/mVoNZhX+rnXz6F1jdaAQjmP+1k9HQSH2LGIRryVDFfGKjmxDtatklS3
         QY46YyZT2ldJSueWFzy2H60fL0PYeLsR5VZRUs3Suag4/K7PUERMsnXp0EFIPhoZJMrg
         4YAeZlnGzq0IkcY8oXSGpTPqqEdVdc+qW1xqVROYhwLLlw/Q9uKSeCdwE6K4H8hYeUq5
         Jij7mGBc+SL2K9cQ6BYcjFj432t0Yj+3ifrkBULRpNqKwUngGj28z4qkplW7ICqTFFFh
         juYg==
X-Gm-Message-State: AOJu0YxdrY5nzStREdT0bijLO+Nowl3lt3kzjzT8aNsB8CJpILRVU1ac
	dnlVsOSxIvWvmiZ+FtWtAvPFUmzrqWb+4knsce0zFs3UcA4kQLJgM85v1I2IhEkaUPeAKE0/5SX
	l
X-Google-Smtp-Source: AGHT+IHaacB3gnriuYoV81Ftcrmt/1jSPI6rxCA91xh9nnjUzmgGFQT/8T0/SK3E6Y4BDkRW/B2kIQ==
X-Received: by 2002:a5d:63cf:0:b0:343:eb6c:ae80 with SMTP id c15-20020a5d63cf000000b00343eb6cae80mr6257299wrw.28.1713779544276;
        Mon, 22 Apr 2024 02:52:24 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/2] x86/pvh: zero VGA information
Date: Mon, 22 Apr 2024 11:52:16 +0200
Message-ID: <20240422095216.20211-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422095216.20211-1-roger.pau@citrix.com>
References: <20240422095216.20211-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PVH guests skip real mode VGA detection, and never have a VGA available, hence
the default VGA selection is not applicable, and at worse can cause confusion
when parsing Xen boot log.

Zero the boot_vid_info structure when Xen is booted from the PVH entry point.

This fixes Xen incorrectly reporting:

(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16

When booted as a PVH guest.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/video.h         | 2 ++
 xen/arch/x86/guest/xen/pvh-boot.c | 9 +++++++++
 xen/arch/x86/setup.c              | 1 -
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/video.h b/xen/arch/x86/boot/video.h
index 6a7775d24292..1203515f9e5b 100644
--- a/xen/arch/x86/boot/video.h
+++ b/xen/arch/x86/boot/video.h
@@ -67,6 +67,8 @@ struct boot_video_info {
     } vesapm;
     uint16_t vesa_attrib;        /* 0x28 */
 };
+
+extern struct boot_video_info boot_vid_info;
 #endif /* __ASSEMBLY__ */
 
 #endif /* __BOOT_VIDEO_H__ */
diff --git a/xen/arch/x86/guest/xen/pvh-boot.c b/xen/arch/x86/guest/xen/pvh-boot.c
index 9cbe87b61bdd..cc57ab2cbcde 100644
--- a/xen/arch/x86/guest/xen/pvh-boot.c
+++ b/xen/arch/x86/guest/xen/pvh-boot.c
@@ -15,6 +15,10 @@
 
 #include <public/arch-x86/hvm/start_info.h>
 
+#ifdef CONFIG_VIDEO
+# include "../../boot/video.h"
+#endif
+
 /* Initialised in head.S, before .bss is zeroed. */
 bool __initdata pvh_boot;
 uint32_t __initdata pvh_start_info_pa;
@@ -95,6 +99,11 @@ void __init pvh_init(multiboot_info_t **mbi, module_t **mod)
     ASSERT(xen_guest);
 
     get_memory_map();
+
+#ifdef CONFIG_VIDEO
+    /* No VGA available when booted from the PVH entry point. */
+    memset(&bootsym(boot_vid_info), 0, sizeof(boot_vid_info));
+#endif
 }
 
 void __init pvh_print_info(void)
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 86cd8b999774..449a3476531e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -646,7 +646,6 @@ static struct e820map __initdata boot_e820;
 
 #ifdef CONFIG_VIDEO
 # include "boot/video.h"
-extern struct boot_video_info boot_vid_info;
 #endif
 
 static void __init parse_video_info(void)
-- 
2.44.0


