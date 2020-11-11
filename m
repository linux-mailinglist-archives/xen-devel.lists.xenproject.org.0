Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD6D2AFAD7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25300.53009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy3D-0006Xs-5V; Wed, 11 Nov 2020 21:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25300.53009; Wed, 11 Nov 2020 21:53:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy3C-0006Wo-VN; Wed, 11 Nov 2020 21:53:10 +0000
Received: by outflank-mailman (input) for mailman id 25300;
 Wed, 11 Nov 2020 21:53:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy3B-00064v-PU
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:09 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61dd892c-4a6a-4f81-9b53-1d30211448c1;
 Wed, 11 Nov 2020 21:52:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j7so3995880wrp.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:48 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:46 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy3B-00064v-PU
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:09 +0000
X-Inumbo-ID: 61dd892c-4a6a-4f81-9b53-1d30211448c1
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 61dd892c-4a6a-4f81-9b53-1d30211448c1;
	Wed, 11 Nov 2020 21:52:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j7so3995880wrp.3
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lKBI14xArPA18L2e3mixfdhgDGBWzfLh6HwsMuwD7s4=;
        b=CBI9vPn64FgxZuhJIGgbZ3efbwKrz8NpUktTKCWRjraau29LdgEClES3irHVLpGUm1
         PH9SNGgWKskLHy7zAA2Kjx+f91g2KNDKIDtuiqP8qYLuKzShz0dT4Q7vUS6NTcODUEd7
         y874QrlFnnZ977xY7QVX3xrXv2FmvnYODQDijgqFBj4uX6Y+NmZDL5u6L3ZAD/U6IsY9
         +H0KpYzeFk7jMdwO45yQ32wFe+Zf+kflZxzBEAgMhgQLaUuCe4HiNiCr45HiOVJGR4IC
         ECH4u/Huk+/B1zRTwJk6af7hrBZIkXcam1P2jnhORqvMqz+WsdK4uiow7aPmlQ/hJ/6t
         VymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lKBI14xArPA18L2e3mixfdhgDGBWzfLh6HwsMuwD7s4=;
        b=sewc1Z+wtYJqdyUkZL5kMdzjyeDKYvVKxXvx5wEjcMDG2R/RSz+6RJsnabvwTHup5m
         YkvPaVkg84LEU6viguu4IIa/wHNWBAteetAQtDVyggvRu+93GPQ9OAyGzyjQv5MTECxb
         Es9YZxyfWl42XDVJbQKoJv2QcHnkFOU3Wog2mcOeGD5qSSSdM7fnPUBRnvf+crJCip0C
         OdVhnrwwpai7iNej2ARykg3KzJt3L2dzhwnGpjbEdkGDPGDlJtwDCGmC/JsJaWh/3QlS
         WPqth4cKVd8S1WqnFA+7OORnMfO7C2SRPnVwr4Yocls3cXYP3kyPyp3KcaGWYTcBX49P
         StlA==
X-Gm-Message-State: AOAM531HR7nC/Lc1eWMWVpiO13FmQkwIoPcFag3wAa07K+W7W1XwYuwO
	txTW4f9Qrur1Yn9e2gEyPcdAuogRjug=
X-Google-Smtp-Source: ABdhPJy/UaGSodvWycXJfP8lDDsD6AfWRUcQrVgiracEK6FwIOITn2EXSSWznnSwQQjRw7T4lAgMzA==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr29024528wrm.380.1605131567174;
        Wed, 11 Nov 2020 13:52:47 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:46 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 07/15] xen/arm: prepare existing Xen headers for Linux atomics
Date: Wed, 11 Nov 2020 21:51:55 +0000
Message-Id: <20201111215203.80336-8-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

This small patch helps prepare <asm-arm/atomic.h> and the arm32/arm64
specific system.h headers to play nicely with the Linux atomics helpers:

 - We don't need the indirection around atomic_add_unless() anymore so
   let's just pull up the old Xen arm64 definition into here and use it
   for both arm32 and arm64.

 - We don't need an atomic_xchg() in <asm-arm/atomic.h> as the arm32/arm64
   specific cmpxchg.h from Linux defines it for us.

 - We drop the includes of <asm/system.h> and <xen/prefetch.h> from
   <asm-arm/atomic.h> as they're not needed.

 - We swap out the include of the arm32/arm64 specific cmpxchg.h in the
   arm32/arm64 specific system.h and instead make them include atomic.h;
   this works around build issues from cmpxchg.h trying to use the
   __ll_sc_lse_body() macro before it's ready.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm32/system.h |  2 +-
 xen/include/asm-arm/arm64/system.h |  2 +-
 xen/include/asm-arm/atomic.h       | 15 +++++++++++----
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/xen/include/asm-arm/arm32/system.h b/xen/include/asm-arm/arm32/system.h
index ab57abfbc5..88798d11db 100644
--- a/xen/include/asm-arm/arm32/system.h
+++ b/xen/include/asm-arm/arm32/system.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_ARM32_SYSTEM_H
 #define __ASM_ARM32_SYSTEM_H
 
-#include <asm/arm32/cmpxchg.h>
+#include <asm/atomic.h>
 
 #define local_irq_disable() asm volatile ( "cpsid i @ local_irq_disable\n" : : : "cc" )
 #define local_irq_enable()  asm volatile ( "cpsie i @ local_irq_enable\n" : : : "cc" )
diff --git a/xen/include/asm-arm/arm64/system.h b/xen/include/asm-arm/arm64/system.h
index 2e36573ac6..dfbbe4b87d 100644
--- a/xen/include/asm-arm/arm64/system.h
+++ b/xen/include/asm-arm/arm64/system.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_ARM64_SYSTEM_H
 #define __ASM_ARM64_SYSTEM_H
 
-#include <asm/arm64/cmpxchg.h>
+#include <asm/atomic.h>
 
 /* Uses uimm4 as a bitmask to select the clearing of one or more of
  * the DAIF exception mask bits:
diff --git a/xen/include/asm-arm/atomic.h b/xen/include/asm-arm/atomic.h
index ac2798d095..866f54d03c 100644
--- a/xen/include/asm-arm/atomic.h
+++ b/xen/include/asm-arm/atomic.h
@@ -2,8 +2,6 @@
 #define __ARCH_ARM_ATOMIC__
 
 #include <xen/atomic.h>
-#include <xen/prefetch.h>
-#include <asm/system.h>
 
 #define build_atomic_read(name, size, width, type) \
 static inline type name(const volatile type *addr) \
@@ -220,10 +218,19 @@ static inline int atomic_add_negative(int i, atomic_t *v)
 
 static inline int atomic_add_unless(atomic_t *v, int a, int u)
 {
-    return __atomic_add_unless(v, a, u);
+	int c, old;
+
+	c = atomic_read(v);
+	while (c != u && (old = atomic_cmpxchg((v), c, c + a)) != c)
+		c = old;
+
+	return c;
 }
 
-#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
+static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
+{
+	return cmpxchg(&((v)->counter), (old), (new));
+}
 
 #endif /* __ARCH_ARM_ATOMIC__ */
 /*
-- 
2.24.3 (Apple Git-128)


