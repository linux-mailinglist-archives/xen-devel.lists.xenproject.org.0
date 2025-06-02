Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06546ACAB2A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002941.1382358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16E-0007uy-Jd; Mon, 02 Jun 2025 09:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002941.1382358; Mon, 02 Jun 2025 09:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16E-0007qN-Fr; Mon, 02 Jun 2025 09:04:54 +0000
Received: by outflank-mailman (input) for mailman id 1002941;
 Mon, 02 Jun 2025 09:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM16D-0007kh-Ch
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:04:53 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a49eed8e-3f90-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 11:04:51 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5534f3722caso252521e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:04:51 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdc3sm1507541e87.176.2025.06.02.02.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:04:50 -0700 (PDT)
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
X-Inumbo-ID: a49eed8e-3f90-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855091; x=1749459891; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da/Gwj5SRn8BTf5+gC6RkaoWtjYeeb+pM91gG3eXP48=;
        b=WR3l8b//HTc/vvydLQNzqKH2jZoqJMoFtrFpzqgrYQPUH6MXU8THOumo8n404ixRI2
         RGxFsmuwH1drmlFovrnFeLlMVD9QmHZrTahXTcBz2GCkNowBvyoMj7jbpqM2OQE7GSrR
         5e7Vq6k1+T61WtN4QMr2a7V03bO/fOiNge4jWH5bdrAHhTrDpVTCbfJEl6/O8qXdfYM7
         kOned9m/DghJ4+GgUfYPUb8So0lS7BphcfRQ6LHJWko98qvx6PGSrzH1PCNpx9ANogjp
         1kJUkfEhsw89dQvlrVrG/HkVBQJ+ansNuX4imaCi4dIGXve6mDdUV6D4VT1Dg8p92OMu
         Sp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855091; x=1749459891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Da/Gwj5SRn8BTf5+gC6RkaoWtjYeeb+pM91gG3eXP48=;
        b=SnFdF6Hxf+muuaNfSSo1bKD6t67vMHAUmp5DMs4wFVQD1Fnn4ZmzjCwk2zdUzIObIC
         90jMPSScRlo7n7Mx51j68N6SPkvt2FDzIJdX9xTmdEFoEaITUsC3kNYQIrfnHlYLlcpE
         UnHfmM12DWCy0O31QgR8gMpJ4HjFKBvKXeA69oOnPKsn5d2f4EoTIPc1UJmmCv8ClY2X
         LuwD9mO2MBSc+oEeUBsMdAYnJTyaZpEF14ilN8quxfShQFV/vNjLaR2Rg310lvuhGH8h
         bhWvsvc1XPwr6spj1HLw8hMhmyFRLTX1rrMaeznTNWm8kywJM6gCuTAOZq+yPKSjt16p
         BqMg==
X-Gm-Message-State: AOJu0Yx3wM+sD2QSOmtPfBtvDY2+al5/3jnop+t6tv16o2McSRQ6Yfhm
	AwvXg2GUVHeGO6xABcqsWhkTEyyjuKHoCeZB2/4PE0TNn5mgAzK7H1jIH34yqdQg
X-Gm-Gg: ASbGnctaZ/53f0YRPEPCkBFUhuGY/LMbB9CNOVsWvIyEDN7gdil1RQ7cos1CnxvVATp
	8Hxzze1/us7avs4oq0NI+9TmgIx81at9rfNEkIo0R0/q+0Tu1eFSG7IeTT2K/vkV7aGHSpsFAjH
	D0e8ELsLPFuGqWEHLB6LcwFeB821jratEyDYQXPP3GzbzH6LUgXCto87iuWlgAeDrxtfJWQlg0A
	eKMfxWc5xzBS8t+0t8NVQzbT16g2H8w/JiEs4ByK15ZrtOYoiB4PkwMD13ru+TGpMi7qQT0k3fV
	N8H0uQUnUt9AFGHcDWcBx+2DDlxTdvHrnvLOMROT9vN741/xZuvlyqIgCEOXtyhRfzX0bgRKWXH
	A95bEO59MTam1KZ8=
X-Google-Smtp-Source: AGHT+IGSGQlhdjKcLLakl9LRgHis7Wp+dmnc2fkNECPVD/CuspGse8lLtiZIhN0uW5p+NxZ0WdrUqQ==
X-Received: by 2002:a05:6512:3b2a:b0:553:3892:5ecc with SMTP id 2adb3069b0e04-55342f928d0mr1769232e87.36.1748855090890;
        Mon, 02 Jun 2025 02:04:50 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xakep.amatop@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4][PART 2 01/10] xen/x86: Move freeze/thaw_domains to common code
Date: Mon,  2 Jun 2025 12:04:12 +0300
Message-ID: <a679ba83fcc0e8387158a218f3af1fa234ea3534.1748848482.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748848482.git.mykola_kvach@epam.com>
References: <cover.1748848482.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The freeze_domains and thaw_domains functions are currently defined
in x86-specific suspend code. These functions are also useful on other
architectures, such as ARM, for implementing system-wide suspend and
resume functionality.

This patch moves these functions to common code so they can be reused
across architectures.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v4:
- Enhanced commit message with a clearer explanation of the
  rationale for moving freeze/thaw_domains to common code.
---
 xen/arch/x86/acpi/power.c | 25 -------------------------
 xen/common/domain.c       | 25 +++++++++++++++++++++++++
 xen/include/xen/sched.h   |  3 +++
 3 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 448aa9f3a7..2ac162c997 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -138,31 +138,6 @@ static void device_power_up(enum dev_power_saved saved)
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
-}
-
-static void thaw_domains(void)
-{
-    struct domain *d;
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
index abf1969e60..58c5ffc466 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2405,6 +2405,31 @@ domid_t get_initial_domain_id(void)
     return hardware_domid;
 }
 
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
+}
+
+void thaw_domains(void)
+{
+    struct domain *d;
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
index 559d201e0c..071ee19062 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1070,6 +1070,9 @@ static inline struct vcpu *domain_vcpu(const struct domain *d,
     return vcpu_id >= d->max_vcpus ? NULL : d->vcpu[idx];
 }
 
+void freeze_domains(void);
+void thaw_domains(void);
+
 void cpu_init(void);
 
 /*
-- 
2.48.1


