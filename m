Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5955568810
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 14:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362219.592169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93sw-0001V2-E6; Wed, 06 Jul 2022 12:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362219.592169; Wed, 06 Jul 2022 12:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93sw-0001SE-B3; Wed, 06 Jul 2022 12:12:02 +0000
Received: by outflank-mailman (input) for mailman id 362219;
 Wed, 06 Jul 2022 12:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mwIU=XL=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o93sv-0001S8-7e
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 12:12:01 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d639c0f4-fd24-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 14:12:00 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id d16so15460646wrv.10
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 05:11:59 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 r12-20020a05600c35cc00b003a04e900552sm25651811wmq.1.2022.07.06.05.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 05:11:58 -0700 (PDT)
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
X-Inumbo-ID: d639c0f4-fd24-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w2XRrjOrjpaz12Jeqf1YAACZjWuCue/f9szg5gZlJPQ=;
        b=NP/L+f/O8awS0i+uldSRpWzqBMjnmJ7EyhXpdvSOXO/IEiTV/hvqcK4Oom9KNwSP03
         r8t5ugr9gY+xOKQNQySQ1/iQEAmyKSih+5DMCxj1R+m22yL3nPc88FPKJv8/sAAqS2HN
         PfeZNLNZOh05x5AGpgKjIiIeVCn06Hj6QZlxmsBBLKgKP7OCNCHz2uJINtdjHIi90V4/
         2T+uwLWDnMTNSRp+5ieu9/chJgVn68NxHSyOTTaIjrSxM7hQvjhWkP44p9eMSe5pZcCz
         ersNPWw4VuH0ZE2cfZ4UP4QJSKAccRJORTQ9NoI+UZmCRCB8QLr+lmtJhyTGAxe+ptzm
         oZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w2XRrjOrjpaz12Jeqf1YAACZjWuCue/f9szg5gZlJPQ=;
        b=eOlWZ5A8bmJWDMRM8j7vZl6vTujV9IY5T62kgI/p3tQMzN976Ipvcrh9DQD/0AJI+1
         EOLPbO5n5E8y1pQwFRetziS9dcRnt2Ep8Ett9QVIrZSQJmg3Es1JfUHPaayFnbbKYRni
         jqFrlN1h21iL52IqZLT+YpF+sG3slelcmnoLpq2pHVdcsuwKAWEz++asNdbrgu9b4Gtt
         NeHhLoOFbMmP2l2cUSqAvqB9oIS+gBmdRS3XH2iqeNvfCt4M+Z07p3bkG4YDzfK1IlrJ
         2JL38oHj65ykW0anSD8L0h9Ho023NrLlP78kz8dCvk+y1Cy8AySsGJVk2SFANKfXvgF2
         ZmzQ==
X-Gm-Message-State: AJIora+TzBzk2gt0ZWhkQC6PUlIq28HcirVPGqjLtgZ27VCLItQlrADS
	K9qyhDLUZ2Lian+fIDp6uHKuGo5m5MA=
X-Google-Smtp-Source: AGRyM1t6fjaKIMGCK85ynYVZJHCY4T0hBuhA458hbYRcey/UQZ5+Y/Swtlvh10Mc47OhNrPqDcGFZA==
X-Received: by 2002:a5d:4f02:0:b0:21d:63f6:380c with SMTP id c2-20020a5d4f02000000b0021d63f6380cmr19362119wru.635.1657109518960;
        Wed, 06 Jul 2022 05:11:58 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	bertrand.marquis@arm.com
Subject: [PATCH v2] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violation
Date: Wed,  6 Jul 2022 15:11:56 +0300
Message-Id: <20220706121156.666500-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the function prototype of show_stack() in <asm/processor.h> header file
so that it is visible before its definition in traps.c.

Although show_stack() is referenced only in traps.c, it is declared with
external linkage because, during development, it is often called also by
other files for debugging purposes. Declaring it static would increase
development effort. Add appropriate comment

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
Changes in v2:
- add a new line after show_stack() to make obvious to which set of functions
the comment is referring to.

 xen/arch/arm/include/asm/processor.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 4188ec6bfb..55f56b33bc 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -558,7 +558,10 @@ extern register_t __cpu_logical_map[];
 void panic_PAR(uint64_t par);
 
 void show_execution_state(const struct cpu_user_regs *regs);
+/* Debugging functions are declared with external linkage to aid development. */
 void show_registers(const struct cpu_user_regs *regs);
+void show_stack(const struct cpu_user_regs *regs);
+
 //#define dump_execution_state() run_in_exception_handler(show_execution_state)
 #define dump_execution_state() WARN()
 
-- 
2.34.1


