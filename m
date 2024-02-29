Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2DF86C61C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 10:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686911.1069519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfd96-0007cE-Rx; Thu, 29 Feb 2024 09:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686911.1069519; Thu, 29 Feb 2024 09:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfd96-0007ZS-Ow; Thu, 29 Feb 2024 09:56:08 +0000
Received: by outflank-mailman (input) for mailman id 686911;
 Thu, 29 Feb 2024 09:56:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xh/y=KG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rfd95-000742-SE
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 09:56:07 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1718812-d6e8-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 10:56:06 +0100 (CET)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-68fb7928970so2866986d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 01:56:07 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 nf8-20020a0562143b8800b0068fb74ec7c9sm558588qvb.34.2024.02.29.01.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 01:56:05 -0800 (PST)
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
X-Inumbo-ID: c1718812-d6e8-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709200565; x=1709805365; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+Jq4VgjlztXV9LuPFURoS9J4NOCZCFBiZ63KHy9B7E=;
        b=A4qVVgyWOmT2UrFCOuIHZ7lDc473YXT1AVc4psgKVylAjFb9QmCCYWZi1VKDguRvq2
         hyYF9bojV3c/PDcGj6Z8lKv65obaJr6CvXFD+Yjcd0lLqG7AmAzMP0SxK9Gw5a9c34FA
         +X60l4n9JXne/klOEczAmrClCfkooWvL5vOCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709200565; x=1709805365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+Jq4VgjlztXV9LuPFURoS9J4NOCZCFBiZ63KHy9B7E=;
        b=Ef5gCu+SBEOHh34qoKSqfISVJAclcVN0I/mm+QJzv1tPivHbn/Wia3G9riKy+pLchi
         xzKSEMULCciSfHSN0hnLGiPU8rQmPR24wC8zJRgoQw3dgEnZLjNtpXoxvMYr0Ms0unRW
         i6Zh4vz0IaKYFUVMVhzOddCBBLqIfIaXY2OL6wE3yhgz3tXwn1m/+PEUc2mgAW5JoC9t
         u+FRhCXpLrSd/I+rISSeUd92eDQ1R22qxz7l3SGFuE0/aGGPbre6+ooZ4kRrGYHzRo6a
         REXnnFSYLv8nsMe+lUKPjFIz01o1l9qZjx0UZdhbXoss4348P4EfhNdlk7IoYuHzHzz5
         zJ/w==
X-Gm-Message-State: AOJu0Yx5SPqlLkHZcF0u2XZJNaFNp176n9HKkigA4+bDzX9veDo0veql
	iVxvxvgNx6tjRajcyX6+slpM0KCbeygWko6g5U8AlTHFRXw/uj1qliuuH7Kvb+uYSdO3XSqhQYM
	+
X-Google-Smtp-Source: AGHT+IHpM2bPpu8mHD/WLp7i0gIrB8L7CHvbPXk6xReTWVVWbDqpncTL+Uacrdl0HbI2WS0x4N0k8w==
X-Received: by 2002:a05:6214:32a:b0:68f:fe88:cc4c with SMTP id j10-20020a056214032a00b0068ffe88cc4cmr1794865qvu.41.1709200565411;
        Thu, 29 Feb 2024 01:56:05 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] automation: introduce non debug clang based tests
Date: Thu, 29 Feb 2024 10:55:29 +0100
Message-ID: <20240229095529.17723-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240229095529.17723-1-roger.pau@citrix.com>
References: <20240229095529.17723-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The generated code between the debug and release builds can be quite
different, as a note 2ce562b2a413 only manifested in non-debug builds due to
the usage of -O2.

Duplicate the clang based test in order to test with both debug and non-debug
Xen builds.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/gitlab-ci/test.yaml | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8b7b2e4da92d..dedca794b257 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -422,13 +422,20 @@ qemu-smoke-x86-64-gcc:
   needs:
     - debian-stretch-gcc-debug
 
-qemu-smoke-x86-64-clang:
+qemu-smoke-x86-64-clang-debug:
   extends: .qemu-x86-64
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
   needs:
     - debian-bookworm-clang-debug
 
+qemu-smoke-x86-64-clang:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
+  needs:
+    - debian-bookworm-clang
+
 qemu-smoke-x86-64-gcc-pvh:
   extends: .qemu-x86-64
   script:
@@ -436,13 +443,20 @@ qemu-smoke-x86-64-gcc-pvh:
   needs:
     - debian-stretch-gcc-debug
 
-qemu-smoke-x86-64-clang-pvh:
+qemu-smoke-x86-64-clang-debug-pvh:
   extends: .qemu-x86-64
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
   needs:
     - debian-bookworm-clang-debug
 
+qemu-smoke-x86-64-clang-pvh:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
+  needs:
+    - debian-bookworm-clang
+
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
   script:
-- 
2.44.0


