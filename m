Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B688A67B0B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919603.1323998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarL-0005o0-S3; Tue, 18 Mar 2025 17:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919603.1323998; Tue, 18 Mar 2025 17:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarL-0005mT-Ov; Tue, 18 Mar 2025 17:36:11 +0000
Received: by outflank-mailman (input) for mailman id 919603;
 Tue, 18 Mar 2025 17:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuarK-0005mN-5q
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:36:10 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 792d9148-041f-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 18:36:08 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2ff187f027fso6963388a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:36:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-3015353462asm8485870a91.27.2025.03.18.10.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 10:36:05 -0700 (PDT)
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
X-Inumbo-ID: 792d9148-041f-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742319366; x=1742924166; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+u7NHU/X16iy++y53dW2+AUGd16GJzW5/oHUY54RX4=;
        b=H69e0itFBYgoTaV17GcWR+5xySgE9HJqHgiBrrYDcRST0NokVTAhsfOzQ2H09Ywb5a
         7fCIA/ye6lmjH7hDK8rErytIfQVfb0QwC3C5jkv9/B5rQA5597x9/fQcvyAoFSRNVF7/
         COpg289hZPYFYf5Zs1kKLbukVR3OIda7t2HcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742319366; x=1742924166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+u7NHU/X16iy++y53dW2+AUGd16GJzW5/oHUY54RX4=;
        b=Kt3VEg9dPNen/G3flJEczyKunt3BIwdx99SoDEZv8lL7BdokwUiR1UW1Q4gfMeGee6
         KIzhzW/O/P2kFoc6dH28obOhzt5wldn/AS2zzfNe3D8/qpA6MAtj245HHYxwCiYqhyQ0
         741wpUUqQI8toRa5s5oo01o9O2hgid9PyGGJDcrtdiiimjiAvKKmWX2uk95Rrx9wzaZR
         UTBXle6RmeOTFB9WO1iQCOPVf64qCwNRQQ12Qp+pX4rPmfeLw4Sjwo7E1iu8I+PY2ZyJ
         hkryXK6IpNbliKscLOUP9bAomNnGHSQM1y6Jt5zJFvRm3oSHp0dtk6REH45MTWIpXPqY
         /blw==
X-Gm-Message-State: AOJu0Yy2wVKF0E5Hz3gM4Z+V9hUA94Q7WBcz50FEEFC5eE1U3Nir0EtV
	tzmF357fpQSMOchBPUlDcUn/bz0f2pw21mZ5NSgKww0Wpvs3se1kD3iJmaM3KN0EBmFDtZtETl7
	0
X-Gm-Gg: ASbGncsLvbDyJwNJT1pjn7Zwd6mBLMWEjQLky92gQHOb4vyUoQYZrWLwKOKZmd/91lu
	+3P30cpXtcA/S4gsMUmK+A6U0oHq9H+wm8VcqIQgLZuVqqLAQxbP1Hb9N7SIrzg2Su44bBLqpUf
	XSNUuIeTN82+qLHkXKksMcJcxu+JkDniZ5VrDi1yfFX2bDA5D6yNGxB4QmyJuZWF4xT4F/Dc278
	2j688GXZC7oOlrn1p/SKrpstEI1fVSog397OZS7TGn7WoBpBSTHIDxF11xJkP49FgnazxVkTJCO
	34pSseIUX/qqEJ0OO9H9YxV1MKLVkbRIxazl5HmndO2E9vdPnA==
X-Google-Smtp-Source: AGHT+IGZ0a0IkzU8VfqH+3YjJUK76MeRcDdv2DFylgD5njJCqv53PKuapRzr69eNNqyed91HUZuS6g==
X-Received: by 2002:a17:90a:d2cf:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-301a5b0443cmr4840403a91.3.1742319366153;
        Tue, 18 Mar 2025 10:36:06 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/7] x86/boot: clarify comment about trampoline_setup usage
Date: Tue, 18 Mar 2025 18:35:41 +0100
Message-ID: <20250318173547.59475-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318173547.59475-1-roger.pau@citrix.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Clarify that trampoline_setup is only used for EFI when booted using the
multiboot2 entry point.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/head.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 1b3bd16fe575..59a2b5005cf6 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -505,7 +505,8 @@ trampoline_bios_setup:
 
 trampoline_setup:
         /*
-         * Called on legacy BIOS and EFI platforms.
+         * Called on legacy BIOS and EFI platforms when using multiboot (either
+         * 1 or 2).
          */
 
         /* Save Xen image load base address for later use. */
-- 
2.48.1


