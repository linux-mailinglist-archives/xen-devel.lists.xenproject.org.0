Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC10566D22
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:21:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361096.590419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hYO-0006Gs-Uc; Tue, 05 Jul 2022 12:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361096.590419; Tue, 05 Jul 2022 12:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hYO-0006Do-RB; Tue, 05 Jul 2022 12:21:20 +0000
Received: by outflank-mailman (input) for mailman id 361096;
 Tue, 05 Jul 2022 12:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TLZa=XK=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8hYN-0006Di-74
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:21:19 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8768e8d-fc5c-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:21:18 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id d16so10979411wrv.10
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jul 2022 05:21:18 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 f2-20020a7bcd02000000b003a0499df21asm23593767wmj.25.2022.07.05.05.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 05:21:16 -0700 (PDT)
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
X-Inumbo-ID: f8768e8d-fc5c-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tPhfptPQ+gX4JT3/bdcuFrr3jLpw/OzsoZ0rq0knECo=;
        b=c7RW1YzHeXwf/jMD6hKO4ac6PtBxZevHvqEFxKZAEyrFE3UDM35GRArSoIVYrOo6a+
         mHet7288DBwJFewo+jkPcjpqGFf6Yu2Aog2CmJuwa+vVQpEDDQKIaZzGZwkbFTiIWWkw
         TcqK+BEkLjJkdlKKq58IoUCj3IKXldoMbgja4QPTZiGBs4kzBHRs2YJKZp2eOhxafWVi
         PL+M0Lt6964owd2o3D3/sUH2ChuW4wNVRBFSkruadV8dcKwdogMXkW/rTjiCCF1E+8KN
         7tKThLgQE1aCb4ceLoPoEQoqmBvkZ6103E4h8tLi2oMtGA/Kaai5HLWf3eJJ2KvXwFQ9
         JCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tPhfptPQ+gX4JT3/bdcuFrr3jLpw/OzsoZ0rq0knECo=;
        b=AqvnbGeEzvAr0WKK5s2j1WR7c4NOkjJ3FoGPCR6Sgf/IrcuPjBMnFKe7ocTdO9Cghj
         7WzotoOfGvLo6wEmTTlMUIUeqXMr7HoHfZfLET15lWrLQQG3XOBO2ntydpM5+roVzAiI
         hzZXZKDS46e+wDSglZXkL7wQPRY1JvW0OCIhszbmBE/G2MBPfVIYT/4PPElfOGBx1ndP
         UK2j+sLKMeXEEEwPJxVq+0qyB0EYih93wtpxAaYBV3TUaRa7WEe/nViE9bcgCppGABKb
         47KaAe1oGkkRRNXS3t0pp2LL8f49MiFYX3mtrJZ7n08Pts8uqaONAuWloAlh9oGzuHeG
         eyPg==
X-Gm-Message-State: AJIora8BK7x/pgUjziwZvUSmjFQOtcwye84ok08+wuF0bgnAItNH+Mpt
	lfa2k+ezuU5p+K+HlGiBU5YrRw/YSlU=
X-Google-Smtp-Source: AGRyM1vURze8NoGnLqDBdnnAAi5xOemowMS4E7esieCudqMDa3GdgI2GB6b/ddTHYC1ZzRPRcfVffA==
X-Received: by 2002:a5d:60c2:0:b0:21d:6a52:3db9 with SMTP id x2-20020a5d60c2000000b0021d6a523db9mr9792684wrt.61.1657023677181;
        Tue, 05 Jul 2022 05:21:17 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violation
Date: Tue,  5 Jul 2022 15:21:14 +0300
Message-Id: <20220705122114.419634-1-burzalodowa@gmail.com>
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
 xen/arch/arm/include/asm/processor.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 4188ec6bfb..c021160412 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -558,7 +558,9 @@ extern register_t __cpu_logical_map[];
 void panic_PAR(uint64_t par);
 
 void show_execution_state(const struct cpu_user_regs *regs);
+/* Debugging functions are declared with external linkage to aid development. */
 void show_registers(const struct cpu_user_regs *regs);
+void show_stack(const struct cpu_user_regs *regs);
 //#define dump_execution_state() run_in_exception_handler(show_execution_state)
 #define dump_execution_state() WARN()
 
-- 
2.34.1


