Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA9596345D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785166.1194599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQln-0006yY-OK; Wed, 28 Aug 2024 22:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785166.1194599; Wed, 28 Aug 2024 22:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQln-0006vZ-KA; Wed, 28 Aug 2024 22:04:03 +0000
Received: by outflank-mailman (input) for mailman id 785166;
 Wed, 28 Aug 2024 22:04:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQll-0006E8-Ka
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:04:01 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dd22981-6589-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 00:04:00 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5bed05c0a2fso8767537a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:04:00 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:03:57 -0700 (PDT)
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
X-Inumbo-ID: 6dd22981-6589-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882638; x=1725487438; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NylPTSK4uUZZH3htPDJReCwwETRg+F4qLCEB3OzPaac=;
        b=ZmdcLbqtqrxGpwBHHuGMX/0xYiXXcNxUmJSLJDXuLPO0qaeeAAWLBxYB2Ab4QTgKSF
         U6pDwE4ZI1gkuItnjNp12C+5LYrXoogHtniOuRbmvijZeKK1LvI7RywwQeOx7tJd4mwD
         6jEZwExQx7OTQqnXvFKhBbKwghEHNuDsM0O60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882638; x=1725487438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NylPTSK4uUZZH3htPDJReCwwETRg+F4qLCEB3OzPaac=;
        b=ZIx4TUimE3vUh6AUOokC94G5nSCwOOeYaVxsXr+r17fNDTO9Jfe5vhCTawQ8UyRqRF
         2vBDbUdHdHRDJeIQyXhsKsueSsp+Y1ItSw5XEvvBFH/vIzo9eb5gHMWP92LRKqBGdf0o
         RrEZhlPxJ+vAS4sgANYLCPjr8I10ty1rKmEnqjS0q3k1tHRvbd5xK/+hs+zkM6nSyH36
         mnyQEAgRV0vlgpZzxP0tCofnGAWE3wCXg5zA76gQu7L5dWV7RVTfVHsRrXyL9n/vX04v
         fOLPCtF2viKYYphbdduaq4TI0gY0C89mQ8z4SKXYNY50ENknlflgGuiy66lZoRvGsyvj
         VdAA==
X-Gm-Message-State: AOJu0YzBgsyInrsxITmoHZ2WuhG6iggn9YrKC+emkI5qQwnMnW3xN/4Q
	fvY7NG7qonaWgtls3011EnxyAqiGYLamkYGmO7yRjiAvcRquAsy5AyL8XkVcZ1WK5dh/yuVUtgI
	o
X-Google-Smtp-Source: AGHT+IE2eu8kKMFH5UPCGR6d+u0pnhhnKtzrehZJO4eQoOpFhy8qAaNfa1P2UR0oHN/qkBQGs1V35Q==
X-Received: by 2002:a05:6402:3705:b0:5c0:aadc:8b51 with SMTP id 4fb4d7f45d1cf-5c21ed5758emr695859a12.22.1724882638135;
        Wed, 28 Aug 2024 15:03:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 03/11] xen/bitops: Reinstate the please tidy message
Date: Wed, 28 Aug 2024 23:03:43 +0100
Message-Id: <20240828220351.2686408-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recent additions have undone prior tidying at the top of the file.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/include/xen/bitops.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 94af6da18b9b..9f0a0ce4a73b 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -204,6 +204,8 @@ static always_inline bool test_bit(int nr, const volatile void *addr)
     test_bit(nr, addr);                                 \
 })
 
+/* --------------------- Please tidy above here --------------------- */
+
 static always_inline attr_const unsigned int ffs(unsigned int x)
 {
     if ( __builtin_constant_p(x) )
-- 
2.39.2


