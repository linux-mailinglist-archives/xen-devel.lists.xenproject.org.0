Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB2B9D2648
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 14:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840050.1255836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDNp3-0007i8-Qw; Tue, 19 Nov 2024 12:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840050.1255836; Tue, 19 Nov 2024 12:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDNp3-0007f0-Na; Tue, 19 Nov 2024 12:59:13 +0000
Received: by outflank-mailman (input) for mailman id 840050;
 Tue, 19 Nov 2024 12:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydLn=SO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tDNp2-0007eu-Oi
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 12:59:12 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 100ef3a0-a676-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 13:59:07 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cef772621eso6989840a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 04:59:07 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cfeada3353sm75194a12.78.2024.11.19.04.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 04:59:06 -0800 (PST)
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
X-Inumbo-ID: 100ef3a0-a676-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjEwMGVmM2EwLWE2NzYtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDIxMTQ3Ljk3MzIyLCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732021147; x=1732625947; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxQenpaGaMzjrQymcJZ0umdG0FyNusdLvNQQSxeygiw=;
        b=lyUz5uUWdTkw4m2jQyAtFlVQM4yACuiZbTl5ZEcfi+VgzfzX3GUQA2SqulRGK4JHQT
         tDdy8ZnbRY3IkjHTuM8IZ5FI7UJePue4lo4LzViTuqoyH7+lTDaplBSK96z/N9DadKnt
         IdPNqfC4nl5s8QljF4P0hIsesqR2A9rQF4VZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732021147; x=1732625947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxQenpaGaMzjrQymcJZ0umdG0FyNusdLvNQQSxeygiw=;
        b=ZwPRt7Py2QaGPA3teZgc6GnsfpPk+a9Kqm1YDA56NALZKbdrydfclW8etDKOaCKxlN
         P/+Lca/C/f0qk5mP/5v75zcKd6J/5X3DR1U7CdyGGKxQth1W0/L5j/nA+1nUWo5Uk+wn
         rZRO70qpd1Yuw9ItPpZ28yykZKWhGiiLmwjKG9dud9TQB8K4AjoIAOAtBCpihtBdaMK9
         TuQUlIXFzde1izIdzRkbPMU2+afveWP/xgRNyqbh7S+HB36EFbZRftj5zJi+UDbefHQ0
         g+qZNvAJboL2WlMnAPlOfbNCqrsIxmY51H46GMg5tfaEaz2+l1lms6oswGN/rfzc8Xwn
         dZVg==
X-Gm-Message-State: AOJu0YxVGRNfhzyozjq9livV0N7Iwc1JGEVN85l3aO66/kX7nnNm8iQy
	Hj7LjGrWd7wWpUnbC0Z99YsX8/6LKDVUjhE23DxF7pp4LijXpDG8O3YFau3gVVPxqoTYjmcKN5C
	G
X-Google-Smtp-Source: AGHT+IHV4dsppsIcjpFTHAMZ1qHqMhEcLzq0BcxZ0lzSwUGlsJk4kaAb1f+38ufL8k6/6pqJ0e8law==
X-Received: by 2002:a05:6402:234d:b0:5cf:ac34:380a with SMTP id 4fb4d7f45d1cf-5cfac34390amr6856047a12.29.1732021146955;
        Tue, 19 Nov 2024 04:59:06 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] x86/mce: Compile do_mca() for CONFIG_PV only
Date: Tue, 19 Nov 2024 12:59:04 +0000
Message-Id: <20241119125904.2681402-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Eclair reports a Misra Rule 8.4 violation; that do_mca() can't see it's
declaration.  It turns out that this is a consequence of do_mca() being
PV-only, and the declaration being compiled out in !PV builds.

Therefore, arrange for do_mca() to be compiled out in !PV builds.  This in
turn requires a number of static functions to become static inline.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>

Bloat-o-meter on a !PV build reports:

  add/remove: 0/6 grow/shrink: 0/0 up/down: 0/-3717 (-3717)
  Function                                     old     new   delta
  x86_mc_mceinject                              31       -     -31
  do_mca.cold                                  117       -    -117
  x86_mc_msrinject                             147       -    -147
  x86_mc_msrinject.cold                        230       -    -230
  do_mc_get_cpu_info                           500       -    -500
  do_mca                                      2692       -   -2692
---
 xen/arch/x86/cpu/mcheck/mce.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 32c1b2756b90..2a88590525f0 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -932,7 +932,7 @@ void x86_mcinfo_dump(struct mc_info *mi)
     } while ( 1 );
 }
 
-static void cf_check do_mc_get_cpu_info(void *v)
+static inline void cf_check do_mc_get_cpu_info(void *v)
 {
     int cpu = smp_processor_id();
     int cindex, cpn;
@@ -1114,7 +1114,7 @@ bool intpose_inval(unsigned int cpu_nr, uint64_t msr)
      (r) <= MSR_IA32_MCx_MISC(per_cpu(nr_mce_banks, cpu) - 1) && \
      ((r) - MSR_IA32_MC0_CTL) % 4) /* excludes MCi_CTL */
 
-static bool x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
+static inline bool x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
 {
     const struct cpuinfo_x86 *c = &cpu_data[mci->mcinj_cpunr];
     int i, errs = 0;
@@ -1192,7 +1192,7 @@ static bool x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
     return !errs;
 }
 
-static uint64_t x86_mc_hwcr_wren(void)
+static inline uint64_t x86_mc_hwcr_wren(void)
 {
     uint64_t old;
 
@@ -1207,13 +1207,13 @@ static uint64_t x86_mc_hwcr_wren(void)
     return old;
 }
 
-static void x86_mc_hwcr_wren_restore(uint64_t hwcr)
+static inline void x86_mc_hwcr_wren_restore(uint64_t hwcr)
 {
     if ( !(hwcr & K8_HWCR_MCi_STATUS_WREN) )
         wrmsrl(MSR_K8_HWCR, hwcr);
 }
 
-static void cf_check x86_mc_msrinject(void *data)
+static inline void cf_check x86_mc_msrinject(void *data)
 {
     struct xen_mc_msrinject *mci = data;
     struct mcinfo_msr *msr;
@@ -1244,13 +1244,14 @@ static void cf_check x86_mc_msrinject(void *data)
         x86_mc_hwcr_wren_restore(hwcr);
 }
 
-/*ARGSUSED*/
-static void cf_check x86_mc_mceinject(void *data)
+static inline void cf_check x86_mc_mceinject(void *data)
 {
     printk("Simulating #MC on cpu %d\n", smp_processor_id());
     __asm__ __volatile__("int $0x12");
 }
 
+#ifdef CONFIG_PV /* do_mca() hypercall is PV-only */
+
 #if BITS_PER_LONG == 64
 
 #define ID2COOKIE(id) ((mctelem_cookie_t)(id))
@@ -1654,6 +1655,8 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
     return ret;
 }
 
+#endif /* CONFIG_PV */
+
 static int mcinfo_dumped;
 
 static int cf_check x86_mcinfo_dump_panic(mctelem_cookie_t mctc)

base-commit: 3128d7248f2ad389b8e9a3e252958cbfbd1898ee
prerequisite-patch-id: 46b8fc2e9df2fd6be1bbbd6b50463e0e15a8f94d
prerequisite-patch-id: c122b170f57ab96fe52c37aebf1f4bb366194637
prerequisite-patch-id: 1c2d96bf17c5da0981b6c62939d3b7cc1e05933e
prerequisite-patch-id: b3e43902729416e18b4fada7f529b4cb02b1815e
prerequisite-patch-id: a06452180f71021893259bb3b883185f57742a31
-- 
2.39.5


