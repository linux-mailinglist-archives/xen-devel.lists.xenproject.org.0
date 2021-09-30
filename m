Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E1B41D43A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199394.353429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqG8-0004Xb-Ry; Thu, 30 Sep 2021 07:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199394.353429; Thu, 30 Sep 2021 07:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqG8-0004Ud-OH; Thu, 30 Sep 2021 07:13:36 +0000
Received: by outflank-mailman (input) for mailman id 199394;
 Thu, 30 Sep 2021 07:13:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqG7-0004B3-9N
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:13:35 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f515294a-3ed3-4353-bcc5-859044fbd7cf;
 Thu, 30 Sep 2021 07:13:30 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y26so21268579lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:13:30 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y3sm267835lfh.132.2021.09.30.00.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:13:28 -0700 (PDT)
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
X-Inumbo-ID: f515294a-3ed3-4353-bcc5-859044fbd7cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IBrpPALaHgEu2bRfUzTni2BaAuDBWtjiAy9s9dEtWuo=;
        b=Z9yyFXZsdmLsyD6irTOnBZJ4a2peO0DlcILrViPlOtCLbHHHPBQvfm+XXagPHBIesr
         /pMhLzjvAAIanKEVPa8Nq6293vtqZeg+RlKdHr7BiqpGn0SkK482Hgfb/0zRUBhEM4Aq
         Z/uWQEElIz3RBoFJ7n7ofrKD6c4WI6kQFEvukBKkEyhhvJxTadzdB1iprMtH4BC65DgT
         HyhURu3MK0YDM/lJBSpXuiD4mh1zxkztDBY4QCzblQdW+WCFuChcPQfIOq8sWMerf3oH
         vGX5MGSvIxz8vjzHuhIcTZJbKsrTlROnMMmB6uSVl7imLVoAZZMh8CzzJa9BVJG+JCbo
         qcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IBrpPALaHgEu2bRfUzTni2BaAuDBWtjiAy9s9dEtWuo=;
        b=zF/JAyoV7Bu9psGwPnOyO2q9IucMUm18En0TvcneoT2oaEn6Ujs8/xAlFmE6RMY85N
         r0ZYnswjcxR6cz/YgPR6wz6yrAk/cmRRr35aN78uRHChK6d5m8RRJTFkYH7+yCnBthNA
         UrjGj9mwtl1Xz3B2s9tfhXRO5WfWTJL0aIOlN1pMJx/XI5oov1jMz9fj6C4SkaFUbgHi
         9a6NEN2H11v7FjX1AFe2j+REgpYPlgLs0y/XJ2JbOsf7ap3SUiw2g3+S6QJ5mENy7NSs
         bnbKw/Ukrji8/ESwicbnz1eih4GjkBcQ00+F236KLuc24uTjaTtfKlYS+/xA3oJKEvZu
         wgGA==
X-Gm-Message-State: AOAM532lnOumxz99bkfRp102hznTPgEuAzcEQk8ia+uTJMjMboGgPaaS
	31jvtXDCfbChItrJLQqSxFNkhKvgDaY=
X-Google-Smtp-Source: ABdhPJxz3EzEY2bcM09sXyYuyw/lkXDJlm3JlawU2ox4wsarBkIa6FBNzfi8GwOhhMMM4VKX3TL9JA==
X-Received: by 2002:a2e:9591:: with SMTP id w17mr4250036ljh.40.1632986008850;
        Thu, 30 Sep 2021 00:13:28 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Michal Orzel <michal.orzel@arm.com>
Subject: [PATCH v3 01/11] xen/arm: Fix dev_is_dt macro definition
Date: Thu, 30 Sep 2021 10:13:16 +0300
Message-Id: <20210930071326.857390-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930071326.857390-1-andr2000@gmail.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This macro is not currently used, but still has an error in it:
a missing parenthesis. Fix this, so the macro is properly defined.

Fixes: 6c5d3075d97e ("xen/arm: Introduce a generic way to describe device")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
---
New in v2
---
 xen/include/asm-arm/device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
index 5ecd5e7bd15e..ebe84ea853cd 100644
--- a/xen/include/asm-arm/device.h
+++ b/xen/include/asm-arm/device.h
@@ -27,7 +27,7 @@ typedef struct device device_t;
 
 /* TODO: Correctly implement dev_is_pci when PCI is supported on ARM */
 #define dev_is_pci(dev) ((void)(dev), 0)
-#define dev_is_dt(dev)  ((dev->type == DEV_DT)
+#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
 
 enum device_class
 {
-- 
2.25.1


