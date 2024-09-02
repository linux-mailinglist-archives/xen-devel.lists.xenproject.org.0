Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC7D968407
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 12:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787719.1197169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3ul-0006sj-Ss; Mon, 02 Sep 2024 10:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787719.1197169; Mon, 02 Sep 2024 10:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3ul-0006qH-Pc; Mon, 02 Sep 2024 10:04:03 +0000
Received: by outflank-mailman (input) for mailman id 787719;
 Mon, 02 Sep 2024 10:04:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl3uk-0006bt-JT
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 10:04:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id addf0f1f-6912-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 12:04:02 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a86933829dcso488109666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 03:04:02 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89940980a1sm480884466b.47.2024.09.02.03.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 03:03:59 -0700 (PDT)
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
X-Inumbo-ID: addf0f1f-6912-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725271441; x=1725876241; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J73lYas918rR7iWV+lDtK48y+7c1UvPfL+lcXAL/B58=;
        b=madkBvagX86hfn3vRTR/b13QPkT+0Z2ZQZeP5Oy9XSgM0KS+YdyVHoEbKgXHIV/1rz
         yclGEwRQWQ17ntvWaWTpOMmpPC7DnPmU5yTKrw2YNlvAVd/arK0fV/VJ4VaVvio7QtWF
         pMemqc17eTCGiXzNLY9sMC/9kDF+kuWTcNKO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271441; x=1725876241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J73lYas918rR7iWV+lDtK48y+7c1UvPfL+lcXAL/B58=;
        b=M/oLFAd7MAZ8rKaDh3jQrEApYvXC1aOQAmUUhenENgiNxNrGpEwIwZhZMl8t512atX
         2dpF6eIfST96SKHGHOx6XFyY1tGn6wkm3IKGoL9GlFNvbAmxvlTTNADAhIRWM/MjNxEP
         KnuSC9YqKns+ZIRR4vfTnnn2dUcCe1T0neIWC+P6Z9Ujq6PvB/SpA8GXuzB1KuOg4JnW
         Hg+Twx27TfwkakszXVdt3jyyRXK76sswxs+04Rf9iAT9JeMxGtFiCpRfekD9u+oba6gW
         r7EUC/nK/SWh2UwfkgorFGsUK3ZggcOZyL9fYK24KzXpVPI22fRuySrEHZnocohtbxE2
         2TpQ==
X-Gm-Message-State: AOJu0Yy/Soq1ekdzJrWcD/dM3HGFWslAKt9o+qYaRIBBAsRZpeD6fJ05
	EyuYEK3uRMQdD+95Al44ntzho3ZLiPc9D7nNsOUdBsllhXeOEsl9V3A4Rfgd27nFR1GZOlbgU9i
	X
X-Google-Smtp-Source: AGHT+IHus+EVXN+jTI+WqQURvvEb9jfdz7ym4LDSAxMCufoTh60E5MQfHuFh8xAmNrt4bWiqWY/4lw==
X-Received: by 2002:a17:907:2685:b0:a7a:b385:37c5 with SMTP id a640c23a62f3a-a89fadc10bamr269683866b.17.1725271440556;
        Mon, 02 Sep 2024 03:04:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 2/4] ARM/vgic: Correct the expression for lr_all_full()
Date: Mon,  2 Sep 2024 11:03:53 +0100
Message-Id: <20240902100355.3032079-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
References: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current expression hits UB with 31 LRs (shifting into the sign bit), and
malfunctions with 32 LRs (shifting beyond the range of int).  Swapping 1 for
1ULL fixes some of these, but still malfunctions at 64 LRs which is the
architectural limit.

Instead, shift -1ULL right in order to create the mask.

Fixes: 596f885a3202 ("xen/arm: set GICH_HCR_UIE if all the LRs are in use")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

Found by code inspection while doing bitops work.  I don't even know if
there's a platform that really has 31 LRs, but the rest of Xen's code is
written with the expectation that there may be 64.
---
 xen/arch/arm/gic-vgic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index 9aa245a36d98..3f14aab2efc7 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -16,7 +16,8 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
 
-#define lr_all_full() (this_cpu(lr_mask) == ((1 << gic_get_nr_lrs()) - 1))
+#define lr_all_full()                                           \
+    (this_cpu(lr_mask) == (-1ULL >> (64 - gic_get_nr_lrs())))
 
 #undef GIC_DEBUG
 
-- 
2.39.2


