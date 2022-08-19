Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E259A6A7
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 21:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390440.627908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7uz-0005oC-4m; Fri, 19 Aug 2022 19:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390440.627908; Fri, 19 Aug 2022 19:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7uy-0005l7-Vl; Fri, 19 Aug 2022 19:44:32 +0000
Received: by outflank-mailman (input) for mailman id 390440;
 Fri, 19 Aug 2022 19:44:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp9C=YX=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oP7ux-0004jK-On
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 19:44:31 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57dfb0a4-1ff7-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 21:44:31 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id j8so10624301ejx.9
 for <xen-devel@lists.xenproject.org>; Fri, 19 Aug 2022 12:44:31 -0700 (PDT)
Received: from uni.. (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a1709061bb100b00731745a7e62sm2695059ejg.28.2022.08.19.12.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 12:44:30 -0700 (PDT)
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
X-Inumbo-ID: 57dfb0a4-1ff7-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xsltoJ+dF+zfeCEbbMIuZE8kHB12dqzZs8TVxgAefJ4=;
        b=hkGJIU1aGvYGm0v+Am6NTz5xNmDSGroHAYI6UuB20/aEDzeVw737lQzzrQ3d7nJb/g
         Vn77nJESXhO9IpFsIxIn30XMhSFav7IF9W4iy+hzE1r+5F08Hd9r6opWTPHLVqZgkw0S
         CP0Yn6X5qrcAcs0O92cXhXitbJ9IwPyd/2ROX+hGPKdsPNjsc/JWiKSjFaftrqWU5pQB
         rLWyfEh/Yaly//Pw1tOQLsWmD3gQUPf4mTWNxgURjRKSd6NYFMrHEiZl9RBLD+zulsai
         FZU7cxhwEzWYhMKt9n1HDL76cGBh6SWD6WwUEN0DXTeNS9aYHtyhgJ/aFHyU2l6Qih+n
         W6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xsltoJ+dF+zfeCEbbMIuZE8kHB12dqzZs8TVxgAefJ4=;
        b=ZE7nMcODzewHL1bpwcKjLJoOfPuts6mS2zXC3sVa4VLawhtZaqY8zpGSSLTwH1kl9v
         sVH7yDkZNDl6KiXEPuFWBPzHaofFUdaK+XEDbrp3vFHeGQD/0WuKY95Zin5JJA2Ll/i9
         rn9D0H4G1CAJ5+Nu5tZR4BMmypZMTF1ZvNV/BhaK7gavfEmpBSzTkck0HymJP0fhkUjr
         d2tB5yIQcdnXNw2wj9MYitXnnCSZmhee4v//EPTCEnfzjsIVIa9KX47PwZMOptpU0i7a
         2O0j2c7qJcYl45EAz3FpyvTNjJsB9YM2jerjmWydNDyXx62Hmb9v48C9TZCXXMi3gefJ
         OAZQ==
X-Gm-Message-State: ACgBeo3iA/wK2Olf/8xIzmFl1fe4IH95yaYTo9fB0W7+zFGtZadU2RX1
	NMQEng4Wdwd/KsKgMm7soczRIdn88go=
X-Google-Smtp-Source: AA6agR5kNgSC8WIOR/guTy01VB6ZBeKd18XpapZrxSp3zFJUChmBFUeJdYroXwEyJhgbetNcj0wBgw==
X-Received: by 2002:a17:907:7ea8:b0:731:4fa1:d034 with SMTP id qb40-20020a1709077ea800b007314fa1d034mr5815250ejc.758.1660938270375;
        Fri, 19 Aug 2022 12:44:30 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/7] xen/vgic: Fix MISRA C 2012 Rule 20.7 violation
Date: Fri, 19 Aug 2022 22:43:56 +0300
Message-Id: <20220819194359.1196539-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819194359.1196539-1-burzalodowa@gmail.com>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In macro VGIC_V3_LR_INDEX(), add parentheses around the macro parameter
to prevent against unintended expansions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/new_vgic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
index ab57fcd91d..b7fa9ab11a 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -43,7 +43,7 @@ enum vgic_type {
 
 #define VGIC_V2_MAX_LRS         (1 << 6)
 #define VGIC_V3_MAX_LRS         16
-#define VGIC_V3_LR_INDEX(lr)    (VGIC_V3_MAX_LRS - 1 - lr)
+#define VGIC_V3_LR_INDEX(lr)    (VGIC_V3_MAX_LRS - 1 - (lr))
 
 #define VGIC_CONFIG_EDGE        false
 #define VGIC_CONFIG_LEVEL       true
-- 
2.34.1


