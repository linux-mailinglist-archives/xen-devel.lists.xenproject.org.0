Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1697398E6B5
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 01:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809100.1221259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw8dk-00081C-6m; Wed, 02 Oct 2024 23:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809100.1221259; Wed, 02 Oct 2024 23:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw8dk-0007yQ-3f; Wed, 02 Oct 2024 23:20:16 +0000
Received: by outflank-mailman (input) for mailman id 809100;
 Wed, 02 Oct 2024 23:20:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw8di-0007yK-5r
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 23:20:14 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df9945dd-8114-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 01:20:12 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so31614466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 16:20:12 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93cd7a3609sm865623466b.211.2024.10.02.16.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 16:20:10 -0700 (PDT)
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
X-Inumbo-ID: df9945dd-8114-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727911211; x=1728516011; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8td8Tc/ZYMUVmIE4bZONjqFLPJlU2/yV07ZZf+6r1ZY=;
        b=LXPw4Pr+ekxQCDI2gCRpWzYA9tg5Y/zpIf/ipngXOhi+R7g2RywUIdfWE0kELr035d
         QmpjDaVYrXY1s232ySg7Kd2uIymR8Fp7CRD1Upb85D9s4Uc0zctw3gSCwYIg3cZRoIMU
         MaNSQvmeVRAIdVXX+k0yUR65ZzVvBmYuli5us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727911211; x=1728516011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8td8Tc/ZYMUVmIE4bZONjqFLPJlU2/yV07ZZf+6r1ZY=;
        b=oe9ipUHgxfS6LgorgIQYIOLvU3yl438lHbCH0f/MymE8sRDygvt/cqYOVgOIoG9yCV
         VEjL1ilddbMxwxsNKpI6Dr6yg4yC+GYR2AH1uaUmmdIFNAsKw+yNn2LblK3AErDTDaYp
         RfvGXcUWoNYt2OD6oNnM8sOtl0gOVrfXp93qGyUdc25Ms0ng4C4Wzyxa+G92EpWDdyQP
         oM0BSHpn2JlDMtjWgZflaEbbLvxLUf9ER9hzPfb6ja8gG9poikgu+FMUG3ZwCKCJVtQf
         1z0gtTtqas3vnhYkkq8Y2uLZXm+qs4ghVszMlNmIeXUraC4bxe36GjkY6wR2qtiXlSCp
         lWAQ==
X-Gm-Message-State: AOJu0YyV1Mc/3IwvOQJJLqSMjGyW0F/Urih+1p0+CH4zINRiAbQuEojO
	2AassqVpsFW7xiKhCczvMlGKtDg8g/0a9pjhIq4CvpwHJmoQz9hLl0zh9Al1Jau57+oGwLVNg2r
	FIsk=
X-Google-Smtp-Source: AGHT+IH83iAsi3X7NG94E2JYVXogLSALLm5LBtscW7WFcONDQQBwA8g6Ww0BqpV7nSaLAYZdgNp2SA==
X-Received: by 2002:a17:907:d20:b0:a8b:6ee7:ba12 with SMTP id a640c23a62f3a-a98f8261dbamr377643766b.27.1727911211380;
        Wed, 02 Oct 2024 16:20:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Further simplify CR4 handling in dom0_construct_pv()
Date: Thu,  3 Oct 2024 00:20:08 +0100
Message-Id: <20241002232008.1988682-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The logic would be more robust disabling SMAP based on its precense in CR4,
rather than SMAP's accociation with a synthetic feature.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Strip LASS changes back out.
---
 xen/arch/x86/pv/dom0_build.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 262edb6bf2f0..ee9ecdc2abbf 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -1057,6 +1057,7 @@ int __init dom0_construct_pv(struct domain *d,
                              module_t *initrd,
                              const char *cmdline)
 {
+    unsigned long cr4 = read_cr4();
     int rc;
 
     /*
@@ -1064,19 +1065,19 @@ int __init dom0_construct_pv(struct domain *d,
      * prevents us needing to write construct_dom0() in terms of
      * copy_{to,from}_user().
      */
-    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
+    if ( cr4 & X86_CR4_SMAP )
     {
         if ( IS_ENABLED(CONFIG_PV32) )
             cr4_pv32_mask &= ~X86_CR4_SMAP;
 
-        write_cr4(read_cr4() & ~X86_CR4_SMAP);
+        write_cr4(cr4 & ~X86_CR4_SMAP);
     }
 
     rc = dom0_construct(d, image, image_headroom, initrd, cmdline);
 
-    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
+    if ( cr4 & X86_CR4_SMAP )
     {
-        write_cr4(read_cr4() | X86_CR4_SMAP);
+        write_cr4(cr4);
 
         if ( IS_ENABLED(CONFIG_PV32) )
             cr4_pv32_mask |= X86_CR4_SMAP;
-- 
2.39.5


