Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF49E963458
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785171.1194646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlt-0008DY-MJ; Wed, 28 Aug 2024 22:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785171.1194646; Wed, 28 Aug 2024 22:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlt-00086B-HS; Wed, 28 Aug 2024 22:04:09 +0000
Received: by outflank-mailman (input) for mailman id 785171;
 Wed, 28 Aug 2024 22:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQlr-0006E0-Oz
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:04:07 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 723a1c2b-6589-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 00:04:07 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f4f8742138so66205671fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:04:07 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:04:04 -0700 (PDT)
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
X-Inumbo-ID: 723a1c2b-6589-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882646; x=1725487446; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wEH6spuDcWI9g3H1/wKwZf6UslM/CRGIF6MqUG9Fo4=;
        b=SYh+VbLbtd+UcTE5IWCL1WUQ/K70VLsSZcyt75G1gXMwWAG9916peHIG8rr1KgmqM2
         rpm7FNtH3X5P/w3uJlp5RyUl+KvgPTE1G6OfLlqmAjIjm0JgV2S7RbVNwmyxhJu9RclS
         DkPiiiPNruOXnjluUbjL3da+NAqdCpIuTRe2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882646; x=1725487446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wEH6spuDcWI9g3H1/wKwZf6UslM/CRGIF6MqUG9Fo4=;
        b=XvI65YU1qZG3QHaF8z7dcqEJhu+ePEy4a0TJSoYZi0eamiTP3EpXEKknB5pOT1ql2b
         mZ3Td/cdD8z7RVynU6ZkS9D+GU2fC4aDDTaxtTncWFt56iDnKSqol9laBEhqWKvp0xQD
         vd1lG61N+D7xoBufahTObrx26JHi3D68KG8VqJSNmXidfc0yH9dDC3Puk7t566SQRYdo
         xSHDs9TQbUiWmtOTD7q2jc/+25pYEITkz9lHkyIrOs8LI1AuYCU6rxsW/7laxT/ca+UP
         3q738UjiI3j5u0c/1lDaYTsuk5gC6PoJ1C6qErgEiv47Usiq+N1u5C6oh/7tFuyyPr4M
         /ZZA==
X-Gm-Message-State: AOJu0YxoBP+I3BMYYsk2c6h1JLUO9v5oFwV0v9WZCTOLE30b2iyV4Fv5
	lnSiFkNW44atpEIzPnU0Yec0TTp2EzTGYwi6ksVtjVTDalAQfpRp5cMZ8EASTvYFf0b4E4CTmiD
	r
X-Google-Smtp-Source: AGHT+IE5UtUMGD1wRggXBe+xzppDvxCyJEivzUcLNMKfgMxac6dmJDS5xX3A4MiKzTBV/xGdZyLdlw==
X-Received: by 2002:a05:651c:19ac:b0:2ef:2247:987b with SMTP id 38308e7fff4ca-2f6108908d2mr6546591fa.32.1724882645193;
        Wed, 28 Aug 2024 15:04:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 08/11] xen/bitops: Drop hweight_long() and use hweightl()
Date: Wed, 28 Aug 2024 23:03:48 +0100
Message-Id: <20240828220351.2686408-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
 xen/common/bitmap.c      | 4 ++--
 xen/include/xen/bitops.h | 5 -----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 9d9ff09f3dde..3da63a32a680 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -191,10 +191,10 @@ unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int bits)
 	unsigned int k, w = 0, lim = bits / BITS_PER_LONG;
 
 	for (k = 0; k < lim; k++)
-		w += hweight_long(bitmap[k]);
+		w += hweightl(bitmap[k]);
 
 	if (bits % BITS_PER_LONG)
-		w += hweight_long(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
+		w += hweightl(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
 
 	return w;
 }
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 96dfe0f2c71a..58c600155f7e 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -431,11 +431,6 @@ static inline unsigned int generic_hweight64(uint64_t w)
     return (w + (w >> 32)) & 0xFF;
 }
 
-static inline unsigned int hweight_long(unsigned long w)
-{
-    return sizeof(w) == 4 ? generic_hweight32(w) : generic_hweight64(w);
-}
-
 /*
  * rol32 - rotate a 32-bit value left
  *
-- 
2.39.2


