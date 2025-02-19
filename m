Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E33FA3C569
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 17:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893243.1302161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknFh-0000Ge-IM; Wed, 19 Feb 2025 16:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893243.1302161; Wed, 19 Feb 2025 16:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknFh-0000E2-Em; Wed, 19 Feb 2025 16:48:49 +0000
Received: by outflank-mailman (input) for mailman id 893243;
 Wed, 19 Feb 2025 16:48:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQLC=VK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tknFg-0000DW-0W
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 16:48:48 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62fb6d15-eee1-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 17:48:46 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso3688466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 08:48:46 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb8190d15esm835632166b.16.2025.02.19.08.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 08:48:45 -0800 (PST)
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
X-Inumbo-ID: 62fb6d15-eee1-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739983726; x=1740588526; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HQ77vgWRo/U9WVLabLYV75AdriUUwFMryn5FJ3I67w=;
        b=cY0goX8bIFuAuOFnkU4OQTIwshEeX1/Aj4O3NVzgbzQ6mp/o2h9YvncsuwX1W03M+d
         xnupG6mSfVhhbc0j+s93IjA0D39e8t4ruL3K3xS3sPXM0j+LAsp6uR0xl4g4hN2Pbi+a
         uZQiKHRsAiPDeUP0YqBIdeyJTyVaRW0iimUHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739983726; x=1740588526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HQ77vgWRo/U9WVLabLYV75AdriUUwFMryn5FJ3I67w=;
        b=nh0G7Lp/+xGiVVWqOd4N4gUKlYZ0ORv6nSu8n93A5vo75XxsJEUbOwUL/8dFoxX1Oq
         kifiGNIZnovPnRm5P8JV/t/rZxTG+6z3HJOMBQ6EPlu6MCQtltuFXZJGRMt5aNFzuNB1
         fW1Soc9GRcj3vOk6CwwtZathQ4oU+VIn7/EMXkQrttYWD0T2NB3ZVcvmGoic5uNgLzBo
         2gvFldn+OrnmYijJYh00Z+AL+NF36/ToOxmY7gFrnFkuIKCq40Rcb4AJ62S/BAGVeOcq
         3DKPEMlbG05UWlpiDqWd8o/kXKpSOSYXxna7YGgyZwX7+/9v+i6nA0jV+q0+kC0SpS/L
         0Aig==
X-Gm-Message-State: AOJu0YyiaRYI/6an/hmx7va7+NG7F+NJ507AcCkjpAp1FGlTGlY8hA9H
	Jf5ocFPs7+axrzhDv/X6DOsA3hqE6XqIGLqbwOv7AjCNwOCNqq9BXbKI7hOMYtCnQotQg+yth8w
	R
X-Gm-Gg: ASbGnctvfaZR7kh9618ysPBbV5Q8eW047CIG9+xCeqI0fAwoSEzhI+CYe2B6WPUyWCy
	WNdxIAjT2vstpMX/2VJJKIbdWUjxS2G7uC1yfO7y1MnWyKXhGX0fKSslVM2XwmQYMFfsHDwY1eS
	pnHxVdABtqdoRcFYk+iPU33lUM1XBlWzkzHDM1zYcgt0+ZnJ28QecA5b56CDP9Ip6Ct1Xkw7X3J
	OK3ZsTivTlDCgx0whRjSwDqR1mrbZcHauCM+d32RafqgoDxl48AmSjFP5I77i74lvkFE6kNal6N
	LHiSJ0tXu9Vdo9oQsp4VIupTvQ==
X-Google-Smtp-Source: AGHT+IEqn/P+qTDgM2IVPcZZGQlbRFzyxFXvh3EM1ihOl44/a6KY+SpzBeoyKXmr9VC5IKtiHxejDw==
X-Received: by 2002:a17:906:3118:b0:ab7:63fa:e4ab with SMTP id a640c23a62f3a-abb7053d8cfmr1617742466b.0.1739983726075;
        Wed, 19 Feb 2025 08:48:46 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 1/3] x86/dom0: correctly set the maximum ->iomem_caps bound for PVH
Date: Wed, 19 Feb 2025 17:48:38 +0100
Message-ID: <20250219164840.94803-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250219164840.94803-1-roger.pau@citrix.com>
References: <20250219164840.94803-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The logic in dom0_setup_permissions() sets the maximum bound in
->iomem_caps unconditionally using paddr_bits, which is not correct for HVM
based domains.  Instead use domain_max_paddr_bits() to get the correct
maximum paddr bits for each possible domain type.

Switch to using PFN_DOWN() instead of PAGE_SHIFT, as that's shorter.

Fixes: 53de839fb409 ('x86: constrain MFN range Dom0 may access')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The fixes tag might be dubious, IIRC at that time we had PVHv1 dom0, which
would likely also need such adjustment, but not the current PVHv2.
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/dom0_build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 3b9681dc9134..aec596997d5d 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -481,7 +481,8 @@ int __init dom0_setup_permissions(struct domain *d)
 
     /* The hardware domain is initially permitted full I/O capabilities. */
     rc = ioports_permit_access(d, 0, 0xFFFF);
-    rc |= iomem_permit_access(d, 0UL, (1UL << (paddr_bits - PAGE_SHIFT)) - 1);
+    rc |= iomem_permit_access(d, 0UL,
+                              PFN_DOWN(1UL << domain_max_paddr_bits(d)) - 1);
     rc |= irqs_permit_access(d, 1, nr_irqs_gsi - 1);
 
     /* Modify I/O port access permissions. */
-- 
2.46.0


