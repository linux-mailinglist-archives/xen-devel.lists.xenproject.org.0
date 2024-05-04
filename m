Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3418C5C2B
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 22:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721736.1125415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yav-0005Co-Hj; Tue, 14 May 2024 20:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721736.1125415; Tue, 14 May 2024 20:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yav-00055t-BM; Tue, 14 May 2024 20:17:53 +0000
Received: by outflank-mailman (input) for mailman id 721736;
 Tue, 14 May 2024 20:17:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMtz=MR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s6yau-0002pZ-0F
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 20:17:52 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09685cae-122f-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 22:17:50 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3504ad82a64so906570f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 13:17:50 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a781asm14391479f8f.60.2024.05.14.13.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 13:17:48 -0700 (PDT)
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
X-Inumbo-ID: 09685cae-122f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715717869; x=1716322669; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTCkkC5/83lm5FIVPOAdJc+T+IQBpLJenacee+31hfg=;
        b=S++4pqcCdiEzDfsoMSHYyD8QEbUgxmtIvG7lKcDzRD79pKr6MSTQhVmJg7tluOfW5h
         PZ6GMPSWT2fTsFFoXiALOMUzf/fejz0C7CgCIIl1lxqdWgXtOW3XUULOH4+vtcWnjVQp
         o6WyPz/jqV7WTg3PTnr4AP/aYL9hrfNo2cV2WB+1GEUaPvCjbu9Kcr2tYKpMVzdxuFgO
         DlVrD0QPx5aV5RjYeAW2JheSeOGslY9NZDU56EayCaAQezVewjk41Ueyiy8rWU2ZOw9s
         PpMaWOUOWwIrJAUEdtyRZr0WwcnCVA9Nxk5xcltiZlS0+aqcqEW16u917KyFRBbCIs+P
         xH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717869; x=1716322669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTCkkC5/83lm5FIVPOAdJc+T+IQBpLJenacee+31hfg=;
        b=AM5adtUd8IilJIsjb7w19YyCNGpPjq6LjNAjsRneNBgj4FT3gawT8F36NGcd/xOHag
         Dr1Zgh6lelcklJtHUcHydX94kA/CWEIdpwOCke7HR+RtmWi6KGg8xPBjYv86TNZydlw1
         i3huyk7P7Si0iGwQ9uJKk/B2nNuIaALqRZLx/WnnAYgpLysJ/ZLq4pvXeW35KoeIChWS
         PjqLH0DZcAunCUzB5XVWgCWFHx9bcicQKFOjuRkopoYF4/bc61OmHPnRipYrwViPZWqu
         9eMdTF8G2xQw9G9SmPXqRMNP8V/kKsesE09z6QGwL8TXH/6CTfLXvEaN3sONcQR7wFp4
         CtJA==
X-Gm-Message-State: AOJu0YxKJt1jhGg8iDbVBdbnPzCO32Q2C1SZwL/r/ZslKVHh3f9qRTzM
	/35333NzRhwSVa3ZcXYxahL3cu5AKDHwto3FNyOJ7WA6IUqDolDchaIg7XDbqSo=
X-Google-Smtp-Source: AGHT+IF20G/v0oHsqh6yp0IUZm9ugRLi2VmhlB17neNBBFPDQMOljh8mtnwhP0tivXMW3PxJx7mSxw==
X-Received: by 2002:adf:f788:0:b0:349:eeaf:3a01 with SMTP id ffacd0b85a97d-3504a632de1mr8881343f8f.22.1715717869448;
        Tue, 14 May 2024 13:17:49 -0700 (PDT)
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
Subject: [PATCH v4 8/9] xen/arm64: cache: Use the generic xen/linkage.h macros
Date: Sat,  4 May 2024 13:55:13 +0200
Message-Id: <20240504115514.1063509-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
References: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/arm64/cache.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/cache.S b/xen/arch/arm/arm64/cache.S
index 9a88a2b497..66ed85f735 100644
--- a/xen/arch/arm/arm64/cache.S
+++ b/xen/arch/arm/arm64/cache.S
@@ -40,7 +40,7 @@
  *	- kaddr   - kernel address
  *	- size    - size in question
  */
-ENTRY(__flush_dcache_area)
+FUNC(__flush_dcache_area)
 	dcache_line_size x2, x3
 	add	x1, x0, x1
 	sub	x3, x2, #1
@@ -51,4 +51,4 @@ ENTRY(__flush_dcache_area)
 	b.lo	1b
 	dsb	sy
 	ret
-ENDPROC(__flush_dcache_area)
+END(__flush_dcache_area)
-- 
2.40.1


