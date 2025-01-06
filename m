Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0EA027AA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 15:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865744.1277009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUnx8-0002Zb-U3; Mon, 06 Jan 2025 14:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865744.1277009; Mon, 06 Jan 2025 14:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUnx8-0002Y5-RE; Mon, 06 Jan 2025 14:19:34 +0000
Received: by outflank-mailman (input) for mailman id 865744;
 Mon, 06 Jan 2025 14:19:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFJS=T6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tUnx7-0002Xz-RZ
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 14:19:33 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f57aebe-cc39-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 15:19:32 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so25694990a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 06:19:32 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806fedbbasm23858386a12.71.2025.01.06.06.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 06:19:30 -0800 (PST)
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
X-Inumbo-ID: 3f57aebe-cc39-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736173171; x=1736777971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=quqjyLr5Tr/6kOvkiYP1aB0V6P6CHKH+j3lDEcV0jY4=;
        b=KOEbmCv0GKPK3yI/mJIk88+lR1Cqr1GOixs4yBHTnlh8mMuHYxy2C0ByXP/NWPgHCb
         GPvmyyr7ah0mwuSv/jLuLaoPWQT0ESq/mPF44VVYvlH+GN5MSY1ZL9LmWtgk5lQ3VJwO
         tvMktuGNC4y8MMrhiBGIiwlnF6ARiMeijvMw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173171; x=1736777971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=quqjyLr5Tr/6kOvkiYP1aB0V6P6CHKH+j3lDEcV0jY4=;
        b=vSYUBdh0wMpg/zIfOSyLql54o76ZJYcTORlwGvXpihBA1plN3kOrWnQJ4S4F3MNSeX
         3kgK2rPR/huL0y061PY5bm2k/6aou2yRUvV6BYKJ0ICgWwHcNS8YrAXcimanFIl3lDCl
         rPU3fHGSdKimhA/8gOxbuIrQsYJWDT0yYitJ2SmUZiCHddfTSJsZuwXR9pl8jUkrGR2/
         ++J2v5r/+XnR+c+s9ZQWt1ixkIDJ9iv85ShVSP9gIsu9keHKbFMOamGNEkUmNygvVbun
         CJHbmfbEOAZl48vWiUnvplW99GdACfTOMryTOTVzdVBDfXD9n0mBWz6S+3TljLyaqQya
         +arQ==
X-Gm-Message-State: AOJu0YwPEGpieyTfIsMDxs0SpeUOp14fMSNuAlkRwmh0Y5MZ+bDjtEFr
	eCC0Z+fobPDV8oJnKcY19sGKmdIj6kt5WH9AWEhG3A3RZ4ZehB/ls+O3UDwFBkmaHeqHtob+fcU
	+Rsw4qw==
X-Gm-Gg: ASbGncu1+NXJ4S9ai4wOuA4s/DzTC1KJGKJjASD00Ov34K5w1fPtGUGO8O/7YczCwKC
	7WosrEFkrZvfBEtQF2dyk7/NImtEh+IDs0iDEY9+uOAIaoiWk9BKZpyDh81QP6gmZ+0YeHAvUiy
	lE1yqJgnBoDSu14zAOrKJgl4vj7NR5uhXzZ5VhpA5DmfMm2ijmQZTKft1HJJxtOlFdFGW5rt2OH
	klNMamJJqnkxZIxxuoTs41rKVDBn0e4t4ItpYuHxLOwkzH9rF8lluZBGDghN26NO39NNa96zkGc
	my9ZSCJiPMJgT/3k76Zru0+lz0mo4EjCzbIz
X-Google-Smtp-Source: AGHT+IFNv/YOaDo8oGxz02LHgC1r3uGaI95476rT5I0jgnWKaO1P/HtaHO0GS0IR0adAIxYLl1fabw==
X-Received: by 2002:a05:6402:3486:b0:5d0:e73c:b7f6 with SMTP id 4fb4d7f45d1cf-5d81de2dd01mr47689558a12.31.1736173171025;
        Mon, 06 Jan 2025 06:19:31 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.20] x86/amd: Misc setup for Fam1Ah processors
Date: Mon,  6 Jan 2025 14:19:29 +0000
Message-Id: <20250106141929.615831-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fam1Ah is similar to Fam19h in these regards.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

With this patch, I think we're in an ok position to declare support on Zen5
CPUs.  I'm very disappointed that AMD don't have any documetation about ERAPS,
but to the best of my (backchannel) knowledge, Xen should behave safely.
---
 xen/arch/x86/acpi/cpu_idle.c     | 1 +
 xen/arch/x86/cpu/microcode/amd.c | 4 ++++
 xen/arch/x86/cpu/vpmu_amd.c      | 1 +
 3 files changed, 6 insertions(+)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 876317fad059..420198406def 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1417,6 +1417,7 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
 
     switch ( c->x86 )
     {
+    case 0x1a:
     case 0x19:
     case 0x18:
         if ( boot_cpu_data.x86_vendor != X86_VENDOR_HYGON )
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index ba7668a94670..58568f9aa024 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -114,6 +114,7 @@ static bool verify_patch_size(uint32_t patch_size)
 #define F16H_MPB_MAX_SIZE 3458
 #define F17H_MPB_MAX_SIZE 3200
 #define F19H_MPB_MAX_SIZE 5568
+#define F1AH_MPB_MAX_SIZE 14368
 
     switch ( boot_cpu_data.x86 )
     {
@@ -132,6 +133,9 @@ static bool verify_patch_size(uint32_t patch_size)
     case 0x19:
         max_size = F19H_MPB_MAX_SIZE;
         break;
+    case 0x1a:
+        max_size = F1AH_MPB_MAX_SIZE;
+        break;
     default:
         max_size = F1XH_MPB_MAX_SIZE;
         break;
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index a082450e923a..a6117dfebf2a 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -568,6 +568,7 @@ const struct arch_vpmu_ops *__init amd_vpmu_init(void)
     case 0x15:
     case 0x17:
     case 0x19:
+    case 0x1a:
         num_counters = F15H_NUM_COUNTERS;
         counters = AMD_F15H_COUNTERS;
         ctrls = AMD_F15H_CTRLS;
-- 
2.39.5


