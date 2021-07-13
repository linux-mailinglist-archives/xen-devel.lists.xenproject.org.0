Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5E53C6853
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 04:01:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154939.286177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37jF-0001nE-CZ; Tue, 13 Jul 2021 02:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154939.286177; Tue, 13 Jul 2021 02:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37jF-0001jp-7z; Tue, 13 Jul 2021 02:00:57 +0000
Received: by outflank-mailman (input) for mailman id 154939;
 Tue, 13 Jul 2021 02:00:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAHm=MF=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1m37jD-000176-2m
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 02:00:55 +0000
Received: from mail-pl1-x62d.google.com (unknown [2607:f8b0:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ff32f20-1db9-4b45-af84-32f0c6ae204e;
 Tue, 13 Jul 2021 02:00:46 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id v14so3328772plg.9
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jul 2021 19:00:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id o20sm19285728pgv.80.2021.07.12.19.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 19:00:45 -0700 (PDT)
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
X-Inumbo-ID: 3ff32f20-1db9-4b45-af84-32f0c6ae204e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ETCvvoLrlGjCQWP7sohk1l4ug8oahZVh7nYA0Gt5aRs=;
        b=PN7qycbKZ9dR/LzS0glr8GMR+f2ztvIFGFwGqy786AT1CPnQZ5d/ZqRmShlGwfnlZb
         WPUbUl5kQJwWG4wMSfveXdJsGhwCrUYmAEeqtxnvju/vIQgTJpooLb72Hp2E6RGpJ3IU
         6J+aHO7SQVmolBLsGEsq2SsaoMD1Bj6fNqOSKBoDNAAGz12g9wFoxg1bw7B7CGx78S5M
         f6iQw+XUD3BjExwNCBINCYhRO5XLVnX8JJZW2o9xzXAqnrVNTTixEKAIh06TLZhSHDRs
         7YYdzHsdSs5nuA8CNviSy3BDOAPBv6KHuBHBizkgGxGywLOPu5wuFubdEw4oCizz3JBP
         ejfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ETCvvoLrlGjCQWP7sohk1l4ug8oahZVh7nYA0Gt5aRs=;
        b=QbFjMrssXo95fjtwnqlBGeBVKjBy75PNQrAPeLnCIgJZ9Rxh4UWnz6MnfwE10/IjJD
         8OgpKt7pmql9duH2ImhGrHxgkNjH9HdTQ/xYJW6WrtzZyK1QuDjSQcwB/K91RSPHQ7fZ
         chsHq/okCE0tt8nWU9Kp0/+HfCjVH9gTZ/q6MffzSel7bvi8w/I8WkZl2Jp2WW6msTyq
         qY/oFBVrZluLh+FZiGFjwtjSRTE79V+XTn47+00yCX3lj8pKjmj6h7kq+xw+/uJEvjPt
         Ug3LafP7FwX0qf4zTmBAVd4VaM4V0kGuKlZf5ijtkOGdmDrNyNTgDvRwRBZ9IPyNLpFP
         oDZw==
X-Gm-Message-State: AOAM531uUoYWQ6OeG2IBOAQb1YJs8kNDFFvuPfItdGrlO0d382FIEWeC
	veJb+nklTF1HKH5tFTOr5QKFxO8BkfqqpyZX
X-Google-Smtp-Source: ABdhPJwtUvTf3MaX/Rj6pTO/MUDcJS9nQZwGhCK26AXxHrpEWNHwyBb/iqgG8KwGtRzIwudERf6BQw==
X-Received: by 2002:a17:902:6b47:b029:129:ab4e:6407 with SMTP id g7-20020a1709026b47b0290129ab4e6407mr1570395plt.20.1626141645515;
        Mon, 12 Jul 2021 19:00:45 -0700 (PDT)
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
Subject: [PATCH 2/4] arm/traps: remove debugger_trap_fatal() calls
Date: Mon, 12 Jul 2021 18:59:54 -0700
Message-Id: <53d50b747796d3ece965f872426dc311073775ab.1626136452.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1626136452.git.bobby.eshleman@gmail.com>
References: <cover.1626136452.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM doesn't actually use debugger_trap_* anything, and is stubbed out.

Simply remove the calls. This also renders TRAP_invalid_op unused in
any common code, so remove that definition too.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
 xen/arch/arm/traps.c       | 6 ------
 xen/include/xen/debugger.h | 5 -----
 2 files changed, 11 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 5a0a5eff1d..0310bc91a0 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1266,10 +1266,6 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
 
     case BUGFRAME_bug:
         printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-
-        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
-            return 0;
-
         show_execution_state(regs);
         panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
 
@@ -1281,8 +1277,6 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
 
         printk("Assertion '%s' failed at %s%s:%d\n",
                predicate, prefix, filename, lineno);
-        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
-            return 0;
         show_execution_state(regs);
         panic("Assertion '%s' failed at %s%s:%d\n",
               predicate, prefix, filename, lineno);
diff --git a/xen/include/xen/debugger.h b/xen/include/xen/debugger.h
index d6d820f4e5..8297e582e4 100644
--- a/xen/include/xen/debugger.h
+++ b/xen/include/xen/debugger.h
@@ -36,11 +36,6 @@
 #ifndef __XEN_DEBUGGER_H__
 #define __XEN_DEBUGGER_H__
 
-/* Dummy value used by ARM stubs. */
-#ifndef TRAP_invalid_op
-# define TRAP_invalid_op 6
-#endif
-
 #ifdef CONFIG_CRASH_DEBUG
 
 #include <asm/debugger.h>
-- 
2.30.0


