Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63290A82C9D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 18:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944347.1342890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQO-0006Iz-Mp; Wed, 09 Apr 2025 16:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944347.1342890; Wed, 09 Apr 2025 16:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQO-0006G1-HK; Wed, 09 Apr 2025 16:37:16 +0000
Received: by outflank-mailman (input) for mailman id 944347;
 Wed, 09 Apr 2025 16:37:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2YQN-0004du-Gg
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 16:37:15 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e46da20f-1560-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 18:37:14 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so63656425e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 09:37:14 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm20947455e9.23.2025.04.09.09.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:37:13 -0700 (PDT)
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
X-Inumbo-ID: e46da20f-1560-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744216633; x=1744821433; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oz7vc3ZdkGUN8uURs2tZVEn3NKyi4BmiHGUDzuUaSbo=;
        b=jeXBuhV9/VH0N/gWYVF0KcO2Nc7e4QN3xxRNV1qXOvyZIHLw9Ygv3D/3ordHN41Rqw
         WCkWH3MMwmi+N0m2zLZ9qEOz/bJgaO/spT3xhsgvsF7xkaxKNwQ/7kh4owlZgMHHb7A8
         NjsSe27+hU5ABxFw22yYgD/lsFDnDEqrUz4gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744216633; x=1744821433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oz7vc3ZdkGUN8uURs2tZVEn3NKyi4BmiHGUDzuUaSbo=;
        b=jrJFG81+KNmLC6BXCf68kO2Y2PHjLX7y/hD+q01yXMvJWEK1uZjNHcGoLytm+6gULX
         sOTDfW3PBmNoHIeAJGZ01b3MfDF8LDJMEZtgEC75XsUIzYT+tHALJW07MHDUDiNRUfJ9
         4neYIpeyNNS0gWr9qBbrf0aQan64eFaFLVtW/a4nopTHAipwfpVgaryGC/9iHAywgsmt
         K+SwMZ9H6QFwZJJRnvP0KNWtc4Kz0BnGYUDR8ZSSzpXbXpPC319HyzuOwVtcGZlJn+o7
         +/mBnikD5MB+zGFngWJF2ic2sKxGDNYc6fKJzGDmf7o7etYoyqlwNL/J8w5mSD0Vvhbs
         dmng==
X-Gm-Message-State: AOJu0Yxme7FHNMPALZBE0Nxs+lnJM+ypr4vRaQzJeoD+djwt4BuPdQMW
	bJ7wli9TG2Jar1C9ZRja0aS3HvCaJlGuxrz5KUYjOBGugWVi3GdQB3hnj5IIdYr9OQnCg3gH0On
	MUrU=
X-Gm-Gg: ASbGncu3JW+nfRW9KKH581ild4J+a3rsJbOUvN3eOxeFb00kZH7TTbLe2EQtvNnrOj0
	erY7LQgkAz9pAgzmmklp6T0Aghdta6GHITU4cvc+p8uF7RCNBwu57jaAOnoycb3SL/gVjVNftx9
	2RF+rRzCWdJFQraJKHVEsdtY7LTLG/u7fDQhg5w07JdqwzT/lqw8uz4NoN5aitE2B0EX0pWOTxC
	AQTD+y92mOdrIH8waBR/ChGU9zowUBuHEzZTs9zTwqmBxX6TZuRZbVfAmXmiRm6Zt9Z5ghqqc4B
	FxytU8h8v+bfj+qqVsjnVfow/jHOW/9jKF5CB2mNsQexLRuIAQKKspIw/z81Xs/tpOJjeHHrSw9
	hp9AFumSeOskdoA==
X-Google-Smtp-Source: AGHT+IHttXZM3QfI72bPFKdKuNhqirIDtNLYAizvEnHznLSXNn9Np69KRJv/47G7CNoqnu5dUnfLgg==
X-Received: by 2002:a05:600c:450c:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-43f1fe2164amr29220135e9.14.1744216633654;
        Wed, 09 Apr 2025 09:37:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 8/8] Linux 6.6.86 for x86 and arm64
Date: Wed,  9 Apr 2025 17:37:02 +0100
Message-Id: <20250409163702.2037301-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's the latest 6.6 at the time of writing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
---
 .gitlab-ci.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6e38c2f2a108..c1ce3f38e8b8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -33,6 +33,18 @@ stages:
   variables:
     CONTAINER: alpine:x86_64-build
 
+linux-6.6.86-arm64:
+  extends: .arm64-artifacts
+  script: ./scripts/build-linux.sh
+  variables:
+    LINUX_VERSION: 6.6.86
+
+linux-6.6.86-x86_64:
+  extends: .x86_64-artifacts
+  script: ./scripts/build-linux.sh
+  variables:
+    LINUX_VERSION: 6.6.86
+
 #
 # The jobs below here are legacy and being phased out.
 #
-- 
2.39.5


