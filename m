Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB170BD6C
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 14:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537880.837490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14V4-0000rW-Eo; Mon, 22 May 2023 12:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537880.837490; Mon, 22 May 2023 12:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14V4-0000oc-A7; Mon, 22 May 2023 12:18:54 +0000
Received: by outflank-mailman (input) for mailman id 537880;
 Mon, 22 May 2023 12:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae2Q=BL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q14V3-0000XN-9w
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 12:18:53 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d066bf48-f89a-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 14:18:52 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f24cfb8539so6872379e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 05:18:52 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b004f26aabbd6asm961120lft.130.2023.05.22.05.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 05:18:51 -0700 (PDT)
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
X-Inumbo-ID: d066bf48-f89a-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757932; x=1687349932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oF4lEFlSEg4FP4lOEdxDr5KveUkUc0Imo2+IXVhgnpQ=;
        b=Byug/q2nDyLWIoYBDupLy3OAHC11HvZNaXt2FaPW8qNcRyOsI7Q0AaA4ol7xksR8j5
         Ctpb8o2DiOcaeXETarfL3obdWCbvdqpiwKBR8GlkkUGhieekkArztHqH5GBFWG4TetdR
         PjPoQ4bh4xp43680n0s4u17C5c7xgGVrpRmuaE4dce6kyYE0eP9TQl6Buyw3RseVTDsh
         fkIlcVP1RnqG+r6pzG9aD0V6fbG7yzj85Ctj+0xClJKXgkvUaEbEBRNA3IckrfGBNrTE
         WkAnI8x5M7etGOkMR8trE8y/bUrrxVCSaVI4fXbZe1CQVI8T0zLh9QgJNtaJxqEl5zd7
         eyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757932; x=1687349932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oF4lEFlSEg4FP4lOEdxDr5KveUkUc0Imo2+IXVhgnpQ=;
        b=gkauuUvKzaWsyFMq/hRZAROCVdXBRJtoAsavTVqnrHSFTRkY9ONAI8ckhXdThQB0ez
         PyxRmfph+igO8y8PbfoR1mbfuxtWnUX+nM+VyXAKcBucbPeMmpgQz/9B8VLRso2J6YbG
         zPUx2eFdzYQf6aCG0PRcH/jJz1aPmn8emQAA7EaWK9RquW8k5791+oEsshzr80V8z7Ij
         sN6P57LVI6+J5y0ui42Nu3luvGv9s6gy+i6HIvPm4+psqT0IHB/3Lpen2utxNqReUt5J
         YVNx0wL+qVtdDRFeQIMNCieC2aW1fiXPrxvKSdBOE/mCgNMYGFcWmu4+c2bKbEduMHCl
         GLRg==
X-Gm-Message-State: AC+VfDwxhcXWgB9e6bk/JjgbTKGxXmtmeYHwuWCfuJk4flZPIeNlCpJp
	h4plp9xowWFjLGRWcgoSwD24BxAP+xk=
X-Google-Smtp-Source: ACHHUZ5TLR5qX4b4bfMAxnISRjnfAd4baqbpopMx3qnZL3oFyk6iq6XcDsDF051LseoD+ZwKsYn/eg==
X-Received: by 2002:ac2:544e:0:b0:4e9:bf52:7898 with SMTP id d14-20020ac2544e000000b004e9bf527898mr3313294lfn.37.1684757931666;
        Mon, 22 May 2023 05:18:51 -0700 (PDT)
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
Subject: [PATCH v8 3/5] xen/riscv: align __bss_start
Date: Mon, 22 May 2023 15:18:44 +0300
Message-Id: <ef1cfab8bc658c4701833c55af3cf1d4d9a02e68.1684757267.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1684757267.git.oleksii.kurochko@gmail.com>
References: <cover.1684757267.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bss clear cycle requires proper alignment of __bss_start.

ALIGN(PAGE_SIZE) before "*(.bss.page_aligned)" in xen.lds.S
was removed as any contribution to "*(.bss.page_aligned)" have to
specify proper aligntment themselves.

Fixes: cfa0409f7cbb ("xen/riscv: initialize .bss section")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V8:
 * Remove ". = ALIGN(PAGE_SIZE);" before "*(.bss.page_aligned)" in
   vmlinux.lds.S file as any contribution to .bss.page_aligned have to specify
   proper alignment themselves.
 * Add "Fixes: cfa0409f7cbb ("xen/riscv: initialize .bss section")" to
   the commit message
 * Add "Reviewed-by: Jan Beulich <jbeulich@suse.com>" to the commit message
---
Changes in V7:
 * the patch was introduced in the current patch series.
---
 xen/arch/riscv/xen.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index fe475d096d..df71d31e17 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -137,9 +137,9 @@ SECTIONS
     __init_end = .;
 
     .bss : {                     /* BSS */
+        . = ALIGN(POINTER_ALIGN);
         __bss_start = .;
         *(.bss.stack_aligned)
-        . = ALIGN(PAGE_SIZE);
         *(.bss.page_aligned)
         . = ALIGN(PAGE_SIZE);
         __per_cpu_start = .;
-- 
2.40.1


