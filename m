Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2A658EA15
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 11:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383498.618671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLiPe-0007zL-Mc; Wed, 10 Aug 2022 09:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383498.618671; Wed, 10 Aug 2022 09:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLiPe-0007xL-Jk; Wed, 10 Aug 2022 09:54:06 +0000
Received: by outflank-mailman (input) for mailman id 383498;
 Wed, 10 Aug 2022 09:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bIAv=YO=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oLiPc-0007xD-RE
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 09:54:04 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5da24fe6-1892-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 11:54:03 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id b96so18452860edf.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 02:54:03 -0700 (PDT)
Received: from uni.. ([2a02:587:ac16:4a00:2259:7543:2ea6:3f52])
 by smtp.googlemail.com with ESMTPSA id
 l9-20020a1709063d2900b00730af3346d6sm2117129ejf.212.2022.08.10.02.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 02:54:03 -0700 (PDT)
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
X-Inumbo-ID: 5da24fe6-1892-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=06SFtDDfQbw28f9Hf3Ri4wfCkUFS+9ANcS7I9ZTAbyw=;
        b=AaB7GJZUT7A1i9nJJ4emIL9/nIPczoVoeRAYh1SRICFG1cH8IyobPTgspt8C3dKo3e
         QjzS4d88/4ru5fKDlvmQMGw+31U0oXWdIXqk4TMO1eoYGY5pWfoNGGjXuvL21/jSMQwe
         bEtqCml+QpifHkO46rV7EhLTlUhGA3H714MaD/I6vcmC3+g/Ima0xOEfST2wT+MIVbRh
         zgAXM7WZWVbWocOS5i4t9DgZpnZfU9lUsvhiR4D56T/Mvu2qsTa0Tg3gRU/2w48keDQv
         mQ+03q7tayGR0S8hb+wZZRX2vGRa96BTs6FgYkC9nylJgh2gRpBJamYWDiWbgQVL9mp/
         ffIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=06SFtDDfQbw28f9Hf3Ri4wfCkUFS+9ANcS7I9ZTAbyw=;
        b=OIpLHVioYnTrD615J6Ic+Z4aTbZrfhkszZAvJKZMNyShO4G3+/QEtLZoAXAlTNk8C/
         V19EKtBvXe5elDLkBwHk8TI/t/bR4ogyCVVgY+tZXgX/8nVMnyzYz5ckd3x1b+HaGyox
         3M7rSOR7HYC0YJyvmM3MuAEtqFZma5I5CdRon/TmJ/SjzNqo60WZWohCka6D6McZg3/T
         Zt/feO46V+xlAESHHzSUH+HAm2CWVDDBruxMZdzZv6bzymZx0mH1bRM5muubvzaLZ4qy
         zyQyvdU5UONENHb4FgEJLN9FL0Ol4yUJHtjj3x3qXZPywXzmTbnr0aMym7EGpKyBk5Rw
         1csQ==
X-Gm-Message-State: ACgBeo2D7R8pbN4Dv6Q/y5g9qKSrI2ZigHgFNN1fApbN5cKwEilc3+j+
	uWImwoGpaQml90ZZr4UR0JvU6PQSg00=
X-Google-Smtp-Source: AA6agR49eRagY9bPPWujSlgC1b2SO87LUKYhkl5Vp+biaSHThFLWssLW7U05dqfMfN0WlWxevu0G7w==
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id fj8-20020a0564022b8800b0043a6c586c64mr26131701edb.348.1660125243369;
        Wed, 10 Aug 2022 02:54:03 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: vgic: Fix coding style in macro REG_RANK_INDEX()
Date: Wed, 10 Aug 2022 12:53:56 +0300
Message-Id: <20220810095356.1906405-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add parentheses around the macro parameter 's' to prevent against unintended
expansions. This, also, resolves a MISRA C 2012 Rule 20.7 violation warning.

Add white spaces around the subtraction operator.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/vgic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index d2a9fc7d83..3d44868039 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -286,7 +286,7 @@ static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
  * Offset of GICD_<FOO><n> with its rank, for GICD_<FOO> size <s> with
  * <b>-bits-per-interrupt.
  */
-#define REG_RANK_INDEX(b, n, s) ((((n) >> s) & ((b)-1)) % 32)
+#define REG_RANK_INDEX(b, n, s) ((((n) >> (s)) & ((b) - 1)) % 32)
 
 
 extern struct vcpu *vgic_get_target_vcpu(struct vcpu *v, unsigned int virq);
-- 
2.34.1


