Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7519AB1A89
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 18:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980250.1366722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQe8-0001jn-5W; Fri, 09 May 2025 16:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980250.1366722; Fri, 09 May 2025 16:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQe7-0001hZ-Sq; Fri, 09 May 2025 16:32:23 +0000
Received: by outflank-mailman (input) for mailman id 980250;
 Fri, 09 May 2025 16:32:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDQe5-0001fS-Uh
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 16:32:21 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e05b200-2cf3-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 18:32:21 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a1fb18420aso544125f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 09:32:21 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ecb46sm3790069f8f.30.2025.05.09.09.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 09:32:19 -0700 (PDT)
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
X-Inumbo-ID: 2e05b200-2cf3-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746808340; x=1747413140; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFM0Y+gqadqzp0ENY31mMAUk5m2pUiR3mi691rrtM+k=;
        b=lZ/dpJzBgkMVeDeQdUtBozlLtP64syKgtay9nq6eDcH9HgbwamN8BHsNmaBuv+WgE8
         xKkLEBrbLHlp5kWlHfAgIfdxsz9DYCRkMcQsclKPcdblIoq836rZAUpQagR3Z++HDn9+
         0hQ+4qS0dY9N+QPOQSUQEfo9Bvs3cKFxHvL8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746808340; x=1747413140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFM0Y+gqadqzp0ENY31mMAUk5m2pUiR3mi691rrtM+k=;
        b=mTCqOOclrK9e26Br/dabDS0otbzZSF4EzKQ1mG9fLWV04Q11ErhhYHK9G0cwInu23n
         IHrUwbDMq/XrFVZI1/DMi2vA84ujFD8AfDvYfT/zuA3zpk3Ii08fGBPp3FrXwYC3fFeT
         j6LupXY9WqXrQtfMWwrU2MeNOeOul7WHpjisK4P+FGDMYcE2TAfUuwrTFY+DdrRsg6xt
         owBtgnr+D3zGuCw9XcPXRryKrzE4jU/AAyq4WGSAvGohjKp07oKabBcilEYIJdpq8kxL
         y0TcTeBBRg+w7U4qTC/AS5nZT7+xIlfWeqFy8t4I+dUU6r3ubWRcvNUviT3vIoLZ8MA5
         Ji2Q==
X-Gm-Message-State: AOJu0Yx33lMskSwj6mtFvmhdk0vixgzvqLKu47vKRhfaBzTnU9Z6Bs5U
	6samGcDyS2p2v+uhXBXgeLg6tEv4sQEZq31I7mor4to+/3/33T3St/G7N1VbKc+XbUAnUnRDPVf
	L
X-Gm-Gg: ASbGnctsru9qGh5a/1DClfRut3XaQ8E4y+XCPPA49mpsFDKZJ4mRgcvp/bMsMxFkVXp
	59GIFMvg2y4wTb5rvMVmAXfawL3PHf9kybki8M4uRZhU0vEkuJl3xinuP0bwmDfo0GKFGPXveP3
	82GCivcNGWhJPYLNJIzedd2oZbdMRJdw4quM1kYtL6II+T9oJhmqtxEbVpPFrOoVfk1V5dKWqQB
	PWtAWkovfsyy0wnpfTaE3f7gunqttYlS4fYEfSqRTqXHP5MzWFbi2C5KBsN/omrq8p6aPAuQe2+
	SFYpvqK2WwE7UzB40b1UInfyE3ps+vI84m+fu06ShszkQ/xTneOsEe12l66xiBGDi/ORXaa9EGm
	5ihR4vjr8iytiWr2Uc3Zfq9mW
X-Google-Smtp-Source: AGHT+IEqpvqY6582XcpA4QoHaFF9RITN5vO2tcxP+51EaANNWJAgY2M9NmV5yf3g9aG70LBWTdSPOA==
X-Received: by 2002:a05:6000:e07:b0:3a1:f561:6894 with SMTP id ffacd0b85a97d-3a1f649aa9amr2723924f8f.44.1746808340249;
        Fri, 09 May 2025 09:32:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 2/3] xen/livepatch: Fix include hierarchy
