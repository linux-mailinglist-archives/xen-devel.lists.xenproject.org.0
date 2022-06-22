Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F9D554EE0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 17:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354107.581142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o424s-0007UB-NP; Wed, 22 Jun 2022 15:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354107.581142; Wed, 22 Jun 2022 15:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o424s-0007Qj-KM; Wed, 22 Jun 2022 15:15:34 +0000
Received: by outflank-mailman (input) for mailman id 354107;
 Wed, 22 Jun 2022 15:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1Wy=W5=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o424q-0007QM-M1
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 15:15:32 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28160e9e-f23e-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 17:15:31 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id g27so17227019wrb.10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 08:15:31 -0700 (PDT)
Received: from uni.. (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.googlemail.com with ESMTPSA id
 p11-20020a05600c418b00b00397342e3830sm5069392wmh.0.2022.06.22.08.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 08:15:30 -0700 (PDT)
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
X-Inumbo-ID: 28160e9e-f23e-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j2rncxPDfJaPpuQwqHGVJi9q+yld7nhIqqPjjzXvlAA=;
        b=Y6WXWKq6JB6Ih24FFqZpi407L/j+ynMtcODAEudGQsyhpQ4xZs9LcxDArl6nu7KJxD
         cu4V8cHJnMIcqPwlc4faz88K1cKtgBNdKLT4qN4kBVFzKOmTqeQnahP5HtDvMOQ/z4xY
         SYIb1z28tcbZv8AQduxuR6hfKhH575RTnEJ7BRvccnJAt68xzY5MrwjIPdgvEax0g+83
         dTUv5uMwl6DcgLd/+mNaFJBwYVfPaiLfGY+dyZnoOhi2BBTW4b+bg97rWjRBFBq8VJ6/
         S3qjU2d/pMZcWqGCHw5E0yS3QoBNQM0RzaupdZJGovHKuti0yoSsf3/dS0xZmYTaO3Y0
         RvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j2rncxPDfJaPpuQwqHGVJi9q+yld7nhIqqPjjzXvlAA=;
        b=niqsYCexZyT8igB3ksvahpbkPvRsYVHeJBlIg+G5ylkVsAGbCJMndluD4nOAeHq5Qh
         WTOkR/4Bpvy5ZXMW+MpgETRrAOk5i+bqi4DGP9FS2I9gxSSmodYVpUB4eBnxaeXb4II9
         PQLzAx15eZ6aV9E6l84R5C0m7p6hwBO+7Dyww+EubFdiieOKw1ZNpT/tjIZELziBE/0/
         kJjXr02GmnY9ITjA4oE1f1IIrjij+zTh7RTWHCRWYhXUA1QbnChsN05avhUlYxPLLFWG
         MA1OY/6mFZrrd9pJcXtxxTPrz9WQMgrJQyIyUk9dF3yvJA2IwyIIF/S9BKHPNuewe7kp
         86bw==
X-Gm-Message-State: AJIora9885cN78tFNODW0vxR88ziLDGzXm07s4aJVNYybUEbcFWIHwa+
	3etEn6HZ36JO8idGMYPY+SVZYzbv2FA=
X-Google-Smtp-Source: AGRyM1vvsdHVyLPFKyjsqyqU9fnen8tkjJvCIEEEYnvOfof3J2aQnIhmRBcGX1tPRtkNxwShGY2+1w==
X-Received: by 2002:a5d:504f:0:b0:21b:a39f:7e6f with SMTP id h15-20020a5d504f000000b0021ba39f7e6fmr1366617wrt.129.1655910930953;
        Wed, 22 Jun 2022 08:15:30 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] xen/arm: shutdown: Fix MISRA C 2012 Rule 8.4 violation
Date: Wed, 22 Jun 2022 18:15:12 +0300
Message-Id: <20220622151514.545850-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include header <xen/shutdown.h> so that the declarations of the functions
machine_halt() and machine_restart(), which have external linkage, are visible
before the function definitions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/shutdown.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
index 3dc6819d56..5550f50f61 100644
--- a/xen/arch/arm/shutdown.c
+++ b/xen/arch/arm/shutdown.c
@@ -2,6 +2,7 @@
 #include <xen/cpu.h>
 #include <xen/delay.h>
 #include <xen/lib.h>
+#include <xen/shutdown.h>
 #include <xen/smp.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
-- 
2.34.1


