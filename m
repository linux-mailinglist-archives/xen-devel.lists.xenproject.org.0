Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A2E7996DC
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 10:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598435.933229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetNQ-0001yH-64; Sat, 09 Sep 2023 08:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598435.933229; Sat, 09 Sep 2023 08:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetNQ-0001vz-1y; Sat, 09 Sep 2023 08:31:36 +0000
Received: by outflank-mailman (input) for mailman id 598435;
 Sat, 09 Sep 2023 08:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rb1o=EZ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qetNO-0001vr-Cy
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 08:31:34 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4792a51b-4eeb-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 10:31:33 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-26b41112708so2184432a91.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Sep 2023 01:31:33 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.29])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a17090ab28e00b0026f3e396882sm4091663pjr.45.2023.09.09.01.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 01:31:30 -0700 (PDT)
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
X-Inumbo-ID: 4792a51b-4eeb-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694248291; x=1694853091; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfO6gt1jg7JX4SuFiMGAMKpFfTvUV21HN5Stf3HGJ4k=;
        b=a/d04L++OkDjOrE7ed+YKImDTFi93g8cmUOxCUqitAJ+cZdUY0BOP6/KVx+sH3fH6u
         0dA/SnmLJ20H35GN2cG2viB9aV5VZe4FkCzJ0BO0f84vf7cbtz9mNktbfPTApG5WHfhU
         CEy4Xh2Pao2AEgV5w7hqn8rGAiPntiSuCU5fzxa/TD4KH0pszc2hsT9M0znYXQ86araB
         kNs4899Ss4guClTTY/0SZ7s1H07qTDCUV7nIAkVORnnkYuBYFhwqKS0foPns8f8XbChN
         RMqun3Sd4tY7jc6L7W4cvuL3YEuKWQHkb0LzHVTbplByLgkwSPtpqqQhlak/RTUN4s0C
         vuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694248291; x=1694853091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfO6gt1jg7JX4SuFiMGAMKpFfTvUV21HN5Stf3HGJ4k=;
        b=GPVnospyB+BADzxO4IXcC8i/kyItRCt7YUNW5O8VSS8uLtokuWF4EriTMeVp3D4zor
         tYYkX7MxvdB2ZZFgmDFO5Z7UrAi2ZyISyiC5B4+NMoHD6qZWxQb8vfgwjhBzj04Q/gZW
         0v2JhsjuI2DH/B8THcaeQYwpCfhh9HKVbVGukgOrustq0ffSqHXiYV5FRlIVkfbLxkO4
         Y+c55SjaDiimP2z8tBzaUzDuluPunDZxEoV9vDF5NLlmZ5WSA5LckPD+p3zlPiocbetk
         5U9+JyJSyRt2Ry2zf2qJ+EjcUAdoB5vMrQ1E+Nbj8+zy6AzrDhd212r8HOMG9aFaDJkz
         rZJA==
X-Gm-Message-State: AOJu0YxVXgWQzhYrJWmVd/si5/+QR2gObuQOF1U+p5IjTI+OoU+tX+et
	26ZGRpDOSH43MUYPQm/cHFuy2nVK2c8+V4tncQCkViQ+
X-Google-Smtp-Source: AGHT+IEvgFk1Luv8Ju6PepwsBPv9dI5pRPc6N/Na1cfvwxLxRryN8erMYEmbjYIvRBwQ4UPHV1IRfQ==
X-Received: by 2002:a17:90b:3e81:b0:263:f630:228f with SMTP id rj1-20020a17090b3e8100b00263f630228fmr4852582pjb.23.1694248291339;
        Sat, 09 Sep 2023 01:31:31 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 1/2] xen/arm: Add macro XEN_VM_MAPPING
Date: Sat,  9 Sep 2023 16:31:18 +0800
Message-Id: <20230909083119.870663-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230909083119.870663-1-leo.yan@linaro.org>
References: <20230909083119.870663-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen maps the virtual memory space starting from L0 slot 4, so it's open
coded for macros with the offset '4'.

For more readable, add a new macro XEN_VM_MAPPING which defines the
start slot for Xen virtual memory mapping, and all virtual memory
regions are defined based on it.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 xen/arch/arm/include/asm/config.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 83cbf6b0cb..21f4e68a40 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -117,11 +117,14 @@
 #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
 #else
 
+#define IDENTITY_MAPPING_AREA_NR_L0	4
+#define XEN_VM_MAPPING			SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
+
 #define SLOT0_ENTRY_BITS  39
 #define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
 #define SLOT0_ENTRY_SIZE  SLOT0(1)
 
-#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
+#define XEN_VIRT_START          (XEN_VM_MAPPING + _AT(vaddr_t, MB(2)))
 #endif
 
 /*
@@ -184,12 +187,10 @@
 
 #else /* ARM_64 */
 
-#define IDENTITY_MAPPING_AREA_NR_L0  4
-
-#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
+#define VMAP_VIRT_START  (XEN_VM_MAPPING + GB(1))
 #define VMAP_VIRT_SIZE   GB(1)
 
-#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
+#define FRAMETABLE_VIRT_START  (XEN_VM_MAPPING + GB(32))
 #define FRAMETABLE_SIZE        GB(32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
 
-- 
2.39.2


