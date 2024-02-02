Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68786847364
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 16:38:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675120.1050332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvcT-0005x0-7P; Fri, 02 Feb 2024 15:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675120.1050332; Fri, 02 Feb 2024 15:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvcT-0005un-4k; Fri, 02 Feb 2024 15:38:21 +0000
Received: by outflank-mailman (input) for mailman id 675120;
 Fri, 02 Feb 2024 15:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgAc=JL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVvcS-0005uf-8k
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 15:38:20 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17045854-c1e1-11ee-8a43-1f161083a0e0;
 Fri, 02 Feb 2024 16:38:19 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a36597a3104so309152966b.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2024 07:38:19 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 tk12-20020a170907c28c00b00a30e1f233b4sm981843ejc.128.2024.02.02.07.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 07:38:17 -0800 (PST)
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
X-Inumbo-ID: 17045854-c1e1-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706888298; x=1707493098; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpMzOIqZKWVm1pXLHi8lKIHS6AP3wGi+MQkb7Zs99jY=;
        b=kZOrhHHB3I6hkbaymuFvYbjjRdX/ubra9jndzYT1fqPjhhkz2fThHd4/hvQqBmh+b5
         4w0YiGzsaNEmkgV4bY2bWQwzh0z1/R+9PRwyUFWmY0BUJejw74qvmFz1jwVRvxIkrG3a
         U6beDf22yNgUADvZtHMcGXjHGgHwZZAWjzGtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706888298; x=1707493098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpMzOIqZKWVm1pXLHi8lKIHS6AP3wGi+MQkb7Zs99jY=;
        b=J8Pb6llKC3xbbO3WG2VaOI0bjrbcM0BQweQCPWnQLEnAVNv9J+4d0xgD1B37TB5NlP
         dfaoedHUlD5p/xEXFb0tcCsZuveK6FmqenK71tZLmfa8AWOzFd1rDowshPW8PI+9++kk
         CGL/mX5tOC8kk/wRKyGHfqns2lzHgTuBCu8PTwWWMuLriN1vHJZYlJn7mJuDMLrzuARZ
         qM3A2or6NkKSuiTfZmRzGLcOv2tBJ/pHdqfGLMMvp0KkRTfSQPGM+sjGFlqsIPqb3GT+
         C0Bbb5bzIJRvlfElqrjvDVrj25qOi9ZeOdsEmw910QNpF9/4UGd9T78qDMoO9psY1x3f
         lyQw==
X-Gm-Message-State: AOJu0Ywz171418A4ovhPBi3jnGAAEVxjwC8Suyrv7+l++L7mrvf1daM6
	DS8uiu/kFCm0a2sisrLVlZN9BtdC7iew1+NhIT5aS90CCWnvXrVpScjEx8AgAkKuoRjC1GVjWJT
	O
X-Google-Smtp-Source: AGHT+IGfJf/bSI18m/zGA4x9m8BNqem86Eib2UTZhpa41sPerYxWf8XUt6RUvwl6OA1BynUD8pxhsQ==
X-Received: by 2002:a17:906:58f:b0:a36:4908:1dcc with SMTP id 15-20020a170906058f00b00a3649081dccmr1776938ejn.29.1706888298225;
        Fri, 02 Feb 2024 07:38:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVvOIdB/Dz2ctg2y8kd2leNIHcHpFkI8VHvTWsnsonzPoGU3MT7CSbEP9TuxIGgCAuhUUGvD2I6dT9vrHSsfHnSYtEEvYnHwCIM0e9EreYFjkoxJ+xXz9yPxdwuPcPF7JkC+urpRMlMo+jj0hxsQLlQ96XPJByMeD4kXhaxeXjvVVi1kBblU+34NhJ3p/C5rQ==
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen/bitmap: Deduplicate __bitmap_weight() implementations
Date: Fri,  2 Feb 2024 15:38:16 +0000
Message-Id: <20240202153816.772594-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have two copies of __bitmap_weight() that differ by whether they make
hweight32() or hweight64() calls, yet we already have hweight_long() which is
the form that __bitmap_weight() wants.

Fix hweight_long() to return unsigned int like all the other hweight helpers,
and fix __bitmap_weight() to used unsigned integers.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 xen/common/bitmap.c      | 21 +++------------------
 xen/include/xen/bitops.h |  2 +-
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index c57b35f0042c..9d9ff09f3dde 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -186,33 +186,18 @@ int __bitmap_subset(const unsigned long *bitmap1,
 }
 EXPORT_SYMBOL(__bitmap_subset);
 
-#if BITS_PER_LONG == 32
 unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int bits)
 {
-	int k, w = 0, lim = bits/BITS_PER_LONG;
+	unsigned int k, w = 0, lim = bits / BITS_PER_LONG;
 
 	for (k = 0; k < lim; k++)
-		w += hweight32(bitmap[k]);
+		w += hweight_long(bitmap[k]);
 
 	if (bits % BITS_PER_LONG)
-		w += hweight32(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
+		w += hweight_long(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
 
 	return w;
 }
-#else
-unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int bits)
-{
-	int k, w = 0, lim = bits/BITS_PER_LONG;
-
-	for (k = 0; k < lim; k++)
-		w += hweight64(bitmap[k]);
-
-	if (bits % BITS_PER_LONG)
-		w += hweight64(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
-
-	return w;
-}
-#endif
 EXPORT_SYMBOL(__bitmap_weight);
 
 void __bitmap_set(unsigned long *map, unsigned int start, int len)
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index a88d45475c40..2cb7892bcca0 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -199,7 +199,7 @@ static inline unsigned int generic_hweight64(uint64_t w)
     return (w + (w >> 32)) & 0xFF;
 }
 
-static inline unsigned long hweight_long(unsigned long w)
+static inline unsigned int hweight_long(unsigned long w)
 {
     return sizeof(w) == 4 ? generic_hweight32(w) : generic_hweight64(w);
 }
-- 
2.30.2


