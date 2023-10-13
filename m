Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45207C85C4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 14:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616523.958606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrHG6-0004Do-9w; Fri, 13 Oct 2023 12:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616523.958606; Fri, 13 Oct 2023 12:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrHG6-0004B4-6v; Fri, 13 Oct 2023 12:27:14 +0000
Received: by outflank-mailman (input) for mailman id 616523;
 Fri, 13 Oct 2023 12:27:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ujq9=F3=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qrHG4-0003w8-CN
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 12:27:12 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d50942e8-69c3-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 14:27:11 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso15805875ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 05:27:11 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.106])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b001c452f827casm3768599plg.257.2023.10.13.05.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 05:27:09 -0700 (PDT)
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
X-Inumbo-ID: d50942e8-69c3-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697200030; x=1697804830; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pv1k0D1kdZkwZuVzxDjvhu5HxgmMO77wg7lK+YiP6wY=;
        b=MBJgDoWKRraDHm9KNH7oLeiTDc0C2zYHQHEEEq+RPMzn8dNXkjnxjJ/IXoOgmwBLb7
         XoO5DNKxNDENKGFPIQhLCqfzdAaBF78rk7uqLN/bkvFynN9GAjg4TrgJW6kEG358cQE4
         YzkPE/Zcy4NkJ537J8SqpDm6bMnxuel2AI9gK+voHiAVNWoVPUOxTmS04YhMJbnxOWTl
         HnPegvPc/m9fvFfoRqLms/7MOndZLKwXYAlaXGc38jBu9r01XIN9wthCw3kaxPvo9cKl
         wHc3fThq3rJEl+zNP2bEwSihrlqDr5HIZQv7kX+Rd+iNH+ypf0wiF+ohN2txUphlg3n2
         38Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697200030; x=1697804830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pv1k0D1kdZkwZuVzxDjvhu5HxgmMO77wg7lK+YiP6wY=;
        b=fhEZg+luSTYYjV/0wIotYJ9/KfGuung0I1Ox2vMoGkpk1LoVRciwHS/Cnvh+xk22dl
         8s7dgNJfsi71oFtG0FfhYGYkIAFsYacR+GzUbbnAoI0PY0o4BPdT8IT0cKlbhXqb2vVz
         HxO95z8Zl/n7PD+fUWpx1uj0+1u5G2EJRtxQEoO61eO1EZUEPJgLXp5S61zRXKGHQdSo
         d98PWVzhtN2LqZu5KSCNV8nD10V7NvXeci/G2/Txrgk+zHQ8LqLr/zO8eGIJCrbfBvm0
         ctG5QWY9oXoEQVVyu68DlQ789YWd6eOlGeHN89IY3UZxR9qXEybMea038Gt5zhFPQupm
         5AyQ==
X-Gm-Message-State: AOJu0YxyfMCwkaXYlxRPW8gFWhyNiiHvXwA8Vg7ch0jHY1B9kcxJ2M7x
	GtIIxPtcjSjGT77xBrCkALoKvEIcwuCqciFh7oPm+g==
X-Google-Smtp-Source: AGHT+IENyvC43ug6znIxkRhGl1AWpw6fugWjRbAMzreFwKB9uK2eamOhSD2Xh5Xlrhu+9dHGqdqoGg==
X-Received: by 2002:a17:903:230b:b0:1c7:3558:721a with SMTP id d11-20020a170903230b00b001c73558721amr32794249plh.58.1697200030307;
        Fri, 13 Oct 2023 05:27:10 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 1/2] xen/arm: Add macro XEN_VM_MAPPING
Date: Fri, 13 Oct 2023 20:26:57 +0800
Message-Id: <20231013122658.1270506-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231013122658.1270506-1-leo.yan@linaro.org>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen maps the virtual memory space starting from L0 slot 4, so it's open
coded for macros with the offset '4'.

For more readable, add a new macro XEN_VM_MAPPING which defines the
start slot for Xen virtual memory mapping, and all virtual memory
regions are defined based on it.

Acked-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 xen/arch/arm/include/asm/mmu/layout.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
index da6be276ac..2cb2382fbf 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -49,11 +49,14 @@
 #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
 #else
 
+#define IDENTITY_MAPPING_AREA_NR_L0     4
+#define XEN_VM_MAPPING                  SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
+
 #define SLOT0_ENTRY_BITS  39
 #define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
 #define SLOT0_ENTRY_SIZE  SLOT0(1)
 
-#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
+#define XEN_VIRT_START          (XEN_VM_MAPPING + _AT(vaddr_t, MB(2)))
 #endif
 
 /*
@@ -116,12 +119,10 @@
 
 #else /* ARM_64 */
 
-#define IDENTITY_MAPPING_AREA_NR_L0  4
-
-#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
+#define VMAP_VIRT_START  (XEN_VM_MAPPING + GB(1))
 #define VMAP_VIRT_SIZE   GB(1)
 
-#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
+#define FRAMETABLE_VIRT_START  (XEN_VM_MAPPING + GB(32))
 #define FRAMETABLE_SIZE        GB(32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
 
-- 
2.39.2


