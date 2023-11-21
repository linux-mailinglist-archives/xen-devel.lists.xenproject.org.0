Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B77F3334
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637952.994133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THi-0003QR-Is; Tue, 21 Nov 2023 16:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637952.994133; Tue, 21 Nov 2023 16:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THi-0003Lg-FK; Tue, 21 Nov 2023 16:07:34 +0000
Received: by outflank-mailman (input) for mailman id 637952;
 Tue, 21 Nov 2023 16:07:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5THh-0002HT-D1
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:07:33 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13cd31ab-8888-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 17:07:32 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32f7c44f6a7so3812416f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:07:32 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 z5-20020adff745000000b0032d829e10c0sm14716194wrp.28.2023.11.21.08.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:07:31 -0800 (PST)
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
X-Inumbo-ID: 13cd31ab-8888-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700582852; x=1701187652; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCV+1zq9A+e30W/W/psof5muStM/6Aej39H0kYZVYUo=;
        b=KvUMJ5HEJnAoolT8OLtvG2dlX9Rrr1kZAY1v1gRHaOaoXamPG9BjEuBMwtpPgRpc46
         fBTCASG5i30v8pUCgm/uVmerxam1tGjTjK11jSj1kJB3Q6Z2QRu0MUp5F6uIg+yxPlTS
         P/WrmIwJ76HChz/svm2c6l/+UGFFWYU9tHoWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582852; x=1701187652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCV+1zq9A+e30W/W/psof5muStM/6Aej39H0kYZVYUo=;
        b=fH7jBATMR+eV5/SVQD+NUtghkfeVLCDBbGBXAGekLb9pX+oEQtPJhajKwoFiyilr3y
         aafqsplSdvmuP/U0142QTMmTA9fEuh+k2Axh0ykZUqKFmMkppN51gIKTM/6xpWsPJO6Y
         W2EoK+Tkl/+L5L/eak3AXzdZULi1f+lqGP1agQgaEeZFhPzrpv3l21t/g0Tz7LKNmLiV
         b6XbFaavKMN6qwosXh00ZQFHuCMcdZkX90k3LMpqJ7MrcHIEzEM7ymIwAt64bO+UW4Px
         Sqxfnyfg4dpiQpSOhNGssOYE0yt+6ROPzFjCEFYjtilR2Ky4/j+/VTJAKqmvWOS+NMR1
         h5wg==
X-Gm-Message-State: AOJu0YwMGCCN/MHckMIX98/PmyWbR0LfkSmYdolg7+vOawzDmJgX4ZGz
	0J0QD/7kVYgIPLF+DiHHPlQ/bFljifHLfKsbVtE=
X-Google-Smtp-Source: AGHT+IEQOv5XNaEPXVRMBZRZpRyl/CclL+IqVyae19Y0xgnqPjj+yBrIQEFhxFR0gPwVKEttSpeonQ==
X-Received: by 2002:a5d:5f56:0:b0:332:c9ed:cc2c with SMTP id cm22-20020a5d5f56000000b00332c9edcc2cmr5672108wrb.3.1700582851919;
        Tue, 21 Nov 2023 08:07:31 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 5/7] automation: update tests to use Debian Bookworm
Date: Tue, 21 Nov 2023 17:03:56 +0100
Message-ID: <20231121160358.8080-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121160358.8080-1-roger.pau@citrix.com>
References: <20231121160358.8080-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch tests using Stretch to Bookworm, as Stretch is EOL.

Note the packages are not removed from the Stretch dockerfile, because the
tests in stable branches will run using the old containers.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


