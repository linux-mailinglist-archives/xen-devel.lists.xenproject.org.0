Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A5B3455C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093388.1448907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYvK-0003tg-Ax; Mon, 25 Aug 2025 15:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093388.1448907; Mon, 25 Aug 2025 15:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYvK-0003rH-7F; Mon, 25 Aug 2025 15:15:54 +0000
Received: by outflank-mailman (input) for mailman id 1093388;
 Mon, 25 Aug 2025 15:15:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKY8=3F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uqYvI-0003LE-Nx
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:15:52 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 635dfb38-81c6-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 17:15:52 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45a1b0cbbbaso38817715e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:15:52 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b5757378dsm112582025e9.15.2025.08.25.08.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 08:15:50 -0700 (PDT)
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
X-Inumbo-ID: 635dfb38-81c6-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756134951; x=1756739751; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6E7Pyj2pJIETl4FIfSSIY0ByiuSKLDdjeIULhdWxeK4=;
        b=iiLUh9x9satBj937pYUDbtoM9gUuRAyxPksbDSyEa0BqWKmcBeoYbpMLJHK6hTV4Pe
         Kf/cZPKr8pMOFJpptlJNSW0omR9/dKgRYSzJOPhNQzmQxZY7ZjBzXu9TiQo7x/vIhq5G
         Jqz9/m5KyjmErxRtcS57r40Vh+lnT1OZxHh2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134951; x=1756739751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6E7Pyj2pJIETl4FIfSSIY0ByiuSKLDdjeIULhdWxeK4=;
        b=nzAU1aRIny1Rw7r/SU1Nk21EaRg8YuQ3K5hxY67NkdVSn0A59wWvbQHs0bscJA8sQ1
         XnVUqgK8HvY6WiNlr+n3SccRpLMQBg037Muy8AOpHHpeMDB0t13I0jZQpZuiygxQWXu8
         2I5MaboAdt4mqg+CeipviUfs5aY20WOe7cDeJH/5aweg14iIgGWt3sfquIi6f/kaVxqD
         S8BNy2lgcCI5qPTLwA6euwRiGH5dfTaeOLrr9GvoIOzKXr+srtpES0S120Rn2LJPlhe1
         8bQO/r3sWXMfsAppluNHNUb3Xmo0FoOJRWMiAQRGaFkZE+KIyJK0a7cApSon+RRQv78k
         GLNg==
X-Gm-Message-State: AOJu0YyMuK2m4IWFzxn6xAltv/LiTQriyTgaPmQYFdsGOhVvjq9Y5z0n
	fKjZSFcJi2cmuu7GTo/BrV8eWtjFbbyUNkM/G43hUB84h/EamKDOnXylXWpiEuJbkuAIPb6VMFP
	+pdwE
X-Gm-Gg: ASbGnct5RM15EDjDmjPbBz+dex3o69odVPxS/LLWl7QRcmnPeeUcq8bWhJTobpeSI2M
	all6rDLGU8u15PiPNuoJzE04RstzGCFUh4rY4/siLrfaDEii/8/5cJAnNkqIgD8At4K9ZIt0AUl
	qmOqO1+KTuRaVaomowalZ4VCqhPzHEV9qtRoyv6SYcbyYEmyTMs8AA20OTdWafeIzDZYjm5uQe6
	EJSxRRFD1upmptZuukLVOYQgi/xP5Dmjm+VS62IOuXbfd2ONW1IzG6GAJFJsrPYDo3CeYn5VwZ+
	iHA0fG+20AIGM9QY/Mm7dUW7G+OXUWvbmDofAHFVMyu34/Ta8srlX9d0dk6K/x1l4Crt+Yh+T0m
	0Sp1sTfB9zwzOraJgUJ0/kprhMi4tkdEyoE/Z9iHf20djWSV0qKpaSwjJyGJXQC3CIQ==
