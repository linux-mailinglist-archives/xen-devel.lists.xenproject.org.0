Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415ABA4AAB5
	for <lists+xen-devel@lfdr.de>; Sat,  1 Mar 2025 12:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899375.1307736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1toLFD-0000wx-VV; Sat, 01 Mar 2025 11:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899375.1307736; Sat, 01 Mar 2025 11:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1toLFD-0000uV-RL; Sat, 01 Mar 2025 11:42:59 +0000
Received: by outflank-mailman (input) for mailman id 899375;
 Sat, 01 Mar 2025 11:42:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tn84=VU=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1toLFC-0008Nf-9M
 for xen-devel@lists.xenproject.org; Sat, 01 Mar 2025 11:42:58 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 513e09d3-f692-11ef-9898-31a8f345e629;
 Sat, 01 Mar 2025 12:42:56 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5495c1e1b63so291827e87.0
 for <xen-devel@lists.xenproject.org>; Sat, 01 Mar 2025 03:42:56 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494d7ac5aasm529435e87.120.2025.03.01.03.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 03:42:54 -0800 (PST)
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
X-Inumbo-ID: 513e09d3-f692-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740829375; x=1741434175; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axvAG7yXQLFu5nS5bJa/2wSq+wnxBGBy0XSWklnH+fw=;
        b=knHB5EuhvCfELDaX3YIt+KUkYJtT2/zfw1rGkmShpYb3uPs4sU9NL4zU9bAO2LG7IE
         KuJzFGTD46zqf12cCTIWdbwRT4gJMhGXSbfbmDtc3Aa9Gf66UNA21LJMi6SS28hNHCFM
         AWAD8vspif1XU97QujYS774UwaAspg5OboYYeLCrCaYzMe0sMP8knF84/r2jdBPmX+JZ
         3bpPDrO3dZ474ntbxVbocUxNUDe26i6aOjZF1ARWUrXWuegK+4JMxB5M1aq6Hb90dpIF
         UlTZDV2PBnBe37gMl+YK1MLBUGkGtPqq2rhio6DFWRoAJtYZKmoY0SUJYA1Fn+xX7fqU
         7UJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829375; x=1741434175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axvAG7yXQLFu5nS5bJa/2wSq+wnxBGBy0XSWklnH+fw=;
        b=iL9HzwkZ/5QPPoR6c397mqa4jcdcPazMUbvm5nJfn05+cuNUYOuwFNV1rVU3CdMnpX
         36lMGpoqO9yliOflxN7T+LXrwOCQ9rVE+2M1LgNBi5vOwC3lw6cXKAI3RE+1m6L6BvVG
         7jGQrEIqWi+TRmk7kPFJWXcvBXIebt+aN8QJBfqvOt3ijIOdg13PYVnBqMNjVxRQNUQ0
         B2bgt18cJvzOfIKUrLAn8Tzx+OfhotGMqhAGwt72/H+xk0AYqcCPoFiU4qqblBmrTW5H
         aZsmFWGfMhqZKw5ENGsGrxa2eKDoX7jEwYlt8ljGCErnk4WnFKyYw/SNY8AKr1lJpAIM
         Sx+A==
X-Gm-Message-State: AOJu0Yxf8lDSytE+I62BL9G1I3DULLINAe3FE6FUGYtdKNsvDy8xdoFm
	Ll5jc9H1t76y4Eqer54sUG+xns6jQ5+XCLwgubGKYC2XlpDpPj3hRqgsmMLT
X-Gm-Gg: ASbGncvzAiEMpDmd3TPwBE0KPNs0TVVdUiAEjux8p/JiT9ONIbQPBKOUfu09kAyrp5I
	CAihxpTjYJaWxqbolkmQqAjXlG4u1yB/JVxD8NdZB19Ji+IaGlk7wQHtGGsSdJ0uKWpGHf4KBlw
	svIsCWbgianDEOg4+KgzNf1kx9P4xu++4/Baswkq3rBA4/ekDANHmCi8gJyb5tJ+FHCjVkwfOpu
	tXckHr7VEOUOUyzKALrgqIvuFCHgHBp5yBZHlTjUhEXInY2LA7SoXGrKPZhRFeAbwVFgLp6Jp4S
	vEX9Wp4oUvoNEVDOMf7fwcDXeL+ZuiOJc/t5v58KO3P2trwvPbQsTQ==
X-Google-Smtp-Source: AGHT+IEjSeYWGLj0L7t9RcszqIcDV+Z6d3Wpo+NQhqRvHZcgW2nDXiOLIfsq008WjXK6qeoLfD+8mw==
X-Received: by 2002:a05:6512:3d19:b0:548:794f:f9dd with SMTP id 2adb3069b0e04-5494c111896mr2355079e87.10.1740829375158;
        Sat, 01 Mar 2025 03:42:55 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andr2000@gmail.com,
	sstabellini@kernel.org,
	Artem_Mygaiev@epam.com,
	jbeulich@suse.com,
	Luca.Fancellu@arm.com,
	roger.pau@citrix.com,
	marmarek@invisiblethingslab.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech
Subject: [PATCH 4/4] [EXAMPLE] Whole file code style formatting
Date: Sat,  1 Mar 2025 13:42:42 +0200
Message-Id: <20250301114242.93650-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250301114242.93650-1-andr2000@gmail.com>
References: <20250301114242.93650-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch was produced by running clang-format on a file:
clang-format -i xen/drivers/pci/pci.c

Signed-off-by: Oleksandr Andrushchenko <andr2000@gmail.com>
---
 xen/drivers/pci/pci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index edf5b9f7ae9f..f6d8222c1dd4 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -56,10 +56,8 @@ unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
         if ( id == 0xff )
             break;
         for ( i = 0; i < n; i++ )
-        {
             if ( id == caps[i] )
                 return pos;
-        }
 
         pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
     }
@@ -116,7 +114,8 @@ unsigned int pci_find_next_ext_capability(pci_sbdf_t sbdf, unsigned int start,
         return 0;
     ASSERT(start != pos || PCI_EXT_CAP_ID(header) == cap);
 
-    while ( ttl-- > 0 ) {
+    while ( ttl-- > 0 )
+    {
         if ( PCI_EXT_CAP_ID(header) == cap && pos != start )
             return pos;
         pos = PCI_EXT_CAP_NEXT(header);
@@ -174,8 +173,7 @@ const char *__init parse_pci_seg(const char *s, unsigned int *seg_p,
     }
     else
         func = 0;
-    if ( seg != (seg_p ? (u16)seg : 0) ||
-         bus != PCI_BUS(PCI_BDF(bus, 0)) ||
+    if ( seg != (seg_p ? (u16)seg : 0) || bus != PCI_BUS(PCI_BDF(bus, 0)) ||
          dev != PCI_SLOT(PCI_DEVFN(dev, 0)) ||
          func != PCI_FUNC(PCI_DEVFN(0, func)) )
         return NULL;
-- 
2.25.1


