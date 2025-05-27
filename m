Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB03AC4BF0
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 12:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998219.1378999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJrBT-0006tv-9h; Tue, 27 May 2025 10:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998219.1378999; Tue, 27 May 2025 10:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJrBT-0006rq-6d; Tue, 27 May 2025 10:05:23 +0000
Received: by outflank-mailman (input) for mailman id 998219;
 Tue, 27 May 2025 10:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdBa=YL=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uJrBS-0006rk-Fo
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 10:05:22 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 197e8360-3ae2-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 12:05:21 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55324e35f49so1760313e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 03:05:21 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a701214afsm1042331fa.72.2025.05.27.03.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 03:05:19 -0700 (PDT)
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
X-Inumbo-ID: 197e8360-3ae2-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748340321; x=1748945121; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cl9xmdJKDQyhi2sVddtS7UKISQv1pEk5JbYWfqtFKVc=;
        b=cDy03u8ysCz/cwOETnE5IjSxgMJdTl419Ch8cSWLyf/4Sq4pkUFxJb0DvJrV5PonT1
         IB/EWwmpjaxdK2WSfO1eU/aGBpUDqwEvdfMUIFkqKrPX3bKIx8M3Lgv0u1pqPuaVbVPZ
         ZFrzCQsFE51KSfBSFcOCnabpCX18XD5bFnX/yCkIk0q04ykVpr4vjEIdWMHdMXD2cnUi
         dF1h3xRFhvgHBjg/5JhPa4pMYy+fFXs/g+IHZxR19o7+8ogKD5kYvBAuGPgKzVfn29IV
         wuXNHkh95/UoWY/pAPX1/j77+Pvd9Xq5e6XlOyBqR8mndCpQ8L8KdCYUamF0Px2v+MY3
         Jegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748340321; x=1748945121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cl9xmdJKDQyhi2sVddtS7UKISQv1pEk5JbYWfqtFKVc=;
        b=MnzwvNAz3UgVItoke4YDbRiPeMrK8CEKgTvsR7hoslJLVhcN5C2Ro6eYnPCdVgEi7/
         jQ3i6f4mu7xc7m8zzF7ON5qPieSvQnl5DJ0sITeGr3I4MTORXth3P/y34WA1yhcwEeUS
         njT/+qx4rFhlYb/bNs1w96d+tBY6R0lCr/bob8fC2j0/+LlfMuh0IcbrTtFSmGzhiFVa
         MK+zoyDpjmB2C4xzjJekHWj1xs3jUSc1kGlX9DyxnwWDhy4C3JBDk5kmnXxLI9osyJp7
         0LmEPT6tMxX8laSNey6izU+GNuAofE6coLlCCPwwGGQuOwRZNeTzyJ28ePMVuJe6o2EO
         Mb0w==
X-Gm-Message-State: AOJu0YwWD3arSGckA4dbNSow5cFULZ28u05nR/HPGYG9Nko3BlmU1T1u
	cwIxOZK6GE75q2xykH+jKreH2352rk76PsqLqcdv/PmVTjC7hgJ0oUbjL3IRow==
X-Gm-Gg: ASbGnctfvoc3t/yd/iabLCaazF9I7iaZQt3OhGbaGVtxXJe5JcIdKi8CIvDxZH1OMiq
	8ydLJSbKdR2o17nA3I7bwkuR6KK0OuD4cj/ixszn03kyR3i0CYA0vbmWf8yfw+1IJP0EYUlqt8i
	7kXfR9yUgQkZD6A6/KmNTmXgdX4qeb62GCVxXKygk6C67PmC+wGd10TJrmLjiVZMlz/iZhE9foY
	tJtarLrZNKt7txasx1uSV/OUmPCia9P1aA1v9BYq98xjA99L1JAi+uPwzVuTxuQuN8+rM5hyDTd
	dEKtJT31taSa0Umm7zgLTLomAPMpzV1fEceKQWbs3qFFRHbGDQQnpb8ylsucccbthyp8vveS274
	+NeBHUQQHLvtb9S0vcym3bbLQTw==
X-Google-Smtp-Source: AGHT+IHtA5cbQXcv66vLIJ+B0V9HQvGx0l9+/ek5jA6SaPzu3djOQb096zzrHJ5YSqEbRokBPx7zTQ==
X-Received: by 2002:a2e:a595:0:b0:32a:72de:c640 with SMTP id 38308e7fff4ca-32a72dec858mr850851fa.38.1748340320292;
        Tue, 27 May 2025 03:05:20 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/ACPI: move scheduler enable/disable calls out of freeze/thaw_domains
Date: Tue, 27 May 2025 13:04:16 +0300
Message-ID: <974033e9ff0df3ce8a74efaa33f1cee1dcbdb030.1748340071.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

The scheduler_disable and scheduler_enable calls have been removed
from freeze_domains and thaw_domains, respectively, and relocated
to their usage context in enter_state. This change addresses
the concern about misleading function semantics, as the scheduler
operations are not directly related to the domain pausing/resuming
implied by the freeze/thaw naming.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
The discussion about these changes can be found here:
https://lists.xenproject.org/archives/html/xen-devel/2025-03/msg00229.html
---
 xen/arch/x86/acpi/power.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 095ca391ad..448aa9f3a7 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -151,16 +151,12 @@ static void freeze_domains(void)
     for_each_domain ( d )
         domain_pause(d);
     rcu_read_unlock(&domlist_read_lock);
-
-    scheduler_disable();
 }
 
 static void thaw_domains(void)
 {
     struct domain *d;
 
-    scheduler_enable();
-
     rcu_read_lock(&domlist_read_lock);
     for_each_domain ( d )
         domain_unpause(d);
@@ -216,6 +212,7 @@ static int enter_state(u32 state)
     printk(XENLOG_INFO "Preparing system for ACPI S%d state.\n", state);
 
     freeze_domains();
+    scheduler_disable();
 
     acpi_dmar_reinstate();
 
@@ -334,6 +331,7 @@ static int enter_state(u32 state)
     mtrr_aps_sync_end();
     iommu_adjust_irq_affinities();
     acpi_dmar_zap();
+    scheduler_enable();
     thaw_domains();
     system_state = SYS_STATE_active;
     spin_unlock(&pm_lock);
-- 
2.48.1


