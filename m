Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36105915F2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 21:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385866.621723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHY-0002jM-GF; Fri, 12 Aug 2022 19:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385866.621723; Fri, 12 Aug 2022 19:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHY-0002Yn-62; Fri, 12 Aug 2022 19:25:20 +0000
Received: by outflank-mailman (input) for mailman id 385866;
 Fri, 12 Aug 2022 19:25:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMaHV-00025p-CZ
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 19:25:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHV-0000zS-6d; Fri, 12 Aug 2022 19:25:17 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHU-0006n6-V4; Fri, 12 Aug 2022 19:25:17 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=iOLL1u2KoKBoa80MrMv6wujMJrVVx1Fxvbp2RjO3MMA=; b=HV8AcaitSCtPNQGvgTR11HlGYd
	zs8drn6eNZQeqwFDC9Jp9OYpQgzrYGxLlwpxRXyIXXxhM7VSKQcQHfVC7dsWS8tuSjIiRYVIIEyav
	dG1AYdqaFUi3rl/H1v+22NiLoB2NqPLwEZPN6Nl6QBtjVbMsNAWenMdlAlS6ElSrwPdk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 8/8] xen/arm32: traps: Dump more information for hypervisor data abort
Date: Fri, 12 Aug 2022 20:24:48 +0100
Message-Id: <20220812192448.43016-10-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812192448.43016-1-julien@xen.org>
References: <20220812192448.43016-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Unlike arm64, on arm32 there are no extra information dumped (e.g.
page table walk) for hypervisor data abort.

For data abort, the HSR will be set properly and so replace the call
to do_unexpected_trap() with do_trap_hyp_sync() to dispatch the error.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/traps.c       | 2 +-
 xen/arch/arm/include/asm/traps.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
index a4ce2b92d904..a2fc1c22cbc9 100644
--- a/xen/arch/arm/arm32/traps.c
+++ b/xen/arch/arm/arm32/traps.c
@@ -81,7 +81,7 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
     if ( VABORT_GEN_BY_GUEST(regs) )
         do_trap_guest_serror(regs);
     else
-        do_unexpected_trap("Data Abort", regs);
+        do_trap_hyp_sync(regs);
 }
 
 void finalize_instr_emulation(const struct instr_details *instr)
diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
index 08bc0b484c75..883dae368eac 100644
--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -73,6 +73,7 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc);
 
 void noreturn do_unexpected_trap(const char *msg,
                                  const struct cpu_user_regs *regs);
+void do_trap_hyp_sync(struct cpu_user_regs *regs);
 
 /* Functions for pending virtual abort checking window. */
 void abort_guest_exit_start(void);
-- 
2.37.1


