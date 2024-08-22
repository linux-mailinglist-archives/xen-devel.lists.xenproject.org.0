Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FE795C140
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 01:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782008.1191529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtG-0006Qq-O7; Thu, 22 Aug 2024 23:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782008.1191529; Thu, 22 Aug 2024 23:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtG-0006Kd-EX; Thu, 22 Aug 2024 23:06:50 +0000
Received: by outflank-mailman (input) for mailman id 782008;
 Thu, 22 Aug 2024 23:06:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAWf=PV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shGtE-00052v-EA
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 23:06:48 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3498bd16-60db-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 01:06:46 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a86933829dcso159480266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 16:06:46 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f21ff19sm174676866b.39.2024.08.22.16.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 16:06:45 -0700 (PDT)
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
X-Inumbo-ID: 3498bd16-60db-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724368006; x=1724972806; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AK82ekbFPxm5HGoW+WcJpZodZZU1A3OHLLprY4hQ81c=;
        b=untMoLfEqpW0n12rPuTw0k3tnYpmgvhdwRwxr4VSC23E2RZCduxzik8Uxm7EGiECOk
         RwSDu9Ej5tSkK1bFvK+esp8JDwAhMb39TgcsBjqfVfYgi4bGXala5XsniTPe3J/KtZuH
         Z7mEtn9gDEr6DYlFKE2UjIYOVKZ+hC+J/dM4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724368006; x=1724972806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AK82ekbFPxm5HGoW+WcJpZodZZU1A3OHLLprY4hQ81c=;
        b=XcISQFZfK0iPcI0u+AwyoP01G/nFbDTdS/vn3hx4qcD8lGULR7W5Q+oqSfuFgyA0i2
         RuDwDywqbV7X7jr2EJ5Qp9+wYR/aXbR8Rd/qK0st4d7RkHwg9Ja3lkmG9l42hhYWiBfk
         SwtRo/c9NBE8xTu708VS4aHnGghH0x/gco9CxBEw+YxsvRI8Y6fcL7thi6tKD0ub9tQI
         86fMpG+yoj4iMs43Ml/DR15Wd+jYeL375RkmGRIvbfr6gRCTSZ62xtDZOlwN/7AnJUCW
         x8jM1zDTuJrbKaC2hE1VfNht9I3uXJumqPfEB2exjodykjR3w3zHTNv/YeMwYeM31brM
         +9MQ==
X-Gm-Message-State: AOJu0Yy+6LMOP4xI/H6PhR4OWG3cwKweBG4BFdM+G4SgB6pJezuJxrcT
	OhIyuOjqJ2o3fEmxbvldsSJOb4GOjn6k0zbN5fKVeRf0XZZ/cuoff+lgwX/CZhP2Oqb09odcuXb
	O
X-Google-Smtp-Source: AGHT+IEYvr3ptXUw2rp6Zjt30wMYdUycUCnNCfxJnJTOh3X6pfOU4e0TztA8+zwhTK/Ff8lMCviONw==
X-Received: by 2002:a17:907:3f14:b0:a80:f6a0:9c3c with SMTP id a640c23a62f3a-a86a4eb3659mr22293866b.0.1724368005517;
        Thu, 22 Aug 2024 16:06:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 6/9] xen/bitops: Drop hweight_long() and use hweightl()
Date: Fri, 23 Aug 2024 00:06:32 +0100
Message-Id: <20240822230635.954557-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822230635.954557-1-andrew.cooper3@citrix.com>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
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
index 3aac10b7f532..11a1c9130722 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -407,11 +407,6 @@ static inline unsigned int generic_hweight64(uint64_t w)
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


