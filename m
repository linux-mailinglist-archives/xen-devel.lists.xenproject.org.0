Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA250584051
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 15:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376804.609820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH3te-0004vk-Qs; Thu, 28 Jul 2022 13:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376804.609820; Thu, 28 Jul 2022 13:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH3te-0004tq-Nj; Thu, 28 Jul 2022 13:49:50 +0000
Received: by outflank-mailman (input) for mailman id 376804;
 Thu, 28 Jul 2022 13:49:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfiA=YB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oH3td-0004d0-2y
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 13:49:49 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 254e16f5-0e7c-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 15:49:48 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id tk8so3260961ejc.7
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 06:49:48 -0700 (PDT)
Received: from uni.router.wind (adsl-69.109.242.233.tellas.gr.
 [109.242.233.69]) by smtp.googlemail.com with ESMTPSA id
 i8-20020aa7dd08000000b0043bea0a48d0sm726038edv.22.2022.07.28.06.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:49:46 -0700 (PDT)
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
X-Inumbo-ID: 254e16f5-0e7c-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AGvhw52qZ7yhX++JHeFH0Mw9fFAY30IDyCfGWdJWM5A=;
        b=hfwMuJI0tFFN3Nzwlg4bbRD1MHy8xjGTbR5sIrtGc/6gXXGVAOEJSuzTJf4mRv07IP
         sh+LX4KM860zdiC9hnGIU5ftYTCXsgrUQIKXgosU5gGs3tAXi4FH69g1SaAPfW2OowwU
         BK3pgCZc2ZPHa5EW0+PvOs+S/HvC7qfjzL72ndQZubIIy7+Yvm/OMddH2bMo/4l8e3ZB
         T8U+3M48EIekRS7jJ4fzsIisSG1smO6vivzR/UAKo6piEqgJUNji2Nun1vr1/SAJbHxT
         nLm9kjMykKqPANw7Qt4+095/DhcMktR1iRebkmkVDUhn/KoBqnUNpE5Haa7BNcTaD1e6
         /fQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AGvhw52qZ7yhX++JHeFH0Mw9fFAY30IDyCfGWdJWM5A=;
        b=m2ZPNadnF7NX7bP0dQw3RDgxETWiwL4ogh4xb5CuDu8H6SFo7ASr5kFEk16jDJ/WaW
         JvuLo2SfZ7jzTdFzcg9NJTveXK62EGNwvrJg/FVjAH7qOlx/GPJMdNcUTvjf7J+vwjK2
         fPudv7Zg6lfZS9/YZtHdvi+V2SzdTHEHwEZ7cPcCvIQOtIpJEHHseqNYHP2Y0WVx9sAx
         E1JpdGypjPa/mLJh131r89NV/ZdrpGmB2VgzWGwkI9II+vUGRosD5E3QxuPbC3ouhDkk
         rwPV9pO/0PIilYuMG2tMwBqwO7vCnEBSAX4gFH005DN/zWnxi6CuZ5mSONqclmEvvSu6
         FsiA==
X-Gm-Message-State: AJIora8qALJDDebgU3gZJsPRdM7DFyKrmRer9crvF4/Uo8r+cxv1OY2y
	kFrlvrFvT869duK/t66ajSqKByj/HjI=
X-Google-Smtp-Source: AGRyM1u+HXbTeWKD3fQrligIHWFLnCzwsu/mZ++K3zohb3LEU1+xDS930v9zbzeJ+i00/FgeTrL32A==
X-Received: by 2002:a17:907:762f:b0:72b:3203:2f52 with SMTP id jy15-20020a170907762f00b0072b32032f52mr21579149ejc.395.1659016187439;
        Thu, 28 Jul 2022 06:49:47 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Date: Thu, 28 Jul 2022 16:49:43 +0300
Message-Id: <20220728134943.1185621-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro parameter 'v' is used as an expression and needs to be enclosed in
parentheses.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/arm64/sysregs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 54670084c3..f5a7269a27 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -461,7 +461,7 @@
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
-    uint64_t _r = v;                                    \
+    uint64_t _r = (v);                                              \
     asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
 } while (0)
 #define READ_SYSREG64(name) ({                          \
-- 
2.34.1


