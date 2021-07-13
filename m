Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6C3C6857
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 04:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154942.286198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37jP-0002f4-3e; Tue, 13 Jul 2021 02:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154942.286198; Tue, 13 Jul 2021 02:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37jO-0002dD-Uj; Tue, 13 Jul 2021 02:01:06 +0000
Received: by outflank-mailman (input) for mailman id 154942;
 Tue, 13 Jul 2021 02:01:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAHm=MF=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1m37jN-000176-32
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 02:01:05 +0000
Received: from mail-pg1-x52b.google.com (unknown [2607:f8b0:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c179980e-02e2-42b5-998e-9a3efa51a5c9;
 Tue, 13 Jul 2021 02:00:48 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 62so20246129pgf.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jul 2021 19:00:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id o20sm19285728pgv.80.2021.07.12.19.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 19:00:47 -0700 (PDT)
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
X-Inumbo-ID: c179980e-02e2-42b5-998e-9a3efa51a5c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FV7wVbCGMMxrIWv0cXlRnxEDbi/EU7T33uAI58BfHiU=;
        b=I9wBSC0qbzn6iH0pzFRVbANuqOnUAbwdZdEpNoqu2Ru2wnHJx6OugnlgLE0T5b7/Xs
         1SyUMIPOcav02xFdHshZhfNU72HWkLv7qGndAEdJ5r50Jm47w3/XkCS+FKHZWmZC8osu
         iZJyM2T0+SP/jcQlt+S/lh6nLmqQb2X2LM2lK0eL92ynU88rQTynFVAOCH8ozHAw1ubZ
         FCHjxt0Bzu7mXo6CFkXzx9lhd5uxJUMgixaxl/ZY/5eyN5y92idbS4UInL5QM1qYWQsz
         OGvLmyj8OtLApFR1T0ays+itej2MGpFQFYoRHHpj0exWiHXlDnZJpSlR8YHCHHUcPAe1
         CMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=FV7wVbCGMMxrIWv0cXlRnxEDbi/EU7T33uAI58BfHiU=;
        b=jT5XPPjFd2mhzskH71fs7DGtUClEVe3e1RVQaag8MHWO9zEDgxPVRTPf4EhVSROChM
         QMb/tD2jsDoC13L+iSkAlzN4KRkA45edpfdHBFpwkL+4/L9+Yte2R+UlTXWVH03lx4uO
         g2LP2W1LAVlqSNHg5a4rLv/RkjvXdd+I8VSFMawpEvTv483WpTKIs5YUMlh/ZbMFLpFq
         7q0jR4f/hjJNJ3VMnwFI/unQJvq0mGy/ysJXqKO0AzzIXyMKpUMihETWLbh69+jroOi+
         EnE6Oya55uy3xaRAPwUho51w/w0sHfRdG3GxYeujNgFk/Ht3wr+Cx/aBSYx4I601Obyt
         vBRQ==
X-Gm-Message-State: AOAM531o9N1cJrf7prmHHip6C5jVZ4A+lq4jiL1Y0mYQA8FvP69pdfT/
	CajHjPXTya1IP+Ypb4w0GEMqjIQkPst4dZxz
X-Google-Smtp-Source: ABdhPJw4iTdhZagH3LsD7nmLQqLY0SxxEikJty4X7J2WQ12xQxcsdLG98MQ0afVc6GOX7DZiKeqmrQ==
X-Received: by 2002:a63:5f93:: with SMTP id t141mr2033622pgb.236.1626141647878;
        Mon, 12 Jul 2021 19:00:47 -0700 (PDT)
Sender: Bobby Eshleman <bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 4/4] x86/debug: move domain_pause_for_debugger to debugger.c
Date: Mon, 12 Jul 2021 18:59:56 -0700
Message-Id: <b7b3169d191c3ec86a9cf5267e661aac9c17559b.1626136452.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1626136452.git.bobby.eshleman@gmail.com>
References: <cover.1626136452.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function domain_pause_for_debugger() is conditionally compiled if
CONFIG_CRASH_DEBUG=y.  Instead of placing an extra #ifdef inside
domain.c, this commit moves domain_pause_for_debugger() into
x86/debugger.c which is only built by Kbuild given CONFIG_CRASH_DEBUG=y.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
 xen/arch/x86/debugger.c | 12 ++++++++++++
 xen/arch/x86/domain.c   | 14 --------------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/debugger.c b/xen/arch/x86/debugger.c
index 6f33f509ff..4f7c44600f 100644
--- a/xen/arch/x86/debugger.c
+++ b/xen/arch/x86/debugger.c
@@ -15,6 +15,18 @@
 #include <xen/event.h>
 #include <xen/sched.h>
 
+void domain_pause_for_debugger(void)
+{
+    struct vcpu *curr = current;
+    struct domain *d = curr->domain;
+
+    domain_pause_by_systemcontroller_nosync(d);
+
+    /* if gdbsx active, we just need to pause the domain */
+    if ( curr->arch.gdbsx_vcpu_event == 0 )
+        send_global_virq(VIRQ_DEBUGGER);
+}
+
 bool debugger_trap_entry(
     unsigned int vector, struct cpu_user_regs *regs)
 {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 47448f2f8c..545da32c3b 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2540,20 +2540,6 @@ static int __init init_vcpu_kick_softirq(void)
 }
 __initcall(init_vcpu_kick_softirq);
 
-#ifdef CONFIG_CRASH_DEBUG
-void domain_pause_for_debugger(void)
-{
-    struct vcpu *curr = current;
-    struct domain *d = curr->domain;
-
-    domain_pause_by_systemcontroller_nosync(d);
-
-    /* if gdbsx active, we just need to pause the domain */
-    if ( curr->arch.gdbsx_vcpu_event == 0 )
-        send_global_virq(VIRQ_DEBUGGER);
-}
-#endif
-
 /*
  * Local variables:
  * mode: C
-- 
2.30.0


