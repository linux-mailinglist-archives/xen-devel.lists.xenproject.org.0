Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09D097563E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 16:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796744.1206498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOnd-0003MO-O9; Wed, 11 Sep 2024 14:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796744.1206498; Wed, 11 Sep 2024 14:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOnd-0003JF-LK; Wed, 11 Sep 2024 14:58:29 +0000
Received: by outflank-mailman (input) for mailman id 796744;
 Wed, 11 Sep 2024 14:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=knhI=QJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1soOnc-0003HA-8z
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 14:58:28 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c886bdb-704e-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 16:58:26 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-536584f6c84so7279503e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 07:58:26 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cf03fcsm618050766b.162.2024.09.11.07.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 07:58:25 -0700 (PDT)
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
X-Inumbo-ID: 4c886bdb-704e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726066706; x=1726671506; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+gBrrFhvYWAHE0noy24PPtPMyE+3z6FZk0gxLp1lsk=;
        b=KIgC+xAMooWbCNqhLCxaai8o13hHp2jGe6HPKC17YyC0Hm0WyrtK/Tg8ZlOviotM2g
         YrQKMGVru9cUGFdN9ws4F6ucGEoiDCVDnerkvMirJu1Fwx3U4fJ1rhnv7T6t0y5wtt28
         OT2jSLjXH6GavTlz6c7295kReB+rJ2cgh2I2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726066706; x=1726671506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+gBrrFhvYWAHE0noy24PPtPMyE+3z6FZk0gxLp1lsk=;
        b=XVcsEwYaI9Erfb/dLkHO78orOqFuvjfYhfZqkecvdS2a94hobA8rHxLIgQ12tKA82F
         FhwdOQHK4rHFK5l7nvPwhu+Jp7jKcUhf4hsSWysGPSmYJ2ughmuT+snv8IZpFGwaT13x
         KFz6roeS3cx3QDxxs3SzGUSKPE5Hans/2Ow0MUrcxBQaNnRaG4gZD0MH/q10g5NB4h7J
         RIKbKa423HsEpC7HUSeXQTXgRy03a+6CWztswgK7bV7B4AnavfmZTAppmQyAVkz09X0c
         wn3XUc+yWHd72T2IbnDmJl5eHoVYE55aAXtrIuRX0Fx33/hXtk2eDC+7S2jkXx3Tqtal
         LpAg==
X-Gm-Message-State: AOJu0YzLnuO0riQfw2J/3NQeyMiWSC+2G2eV+o4Q4qVHplPwJB3xPCmI
	GyXdvKr3nkU9wPQwf5h0kGVrtoE6FEdOhqCamDOYWgEb3H89hTQgPZ3PevzmZH7RGEBqGg+dBd3
	r
X-Google-Smtp-Source: AGHT+IGcFTtGHOBfu/w2cwaUItwF043cUBlKuNL9E42Dc3/Fn2SAvgLroaEKxLd5lZ4szfCaXTSM9Q==
X-Received: by 2002:a05:6512:2c0e:b0:530:ba92:f9a5 with SMTP id 2adb3069b0e04-536587f56c5mr11552055e87.45.1726066705585;
        Wed, 11 Sep 2024 07:58:25 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/traps: Re-enable IRQs after reading cr2 in the #PF handler
Date: Wed, 11 Sep 2024 15:58:23 +0100
Message-ID: <20240911145823.12066-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moves sti directly after the cr2 read and immediately after the #PF
handler.

While in the area, remove redundant q suffix to a movq in entry.S

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
I don't think this is a bug as much as an accident about to happen. Even if
there's no cases at the moment in which the IRQ handler may page fault, that
might change in the future.

Note: I haven't tested it extensively beyond running it on GitLab.

pipeline:
    https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1449182525

---
 xen/arch/x86/traps.c        |  2 ++
 xen/arch/x86/x86_64/entry.S | 11 +++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 708136f625..1c04c03d9f 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1600,6 +1600,8 @@ void asmlinkage do_page_fault(struct cpu_user_regs *regs)
 
     addr = read_cr2();
 
+    local_irq_enable();
+
     /* fixup_page_fault() might change regs->error_code, so cache it here. */
     error_code = regs->error_code;
 
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index b8482de8ee..ef803f6288 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -844,8 +844,7 @@ handle_exception_saved:
 #elif !defined(CONFIG_PV)
         ASSERT_CONTEXT_IS_XEN
 #endif /* CONFIG_PV */
-        sti
-1:      movq  %rsp,%rdi
+1:      mov   %rsp,%rdi
         movzbl UREGS_entry_vector(%rsp),%eax
 #ifdef CONFIG_PERF_COUNTERS
         lea   per_cpu__perfcounters(%rip), %rcx
@@ -866,7 +865,15 @@ handle_exception_saved:
         jmp   .L_exn_dispatch_done;    \
 .L_ ## vec ## _done:
 
+        /*
+         * IRQs kept off to derisk being hit by a nested interrupt before
+         * reading %cr2. Otherwise a page fault in the nested interrupt hadnler
+         * would corrupt %cr2.
+         */
         DISPATCH(X86_EXC_PF, do_page_fault)
+
+        sti
+
         DISPATCH(X86_EXC_GP, do_general_protection)
         DISPATCH(X86_EXC_UD, do_invalid_op)
         DISPATCH(X86_EXC_NM, do_device_not_available)
-- 
2.46.0


