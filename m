Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5392886E03F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 12:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687614.1071284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg149-000544-W4; Fri, 01 Mar 2024 11:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687614.1071284; Fri, 01 Mar 2024 11:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg149-00051N-SZ; Fri, 01 Mar 2024 11:28:37 +0000
Received: by outflank-mailman (input) for mailman id 687614;
 Fri, 01 Mar 2024 11:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=do9M=KH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rg148-00051H-DC
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 11:28:36 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d69a8de7-d7be-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 12:28:34 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-566adfeced4so1992665a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 03:28:34 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n3-20020aa7db43000000b005656bbb5b3fsm1467468edt.63.2024.03.01.03.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 03:28:31 -0800 (PST)
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
X-Inumbo-ID: d69a8de7-d7be-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709292512; x=1709897312; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0zq5bFjmGngwRsCaHJlRgEEJBypuQP/Dgz8GKDt0Ao=;
        b=A7TPEVioUo91aISvm8rMiD6lJlhUhhG/9KwnnfTnsq9b/k3HAGsWIg5QUG+DIJTa7h
         7MjGmFYfn7ngugqA41LyjXWojqYO7bGPihwFDk8c/FCokcIy84wWOlW5/FoVkd6yT/JL
         iyxcR6bn/KmjILziOC3PQskiIO4Grq+l7PqsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709292512; x=1709897312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0zq5bFjmGngwRsCaHJlRgEEJBypuQP/Dgz8GKDt0Ao=;
        b=gpcOgCqGaLTcoSgh6W3dhUtT9PR4/xA6OWxTs5oSG5/j3FPclcTMrZjQ4c6MstSbpz
         WTiEhJD9fEJe32yzpWq0vITITdvcR0Dj0HYglgj9YYDyf1cOoCWayXj6jJJWutK5hf1S
         K/ZOpGnoMTAGfBtN/jS5kThvCOmbvfLVeT+83gd70Nxq9Z+0iZbIhfQbZ/ohaIAqM0l6
         ot+IObbm5POV4KSvAGqU0N0Od/yQY1633NzI9Dc6zi8JDikjh1Obzwf8A2kYNyJQ0Gzp
         T6jb3qBbRc/86JebSzdKE+JCMEYEY+VBYGpuM/jSRgZL/HtfqRO+dVKdWemWwyYVaoI1
         dR5g==
X-Gm-Message-State: AOJu0YzrM0knUoN3bVo4wb1lcKUqiDZSHA7mJk3U5MDuJLYCSbLFj5vF
	OvtaaqfQrIS7P0pyfABUcrnVE6mvPOvheCBt9kL0i9B/L/CdMw3cvVqpBrkyxnuD2uzff9we/Ct
	p
X-Google-Smtp-Source: AGHT+IEtlqU/3Pk3hq+elEbuNqrfkEqwQ7NPMcDsW/tKhCr4Th3y3tMG67y+rZg8r0Wpw8SBS6zwmQ==
X-Received: by 2002:a05:6402:1053:b0:564:d715:1d67 with SMTP id e19-20020a056402105300b00564d7151d67mr1045812edu.17.1709292512450;
        Fri, 01 Mar 2024 03:28:32 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cpu-policy: Fix visibility of HTT/CMP_LEGACY in max policies
Date: Fri,  1 Mar 2024 11:28:29 +0000
Message-Id: <20240301112829.2657865-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The block in recalculate_cpuid_policy() predates the proper split between
default and max policies, and was a "slightly max for a toolstack which knows
about it" capability.  It didn't get transformed properly in Xen 4.14.

Because Xen will accept a VM with HTT/CMP_LEGACY seen, they should be visible
in the max polices.  Keep the default policy matching host settings.

This manifested as an incorrectly-rejected migration across XenServer's Xen
4.13 -> 4.17 upgrade, as Xapi is slowly growing the logic to check a VM
against the target max policy.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index c9b32bc17849..4f558e502e01 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -464,6 +464,16 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
              raw_cpu_policy.feat.clwb )
             __set_bit(X86_FEATURE_CLWB, fs);
     }
+
+    /*
+     * Topology information inside the guest is entirely at the toolstack's
+     * disgression, and bears no relationship to the host we're running on.
+     *
+     * HTT identifies p->basic.lppp as valid
+     * CMP_LEGACY identifies p->extd.nc as valid
+     */
+    __set_bit(X86_FEATURE_HTT, fs);
+    __set_bit(X86_FEATURE_CMP_LEGACY, fs);
 }
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
@@ -514,6 +524,18 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
             __clear_bit(X86_FEATURE_CLWB, fs);
     }
 
+    /*
+     * Topology information is at the toolstack's discretion so these are
+     * unconditionally set in max, but pick a default which matches the host.
+     */
+    __clear_bit(X86_FEATURE_HTT, fs);
+    if ( cpu_has_htt )
+        __set_bit(X86_FEATURE_HTT, fs);
+
+    __clear_bit(X86_FEATURE_CMP_LEGACY, fs);
+    if ( cpu_has_cmp_legacy )
+        __set_bit(X86_FEATURE_CMP_LEGACY, fs);
+
     /*
      * On certain hardware, speculative or errata workarounds can result in
      * TSX being placed in "force-abort" mode, where it doesn't actually
@@ -861,13 +883,6 @@ void recalculate_cpuid_policy(struct domain *d)
         }
     }
 
-    /*
-     * Allow the toolstack to set HTT and CMP_LEGACY.  These bits
-     * affect how to interpret topology information in other cpuid leaves.
-     */
-    __set_bit(X86_FEATURE_HTT, max_fs);
-    __set_bit(X86_FEATURE_CMP_LEGACY, max_fs);
-
     /*
      * 32bit PV domains can't use any Long Mode features, and cannot use
      * SYSCALL on non-AMD hardware.
-- 
2.30.2


