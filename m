Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50956923F43
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 15:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752471.1160691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOdmu-0006jl-Jq; Tue, 02 Jul 2024 13:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752471.1160691; Tue, 02 Jul 2024 13:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOdmu-0006hx-Gz; Tue, 02 Jul 2024 13:43:16 +0000
Received: by outflank-mailman (input) for mailman id 752471;
 Tue, 02 Jul 2024 13:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWIE=OC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sOdmt-0006hr-OH
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 13:43:15 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 072a1644-3879-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 15:43:13 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a751ed17b1eso436799666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 06:43:13 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf61f69sm422119666b.67.2024.07.02.06.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 06:43:12 -0700 (PDT)
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
X-Inumbo-ID: 072a1644-3879-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719927792; x=1720532592; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ysxzaW7zBA0aHmVDbuDm4bmqYBDZxIKNlD/R+YAdNs=;
        b=ejkdTrtxkN/5TBE3MfUVplt/+h+5x+9tF5lpQsK86uvdiiOmk2f2qJOTMx0ubTh4D1
         FaEQahPt6ph854xdofICmYWr1BpgZ3AfFuo9BObz6b42Bm4NXHVi5XZsXGeQtguQHxAy
         mh57f6L8SjC0EG2LO/jZOdueHVQbudZOPeUqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719927792; x=1720532592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ysxzaW7zBA0aHmVDbuDm4bmqYBDZxIKNlD/R+YAdNs=;
        b=s845HGSfoh4T6qMTj4uR2+vHqa0C6LCaOPvGzMz7wTNPbj8wvkbWXmY3lS27zAkEj2
         JYOzRmHmuE9Y3ppKJAgQKNkblEoHTBwy0k22KNgormB1ZQxoDLSkaPw22ocOz95UG6Va
         g1dJjaCYC7gII/+X5gIuBRvHTeqEePUB/8M6CCyaCQdOT3VZ8AxVZL3Hxz0Yj9XvV05v
         TwYS+lpA0bRvyrGJnVvf4FGj9+dmLBKT1TGEo6FPZQebIC6oj9jSqyHS4Szb1Uu7mORi
         9+IclfXOMewpGqp2YYOIcV8WFXArw6M1MezXGtIBaOg6WLhrNk4pVZtlsL5oX4c8Yqu2
         /5oQ==
X-Gm-Message-State: AOJu0Yx5HCXCjchZMJ++1Cr5MN9f7tCM+igySxaWvX29c4OLTw47BBtA
	9Hp6L0TzHWXUQx9uZma7GTRrAHwdHa42GRHmcIjRJqYjU2KfdOjmog4WxXoI1uKpQk8iKCmmRSC
	N7UA=
X-Google-Smtp-Source: AGHT+IGjUA7IDqvAHJg26XAb4ugBXlO7C9RYCvYxQJtZWs0ayNYOeo4donIXYwowBNvbZREsBJSuBA==
X-Received: by 2002:a17:906:c1c2:b0:a6f:9643:e8b8 with SMTP id a640c23a62f3a-a7513953c11mr662493866b.32.1719927792391;
        Tue, 02 Jul 2024 06:43:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] xen: Fix XEN_EXTRAVERSION after 4.19-rc1
Date: Tue,  2 Jul 2024 14:43:10 +0100
Message-Id: <20240702134310.1307657-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EXTRAVERSION needs a . separator for numbers.  Currently, the banner reports:

  __  __            _  _    _  ___   ___
  \ \/ /___ _ __   | || |  / |/ _ \ / _ \    _ __ ___
   \  // _ \ '_ \  | || |_ | | (_) | | | |__| '__/ __|
   /  \  __/ | | | |__   _|| |\__, | |_| |__| | | (__
  /_/\_\___|_| |_|    |_|(_)_|  /_/ \___/   |_|  \___|

and xl reports:

  # xl info xen_version
  4.190-rc

Fixes: 4a73eb4c205d ("Update Xen version to 4.19-rc")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.19.  This is a minor mistake when creating Xen-4.19-rc1.
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 58ce6e468eab..037c49f83d39 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
 export XEN_SUBVERSION    = 19
-export XEN_EXTRAVERSION ?= 0-rc$(XEN_VENDORVERSION)
+export XEN_EXTRAVERSION ?= .0-rc$(XEN_VENDORVERSION)
 export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 

base-commit: 08daa72cdcb660c2f0aef52ee76a3704e2dd1b5b
-- 
2.39.2


