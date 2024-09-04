Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B435D96CA9E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 00:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790819.1200601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyua-0001mg-LK; Wed, 04 Sep 2024 22:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790819.1200601; Wed, 04 Sep 2024 22:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyua-0001k9-Hs; Wed, 04 Sep 2024 22:55:40 +0000
Received: by outflank-mailman (input) for mailman id 790819;
 Wed, 04 Sep 2024 22:55:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slyuY-0001Vf-Rg
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 22:55:38 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccb00216-6b10-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 00:55:37 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a869332c2c2so230657166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 15:55:37 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a679755b3sm21546166b.146.2024.09.04.15.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 15:55:34 -0700 (PDT)
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
X-Inumbo-ID: ccb00216-6b10-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725490535; x=1726095335; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ER/nzcDu3sjSk/1iNkdxnTJbzqcB3fMPz6UFD3Jo2ug=;
        b=bxBJr6seH4uOWdo5vFYBLCSdTDQ3q2DwccjNiboDO6B9diGfbe3eS/oG9NoGQwvTIx
         FX2wFj7XSIr+N3xiy7lRyD4i6sVIfr5eqX6X9EmC84n8JDQbcwYUamXkXAMc51WJh401
         56HUuWRV7FUgfyUm42/pEBTR9rungwahy00KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490535; x=1726095335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ER/nzcDu3sjSk/1iNkdxnTJbzqcB3fMPz6UFD3Jo2ug=;
        b=qQZxlfZIDEPs17Mer73YH/ur8ivcED3uAXmxdhQkPZO1BZKj6wE1yroMXS/sSs9P5v
         5dcah6T9a49HP3YYC76b1ntanejzIj6t8qk+UaYoEFiFN9r1TBMrUhdrhS2KnUdRdGc8
         8HJmeyYSdTruE/7Q16k1/TaPI3/6PCFVM0Fxsqm07H7T9YkDPyZafLxfzTDXDLXyFx+I
         TZfpVjDuQ7joWlPZMeTUfBjo8ow7Jkn1CcwW1MBW/I0N6uFlbEo1GVbDfeYI3PxPStey
         Zq1lG/bJQDYpTiDnZ973iP6QcPz55/T0dipCoVdY0exJV9BWudJVffBhwfmsna6vCiVU
         32tg==
X-Gm-Message-State: AOJu0Yxmon2JPO3jd4ItW1EPVanfC/5UIra7LdPxVoYtrHtahVmc8vWr
	3IssOe+j8zv8UpuUxfS0jKPUZscs5SI+oFlWWY01Ne+x8RrTxr9zGdlpaGfWTakMKe4r0M14UNK
	O
X-Google-Smtp-Source: AGHT+IE4/VXycofqlBccx6nNCfkKp9M1LqLlEXieroVrw0e+qFFIciENh0zxQVjHXndQmzFX2vuL7g==
X-Received: by 2002:a17:907:608c:b0:a75:1923:eb2e with SMTP id a640c23a62f3a-a8a42fdbe75mr352212466b.14.1725490534997;
        Wed, 04 Sep 2024 15:55:34 -0700 (PDT)
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
Subject: [PATCH v3 1/5] xen/bitops: Reinstate the please tidy message
Date: Wed,  4 Sep 2024 23:55:26 +0100
Message-Id: <20240904225530.3888315-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
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
index ed6b9ccc724f..6f8e36f1c755 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -210,6 +210,8 @@ static always_inline bool test_bit(int nr, const volatile void *addr)
     test_bit(nr, addr);                                 \
 })
 
+/* --------------------- Please tidy above here --------------------- */
+
 static always_inline attr_const unsigned int ffs(unsigned int x)
 {
     if ( __builtin_constant_p(x) )
-- 
2.39.2


