Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B2A74299A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556910.869803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtY2-0001Lq-Hq; Thu, 29 Jun 2023 15:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556910.869803; Thu, 29 Jun 2023 15:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtY2-0001JC-En; Thu, 29 Jun 2023 15:27:06 +0000
Received: by outflank-mailman (input) for mailman id 556910;
 Thu, 29 Jun 2023 15:27:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEtY0-0000oy-7V
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:27:04 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63d5655e-1691-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 17:26:59 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-991f956fb5aso90980366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 08:26:59 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v11-20020a170906564b00b00992c4103cb5sm307727ejr.129.2023.06.29.08.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 08:26:59 -0700 (PDT)
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
X-Inumbo-ID: 63d5655e-1691-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688052419; x=1690644419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EWwSePGbgOG6UY76hDXOxd7acKLKdGC7PoIoBrzZDo=;
        b=JlSEVxkZwiGyQiUexPBvtX53E+gwluHtldrfzFeXh/3nHThOh/coT5DSmpfZuQC5o+
         6E6meTDvO7+6fFBxtWDT3OSXAzx0SzyiKNpboFjciaN0y/F9XRgE3NO0L7mUOgw02ej8
         vHhTCOtPKb4CpxAx9pRLMd/5FrgxLwsgqzW9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688052419; x=1690644419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EWwSePGbgOG6UY76hDXOxd7acKLKdGC7PoIoBrzZDo=;
        b=eggLBw0Y8tS/ondSSeaOOPMqrus8S7S0+TQBbTKWMKkfLcNu5NHPKV7WxIYCDHllfJ
         4aXJezLsZcU00jyoKSb+96enooNw4/P6bvgVuUbiXVcqnKXUTiqa8j6a+8Y90zLSVX1g
         IqOAYODFVeeX/BQWCDEXU/g/wszqPBK3drKHulKWtigLL4j36KfylOyN0knYZ+vxACcc
         3zNu8DKN9yeyc8qRdT9AoQgxc8sOSYhIQxOSi6TOD/sWjThsu4/T4okDcDHuGMtrJ6jI
         8r/dzyg6FjEGs6tX5hjDy7NXR5+DHjiE6Kx5KJJc0VVHZSvWYBrWsdweWKoFt2L+159u
         rHEQ==
X-Gm-Message-State: AC+VfDzArszms/4scbX8r8GI6MaOh5YEV0xbKc3JjTOUimaqCW9dFQ1I
	ik+aRJhMfFWh3+uAlwS/TGqzS4XJFFZN5rUlncY=
X-Google-Smtp-Source: ACHHUZ4Ovlt5oS29GhdsnB2LHodJwMHMIoAaON3wMB8LDLBOql7BWiGNIREyPpS4qm8jlLUeH7y3Ag==
X-Received: by 2002:a17:907:980e:b0:992:33ba:2eb4 with SMTP id ji14-20020a170907980e00b0099233ba2eb4mr6354747ejc.71.1688052419215;
        Thu, 29 Jun 2023 08:26:59 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/4] x86/microcode: Allow reading microcode revision even if it can't be updated
Date: Thu, 29 Jun 2023 16:26:53 +0100
Message-Id: <20230629152656.12655-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

microcode_update_one() currently assumes all microcode handlers are set or
none are. That won't be the case in a future patch, as apply_microcode()
may not be set while the others are. Hence, this patch allows reading the
microcode revision even if updating it is unavailable.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/cpu/microcode/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index c3fee62906..bec8b55db2 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -750,11 +750,12 @@ __initcall(microcode_init);
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
 {
+    if ( ucode_ops.collect_cpu_info )
+        alternative_vcall(ucode_ops.collect_cpu_info);
+
     if ( !ucode_ops.apply_microcode )
         return -EOPNOTSUPP;
 
-    alternative_vcall(ucode_ops.collect_cpu_info);
-
     return microcode_update_cpu(NULL);
 }
 
-- 
2.34.1


