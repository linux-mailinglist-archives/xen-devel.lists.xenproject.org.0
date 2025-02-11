Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF235A30C2B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 13:57:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885538.1295345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thpp0-0007sH-6p; Tue, 11 Feb 2025 12:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885538.1295345; Tue, 11 Feb 2025 12:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thpp0-0007pB-3l; Tue, 11 Feb 2025 12:57:02 +0000
Received: by outflank-mailman (input) for mailman id 885538;
 Tue, 11 Feb 2025 12:57:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4Ra=VC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1thpoz-0007p5-8Z
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 12:57:01 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7831a28-e877-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 13:56:48 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso55591235e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 04:56:48 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd4764880sm9119649f8f.25.2025.02.11.04.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 04:56:46 -0800 (PST)
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
X-Inumbo-ID: a7831a28-e877-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739278607; x=1739883407; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EKXLk1cBEFjFk8YPWoCq+dEoG+Q+E/kzyDR7vByhp8I=;
        b=e89WULg7t+lV3kOIJqzaEUg02I9jpgbnnaQhnACwBpktRffSTReRhnXV10T1JbrbH1
         3QC5Q/6i2PvML2Y/QIRh7mE43Z6m7ccMM1dOe9nSFBtGBJkk6GH6slUJtj/66xM3eyOs
         GCeqRXad7UIc9JYNZAUWWjdJrwbr4sB564bMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278607; x=1739883407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKXLk1cBEFjFk8YPWoCq+dEoG+Q+E/kzyDR7vByhp8I=;
        b=p9VhTJj/XxMufPTH9C/9bSWUf8bmfL78298c7iUsm5k9eljIyauz0TyvVb5HDjRv5Y
         EeBgdpdmeGlnEI0/k3nAIH+uSBienOm5cwAhg4rqlDB/bIgyPf1fNFhXczljOA6BaC4T
         jT2WxMVntt/VgAtm3ifRtKeK5oLxmjfZFXAGU5lTSNxpqcbZY3lbceA6vdZTMKZnj6qK
         8oFhcdWYcvvtqrMKXBZ/15Xkhfb+84ohIir84QpJhqA52ono56B+fXx85ygE9FY/zeVb
         AF6PPEKeQUVveeGk1yxHauLQq2t5aSmRHtNO8OsvYEAWzpQs5r9hcr3ouKQMn7Cq0hc2
         mmrQ==
X-Gm-Message-State: AOJu0YzPdsklyJQ8fOW4GWSz7gh/YP9rhHaETI/6rvaKqGvuoAbiMEph
	Rh6AJWkMWp9WhYTo1ZDgIogyuXMTRf5pFoJ/ykcRtTvf35gAOTX6ySGb78SWqI9W1fsdZpFtRaU
	YkdnV3A==
X-Gm-Gg: ASbGncsmAYNKzMgz0WcRayig7c6CW+shqHRTmlpSLkKBqMWibkR/nwSYWaHOt6l2bBt
	vaB1jfv0f1nn9UqKuC6umfUD7Y2ZLu96RVZFkU26i1gIwY+GXi76brl5oz3PqP877DaoJZA/JHI
	GGlyFjv2vE8UyAQHrGc+cmH2PV/ifb3rcHimaQn5rqGh8V6QYNxn36qswXXuoHog9QSCKEkbhU8
	wGoYOarLHpaY01LxF6+h/f5dv/gve1u3jTEXMRzMI14NU0C+YimXaXIzU0FtYBvj6QK2qMvudjE
	CllPBPoOfTOeAGkiadLI2Lt3haVCBWlP2WBdb6GRKLS/ZqHiVbLuau7ZMLfgtaBGQ3I0+h0=
X-Google-Smtp-Source: AGHT+IHLOsq8VS7FattEtktpiZoC9gJS3QFghBl9fiYuTgsz9mnHDdpt/HlNIbo8TYaDd3ZolT3ptw==
X-Received: by 2002:a05:6000:402b:b0:385:fa26:f0d9 with SMTP id ffacd0b85a97d-38dc89171f9mr13515075f8f.0.1739278607350;
        Tue, 11 Feb 2025 04:56:47 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.20 v2] ARM32/traps: Fix do_trap_undefined_instruction()'s detection of kernel text
Date: Tue, 11 Feb 2025 12:54:45 +0000
Message-Id: <20250211125445.451805-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
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

failed with:

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
interesting from that point onwards in start_xen(), it's also wrong for
livepatches too.

Use is_active_kernel_text() which is the correct test for this purpose, and is
aware of init and livepatch regions as well as their lifetimes.

Fixes: 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * Split out change to dump_execution_state()

Sample run going wrong:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570105

Sample run with dump_execution_state() working:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9079185111
---
 xen/arch/arm/arm32/traps.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
-- 
2.39.5


