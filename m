Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CC5947E40
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 17:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772252.1182698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazl4-0006ko-8O; Mon, 05 Aug 2024 15:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772252.1182698; Mon, 05 Aug 2024 15:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazl4-0006in-5B; Mon, 05 Aug 2024 15:36:26 +0000
Received: by outflank-mailman (input) for mailman id 772252;
 Mon, 05 Aug 2024 15:36:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Prgv=PE=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sazl2-0006g7-Jv
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 15:36:24 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 787c8cc6-5340-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 17:36:23 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5a156557029so15359430a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 08:36:23 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839c24084sm5034957a12.30.2024.08.05.08.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 08:36:22 -0700 (PDT)
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
X-Inumbo-ID: 787c8cc6-5340-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722872183; x=1723476983; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+MMMGxN2ape1bNpYFITLCt9gyz15hVErQ7V7ZB8BCQc=;
        b=MaDZlG7q5pbg3uQC5DOi18/DRTVkVxj9/GYqdKSoMtJEDc1cV/d0n78b84JgjbpdCm
         GPc+hRPYWe/OkfZXgZgplTWtqbQydwIWUk8/lPFZDkRkfMF00i3UNpE28jeckNQ/UBxX
         xHDPfLPrtuCKq4LTw8SuZ3ORO1dHsNmP/na1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722872183; x=1723476983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MMMGxN2ape1bNpYFITLCt9gyz15hVErQ7V7ZB8BCQc=;
        b=h7xCqNdWNLHmZgbGEExv7aW09dwoPoHIJbWR7kTheRzOWbcCYB69h3PnqJFNQRqkfT
         YmZ5R/Sbn75IG9bttki/c6EbnScA0wXvSLZeclY3eGoVbpDBhWihkBDMGfo5mRmgiURv
         G2aJVIh2PkwLH6LRIezDzRsWpLXqYoWFMc2wPDFXGpVjVZpNmmlccbDH7yjD+ElMUKl8
         DSDp9XHGNTvBNVykkHY4gZeYTEAS0JYk70ncRJd/HYRnmMad4Y/vXkZOMoLbMtPx/Gmn
         CL5RIXnCe0zJvd++vy2bGbnODXPSBO6bEP25NPCaVNFii+70kH/QI5gHDNOm/OfU9khe
         A/Vg==
X-Gm-Message-State: AOJu0Yxx0tom3ZWpN/XZzvND+3EuMQAs6O7rqjE1y6rwPk8X3XLm14nW
	tc6qWlUIyvRS9GWPrMtAeG3sBgvX4hO/S3V/FKZPXWGiDVeSiIdAA+ndCk6tpuIm8LHOwJ/m43q
	H
X-Google-Smtp-Source: AGHT+IEaxLbhD+/3nmdFqwJz0D5GFn1XhsnekeUBQTH+EmFNhLQROZ27ebimh8f7yKMhQgbpHmdkUw==
X-Received: by 2002:a50:e602:0:b0:5a2:1b9d:1d3d with SMTP id 4fb4d7f45d1cf-5b7f5414380mr8359471a12.29.1722872182592;
        Mon, 05 Aug 2024 08:36:22 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] x86/emul: Fix misaligned IO breakpoint behaviour in PV guests
Date: Mon,  5 Aug 2024 16:36:08 +0100
Message-Id: <88d0c78e7fecac79d4ef958962c59836c966cc91.1722871218.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When hardware breakpoints are configured on misaligned IO ports, the
hardware will mask the addresses based on the breakpoint width during
comparison.

For PV guests, misaligned IO breakpoints do not behave the same way, and
therefore yield different results.

This patch tweaks the emulation of IO breakpoints for PV guests such
that they reproduce the same behaviour as hardware.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index f101510a1bab..02901a379b2a 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -324,7 +324,7 @@ static unsigned int check_guest_io_breakpoint(struct vcpu *v,
                                               unsigned int len)
 {
     unsigned int width, i, match = 0;
-    unsigned long start;
+    unsigned long start, debug_mask;
 
     if ( !v->arch.pv.dr7_emul || !(v->arch.pv.ctrlreg[4] & X86_CR4_DE) )
         return 0;
@@ -346,7 +346,9 @@ static unsigned int check_guest_io_breakpoint(struct vcpu *v,
         case DR_LEN_8: width = 8; break;
         }
 
-        if ( (start < (port + len)) && ((start + width) > port) )
+        debug_mask = (~(width - 1u));
+
+        if ( ((start & debug_mask) < (port + len)) && (((start & debug_mask) + width) > port) )
             match |= 1u << i;
     }
 
-- 
2.34.1


