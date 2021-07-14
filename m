Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BC73C9242
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 22:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156216.288294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3leJ-0001Rj-UD; Wed, 14 Jul 2021 20:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156216.288294; Wed, 14 Jul 2021 20:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3leJ-0001Ot-PJ; Wed, 14 Jul 2021 20:38:31 +0000
Received: by outflank-mailman (input) for mailman id 156216;
 Wed, 14 Jul 2021 20:38:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxbS=MG=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1m3leH-0000KG-P6
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 20:38:29 +0000
Received: from mail-pj1-x102e.google.com (unknown [2607:f8b0:4864:20::102e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0fc6f99-c991-48af-81dc-bde2f387e0f9;
 Wed, 14 Jul 2021 20:38:23 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so4648017pjb.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jul 2021 13:38:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id b17sm1785084pfm.54.2021.07.14.13.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:38:22 -0700 (PDT)
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
X-Inumbo-ID: b0fc6f99-c991-48af-81dc-bde2f387e0f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yWceiZFDgebIWTda4wCRP6HVoSGyuXNhbWaAMklJuU4=;
        b=hfEkg6QA9LY0LfkLt5VFa/JybLvpNyp0rnCm5h88rFmYdt+6X+5BP1z76USxtHzlm7
         iF3mACEVxenNV58/ihKM+C47W5M9ENeZQMvx+bGS2W1ZsYeUc754e3FCBR6PB1IIYL4M
         GHHkFw0cWN6rjQsgqzZEJ2N1Ix5qBoRatpjkztMzdNH+v8zycQw2koCriewHEL+GPgzx
         4APKd0Y2KBVJWiyjUcyrhWuOGCpbaThY+kyiWFMgny7PMEaU8BzZ+G6RV0dRkOI7Q5eO
         sXxq69m9/nLzj8yn2PTFv9Xz3eTTaeAZvf9GgefwM74cHsYuMRWwU7XkdYx3z0R6Sx92
         4WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=yWceiZFDgebIWTda4wCRP6HVoSGyuXNhbWaAMklJuU4=;
        b=AzhjlTHW5/txQUQQsPbN14zK7lZjbWVGiuoTsKqthu4849ivcSGYT5sKfzlLtbwXOi
         qfrmZYFmZXMBZYzEhIZIAe4KzVtBmILeLYlO5BFuR8vwwMDUMkqwa6ERa9pqzPRUoXCk
         3p3gl/gh/kGcxQ8rZYcqd0XjhXnOuwNg2tvDIsvdsO+J5CjTSJg441i0As+6D7xmIleM
         9mZye4UjTzaCHJd+MNMBB0+SorgSgZAJ2LE0zPPPHhjie2VVpgmSsfCq/qmH8syUQ/PS
         6uoumg3vSIMdghs9a0fWVpO560QpRXvW6MfrRGmxrjRbAwet2iPohirTXQi8vFc9rROB
         sVrA==
X-Gm-Message-State: AOAM533Gqrw4J5/DsF9LSJl9MdOyM4YKDFM+X/mmDUKMVs+YP3w0pYMF
	JQ+zxAsemk+ZBncHTi4AduvUzY3/Hqrty/BJ
X-Google-Smtp-Source: ABdhPJxcv28P9SX6dmui/eaRLIuu9pZdMquhwOF+f/Jq46jqsVCHyEjAilVQ4c2cIAyfR5EdnTGWNA==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id h1mr5693893pjs.4.1626295102934;
        Wed, 14 Jul 2021 13:38:22 -0700 (PDT)
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
Subject: [PATCH v2 4/4] x86/debug: move domain_pause_for_debugger to debugger.c
Date: Wed, 14 Jul 2021 13:37:47 -0700
Message-Id: <d3e88e2cb3c850085e7d1061d6b20f7e0acf3887.1626286772.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1626286772.git.bobby.eshleman@gmail.com>
References: <cover.1626286772.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function domain_pause_for_debugger() is conditionally compiled if
CONFIG_CRASH_DEBUG=y.  Instead of placing an extra #ifdef inside
domain.c, this commit moves domain_pause_for_debugger() into
x86/debugger.c which is only built by Kbuild given CONFIG_CRASH_DEBUG=y.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---

Changes in v2:
- constify struct vcpu *curr

 xen/arch/x86/debugger.c | 12 ++++++++++++
 xen/arch/x86/domain.c   | 14 --------------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/debugger.c b/xen/arch/x86/debugger.c
index 985c1275b4..54e81b99f4 100644
--- a/xen/arch/x86/debugger.c
+++ b/xen/arch/x86/debugger.c
@@ -15,6 +15,18 @@
 #include <xen/event.h>
 #include <xen/sched.h>
 
+void domain_pause_for_debugger(void)
+{
+    const struct vcpu *curr = current;
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
     unsigned int vector, const struct cpu_user_regs *regs)
 {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 5b948ff270..450b2ca831 100644
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


