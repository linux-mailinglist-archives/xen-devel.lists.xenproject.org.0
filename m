Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E8F9857AA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 13:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803853.1214685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPuA-0007hX-Gt; Wed, 25 Sep 2024 11:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803853.1214685; Wed, 25 Sep 2024 11:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPuA-0007fT-Dp; Wed, 25 Sep 2024 11:09:58 +0000
Received: by outflank-mailman (input) for mailman id 803853;
 Wed, 25 Sep 2024 11:09:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N7N=QX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stPu9-0007XF-0t
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 11:09:57 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b256d3de-7b2e-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 13:09:56 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so920254366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 04:09:56 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f4f83asm196069666b.46.2024.09.25.04.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:09:55 -0700 (PDT)
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
X-Inumbo-ID: b256d3de-7b2e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727262595; x=1727867395; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hlYfqSBjPhKnWypPWIY9SM1OmE/N7sm9NnQUnXVH7E4=;
        b=ECo/GFvr++INtsriez0zQEVgeznA6s0z7YuNnx/sd62jWGSkz2B7l0wkUG7sJwxEhu
         lBStB8Khia3IfrUsdXT5wOrekGnxabLhqm+mSzsgQ8K7nKiX9hiZ9+AabV5H2/JGJtJ5
         KADTKrpbPkSssfazrxWBCNGSvKk6wSeGy1zls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262595; x=1727867395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlYfqSBjPhKnWypPWIY9SM1OmE/N7sm9NnQUnXVH7E4=;
        b=MH2ZWzgpmmBNKPXPck08dGW6v4o3OCAkzWJZLteVGxMZVRoZqf7P88q/ahs0IOD5Od
         eEEPsUDTndXeGWlpoJ9rKed3kQj2iR5ILQLxfN/BnC9sceeXhowutaHMCyAR3tVDkuvR
         VNNUUgXttTuR+mFy8QcX+WL8fKDUeOBvyw3mRQWxNEsS/a1AkyB1sZhi+KJw1wxqjVCa
         dHaIyN4d1vfvZEx9mgXSKMvEgXcKlgRsXK5AiapXf1bNN3nzJFa82itP4/O1qa8+IF2g
         TadpZFqGi0/bQkgT/e0N1Y3yJGGElgeH9YSygbUpqgmwaPIgmD/OwtsejxLuJTU0uTSc
         YijQ==
X-Gm-Message-State: AOJu0Yx4mHYfG5FO9My8kZY4u8e6WdHx6bUyGT3Z5BjpwvsgxaKfFeQb
	S1GV/j/hreLtEwqOO8guKryiO5s6tPBV+NuERo1qZnJQgYpy/u6Qy9L8dq5Pyk0K7WWLh+ua8FV
	P
X-Google-Smtp-Source: AGHT+IGJD09htlzub8DnBfbh8EyHVjOvZWVwIz7Lm1c8ZNWriLNGvPVc5gh7aDST68iE6XrgatIOFQ==
X-Received: by 2002:a17:907:9411:b0:a8a:809b:14ed with SMTP id a640c23a62f3a-a93a0646977mr185357666b.44.1727262595502;
        Wed, 25 Sep 2024 04:09:55 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/defns: Fix typo in comment "Porection" -> "Protection"
Date: Wed, 25 Sep 2024 12:09:46 +0100
Message-Id: <20240925110946.277588-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/x86-defns.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index caa92829ea..7abc5bcd42 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -171,7 +171,7 @@
 #define X86_EXC_TS            10 /* Invalid TSS */
 #define X86_EXC_NP            11 /* Segment Not Present */
 #define X86_EXC_SS            12 /* Stack-Segment Fault */
-#define X86_EXC_GP            13 /* General Porection Fault */
+#define X86_EXC_GP            13 /* General Protection Fault */
 #define X86_EXC_PF            14 /* Page Fault */
 #define X86_EXC_SPV           15 /* PIC Spurious Interrupt Vector */
 #define X86_EXC_MF            16 /* Maths fault (x87 FPU) */
-- 
2.34.1


