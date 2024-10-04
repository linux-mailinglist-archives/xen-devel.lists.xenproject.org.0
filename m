Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56BB9901DB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 13:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810294.1222990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swgDk-0003rI-7p; Fri, 04 Oct 2024 11:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810294.1222990; Fri, 04 Oct 2024 11:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swgDk-0003om-4b; Fri, 04 Oct 2024 11:11:40 +0000
Received: by outflank-mailman (input) for mailman id 810294;
 Fri, 04 Oct 2024 11:11:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swgDj-0003og-4T
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 11:11:39 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c260d3f-8241-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 13:11:37 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso288959366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 04:11:37 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b376csm208581366b.104.2024.10.04.04.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 04:11:36 -0700 (PDT)
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
X-Inumbo-ID: 6c260d3f-8241-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728040296; x=1728645096; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DQLs5q2uOBRv4F1LKx6/9CnX2jdhLaGCZ8bCbQyEI6Y=;
        b=h7bDFLd11RlyZ7f2nH4rdnlZdYcE2KYPT2iotM2X+r9uQkvPuJve8hhEgximCQg1Er
         Vc6F2wY7bwvFzQZEjN8reOr+9D93J3uoWWf8jZwb/q2YMqARzsa4MWrxtl+3I2+uulC9
         V6Gnf5XKGlS40dWLPC075WpT4/5ynqeeP7oUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728040296; x=1728645096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQLs5q2uOBRv4F1LKx6/9CnX2jdhLaGCZ8bCbQyEI6Y=;
        b=YbxY0dqVdnakHyoCkbc6ARanMUjuHAw8pnKg8rJUEkBWOQEOQc0Ggj1Jg3sy7K+/gN
         gi0AIiNgNmEvpfIsLQuXPg8ndSbK3R9AG5sjNr6QjQ2/Ak79Qfn+lIfxM+sDe6cjIvtd
         Ibyg6WdnYYiR/b75swYX2mRlsb/EXpnNUMrpbKrS4YcA4nKxKdWn5QmJY6J4Ar1qhjJO
         kZR4ECwgOOuc5mqCE77tSRpz6c4lTBvF61n6cl008ZdbTQxMDcZVPn5Ya7CiwjlQR+kT
         +RXf1NafRG9+YOvFFfFaG/BdW0mhPMkidQkduDt9aOugI7kGDY1UKOCQ0T32rymsrzsz
         U24w==
X-Gm-Message-State: AOJu0YwZnptijUxAEVyX6S5LclXvXjCzpbXr8y4Djm1GK8p9f5GfOOYC
	kdAn7/6zfQcCEXNeJX9dmUuvyP6s7L30/AUPxZb+CFZO2WfkW0O2UBd4HG3lezzUrj4q9OafpGJ
	Y
X-Google-Smtp-Source: AGHT+IH5kuyzlnoQK0br8Zp4L3FWMS/AYkyeBfBC3jkdqYt9//Q5hC/xek1UfdOsCU4z6APbaehM+A==
X-Received: by 2002:a17:907:3eaa:b0:a98:f475:f9f3 with SMTP id a640c23a62f3a-a991c0234f1mr238729566b.65.1728040296390;
        Fri, 04 Oct 2024 04:11:36 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] MAINTAINERS: minor file line update
Date: Fri,  4 Oct 2024 12:11:27 +0100
Message-Id: <20241004111127.897937-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"xen/arch/arm/include/asm/tee" is a directory and should be terminated
by a slash ("/").

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
Changes since v1:
- removed second change, it was intentional.

diff --git a/MAINTAINERS b/MAINTAINERS
index fb0ebf0939..a2994c7421 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -517,7 +517,7 @@ F:	stubdom/
 TEE MEDIATORS
 M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
 S:	Supported
-F:	xen/arch/arm/include/asm/tee
+F:	xen/arch/arm/include/asm/tee/
 F:	xen/arch/arm/tee/
 
 TOOLSTACK
-- 
2.34.1


