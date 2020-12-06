Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A122D069B
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 19:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45756.81201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzBw-0005fS-7V; Sun, 06 Dec 2020 18:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45756.81201; Sun, 06 Dec 2020 18:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzBw-0005et-3V; Sun, 06 Dec 2020 18:55:28 +0000
Received: by outflank-mailman (input) for mailman id 45756;
 Sun, 06 Dec 2020 18:55:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PoKi=FK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1klzBu-0005bW-L3
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 18:55:26 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9e4ae0b5-f640-46e1-9212-963813a10a1a;
 Sun, 06 Dec 2020 18:55:26 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-k4hPAIXZONqWfVhOYJ2A7A-1; Sun, 06 Dec 2020 13:55:24 -0500
Received: by mail-wm1-f71.google.com with SMTP id z12so4305120wmf.9
 for <xen-devel@lists.xenproject.org>; Sun, 06 Dec 2020 10:55:23 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id m8sm11324488wmc.27.2020.12.06.10.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:22 -0800 (PST)
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
X-Inumbo-ID: 9e4ae0b5-f640-46e1-9212-963813a10a1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0Lqr22l7ATKhofbc7EdyOSapxnrV+ynGfxlD6q9jNk=;
	b=SSnMWYCsfN1oznTMN5e15j3msdb78/4wuJHDZJ3IjSJEqQglO8DyMUIEBmhwVjg/Epa5tu
	6qhnX6SOH82ORSDjgM9XAZkp1VinVgATzFdXRr+OEq6XSgAhS1CuCCzhgYu4jgniL6t3Vy
	6vPfZEEvJ0lreixQMVUmvjlz1T0R7Fc=
X-MC-Unique: k4hPAIXZONqWfVhOYJ2A7A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r0Lqr22l7ATKhofbc7EdyOSapxnrV+ynGfxlD6q9jNk=;
        b=QR/y8tPSng0WSDfnSMIkbg4AdA06u61Lm85CdOvA6fhXZ4BXuvK3GOlGgE/Ppdh42n
         iJORxAKPKeiD3xpZS5+srmTIfgZP+2EhQd5gSYPVAcDdYB9qK/gQLCCJ5TrsM2S4FTtO
         NSinYqZgx1JZnriB2V8PePHCzHjYX3vFh00GwzaKOqLfbjLlxtTUQoVV7bWoirG7hclX
         v7UjTYgawLWYUOaLci3V2Lw9ZNLHIrEWFUnEq+r7UWhBMEKUxZalZYOhB4is+8y0yKJa
         wAvReuhU5ok0i7rgO/P/CJXGJnMMi8q39t5wg5Nl2AiTHy4A0vSwPt5QntFx9TRC2y6W
         0noA==
X-Gm-Message-State: AOAM533ZbU1aRWkCHdWBXOY93P7FW+sRamOVB14RR/sAYoBf+2gpqou0
	CwmMCFkehMlcuq0glCJ/6LgXAg/5PVwhusxbAa+NEnV2CG/gZwkVj8Ksa4pTZOrb/UUI8xw1E20
	amPRqMdVCMxMT6/BKddaE4djc0a4=
X-Received: by 2002:a1c:e084:: with SMTP id x126mr14748217wmg.109.1607280923046;
        Sun, 06 Dec 2020 10:55:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUdCKKWJAWPI622MaP/oFwVO6CryrIW/lu5gCYVi0AVbbug+7fy7NlRBDMxgrTLJyAtgWuOA==
X-Received: by 2002:a1c:e084:: with SMTP id x126mr14748201wmg.109.1607280922898;
        Sun, 06 Dec 2020 10:55:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Huacai Chen <chenhc@lemote.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Claudio Fontana <cfontana@suse.de>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-s390x@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org
Subject: [PATCH 2/8] gitlab-ci: Introduce 'cross_accel_build_job' template
Date: Sun,  6 Dec 2020 19:55:02 +0100
Message-Id: <20201206185508.3545711-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206185508.3545711-1-philmd@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a job template to cross-build accelerator specific
jobs (enable a specific accelerator, disabling the others).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 099949aaef3..be63b209c5b 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -13,6 +13,18 @@
           xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
 
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


