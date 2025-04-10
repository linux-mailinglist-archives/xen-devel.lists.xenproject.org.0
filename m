Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2784A84F3C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 23:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946386.1344333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zaa-0000kp-VG; Thu, 10 Apr 2025 21:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946386.1344333; Thu, 10 Apr 2025 21:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zaa-0000fW-Pn; Thu, 10 Apr 2025 21:37:36 +0000
Received: by outflank-mailman (input) for mailman id 946386;
 Thu, 10 Apr 2025 21:37:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2zaZ-0008Ll-BQ
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 21:37:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02b045b5-1654-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 23:37:32 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so7402785e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 14:37:32 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9780a0sm100427f8f.50.2025.04.10.14.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 14:37:31 -0700 (PDT)
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
X-Inumbo-ID: 02b045b5-1654-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744321052; x=1744925852; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D17IkUr2my28TpWIQRZBF41FCJbDL7Htbn47+p4/2zc=;
        b=vhNfjnP5ImEyjm0pw4c1eSVvtqhQnW41BdsiXgU8ezXc2A6zBRnVJsbTk+4XGsthcX
         6z6dLQs4zLv1W80bkmqD2ULEHNxXqxD/gaUmqIGMyVnXQocbwEm7oH22emSRxf6tf4+M
         Vwdc9AA6YPGO2wm9wL/CA82SCELzAMXd/fS5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744321052; x=1744925852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D17IkUr2my28TpWIQRZBF41FCJbDL7Htbn47+p4/2zc=;
        b=EPtej3waveKS4GWagWqWJaPPqZT+roZT25LVT88pPloOYIUv3EbEYxEHkPvd65IL4H
         SbH9vyIIWK3o9wtvbWF/7MjXCm5Z9svSQoo5pQmdPFukdqEhLk8Jy7dp4qhi4021yHPA
         H267NJk3bVo4lBnsu1M2PtsRSsElA4/mqtqoA8nR4FNZDatCAx4Ks1lqjwj00gx26MuC
         ac2VJJaJIMIKIDFrKwRLGEl/15r1o/8CMIxGxeTjqQz0heE5DuXhMhiyjmn3pOHOb2c7
         NkiLYCihaJcVO1AJy23tslCJPDSdRVVVHZTxwFP0T6dRHvFzX8hLKunXssaMWTEH1Bm0
         OPdA==
X-Gm-Message-State: AOJu0YyZSQC8e/cZWTt9M1cbhgNjv9p8lF6KMh7xup6jr20sF0ZAXoje
	xW0vfdFW56utB04NacNKEd/hZwOBfnpcdHr3GfN3A7EfixAEpMsSO/hyw9H2/yVBO2MmD6QloYl
	6CGE=
X-Gm-Gg: ASbGncvw78GOH6MB+Xy+UULJRRCNEi9tJNm1UxqGzv3WLBzI/1vIaSAuYX4kSL25L0L
	eYEkSPoyn0BSs9h7rUex+5J87o8mxXefWEzvXb3rVWu7Zl4VOBVmE1q8SqJjxZ+5d4yiyM7qhv5
	d0iO1wVtIE/BBBpSRuPNMtOhLqz+aLVGD8ngpBLYWaDE04oAgWKlUecVleR1On32yxOx1E2P17P
	QWU9g1XFRBeojURFu9O+O34cZZ04hIHX0sq5Bp9SL228I0ijG+hgGyT4KXuDQ/DbwN9quCkdF3q
	L/0M0Xa9ipV+TC5bYjkRpqO1fpJhRfVi3R94sov/eT3mvbldTpxLrFZucRhlqVvt0Kn7yT8brwx
	Pz4VKi/6MXn7feVtyAYtPBOW4
X-Google-Smtp-Source: AGHT+IGIRZp3olHSsqY0SZOnyMzgDnMNtHsCxFHClUqNFDdZOJQ2BXNkvwtbK3pG1jKln6avwVSFnQ==
X-Received: by 2002:a05:600c:5249:b0:43d:7588:6687 with SMTP id 5b1f17b1804b1-43f3a93f621mr1098065e9.12.1744321052014;
        Thu, 10 Apr 2025 14:37:32 -0700 (PDT)
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
Subject: [PATCH XEN 4/4] CI: Switch to new argo artefact
Date: Thu, 10 Apr 2025 22:37:24 +0100
Message-Id: <20250410213724.2098383-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410213724.2098383-1-andrew.cooper3@citrix.com>
References: <20250410213724.2098383-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen-argo.ko has moved into the standard location.  In the short term, simply
unpack argo.cpio.gz, but this can be simply concatinated with the base rootfs
when it is constructed in a more convenient way.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/9690063969

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 59a2de28c864..9a533eedb941 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -240,14 +240,11 @@ xilinx-smoke-dom0-x86_64-gcc-debug-argo:
   needs:
     - alpine-3.18-gcc-debug
     - project: xen-project/hardware/test-artifacts
-      job: x86_64-kernel-linux-6.6.56
+      job: linux-6.6.56-x86_64
       ref: master
     - project: xen-project/hardware/test-artifacts
       job: x86_64-rootfs-alpine-3.18
       ref: master
-    - project: xen-project/hardware/test-artifacts
-      job: x86_64-argo-linux-6.6.56
-      ref: master
 
 adl-smoke-x86-64-gcc-debug:
   extends: .adl-x86-64
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 7834ffbe0593..e97702f22827 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -66,7 +66,7 @@ then
     PASS_MSG="TEST: Message from DOMU"
     XEN_CMD_EXTRA="argo=1,mac-permissive=1"
     DOMU_CMD="
-insmod /root/xen-argo.ko
+insmod /lib/modules/\$(uname -r)/updates/xen-argo.ko
 until false
 do
   echo \"${PASS_MSG}\"
@@ -74,15 +74,13 @@ do
 done | argo-exec -p 28333 -d 0 -- /bin/echo
 "
     DOM0_CMD="
-insmod /root/xen-argo.ko
+insmod /lib/modules/\$(uname -r)/updates/xen-argo.ko
 xl -vvv create /etc/xen/domU.cfg
 argo-exec -l -p 28333 -- /bin/echo
 "
 copy_dom0_files ()
 {
-    cp "${WORKDIR}/binaries/xen-argo.ko" "root/"
-    cp -ar "${WORKDIR}/binaries/lib/"* "usr/local/lib/"
-    cp "${WORKDIR}/binaries/argo-exec" "usr/local/bin/"
+    zcat ${WORKDIR}/binaries/argo.cpio.gz | cpio -idv
 }
 copy_domU_files () { copy_dom0_files; }
 else

