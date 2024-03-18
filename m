Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD7187EE20
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694944.1084277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHF-0003PL-JH; Mon, 18 Mar 2024 16:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694944.1084277; Mon, 18 Mar 2024 16:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHF-0003Md-F2; Mon, 18 Mar 2024 16:55:57 +0000
Received: by outflank-mailman (input) for mailman id 694944;
 Mon, 18 Mar 2024 16:55:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHD-0002f9-Li
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:55:55 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61ba3bef-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:55:53 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-414006a0115so34420025e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:55:53 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:52 -0700 (PDT)
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
X-Inumbo-ID: 61ba3bef-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780953; x=1711385753; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcKGBjF7duyhQKCXtEFBeJNsUbmPicCjB0pyp6hYt+o=;
        b=WsrC13EOsz8uLsoCjJAXgTlodUkrdK5HChxaGKeJHl69+9lwZ0bvIU/lQDF+SmzCyy
         juFtSc9OwIbx8lscllSTUT6ejNn8qBXQW4RfS/CzsAuMIHw3tHwpN/zfYgWNSteMArSL
         yPqKAVyT7JkzzfJwPP6w0A+hqd6Q1AwrgioaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780953; x=1711385753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcKGBjF7duyhQKCXtEFBeJNsUbmPicCjB0pyp6hYt+o=;
        b=slJZBswnbkjJZ6ePOXwmWOxEYh9pOgdI1dgZB/+Fn2znzsTsFcHVDZXIOwqsxuMaWL
         SKS/1OWy/8fPJ79zbLePbgycHOf2YPDuEPcY8s1s1dFV7qT00gSXKrdnIrYqQUix0/2v
         aueKRo+xfKhSSn+zZvyoHj+SxY5NiTyDuGY3xBm6hpkeN19SHPP3qiI4NM7nQR4mqLE0
         aEXJ8Pr99hfZGQs4Q0Wq2GFvGSQPw4fEgKe32r1Bc6sQ8I+rpoezXurPqDgw5LXp9puX
         xkj6fI4W/yj6az0NAltswkHsXccoUVUYSccLt7WIHnW8Gt9XzyiZMgK59auYGTyZwxJ8
         OnNw==
X-Gm-Message-State: AOJu0YwVJDvgS8tAPGZBK0dEBOZ8FcSadIGW6Xd6K/nryDHrcB2bLQOi
	qNlANVlFN7NvEGQEeWx5ESE+gyeAvdB1N/s7+P1bmaYqq03tVJ8tt56Cv/sYEAwBIzS/oQ8/S58
	L
X-Google-Smtp-Source: AGHT+IEXEM7HDGP+KeNvTIogdB7vL94LrpI5Hk/v603q5Y0GFu3bqylgTJf7/90kics/0EwcAuWZmg==
X-Received: by 2002:a05:600c:4e8e:b0:414:286:fd21 with SMTP id f14-20020a05600c4e8e00b004140286fd21mr6171036wmq.28.1710780952980;
        Mon, 18 Mar 2024 09:55:52 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 02/36] ts-xen-build-prep: Only force git protocol v2 on buster
Date: Mon, 18 Mar 2024 16:55:11 +0000
Message-Id: <20240318165545.3898-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer version of Debian and thus git would use this automatically, no
need to force it.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/TestSupport.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index f0e087aa..0dded9b2 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -3257,7 +3257,7 @@ END
 
     # Adding mandadory use of Git protocol v2
     # necessary on buster when building QEMU v8.1
-    $gitcfg .= <<END;
+    $gitcfg .= <<END if $ho->{Suite} =~ m/buster/;
 [protocol]
 	version = 2
 END
-- 
Anthony PERARD


