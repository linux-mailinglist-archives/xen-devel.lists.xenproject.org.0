Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FE570BD69
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 14:19:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537883.837525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14V7-0001pC-Jh; Mon, 22 May 2023 12:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537883.837525; Mon, 22 May 2023 12:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14V7-0001ky-Dz; Mon, 22 May 2023 12:18:57 +0000
Received: by outflank-mailman (input) for mailman id 537883;
 Mon, 22 May 2023 12:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae2Q=BL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q14V5-0000XV-Vg
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 12:18:55 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1a9e4e1-f89a-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 14:18:54 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2af189d323fso42251381fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 05:18:54 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b004f26aabbd6asm961120lft.130.2023.05.22.05.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 05:18:53 -0700 (PDT)
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
X-Inumbo-ID: d1a9e4e1-f89a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757934; x=1687349934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzaXPM5ihr2hJv4uppdYO8eOKE9U/QW5elpxLedCGQg=;
        b=jnY5gEFp/ARyk8/m3xL34Ukzc2Xc062lnJNAA8t5DcKwHus3bY7wVlNvTy5ZVs12OW
         StCfsbcgp1c/IdKVjBoTzJCwXcQp+cj+guTTF/ZkXfMyoLiTORIxJyTwuPnWTxHItGtL
         8u/F103wlV8AtlQB+faM8cb9AXB0y0YP0uoj73XwcrvsKNuFeMUuxCXqvsrPNmvwtmMh
         z5Q9K5bla1q0ho/ScxCnqGxk7SXtnXlL4WFo+AQy1aRpikZ+GnGEFqL5d6WKW6cQewBD
         AsnlMBUib5aKhGiUe8hy5o2U/l+Dk+8vDlevQh6VCxWo0MXc/G+Sh1jaHE4ipuR7mcuq
         xBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757934; x=1687349934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzaXPM5ihr2hJv4uppdYO8eOKE9U/QW5elpxLedCGQg=;
        b=LjuArUQ6F5BPJpyjcg/tQCznX6D7ZAYuc1Xg+EiiIHw/8OaT39qUoaRSwgwabonaPE
         6qlA+iKajujyLLrGZCH73fDIirvv/2EE1Y9sAjrk5pCwXPCPhY9B+P8WVmpIzCibza/s
         VgNPESwIY0U0yVKt+HReCysNiITrkQGVX3LjlJwEhn2IpbM5deUK+bOo8TB/qW6OsNAi
         Hk3sITBCn9QRXQHHPTgOOj616goONrZU7hNss3DCMolXBpVl7YHNK+DYzDn+wQCUlQO8
         F04EEC8/VNqiCn/xO7NjH1nn0uHZeSMdwFEOjBggXI3BtPTuveNqn3vp3Db8q5dI9Gn8
         J3HQ==
X-Gm-Message-State: AC+VfDwqbRW4eIHekzsRvdC6nou3R4Lj2yrQXwvuIA6A52681n0r2s5v
	MrWEMQ6jAwlO4Cgqa3B/AROMKshby2c=
X-Google-Smtp-Source: ACHHUZ7HhrVcVrH7MEEiRs2CvHg8BVgP3JaRumD6q8cD3Y+Mn7qRFkMARpJcZumxoEUOejgnpwQWPQ==
X-Received: by 2002:ac2:5e86:0:b0:4f0:6aa3:d85a with SMTP id b6-20020ac25e86000000b004f06aa3d85amr3227582lfq.0.1684757933708;
        Mon, 22 May 2023 05:18:53 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 5/5] xen/riscv: remove dummy_bss variable
Date: Mon, 22 May 2023 15:18:46 +0300
Message-Id: <3d30db8cad99aa7bb9b22728b37c5184d5ae953f.1684757267.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1684757267.git.oleksii.kurochko@gmail.com>
References: <cover.1684757267.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After introduction of initial pagetables there is no any sense
in dummy_bss variable as bss section will not be empty anymore.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
 - Nothing changed. Only rebase
---
Changes in V7:
 - Nothing changed. Only rebase
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