X-Google-Smtp-Source: AGHT+IGyljq+aShOq1kAaCqCRT1hq0q1SXV2/6wNueXRt96IUKzaF7yYJleAb28/OOt0jc7HDdTGrQ==
X-Received: by 2002:a05:600c:4511:b0:456:10a8:ff7 with SMTP id 5b1f17b1804b1-45b517dd3admr99264965e9.28.1756134950884;
        Mon, 25 Aug 2025 08:15:50 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/suspend: unconditionally raise a timer softirq on resume
Date: Mon, 25 Aug 2025 17:15:15 +0200
Message-ID: <20250825151515.39177-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current code to restore the timer state on resume is incomplete.  While
the local APIC Initial Count Register is saved and restored across
suspension (even if possibly no longer accurate since it's not adjusted to
account for the time spent in suspension), the TSC deadline MSR is not
saved and restored, hence hosts using the TSC deadline timer will likely
get stuck when resuming from suspension.

The lack of restoring of the TSC deadline MSR was mitigated by the raising
of a timer softirq in mwait_idle_with_hints() if the timer had expired,
previous to commit 3faf0866a33070b926ab78e6298290403f85e76c, which removed
that logic.

This patch fixes the usage of the TSC deadline timer with suspension, by
unconditionally raising a timer softirq on resume, that will take care of
rearming the hardware timer.  Given that a timer softirq will be
unconditionally risen, there's no need to save and restore the APIC Initial
Count Register anymore either.

Note that secondary processors don't need this special treatment when
resuming, since they are offlined before suspension and brought back up
during resume, the first timer that gets setup will trigger a timer softirq
unconditionally, for example from sched_migrate_timers() that gets called
for each secondary processor.

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Fixes: fd1291a826e1 ('X86: Prefer TSC-deadline timer in Xen')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/power.c | 2 ++
 xen/arch/x86/apic.c       | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 2ac162c997fe..27d672ad5dbb 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -19,6 +19,7 @@
 #include <xen/iommu.h>
 #include <xen/param.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
 #include <xen/spinlock.h>
 #include <xen/watchdog.h>
 
@@ -310,6 +311,7 @@ static int enter_state(u32 state)
     thaw_domains();
     system_state = SYS_STATE_active;
     spin_unlock(&pm_lock);
+    raise_softirq(TIMER_SOFTIRQ);
     return error;
 }
 
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index cac5ba39e615..e3a2b84f1aae 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -65,7 +65,6 @@ static struct {
     unsigned int apic_lvt0;
     unsigned int apic_lvt1;
     unsigned int apic_lvterr;
-    unsigned int apic_tmict;
     unsigned int apic_tdcr;
     unsigned int apic_thmr;
 } apic_pm_state;
@@ -658,7 +657,6 @@ int lapic_suspend(void)
     apic_pm_state.apic_lvt0 = apic_read(APIC_LVT0);
     apic_pm_state.apic_lvt1 = apic_read(APIC_LVT1);
     apic_pm_state.apic_lvterr = apic_read(APIC_LVTERR);
-    apic_pm_state.apic_tmict = apic_read(APIC_TMICT);
     apic_pm_state.apic_tdcr = apic_read(APIC_TDCR);
     if (maxlvt >= 5)
         apic_pm_state.apic_thmr = apic_read(APIC_LVTTHMR);
@@ -718,7 +716,6 @@ int lapic_resume(void)
         apic_write(APIC_LVTPC, apic_pm_state.apic_lvtpc);
     apic_write(APIC_LVTT, apic_pm_state.apic_lvtt);
     apic_write(APIC_TDCR, apic_pm_state.apic_tdcr);
-    apic_write(APIC_TMICT, apic_pm_state.apic_tmict);
     apic_write(APIC_ESR, 0);
     apic_read(APIC_ESR);
     apic_write(APIC_LVTERR, apic_pm_state.apic_lvterr);
-- 
2.49.0


