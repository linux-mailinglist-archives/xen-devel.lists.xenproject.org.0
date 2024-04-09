Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A750389E494
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 22:40:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702820.1098391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruIG6-0003b2-N5; Tue, 09 Apr 2024 20:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702820.1098391; Tue, 09 Apr 2024 20:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruIG6-0003ZV-KJ; Tue, 09 Apr 2024 20:39:58 +0000
Received: by outflank-mailman (input) for mailman id 702820;
 Tue, 09 Apr 2024 20:39:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Fcd=LO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruIG4-0003ZP-Lq
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 20:39:56 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52b132c5-f6b1-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 22:39:55 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a47385a4379so1305816766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 13:39:55 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 my46-20020a1709065a6e00b00a4735e440e1sm6119925ejc.97.2024.04.09.13.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 13:39:53 -0700 (PDT)
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
X-Inumbo-ID: 52b132c5-f6b1-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712695194; x=1713299994; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QHNIsObenkT3/PuQu0roL45npBIQsBHe0lyyeGDOwCQ=;
        b=EfyPG2SLrID8TVqtOIbYaCeDelRX7JLX0gVC1eFwa81rjdQ3AdLwBhJT8Z+Jl1cu4B
         t0PhuzMdnXJPXdlZ/HdFRcaKP9d4pS0+7sHKvZkXapkSt3xYguUI8u+w4vXIubmvA5Lo
         XM9AGf2rkQYyXud0/85e7DnDPqzLybaX3FL48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712695194; x=1713299994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHNIsObenkT3/PuQu0roL45npBIQsBHe0lyyeGDOwCQ=;
        b=uSgHqWEcmgw7lEBcT6SZz0w3CQ5b3arj3/e0lpuMr7tf54Bh8WqoDe3+WVy8I+/SGG
         oRdxHkebk9FolAI2+P5zyawrJiJtnTVst2EykWWSWKZ0fVO6cjmLwK1QtDMNtwUZKP4W
         Xc97loh3PhWWHy0rZy3XkIvIiS2ftGJf7Kq9ATMKAbchL7Gpo0kSCxkeJRL7PD5lohXd
         amYKnZ4uE2B1PrTPc4XUmlYX1N2LTqfPZMZ8IGsuRNFw9LL9WTkdIl3GtpDBwdTqyzMq
         BTZo8EdTlzSud0lTJLu8Rz8vWefWDf75cprx8qz66Jj4lfOd7GguhczCBFjRJqEseP3+
         Wdxg==
X-Gm-Message-State: AOJu0Ywq74f+msXWqhxVTDI3soOhjIoIVNRZVJFnoop40n7AOxws5FJH
	6TLM77CC/+jxQwOlA9reJf2rj935JBNYHZ4yHxzsdsRA1MeNTsN7kTDTRABsBfRNJSeXz1X1XN+
	/vdw=
X-Google-Smtp-Source: AGHT+IFGSrSIqqVp9tm8xJtqPkqRwkMyPt6JhkKrTap9lpnDGTJnIfIyTRoME/U63ygzoFlJg/8IiQ==
X-Received: by 2002:a17:906:a8d:b0:a51:f865:61b2 with SMTP id y13-20020a1709060a8d00b00a51f86561b2mr641509ejf.15.1712695194016;
        Tue, 09 Apr 2024 13:39:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/entry: Fix build with older toolchains
Date: Tue,  9 Apr 2024 21:39:51 +0100
Message-Id: <20240409203951.577241-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Binutils older than 2.29 doesn't know INCSSPD.

Fixes: 8e186f98ce0e ("x86: Use indirect calls in reset-stack infrastructure")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/entry.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 461bbc355872..a4615e1ccbaf 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -650,7 +650,9 @@ FUNC(continue_pv_domain)
          * JMPed to.  Drop the return address.
          */
         add   $8, %rsp
+#ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "mov $2, %eax; incsspd %eax", X86_FEATURE_XEN_SHSTK
+#endif
 
         call  check_wakeup_from_wait
 ret_from_intr:

base-commit: d5887c0decbd90e798b24ed696628645b04632fb
-- 
2.30.2


