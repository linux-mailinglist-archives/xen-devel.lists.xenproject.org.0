Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0589CCCCF72
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 18:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190024.1510703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHne-0002rq-Ge; Thu, 18 Dec 2025 17:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190024.1510703; Thu, 18 Dec 2025 17:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHne-0002lW-C5; Thu, 18 Dec 2025 17:28:26 +0000
Received: by outflank-mailman (input) for mailman id 1190024;
 Thu, 18 Dec 2025 17:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWHnd-0002iW-0J
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 17:28:25 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3de86f7-dc36-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 18:28:22 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-64b4b35c812so1192929a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 09:28:22 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b585b53c1sm3209423a12.5.2025.12.18.09.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 09:28:21 -0800 (PST)
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
X-Inumbo-ID: f3de86f7-dc36-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766078902; x=1766683702; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW+wJ63md9ndA96ESO3iCElLFPadst5PIcpnOB9F2yY=;
        b=NLCfjbxlBNuNJoQb7UGi80qWLnruJmUqetGj/rQtsBYtxyQjXZvkeJVYZWT/bMGFx4
         gT2mtUSs0GW5lT0yuDABx5zRlBZdR8jt5vru8GIxG5siSzEw9hbufIB0+Xx0AM7qoCXH
         hta4fNaIeH1kypozPhOvve1usqzM0mOyZpy+DYtNSdk2n6SQg/oR+OUKE5HBY8d1WPQn
         WynzeLbkHsnGVy6dwMtzDacbrfIBXhsDCRzs05TYa5Wq5t5KUKFqzdwiLVVwhb2D8zse
         kkQV0po8oo52I5nfJyoJlRWJRh/d1Ax89urhFknLdrGj22bGrTA3ZA5WqHMoSI9zSQIs
         MlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766078902; x=1766683702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rW+wJ63md9ndA96ESO3iCElLFPadst5PIcpnOB9F2yY=;
        b=RazTm4Je+K45+DhXLSsMePu296x5pEp9pGndcsNvoh+VvCmhkfhcO+UisiDT/+kTtT
         hsNKh4sSD3YNHk9qNRom810M9iDxHY9msfXqsgZJOTRsso370ImvmUuIGhUAsw5TNiG1
         f2j1iqA9Lc6HqtszgxTyysym6MTdTRfr8KY5kgBUtHlkdoLg/Ij9TEl7zLm0S4wiD7jS
         MHd07DuwvQI1dMT16c2X767f4UikmVBiFU+kA+1FjOFkjDbgaQqVYCjjEov805qb0ceQ
         ylaPEdsMGAnvrwvKljW7dJd34dGEx0si5XzWBNmdzSzOu+y+KRGtOZ9U1CafOA/1L7Ro
         b23Q==
X-Gm-Message-State: AOJu0Yz+rbOT/GgNL3oICfHeEQMgytRl6acLMv0UVydJFHnC9ElnSOHu
	td2WCdu01XKcWyG2z/azoEbCu44G0KvARxn44hlT9GkKZdDJ8xwheWxNobWUAA==
X-Gm-Gg: AY/fxX4f7vk0rZ4AMkgcC36pN1bSMmytg5EZS77YgZ17aBTA7CDqiIx707CKqNWoxtX
	Cp/r6ZEAHNiotNoJxkpuh5su+3IgntDSYFVbw5wnlORdPH8tcrSUT/Uop61fGXJVQuoCehGBOvl
	6MTbYCcj3liiS3pqlzXUZ4ajnutJ30NUlva3Kz7plcNJuCJFZPHkqq+J6vmqVXdlOoxKv1lpvV3
	SWBdLsR9S4qOcvzj6VBYnDaOv1Av9rDpaluJ6W0ZNobVlwE63rlzZlXKi5HSv+0S7HA5clxpTGo
	m4MP4SjGR4fClztCoAaV7x7ETuFjfowqpMhCwKCQqt+moZn8OHFzWwVqgRXZQDAA/G9i7PLBstn
	dWlTAS2J/6SKfK9U9/nCrvtMEKosmmE+DZc5kwV3P9RFX3rtZjZOxDOdwxWaR7hdf422Z/MzE4x
	3bMfgw+ZVNm1Z72NYryyqwrPnC5O63VdoWRdWElZN/Au7emezLLM2f+jM=
X-Google-Smtp-Source: AGHT+IHOLBkvgXaKhb4YYR5U8jNPk5mPr/gqCgbWRquEGgBpPyyXGtotZ574+vtr5wqIVm/PSZMAwA==
X-Received: by 2002:a05:6402:3550:b0:641:8a92:9334 with SMTP id 4fb4d7f45d1cf-64b8e938162mr193723a12.6.1766078901964;
        Thu, 18 Dec 2025 09:28:21 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/4] xen/arm: drop MAX_PAGES_PER_VCPU
Date: Thu, 18 Dec 2025 18:28:07 +0100
Message-ID: <74f1594aad235765002b59f2baa975cc8fe72f06.1766053253.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766053253.git.oleksii.kurochko@gmail.com>
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the size of struct vcpu is smaller than PAGE_SIZE,
MAX_PAGES_PER_VCPU is no longer needed and is removed.

This change also updates {alloc,free}_vcpu_struct().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
 xen/arch/arm/domain.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 47973f99d9..e566023340 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -473,36 +473,21 @@ void dump_pageframe_info(struct domain *d)
 
 }
 
-/*
- * The new VGIC has a bigger per-IRQ structure, so we need more than one
- * page on ARM64. Cowardly increase the limit in this case.
- */
-#if defined(CONFIG_NEW_VGIC) && defined(CONFIG_ARM_64)
-#define MAX_PAGES_PER_VCPU  2
-#else
-#define MAX_PAGES_PER_VCPU  1
-#endif
-
 struct vcpu *alloc_vcpu_struct(const struct domain *d)
 {
     struct vcpu *v;
 
-    BUILD_BUG_ON(sizeof(*v) > MAX_PAGES_PER_VCPU * PAGE_SIZE);
-    v = alloc_xenheap_pages(get_order_from_bytes(sizeof(*v)), 0);
-    if ( v != NULL )
-    {
-        unsigned int i;
-
-        for ( i = 0; i < DIV_ROUND_UP(sizeof(*v), PAGE_SIZE); i++ )
-            clear_page((void *)v + i * PAGE_SIZE);
-    }
+    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
+    v = alloc_xenheap_pages(0, 0);
+    if ( v )
+        clear_page(v);
 
     return v;
 }
 
 void free_vcpu_struct(struct vcpu *v)
 {
-    free_xenheap_pages(v, get_order_from_bytes(sizeof(*v)));
+    free_xenheap_page(v);
 }
 
 int arch_vcpu_create(struct vcpu *v)
-- 
2.52.0


