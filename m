Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9944896C07
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700404.1093565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjP-0002HJ-G2; Wed, 03 Apr 2024 10:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700404.1093565; Wed, 03 Apr 2024 10:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjP-0002Ad-2F; Wed, 03 Apr 2024 10:20:35 +0000
Received: by outflank-mailman (input) for mailman id 700404;
 Wed, 03 Apr 2024 10:20:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjN-0007Ob-CL
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:33 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd16f016-f1a3-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:20:31 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-515a68d45faso7029540e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:31 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:29 -0700 (PDT)
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
X-Inumbo-ID: cd16f016-f1a3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139631; x=1712744431; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0ZJ8zwoyTFUoE2+lGEttRsQ4y0+B4y5V6UHVOCeBNM=;
        b=Z32ISTOeWFEqVywWFES7//V1hKrIG2Q/Qzu/Qp7eBY1IdX+M0MyzxZGsXrvuQICaOc
         Bf4ogmKt3Dou6gL8UigVCe4K4fS+q+en66ny+kWv43+FygNz1+d+X7Ioqf8XSRwcjwsA
         oGZh2cPqsJDCArmIujhB8y3sGp82b0W3PpAIlmJKxLGaVV6XJ4wP+RAQM4LiOFHGXusE
         nJ+Iq02WWP1ZkfrC45KdztbRuhOsRcAC0iOwnkBK1IMndOXjHA0AziJY1VUQInW/9Uje
         ZGveYe60qqhJDmJgu7tmTd3UbmV68SLoAqiAZmWdCnMzBqmImw7civSLTLDln9444xgp
         8xJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139631; x=1712744431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0ZJ8zwoyTFUoE2+lGEttRsQ4y0+B4y5V6UHVOCeBNM=;
        b=EqMA+XjhcTq03dnNM7L4F6ZRMGhWwFVFtRMcZXbgnjob7gyc32m+jnihl4sZr2lneD
         uwq/a1ZwroT9uvQPVNFks0+WwooOt/Btpn8h7O8S+TknFCDlqhaAfQybgfDIIJB63d7l
         uvUnRROtjUcIvqpOfhV1T8qBxbgiUT9/uvfkAzZI39fl23r0ixgxjQCqErYy/8CTxWro
         Qf72oZidmbxPgrc5P2c+YDfuTsh391+mNodpCJ0OQbOKcHRGSkv1UyvRf8z10oN0/ivl
         GD52mJCJCmpH1cemIHxqqMgJqI8aCQ0Bs3Ud2dq6o1+QS6YjVk/vjq8oJk/4mnTrE2ZG
         k4eg==
X-Gm-Message-State: AOJu0Yx2nsKN83EGAme1pHQcxThzK9nW1lpvMRGZvzpa74l+t51spNez
	CU8aatzZQVndLRs6/ooXf/Eg5RGZ6IgGDKC16fg3BZin8qV3tlFZ5ZrSa9As
X-Google-Smtp-Source: AGHT+IE7Ub6BDdB1Us7cIdBCZcT7/FQFmVwANUBGDPIOAZGlpciMwvVvmZVtJ7E32sYwtapRYnccEA==
X-Received: by 2002:a05:6512:741:b0:515:c8fc:9d98 with SMTP id c1-20020a056512074100b00515c8fc9d98mr8994765lfs.20.1712139630636;
        Wed, 03 Apr 2024 03:20:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 12/19] xen/riscv: add definition of __read_mostly
Date: Wed,  3 Apr 2024 12:20:05 +0200
Message-ID: <006adb514b74c8f1ee35e64e9d29ffeb6337abb0.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of __read_mostly should be removed in:
https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/

The patch introduces it in arch-specific header to not
block enabling of full Xen build for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
- [PATCH] move __read_mostly to xen/cache.h  [2]

Right now, the patch series doesn't have a direct dependency on [2] and it
provides __read_mostly in the patch:
    [PATCH v3 26/34] xen/riscv: add definition of __read_mostly
However, it will be dropped as soon as [2] is merged or at least when the
final version of the patch [2] is provided.

[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
---
Changes in V4-V7:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/cache.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
index 69573eb051..94bd94db53 100644
--- a/xen/arch/riscv/include/asm/cache.h
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -3,4 +3,6 @@
 #ifndef _ASM_RISCV_CACHE_H
 #define _ASM_RISCV_CACHE_H
 
+#define __read_mostly __section(".data.read_mostly")
+
 #endif /* _ASM_RISCV_CACHE_H */
-- 
2.43.0


