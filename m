Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61FB0BFAE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051219.1419524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmUX-0005hq-1B; Mon, 21 Jul 2025 09:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051219.1419524; Mon, 21 Jul 2025 09:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmUW-0005gI-U6; Mon, 21 Jul 2025 09:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1051219;
 Mon, 21 Jul 2025 09:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j1p=2C=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1udmUV-0005SY-EA
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:07:23 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cc1923f-6612-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 11:07:22 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-451d54214adso28701065e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 02:07:22 -0700 (PDT)
Received: from localhost.localdomain (111.142.125.91.dyn.plus.net.
 [91.125.142.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f4289sm153796045e9.7.2025.07.21.02.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 02:07:21 -0700 (PDT)
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
X-Inumbo-ID: 1cc1923f-6612-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753088842; x=1753693642; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXcxA/OVyESwNEAQmGhSTUsFA7SU5z4DTDyl667BtGs=;
        b=D4zV4jylIljxMp+MR27tq7lJ06uval2fulLTizwcDBSiuZy8E0Oa6XQXH7pMMmNXho
         9smw4dUbxEdCPrRJ/nfdoAWUIe0Ifc6km6HHGUAxlYI7r5qyDw7JSnaUd0xz7MzIp1ka
         bYBlzOmGXlKXBmrRTQ8MvAlu8bAkIM1OsjwzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753088842; x=1753693642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXcxA/OVyESwNEAQmGhSTUsFA7SU5z4DTDyl667BtGs=;
        b=EmZH9tbM+GvnA/d89Y2bduCkN1kOK0umSOPAhvNOXWNwOvLhV78OJ0tV2Z4QXUzCFR
         PapAtMiy12KepL6uD8+QJKLYEVHC5YB/yqLEM+wmLggDS6GeIsKpLD1D2PPdwJIg4IRp
         FoADtr/rGY/mpXeh8S3lH8MiFpLmVN2oda2IDxn5rzJbbXAKiplCjFcRjdw3d1IGerKL
         EP8bK6wLpZbgJzvDxaVfVeh8D9SUwT4D8P9D8q3fOEjMpD7qGpxZi89IC2d8QoZn5yOZ
         RknQEp/NG5hlG8hSUUfRPs8VmLm9CzqJ40pM851R/b2Grb6MonjFy6Tntpkgjt4hEjuG
         MLtw==
X-Gm-Message-State: AOJu0YyyOeEDyIgALLM5A+Wg4InhHoz6zCMW9BPSAZADNiiZwywV5bsl
	rfzLrLRguenuD7Lzz6Y2YBqksS465PNVhFUlfTohBl9+qxeAbCuyhYVntpSPwdRHhWdQBjJKT13
	6Dxlqyz0=
X-Gm-Gg: ASbGncst+8nGdBRZuNDUMixnJzjjwRieADvFiKMfjcx5ywN0BC9o0fi9p6OAXl5Qwbd
	8IZOkKlyww8yt5JTm+0BRgiIXvqkvdzrAMmYmcaoqx8VWBtwyd0edw6rz2s/CEuPszSUVD0mbEj
	1Blcxr1LlWvO63khGUv8W06Mevuug1rYvGBYajr8a8yF+wxsK2ZszO0RB+PpCFDOXj8vF/86ZCs
	RtBvgpe/Z0UyAsXB52td8pk6Ekt6Pvvv3yLTvHsV/qAGpAKWSMiuOyRNhpN8eN+0iKrcus541gJ
	Qw823uA+qMVH4Dw59jqiUJRfnorD6qZu2NALMp27rvoEWYpXEn0UVMKlpwGDBK3m9dcT8gTu88j
	T3wRp9MF8xie+Hu/bbi5M4f+iW8xWhMxZgv88iDf01faVfgrJc0r8fx8kgVD1CM+07/EvYrY=
X-Google-Smtp-Source: AGHT+IHfzHXPSzGEr9g83c1VDR26VkEC8tB4oDZzpexMel+/w9eav8WXgRXass454R8tcR6qK8ZLNg==
X-Received: by 2002:a05:600c:3d97:b0:456:2020:166a with SMTP id 5b1f17b1804b1-4563532c3bcmr124441185e9.20.1753088841984;
        Mon, 21 Jul 2025 02:07:21 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/3] xen/efi: Fix indentation
Date: Mon, 21 Jul 2025 10:07:10 +0100
Message-ID: <20250721090713.414324-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721090713.414324-1-frediano.ziglio@cloud.com>
References: <20250721090713.414324-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 4 spaces instead of 3 spaces.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/arm/efi/efi-boot.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index a2aede21d5..6323db547b 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -251,13 +251,13 @@ static EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
     int status;
     int num_rsv;
 
-   /*
-    * Delete all memory reserve map entries. When booting via UEFI,
-    * kernel will use the UEFI memory map to find reserved regions.
-    */
-   num_rsv = fdt_num_mem_rsv(fdt);
-   while ( num_rsv-- > 0 )
-       fdt_del_mem_rsv(fdt, num_rsv);
+    /*
+     * Delete all memory reserve map entries. When booting via UEFI,
+     * kernel will use the UEFI memory map to find reserved regions.
+     */
+    num_rsv = fdt_num_mem_rsv(fdt);
+    while ( num_rsv-- > 0 )
+        fdt_del_mem_rsv(fdt, num_rsv);
 
     /* Add FDT entries for EFI runtime services in chosen node. */
     node = fdt_subnode_offset(fdt, 0, "chosen");
-- 
2.43.0


