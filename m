Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C8F9E37C0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 11:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848480.1263357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tImpM-0000Ej-Fc; Wed, 04 Dec 2024 10:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848480.1263357; Wed, 04 Dec 2024 10:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tImpM-0000Cm-Cc; Wed, 04 Dec 2024 10:41:52 +0000
Received: by outflank-mailman (input) for mailman id 848480;
 Wed, 04 Dec 2024 10:37:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fRsp=S5=exostellar.io=maksym@srs-se1.protection.inumbo.net>)
 id 1tIml5-0006yL-4y
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 10:37:27 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfc33f8f-b22b-11ef-99a3-01e77a169b0f;
 Wed, 04 Dec 2024 11:37:24 +0100 (CET)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-7b65d1c707aso479571085a.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2024 02:37:24 -0800 (PST)
Received: from jupiter.home ([188.91.253.160])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997ffc1bsm714073566b.83.2024.12.04.02.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:37:22 -0800 (PST)
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
X-Inumbo-ID: bfc33f8f-b22b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exostellar.io; s=google; t=1733308644; x=1733913444; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UKZBElfC/runRO3THcVur0T/wfu1RwMrcL6FtcVDe5Y=;
        b=DFLv6mTzkrYmcRX8yAhKK8aSouQF+DnGdHTGLFq4ZzV6JZgJG03OLyVD+MO2+HrF1J
         O1NDKFkNiKbh+0Plr82iZsoWW3BS+8steS9t5iRdUdT21tKtwsIox42KiyJEaJdeirHO
         HbsyAapRn3RHu/1EgSUNmjMPTvifNszp4CB0zq6ooSiyYVj9C2htAxBT+mVaRmmaEP0R
         tJF/gzrjfVcARCfvMr0rUEhDti2HmlitObb9HwHqJ8rxs1D/JveMZYNGm1iyPugGtdn/
         o8DZREDmNmVjYYszquOfh9n8oG8t3jfcdDAUniLt1pqKkBl0JFFDOlaZB1Y4YRE9eUd8
         eX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733308644; x=1733913444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKZBElfC/runRO3THcVur0T/wfu1RwMrcL6FtcVDe5Y=;
        b=rVn5QPOL1CJMHvROleSHwGrFnlWBqoWj6oANnEnzkOYB1+WPDMHJo/t9YW+9SlXuWm
         1Bc30W+/xt4xye3ZaM0QWPpG6oUVLdsWfs1Bt6whuOrF4uJa8SjxyPVqzQgUmm65QEhI
         SoS+749/RG/a35V7rfbhtgBH/tnm33Ye3mEptLE4y0zApHHAzwskSQqOLdPlZBdaUJjh
         YDKJmxtG+eVO3w9a6s0NNUA3tQyurmhkx1BCljfoF/SGQ5uuNLXvQNMkIo+zEMe4z+K6
         nXbUBMVIBrVQ2xEnBJqOK7YDPahfrSlPH6OixnyhScwk9aPKsNWk2B14GBwp+T/tvxqz
         xNNA==
X-Forwarded-Encrypted: i=1; AJvYcCU9nmKNWIPvzPBqBadifENnBUFKPMN3DRL3JEyIvtzbTrEFQWvHwHJNdCZRTr8mUrrnUKGlEqSFcgs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzx0/P/2QE4D2DzuakWvNgfl1idk7BU8sYfjZPR2CSUbIkw3e2n
	5XlaHRHpyp5DC5DlIimazcrDQtRiokou94+YocfzGnmRCZ6OJqZU2jv/U4uHDKA=
X-Gm-Gg: ASbGnctHDL1EfhWV0TlB95G1S4dSPhhksZvKFF1zWZrp8u4ovlZZpYNAQEjZZHshA0F
	IvUGlzX0QiMP7vnn5mSDpPozL3kccn480pvooU5QsODJ7HxdXPFXeSWk6/MmJZtkErV+ZXhzkyF
	wbGvMKAfbhrff6L3yTWv9CvS5qZKa9cg3K73Hw6kTkzP9JAyRXS6dR0F2uSpQi/owcnlFLPUy26
	AntXvpHcG3anb9cir267ADq8LqM/eRArfDw4u7FhOUCNl7b6WNd
