Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563EB5829AE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 17:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376267.608926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGj2F-0000jW-Bu; Wed, 27 Jul 2022 15:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376267.608926; Wed, 27 Jul 2022 15:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGj2F-0000h2-8M; Wed, 27 Jul 2022 15:33:19 +0000
Received: by outflank-mailman (input) for mailman id 376267;
 Wed, 27 Jul 2022 15:33:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTNG=YA=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGj2D-0000Po-13
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 15:33:17 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f0def9f-0dc1-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 17:33:16 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id mf4so32169323ejc.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 08:33:16 -0700 (PDT)
Received: from uni.router.wind (adsl-141.176.58.226.tellas.gr.
 [176.58.226.141]) by smtp.googlemail.com with ESMTPSA id
 ev6-20020a056402540600b0043af8007e7fsm10260725edb.3.2022.07.27.08.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:33:14 -0700 (PDT)
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
X-Inumbo-ID: 6f0def9f-0dc1-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gsFJdYQm5IaUi4s94A+NUxnT5djgg725ifru2jn4FWk=;
        b=c20B698felpQIJIxGetf7JzxzaPCF8irPc7bB7io8OzCIjHtZqWwSuoRBXzgmn5mH8
         ZEoJX0vVNKqQqhmh1qrJqLQYzOfxfg+bWG5iZTFtaUoLHzFNChNRYcsFg9RKsOphAVHW
         tBLHY3yLeMxzClv11hNOwicB59rK8t0QIUHEDSJTAe/Su0dOMkfHcoiw6/ECjxRk0Ypj
         7tM0f7CGdiWhXI03hOdqM3xheKk9rDfKs/rqCtN++pQmpINnsAlO2wufBoM5EcjQ8LJf
         7r8BFAJa4Vu2s+aBDzDky+66+d6XK2aQMoq8F1vi/kgGJzFnFdfGkHJy9rSe+CXPxhQF
         FZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gsFJdYQm5IaUi4s94A+NUxnT5djgg725ifru2jn4FWk=;
        b=Pe/6s1s/3f66ckRRbb09LqF2v/eq5lF87cuVhLBGSw6p9bnWkehQSdGTrus1qZtvMx
         0MbSqx3qYfjjVd8OSuE3tA4OQ8AKN31+eJeirdbe3s+JAb0ajaRkSISDCoEpKI4KxRJi
         Ao4KKOBpNL7g1k+f8/rNY8nni8ScqQWTLqNbekSJfwbRYBUWLf432if542alvTFYuD05
         Vke7hVddNKQMkh0jwQnmTpoTI0dB/HWvQFcgG6Ak29K4gN4wNC8kDgv6Fi6cPmI/83jP
         YErJeJGT3stm00Q2O0+55goVdNajHo37UJDNJ5HaEWmWN0jcD1tc7t9DDz4E6Mqana4G
         sBSw==
X-Gm-Message-State: AJIora+MarMGQDCpemsCXE4EgFqbp+5BW3t1TzFgjk2ZWd4bowr295eu
	yth95xm/0/lDfW5kzJLwzh6eKTobNl4=
X-Google-Smtp-Source: AGRyM1s5sEijfF2Y3L1wOME2jcsEw0+NDBPvAcEid4NnSHaVd4In3G51ouPUr/OyVJNtPPtcAJ92UQ==
X-Received: by 2002:a17:906:847c:b0:72b:4188:f940 with SMTP id hx28-20020a170906847c00b0072b4188f940mr18251339ejc.552.1658935995255;
        Wed, 27 Jul 2022 08:33:15 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 20.7 violation
Date: Wed, 27 Jul 2022 18:32:53 +0300
Message-Id: <20220727153254.1143503-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727153254.1143503-1-burzalodowa@gmail.com>
References: <20220727153254.1143503-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro parameter 'p' is used as an expression and needs to be enclosed in
parentheses.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/atomic.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
index ac2798d095..f5ef744b4b 100644
--- a/xen/arch/arm/include/asm/atomic.h
+++ b/xen/arch/arm/include/asm/atomic.h
@@ -123,15 +123,15 @@ static always_inline void write_atomic_size(volatile void *p,
 }
 
 #define read_atomic(p) ({                                               \
-    union { typeof(*p) val; char c[0]; } x_;                            \
-    read_atomic_size(p, x_.c, sizeof(*p));                              \
+    union { typeof(*(p)) val; char c[0]; } x_;                          \
+    read_atomic_size((p), x_.c, sizeof(*(p)));                          \
     x_.val;                                                             \
 })
 
 #define write_atomic(p, x)                                              \
     do {                                                                \
-        typeof(*p) x_ = (x);                                            \
-        write_atomic_size(p, &x_, sizeof(*p));                          \
+        typeof(*(p)) x_ = (x);                                          \
+        write_atomic_size((p), &x_, sizeof(*(p)));                      \
     } while ( false )
 
 #define add_sized(p, x) ({                                              \
-- 
2.34.1


