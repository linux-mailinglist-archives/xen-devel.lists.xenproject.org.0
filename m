Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8CF5829B0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 17:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376268.608937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGj2J-00012c-Kb; Wed, 27 Jul 2022 15:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376268.608937; Wed, 27 Jul 2022 15:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGj2J-0000zp-GW; Wed, 27 Jul 2022 15:33:23 +0000
Received: by outflank-mailman (input) for mailman id 376268;
 Wed, 27 Jul 2022 15:33:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTNG=YA=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGj2I-0000xr-PR
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 15:33:22 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7125ff42-0dc1-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 17:33:19 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id z22so21856670edd.6
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 08:33:19 -0700 (PDT)
Received: from uni.router.wind (adsl-141.176.58.226.tellas.gr.
 [176.58.226.141]) by smtp.googlemail.com with ESMTPSA id
 ev6-20020a056402540600b0043af8007e7fsm10260725edb.3.2022.07.27.08.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:33:18 -0700 (PDT)
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
X-Inumbo-ID: 7125ff42-0dc1-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hHQQpVHcsAAoHD76EjQX32hczFF76kD+YJC2T3vRv/U=;
        b=g5oZIyaxtcTk7+udJ/kTuMhz05RtWlo3t7krco9nVhtapAEd+nqGua2/jZeg34u24E
         bjGIXHK3OmA8n5fOibqTOSyLf3fvuxGceRstsP4BnbjZfOc3tlABokkKL2K4h+ruWMUH
         sVFKrOdV+mpdhHlJm6UaKlQCmJJBJQLDDG0rKwCqQk44IInWHgeEvdFkJD6tyf9jS3Vz
         UTXZiA8H5XSAUd4/3FHVvXDBweDpnV7ZZLXuvIL9ObChty7ijkmrmUuExNpK1sKOFhoY
         CigCUy5lu/jJN8m1TnmVKFiTbLgLAhQnBEjF7+Ek8U4z6u9u7w/ztjXcV3iPHVTqYZYw
         85Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hHQQpVHcsAAoHD76EjQX32hczFF76kD+YJC2T3vRv/U=;
        b=Wjh5kOy5lU6AXKuz10akP+CRuPNfL11OjAku7W6Y3SkMjbh001cJ2+POVxT0Oqu5Dh
         rgR5I+X9kJ+NS2IU1/BAvnm/SpxEpMIRVh6/Yp03//Kho51CiQBwg7TWvtWs6YIGan2j
         g4PrGVUCGqpi94mxZ7boJjqaqkcgNoQyEDF7QrbBkKzVC+lgpZ++bUPw2RU3U+PVEZfK
         uyFm+f4vRmPzDUC132HA0SdNXGPvPoUFFFhNb3grGFquD+BrBZba+WxiHtlz7FQQSrJH
         Xu8yuBqlZQeKuZZiDFXB8oT3kE76xFsKqjTmWNMZWTsrcnbjf7lpt+Z84O7DESpPDju6
         5kXQ==
X-Gm-Message-State: AJIora9h17s6Ukycf30z8MTD7c3PoJ893nfUCcVcAVa9dHdvnM3dgxpK
	UDa6dYw0c+4aEFL9Qg0Mi6nJGAk/Xio=
X-Google-Smtp-Source: AGRyM1vReZVTQq4Hf3nNssIW3G0zShhaMKp8MxnkQOpmPITnTz6zzydu+8GwQuNEwPgAS0hvccu1+Q==
X-Received: by 2002:a50:ed0b:0:b0:43c:83bd:fd5d with SMTP id j11-20020a50ed0b000000b0043c83bdfd5dmr7318020eds.237.1658935999193;
        Wed, 27 Jul 2022 08:33:19 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5 violation
Date: Wed, 27 Jul 2022 18:32:54 +0300
Message-Id: <20220727153254.1143503-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727153254.1143503-1-burzalodowa@gmail.com>
References: <20220727153254.1143503-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused macro atomic_xchg().

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/atomic.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
index f5ef744b4b..a2dc125291 100644
--- a/xen/arch/arm/include/asm/atomic.h
+++ b/xen/arch/arm/include/asm/atomic.h
@@ -223,8 +223,6 @@ static inline int atomic_add_unless(atomic_t *v, int a, int u)
     return __atomic_add_unless(v, a, u);
 }
 
-#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
-
 #endif /* __ARCH_ARM_ATOMIC__ */
 /*
  * Local variables:
-- 
2.34.1


