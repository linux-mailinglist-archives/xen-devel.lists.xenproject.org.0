Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368FCCB935B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 17:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185533.1507645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU5am-0001Dd-Kf; Fri, 12 Dec 2025 16:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185533.1507645; Fri, 12 Dec 2025 16:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU5am-0001BH-Hz; Fri, 12 Dec 2025 16:02:04 +0000
Received: by outflank-mailman (input) for mailman id 1185533;
 Fri, 12 Dec 2025 16:02:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vU5ak-0001BB-Dn
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 16:02:02 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2331c7f-d773-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 17:01:56 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so10801475e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 08:01:56 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b8a851sm13189447f8f.29.2025.12.12.08.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 08:01:55 -0800 (PST)
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
X-Inumbo-ID: e2331c7f-d773-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765555316; x=1766160116; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WgquLcWeZX/YUNccTWEytnXurSVltOmOgVqyteSCsmU=;
        b=mUkydGeWKOL0U5bmeZUNMOnXgWSjp7bHYcb4EAeAbXDRg+LvKIT8bOt1A/Ymx16GmC
         QNBaTCDPFDoPaFg2LBvIJdEC1V/IXqsHp3xqyLFrsnU0k1jIEkLVom2DvBjs0ta9j2ub
         aVMqQYTOpF6mHkYMzcwsUKTLlgKGumuRuXCsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765555316; x=1766160116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgquLcWeZX/YUNccTWEytnXurSVltOmOgVqyteSCsmU=;
        b=vr2mdZnSEmXaVvgDzEq7nxFvSpEeMya3t54KufHrUSiQGf2l9N79XxYEmMfSIGXU0c
         9PkYrXW3/CvCSj/dfMvX2bSP0jAQXX00db4h3Hjd7xgHgmSFbSBobvyXA0kqQqVsEVg7
         xrXpJq16LCvbPZYOkFBqpUZOUg+V3CuEp0TW1vvIa+o0HDTVBA4YJcTlnlrjxVeaAXQ9
         LakX9ynrIDQf+KIBu5exKKiQ4+BqWdpx1z2EcZHHSr6lB+ee1G1rlgZkd2t4KQ0+Im2E
         H2/vVt3R8rPKXzpTca5oX1iEHMSkMu3TF0YEtoZwx2oDvyaz8wJIo2zz+9B41dxCWR2H
         RtXQ==
X-Gm-Message-State: AOJu0YwWiCN8G4UxJFmzGDroo20OP64wEh87C7kCh6tR8/hXQp9ENptc
	wVb9fj9D78HPyMvNZmFKr5AfKzdf1CaSA2RJWK2amMTNmvUmfBDt5izz1PcDilu3qBDgckjsPYs
	zoqkf
X-Gm-Gg: AY/fxX6lCgG6aJf1RWc0qujd+u4HzmFnu+7S+pNEQkViPPQEqjI7pmKoqoutKKXJgQG
	MCM4zMbXPVw2HSz8I/w8XUrROQKry24qmQkVU6ZTr9INnJ1hLM58yqJQIA4fnTQ/YjMxcti4aGC
	q+9rFMp3j21X0iKGOzXBDVkKCUyU/iCmz66hGfzUU1emmbM8Dfadc/W1B0b4aXb18+/lsGfcRag
	+BP4n/EJyCNxumXivlOSI56hKBTOZdP9Iqfyd3ithMMmDtXmMLpnYQgI9GNcM+gIeB8bBDTdFM6
	yWgQbZ4n2oGWB+l9OII35VMcleG4tzM8MpJI408Y6saCtlLSogDQNKPMIRRH1a+3oNB5J0hHx1i
	mcEgu8Kv2tusMdikjOXgDdFMV/b2a71uX0O5tobg75juU4ECo47LatLj2Navx5s4aywqWKZTRdA
	EOT/4/m+m4Yx7OEG/ghqHActjoKliuf3G0pLMjD5olcDb2RjwS5cW30oglkEAlog==
X-Google-Smtp-Source: AGHT+IHahVC1TzJEZwQHoPfg5P/QdOES3ScQKlwW02CsNY1AmLGvuZ4HgoRaOJwx5JJp0VexzlnQdQ==
X-Received: by 2002:a7b:c4da:0:b0:477:14ba:28da with SMTP id 5b1f17b1804b1-47a89da4761mr46373975e9.5.1765555315729;
        Fri, 12 Dec 2025 08:01:55 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/shadow: Drop SHADOW_AUDIT_ENABLE indirection
Date: Fri, 12 Dec 2025 16:01:53 +0000
Message-Id: <20251212160153.2485230-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Simply define shadow_audit_enable to be false for the !SHADOW_AUDIT case.

Change the variable to be a bool, and __read_mostly as it's only enabled by
debugkey.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm/shadow/common.c  | 8 ++++----
 xen/arch/x86/mm/shadow/multi.c   | 2 +-
 xen/arch/x86/mm/shadow/private.h | 5 ++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index f2aee5be46a7..e78aac415077 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -126,7 +126,7 @@ void shadow_vcpu_init(struct vcpu *v)
 }
 
 #if SHADOW_AUDIT
-int shadow_audit_enable = 0;
+bool __read_mostly shadow_audit_enable;
 
 static void cf_check shadow_audit_key(unsigned char key)
 {
@@ -1453,7 +1453,7 @@ static void sh_hash_audit_bucket(struct domain *d, int bucket)
     struct page_info *sp, *x;
 
     if ( !(SHADOW_AUDIT & (SHADOW_AUDIT_HASH|SHADOW_AUDIT_HASH_FULL)) ||
-         !SHADOW_AUDIT_ENABLE )
+         !shadow_audit_enable )
         return;
 
     sp = d->arch.paging.shadow.hash_table[bucket];
@@ -1522,7 +1522,7 @@ static void sh_hash_audit(struct domain *d)
 {
     int i;
 
-    if ( !(SHADOW_AUDIT & SHADOW_AUDIT_HASH_FULL) || !SHADOW_AUDIT_ENABLE )
+    if ( !(SHADOW_AUDIT & SHADOW_AUDIT_HASH_FULL) || !shadow_audit_enable )
         return;
 
     for ( i = 0; i < SHADOW_HASH_BUCKETS; i++ )
@@ -3188,7 +3188,7 @@ void shadow_audit_tables(struct vcpu *v)
     unsigned int mask;
 
     if ( !(SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES | SHADOW_AUDIT_ENTRIES_FULL)) ||
-         !SHADOW_AUDIT_ENABLE )
+         !shadow_audit_enable )
         return;
 
     if ( SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_FULL )
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 03be61e225c0..2106643651d9 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -314,7 +314,7 @@ static void sh_audit_gw(struct vcpu *v, const walk_t *gw)
     struct domain *d = v->domain;
     mfn_t smfn;
 
-    if ( !(SHADOW_AUDIT_ENABLE) )
+    if ( !shadow_audit_enable )
         return;
 
 #if GUEST_PAGING_LEVELS >= 4 /* 64-bit only... */
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index 1ef908a380de..0e63ebea4e17 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -33,11 +33,10 @@
 
 #ifdef NDEBUG
 #define SHADOW_AUDIT                   0
-#define SHADOW_AUDIT_ENABLE            0
+#define shadow_audit_enable        false
 #else
 #define SHADOW_AUDIT                0x15  /* Basic audit of all */
-#define SHADOW_AUDIT_ENABLE         shadow_audit_enable
-extern int shadow_audit_enable;
+extern bool shadow_audit_enable;
 #endif
 
 /******************************************************************************
-- 
2.39.5


