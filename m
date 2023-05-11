Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89186FF81F
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 19:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533494.830267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9nU-0003Lk-KY; Thu, 11 May 2023 17:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533494.830267; Thu, 11 May 2023 17:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9nU-0003Dm-Dw; Thu, 11 May 2023 17:09:44 +0000
Received: by outflank-mailman (input) for mailman id 533494;
 Thu, 11 May 2023 17:09:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPy6=BA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1px9nS-0002Lh-7i
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 17:09:42 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e5329c5-f01e-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 19:09:41 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ac90178fdaso72974961fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 10:09:41 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 c9-20020a05651c014900b002aa3cff0529sm2443830ljd.74.2023.05.11.10.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 10:09:40 -0700 (PDT)
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
X-Inumbo-ID: 9e5329c5-f01e-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683824981; x=1686416981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf2FBCUITLNv92K79Iv4iXww3Xtu3EP3+kJgTTV/WyQ=;
        b=C+0/yYQ/2pH7HIj1RH6MaN0sFqlcocZq3ErT3et2CrJb2vdQyi5GSMRCD4S1GjeLRM
         y2JFyo9CZuyEoxBWR0WQczTPUXNZNAkRqf9HZfArg+tFVY5jC56RsezQEuCBNTFx2jqA
         nq6zHBSc2hhxyTTwySCsxljuAazrqhXiY+7ELuTVYU8hmfsetnCJUUiAkz2H/zPQ6+z8
         C5z/Cnt2hm+Y+ymhw0MVgX6IXD0mr1rdhPo5TSc11lp+xjnd+vWl1fMw/TXMoef2Sk0C
         OI+es7txnV3+hXIQHQ5J9Sf2d28PKARiQ0e75hgmY5TeFIH08rpziXwaLxsBhvfyTSaG
         DA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824981; x=1686416981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf2FBCUITLNv92K79Iv4iXww3Xtu3EP3+kJgTTV/WyQ=;
        b=Zyg9rcpFwGFdRn2E+uz1jE18YGaSa2WwJWYtzoqgpeASCb++LCXxwEDguvOZNHAhMn
         msslw9WfxS0L6v1ojDjpT/i9s9sI/mXtLcWMkKy4nDjeWiipQc1+t3BYF6kjX9mR8QF6
         PryoVYoJiifDm/ezWazfJfPdV4xC4iQY5Mr6O+GrP3XuyBDA6zwJBEFflkymOXclCjHJ
         MJ8uOlP2laOt9A8S9U6r/iHj4KiT/3YrJjBKPgmFK7pRZfC1IPlmTf2hdCC8ZxkkK85f
         8VzuTpCbixUia8v384aFV0C+po/TBbxMQtfnGKkpgFgVUxf506aP0Y9r4SqutWGYoGL0
         dhQA==
X-Gm-Message-State: AC+VfDxMa5wkisn9G1gajT06T2tDO2vzEhEpUHLTyqt0fC0Q8Ixda9YD
	iTO/a66sBZ2xMuhxsrMLLdIDeHSLWj0=
X-Google-Smtp-Source: ACHHUZ4EyFu8mwEU1QYN86KZyNdN0+84ERXHNRwWS2bKpDaLjYjmYkAZX6xNdgA/4cykJvE19Bs+AA==
X-Received: by 2002:a2e:7004:0:b0:2a7:7055:97f5 with SMTP id l4-20020a2e7004000000b002a7705597f5mr3382400ljc.0.1683824980936;
        Thu, 11 May 2023 10:09:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 5/5] xen/riscv: remove dummy_bss variable
Date: Thu, 11 May 2023 20:09:33 +0300
Message-Id: <a8bb8b567166e9906815958317770c2c41106fe9.1683824347.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1683824347.git.oleksii.kurochko@gmail.com>
References: <cover.1683824347.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After introduction of initial pagetables there is no any sense
in dummy_bss variable as bss section will not be empty anymore.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - Nothing changed. Only rebase
---
Changes in V5:
 - Nothing changed. Only rebase
---
Changes in V4:
 - Nothing changed. Only rebase
---
Changes in V3:
 * patch was introduced in the current one patch series (v3).
---
Changes in V2:
 * patch was introduced in the current one patch series (v2).
---
 xen/arch/riscv/setup.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index cf5dc5824e..845d18d86f 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,14 +8,6 @@
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
-/*  
- * To be sure that .bss isn't zero. It will simplify code of
- * .bss initialization.
- * TODO:
- *   To be deleted when the first real .bss user appears
- */
-int dummy_bss __attribute__((unused));
-
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
-- 
2.40.1


