Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17972A6AA78
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922812.1326650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIIj-00055R-Sh; Thu, 20 Mar 2025 15:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922812.1326650; Thu, 20 Mar 2025 15:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIIj-00053N-Ni; Thu, 20 Mar 2025 15:59:21 +0000
Received: by outflank-mailman (input) for mailman id 922812;
 Thu, 20 Mar 2025 15:59:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvIIi-0004A4-Ov
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:59:20 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47d9f98a-05a4-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:59:18 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso10025615e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:59:18 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fceafacsm1851225e9.6.2025.03.20.08.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:59:17 -0700 (PDT)
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
X-Inumbo-ID: 47d9f98a-05a4-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742486358; x=1743091158; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqKr1+6WMiT6VQWQ8sqIJpeUTlqKAraO1MHdveiEfFc=;
        b=srA3nCfaTz+icGths8Bh6BMN1CngKEtQpdnCebnRbdW/VPUvzkgbL7KoffEfzi+l8f
         z+PkSWGDypRNnazg9gpUkkqLk/ejTn6ddjWPh9OHm8iEjxOd7wweNtvNRvQIs/POjprA
         pgqjvx2eChHDwVSp/34GyKxnhm2F1/rteaFPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742486358; x=1743091158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqKr1+6WMiT6VQWQ8sqIJpeUTlqKAraO1MHdveiEfFc=;
        b=wcz9kc06sWmpVMoVNxUaIhR0Fdonar6J1+pprQkR7H1nuydCUAu9B+pAivGLCDtZHJ
         SF8YCNve9t6qSoKtO6TM1W1adyh+FhfScEOXEBb6/8cVdaNC7meFwYJMwNuCwNEDlsnK
         qVsnLcqhbeN3vM8jfkP0PsiqVAt83gjggjljCESZ+6Uh7mKLK7R50JaAhEStL27jHW+O
         P25AAhIZ+iJj375SsppeYIF3YFAFamjOGbc/b/3yQTggK/9cgnXAqtw1lmFbG+MDzFTv
         UmqojOUBG+b+jyWzvKgbo+fTfipSkID2iNbw2fD5qgDeTdhdz3TwQh2uL7eeQkSiB34w
         XCDw==
X-Gm-Message-State: AOJu0YxqWUTs6d+zqt15OjrwnT3s+Acf7efLrC1SvR8bQsAhdcwRgB+1
	OoNi1U0aHyLFWf1Htn8jKHEs4mqYjN5+FwF58ZQtnVLFzEXxCLxGzCF7aHfG1MB13qTCWqE4eYb
	W
X-Gm-Gg: ASbGncvfsG/UbIOO3KkuAC3tKG/JF1IxbNPDNYKtsTlBzAuIwsfCl37T8kVJzgxA9k7
	ZsOVKtlLCZpPqOv+HPbJCkVDp2MSm7Tb7isyYV6im6CD/RAWKR/2egFuvz4sKw+K7boqjiQ9CTn
	IZlW5dSQvilGnXDmqFqvWYVqZ+B281TmyBA9Mfu5YkiawYWMiQId91WHM1RQAsONJW48sUOY6Tr
	EuTefYM9ExiIs/swWX6ASZG6C6yReG1bKiTP3RhRxCJxSei99PJayEtoVBaZEY+CzRuexlnSWKC
	KmfdkUe21hqNvAf5ToiPkTxMLIpoCUd50kd5EQdP3msrbTt3lz0TXKAe9pnf3Ocgble0lDmjb3J
	tYPL9tnBxdD6dTZ4qaA==
X-Google-Smtp-Source: AGHT+IGl7hl1J9Z6W4cQgz9a5i+9874CFR/qeNiO5UNvyybeqNmui/7cxUExbIfbQXPYDDmtCTT5Pw==
X-Received: by 2002:a05:600c:46ca:b0:43c:fee3:2bce with SMTP id 5b1f17b1804b1-43d495ab6c7mr35669675e9.26.1742486357922;
        Thu, 20 Mar 2025 08:59:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 3/3] CHANGELOG: Minimum toolchain requirements
Date: Thu, 20 Mar 2025 15:59:08 +0000
Message-Id: <20250320155908.43885-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320155908.43885-1-andrew.cooper3@citrix.com>
References: <20250320155908.43885-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 9a5919585d43..4e333e608a96 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - The minimum toolchain requirements have been increased to either:
+   - GCC 5.1 and Binutils 2.25, or
+   - Clang/LLVM 11
 
 ### Added
  - On x86:
-- 
2.39.5


