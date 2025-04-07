Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF9A7DAEF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 12:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939618.1339651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jb7-0001sy-TG; Mon, 07 Apr 2025 10:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939618.1339651; Mon, 07 Apr 2025 10:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jb7-0001qu-Px; Mon, 07 Apr 2025 10:20:57 +0000
Received: by outflank-mailman (input) for mailman id 939618;
 Mon, 07 Apr 2025 10:20:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cV/f=WZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u1jb6-0001qo-KC
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 10:20:56 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdaa4b97-1399-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 12:20:55 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac2902f7c2aso736390566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 03:20:55 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac7bfe5c7f7sm712686266b.20.2025.04.07.03.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 03:20:54 -0700 (PDT)
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
X-Inumbo-ID: fdaa4b97-1399-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744021255; x=1744626055; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=athitrIlFUHEiEDxf+01r51uYAvDaVmfFgQ/U9/E5OE=;
        b=n4Eu+ix2QgQh7Kf+yIWsoKN09aA7Twem6BtnZ/To5vTkYFda56H/inoh6+U35rwCpl
         WFuSI0aAWKswADYmm5Tw255xcbZx8J8JQNk4371gy2xjE85FpDtAKMDJnI6BLX0ETEEj
         LkeJYsCjrlxVDZT/+GL4+q22DROLxMXBwitpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021255; x=1744626055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=athitrIlFUHEiEDxf+01r51uYAvDaVmfFgQ/U9/E5OE=;
        b=iLo0ZqFgFSNGxI/GkxyCtWapGALBtOe5sHIRK074YDypq6/ObqPv0xzFnv2e2b+pG4
         jSeElYbMg3THLXlFepvracwFmXohyvOKZqruP1PZh6cq7Jsztn4ODScOZ1IID0kd5SwA
         0MLgofQd8CHZwg3YDhIxjzzNcv0kihrVbT7jh9BCJfc2PIQZ+JE7eH6NEh8cn8J2nnst
         fPTmuUiyYwbc5ku1kggNSCvRwVGaG1zvgj5/lkr1ogi77zoC4HeXp0QZO0PLadHr329v
         jtIVhnzTvQLs2YlhgnmKp8CPdxqXg7qzdfo44GRUqM5XHC4SJi4HYORgNpJvN6Spaj6p
         rIbw==
X-Gm-Message-State: AOJu0Yzel5KdUoQmR4nJjGSTSm13nBDy8aWD+O5hyWPHh0ICQ9EVoX42
	u+GPKVEjJlpWqovHaAgMIUDzTwMKGv2cXSwc1RXtWxFW1Tn6mlVC1v7URHbC3cjb1/wbqLFi3+S
	x
X-Gm-Gg: ASbGnctsac7DW+c9J1PWL8ZvSnTT6PfECaWgyopnqG0D1eSZn8olhqjIFh0HervJEij
	fKa22JyxX+tzskfVKxERKOaoTy48oYCvpusMQG+I3XLeY1gV1/gmHrFGKHzSfd4SgIzKQO3mdgv
	HIgtJJsEZ+hVKVrxahagkBRq7WNjOL5W7XM8uHhlllh2ullafL+FavAxYCeEWo1AfHqpXCV06C0
	8EvwD87EGnbdorNks9/LVjp4tLgCkzP6XTxnQeAmK6COLqizfitYArVVcjnz5r8nMTxlhaq06g4
	swanh1Ukxin3YPdDEolWS0+PmqvvfKtdJvbnsN/GdilnDBN6nQ==
X-Google-Smtp-Source: AGHT+IF18aluJtArY+4Lz8Yl8WYJsCo+sYSabuDUCe0n35NtXxKE47amets788BoPar+JoY3CYd37A==
X-Received: by 2002:a17:907:9728:b0:ac2:87b0:e4a5 with SMTP id a640c23a62f3a-ac7d6c9e900mr866928266b.2.1744021254787;
        Mon, 07 Apr 2025 03:20:54 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	jason.andryuk@amd.com,
	Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/xen: disable CPU idle and frequency drivers for PVH dom0
Date: Mon,  7 Apr 2025 12:18:41 +0200
Message-ID: <20250407101842.67228-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running as a PVH dom0 the ACPI tables exposed to Linux are (mostly)
the native ones, thus exposing the C and P states, that can lead to
attachment of CPU idle and frequency drivers.  However the entity in
control of the CPU C and P states is Xen, as dom0 doesn't have a full view
of the system load, neither has all CPUs assigned and identity pinned.

Like it's done for classic PV guests, prevent Linux from using idle or
frequency state drivers when running as a PVH dom0.

On an AMD EPYC 7543P system without this fix a Linux PVH dom0 will keep the
host CPUs spinning at 100% even when dom0 is completely idle, as it's
attempting to use the acpi_idle driver.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 arch/x86/xen/enlighten_pvh.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index 0e3d930bcb89..9d25d9373945 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/acpi.h>
+#include <linux/cpufreq.h>
+#include <linux/cpuidle.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 
@@ -123,8 +125,23 @@ static void __init pvh_arch_setup(void)
 {
 	pvh_reserve_extra_memory();
 
-	if (xen_initial_domain())
+	if (xen_initial_domain()) {
 		xen_add_preferred_consoles();
+
+		/*
+		 * Disable usage of CPU idle and frequency drivers: when
+		 * running as hardware domain the exposed native ACPI tables
+		 * causes idle and/or frequency drivers to attach and
+		 * malfunction.  It's Xen the entity that controls the idle and
+		 * frequency states.
+		 *
+		 * For unprivileged domains the exposed ACPI tables are
+		 * fabricated and don't contain such data.
+		 */
+		disable_cpuidle();
+		disable_cpufreq();
+		WARN_ON(xen_set_default_idle());
+	}
 }
 
 void __init xen_pvh_init(struct boot_params *boot_params)
-- 
2.48.1


