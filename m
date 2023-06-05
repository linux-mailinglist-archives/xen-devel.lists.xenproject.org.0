Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF4722D58
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 19:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543815.849095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Dgw-0001jq-8b; Mon, 05 Jun 2023 17:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543815.849095; Mon, 05 Jun 2023 17:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Dgw-0001hh-3s; Mon, 05 Jun 2023 17:08:26 +0000
Received: by outflank-mailman (input) for mailman id 543815;
 Mon, 05 Jun 2023 17:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNO+=BZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q6Dgu-0001hL-2i
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 17:08:24 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 939009e2-03c3-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 19:08:22 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f6d38a140bso36894145e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jun 2023 10:08:22 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b0030c4d8930b1sm10247405wru.91.2023.06.05.10.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 10:08:21 -0700 (PDT)
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
X-Inumbo-ID: 939009e2-03c3-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685984902; x=1688576902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaRbw/sqJoSJWbfETm9zRVkdTLn2hj3BA9S5N+S7y90=;
        b=i+Vl4p4zvEH/nYqsQIp8xv5oLP6H29zp+zFEwqb9LWf3wM5TI7Fq25pCPB5jOzFixf
         /SUgNBf9Wdfm20KzwhaL/rvehq6RDofIBR7GA0DZ0I4e1bxBYCzzuKFbbp/8bv/QtQG7
         dWLbqC4n7NC+sqMfz1fVFvJmh7dT7ggkQYlJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685984902; x=1688576902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaRbw/sqJoSJWbfETm9zRVkdTLn2hj3BA9S5N+S7y90=;
        b=Pd8kgCJaBzmAe5aI3VlLWkPOt+KT0TCgkzou8SBdsLFbco7pZC1Uvs32nFd69ul8ei
         NSMvlxQgoKUUbryVQ0MqNRKejKHapbAi4dUE/7cVM7WCCZ4Icp0uFxsvL6wMG/JJYXAB
         wRJLUnrPW2WjWcocVP6XHRw4UZhX4ZNKwlW8bq+TIeQCDW4r6tZ40FANmS/RsEutLd6l
         tX7qUD97bgxHyRPt7LYE+JHE1WIhwrYIq3HqciokJCEnQkN80A6LD6IRsrFV5x9wEMnr
         wJ/jw/iNV/lNSNNL8weTn4lBcyzxrJkaRy5hSsBVbT28E7rsEIrxbuUdHgVjf4Q4OMmB
         qeYw==
X-Gm-Message-State: AC+VfDzrGqtiYP1qhMHVs8JK6p/qoy1I5/lgTokXQ6kwDnKANyNWMDcH
	oZcb1EAGM163IVhybY66A9jQDL5KhE3Op14C7PE=
X-Google-Smtp-Source: ACHHUZ7lLvcV1tRW3PDGf4rz/a2dJpVlzf+rnHz2smfdTCd5C2zUSEENAFx0V0GDy4VePu79+/jLTA==
X-Received: by 2002:a7b:cd89:0:b0:3f7:3634:e21b with SMTP id y9-20020a7bcd89000000b003f73634e21bmr4580813wmj.2.1685984901953;
        Mon, 05 Jun 2023 10:08:21 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/4] x86/microcode: Remove Intel's family check on early_microcode_init()
Date: Mon,  5 Jun 2023 18:08:14 +0100
Message-Id: <20230605170817.9913-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel only suuports 64bits on families 6 and 15, so we can always assume
microcode loading facilities are present and skip the check.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * New addition
---
 xen/arch/x86/cpu/microcode/core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index c1033f3bc2..29ff38f35c 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -854,8 +854,14 @@ int __init early_microcode_init(unsigned long *module_map,
         break;
 
     case X86_VENDOR_INTEL:
-        if ( c->x86 >= 6 )
-            ucode_ops = intel_ucode_ops;
+        /*
+         * Intel introduced microcode loading with family 6. Because we
+         * don't support compiling Xen for 32bit machines we're guaranteed
+         * that at this point we're either in family 15 (Pentium 4) or 6
+         * (everything since then), so microcode facilities are always
+         * present.
+         */
+        ucode_ops = intel_ucode_ops;
         break;
     }
 
-- 
2.34.1


