Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6E6A2D1DC
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 01:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884153.1293961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgYLL-0001pp-6J; Sat, 08 Feb 2025 00:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884153.1293961; Sat, 08 Feb 2025 00:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgYLL-0001oE-2W; Sat, 08 Feb 2025 00:05:07 +0000
Received: by outflank-mailman (input) for mailman id 884153;
 Sat, 08 Feb 2025 00:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lbac=U7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tgYLJ-0001YL-Nm
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2025 00:05:05 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58dcfaea-e5b0-11ef-b3ef-695165c68f79;
 Sat, 08 Feb 2025 01:05:04 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso17507345e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 16:05:04 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da9656fsm72336295e9.3.2025.02.07.16.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:05:02 -0800 (PST)
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
X-Inumbo-ID: 58dcfaea-e5b0-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738973103; x=1739577903; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/JTU8E7ncqUSv3tjrzaMPmZsR3+I1KsMdSHHDijONc=;
        b=Xkikaa9yYEnU/n6l3n1SxpntCOvvsBOkOtsFwUHn1wDn6KBtGbJxVw9k2P+HwU+ARy
         uFAqVe168IBR0UWgybK/x9qZ2mF5fqu1a1rvpkGD/pz3qOqSCg/D1mUQqesOIc5oMveA
         uqKfL8/tFB+rojacaGZJrcaFptDEuvkKPWu08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738973103; x=1739577903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/JTU8E7ncqUSv3tjrzaMPmZsR3+I1KsMdSHHDijONc=;
        b=dY7y43qrAcYNp1EIO26kkSlcGpwb7zXK+vRxsbdOd7B8FFKLiMSGZhO3eyu1mXvLYs
         szBdT9XUEO6gAEUSNFSZ1vjixSirCwJojuT2ohGyQmOGS2Gy3pMCuHkKfiZ2unJH15ia
         rGZdj3w8u9L7LHSOullIqoJNgKOWkAkYOEFzA27UxLlLyNgjFOXfGQMWN3YVMy5YtHMR
         kyGuuGZQYqJRL0BNkVvGP6S0yeJutGq2xDnxN4RpAaD8K1ItxQuL2RZssj2llKFh4+yr
         XNIksVFmz7DWxmS+1wYFf0AK/B8HKmosOxN78TWxpOdJvj74Eb9yOs67G/retnlipeTF
         f90g==
X-Gm-Message-State: AOJu0YxpX+hk5H72erN8MlgwbQOx63a9wdZDOYZ30F2E6rluDLnYe67q
	BB0ge+99tbUUllgp/7y5pq69p7l5AtvMANXeoRZGDiokuyRkENPX/ldI2vA5MOm28od7/HANCEf
	0S8w9ng==
X-Gm-Gg: ASbGnctyn9r8ni21hC5XJDhdrS0t5ciSst24hhjcXv9lRoRvl1DCSUMbjZHTR9plYFU
	dxR11wBZlgOtIyQB4P+KeU7Ownz1mulfLAEjOEZMquKrfjjtyaFvBVKI44O/nuAo9fYFR1vyMM5
	XPVDBxRpBKmOTQ7urjywM+d/zcb9U7L//lVVCcjBIBkprvl5kfWTUjeyAWPyxfNxXQ2bgnb0/Cq
	lakOsaOStZFZNuQZsvV3O+Dauc/vf3glIvE8D2XbhOV1pFMN/xGpEizhP4QBMWLzvCzgLVALYbx
	Q/HdqUAFjyCGEe7al9QtfGRcI7WTPl6euynyf70SbCnx2Ju8gImXWx2EgHoXj5Nnvfu1uVM=
X-Google-Smtp-Source: AGHT+IHYvycWEUIGEKe3t6G6gShQYPPQiohc3YZiKSG34e+e0c3zYqEPjfHn8RpER53bOkVXxkEPTA==
X-Received: by 2002:a05:600c:c19:b0:434:a386:6ae with SMTP id 5b1f17b1804b1-439249842bamr44251245e9.7.1738973103303;
        Fri, 07 Feb 2025 16:05:03 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.20? 1/4] ARM32/traps: Fix do_trap_undefined_instruction()'s detection of kernel text
Date: Sat,  8 Feb 2025 00:02:53 +0000
Message-Id: <20250208000256.431883-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250208000256.431883-1-andrew.cooper3@citrix.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While fixing some common/arch boundaries for UBSAN support on other
architectures, the following debugging patch:

  diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
  index c1f2d1b89d43..58d1d048d339 100644
  --- a/xen/arch/arm/setup.c
  +++ b/xen/arch/arm/setup.c
  @@ -504,6 +504,8 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)

       system_state = SYS_STATE_active;

  +    dump_execution_state();
  +
       for_each_domain( d )
           domain_unpause_by_systemcontroller(d);

fails with:

  (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
  (XEN) CPU0: Unexpected Trap: Undefined Instruction
  (XEN) ----[ Xen-4.20-rc  arm32  debug=n  Not tainted ]----
  (XEN) CPU:    0
  <snip>
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) CPU0: Unexpected Trap: Undefined Instruction
  (XEN) ****************************************

This is because the condition for init text is wrong.  While there's nothing
interesting from that point onwards in start_xen(), it's also wrong for any
livepatch which brings in an adjusted BUG_FRAME().

Use is_active_kernel_text() which is the correct test for this purpose, and is
aware of init and livepatch regions too.

Commit c8d4b6304a5e ("xen/arm: add support for run_in_exception_handler()"),
made run_in_exception_handler() work, but didn't complete the TODO left in
commit 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON").  Do so, to make
ARM consistent with other architectures.

Fixes: 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Sample run going wrong:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570105

Sample run with dump_execution_state() working:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9079185111
---
 xen/arch/arm/arm32/traps.c           | 3 +--
 xen/arch/arm/include/asm/processor.h | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
index a2fc1c22cbc9..b88d41811b49 100644
--- a/xen/arch/arm/arm32/traps.c
+++ b/xen/arch/arm/arm32/traps.c
@@ -36,8 +36,7 @@ void do_trap_undefined_instruction(struct cpu_user_regs *regs)
     uint32_t pc = regs->pc;
     uint32_t instr;
 
-    if ( !is_kernel_text(pc) &&
-         (system_state >= SYS_STATE_active || !is_kernel_inittext(pc)) )
+    if ( !is_active_kernel_text(pc) )
         goto die;
 
     /* PC should be always a multiple of 4, as Xen is using ARM instruction set */
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 60b587db697f..d80d44aeaa8f 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -577,8 +577,7 @@ void panic_PAR(uint64_t par);
 void show_registers(const struct cpu_user_regs *regs);
 void show_stack(const struct cpu_user_regs *regs);
 
-//#define dump_execution_state() run_in_exception_handler(show_execution_state)
-#define dump_execution_state() WARN()
+#define dump_execution_state() run_in_exception_handler(show_execution_state)
 
 #define cpu_relax() barrier() /* Could yield? */
 
-- 
2.39.5


