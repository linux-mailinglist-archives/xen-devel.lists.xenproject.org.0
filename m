Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE47CCDCEBD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192962.1512076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSHB-0006Cz-Px; Wed, 24 Dec 2025 17:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192962.1512076; Wed, 24 Dec 2025 17:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSHB-0006Aq-LN; Wed, 24 Dec 2025 17:03:53 +0000
Received: by outflank-mailman (input) for mailman id 1192962;
 Wed, 24 Dec 2025 17:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSH9-0003b7-CD
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:51 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 843d05c1-e0ea-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 18:03:49 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b8052725de4so484940166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:49 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:48 -0800 (PST)
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
X-Inumbo-ID: 843d05c1-e0ea-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595829; x=1767200629; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTO1cOoieIDYOdGun+r3UsYomgD550c5mWk/kyaU2a4=;
        b=QjCWp3CdV+DoLKh/ULA4Nmql8c3AMT7xvflbHKZf60687J2Ega7TvOjFuXRVhBKwvu
         2dZ84oBhqRcBHVy1GhW3JdmgTQaent9xmWjWwJl71BOJg3V6SFYUvH98RB8PoomSBAeH
         CUD46v/aZ0jHiuoSS2iNIEB6otlck6DZb/bhQLW+5mdk2Pu4Fs2plpkguwkxGL8pS1qo
         pmHXKicH3paHkRNKTdJKTAf7PR8Uq/WDJ6z9yw2UkV5vjjKiygdY59evkePoD99s5BGg
         QUJmng3j6zmZ1noZzJBhGJgrjn2lkpcrP33OXrCmdOCr8xjeupvptoY9yP3m5iX4NBh2
         C5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595829; x=1767200629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LTO1cOoieIDYOdGun+r3UsYomgD550c5mWk/kyaU2a4=;
        b=bcMUCwDg8n8Js++biMNE6oN6K7aVx42hwHK/LVsTn47uD9nIXRv8mmDLvPqqfmUw+l
         xIOtNtkYS2kKRmGSwc7HG2PGEHVbUoW83V7Aqyod2aI09ncCmX5a6eDb169ZhQP0lhz/
         eKrCDnFDaThXVu3ULyvdMODed2itnvxnSoXEuaQgfwLxqWYUJ3TfnCb+y/K3qR37j9wi
         WEP+n+nmF2Tq8NsZLWxITP8c1zM6tqEy93PIjG98Z3rtrmsdnO/dbqP3RVbXarbn5Bk/
         8twfJma1DEhiPmxbf+JB/AyVFRSe2EepBkenZm9alIclOnsLnQxe+/Z4asdBjMBIActO
         lGoA==
X-Gm-Message-State: AOJu0YyI5TZK2KszL/rgE46jH0ZaPrzH3Xh1dEn73aKQaSccwJPbL+N1
	8h60/ZZ2mmCsZqKSo1ea5zts/Dl+lgzfFkGvmso7XZomYCm0f833PHdDmhWUaw==
X-Gm-Gg: AY/fxX6kbyjuQG5LpDUXIxkpN8NJ91MYC5tNglgulrLik8eHG4NhZgvZDAs9YQSR0i/
	H3ARay/VEUP1gBBLJijxGKLbqbKkglwnxbNwkNXbNgtO8btkN9+NNnA2a5YJh6ys+ZG3mzqjsja
	v0og+dMrWoSaUKGUZSThV9ojQBIvvlGKCqlVn2vdMpa7i4oTtmh/Uedk5FIG7Ea7X5RE0Fu4KN1
	4RvlnfsBMUx1Jk12Wt0ekblPYkjOYnughCN3V70fZ9X/hbNFX0pyolBlVKOIXT+M2SxJ3axXmYn
	55CeXXbLFs+/8ansT6YChmBnCGLWx9w2KJ3PRJEtlJ+0pnr8dm4+TADBFNeO9jy3ksIiZZHzQ4T
	q8VMZNKvJLqRuloninkeXDyaDmnohHe2ADa9Xmjq58pYD+jLqYBBYu5EaVRw5o+s0Cojw8u3vte
	zQBq6pwCUlBuk4ie3KQT4bRtEXw6/hLkLWFdPfUcP+bua16KArMzDAHfM=
X-Google-Smtp-Source: AGHT+IHKRJ3z0OvQOS9JRD6aJDuls3Iyrs4+KvWrvJ864awhMFP6aCzaj6a9Ntxog0vGp55AnKTR8g==
X-Received: by 2002:a17:907:96a7:b0:b73:8e7d:4fa3 with SMTP id a640c23a62f3a-b8037051234mr2000256366b.32.1766595828640;
        Wed, 24 Dec 2025 09:03:48 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 13/15] xen/riscv: implement reprogram_timer() using SBI
Date: Wed, 24 Dec 2025 18:03:26 +0100
Message-ID: <43249171def325c49541ebdac141fe99d159b60f.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Xen to handle timer reprogramming on RISC-V using
standard SBI calls.

Add a RISC-V implementation of reprogram_timer() to replace the stub:
- Re-enable the function previously stubbed in stubs.c.
- Use sbi_set_timer() to program the timer for the given timeout.
- Disable the timer when timeout == 0 by clearing the SIE.STIE bit.
- Calculate the deadline based on the current boot clock cycle count
  and timer ticks.
- Ensure correct behavior when the deadline is already passed.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/stubs.c |  5 -----
 xen/arch/riscv/time.c  | 31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 68ee859ca1a8..d120274af2fe 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -21,11 +21,6 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 /* time.c */
 
-int reprogram_timer(s_time_t timeout)
-{
-    BUG_ON("unimplemented");
-}
-
 void send_timer_event(struct vcpu *v)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index e962f8518d78..53ba1cfb4a99 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -4,8 +4,12 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/sections.h>
+#include <xen/time.h>
 #include <xen/types.h>
 
+#include <asm/csr.h>
+#include <asm/sbi.h>
+
 unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
 uint64_t __ro_after_init boot_clock_cycles;
 
@@ -39,6 +43,33 @@ static void __init preinit_dt_xen_time(void)
     cpu_khz = rate / 1000;
 }
 
+int reprogram_timer(s_time_t timeout)
+{
+    uint64_t deadline, now;
+    int rc;
+
+    if ( timeout == 0 )
+    {
+        /* Disable timers */
+        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
+
+        return 1;
+    }
+
+    deadline = ns_to_ticks(timeout) + boot_clock_cycles;
+    now = get_cycles();
+    if ( deadline <= now )
+        return 0;
+
+    /* Enable timer */
+    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
+
+    if ( (rc = sbi_set_timer(deadline)) )
+        panic("%s: timer wasn't set because: %d\n", __func__, rc);
+
+    return 1;
+}
+
 void __init preinit_xen_time(void)
 {
     if ( acpi_disabled )
-- 
2.52.0


