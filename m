Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D60441B854
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 22:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198415.351902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJke-0004i5-Uy; Tue, 28 Sep 2021 20:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198415.351902; Tue, 28 Sep 2021 20:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJke-0004f6-QW; Tue, 28 Sep 2021 20:30:56 +0000
Received: by outflank-mailman (input) for mailman id 198415;
 Tue, 28 Sep 2021 20:30:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sVw8=OS=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mVJkd-0004O5-8X
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 20:30:55 +0000
Received: from mail-pl1-x629.google.com (unknown [2607:f8b0:4864:20::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c46b5e31-a2db-4dc4-8b19-4e4c8adf388f;
 Tue, 28 Sep 2021 20:30:50 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id l6so14980324plh.9
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 13:30:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::5])
 by smtp.gmail.com with ESMTPSA id p15sm44201pfn.31.2021.09.28.13.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 13:30:49 -0700 (PDT)
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
X-Inumbo-ID: c46b5e31-a2db-4dc4-8b19-4e4c8adf388f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ymbhtWJDlmnuoU0qSCptZumb6o8HnxQbmRZItmihOOU=;
        b=hr3dpobqy60MQ0/xIdFAi4fhITENVYsP9/vWT8arSnZjQqR85SucjebewT3a7Cip7s
         rDz2XoyDlJmCsWxgBwPMh67obBCcuVDQDJFqFD4AkJXIx7vEYNWlsGX7WSOJls20gJqt
         1HNSWnnW8fFDv0k9Ok0Uk7ElpDGUtqxbDhigXsUrgmjrgz41LHOls+/SBAxaXVRNEt+r
         H6CKHkmIcShaC4+G/UP2Y7Zlx4/8X0NDW1/tVAHqoGiiX/o1mWCZQfMQJW6J+/D3WbbC
         z7sJHI20GYgOSBHqaPrrUfGaWeTyT/dA3xqF5Ml1OPjB1yudTRnsliOlS9ajk/hAQ1uA
         vR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ymbhtWJDlmnuoU0qSCptZumb6o8HnxQbmRZItmihOOU=;
        b=3CMAcHGQ8FwfLbpS0S16/jcB9p3aF2yRm10gU2JxzHO8/vblA9FPXZTE6a/mCO8+Zt
         rL5t37AgPY2zfTYwv8Jfx5RHlfP9HXiu5IGNy8TzXZnnGFJCRMDRgKdYtgK41XHGlRPj
         Km7TKLhC/wV+JThvtg9feVx5wIv9FNxTf7Om8krSvxWxX4OdUDq7XMkbwewdRwkgMqqy
         YOfLQGYpEuuiY+HBfuyYUAqCqwNpz4LC50jRDGqpghUJqBOXsXtwyoUTGs2nlcC4sZOy
         IQoYWLRWLLj+JeFtu1PZio9fivfSKrGyVSg7Yrj8xP+sBgo9CiKD7QjfEDMUHuEUVBtd
         WdlQ==
X-Gm-Message-State: AOAM530O+KBlm/R810fkc6Ne7h4pRita7cM3eqv4JZYFl0pJaIJcMhZT
	gz6OXSADfeaZIxCSJ1r0V5SPBfPxUKgx7xRg
X-Google-Smtp-Source: ABdhPJwHV0Vtsr8CP1xdXrs4yT4Ov+taT2HHe+f6VfNoQo38IkWERMKnhvVM8wpIKHE/y1MgOqA5kQ==
X-Received: by 2002:a17:90b:17ca:: with SMTP id me10mr2070593pjb.171.1632861049495;
        Tue, 28 Sep 2021 13:30:49 -0700 (PDT)
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
Subject: [PATCH v4 1/6] arm/traps: remove debugger_trap_fatal() calls
Date: Tue, 28 Sep 2021 13:30:24 -0700
Message-Id: <4c4f45280547564b2c16fd9ca09443314b8f3b6e.1632860589.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1632860589.git.bobby.eshleman@gmail.com>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM doesn't actually use debugger_trap_* anything, and is stubbed out.

This commit simply removes the unneeded calls.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
 xen/arch/arm/traps.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 4ccb6e7d18..889650ba63 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -41,7 +41,6 @@
 #include <asm/acpi.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
-#include <asm/debugger.h>
 #include <asm/event.h>
 #include <asm/hsr.h>
 #include <asm/mmio.h>
@@ -1266,10 +1265,6 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
 
     case BUGFRAME_bug:
         printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-
-        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
-            return 0;
-
         show_execution_state(regs);
         panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
 
@@ -1281,8 +1276,6 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
 
         printk("Assertion '%s' failed at %s%s:%d\n",
                predicate, prefix, filename, lineno);
-        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
-            return 0;
         show_execution_state(regs);
         panic("Assertion '%s' failed at %s%s:%d\n",
               predicate, prefix, filename, lineno);
-- 
2.32.0


