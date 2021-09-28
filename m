Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A45941B859
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 22:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198420.351946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJky-0006JX-AQ; Tue, 28 Sep 2021 20:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198420.351946; Tue, 28 Sep 2021 20:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJky-0006Gl-4d; Tue, 28 Sep 2021 20:31:16 +0000
Received: by outflank-mailman (input) for mailman id 198420;
 Tue, 28 Sep 2021 20:31:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sVw8=OS=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mVJkx-0004O5-9D
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 20:31:15 +0000
Received: from mail-pj1-x102b.google.com (unknown [2607:f8b0:4864:20::102b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3abad95c-4747-4e64-8b3d-839af013ab0a;
 Tue, 28 Sep 2021 20:30:55 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 on12-20020a17090b1d0c00b001997c60aa29so2589570pjb.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 13:30:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::5])
 by smtp.gmail.com with ESMTPSA id p15sm44201pfn.31.2021.09.28.13.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 13:30:54 -0700 (PDT)
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
X-Inumbo-ID: 3abad95c-4747-4e64-8b3d-839af013ab0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iOTjHkk69+BVgT4XjnVLkopnx7Nv/jMSlcVqlEzwOf4=;
        b=ixGQGSdM1o7e/kVIG+47VRcbnwP/vXS0o8jMQexxab0GzYf8PJNNWViiyQKF52ALca
         j4oGXHHOTtMJzG5g/hLNhLFXTERigp4f+CI2c3e2jHPdxPnjKffk5O+HONJ3NHExE1iT
         ASJZTXQnJ0KGEZoDGy+1nw1ikTkNyxO7RsXqbJrVygFa84P2DxMDgGV6IvyUOZIy2SxH
         8NqzI5MVwg8mOtj2ASKCAKWVxWdIg93BrmAPu828QfCrm7PF3et0N24cubRHJ+reX2wU
         sFmAcm0iJ1R5Rr7T2rgqIoOrfkm1tpl61hqGbGwH+0NrVbiKa4PcXY0WA2NI49/1R08M
         nTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=iOTjHkk69+BVgT4XjnVLkopnx7Nv/jMSlcVqlEzwOf4=;
        b=d6tCFfaHEhxiEM1XI7AKx3oNc/JTSXMwNnWzM1kIioWBe5gUzFb/QxTKDD8cjI51tR
         Gx54k1pUi2Uc6Q0PKxGWMwJmoz0ljFqeZMGZFKoJBzZnSb7vOtriWKKJEO6iwE48Fous
         Wju90TSo7gLR4UcseRocEc5tzp0mIb+sMn+cnjkDmWyyS9KQV+ZBihIiUTjpyQ1gP2J2
         KFP+iCZWJbaOMbIgZiOoe202BKZLilVlbVBnO9/HZadsBPFKi+S20wMDsxFZpst4dqXC
         EpXSdAOW53lXA4AGOJzu7BVDjRMQ7cxEZV4pZdCZsjxvE5lEUyVXzA+twPmR/Iu0/COR
         s10g==
X-Gm-Message-State: AOAM53305xQd0LINvXmensioMEeiAyZvUj88ecK14ykhww+N5Ryc1XbC
	Z6EiRKSzdOCy9kMG4IrHV4OBtpqqKHHN3C99
X-Google-Smtp-Source: ABdhPJymLtx9yWhdUPkYTejlM8Zfr8ITa+y4p33yqB84Ts+javy1zYt7RsZzAu8n9wjVBBspMqjfpg==
X-Received: by 2002:a17:902:bf8c:b0:13e:2b58:c2af with SMTP id v12-20020a170902bf8c00b0013e2b58c2afmr6916505pls.74.1632861054943;
        Tue, 28 Sep 2021 13:30:54 -0700 (PDT)
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
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v4 5/6] arch/x86: move domain_pause_for_debugger() to domain.h
Date: Tue, 28 Sep 2021 13:30:28 -0700
Message-Id: <5de82c39ffae1d65c8ab7142b05d304f9d4ddae9.1632860589.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1632860589.git.bobby.eshleman@gmail.com>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

domain_pause_for_debugger() was previously in debugger.h.  This commit
moves it to domain.h because its implementation is in domain.c.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
Changes in v3:
- domain_pause_for_debugger() is now moved into debugger.h, not a new
  file debugger.c

Changes in v4:
- Don't unnecessarily include <asm/domain.h>

 xen/arch/x86/nmi.c             | 1 -
 xen/arch/x86/traps.c           | 1 -
 xen/include/asm-x86/debugger.h | 2 --
 xen/include/asm-x86/domain.h   | 2 ++
 4 files changed, 2 insertions(+), 4 deletions(-)

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
index 772e2a5bfc..742fa9e2ca 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -62,7 +62,6 @@
 #include <asm/uaccess.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
-#include <asm/debugger.h>
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


