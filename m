Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5722CA4F998
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901867.1309810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknJ-0007A8-5A; Wed, 05 Mar 2025 09:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901867.1309810; Wed, 05 Mar 2025 09:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknJ-00076z-0n; Wed, 05 Mar 2025 09:12:01 +0000
Received: by outflank-mailman (input) for mailman id 901867;
 Wed, 05 Mar 2025 09:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknG-0006ev-UY
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:11:58 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4071e56-f9a1-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:11:58 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5496301c6afso692307e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:11:58 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:11:56 -0800 (PST)
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
X-Inumbo-ID: e4071e56-f9a1-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165918; x=1741770718; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeyrgEDHRHxvQYsPkfBfSFyIZ78yoXvWfRs5EkLqURM=;
        b=Sn334OhbYUrgo0A969YYozXZZ9eBBs0StMkSroY/Icp6nDvKPpLKP439FuQrOk2457
         pykaCpD+p1aW1Wc1MjBENpiLrz3/PAM6pQIZz8zvoORCJh+krXyOQtmJt6aO6ApfuIaW
         gKg/haNgoAuogXCzKKrRnPmvpJM2qwUlR3/soD6BQCcqZgRB9UT69/ksofqig3mBGavu
         U15zPs516+AIAfx1EgRTwb3tULWJb/GlHbz1VTuIiDCAuhVesOn9ugOie+B6xiDPEviO
         bz7RL1qL+6W5uiFD2XRh9i2xTF4T/bNHt+zgcvLP+nAbmaeizJzCWgzt69x7lfFsppUv
         XElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165918; x=1741770718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeyrgEDHRHxvQYsPkfBfSFyIZ78yoXvWfRs5EkLqURM=;
        b=EojDuyOQXp4uGritzUbQvrfRZaeNNgy1EEIlduC1zvsXUQiOqNIvQaMLwkN7cIufyO
         NBUlSGtwqKJHExoboKg7qitaY2pk6dHGOsEo9Vz25zIigiiU9eR31FIPJJ1wDiaa6IZq
         vkwD/5FvT1V1t5nJBg3EoTkf/iAK+7anGbbsUG0x9V9aZ18UdT9ZinQ8p7i38ITQ2S0g
         LN0eay3raCY7/psizUOOaJ4iRorgVoI1/TJb6okjsnv557JnHz4lcIUYzsB+Erz+/7Z9
         i3bCHQQceM/dvUycLkvtdSJzOdbWuiHTcLWZqRBVcyv4VHkvgRKdxlZjhC4nnry+me/d
         FC6Q==
X-Gm-Message-State: AOJu0YyaY/vYRly9Snb8INclG59BE7tO+zKKRL0bvc40Y2UDRU1KG/uQ
	8S7tPYAqf3nFkpmmkAF3pHevAs4TRjPAFHDwznD6UMORRWIX75oxVPzsyJPR
X-Gm-Gg: ASbGncsq3bXdNMk9Ag+lWGdqa/1Yq/CEKFMV4U8gJ4zRXYP5iGujDlalCuIeP/3yKxp
	kPrj7Xg4gFFhQfR/nFBbVvl65f7krL2LdwG9xxV00BxC/fv/f8ZbDbqj6U4cbI/PcshhauNaVL/
	/A/5GVaTCnUJ1yYtir+Fsk9VaSLqUVPgBzADlMAstVBMPpPY+r3rq4i0Jyvj3VsYQeQs7DaMZyq
	/WIm4f0ICFW6yqnW8/Nio/3nFjBDOrFzBeQWpT3yIRMe6DMw7CTMrN/MYO9HV6BsFlKRWL4K6ZW
	hQGgR1g4yf+acit15iOkFJiAS2uwFRmpvcq7JJPUiFYI8lIb1Q==
X-Google-Smtp-Source: AGHT+IHfyzIHEXBqG57sKaZHYffwmfm18XEj4b/MBT2LV4QYLxOmDVeIU5+H0RVLwtUVwkS9nfd6yA==
X-Received: by 2002:a05:6512:1252:b0:545:550:83e6 with SMTP id 2adb3069b0e04-5497d360c7cmr771143e87.5.1741165917298;
        Wed, 05 Mar 2025 01:11:57 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH 02/16] xen/x86: Move freeze/thaw_domains into common files
Date: Wed,  5 Mar 2025 11:11:10 +0200
Message-ID: <82d394363821b74fb1617e81e6e726a7a25b4028.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

These functions will be reused by suspend/resume support for ARM.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/x86/acpi/power.c | 29 -----------------------------
 xen/common/domain.c       | 30 ++++++++++++++++++++++++++++++
 xen/include/xen/sched.h   |  3 +++
 3 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index d0b67614d5..f38398827e 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -137,35 +137,6 @@ static void device_power_up(enum dev_power_saved saved)
     }
 }
 
-static void freeze_domains(void)
-{
-    struct domain *d;
-
-    rcu_read_lock(&domlist_read_lock);
-    /*
-     * Note that we iterate in order of domain-id. Hence we will pause dom0
-     * first which is required for correctness (as only dom0 can add domains to
-     * the domain list). Otherwise we could miss concurrently-created domains.
-     */
-    for_each_domain ( d )
-        domain_pause(d);
-    rcu_read_unlock(&domlist_read_lock);
-
-    scheduler_disable();
-}
-
-static void thaw_domains(void)
-{
-    struct domain *d;
-
-    scheduler_enable();
-
-    rcu_read_lock(&domlist_read_lock);
-    for_each_domain ( d )
-        domain_unpause(d);
-    rcu_read_unlock(&domlist_read_lock);
-}
-
 static void acpi_sleep_prepare(u32 state)
 {
     void *wakeup_vector_va;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0c4cc77111..49ff84d2f5 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2259,6 +2259,36 @@ int continue_hypercall_on_cpu(
     return 0;
 }
 
+
+void freeze_domains(void)
+{
+    struct domain *d;
+
+    rcu_read_lock(&domlist_read_lock);
+    /*
+     * Note that we iterate in order of domain-id. Hence we will pause dom0
+     * first which is required for correctness (as only dom0 can add domains to
+     * the domain list). Otherwise we could miss concurrently-created domains.
+     */
+    for_each_domain ( d )
+        domain_pause(d);
+    rcu_read_unlock(&domlist_read_lock);
+
+    scheduler_disable();
+}
+
+void thaw_domains(void)
+{
+    struct domain *d;
+
+    scheduler_enable();
+
+    rcu_read_lock(&domlist_read_lock);
+    for_each_domain ( d )
+        domain_unpause(d);
+    rcu_read_unlock(&domlist_read_lock);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 037c83fda2..177784e6da 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1059,6 +1059,9 @@ static inline struct vcpu *domain_vcpu(const struct domain *d,
     return vcpu_id >= d->max_vcpus ? NULL : d->vcpu[idx];
 }
 
+void freeze_domains(void);
+void thaw_domains(void);
+
 void cpu_init(void);
 
 /*
-- 
2.43.0


