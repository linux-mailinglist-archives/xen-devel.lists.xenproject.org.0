Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D23B1EF6F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075023.1437511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcf-00077u-2j; Fri, 08 Aug 2025 20:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075023.1437511; Fri, 08 Aug 2025 20:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTce-00072d-P2; Fri, 08 Aug 2025 20:23:28 +0000
Received: by outflank-mailman (input) for mailman id 1075023;
 Fri, 08 Aug 2025 20:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcc-0005tJ-TV
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:26 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88d09291-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:24 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso16784535e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:24 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:23 -0700 (PDT)
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
X-Inumbo-ID: 88d09291-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684603; x=1755289403; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92/m+z5VSr5yDc/35xwQUmi5Oo4699FS2wmqHV80iA8=;
        b=SVuBACqQCDWC0blNGkX/1UDb/tRFmjhUcw+PJfVeVktU+woFBdwQklJZy33zur1oGT
         Z8xHt8tXT8xrnTNnCLuZQCUDJoOcrA/5SXUiuRFmW5+LSa3CHxx5cesvA55Dh6bZXuTP
         b8/BwXFpsWzMB5hKE24JM2MCJJ72g7B8VnU5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684603; x=1755289403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92/m+z5VSr5yDc/35xwQUmi5Oo4699FS2wmqHV80iA8=;
        b=IEz6pW1jh3Orb6nUX/GLWs8rzpRk4CbsGnqb2PeoHZ6Tjg3FcrXex7t6Nldy2R2IlL
         IMlVEB6W1lgGNDlutqU8PmOVsj4ZuuAVkb4lpioRRi4ofrL3cgeg++tBCXqzVTFGHLst
         XUolOsA+9izPDBTR077IvJ+ME1GCw50vjXfA5j19ANWJZn4511jBIkAD4YB6p7nIaDE2
         1oyJPBW/Mrc8QQBGjqLDDt3fl/howR7xiAYeHsyYK/2ZMmEoEq7AkfZfwbgu1CHxZoQ7
         wi9gnjobwXry/lrQgoKCIhA2XdbZqmbOcvSPG/EXdPtF68TMyM2vdXi99AHUE3tQ5vCy
         pIyg==
X-Gm-Message-State: AOJu0YyNucQfTKjEwz+7YXC8nga63WonYqNw/5F9PkzwhFihBt55wcTA
	zSLZI8c04v/MOjr+zqfGqIijZkUWN+5n/L0a9dBskNw+PuJ9kdqIILxP802AsrnzZ5BKExZTEb5
	G78gjb6k=
X-Gm-Gg: ASbGnctqfa0hzNFu0zwQ1n+SEXpMlYMFBUfjoRfFBgyrsmb4Cm73VzMEnZhEdELRKhS
	IuC/xXsnHYaKHGW4uRilP86gH82udsUhz9GZYO3lIos1E3JZoSVMHTMTljKCZry4ugy8GSbNgLD
	Di9bFfBPx2F171lURRMIbnroZgBQ4AyZ56F0MSOTo5nwzl1A38to7MqhvPl7MZhq0bRi/Ti+VaG
	GORmsfBzrdSYtBMnH+a/xYs4NLYdBtQ0b20uyC3JyCp4AgWRkorkJq7MyOh14m3RnmKNaL+ifGn
	YvhaVA4kmqy6SbRg2g5W+OqwCPELyvN48DLjB2tVrUs0l8pZ/NoFrKCPfwO+nxaN+CCd4soKH1Z
	ZwSnliLeZ+Q0FAQZOtmy0gyL9mk2drBVouKmKYEFhtyVBRZRMwEuWG00s7lsJpkyBJAEZ/1N9cT
	q6
X-Google-Smtp-Source: AGHT+IH7pSYE5Lclhd4aEb3Drtv+hwANdcPJQryN8Y2tv4K7EYzZDiNo7xU2Laf05Zk4TKgP5N5Z7w==
X-Received: by 2002:a05:6000:2dc2:b0:3b8:fa8c:f1ac with SMTP id ffacd0b85a97d-3b900b327f1mr4132646f8f.24.1754684603531;
        Fri, 08 Aug 2025 13:23:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 05/22] x86/traps: Rename early_traps_init() to bsp_early_traps_init()
Date: Fri,  8 Aug 2025 21:22:57 +0100
Message-Id: <20250808202314.1045968-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're going to want to introduce an AP version shortly.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/traps.h | 2 +-
 xen/arch/x86/setup.c             | 2 +-
 xen/arch/x86/traps-setup.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/traps.h b/xen/arch/x86/include/asm/traps.h
index 72c33a33e283..7414420e57d8 100644
--- a/xen/arch/x86/include/asm/traps.h
+++ b/xen/arch/x86/include/asm/traps.h
@@ -7,7 +7,7 @@
 #ifndef ASM_TRAP_H
 #define ASM_TRAP_H
 
-void early_traps_init(void);
+void bsp_early_traps_init(void);
 void traps_init(void);
 void percpu_traps_init(void);
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1543dd251cc6..64f02699e1aa 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1134,7 +1134,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     percpu_init_areas();
 
-    early_traps_init();
+    bsp_early_traps_init();
 
     smp_prepare_boot_cpu();
     sort_exception_tables();
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index a8385b26ae9b..7713f427d344 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -62,7 +62,7 @@ static void __init init_ler(void)
  * boot_gdt is already loaded, and bsp_idt[] is constructed without IST
  * settings, so we don't need a TSS configured yet.
  */
-void __init early_traps_init(void)
+void __init bsp_early_traps_init(void)
 {
     const struct desc_ptr idtr = {
         .base = (unsigned long)bsp_idt,
-- 
2.39.5


