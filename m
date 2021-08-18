Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEDC3F0CC7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 22:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168321.307375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCc-0001GF-BS; Wed, 18 Aug 2021 20:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168321.307375; Wed, 18 Aug 2021 20:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCc-0001Bf-6a; Wed, 18 Aug 2021 20:30:22 +0000
Received: by outflank-mailman (input) for mailman id 168321;
 Wed, 18 Aug 2021 20:30:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydNC=NJ=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mGSCZ-000714-Nh
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 20:30:19 +0000
Received: from mail-pj1-x102d.google.com (unknown [2607:f8b0:4864:20::102d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b4ced5a-6ba6-4eb0-9b8c-d2c76a4780f5;
 Wed, 18 Aug 2021 20:29:53 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so9696745pjn.4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Aug 2021 13:29:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id h25sm663775pfo.68.2021.08.18.13.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:29:52 -0700 (PDT)
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
X-Inumbo-ID: 4b4ced5a-6ba6-4eb0-9b8c-d2c76a4780f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z/GxiSbRFRsqjM1uw03mp0aByMGfgJWL6sCEVLvY9yo=;
        b=bNEzNoBCcyoAK1vJiNoO6HYZYgkeQut06KAvfvniipuPqmYAuSX3Cd6uywd43bzgW1
         uxyUVgpQ9iRUvGqM1Njd3e3imSRX8UQGMv8dj0xa7LqAb5Dv+tu/GJlTQFZTgAfjbBVK
         W9OGFmaBcGHaoaI3vfUxLASnezZUoizdlL8gbazgu6Pvj/yMMCwytSGemwO7q76XbF0e
         RPtcRGlQXfBLkN1jJgNiTMoRv6SUYSBH1B4YvQVtCV2joSU6yQ+FJYn8BDqSYjO8SbaJ
         +08okqvWmh1uGCMfpS9cYQ3fPyrBkLwPXDcE00F0v9uOQQ645j9j+sD0NnxTb4u1PuY3
         rFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=z/GxiSbRFRsqjM1uw03mp0aByMGfgJWL6sCEVLvY9yo=;
        b=ZKKg+Y92kDslhwMeCJr3zEhHWV01SQfBb52LZRPw9yZaGKO1jUYJAprwkhdiYwGGiU
         PCsYDIOw/l/2JAtn4Hs/yHYjJfjd4cPCfXl1n3UbE6EsbRN2ggGkWFbFUJhh9tSNZYa+
         hF9CeWdJNcwnAZb0cLAIv+gS1y1IjaDFX5rYNe/wu1qIZ6DtKw3CwUo5ZoYcE/cfH+T0
         6ER8j4AzDhFOLS+jLmI/ZWriOUgBZL4eJL0SGNtg0dZ8Iaexx3vHtTQpSuQg/0qDHBAE
         zsLM2vsdMJ+hGIf5NElOwvECS8JeBW86N53FrwYvSP0NS3o0NkCh5l7Cwqx2AOE6SnEU
         XXGQ==
X-Gm-Message-State: AOAM530+TBsDwY3sBqf5ZiVURU/vcsQXiaVQwxtjyIW0AVAIBSlWe0eb
	LSkRNzoCBiJ8HdBSX0F7cFJu+w3NT/Dqlixz
X-Google-Smtp-Source: ABdhPJyh8DtEMy3Xiuo3daM/gznTddwqFpWtrZ++XTnWJWygJ9AvtiEbJaNHC8p/5fDfXZ//jrPBKA==
X-Received: by 2002:a17:902:c406:b0:12d:d0ff:4a9 with SMTP id k6-20020a170902c40600b0012dd0ff04a9mr8611113plk.65.1629318592746;
        Wed, 18 Aug 2021 13:29:52 -0700 (PDT)
Sender: Bobby Eshleman <bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v3 5/6] arch/x86: move domain_pause_for_debugger() to domain.h
Date: Wed, 18 Aug 2021 13:29:06 -0700
Message-Id: <e185531b79b73fd353b4cfbe2cb7625498e9c9b1.1629315874.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629315873.git.bobby.eshleman@gmail.com>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

domain_pause_for_debugger() was previously in debugger.h.  This commit
moves it to domain.h because its implementation is in domain.c.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
Changes in v3:
- domain_pause_for_debugger() is now moved into debugger.h, not a new
  file debugger.c

 xen/arch/x86/hvm/svm/svm.c      | 2 +-
 xen/arch/x86/hvm/vmx/realmode.c | 2 +-
 xen/arch/x86/hvm/vmx/vmx.c      | 2 +-
 xen/arch/x86/nmi.c              | 1 -
 xen/arch/x86/traps.c            | 1 +
 xen/include/asm-x86/debugger.h  | 2 --
 xen/include/asm-x86/domain.h    | 2 ++
 7 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 642a64b747..84448e496f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -36,6 +36,7 @@
 #include <asm/processor.h>
 #include <asm/amd.h>
 #include <asm/debugreg.h>
+#include <asm/domain.h>
 #include <asm/msr.h>
 #include <asm/i387.h>
 #include <asm/iocap.h>
@@ -58,7 +59,6 @@
 #include <asm/hvm/trace.h>
 #include <asm/hap.h>
 #include <asm/apic.h>
-#include <asm/debugger.h>
 #include <asm/hvm/monitor.h>
 #include <asm/monitor.h>
 #include <asm/xstate.h>
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index cc23afa788..5c4b1910a9 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -14,7 +14,7 @@
 #include <xen/sched.h>
 #include <xen/paging.h>
 #include <xen/softirq.h>
-#include <asm/debugger.h>
+#include <asm/domain.h>
 #include <asm/event.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e09b7e3af9..6fd59865c7 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -27,6 +27,7 @@
 #include <xen/hypercall.h>
 #include <xen/perfc.h>
 #include <asm/current.h>
+#include <asm/domain.h>
 #include <asm/io.h>
 #include <asm/iocap.h>
 #include <asm/regs.h>
@@ -51,7 +52,6 @@
 #include <asm/hvm/trace.h>
 #include <asm/hvm/monitor.h>
 #include <asm/xenoprof.h>
-#include <asm/debugger.h>
 #include <asm/apic.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/altp2m.h>
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index ab94a96c4d..11d5f5a917 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -30,7 +30,6 @@
 #include <asm/msr.h>
 #include <asm/mpspec.h>
 #include <asm/nmi.h>
-#include <asm/debugger.h>
 #include <asm/div64.h>
 #include <asm/apic.h>
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index d0a4c0ea74..5947ed25d6 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -63,6 +63,7 @@
 #include <asm/i387.h>
 #include <asm/xstate.h>
 #include <asm/debugger.h>
+#include <asm/domain.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
 #include <asm/xenoprof.h>
diff --git a/xen/include/asm-x86/debugger.h b/xen/include/asm-x86/debugger.h
index ed4d5c829b..8f6222956e 100644
--- a/xen/include/asm-x86/debugger.h
+++ b/xen/include/asm-x86/debugger.h
@@ -26,8 +26,6 @@
 #include <asm/regs.h>
 #include <asm/processor.h>
 
-void domain_pause_for_debugger(void);
-
 #ifdef CONFIG_CRASH_DEBUG
 
 #include <xen/gdbstub.h>
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 92d54de0b9..de854b5bfa 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -672,6 +672,8 @@ void update_guest_memory_policy(struct vcpu *v,
 
 void domain_cpu_policy_changed(struct domain *d);
 
+void domain_pause_for_debugger(void);
+
 bool update_runstate_area(struct vcpu *);
 bool update_secondary_system_time(struct vcpu *,
                                   struct vcpu_time_info *);
-- 
2.32.0


