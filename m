Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5587E3F0CC5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 22:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168317.307331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCH-0007KP-V0; Wed, 18 Aug 2021 20:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168317.307331; Wed, 18 Aug 2021 20:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCH-0007Hn-Qr; Wed, 18 Aug 2021 20:30:01 +0000
Received: by outflank-mailman (input) for mailman id 168317;
 Wed, 18 Aug 2021 20:29:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydNC=NJ=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mGSCF-000714-NG
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 20:29:59 +0000
Received: from mail-pl1-x633.google.com (unknown [2607:f8b0:4864:20::633])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cd00804-05e6-4fea-bf0e-1e3d6a630f84;
 Wed, 18 Aug 2021 20:29:53 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id c17so2587564plz.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Aug 2021 13:29:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id h25sm663775pfo.68.2021.08.18.13.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:29:47 -0700 (PDT)
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
X-Inumbo-ID: 5cd00804-05e6-4fea-bf0e-1e3d6a630f84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ymbhtWJDlmnuoU0qSCptZumb6o8HnxQbmRZItmihOOU=;
        b=YKl9qr55piVM4v/UfO59fMR1wKRC2574LTWQNfSd0FVrL5nHh2bww1/I4V9aaHQ9cz
         KAd5HFzP5L4Dxy2z+xuudCCzeuW0RlCd/cqm7ze7zVCdRWUAp85G+CG1WWgLFxwwtxQS
         rbVym4zvigZQf+66xocGuApPV0F8WHaCnOhPkO8J1OvtmgahtqSMpjs9km4JEX6c/TvQ
         MebjS242u3bnJSG7uNbYzhEIkeT8OnIRPR5ha0ERS0ygDzyB4DFKsvWo0Z+O6VQjKbHd
         471tzl/JVoe5wnVyrSHit6NKR9EB0PgF0eukJwkgPf9PTYYK2uZ6xwnBzCIIWZKqbohJ
         vurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ymbhtWJDlmnuoU0qSCptZumb6o8HnxQbmRZItmihOOU=;
        b=RXl7A+w3zv4HYSYu8IXM4o5aLDhyUJNn8c5MhY5f8KKf/yok42zVlY9okh8/g8kE8r
         hYloOWLvWBxkkRdUZWiXx0WBxYu76s0vmGnAapRh8jTwSIYN4XNZ25xHpSlN4/XzdnzU
         XRCtsNcapQPcRmKHP0W1sgsfvLP875+/lqKukBolTAusiUW0gm+CIxP7KcZg5WKs5eEY
         pqayeEbKC5NoxWNux9NUImF9yyZOArIeMVykdZm1I73Y2PXb2OF+FjnaTCLikAFHzHwY
         x+0Fprq9/F6j4fKDMU8dkUYe7dWe2Q8FVhp92E0eXIFMSwznTDLxtqtcUZAjcgP82Icg
         zSig==
X-Gm-Message-State: AOAM5328Fvm+WvdxLzd4lVg3xnnujavDz5gnIBwjqdnqLYs3/Q1IhMV1
	WqLXOnK7+i6hNy8O56+sOWQASCmDAfLHrhRs
X-Google-Smtp-Source: ABdhPJwg4IupZNg4wmzTylST1vPnBXDYpAFAsWlOW3tjWfPe3sReJbOfM6NM7rjPmc4Xs5AxlpgpQw==
X-Received: by 2002:a17:902:7441:b029:12d:6476:d8f with SMTP id e1-20020a1709027441b029012d64760d8fmr8903237plt.28.1629318588212;
        Wed, 18 Aug 2021 13:29:48 -0700 (PDT)
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
Subject: [PATCH v3 1/6] arm/traps: remove debugger_trap_fatal() calls
Date: Wed, 18 Aug 2021 13:29:02 -0700
Message-Id: <4c4f45280547564b2c16fd9ca09443314b8f3b6e.1629315873.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629315873.git.bobby.eshleman@gmail.com>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
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


