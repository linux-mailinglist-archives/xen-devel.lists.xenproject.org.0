Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B9890B845
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 19:39:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742538.1149364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKI-0003LU-Bb; Mon, 17 Jun 2024 17:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742538.1149364; Mon, 17 Jun 2024 17:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKI-0003Bx-7u; Mon, 17 Jun 2024 17:39:30 +0000
Received: by outflank-mailman (input) for mailman id 742538;
 Mon, 17 Jun 2024 17:39:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJGKH-00036g-3H
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 17:39:29 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a6e9f41-2cd0-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 19:39:26 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6f958a3a69so7951566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 10:39:26 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da4496sm532010666b.8.2024.06.17.10.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 10:39:24 -0700 (PDT)
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
X-Inumbo-ID: 8a6e9f41-2cd0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718645965; x=1719250765; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5V14Q8Gcx1y36spQ2JEJ7cbqPfjGOYxmj1ldZEYhTQ=;
        b=M9Owe0bbw1/pBNPLQBAKvhPY1TDE7qQhmLlkFBcM3ye+wsgSP9ER2N6e/BA1bYoSaA
         77ZHH2Xg4lZrr++2TtMiHQufGaoDoCVJLMFRNjOhbxTZSNjSVf6guwdqU/ye6m+DI0ns
         GI8U4OBygkj+2Ly4h2ylZjN7cPN21SIdiuhJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645965; x=1719250765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5V14Q8Gcx1y36spQ2JEJ7cbqPfjGOYxmj1ldZEYhTQ=;
        b=OXWTiFkKQMP2wqZOOSq85H/fpHqz/NxLAqsoovNAXGzP/DuExvCvZLCISc2U6j176G
         Yk5zXa8wuJOEnv5w8KDaPwYwg/IIul4VLxdrR4b9+/7p1nUwtCVIwtyMaXoVRuXme1of
         wbmKoVxLxOShrB3xyXL1TRBWf5hcGlMGIJMihj+631S/f1fsme8qywICrFecOc3TpQ6L
         AU79K+Fxe1ccfRRLBEvrFErbpwKgtCyTW+bIe5HzZr7f28hRQ6dQvbNpGUihYB9HxnjY
         nc1btGf6mQE9WQRnlnBVLAKJOiCLD6XbL1N28086IvkesrOIiIQyUQilNz/JT7u+5JTn
         t7NA==
X-Gm-Message-State: AOJu0YzCW5RGUf2CzdSYTrV/2PFiJrzcEWT7gUFpJ8iAxT9ll/5+uk+G
	OZeaIyCE+zNv2FSeW/giXiodzlk+Y/5howRDl/UwEsorIkirrRyq2bDsx5aKlQqBcrYc9iuDNRg
	5PeM=
X-Google-Smtp-Source: AGHT+IHDPj2YJF/xoswS4Hxe1qyfmkAv45GDhCV3GJGVWSh9zGuNHazvSlL1zN/PexzvEbPHklSOoQ==
X-Received: by 2002:a17:906:b756:b0:a6e:fad9:6dbb with SMTP id a640c23a62f3a-a6f60bcbb01mr710081566b.0.1718645965045;
        Mon, 17 Jun 2024 10:39:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 1/7] x86/xstate: Fix initialisation of XSS cache
Date: Mon, 17 Jun 2024 18:39:15 +0100
Message-Id: <20240617173921.1755439-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The clobbering of this_cpu(xcr0) and this_cpu(xss) to architecturally invalid
values is to force the subsequent set_xcr0() and set_msr_xss() to reload the
hardware register.

While XCR0 is reloaded in xstate_init(), MSR_XSS isn't.  This causes
get_msr_xss() to return the invalid value, and logic of the form:

    old = get_msr_xss();
    set_msr_xss(new);
    ...
    set_msr_xss(old);

to try and restore said invalid value.

The architecturally invalid value must be purged from the cache, meaning the
hardware register must be written at least once.  This in turn highlights that
the invalid value must only be used in the case that the hardware register is
available.

Fixes: f7f4a523927f ("x86/xstate: reset cached register values on resume")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v3:
 * Split out of later patch
---
 xen/arch/x86/xstate.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 99cedb4f5e24..75788147966a 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -641,13 +641,6 @@ void xstate_init(struct cpuinfo_x86 *c)
         return;
     }
 
-    /*
-     * Zap the cached values to make set_xcr0() and set_msr_xss() really
-     * write it.
-     */
-    this_cpu(xcr0) = 0;
-    this_cpu(xss) = ~0;
-
     cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
     feature_mask = (((u64)edx << 32) | eax) & XCNTXT_MASK;
     BUG_ON(!valid_xcr0(feature_mask));
@@ -657,8 +650,19 @@ void xstate_init(struct cpuinfo_x86 *c)
      * Set CR4_OSXSAVE and run "cpuid" to get xsave_cntxt_size.
      */
     set_in_cr4(X86_CR4_OSXSAVE);
+
+    /*
+     * Zap the cached values to make set_xcr0() and set_msr_xss() really write
+     * the hardware register.
+     */
+    this_cpu(xcr0) = 0;
     if ( !set_xcr0(feature_mask) )
         BUG();
+    if ( cpu_has_xsaves )
+    {
+        this_cpu(xss) = ~0;
+        set_msr_xss(0);
+    }
 
     if ( bsp )
     {
-- 
2.39.2


