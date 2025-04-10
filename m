Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D1A84F3E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 23:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946384.1344318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zaZ-0000QR-8e; Thu, 10 Apr 2025 21:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946384.1344318; Thu, 10 Apr 2025 21:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zaZ-0000ND-57; Thu, 10 Apr 2025 21:37:35 +0000
Received: by outflank-mailman (input) for mailman id 946384;
 Thu, 10 Apr 2025 21:37:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2zaX-0008Ll-JG
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 21:37:33 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02369862-1654-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 23:37:32 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso697195f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 14:37:32 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9780a0sm100427f8f.50.2025.04.10.14.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 14:37:30 -0700 (PDT)
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
X-Inumbo-ID: 02369862-1654-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744321051; x=1744925851; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nr3sOGZANa0DEvlAfKrqTmFvr3DzveYawZZlLIxI7wM=;
        b=IwMgOPL3wq/O4+1Xctg2qf+IfbOmKqyqBubbR0lZQuc2ENYGKFBTqub3tzCEpigR6G
         7w8OXx5v+D1b3UtlvqW7noO5OstSH+v8X8mq8IzPylpfNhJgpe5xeAKEZGwYcLL1O+C4
         Ialpr6cE8sY3rN1Cy8LyxiaeBcaxq0FRETFZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744321051; x=1744925851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nr3sOGZANa0DEvlAfKrqTmFvr3DzveYawZZlLIxI7wM=;
        b=ZZdslhW41WJx5RCoBF5pqYFQIlHAsUCxa6M9Saset3K7UuwA5kX85DuB4uCT1dE71H
         yLRnsqYmuZcWPhKIAfyd17H0Mpn9YIMjIgOJg09mgJOoqY0cl4AQHCoRW8SJfo6KVm5G
         4H5/GlGW4MCvnNsn6PYu/qApESXsMXOtnoXXe5nvSh9LpH1mUU5zJ4NUefhCPL1GCoGD
         C+AHioSgS4BFHiaEtr9SKyM8bqLU+Nv6QqzsHcpHKQV1mSQFDDUa5+eoFXO8Nhg5g267
         sud2yK2C43SnADZjKEXyHh/wrsxwWQLd1pW7XaULM3c+/+yZwxQQD2oZqAvlHcwTXikc
         CnCA==
X-Gm-Message-State: AOJu0YwEB2HisriiCwkHw/owx+b+Jxy85ODWRbwNuwelrqP3Ivk7IS3S
	UM41utqVeROoITr3EWkNcCzbQ2Um4x8Zzmn+ECjoPksOyZPGwdUM97aw50Hg19br7IuURxdIEtO
	XWIY=
X-Gm-Gg: ASbGncs6JZN8Wptpj6QXd4SlkzOELh8lRVu3m4VsuQF9NW63aegieQrP+A9xrI1X2hM
	u904pTHE68ZQG04DoXGpG3WaeiuamHPtNaoP55P0RODvaiVyl5DrKy/Z4+/UsnqxKMloveMHakH
	5YwinSoNCdIrw2xKi0d+2O1r1v6LN2AfQseEnUoD+6Z6rZHUHq74HKhzF7W6xGRN0n15RgWfNg+
	9VXdtR9QvOidlKklqPpbjBji7ica4IGP7ugbxT6XBptUOcH/x3XlQX+wEUcn9QMNmIRju6cBFix
	/W5NMupOEBRD63dvSV4Xk0kJWBPI4OjL2yvioAEAxQ4/RAosn8XaijWE9vcZNPKnVUPYKt1Yovc
	8ReG1Qa6T0uKNvQ==
X-Google-Smtp-Source: AGHT+IGS6VzZxRdAxk0y6aF/KnygVxAeBVRoxa28JHprLKXTrW4IjEUHdIdZHHhw+Qc2qJU6XGmLGA==
X-Received: by 2002:a05:6000:1a88:b0:391:3cb7:d441 with SMTP id ffacd0b85a97d-39ea5212b03mr175108f8f.25.1744321051269;
        Thu, 10 Apr 2025 14:37:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 3/4] Switch to fixed Argo
Date: Thu, 10 Apr 2025 22:37:23 +0100
Message-Id: <20250410213724.2098383-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410213724.2098383-1-andrew.cooper3@citrix.com>
References: <20250410213724.2098383-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

https://github.com/OpenXT/linux-xen-argo/pull/21

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Probably not for applying, but it would be really good if we could make these
bugs go away.
---
 .gitlab-ci.yml        | 2 +-
 scripts/build-argo.sh | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 790a6d9f9896..1d2c72b268a3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -47,7 +47,7 @@ linux-6.6.56-x86_64:
   script: ./scripts/build-linux.sh
   variables:
     LINUX_VERSION: 6.6.56
-    ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
+    ARGO_SHA: "ca5473a56f62e2b4d59697c8552d151391d3fec1"
     ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
 
 #
diff --git a/scripts/build-argo.sh b/scripts/build-argo.sh
index 0b4005f3b9a0..a18a259779c6 100644
--- a/scripts/build-argo.sh
+++ b/scripts/build-argo.sh
@@ -11,7 +11,7 @@ cd "${WORKDIR}"
 #
 ARGODIR="${WORKDIR}/argo-root"
 
-git clone https://github.com/OpenXT/linux-xen-argo.git --depth=1
+git clone https://github.com/andyhhp/linux-xen-argo.git --depth=1
 git -C "${WORKDIR}/linux-xen-argo" fetch origin "${ARGO_SHA}"
 git -C "${WORKDIR}/linux-xen-argo" switch --detach FETCH_HEAD
 
@@ -20,7 +20,6 @@ git -C "${WORKDIR}/linux-xen-argo" switch --detach FETCH_HEAD
 make -C "linux-${LINUX_VERSION}" \
      M="${WORKDIR}/linux-xen-argo/argo-linux" \
      KBUILD_MODPOST_WARN=1 \
-     CFLAGS_MODULE="-Wno-error" \
      modules
 install -D -m644 "${WORKDIR}/linux-xen-argo/argo-linux/xen-argo.ko" \
      "${ARGODIR}/lib/modules/${LINUX_VERSION}/updates/xen-argo.ko"
-- 
2.39.5


