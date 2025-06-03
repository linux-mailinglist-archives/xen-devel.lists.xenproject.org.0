Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CFEACD071
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 01:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004961.1384601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMbUh-00066i-FQ; Tue, 03 Jun 2025 23:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004961.1384601; Tue, 03 Jun 2025 23:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMbUh-00064W-CJ; Tue, 03 Jun 2025 23:56:35 +0000
Received: by outflank-mailman (input) for mailman id 1004961;
 Tue, 03 Jun 2025 23:56:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMbUf-00064Q-QO
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 23:56:33 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f6467b3-40d6-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 01:56:31 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451ebd3d149so8877445e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 16:56:31 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fb0467sm178723325e9.19.2025.06.03.16.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 16:56:30 -0700 (PDT)
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
X-Inumbo-ID: 5f6467b3-40d6-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748994991; x=1749599791; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pODLuhqUvl+9jztQ6zVDSplRxKL2WIWuXC+a3efJm9g=;
        b=nmewkGQahYU1B26of2Ie3D++1082Nung5k077P4PjAtbmb+ImqQjOGEdqHJNvJmcms
         DzusykjH+eB3m2h378QeO69WiZeBVKFIfdrJAGcrb5EPp7VZCTWSdEeDwW+/nhdglIE2
         gjVBB4X0vkApVmPThL4ZQkcPQbLTZazLNNKl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748994991; x=1749599791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pODLuhqUvl+9jztQ6zVDSplRxKL2WIWuXC+a3efJm9g=;
        b=rDrtnshpJukTp8gNPtmjcQIwl9wjtcSZoANCdIfYG/8+QJbkeyrHrCixGFHwdZltTh
         jR/y45k4k9b16864gmoBqAqC35aqy05++ssFGI50xa8bMi1K+JoGYxfhoXRYQ3qPHtJP
         FdvJvRSWdy3Q5YvMu7+MH5r4ARam7lgXF6BHVTpmi5coaUftpe9dnEUgEDaHVT3x7yIW
         0o/zIYxVUO2h5dG01xVXWij99M7u11fmzKGCvO+F7gRTpiZxUp2JkBDGeI2eZzoJVNsR
         63Q927cjB519IkvGS3ZpjI1SGmJpL0tyieTgRbnAmo4CadE8UZ0IkQAwph69mFzydnWX
         tTsg==
X-Gm-Message-State: AOJu0YwuUUoCzQpU9XV3L3m4gHSrRjAohtAxes6ZMzlmfxCslal6IYhv
	P+OZuQPm74AQOHY5zIuRq0BCcAnuGXHeOv1P3XeMcJmnzgmKo2GNix3Ev4PVm3gMbDghalb068o
	kSw+M
X-Gm-Gg: ASbGncuCgXCERIk7Gw3fUIbiU4g2boZZhcH+gZHOu5Ortje2Ahn0eeiPifH1MHv4sD+
	gJ9TxID32ecEiCX6HIF3XkEdbuiG33uJizRehKs7kNH5ColP2p1WY/U+DDJPROzw7tCeQxkxijs
	0kgd0D66A2LzcIwErOe0/FVTy3/4ZHf0ziBRqQDOPQ/G9CQGMDJO3fkqoNGVOYvNQyJ3tN9cR4u
	raPrDsVVpRnfi8ThEfVY3eX7ZX+V0NKTP2CdtSsTwPc9KEh2MoxvplYk3xY6PAoszA+BY02wxBn
	8s2Q8DMhTZFJqwXCC4djMWjZluhW2IYxH/fKLd2/CkfLLllYRDpHSjogHIRVBhprLJQ02Y0yWcd
	uzUq3Ix4ptr+9MrKvz5sahmlwodeL/ulJsUQ=
X-Google-Smtp-Source: AGHT+IEYkIt5cApoydTDEeGe6Eamjf/vu4yo0zzuizQAvi7VqToTNX+2Q+5yW+W6wrr76H7m/o3QRQ==
X-Received: by 2002:a5d:584a:0:b0:3a4:eecf:99af with SMTP id ffacd0b85a97d-3a51d9748c4mr416413f8f.44.1748994990974;
        Tue, 03 Jun 2025 16:56:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Fix domain_cmdline_size()
Date: Wed,  4 Jun 2025 00:56:28 +0100
Message-Id: <20250603235628.2750156-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The early exit from domain_cmdline_size() is buggy.  Even if there's no
bootloader cmdline and no kextra, there still might be Xen parameters to
forward, and therefore a nonzero cmdline.

Explain what the function is doing, and rewrite it to be both more legible and
more extendible.

Fixes: 142f0a43a15a ("x86/boot: add cmdline to struct boot_domain")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

And just to demonstrate how bad ternary operators are when they're not used
over trivial scalars, this "no effective change in logic" still saves most of
a cacheline of logic:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-56 (-56)
  Function                                     old     new   delta
  __start_xen                                 8946    8890     -56

The "if ( cmdline_size )" in create_dom0() could be dropped.  It's impossible
to be 0 now, which is correct behaviour.  But, that should be deferred to a
later change.
---
 xen/arch/x86/setup.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1f5cb67bd0ee..d47b99f1b2c9 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -980,15 +980,22 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
+/*
+ * Calculate the maximum possible size of the dom0 cmdline.  Pieces of the
+ * dom0 cmdline optionally come from the bootloader directly, from Xen's
+ * cmdline (following " -- "), and individual Xen parameters are forwarded
+ * too.
+ */
 static size_t __init domain_cmdline_size(const struct boot_info *bi,
                                          const struct boot_domain *bd)
 {
-    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
+    size_t s = 0;
 
-    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
+    if ( bd->kernel->cmdline_pa )
+        s += strlen(__va(bd->kernel->cmdline_pa));
 
-    if ( s == 0 )
-        return s;
+    if ( bi->kextra )
+        s += strlen(bi->kextra);
 
     /*
      * Certain parameters from the Xen command line may be added to the dom0

base-commit: 2c4a3d688943b2034756859844b8337a5a97ce07
prerequisite-patch-id: 32a8746877e6b92075be2f022dca25c6bfa6f31e
-- 
2.39.5


