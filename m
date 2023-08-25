Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE67787EA3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 05:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590458.922750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZNcs-0004vs-MQ; Fri, 25 Aug 2023 03:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590458.922750; Fri, 25 Aug 2023 03:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZNcs-0004sa-JJ; Fri, 25 Aug 2023 03:36:46 +0000
Received: by outflank-mailman (input) for mailman id 590458;
 Fri, 25 Aug 2023 03:36:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SuHx=EK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qZNcr-0004sU-Og
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 03:36:45 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bf07110-42f8-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 05:36:44 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68730bafa6bso1109936b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 20:36:44 -0700 (PDT)
Received: from leoy-yangtze.lan ([8.45.48.113])
 by smtp.gmail.com with ESMTPSA id
 h24-20020aa786d8000000b00679a4b56e41sm483913pfo.43.2023.08.24.20.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 20:36:41 -0700 (PDT)
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
X-Inumbo-ID: 9bf07110-42f8-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692934602; x=1693539402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXexLeK6NuBtwNDUeDgEoZ7lfkGJbyKUa0bHyYHLxbM=;
        b=cNJrRoE9xRwMnignZv+tZQ+HjZsSNXlPMMBP/hsGL7nFjKu/AmCRwHAXO09uDzieDz
         hDAmiYBK6UcYALyXCj7ezkF8Aafx199FuPLufBTNjseY1JNUXtJEXF1BqkSznoadsr1l
         TEJ+Q7JZabrtSM8RkbxFHDp/BN0a1xgMuJHeeVrK7+bsy7oAo6jiURLfy+i/djlWGCjq
         r0A7Q3SM5c1x7Fgl6yyOO051X5M/cPXMzt09It7aWCTx3bK/+WQ9BZDR6PvYdoaXcHey
         qfXos41XifwQqaktq6cNf7K7RLKteWWnrDsYKNGEU3Jcqei+DXHhsQqV1CZJ+buJ67SS
         usJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692934602; x=1693539402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXexLeK6NuBtwNDUeDgEoZ7lfkGJbyKUa0bHyYHLxbM=;
        b=JnIFQ3MkFWXA8W6lwUnVRfPEZxnHshW4HBO9sevTYLyWJRibf9YZbkirG9PlYqMFv6
         eESnHue3+NOZmA18Tbls5CCRb4bpHUVQp5kXBYLwGz7dozeelwRBfpYqPIaUwnGkFEby
         F+mXKQ3GLgSPo8hA/svu7GfxO16J4fa1MOXCLVpiRZ966jVUcgJDbtCdV+o6wTbRosy6
         vxUlfQzSX2za6au/z2JXfmOPs5HcnlZYUzlXjubcGAEfb3v+B7+s0Kwi8ovDVNpSXj2a
         02EGNv1tabMo9/HJgKxoaU8Om3y3ErDYRtADEt2WaxGv8X5Vy2MFkzAO9agutW/+cnq7
         WbKA==
X-Gm-Message-State: AOJu0Yx9jyQyAH9x8ziAOKAZpcDD68uRTtSiz25vLqc9THHam0UEnu03
	fPVUMVD+6HQciSyPI6c8qvB4do2oibbH7KA+mxLiT5xU
X-Google-Smtp-Source: AGHT+IEHiEef1Z9qsfQLqBj4sjYFFPGX936tX6ieejqA5/XQXOtiP5Y1vk0MAOZZ9ehLmaGtKRBg6g==
X-Received: by 2002:a05:6a21:6da5:b0:123:152d:d46b with SMTP id wl37-20020a056a216da500b00123152dd46bmr26028061pzb.26.1692934602147;
        Thu, 24 Aug 2023 20:36:42 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v1] tools/hotplug: systemd: Make dependency on Xen device nodes
Date: Fri, 25 Aug 2023 11:36:16 +0800
Message-Id: <20230825033616.3402812-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When system booting up, the kernel module xen_gntdev.ko is loaded and
the device node '/dev/xen/gntdev' is created; later the xenstored
service in systemd launches daemon to open this device node.

This flow has a race condition between creating the device node in the
kernel module and using the device node in the systemd service.  It's
possible that the xenstored service fails to open the device node due
to the delay of creating the device node.  In the end, xenbus cannot be
used between the Dom0 kernel and the Xen hypervisor.

To resolve this issue, we need to synchronize between udev and systemd
for the device node.  There have an extra change in the udev rules for
tagging 'systemd' for Xen device nodes, which notifies device node
creating to systemd; besides udev change, this patch adds dependency in
systemd service for waiting the device node.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---

 The udev rules change is on github:
 https://github.com/systemd/systemd/pull/28962/commits/520340dfea3b6cf9fe7a24c9238313b1a5fe8539

 tools/hotplug/Linux/systemd/xenstored.service.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/hotplug/Linux/systemd/xenstored.service.in b/tools/hotplug/Linux/systemd/xenstored.service.in
index 261077dc92..6e48cdb0e7 100644
--- a/tools/hotplug/Linux/systemd/xenstored.service.in
+++ b/tools/hotplug/Linux/systemd/xenstored.service.in
@@ -1,7 +1,7 @@
 [Unit]
 Description=The Xen xenstore
-Requires=proc-xen.mount
-After=proc-xen.mount
+Requires=proc-xen.mount dev-xen-gntdev.device
+After=proc-xen.mount dev-xen-gntdev.device
 Before=libvirtd.service libvirt-guests.service
 RefuseManualStop=true
 ConditionPathExists=/proc/xen/capabilities
-- 
2.39.2


