Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D624910253
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 13:15:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744424.1151471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKFki-00027v-8f; Thu, 20 Jun 2024 11:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744424.1151471; Thu, 20 Jun 2024 11:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKFki-00026L-5d; Thu, 20 Jun 2024 11:14:52 +0000
Received: by outflank-mailman (input) for mailman id 744424;
 Thu, 20 Jun 2024 11:14:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WCyn=NW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKFkg-00026F-MB
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 11:14:50 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f0b15d8-2ef6-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 13:14:49 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52cc5d5179aso1150344e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 04:14:49 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d26bddab3sm229612a12.2.2024.06.20.04.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:14:46 -0700 (PDT)
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
X-Inumbo-ID: 4f0b15d8-2ef6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718882088; x=1719486888; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WvLFdQ0Ejqk1I9je0zJda2B7XQlwQn4evR9M4HdGvt4=;
        b=MxD4PW3KxG1GSEoNKeIpTOhrpSZ3dW4p7OOZsDGkAB0Lj1v6Mv3YZorZ4ytm2xbUgc
         +Bagy8beAe2sGuWx39J1rgOBGmcs9jf0kjqxRMamS5M5WPkdC3o3zl9QlneqXiUY7g4H
         EYtjSI/7xvrfC4/wZViHO3cZQ01oYvoZhbl08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718882088; x=1719486888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvLFdQ0Ejqk1I9je0zJda2B7XQlwQn4evR9M4HdGvt4=;
        b=Q899ODb6yhbakfh3k5X7qjRFk6U0OwnLIeCsatVaxwdW+fP1zOPSRW6UGhNaf6L0tr
         jAvitsujDcZdQDjR55F4MJJeu4jkxVHg9Xwm+R18uSUsqp97pIPodAfUAY/OhdzjXTkB
         U2p0W8dP/gSJbtXGY6jf4TX2oJJE8SPNsth/aMseZTjsAQdwA/+7PefMEeaj0tq2bVnO
         Bhl0K+9fhYQViwHr/hLzLbtNM/OU+rKd5LHtkJB7nkkP2rNQN3rF+BwcH7S4LU/SuguN
         RBwe859w/gAJpU+5iK2jPMp5yynv+9j9OTjz6JLTBR/lzGbbv9YqHCurGejIErq2Y7/E
         E2pg==
X-Gm-Message-State: AOJu0YxbhAT/j66v/nn1HPOLRxz7RvhBPImkRb0/fSseS5xLAYfWRKT0
	CZ+ZnC1hiIPF7u5CXjZbcB6X18Rm9J9xiSRaZ6ezeGhdjAuaxPhpnOEqVh/U+h3zH2RLb99lHnS
	8P3s=
X-Google-Smtp-Source: AGHT+IFgcWA+lDIBtJxOYMHpwJY3mH/AUNEHqYBAXYZ9ZZXvPe/Dw2imHL6ybjubmA56SEk/qLeuJA==
X-Received: by 2002:a05:651c:2221:b0:2ec:3d74:88c8 with SMTP id 38308e7fff4ca-2ec3d748a52mr45255551fa.18.1718882088051;
        Thu, 20 Jun 2024 04:14:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH for-4.18] x86/cpuid: Fix handling of XSAVE dynamic leaves
Date: Thu, 20 Jun 2024 12:14:38 +0100
Message-Id: <20240620111438.2666922-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ This is a minimal backport of commit 71cacfb035f4 ("x86/cpuid: Fix handling
  of XSAVE dynamic leaves") to fix the bugs without depending on large rework of
  XSTATE handling in Xen 4.19 ]

First, if XSAVE is available in hardware but not visible to the guest, the
dynamic leaves shouldn't be filled in.

Second, the comment concerning XSS state is wrong.  VT-x doesn't manage
host/guest state automatically, but there is provision for "host only" bits to
be set, so the implications are still accurate.

In Xen 4.18, no XSS states are supported, so it's safe to keep deferring to
real hardware.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
(cherry picked from commit 71cacfb035f4a78ee10970dc38a3baa04d387451)
---
CC: Jan Beulich <JBeulich@suse.com>
---
 xen/arch/x86/cpuid.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 455a09b2dd22..f6fd6cc6b32c 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -330,24 +330,20 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     case XSTATE_CPUID:
         switch ( subleaf )
         {
-        case 1:
-            if ( p->xstate.xsavec || p->xstate.xsaves )
-            {
-                /*
-                 * TODO: Figure out what to do for XSS state.  VT-x manages
-                 * host vs guest MSR_XSS automatically, so as soon as we start
-                 * supporting any XSS states, the wrong XSS will be in
-                 * context.
-                 */
-                BUILD_BUG_ON(XSTATE_XSAVES_ONLY != 0);
-
-                /*
-                 * Read CPUID[0xD,0/1].EBX from hardware.  They vary with
-                 * enabled XSTATE, and appropraite XCR0|XSS are in context.
-                 */
+            /*
+             * Read CPUID[0xd,0/1].EBX from hardware.  They vary with enabled
+             * XSTATE, and the appropriate XCR0 is in context.
+             */
         case 0:
-                res->b = cpuid_count_ebx(leaf, subleaf);
-            }
+            if ( p->basic.xsave )
+                res->b = cpuid_count_ebx(0xd, 0);
+            break;
+
+        case 1:
+            /* This only works because Xen doesn't support XSS states yet. */
+            BUILD_BUG_ON(XSTATE_XSAVES_ONLY != 0);
+            if ( p->xstate.xsavec )
+                res->b = cpuid_count_ebx(0xd, 1);
             break;
         }
         break;

base-commit: 01f7a3c792241d348a4e454a30afdf6c0d6cd71c
-- 
2.39.2


