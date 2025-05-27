Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DEEAC51BC
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998520.1379241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJvzL-0005Up-SE; Tue, 27 May 2025 15:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998520.1379241; Tue, 27 May 2025 15:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJvzL-0005SR-PM; Tue, 27 May 2025 15:13:11 +0000
Received: by outflank-mailman (input) for mailman id 998520;
 Tue, 27 May 2025 15:13:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJvzK-0005SL-Is
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:13:10 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16ab0c25-3b0d-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 17:13:05 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so32001925e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:13:05 -0700 (PDT)
Received: from andrew-laptop.. ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3814297sm267290705e9.28.2025.05.27.08.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 08:13:03 -0700 (PDT)
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
X-Inumbo-ID: 16ab0c25-3b0d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748358784; x=1748963584; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j94w7onphUS7sz4qhPWku28OxN8fikM6yz6LhRbY63o=;
        b=N9ylKvd2c0VBpOcdStEvnUyHNC3ZrW4ji1/J4YgSWKYvIMeJn3otRLKQyelPPvBbji
         x9JnRQ++z0b6EY1nzZ9PWz1RADK9hhIeeiqW4JjesyQ+8j43meOHHW1uZ9mytuARrIgQ
         AKH7BERRktcmfnVxdLiE8gVHtyO7Lk5VT1+eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358784; x=1748963584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j94w7onphUS7sz4qhPWku28OxN8fikM6yz6LhRbY63o=;
        b=W4Kwq3iJhC4T5NK4UBH2UfF8HiTqCkCQfMr7DmE0nmMofasMgWEzbTAdNlWQmRv5GO
         15F/3EBGOeol5te0vA/pXx9kj3e5Vjb4iBIBgPOCU5FS3XGZL9/yoD5lxOSWhO3SPgy4
         z4rJixBajtPdjeMQ7gfFPe/YYwc61pxS0hghiLmZDq1bwwI5KUOKcqT5EtfmWZp45yic
         2iJAtF6Z4AjKIJYHcqtQbdMaev5Bdhw7OcDjNRC5C8NeHABnw2D+UePkHiHIQB7ZGZMs
         UT8OYGNol6d4Ry2uS4Ma7BUDGd7dX7lUVHd0+7OXjSuVYC30cXeNgvXwdcFOHtZjWNVM
         O1WA==
X-Gm-Message-State: AOJu0YzszKhNqXYIhhPR+1fiOEnv7V7RMNh8Af1NINFQBzGJV9Qgp6Bw
	gBZTokQkCfXQUtYnlxGB/zk25Uw7Imm6cz0kVa0FH6A0ODU4mhpZjJifOTtdbHZ23uP1PESUnNr
	5scSr
X-Gm-Gg: ASbGncvc8B4YBEgdUR2Z1PwKo9ViUh+kp1T1P0MTP7HsG+EKSvrm9ZoiwxBoi+NFdql
	6qVtB3ppbiom9qXTa1eddfF3aADRKS6cj+WCs/c5oIqupfiuC2NtLkkVQM+Hk6AX2J25HjD56BO
	/QCy/JZZbndTtO8Tso8Cx97UWiSmsQ/0v9Gw9hqXDBy9MG7JxWXmeriFAoxnv08h5+LUV+tXRiv
	xryVrEy8QQFB2Heq+1pPq+D+AuDJ6nfh1t3ltH26LhxKwam5Zjr53hZJPMi0DzeXNIelFbuzSqc
	U6/CrMMBk9G43PfcNlMUdBZW6RsPdxO8ugfTE+ASvmu1Cl0H0tol/MR4EUlpjUYrPYcNX3XpTQ=
	=
X-Google-Smtp-Source: AGHT+IFLRNQEy389P7KNUH3D8z2W+kmnsMWaDHTO7Id/8dggQ27ARvWdkGcAPNr1t2FMqgWR0uB4HA==
X-Received: by 2002:a05:600c:5494:b0:442:f44f:678 with SMTP id 5b1f17b1804b1-44c94c2afafmr124240215e9.31.1748358784159;
        Tue, 27 May 2025 08:13:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/setup: Trim includes
Date: Tue, 27 May 2025 16:13:02 +0100
Message-Id: <20250527151302.63291-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

None of these are used by setup.c today.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/setup.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1f5cb67bd0ee..4181df97754a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -3,14 +3,11 @@
 #include <xen/bitops.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
-#include <xen/cpuidle.h>
 #include <xen/dmi.h>
 #include <xen/domain.h>
-#include <xen/domain_page.h>
 #include <xen/efi.h>
 #include <xen/err.h>
 #include <xen/grant_table.h>
-#include <xen/hypercall.h>
 #include <xen/init.h>
 #include <xen/kexec.h>
 #include <xen/keyhandler.h>
@@ -25,7 +22,6 @@
 #include <xen/sections.h>
 #include <xen/serial.h>
 #include <xen/softirq.h>
-#include <xen/trace.h>
 #include <xen/version.h>
 #include <xen/vga.h>
 #include <xen/virtual_region.h>
@@ -36,12 +32,10 @@
 #include <asm/bootinfo.h>
 #include <asm/bzimage.h>
 #include <asm/cpu-policy.h>
-#include <asm/desc.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
 #include <asm/genapic.h>
 #include <asm/guest.h>
-#include <asm/invpcid.h>
 #include <asm/io_apic.h>
 #include <asm/mc146818rtc.h>
 #include <asm/microcode.h>
@@ -62,7 +56,6 @@
 
 #include <xsm/xsm.h>
 
-#include <public/version.h>
 #ifdef CONFIG_COMPAT
 #include <compat/platform.h>
 #include <compat/xen.h>
-- 
2.34.1


