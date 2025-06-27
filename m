Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBF4AEB9A2
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 16:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027675.1402215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV9v9-0005so-O6; Fri, 27 Jun 2025 14:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027675.1402215; Fri, 27 Jun 2025 14:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV9v9-0005qp-KD; Fri, 27 Jun 2025 14:19:15 +0000
Received: by outflank-mailman (input) for mailman id 1027675;
 Fri, 27 Jun 2025 14:19:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxnX=ZK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uV9v8-0005qj-BN
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 14:19:14 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2768dc0-5361-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 16:19:12 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so2169192f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 07:19:12 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c8013fesm2886469f8f.38.2025.06.27.07.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 07:19:10 -0700 (PDT)
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
X-Inumbo-ID: b2768dc0-5361-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751033951; x=1751638751; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OUW2+53hkCBMGIncRKiorGQM8v/WUAGZvghzhUrAIKc=;
        b=hu8Kaxpg57zgRv6phPOP0ui75vMeEGaHJ4pheCnvYPKxNy1tTUCKCXyaz2J1u545pP
         jTw3IxYyObtpSs+P3R5bt+DGX+gOaN+p/pzOscP50arZC4U9VjS7QxU4jt2sCUVdRZfH
         ZHLGpc6ybDmanxIRshLWYxCrbOl2Nh2pSSrrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033951; x=1751638751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUW2+53hkCBMGIncRKiorGQM8v/WUAGZvghzhUrAIKc=;
        b=DedHTZsqBO4uw+P6OAqQyN0klbqRqXe8yROjB6nTGLVf58hhtpkTIUAwnYKRs+DZO0
         hMmkSaHAgz3f355rWOX7bz/zPnJrVApn0L/nzrVX0pOIHSjqo4QhmkQawrUHuLESxVOb
         iyXP/UhAPzcmHMKXHslZ5YuffYWi6HrRJwAHZfDG2Gl1rPnmJ1m8E7nbZ0ZdvA7YYo+E
         7oGrmTBhttN1vXGigb9V05YhE/Q4BbndCV13E7OsKVJE83qBiDpj/muzqHRTeOnkBOuM
         ShmEi3rVv14WYAUsoOAswHYaxt4t6jG8c9ih05a+lc4CeNEu3wpUjO5w5YoF8+JASwki
         +P3w==
X-Gm-Message-State: AOJu0YwR8mv/VIt0/l0e0f766VwGOhzsf98o7CdVeslCty0enZEP1wDi
	nHiigihkPjpIS72OncEym9AQn91ofTTuQmCOkw5+70To6/l2JhCiaz8/KsttNHuFDfuCy/4zTNM
	qVmTxG/Wsig==
X-Gm-Gg: ASbGncuCcdTzExEqyLCJvD5gcXg2JMXn8XsfBUFzCIES59ZlzqnLp6cK9ndjw2w4ZoF
	SyqRVHsp5h8TmhjksqewuCbaZmZjRpQSsv8K9wjxJjhknz/UmoyWV3/uLYWMgd7Bjc6U71DaH8U
	JozWYF3UKsqzRy1gnGXVktzJ171ZE/7YLhVxfvLgJfEliD2sKPmZozgPYxTflSssjtL/rBa8ulB
	XaVKRU3TqAUOiVcWComRc+y8vZI05x+1Lh4oAsFfBABqCP8Lb+JvGdopH2u18TK8Wwp29TWCJZb
	Wf9WUGnDS5SmpVC/6BGPmYOd+d5JPkWPKWLB2VoLFG1xu/ZI5Hdivb8lFyLoDWOkiwIq4PsGf/t
	oaTqNB0TX2lMd1yh3GjSYQu6aiUhIzgry/Xyl3aqMsRSw/A==
X-Google-Smtp-Source: AGHT+IHX3ex1CeOhTKIUmDYpxSI4IIDBk3oEinF/Aeh1q8ACqL+pO/HgcZHN6H/0WkAGOWw/nKJWoA==
X-Received: by 2002:a05:6000:40c8:b0:3a4:dfbe:2b14 with SMTP id ffacd0b85a97d-3a98b53f408mr3280793f8f.16.1751033951251;
        Fri, 27 Jun 2025 07:19:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/cpu-policy: Simplify logic in guest_common_default_feature_adjustments()
Date: Fri, 27 Jun 2025 15:19:07 +0100
Message-Id: <20250627141907.525027-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For features which are unconditionally set in the max policies, making the
default policy to match the host can be done with a conditional clear.

This is simpler than the unconditional clear, conditional set currently
performed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

This isn't entirely no functional change.  There would be a change if such
features were annotated !a rather than !A.  However, !a is a nonsensical
annotation for a feature intended to be always-max.

Bloat-o-meter says this saves 69 bytes, so more than a cacheline, which is a
disappointing size, but there are not any opportunities for agregation.
---
 xen/arch/x86/cpu-policy.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 060b34d9132f..518f9c9e5409 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -515,17 +515,14 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
          * reasons, so reset the default policy back to the host values in
          * case we're unaffected.
          */
-        __clear_bit(X86_FEATURE_MD_CLEAR, fs);
-        if ( cpu_has_md_clear )
-            __set_bit(X86_FEATURE_MD_CLEAR, fs);
+        if ( !cpu_has_md_clear )
+            __clear_bit(X86_FEATURE_MD_CLEAR, fs);
 
-        __clear_bit(X86_FEATURE_FB_CLEAR, fs);
-        if ( cpu_has_fb_clear )
-            __set_bit(X86_FEATURE_FB_CLEAR, fs);
+        if ( !cpu_has_fb_clear )
+            __clear_bit(X86_FEATURE_FB_CLEAR, fs);
 
-        __clear_bit(X86_FEATURE_RFDS_CLEAR, fs);
-        if ( cpu_has_rfds_clear )
-            __set_bit(X86_FEATURE_RFDS_CLEAR, fs);
+        if ( !cpu_has_rfds_clear )
+            __clear_bit(X86_FEATURE_RFDS_CLEAR, fs);
 
         /*
          * The Gather Data Sampling microcode mitigation (August 2023) has an
@@ -545,13 +542,11 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
      * Topology information is at the toolstack's discretion so these are
      * unconditionally set in max, but pick a default which matches the host.
      */
-    __clear_bit(X86_FEATURE_HTT, fs);
-    if ( cpu_has_htt )
-        __set_bit(X86_FEATURE_HTT, fs);
+    if ( !cpu_has_htt )
+        __clear_bit(X86_FEATURE_HTT, fs);
 
-    __clear_bit(X86_FEATURE_CMP_LEGACY, fs);
-    if ( cpu_has_cmp_legacy )
-        __set_bit(X86_FEATURE_CMP_LEGACY, fs);
+    if ( !cpu_has_cmp_legacy )
+        __clear_bit(X86_FEATURE_CMP_LEGACY, fs);
 
     /*
      * On certain hardware, speculative or errata workarounds can result in
-- 
2.39.5


