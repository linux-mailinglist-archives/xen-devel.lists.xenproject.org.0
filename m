Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2574258C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 14:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556811.869599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqaS-0004ux-Bx; Thu, 29 Jun 2023 12:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556811.869599; Thu, 29 Jun 2023 12:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqaS-0004pW-7Q; Thu, 29 Jun 2023 12:17:24 +0000
Received: by outflank-mailman (input) for mailman id 556811;
 Thu, 29 Jun 2023 12:17:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEqaR-0004fh-8n
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 12:17:23 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e591f25f-1676-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 14:17:21 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-992acf67388so64654966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 05:17:20 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170906528f00b0098866a94f14sm6773841ejm.125.2023.06.29.05.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 05:17:20 -0700 (PDT)
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
X-Inumbo-ID: e591f25f-1676-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688041040; x=1690633040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grlCNcNmu0qMOofgdPdF1fg50b7DJa/DUX94vx0K8mA=;
        b=HipFc38voSMfXADOwHY6rTYFuz2SmTIs6OiN6y5qyBcgfHf66sa66Fpokgn93vBdSQ
         911UNKjcW7vokvs+usMtIVukjw/rUGopPtlrfUIUvvsmus9m1F4tiTLs13+Do7w4W1AH
         k22FOs5nbVYQ4mWSKSJ95dsiDMuoyNZRW9am8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688041040; x=1690633040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grlCNcNmu0qMOofgdPdF1fg50b7DJa/DUX94vx0K8mA=;
        b=ZOJvLw9BZ4e8rqN4fgn8Fv4djaorV1vmtIWW/0dWt1nbaM1evrBshBdkqhfzyz5ATZ
         0JQ/+hB1VHe42252OxTeHS51iyYGkAUmeWzFF1SkiLKjvWRxGMT8AFOD14kTfKH2YXbv
         VwxgDXXlfmDNJFu0i2NBlnSciTxqRWxHY2X532FyJakH6vvh1RKl7pVgcMtNP+TI2jQp
         5iPSM3WH5AdGeysOUO/swxPuDP9ew/u8eyLl40GecYtsmtsyjYMVbp5wXyHyVtTxWYCr
         IvUBenodPxUd2LGgb2X2n3VzcWIlJuaVOzIAsNhYSzAD3SLLEJFoLhDDavTxsifnIyVB
         +sUg==
X-Gm-Message-State: AC+VfDxQkzglkrgtoO1fUSRc81dL6xQcyZeqF002YMGyJizzYQr3w4vb
	wgW0nVC7s9jmH2hWQ9koRvnPAAH93PKQcYNhAWw=
X-Google-Smtp-Source: ACHHUZ7tnbV1m7tIM9J2uTlKOF3A/4abEDUm0u/Rpgwpb+MaBH87kkX6vhb8f1c01weO76vlOyygUg==
X-Received: by 2002:a17:907:e90:b0:991:e24f:b293 with SMTP id ho16-20020a1709070e9000b00991e24fb293mr8269534ejc.12.1688041040380;
        Thu, 29 Jun 2023 05:17:20 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v3 1/3] tools: Add __AC() macro to common-macros.h
Date: Thu, 29 Jun 2023 13:17:11 +0100
Message-Id: <20230629121713.1211-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently libxl and the x86-emulator tests carry their own versions. Factor
those out into the common macros header so every library can make use of
it. This is required so the following patch can add this macro to a header
used both in Xen and tools/libs.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/include/xen-tools/common-macros.h | 3 +++
 tools/libs/light/libxl_internal.h       | 2 --
 tools/tests/x86_emulator/x86-emulate.h  | 3 ---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 168691be0e..6d7de1bc0a 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -84,4 +84,7 @@
     (type *)((char *)mptr__ - offsetof(type, member));  \
 })
 
+#define __AC(X,Y)   (X##Y)
+#define _AC(X,Y)    __AC(X,Y)
+
 #endif	/* __XEN_TOOLS_COMMON_MACROS__ */
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 61f4fe1dec..1cf3d400bf 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -125,8 +125,6 @@
 #define PVSHIM_CMDLINE "pv-shim console=xen,pv"
 
 /* Size macros. */
-#define __AC(X,Y)   (X##Y)
-#define _AC(X,Y)    __AC(X,Y)
 #define MB(_mb)     (_AC(_mb, ULL) << 20)
 #define GB(_gb)     (_AC(_gb, ULL) << 30)
 
diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index aa1ed75ec8..350d1a0abf 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -59,9 +59,6 @@
 
 #define cf_check /* No Control Flow Integriy checking */
 
-#define AC_(n,t) (n##t)
-#define _AC(n,t) AC_(n,t)
-
 #ifdef __GCC_ASM_FLAG_OUTPUTS__
 # define ASM_FLAG_OUT(yes, no) yes
 #else
-- 
2.34.1


