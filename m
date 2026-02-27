Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Bu8iAfElommI0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3DF1BEEF1
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243142.1543164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74m-0001Xd-5u; Fri, 27 Feb 2026 23:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243142.1543164; Fri, 27 Feb 2026 23:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74l-0001Vd-V9; Fri, 27 Feb 2026 23:16:51 +0000
Received: by outflank-mailman (input) for mailman id 1243142;
 Fri, 27 Feb 2026 23:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74j-0001Do-WE
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:50 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63667f70-1432-11f1-9ccf-f158ae23cfc8;
 Sat, 28 Feb 2026 00:16:47 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4377174e1ebso1836368f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:47 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:45 -0800 (PST)
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
X-Inumbo-ID: 63667f70-1432-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234207; x=1772839007; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vW+QCUaUYuUq9G8gsk0OzquSefAutMzWyPSfjvJkvyY=;
        b=vhLha4bonoIIVEtrCYPP1O9oG/HtAdS9glPqoD/EGaAeaM0qrSyp0hb7oBSKNSCxr2
         KRSY5Z1dC4Xef20vDJo01G75YjPd8nLXjstEHDXml7wO7nRDcdxODY3UgTvjDCuwwFLW
         iDDmo7htP/Mp+Ob60RpxIlNP54a/Ft1pu3RKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234207; x=1772839007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vW+QCUaUYuUq9G8gsk0OzquSefAutMzWyPSfjvJkvyY=;
        b=Zzb6OjewaZBPMNFP4yyG4zRagBGyDLHRiZH+kU8H0a1ZZFJT1su8sOEPgGqF3Xkab+
         xKVcOnURpeL2CRA1IRy49nKQZUbXWynSPRzisfbWZkqNUEXdF+SyaGhIJ9uv2eOwYFSU
         r+smbv4RG7+89alOMtK807xyaTm+pa6/TOwQjGvehB/54gIuZlOmuT7Jo7+5Xx1sVrzr
         9QTrzy6z5ebOtFIdkb4Tlayh0+YpeBgP/9Nlp3GIrmsFpW+RpNeAMu1oRqjCZh4EupEV
         K1dY2E3IX9JmE6IO+DNKdAxirKLaHaf6Htwapa94+HLHbDjZvc+jR33DeAWxJmah6/lN
         7sqQ==
X-Gm-Message-State: AOJu0YzF0KyY8nDaaI8mPnMXdz0sjnr/xuOJSXZdvLYhJSe6iMRlsoZg
	8Hqq466CnoaQPy833cIqJjoTlmkLn5d55a+p3LIjZrvokpp/ZPwYmx7kqSKhf4xbecBPlUpuSlj
	m56CTSJzVEQ==
X-Gm-Gg: ATEYQzyOh+nZyZYUl+Oxb5m9gLnnvQ77+8+JLKCIDIOOG75jmX6c3c2Hny4bRsLsSID
	HTqm78aNhITRpVNnVF68OYTWjb8ttQNc5KFams6hw2dBiHL8hNSx4hVun2BaG361X9vmgX6gWw3
	pc9oJu7k06bTSUMI7pgGL5drJZ7oEi4BAAcEN+/025FEN+xOs1e40Yx5eDlx4xy6ZseMbwH3MmL
	I4Qm5hpK/BEpab3zDC7AqBkJkgWYeaDzqTmUW6M11lc8Iv3F5XDciEjoeZh1XzwFTXqQzLDSAt2
	j/hDv9SCfyvO2dm6J2GqyawyVp6iCPYRfIfIlmxOP4R2TFMCnji9oMinnZz4GbrncF0svUK5Cv3
	nM2dfT24ZKjJecfOe2TJLHcRQD1TRbOxwHP10SgFf9F/Y6uhgtBW5au+rIZBaB/q8zZBA7nV19l
	uiUXPAw8wWXt6NpPm8FvK/CauML9WWnS1R1LxyzTUfgW+HtUgzDyKXG/JkJtVFlW2lXS/AI4g=
X-Received: by 2002:a05:6000:2483:b0:439:5bfe:18ce with SMTP id ffacd0b85a97d-4399dde22d3mr8576771f8f.8.1772234206354;
        Fri, 27 Feb 2026 15:16:46 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 05/14] x86/traps: Move traps_init() earlier on boot
Date: Fri, 27 Feb 2026 23:16:27 +0000
Message-Id: <20260227231636.3955109-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6E3DF1BEEF1
X-Rspamd-Action: no action

We wish to make use of opt_fred earlier on boot, which involves moving
traps_init() earlier, but this comes with several ordering complications.

The feature word containing FRED needs collecting in early_cpu_init(), and
legacy_syscall_init() cannot be called that early because it relies on the
stubs being allocated, yet must be called ahead of cpu_init() so the SYSCALL
linkage MSRs are set up before being cached.

Delaying legacy_syscall_init() is easy enough based on a system_state check.
Reuse bsp_traps_reinit() to cause a call to legacy_syscall_init() to occur at
the same point as previously.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v4:
 * New

I don't particualrly like this solution, but the layout of these functions
change for FRED.  Any adjustments need to consider the logic at the end of the
series, not at this point.
---
 xen/arch/x86/cpu/common.c  |  4 +++-
 xen/arch/x86/setup.c       |  4 +++-
 xen/arch/x86/traps-setup.c | 12 +++++++++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index bfa63fcfb721..5d0523a78b52 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -407,7 +407,9 @@ void __init early_cpu_init(bool verbose)
 		}
 
 		if (max_subleaf >= 1)
-			cpuid_count(7, 1, &eax, &ebx, &ecx,
+			cpuid_count(7, 1,
+                                    &c->x86_capability[FEATURESET_7a1],
+                                    &ebx, &ecx,
 				    &c->x86_capability[FEATURESET_7d1]);
 	}
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 675de3a649ea..0816a713e1c8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1386,6 +1386,8 @@ void asmlinkage __init noreturn __start_xen(void)
     else
         panic("Bootloader provided no memory information\n");
 
+    traps_init();
+
     /* Choose shadow stack early, to set infrastructure up appropriately. */
     if ( !boot_cpu_has(X86_FEATURE_CET_SS) )
         opt_xen_shstk = 0;
@@ -2078,7 +2080,7 @@ void asmlinkage __init noreturn __start_xen(void)
                                            &this_cpu(stubs).mfn);
     BUG_ON(!this_cpu(stubs.addr));
 
-    traps_init(); /* Needs stubs allocated, must be before presmp_initcalls. */
+    bsp_traps_reinit(); /* Needs stubs allocated, must be before presmp_initcalls. */
 
     cpu_init();
 
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index c5fc71c75bca..b2c161943d1e 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -346,6 +346,10 @@ void __init traps_init(void)
 
 /*
  * Re-initialise all state referencing the early-boot stack.
+ *
+ * This is called twice during boot, first to ensure legacy_syscall_init() has
+ * run (deferred from earlier), and second when the virtual address of the BSP
+ * stack changes.
  */
 void __init bsp_traps_reinit(void)
 {
@@ -359,7 +363,13 @@ void __init bsp_traps_reinit(void)
  */
 void percpu_traps_init(void)
 {
-    legacy_syscall_init();
+    /*
+     * Skip legacy_syscall_init() at early boot.  It requires the stubs being
+     * allocated, limiting the placement of the traps_init() call, and gets
+     * re-done anyway by bsp_traps_reinit().
+     */
+    if ( system_state > SYS_STATE_early_boot )
+        legacy_syscall_init();
 
     if ( cpu_has_xen_lbr )
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
-- 
2.39.5


