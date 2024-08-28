Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF5396345A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785164.1194576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQll-0006LU-AG; Wed, 28 Aug 2024 22:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785164.1194576; Wed, 28 Aug 2024 22:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQll-0006Fq-38; Wed, 28 Aug 2024 22:04:01 +0000
Received: by outflank-mailman (input) for mailman id 785164;
 Wed, 28 Aug 2024 22:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQlj-0006E0-Ig
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:03:59 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cff8213-6589-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 00:03:58 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5bf0261f162so8588209a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:03:58 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:03:56 -0700 (PDT)
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
X-Inumbo-ID: 6cff8213-6589-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882637; x=1725487437; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiSYv9zaENNOFB/jb2t7LrfrF1ZHW6+ZFjjQ3yb40Ek=;
        b=LMPUC3MnPKJV7324noSpfQG0pAxQKQJhuYPfYeJ31TavdAs7Jxa2pqenUnBGyaS3sb
         ok8QdClTdQoSjGELTwaWPNNAfmPxmvWrhnGGsE3rapP06R4DMySkSsdlvGsa87nUFjY0
         UWRuoEBRNslNz1NcTjJTcYbKTXnsdNpresrbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882637; x=1725487437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiSYv9zaENNOFB/jb2t7LrfrF1ZHW6+ZFjjQ3yb40Ek=;
        b=Km9tPHpJv1nzLDzy4wc1QXFEO1AxW3lYYsARG7k6rUzhMfSoajRsbzsXYvLY0Fz2ad
         ltxZhfky9hZMprmCkmO8K2Q5yH5FY84T0S7ZuhctJyDXIexSwPz+CZL1X1RgcsO/ZeVz
         BpX6QNwlZfWxQqlHMuvHbIk9YtF1NtSNpbFJ4pxwVNmfKMeIs/kWUUcsveGhhK9Rtvq6
         ZGphpN2RnRuUIE3Us6MzRXHJcZP7LnzV8S7C+uR4/gGWm6+NVcxHdIAFn+UbzzUWq4/l
         BjzpIRdkPZ/J2WOmKUVqUOsThpFI5s2Vy8OdyS3QewMhYOUb7vloCqfKfJLDC7tlo+pH
         wPxg==
X-Gm-Message-State: AOJu0YwM6aSQo45fcKnidNEIdmXdPhr2YcPkeFInuzPKRhVrLZaJpugt
	3fpuq1kxoCDP4LB0BSSNfU38DEKS8S2OeKwqR0ZFwctsEHJxciGEGk+8Y6T/amitum61EZHUD8m
	d
X-Google-Smtp-Source: AGHT+IEtdemzdGxMgWOSMC2OOmCx1wf030Xl+NsCnh9UAs1rIvfUrQcYgpBhIgnas5MaVAkOPz96nA==
X-Received: by 2002:a05:6402:518e:b0:5c0:bba6:860e with SMTP id 4fb4d7f45d1cf-5c21ed52c4dmr755306a12.18.1724882637093;
        Wed, 28 Aug 2024 15:03:57 -0700 (PDT)
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
Subject: [PATCH v2 02/11] xen/bitops: Switch from __pure to attr_const
Date: Wed, 28 Aug 2024 23:03:42 +0100
Message-Id: <20240828220351.2686408-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All of the ffs()/fls() infrastructure is in fact (attr) const, because it
doesn't even read global state.  This allows the compiler even more
flexibility to optimise.

No functional change.

Reported-by: Jan Beulich <JBeulich@suse.com>
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

v2:
 * New
---
 xen/include/xen/bitops.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 1cd43e464d9e..94af6da18b9b 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -32,8 +32,8 @@ extern void __bitop_bad_size(void);
  *
  * Bits are labelled from 1.  Returns 0 if given 0.
  */
-unsigned int __pure generic_ffsl(unsigned long x);
-unsigned int __pure generic_flsl(unsigned long x);
+unsigned int attr_const generic_ffsl(unsigned long x);
+unsigned int attr_const generic_flsl(unsigned long x);
 
 /**
  * generic__test_and_set_bit - Set a bit and return its old value
@@ -204,7 +204,7 @@ static always_inline bool test_bit(int nr, const volatile void *addr)
     test_bit(nr, addr);                                 \
 })
 
-static always_inline __pure unsigned int ffs(unsigned int x)
+static always_inline attr_const unsigned int ffs(unsigned int x)
 {
     if ( __builtin_constant_p(x) )
         return __builtin_ffs(x);
@@ -216,7 +216,7 @@ static always_inline __pure unsigned int ffs(unsigned int x)
 #endif
 }
 
-static always_inline __pure unsigned int ffsl(unsigned long x)
+static always_inline attr_const unsigned int ffsl(unsigned long x)
 {
     if ( __builtin_constant_p(x) )
         return __builtin_ffsl(x);
@@ -228,7 +228,7 @@ static always_inline __pure unsigned int ffsl(unsigned long x)
 #endif
 }
 
-static always_inline __pure unsigned int ffs64(uint64_t x)
+static always_inline attr_const unsigned int ffs64(uint64_t x)
 {
     if ( BITS_PER_LONG == 64 )
         return ffsl(x);
@@ -246,7 +246,7 @@ static always_inline __pure unsigned int ffs64(uint64_t x)
      sizeof(x) <= sizeof(uint64_t) ? ffs64(x) :         \
      ({ BUILD_ERROR("ffs_g() Bad input type"); 0; }))
 
-static always_inline __pure unsigned int fls(unsigned int x)
+static always_inline attr_const unsigned int fls(unsigned int x)
 {
     if ( __builtin_constant_p(x) )
         return x ? 32 - __builtin_clz(x) : 0;
@@ -258,7 +258,7 @@ static always_inline __pure unsigned int fls(unsigned int x)
 #endif
 }
 
-static always_inline __pure unsigned int flsl(unsigned long x)
+static always_inline attr_const unsigned int flsl(unsigned long x)
 {
     if ( __builtin_constant_p(x) )
         return x ? BITS_PER_LONG - __builtin_clzl(x) : 0;
@@ -270,7 +270,7 @@ static always_inline __pure unsigned int flsl(unsigned long x)
 #endif
 }
 
-static always_inline __pure unsigned int fls64(uint64_t x)
+static always_inline attr_const unsigned int fls64(uint64_t x)
 {
     if ( BITS_PER_LONG == 64 )
         return flsl(x);
-- 
2.39.2


