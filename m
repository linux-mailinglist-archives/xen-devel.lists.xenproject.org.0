Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D798C5C2D
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 22:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721733.1125384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yao-00048M-8j; Tue, 14 May 2024 20:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721733.1125384; Tue, 14 May 2024 20:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yao-00046j-5d; Tue, 14 May 2024 20:17:46 +0000
Received: by outflank-mailman (input) for mailman id 721733;
 Tue, 14 May 2024 20:17:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMtz=MR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s6yan-0002pZ-2K
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 20:17:45 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05323461-122f-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 22:17:43 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41fd5dc0480so38210245e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 13:17:43 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fe9599294sm69564455e9.1.2024.05.14.13.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 13:17:40 -0700 (PDT)
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
X-Inumbo-ID: 05323461-122f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715717862; x=1716322662; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiprdCUaZ8IPJ2HAIHBPs+piSKbOcZYN0PLf+5sc450=;
        b=k9unhmmTPO3p28/dnEDtn1vC/ltlQJxpdKiYl7iY4uz4VG7mJp/icIuwcK0JxNEz4w
         yqxUsGiQj5CmX8nnWrNGioYdYfeIR5nIB7r1Vlu0sjVihXeu2xgv3xxqzlD/xODuk31Y
         L3QXA0vjvc1fc3TLhL9F1wVMc4WJ0A7eyQmvJcIoJOYQI3SqG92iUknKBc0DX1HIIwmD
         p6kRkSCIGqesR+Q/TR4zQeVFuNMsQ6L475jTvT2KkumAjJ1CnNlC35PhgoWld1g1Ly9y
         GLlYK8BsivE1CkLsgcgftEHwbDBP8cwHcaRGjEftGfZHZN1adVssMFZOOA7/wGerXFBf
         7cWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717862; x=1716322662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiprdCUaZ8IPJ2HAIHBPs+piSKbOcZYN0PLf+5sc450=;
        b=ByzVUxFsNqGd1I6fRAP4946mEr9LdA2f7SzE9PZ19CXWRyblylf1AVMVABFjTVTqq+
         RWyYUxpGsCvZQQ9aptHjmZnZ9FT0m7BL1kv0OiaODkXtM6vUhfO3z+qzbWk2YAwdiiN2
         dnV0N5lTwmCPwi+ANXd5UIeeYfzFBdeLgMKnDXvHtWNxYglsIXs9DrZ7h5H7RDHHkHCF
         ik4YrUJsTuPmaMTBhB0fUS+r7k8R3D5Vbw6I3eeorczCzf1DvW4BtP2nk7ZJJl+RLDqL
         xU9Sj5cCpPMe4ThzOqZhUsFUY0d6epfpyLqy4geSA4jB4n2FKufPmfNAHaT1p/fr+Tjn
         5+bw==
X-Gm-Message-State: AOJu0Yw9PmcsxfEvewpVufibMeWBu9nQDlZOI5pQSat8nXOKwEcQ25Rv
	iMcw67YEqr7bJrYC2j03Ro3O2lIJ76lxRf1ASaZ6ol1fZyeDa5Ep5gxI3mdhu1g=
X-Google-Smtp-Source: AGHT+IEgatADuwMOnHbGVnd50bJVk3aJQ122Wq/nW+vPJftub6+X/YV1Ttxp9uUzAs9H5gXfHezQ9w==
X-Received: by 2002:a05:600c:3548:b0:41a:9a6a:41e1 with SMTP id 5b1f17b1804b1-41feac5a3c3mr88789995e9.29.1715717862394;
        Tue, 14 May 2024 13:17:42 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v4 5/9] xen/arm64: debug: Add missing code symbol annotations
Date: Sat,  4 May 2024 13:55:10 +0200
Message-Id: <20240504115514.1063509-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
References: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols
and add missing annotations.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/arm64/debug.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/debug.S b/xen/arch/arm/arm64/debug.S
index 71cad9d762..c3d02c33d7 100644
--- a/xen/arch/arm/arm64/debug.S
+++ b/xen/arch/arm/arm64/debug.S
@@ -27,17 +27,19 @@
  * Print a character on the UART - this function is called by C
  * x0: character to print
  */
-GLOBAL(early_putch)
+FUNC(early_putch)
         ldr   x15, =EARLY_UART_VIRTUAL_ADDRESS
         early_uart_ready x15, 1
         early_uart_transmit x15, w0
         ret
+END(early_putch)
 
 /* Flush the UART - this function is called by C */
-GLOBAL(early_flush)
+FUNC(early_flush)
         ldr   x15, =EARLY_UART_VIRTUAL_ADDRESS  /* x15 := VA UART base address */
         early_uart_ready x15, 1
         ret
+END(early_flush)
 
 /*
  * Local variables:
-- 
2.40.1


