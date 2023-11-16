Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025077EE07D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 13:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634150.989472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFa-0004eZ-62; Thu, 16 Nov 2023 12:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634150.989472; Thu, 16 Nov 2023 12:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFa-0004bP-1b; Thu, 16 Nov 2023 12:13:38 +0000
Received: by outflank-mailman (input) for mailman id 634150;
 Thu, 16 Nov 2023 12:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flNc=G5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3bFX-0003ZM-JB
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 12:13:35 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90ba4f9a-8479-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 13:13:35 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40859c466efso5377755e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 04:13:35 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b0040a4cc876e0sm3423038wmq.40.2023.11.16.04.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 04:13:33 -0800 (PST)
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
X-Inumbo-ID: 90ba4f9a-8479-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700136814; x=1700741614; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yvxs/c3O2jbf+c3dkzntVo+nnu3OG0TuAlypeuFTsCQ=;
        b=hUo8t60oPjCyOv8NE3jRr4Mt7vUnqkE4DByMqYTDu24tYcP5433eknToBiUmpc0ntP
         xVrC9HEtbp4fJAT2+q3O0VMTS3Dn8wtnxC2YyLBN9XLfvFQlWaZWMMgdKzEVpjbDh8uj
         9a7fGGcoF3f8Fzn8YR5tai+6r2Z5SoBBXHZNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136814; x=1700741614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yvxs/c3O2jbf+c3dkzntVo+nnu3OG0TuAlypeuFTsCQ=;
        b=GRMEc6HH+i+QvSzllKL75rptmjbYZ7ctXW1HfnFQ8BB71gaOr2KxVxtQWoFR6xCR49
         WSA0yX7NpF7dNhVA195vaeJv07KvzzHX6IXFL2arRywiYi4mzzsXsKVspCu+xC0qVfJe
         qj3d7i+an9RymfPUIu/mamuxbahkVcVeQ9wGApWN2QJS6vRujkMjy/qQIb/b3x1OpfL6
         h0WzFDrh6vMzw08CaOsDSg+axKfl9K+toX/aDGsO6nFMO/Wsuh6STb/2kt5Uk173GVXi
         nBEAOKwgo85GsPriMqUnnfhErb/KMNi/l/MegP8IY4tdDfCKGmFMzklbkxWDqblMDIR/
         iIzg==
X-Gm-Message-State: AOJu0YwzditB9/CXT1wTEmaflYNEAD4+X4jh+hnCiGAhpxje6hOYfl7m
	726Dg9wg1eYTYVO/Sbpb7zWaYlusLtPJyZ59/0M=
X-Google-Smtp-Source: AGHT+IHcjfD9BohIyQY2K+y2cqIQJaOKnG2gVdzpr0CxR0WvCRwk6X++0DLZnJtyAdnEd1q303cpCQ==
X-Received: by 2002:a05:600c:470a:b0:404:f9c1:d5d7 with SMTP id v10-20020a05600c470a00b00404f9c1d5d7mr11670069wmo.25.1700136813831;
        Thu, 16 Nov 2023 04:13:33 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/6] automation: update tests to use Debian Bookworm
Date: Thu, 16 Nov 2023 13:13:08 +0100
Message-ID: <20231116121310.72210-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116121310.72210-1-roger.pau@citrix.com>
References: <20231116121310.72210-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch tests using Stretch to Bookworm, as Stretch is EOL.

Note the packages are not removed from the Stretch dockerfile, because the
tests in stable branches will run using the old containers.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The Bookworm container needs to be updated to contain the required tools before
pushing this change.
---
 automation/build/debian/bookworm.dockerfile | 5 +++++
 automation/gitlab-ci/test.yaml              | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
index ae008c8d46e5..7aea081c13a9 100644
--- a/automation/build/debian/bookworm.dockerfile
+++ b/automation/build/debian/bookworm.dockerfile
@@ -46,6 +46,11 @@ RUN apt-get update && \
         gnupg \
         apt-transport-https \
         golang \
+        # for test phase, qemu-smoke-* jobs
+        qemu-system-x86 \
+        # for test phase, qemu-alpine-* jobs
+        cpio \
+        busybox-static \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 61e642cce0cc..6aabdb9d156f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -43,7 +43,7 @@
 .qemu-x86-64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:stretch
+    CONTAINER: debian:bookworm
     LOGFILE: qemu-smoke-x86-64.log
   artifacts:
     paths:
@@ -130,7 +130,7 @@
 build-each-commit-gcc:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:stretch
+    CONTAINER: debian:bookworm
     XEN_TARGET_ARCH: x86_64
     CC: gcc
   script:
-- 
2.42.0