X-Google-Smtp-Source: AGHT+IFzj1Z+lwW7ef4Zyi/r9kehnRmxvWWd7pNR8/zIhzo8RWZkM08u76l5FSHquIrCZJ6GngUFjA==
X-Received: by 2002:a05:620a:1724:b0:7b1:522a:b07 with SMTP id af79cd13be357-7b6a61cc099mr1057430985a.61.1733308643628;
        Wed, 04 Dec 2024 02:37:23 -0800 (PST)
From: Maksym Planeta <maksym@exostellar.io>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Maksym Planeta <maksym@exostellar.io>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Grab mm lock before grabbing pt lock
Date: Wed,  4 Dec 2024 11:35:15 +0100
Message-ID: <20241204103516.3309112-1-maksym@exostellar.io>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function xen_pin_page calls xen_pte_lock, which in turn grab page
table lock (ptlock). When locking, xen_pte_lock expect mm->page_table_lock
to be held before grabbing ptlock, but this does not happen when pinning
is caused by xen_mm_pin_all.

This commit addresses lockdep warning below, which shows up when
suspending a Xen VM.

[ 3680.658422] Freezing user space processes
[ 3680.660156] Freezing user space processes completed (elapsed 0.001 seconds)
[ 3680.660182] OOM killer disabled.
[ 3680.660192] Freezing remaining freezable tasks
[ 3680.661485] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[ 3680.685254]
[ 3680.685265] ==================================
[ 3680.685269] WARNING: Nested lock was not taken
[ 3680.685274] 6.12.0+ #16 Tainted: G        W
[ 3680.685279] ----------------------------------
[ 3680.685283] migration/0/19 is trying to lock:
[ 3680.685288] ffff88800bac33c0 (ptlock_ptr(ptdesc)#2){+.+.}-{3:3}, at: xen_pin_page+0x175/0x1d0
[ 3680.685303]
[ 3680.685303] but this task is not holding:
[ 3680.685308] init_mm.page_table_lock
[ 3680.685311]
[ 3680.685311] stack backtrace:
[ 3680.685316] CPU: 0 UID: 0 PID: 19 Comm: migration/0 Tainted: G        W          6.12.0+ #16
[ 3680.685324] Tainted: [W]=WARN
[ 3680.685328] Stopper: multi_cpu_stop+0x0/0x120 <- __stop_cpus.constprop.0+0x8c/0xd0
[ 3680.685339] Call Trace:
[ 3680.685344]  <TASK>
[ 3680.685347]  dump_stack_lvl+0x77/0xb0
[ 3680.685356]  __lock_acquire+0x917/0x2310
[ 3680.685364]  lock_acquire+0xce/0x2c0
[ 3680.685369]  ? xen_pin_page+0x175/0x1d0
[ 3680.685373]  _raw_spin_lock_nest_lock+0x2f/0x70
[ 3680.685381]  ? xen_pin_page+0x175/0x1d0
[ 3680.685386]  xen_pin_page+0x175/0x1d0
[ 3680.685390]  ? __pfx_xen_pin_page+0x10/0x10
[ 3680.685394]  __xen_pgd_walk+0x233/0x2c0
[ 3680.685401]  ? stop_one_cpu+0x91/0x100
[ 3680.685405]  __xen_pgd_pin+0x5d/0x250
[ 3680.685410]  xen_mm_pin_all+0x70/0xa0
[ 3680.685415]  xen_pv_pre_suspend+0xf/0x280
[ 3680.685420]  xen_suspend+0x57/0x1a0
[ 3680.685428]  multi_cpu_stop+0x6b/0x120
[ 3680.685432]  ? update_cpumasks_hier+0x7c/0xa60
[ 3680.685439]  ? __pfx_multi_cpu_stop+0x10/0x10
[ 3680.685443]  cpu_stopper_thread+0x8c/0x140
[ 3680.685448]  ? smpboot_thread_fn+0x20/0x1f0
[ 3680.685454]  ? __pfx_smpboot_thread_fn+0x10/0x10
[ 3680.685458]  smpboot_thread_fn+0xed/0x1f0
[ 3680.685462]  kthread+0xde/0x110
[ 3680.685467]  ? __pfx_kthread+0x10/0x10
[ 3680.685471]  ret_from_fork+0x2f/0x50
[ 3680.685478]  ? __pfx_kthread+0x10/0x10
[ 3680.685482]  ret_from_fork_asm+0x1a/0x30
[ 3680.685489]  </TASK>
[ 3680.685491]
[ 3680.685491] other info that might help us debug this:
[ 3680.685497] 1 lock held by migration/0/19:
[ 3680.685500]  #0: ffffffff8284df38 (pgd_lock){+.+.}-{3:3}, at: xen_mm_pin_all+0x14/0xa0
[ 3680.685512]
[ 3680.685512] stack backtrace:
[ 3680.685518] CPU: 0 UID: 0 PID: 19 Comm: migration/0 Tainted: G        W          6.12.0+ #16
[ 3680.685528] Tainted: [W]=WARN
[ 3680.685531] Stopper: multi_cpu_stop+0x0/0x120 <- __stop_cpus.constprop.0+0x8c/0xd0
[ 3680.685538] Call Trace:
[ 3680.685541]  <TASK>
[ 3680.685544]  dump_stack_lvl+0x77/0xb0
[ 3680.685549]  __lock_acquire+0x93c/0x2310
[ 3680.685554]  lock_acquire+0xce/0x2c0
[ 3680.685558]  ? xen_pin_page+0x175/0x1d0
[ 3680.685562]  _raw_spin_lock_nest_lock+0x2f/0x70
[ 3680.685568]  ? xen_pin_page+0x175/0x1d0
[ 3680.685572]  xen_pin_page+0x175/0x1d0
[ 3680.685578]  ? __pfx_xen_pin_page+0x10/0x10
[ 3680.685582]  __xen_pgd_walk+0x233/0x2c0
[ 3680.685588]  ? stop_one_cpu+0x91/0x100
[ 3680.685592]  __xen_pgd_pin+0x5d/0x250
[ 3680.685596]  xen_mm_pin_all+0x70/0xa0
[ 3680.685600]  xen_pv_pre_suspend+0xf/0x280
[ 3680.685607]  xen_suspend+0x57/0x1a0
[ 3680.685611]  multi_cpu_stop+0x6b/0x120
[ 3680.685615]  ? update_cpumasks_hier+0x7c/0xa60
[ 3680.685620]  ? __pfx_multi_cpu_stop+0x10/0x10
[ 3680.685625]  cpu_stopper_thread+0x8c/0x140
[ 3680.685629]  ? smpboot_thread_fn+0x20/0x1f0
[ 3680.685634]  ? __pfx_smpboot_thread_fn+0x10/0x10
[ 3680.685638]  smpboot_thread_fn+0xed/0x1f0
[ 3680.685642]  kthread+0xde/0x110
[ 3680.685645]  ? __pfx_kthread+0x10/0x10
[ 3680.685649]  ret_from_fork+0x2f/0x50
[ 3680.685654]  ? __pfx_kthread+0x10/0x10
[ 3680.685657]  ret_from_fork_asm+0x1a/0x30
[ 3680.685662]  </TASK>
[ 3680.685267] xen:grant_table: Grant tables using version 1 layout
[ 3680.685921] OOM killer enabled.
[ 3680.685934] Restarting tasks ... done.

Signed-off-by: Maksym Planeta <maksym@exostellar.io>
---
 arch/x86/xen/mmu_pv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 55a4996d0c04..2c70cd35e72c 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -781,6 +781,7 @@ void xen_mm_pin_all(void)
 {
 	struct page *page;
 
+	spin_lock(&init_mm.page_table_lock);
 	spin_lock(&pgd_lock);
 
 	list_for_each_entry(page, &pgd_list, lru) {
@@ -791,6 +792,7 @@ void xen_mm_pin_all(void)
 	}
 
 	spin_unlock(&pgd_lock);
+	spin_unlock(&init_mm.page_table_lock);
 }
 
 static void __init xen_mark_pinned(struct mm_struct *mm, struct page *page,
@@ -887,6 +889,7 @@ void xen_mm_unpin_all(void)
 {
 	struct page *page;
 
+	spin_lock(&init_mm.page_table_lock);
 	spin_lock(&pgd_lock);
 
 	list_for_each_entry(page, &pgd_list, lru) {
@@ -898,6 +901,7 @@ void xen_mm_unpin_all(void)
 	}
 
 	spin_unlock(&pgd_lock);
+	spin_unlock(&init_mm.page_table_lock);
 }
 
 static void xen_enter_mmap(struct mm_struct *mm)
-- 
2.42.0


