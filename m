Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF014B0A60E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 16:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048842.1419050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclwd-00069h-DB; Fri, 18 Jul 2025 14:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048842.1419050; Fri, 18 Jul 2025 14:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclwd-000671-7N; Fri, 18 Jul 2025 14:20:15 +0000
Received: by outflank-mailman (input) for mailman id 1048842;
 Fri, 18 Jul 2025 14:20:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uclwb-0005sk-6u
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 14:20:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 514da7ed-63e2-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 16:20:12 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so16420805e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 07:20:12 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48cb9sm2005490f8f.45.2025.07.18.07.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 07:20:11 -0700 (PDT)
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
X-Inumbo-ID: 514da7ed-63e2-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752848412; x=1753453212; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNGMNjfHX3Gm4WUa0mGufOewm724HaRVU6o6GBgJXW4=;
        b=fjhkkCfihJNjEC46zVLUcyYbLthbLzoFrgyUYPA/lcL/hF/AX2zI2aPO2JKt9NcZmn
         0j8MvZxAYMky0eJStrBJ5aSA/6ZLdNHElLCz6k22oqj69RuMMYpgGkT5MoUazDHLkXZX
         0m1fyDqyjUC96G0LbCcPPj6cZqcnhkPRIsyzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752848412; x=1753453212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNGMNjfHX3Gm4WUa0mGufOewm724HaRVU6o6GBgJXW4=;
        b=j04hiE3Lpeo0I866x9v2aeyTyb9D50222vX4v0ZRxtpEkbfJuM1/v5uAOFRpDpDyEF
         eqFzCpAo5lNap73hq6A9JdW7xbIsKOpxOntEQ0wsx40fUOb6P45WFgN/qOl4iRKzzJ0b
         rlzymGUy9Euyxh6VktyjpxMQRFZu/YqVjEPGMx+kQckg5GVL/CUk7Y22nT3H48/AX1Vu
         6sUzgC7PdYRPXPm8QeZO7sIl99xK18DKgCexr/Jv7X4EOPc8tvbzpST5BIOQMRrkeHgf
         f6XkiEBGVlTLu9bSpzju2ZoR+Sk6Crz0cujfpX2GHjXYaXYKkHJkPUoKFfy9ezAhKYqJ
         WfvQ==
X-Gm-Message-State: AOJu0YxD/wuGNsDmXopHfHZo3O0ZLtsaMZI3kOlVywzGcvxKurguoRWl
	zN4W1JpBHcWZ3J7Z/EHJj6zQ3ymTptL+vmi4BMibC+05QZK3URbnZ/3d6hZCIALmTEuiIfg/pwU
	JDnq91VaG+A==
X-Gm-Gg: ASbGncsdFtzK7bpSivqYChSYX2JOU/nfsOH4BJ1HXxaaneCmS7ZMm5brpKqNJu+NS7u
	Z2Qtaf1IAsMdcN5aikGGVyQDUXUpc3tn+KLOhX74mEe6zYYsMSMTfCayM2S3XuOyt7AWI+eEM6I
	nenxLj3D26q2P8ch33ZAUcDlZK2zhmxLK/QiHOjVa0py/uNcrMH6wJIWKM8lIk1rPerSzZTqZ/w
	vldy1aMoLKD8vipSNU1Neru7OO4SXPlz9B76boGwY4NSTPUANmg8BPkir1I9oN0ox507k40bz5A
	s4CLsfTIldx0vBM4OeyQyxbV5j17IoXPLL3LdmhDpb6SYAf5KSlC2gotXSTGiQRAuCFtNXzak9e
	ZS1Q4//jakxnszN6W/Iud+zReqb9VCgiR+rCnIBvVB0RY5BCUQ2NUew5z9iUyLsaw1IW84yHSkP
	31Xyr3g8T/mmw=
X-Google-Smtp-Source: AGHT+IFhb7WdfMMY78VTdNv7VeT/DANHpijhJu0rJbUbAdyEsjzoMpxvQtczimyLV67RPJ3IOW6USg==
X-Received: by 2002:a05:600c:674a:b0:456:2b4d:d752 with SMTP id 5b1f17b1804b1-4562e373e16mr98695205e9.20.1752848412033;
        Fri, 18 Jul 2025 07:20:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/3] x86/match-cpu: Support matching on steppings
Date: Fri, 18 Jul 2025 15:20:05 +0100
Message-Id: <20250718142006.2471129-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718142006.2471129-1-andrew.cooper3@citrix.com>
References: <20250718142006.2471129-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Architecturally, stepping is a 4-bit field, so a uint16_t suffices for a
bitmap of steppings.

In order to keep the size of struct x86_cpu_id the same, shrink the vendor and
family fields; there's no need for them to be uint16_t in Xen, and this
matches the size of the fields in cpuinfo_x86.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase over adjustments to x86_match_cpu().
 * Switch name to X86_STEPPING_ANY, and use 0xffff to remove a conditional
   from x86_match_cpu().

Combined with the previous patch, the code generation continues to be
reasonable despite the analysis tangent taken on the v1 thread.
---
 xen/arch/x86/cpu/common.c            |  2 ++
 xen/arch/x86/include/asm/match-cpu.h | 12 ++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index a659ea7bf604..7851142b737d 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -1022,6 +1022,8 @@ const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[])
             continue;
         if ( c->model != m->model )
             continue;
+        if ( !((1U << c->stepping) & m->steppings) )
+            continue;
         if ( !cpu_has(c, m->feature) )
             continue;
 
diff --git a/xen/arch/x86/include/asm/match-cpu.h b/xen/arch/x86/include/asm/match-cpu.h
index f8e4e37d9972..e25f414ea1b4 100644
--- a/xen/arch/x86/include/asm/match-cpu.h
+++ b/xen/arch/x86/include/asm/match-cpu.h
@@ -8,28 +8,32 @@
 #include <asm/intel-family.h>
 #include <asm/x86-vendors.h>
 
+#define X86_STEPPING_ANY 0xffff
 #define X86_FEATURE_ANY X86_FEATURE_LM
 
 struct x86_cpu_id {
-    uint16_t vendor;
-    uint16_t family;
+    uint8_t  vendor;
+    uint8_t  family;
     uint16_t model;
+    uint16_t steppings; /* Stepping bitmap, or X86_STEPPING_ANY */
     uint16_t feature;   /* X86_FEATURE_*, or X86_FEATURE_ANY */
     const void *driver_data;
 };
 
-#define X86_MATCH_CPU(v, f, m, feat, data)                      \
+#define X86_MATCH_CPU(v, f, m, steps, feat, data)               \
     {                                                           \
         .vendor       = (v),                                    \
         .family       = (f),                                    \
         .model        = (m),                                    \
+        .steppings    = (steps),                                \
         .feature      = (feat),                                 \
         .driver_data  = (const void *)(unsigned long)(data),    \
     }
 
 #define X86_MATCH_VFM(vfm, data)                                \
     X86_MATCH_CPU(VFM_VENDOR(vfm), VFM_FAMILY(vfm),             \
-                  VFM_MODEL(vfm), X86_FEATURE_ANY, data)
+                  VFM_MODEL(vfm), X86_STEPPING_ANY,             \
+                  X86_FEATURE_ANY, data)
 
 /*
  * x86_match_cpu() - match the CPU against an array of x86_cpu_ids[]
-- 
2.39.5


