Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C215896C0C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700408.1093588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjV-0003dG-Sx; Wed, 03 Apr 2024 10:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700408.1093588; Wed, 03 Apr 2024 10:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjV-0003Xz-Lk; Wed, 03 Apr 2024 10:20:41 +0000
Received: by outflank-mailman (input) for mailman id 700408;
 Wed, 03 Apr 2024 10:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjT-0007Ql-7i
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:39 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1283e10-f1a3-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 12:20:38 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-513d23be0b6so6716236e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:38 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:37 -0700 (PDT)
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
X-Inumbo-ID: d1283e10-f1a3-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139638; x=1712744438; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uIerHkh9A9c5ske6Nc8FntObOiI9Swd+Fna5hAuyNg=;
        b=YDTCer0kRP/4zEULk+UEXHvsD33dsJFiUf8V/d+B8usCBGapQnerUG1Tldf7oh2J7z
         Hv0xXWVpCUwURK44+9anYobL2jen3MuTV+37l6H1nOqydW06kbqu6TNvuNXf/oUAdG+h
         aZW+1UsVeT5pg/uxfX/FrXjnFT72zSCD36Te0cG9bi1vBUuMALEVCwJTQ8Aw/yOEBRFB
         gf0BOxyuN28PGx0XH7+gE16IUHSlJ92jryIkcaJsqirxbKo/NCp6Fk41cGXsEtGdCoDC
         OITZqrbMFdTBajTy6U4IkLU0Nr3JP7EdWHIG3YvPG1iTeqoZ/uwBaXDbeQKsX+25WATI
         c5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139638; x=1712744438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uIerHkh9A9c5ske6Nc8FntObOiI9Swd+Fna5hAuyNg=;
        b=FIafgRyQb81XWnHkljxN6Be2ZNAte/BP/ZI1x+/FyVWueXCKS5VKkqqUVudCZto8Qc
         dbRuwZkOFEu7/53MrdSLe7dq+Ofz7+x1PRSX7lOdfRrvNmwn8U30nl6F9M4P+K7NB0hO
         O83hib7CIzBhZh/5ZctqoB/NgkFVOjhLpai9U7HrVqq+DnAvKc6u0ktOFgJtCl/WXw5t
         uFmaOcHbaX9CSR4XU/tlxF1XlQJtlfo9iXYlURa5VqxHspPKqWs235od1X3wSAC9WgYe
         9ozIJd+T39hBelHoWrb0K0qfnu/R2Bfbhj4RVgZ/2z6xMEkeMoTxcLORJ+ny5FalRg+n
         OUQw==
X-Gm-Message-State: AOJu0YzmkZ0NBOpoxqCFAEK96PK1PF2rmSq+eKJ+vey2JhE6zimRghGA
	qttp0gO/qGPhhVhd7SvdK+QokclUK61cNK5jnadh6O6/hnvQOCU9nemEafz6
X-Google-Smtp-Source: AGHT+IEdR4O/b27hy5U2edMxTsPPem8gnsj79y60DBp7900vWv8tAA5iRg5YqfgHct+76zSIpe2oAA==
X-Received: by 2002:a05:6512:e96:b0:513:cdff:d765 with SMTP id bi22-20020a0565120e9600b00513cdffd765mr16965612lfb.59.1712139637968;
        Wed, 03 Apr 2024 03:20:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 19/19] xen/README: add compiler and binutils versions for RISC-V64
Date: Wed,  3 Apr 2024 12:20:12 +0200
Message-ID: <8c1787554dd79e7beffce44d8d6467343e5ca830.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch doesn't represent a strict lower bound for GCC and
GNU Binutils; rather, these versions are specifically employed by
the Xen RISC-V container and are anticipated to undergo continuous
testing. Older GCC and GNU Binutils would work,
but this is not a guarantee.

While it is feasible to utilize Clang, it's important to note that,
currently, there is no Xen RISC-V CI job in place to verify the
seamless functioning of the build with Clang.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5-V7:
 - Nothing changed. Only rebase.
---
 Changes in V6:
  - update the message in README.
---
 Changes in V5:
  - update the commit message and README file with additional explanation about GCC and
    GNU Binutils version. Additionally, it was added information about Clang.
---
 Changes in V4:
  - Update version of GCC (12.2) and GNU Binutils (2.39) to the version
    which are in Xen's contrainter for RISC-V
---
 Changes in V3:
  - new patch
---
 README | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/README b/README
index c8a108449e..30da5ff9c0 100644
--- a/README
+++ b/README
@@ -48,6 +48,10 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
+          Older GCC and GNU Binutils would work, but this is not a guarantee.
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.43.0


