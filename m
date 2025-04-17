Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FBCA92053
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:55:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957979.1350964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Qdv-0005yY-RJ; Thu, 17 Apr 2025 14:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957979.1350964; Thu, 17 Apr 2025 14:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Qdv-0005vi-OX; Thu, 17 Apr 2025 14:55:07 +0000
Received: by outflank-mailman (input) for mailman id 957979;
 Thu, 17 Apr 2025 14:55:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CA5y=XD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u5Qdu-0005St-RQ
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:55:06 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f27a1014-1b9b-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 16:55:05 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso657345f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:55:05 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c02esm20175944f8f.23.2025.04.17.07.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 07:55:04 -0700 (PDT)
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
X-Inumbo-ID: f27a1014-1b9b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744901704; x=1745506504; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nzvS1du9WvDKG1XtS3bVT+jcwbh9Tzb4+jAEETHwlvU=;
        b=APJmGgc31swBQBOdkzfEqpbMafVc/x/2/y8AMDLDQ9tQhtkD9X1TuuXsFJTcnYCj3N
         XZCMy20lVcrPAuEr487GxCeW6QqGgUBgDb4zPxOHY53mcCIo02rfB/609ps9IqzKQifF
         b/5EIH7BqKVw92W2gV75rIw+LjhAOTCmWu2w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901704; x=1745506504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzvS1du9WvDKG1XtS3bVT+jcwbh9Tzb4+jAEETHwlvU=;
        b=PZiEmpFKxckrX//G+3DUUqBcSHB0KkczPgDLTY/xOtT6ADX1NLQje7nVrkYZg11G+0
         yg8uy3Awu5QPe/OB6fgd+NYjlGTNH2nVyw0V9ck9cvit4j1EIVCVkB6OEG6aa3Lnboou
         CZqRjptemWgKQSrrPymxzYZ4I2+y1vKpExn9rp2YVFXsm6hpO1EKjDUxkFG2m4cbVa5/
         oLIHt6qAV1XRKBAY6hcMNngPHxIqO0kE15ISr+/aQ51+nho47yYZV7oFdq1oBRo1768x
         H3L3880NWstLps9WlrobFNKogINGZK5EpiS8LkxAk4TWOZNPFU4BF/odaHXkKMFkQ5O3
         e0FQ==
X-Gm-Message-State: AOJu0Yw/ugxNr/SLqYJqUo+l7cGciCCVEU+FZ5i8eq6qAukFkdZQSbdJ
	V699vFUIB9faUJkhb8ehLW4dblMgVrqOsxOgd0wuOSqm0m0Uvbl04h/cN76/FZ+Cus/TD90V8BM
	LQNc=
X-Gm-Gg: ASbGncuiPwVPGPGbYaVjOHr5l/y5enOd4ek6VSlmDkhmN1xWzmh+Hd9MGFrxBE41XVv
	unMPQvRl7WXfY0g8O+qIIVJlP8UO6xkLea2LQC52qtG0mwLSDZ/r5Ql2KfwE/ZSLchL6X/MxTPz
	e2CcV4/a1ZNdCzKHZmOK3vozakx3Dg+AsRxmFJ+ktna5xpLwv6n5mNcPxovg7D2z15m9sLKtpDS
	1TOId0cPkOYUqXT8bDEsuzVanJrKSNBNkquTNAbRw+eYmKb5ArkdeTPgVN5IhoUiP4Es7AmPpWW
	/Cdj3w8nv2MIw5Ie00AZxvMoV9rudJOHub/VLb5V3A8dweYSnyWmOLzhgticFh9O9T/e7lNP1eH
	eSe2dgI4DjIRLPQ==
X-Google-Smtp-Source: AGHT+IEAUfRiY4zb9ji7d3oNtoCvF/jWCcUtbHJdOzrBKcqhtIDs0azrTxWjgk2ZQgOdCzrTB6QiXA==
X-Received: by 2002:a05:6000:1acf:b0:39c:1efb:eec9 with SMTP id ffacd0b85a97d-39ef9cd9deamr39278f8f.13.1744901704382;
        Thu, 17 Apr 2025 07:55:04 -0700 (PDT)
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
Subject: [PATCH] Update to latest Argo
Date: Thu, 17 Apr 2025 15:55:02 +0100
Message-Id: <20250417145502.2565165-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bugfixes I submitted during commit 36500bcb5e24 ("Overhaul how Argo is
built and packged") have now been merged.

Update the version used, and drop the -Wno-error workaround.

Link: https://github.com/OpenXT/linux-xen-argo/pull/21
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 .gitlab-ci.yml        | 2 +-
 scripts/build-argo.sh | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 74335363d5ed..dcf76db6ec62 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -61,7 +61,7 @@ linux-6.6.56-x86_64:
   script: ./scripts/build-linux.sh
   variables:
     LINUX_VERSION: 6.6.56
-    ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
+    ARGO_SHA: "cf73819cacc945baca1a7421e5836d1bd481739b"
     ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
 
 microcode-x86:
diff --git a/scripts/build-argo.sh b/scripts/build-argo.sh
index ef7057d847d4..cd01078a3f39 100755
--- a/scripts/build-argo.sh
+++ b/scripts/build-argo.sh
@@ -20,7 +20,6 @@ git -C "${WORKDIR}/linux-xen-argo" switch --detach FETCH_HEAD
 make -j$(nproc) -C "linux-${LINUX_VERSION}" \
      M="${WORKDIR}/linux-xen-argo/argo-linux" \
      KBUILD_MODPOST_WARN=1 \
-     CFLAGS_MODULE="-Wno-error" \
      modules
 install -D -m644 "${WORKDIR}/linux-xen-argo/argo-linux/xen-argo.ko" \
      "${ARGODIR}/lib/modules/${LINUX_VERSION}/updates/xen-argo.ko"
-- 
2.39.5


