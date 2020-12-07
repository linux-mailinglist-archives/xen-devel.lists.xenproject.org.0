Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981082D0EE5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46268.82131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEcv-0005zo-Iq; Mon, 07 Dec 2020 11:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46268.82131; Mon, 07 Dec 2020 11:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEcv-0005zB-EP; Mon, 07 Dec 2020 11:24:21 +0000
Received: by outflank-mailman (input) for mailman id 46268;
 Mon, 07 Dec 2020 11:24:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmEct-0005oS-JE
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:24:19 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a50f0ea1-a04e-47c8-ad9c-93dc79228f2f;
 Mon, 07 Dec 2020 11:24:16 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-Ry8Whu46NJif-OwNPCDUhQ-1; Mon, 07 Dec 2020 06:24:14 -0500
Received: by mail-wm1-f71.google.com with SMTP id v5so5253269wmj.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 03:24:14 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h15sm9685217wru.4.2020.12.07.03.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:24:12 -0800 (PST)
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
X-Inumbo-ID: a50f0ea1-a04e-47c8-ad9c-93dc79228f2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607340256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g8YbOmB7dREvSr94Ah+ZfiHf5NH/XpXwyjPJvESlyyU=;
	b=Ys9lvdx6okvnYPvX2CLGyGO4uqbxWwdcKZ5cmIBPcmU+TCiblaFT65V/FGHBnInSAVSWqC
	I1DNMjyqf6Yu8kQd4Aulr+Uzn01B6pJ3DxoKw5cubBkfc1DK3iAKZP2Xr/rbzRFfVFAONJ
	Mah/fXjxdTo8VYfCT88i5AokEvo2Hb4=
X-MC-Unique: Ry8Whu46NJif-OwNPCDUhQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g8YbOmB7dREvSr94Ah+ZfiHf5NH/XpXwyjPJvESlyyU=;
        b=sprac8N4ZK51ObGwUhlvURbCddF+WKp4EpHT0HBNBAVQRXYHRslGDRJHYswdvJTib2
         HAHZNIKZhyMU0FMiUaf3D/WILsvLIt5FlUdHsTMgw84/FWuzPeqllzaaX8iEcYDXmurM
         g9zYlz5lRePMYB1wkqgrsc1eCi0aRtIw5Al+YPImOgoFaEhh9Ay2t9mqVTdCnjAiWOa4
         A6bsNGD2TayYVqk9MDbehppjZJfKXr0t3BAcjhr4F6Wgka5mHXFjLPVatF/WTXQU1Oia
         HgECTF1n+FSjzT4edydH9SaV5li1GvBgLgz4U8ZIMJItEmuVmjQdaKMYp/3bxwhA6I4v
         Ph0A==
X-Gm-Message-State: AOAM532f+S7cpobr/Q1GNI+Hz/AXqQZ/imcdrZtVxqodMY6YfkSGMJfK
	FMRqu46WU16qKKiu92q4W7P2afX1f7myI9u9SSHOvF8D/48Hip4RcYEpvQwOipXHF1tXZnOI84q
	W2Oj52GnuhLp4mBTBNFSIetzmn9g=
X-Received: by 2002:a5d:6805:: with SMTP id w5mr19619040wru.266.1607340253257;
        Mon, 07 Dec 2020 03:24:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRhB+8o3YIMMi0wDgCqDhu5Xr6LYssbvv4B7yWBshnzqnJb7A4bMr+1Oelyf2ZqMu7nwNEpg==
X-Received: by 2002:a5d:6805:: with SMTP id w5mr19619019wru.266.1607340253057;
        Mon, 07 Dec 2020 03:24:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Willian Rampazzo <wrampazz@redhat.com>,
	qemu-s390x@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/5] gitlab-ci: Introduce 'cross_accel_build_job' template
Date: Mon,  7 Dec 2020 12:23:51 +0100
Message-Id: <20201207112353.3814480-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207112353.3814480-1-philmd@redhat.com>
References: <20201207112353.3814480-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a job template to cross-build accelerator specific
jobs (enable a specific accelerator, disabling the others).

The specific accelerator is selected by the $ACCEL environment
variable (default to KVM).

Extra options such disabling other accelerators are passed
via the $ACCEL_CONFIGURE_OPTS environment variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 099949aaef3..d8685ade376 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -13,6 +13,23 @@
           xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
 
+# Job to cross-build specific accelerators.
+#
+# Set the $ACCEL variable to select the specific accelerator (default to
+# KVM), and set extra options (such disabling other accelerators) via the
+# $ACCEL_CONFIGURE_OPTS variable.
+.cross_accel_build_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  timeout: 30m
+  script:
+    - mkdir build
+    - cd build
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
+        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
+    - make -j$(expr $(nproc) + 1) all check-build
+
 .cross_user_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-- 
2.26.2


