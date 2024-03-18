Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BF687EE47
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:00:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694968.1084446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGKz-0005ON-Sp; Mon, 18 Mar 2024 16:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694968.1084446; Mon, 18 Mar 2024 16:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGKz-0005MK-QA; Mon, 18 Mar 2024 16:59:49 +0000
Received: by outflank-mailman (input) for mailman id 694968;
 Mon, 18 Mar 2024 16:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHT-0002f9-RY
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:11 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bbc4195-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:10 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41412e6b2cfso6573085e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:10 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:09 -0700 (PDT)
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
X-Inumbo-ID: 6bbc4195-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780970; x=1711385770; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vSVbaeX7MmaJBk10Hu8Qu/+WIlUUHoLJc0mR6P7msQ=;
        b=TyowofsPCCvt9Ocm+DukG/HMyZBju+IsUIwbNj1JHo+hXq54y3oUDUJ4N5sAcQdiZb
         Fus+Ct6cRW7kip7g/cMr1Q7GZ1vndbc/njqMXzLcGiEDjfeECue1jtZP9bCDHEU26+q/
         x4YVsw5vs3XK6V/EGS8BSVr6XTHzoR+i/O+L4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780970; x=1711385770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vSVbaeX7MmaJBk10Hu8Qu/+WIlUUHoLJc0mR6P7msQ=;
        b=q2IJD/IKOifQNjaWd6/neWcGTmhyL6hN5Au8Lrep0oNhcbtU2xYnIOA1VEp+zCoqjx
         LcSaPin7sAMnrOCKDj23P2sZvDaTfav0GPVqNXZyB9ezuUNAopnldDJZ8cG22fuctw6s
         qBOFCxizdepKj2S2Ny7W/xpNhx7I5bgwXp1/02vb1YR5nLDDQFlku1f8tNFmio///hOP
         6jz/w7KytQ1vlkydinnvmuHapcLcsinfhycs1bcrA4HpZS76Gkagq47ihcTY8XQHEyMZ
         0k0uSmPSYJ76E6qy+u1ZPJ0W4LrdUxD54KFI57W+8F20x5xRM94gZvXPFd+N0/kecfGs
         F1GQ==
X-Gm-Message-State: AOJu0YxRSRcDVUj3EsDaak5IJ2GZt+4z/VXAP6ZQC/ata+LtwQSMkMBB
	FZfyQtpC5o3k9/fuNWqpqQQPcR8DbmwNChphTwM2tbNpSFkpK8xWM6XR9o2/nCC0kG3PQOVq57C
	N
X-Google-Smtp-Source: AGHT+IHc6tEK6LHXMJQd7rlrLaf6dRX6GOnl9+9ew3zNLSZmb0XPcsMiFQNxTzFeNsTNHVFZ9f5mRw==
X-Received: by 2002:a05:600c:3549:b0:414:523f:90d2 with SMTP id i9-20020a05600c354900b00414523f90d2mr1042549wmq.34.1710780969870;
        Mon, 18 Mar 2024 09:56:09 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 22/36] setupboot_grub2: Parse arm64 uefi grub verbes
Date: Mon, 18 Mar 2024 16:55:31 +0000
Message-Id: <20240318165545.3898-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

20_linux_xen now uses "xen_hypervisor" and "xen_module" in place of
"multiboot2?" and "module2?" when generating a config file for
arm64-uefi.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/Debian.pm | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 57f31977..4f07cdef 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -541,7 +541,7 @@ sub setupboot_grub2 ($$$$) {
                 $entry->{Hv}= $1;
                 $entry->{Chainload} = 1;
             }
-            if (m/^\s*multiboot2?\s+(?:\/boot)?\/(xen\-[0-9][-+.0-9a-z]*\S+)\s+(.*)/) {
+            if (m/^\s*(?:multiboot2?|xen_hypervisor)\s+(?:\/boot)?\/(xen\-[0-9][-+.0-9a-z]*\S+)\s+(.*)/) {
                 die unless $entry;
                 $entry->{Hv}= $1;
                 $entry->{Chainload} = 0;
@@ -553,16 +553,16 @@ sub setupboot_grub2 ($$$$) {
                 $entry->{KernVer}= $2;
                 $entry->{KernOpts}= $3;
             }
-            if (m/^\s*module2?\s*(?:\/boot)?\/(vmlinu[xz]-(\S+))\s+(.*)/) {
+            if (m/^\s*(?:module2?|xen_module)\s*(?:\/boot)?\/(vmlinu[xz]-(\S+))\s+(.*)/) {
                 die unless $entry;
                 $entry->{KernDom0}= $1;
                 $entry->{KernVer}= $2;
                 $entry->{KernOpts}= $3;
             }
-            if (m/^\s*module2?\s+(?:--nounzip\s+)*(?:\/boot)?\/(initrd\S+)/) {
+            if (m/^\s*(?:module2?|xen_module)\s+(?:--nounzip\s+)*(?:\/boot)?\/(initrd\S+)/) {
                 $entry->{Initrd}= $1;
             }
-	    if (m/^\s*module2?\s*\/(xenpolicy\S+)/) {
+	    if (m/^\s*(?:module2?|xen_module)\s*\/(xenpolicy\S+)/) {
                 $entry->{Xenpolicy}= $1;
             }
         }
-- 
Anthony PERARD