Date: Fri,  9 May 2025 17:32:11 +0100
Message-Id: <20250509163212.2948359-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250509163212.2948359-1-andrew.cooper3@citrix.com>
References: <20250509163212.2948359-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen/livepatch.h includes public/sysctl.h twice, which can be deduplicated, and
includes asm/livepatch.h meaning that each livepatch.c does not need to
include both.

Comment the #else and #endif cases to aid legibility.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/arm/arm32/livepatch.c |  1 -
 xen/arch/arm/arm64/livepatch.c |  1 -
 xen/arch/arm/livepatch.c       |  1 -
 xen/arch/x86/livepatch.c       |  1 -
 xen/include/xen/livepatch.h    | 10 +++++-----
 5 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/arm32/livepatch.c b/xen/arch/arm/arm32/livepatch.c
index 134d07a175bb..8541c71d6e2e 100644
--- a/xen/arch/arm/arm32/livepatch.c
+++ b/xen/arch/arm/arm32/livepatch.c
@@ -9,7 +9,6 @@
 #include <xen/livepatch.h>
 
 #include <asm/page.h>
-#include <asm/livepatch.h>
 
 void arch_livepatch_apply(const struct livepatch_func *func,
                           struct livepatch_fstate *state)
diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index e135bd5bf99a..39159ba8b5bf 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -13,7 +13,6 @@
 
 #include <asm/bitops.h>
 #include <asm/insn.h>
-#include <asm/livepatch.h>
 
 void arch_livepatch_apply(const struct livepatch_func *func,
                           struct livepatch_fstate *state)
diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
index 3805b2974663..2fbb7bce60bb 100644
--- a/xen/arch/arm/livepatch.c
+++ b/xen/arch/arm/livepatch.c
@@ -11,7 +11,6 @@
 #include <xen/vmap.h>
 
 #include <asm/cpufeature.h>
-#include <asm/livepatch.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index be40f625d206..bdca355dc6cc 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -17,7 +17,6 @@
 #include <asm/endbr.h>
 #include <asm/fixmap.h>
 #include <asm/nmi.h>
-#include <asm/livepatch.h>
 #include <asm/setup.h>
 
 static bool has_active_waitqueue(const struct vm_event_domain *ved)
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index d074a5bebecc..c1e76ef55404 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -14,12 +14,14 @@ struct xen_sysctl_livepatch_op;
 #include <xen/elfstructs.h>
 #include <xen/errno.h> /* For -ENOSYS or -EOVERFLOW */
 
-#include <public/sysctl.h> /* For LIVEPATCH_OPAQUE_SIZE */
+#include <public/sysctl.h>
 
 #ifdef CONFIG_LIVEPATCH
 
 #include <xen/lib.h>
 
+#include <asm/livepatch.h>
+
 /*
  * We use alternative and exception table code - which by default are __init
  * only, however we need them during runtime. These macros allows us to build
@@ -93,8 +95,6 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type types
 
 void arch_livepatch_init(void);
 
-#include <public/sysctl.h> /* For struct livepatch_func. */
-#include <asm/livepatch.h>
 int arch_livepatch_verify_func(const struct livepatch_func *func);
 
 static inline
@@ -143,7 +143,7 @@ struct payload;
 int revert_payload(struct payload *data);
 void revert_payload_tail(struct payload *data);
 
-#else
+#else /* !CONFIG_LIVEPATCH */
 
 /*
  * If not compiling with Live Patch certain functionality should stay as
@@ -165,7 +165,7 @@ static inline bool is_patch(const void *addr)
 {
     return 0;
 }
-#endif /* CONFIG_LIVEPATCH */
+#endif /* !CONFIG_LIVEPATCH */
 
 #endif /* __XEN_LIVEPATCH_H__ */
 
-- 
2.39.5


