Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15A282AA88
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 10:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666067.1036496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNr3I-000292-4b; Thu, 11 Jan 2024 09:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666067.1036496; Thu, 11 Jan 2024 09:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNr3I-00025n-1r; Thu, 11 Jan 2024 09:08:40 +0000
Received: by outflank-mailman (input) for mailman id 666067;
 Thu, 11 Jan 2024 09:08:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+ne=IV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNr3G-00025h-5y
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 09:08:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01141f5c-b061-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 10:08:37 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e60e1373bso2309075e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 01:08:37 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 s27-20020adfa29b000000b003366cf8bda4sm664221wra.41.2024.01.11.01.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 01:08:35 -0800 (PST)
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
X-Inumbo-ID: 01141f5c-b061-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704964116; x=1705568916; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xL3761ssSlB++YwBh6IrPXss1xwoWjvn8Ap3bhK0DfA=;
        b=ZNw819/T2t+BxSyaNogtE28gJK31onjx3cGHFO4qSvPEAWouVnYc2hsE3QnVhJCd48
         drK7ADQtcqOPGBoawTEvCOYIz83QJH9+yhrdsiN1WFehFW0JHc8uoDmEy64peROOwcRa
         vGKDDprnpM8i3d7Bv/vWIq/YifiFf29rBB8bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704964116; x=1705568916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xL3761ssSlB++YwBh6IrPXss1xwoWjvn8Ap3bhK0DfA=;
        b=HDRrMGJvQ+Z26lR+f5hbtZMUnVe5fb9ifDTGkFuoeltd+Pcrw4j3gc68R6tAqAAEo6
         YRsdQKyQ78/mZbpTPkvhnEipoYtuxKYRLLNjb2+m+uYOTNESz2LyoaKZC9PRcBa00Be5
         cmy7SpAuQCQ1fpSw3GukGO3UyL37OAM0eKkiqJ0i0JVFvs/hNnSET+ipo17KvUNkJGE1
         MGlM8THRXxTWK8vbgjTsxwFNalUGb2uB7OIhx7HVy5u6K/QeVGXGFhShST7d8NwtUsI2
         /V4BPM2bBV7qZNTO/BUpqtKxZrTyQ8T1cei3IlFNFKbyLAYqgJnbCav3f1s/tF+/86dy
         tb8Q==
X-Gm-Message-State: AOJu0Yzo8QqmwR0qNaWzibIUS0HSouhmwPwh5KWdj/lw3wN7yeazKGKe
	tXzUlMRp5dKxc2W65wG1TtBjyDpAWbjmwDm2FmD6PhwgIS4=
X-Google-Smtp-Source: AGHT+IGJaC/xb9CScX0wTmbsCyOacS78Kzlsy3BkCDDFX/1bAspQNvnAES0xfrc1G/TK45XOSM6enw==
X-Received: by 2002:a05:600c:12d1:b0:40d:2b60:b6cf with SMTP id v17-20020a05600c12d100b0040d2b60b6cfmr219480wmd.78.1704964115888;
        Thu, 11 Jan 2024 01:08:35 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/intel: ensure Global Performance Counter Control is setup correctly
Date: Thu, 11 Jan 2024 10:08:21 +0100
Message-ID: <20240111090821.67594-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
MSR contains per-counter enable bits that is ANDed with the enable bit in the
counter EVNTSEL MSR in order for a PMC counter to be enabled.

So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
bits being set by default, but at least on some Intel Sapphire and Emerald
Rapids this is no longer the case, and Xen reports:

Testing NMI watchdog on all CPUs: 0 40 stuck

The first CPU on each package is started with PERF_GLOBAL_CTRL zeroed, so PMC0
doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
relevant enable bit in PERF_GLOBAL_CTRL not being set.

Check and adjust PERF_GLOBAL_CTRL during CPU initialization so that all the
general-purpose PMCs are enabled.  Doing so brings the state of the package-BSP
PERF_GLOBAL_CTRL in line with the rest of the CPUs on the system.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Do the adjustment of PERF_GLOBAL_CTRL even if the watchdog is not used, and
   enable all counters.
---
Unsure whether printing a warning if the value of PERF_GLOBAL_CTRL is not
correct is of any value, hence I haven't added it.
---
 xen/arch/x86/cpu/intel.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index dfee64689ffe..40d3eb0e18a7 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -533,9 +533,25 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 	init_intel_cacheinfo(c);
 	if (c->cpuid_level > 9) {
 		unsigned eax = cpuid_eax(10);
+		unsigned int cnt = (uint8_t)(eax >> 8);
+
 		/* Check for version and the number of counters */
-		if ((eax & 0xff) && (((eax>>8) & 0xff) > 1))
+		if ((eax & 0xff) && (cnt > 1) && (cnt <= 32)) {
+			uint64_t global_ctrl;
+			unsigned int cnt_mask = (1UL << cnt) - 1;
+
+			/*
+			 * On (some?) Sapphire/Emerald Rapids platforms each
+			 * package-BSP starts with all the enable bits for the
+			 * general-purpose PMCs cleared.  Adjust so counters
+			 * can be enabled from EVNTSEL.
+			 */
+			rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
+			if ((global_ctrl & cnt_mask) != cnt_mask)
+				wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL,
+				       global_ctrl | cnt_mask);
 			__set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
+		}
 	}
 
 	if ( !cpu_has(c, X86_FEATURE_XTOPOLOGY) )
-- 
2.43.0


