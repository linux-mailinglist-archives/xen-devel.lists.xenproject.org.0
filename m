Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFFB7F4DB6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 18:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638925.995904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qc8-0000We-Cc; Wed, 22 Nov 2023 17:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638925.995904; Wed, 22 Nov 2023 17:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qc8-0000Uy-8x; Wed, 22 Nov 2023 17:02:12 +0000
Received: by outflank-mailman (input) for mailman id 638925;
 Wed, 22 Nov 2023 17:02:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y6Xs=HD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1r5qc6-0000Us-KS
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 17:02:10 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de3e1db7-8958-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 18:02:07 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso32239865e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 09:02:07 -0800 (PST)
Received: from localhost.localdomain ([185.25.65.68])
 by smtp.gmail.com with ESMTPSA id
 n28-20020a05600c3b9c00b0040772934b12sm51897wms.7.2023.11.22.09.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 09:02:05 -0800 (PST)
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
X-Inumbo-ID: de3e1db7-8958-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700672526; x=1701277326; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9oKcdk6bcbM8+ucFOrKoFcZ4qLybvfsm9K7gyn2qAM=;
        b=ON+u/kGe70jhxOHpqzpSWV912SQdrns0ShowhvB/zkVL0wwlmoURqRLovRQxe7YkEd
         rTR9rzIp12nP966TsShgxeXk6XPS2k7m4XnpdRPSXZBfSns6rFV+6QrjOUzlPrO8LzCn
         pJb4lGpux7p+jjUND+8a1I0WP9NIJ+cnf4D8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700672526; x=1701277326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9oKcdk6bcbM8+ucFOrKoFcZ4qLybvfsm9K7gyn2qAM=;
        b=KVRtUjRxGBdw0W7g13yrT9UZmn8aC3A9Omk7iaxEBtjtK3cZitk+Mi42SX9E9IqGpz
         FkBTFZHwFPLtY9fcSveyt7K+QV8s7kR76+Vwnb0H4bGa69JBQ3RW2bw0b4usoOgY8oBl
         TU3idZsV4CXdB1F/o9JxyxYGrdK9Y1RB45UAgXXNHTFNJCbCongecCms55kwwHFVh0y6
         Mik3BgwigtVEiVfwZjBPHGgwoXKjSqvuMfoT/CXhnUpAUhAHYdj04+MZfUgZ3ubPMjQu
         YRNdxFmz+KceG3KrmroDK3o+19+yYgDicTh/gf4agSwejpJJGHo0/Y9VW0kTd4VrKhrA
         xXSQ==
X-Gm-Message-State: AOJu0Yz0477Euqxm95Qi1LbGm6uaFc/dnu0QcNwuTYyhlboZ4FTD0YMM
	YwpwZOsO/RgRh+rg3pohdAUkxFXFjk6idPwTtO8=
X-Google-Smtp-Source: AGHT+IHuzp7rL8bYJuh0tk6OPWuVdJzVSlhWjocn/IX6fusfKAzC6Vnd6tw2QxhguUVRavM60MyyBg==
X-Received: by 2002:a05:600c:19c6:b0:406:54e4:359c with SMTP id u6-20020a05600c19c600b0040654e4359cmr2249962wmq.19.1700672525647;
        Wed, 22 Nov 2023 09:02:05 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/ACPI: constify acpi_enter_sleep argument
Date: Wed, 22 Nov 2023 17:01:42 +0000
Message-Id: <20231122170142.15038-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minor style change, structure is not changed.
No functional change.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/acpi/power.c       | 2 +-
 xen/arch/x86/include/asm/acpi.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 81233738b1..861d12aab0 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -342,7 +342,7 @@ static long cf_check enter_state_helper(void *data)
  * Dom0 issues this hypercall in place of writing pm1a_cnt. Xen then
  * takes over the control and put the system into sleep state really.
  */
-int acpi_enter_sleep(struct xenpf_enter_acpi_sleep *sleep)
+int acpi_enter_sleep(const struct xenpf_enter_acpi_sleep *sleep)
 {
     if ( sleep->sleep_state == ACPI_STATE_S3 &&
          (!acpi_sinfo.wakeup_vector || !acpi_sinfo.vector_width ||
diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 6ce79ce465..68cee10f9a 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -106,7 +106,7 @@ extern s8 acpi_numa;
 extern struct acpi_sleep_info acpi_sinfo;
 #define acpi_video_flags bootsym(video_flags)
 struct xenpf_enter_acpi_sleep;
-extern int acpi_enter_sleep(struct xenpf_enter_acpi_sleep *sleep);
+extern int acpi_enter_sleep(const struct xenpf_enter_acpi_sleep *sleep);
 extern int acpi_enter_state(u32 state);
 
 struct acpi_sleep_info {
-- 
2.34.1


