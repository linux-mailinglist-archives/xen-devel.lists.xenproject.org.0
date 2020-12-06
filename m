Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3882D069F
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 19:56:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45781.81261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzCX-0006Dp-8i; Sun, 06 Dec 2020 18:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45781.81261; Sun, 06 Dec 2020 18:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzCX-0006DJ-3B; Sun, 06 Dec 2020 18:56:05 +0000
Received: by outflank-mailman (input) for mailman id 45781;
 Sun, 06 Dec 2020 18:56:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PoKi=FK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1klzCV-0005yj-JT
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 18:56:03 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c4d38cca-8728-41d0-b9be-15c84107e0be;
 Sun, 06 Dec 2020 18:55:54 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-mFqtb2s5PCGrHFEL6fSgeQ-1; Sun, 06 Dec 2020 13:55:53 -0500
Received: by mail-wm1-f72.google.com with SMTP id b184so3257895wmh.6
 for <xen-devel@lists.xenproject.org>; Sun, 06 Dec 2020 10:55:52 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v20sm10922213wml.34.2020.12.06.10.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:50 -0800 (PST)
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
X-Inumbo-ID: c4d38cca-8728-41d0-b9be-15c84107e0be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i1vxVlVvkT3sP8apHjKZ3bpOmMfnVbEari6EJ9mVBVw=;
	b=iGDNmebkOhWUfG8LT03wEQ5zmhbG2UMW+jLtEA5KbVdcKuV/FX5Pmhah+79/YCrPlcej+A
	nyYbYWIjiCjxpDVZbVe/jODP3vP5UuBR/ftWqpT4iKdQf+r8vbFSGASNmOH0KJStUboXyT
	5LxU36mGwZYuwj4Pymf9XPf1IjxMaks=
X-MC-Unique: mFqtb2s5PCGrHFEL6fSgeQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i1vxVlVvkT3sP8apHjKZ3bpOmMfnVbEari6EJ9mVBVw=;
        b=kz+wODeI075SOo5Kz8jcCYKmxc0smy2GobjYNuYEkRjbXlzocJrZFVEbcbFKT9z/hu
         yyOEwwlJYzDvrRKx1RaIo9j8gHi5v0vG3W+0X/oHm+rZ8R3cPemltGmLiA2/D9Rdbrts
         VUasU5dIulf0ZZ18ki7Ikypb+yMEapBYqwHUPba0YpSiMIfOnCPsiWTt5IeLgHQ9HQBS
         UCx2RLBedIPhbN/BlG+Fa4j4UDHg4oq9qIA5v1L0D6p/YoSQt3n9+/vVknewlBAuv6a7
         5pV74gaL2NRzmUnTLAfDdRJuxHeYxHwgJuJXJqlEIKO5vWZbjlDFMinNMGEnrrDu3JlN
         PCDw==
X-Gm-Message-State: AOAM5327NESWzZfAJSj8OaoM88P4kFC2ej/VkhFJ9jQdI7WHIY3Hkmc4
	/rIiPEJlYqMys80V8Z8zR2IqE6xmQF1GZ5TjOzg7jRF9dk1MzBYN/9lPKwNN3ff2TfpU2XAfFnn
	/Xdx+bexkfyNo7KE374c89dJxzCg=
X-Received: by 2002:adf:9b9b:: with SMTP id d27mr13324076wrc.125.1607280951436;
        Sun, 06 Dec 2020 10:55:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjk3rMrzMdcRMBa9qbGydj+XoVJdnBoRtt4fTfXKTXx014IQZfLKKyL1tpFnUZLU9IFuOQ5Q==
X-Received: by 2002:adf:9b9b:: with SMTP id d27mr13324062wrc.125.1607280951287;
        Sun, 06 Dec 2020 10:55:51 -0800 (PST)
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
Subject: [PATCH 7/8] gitlab-ci: Add KVM MIPS cross-build jobs
Date: Sun,  6 Dec 2020 19:55:07 +0100
Message-Id: <20201206185508.3545711-8-philmd@redhat.com>
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

Cross-build mips target with KVM and TCG accelerators enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
later we'll build KVM-only.
---
 .gitlab-ci.d/crossbuilds-kvm-mips.yml | 5 +++++
 .gitlab-ci.yml                        | 1 +
 MAINTAINERS                           | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-mips.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-mips.yml b/.gitlab-ci.d/crossbuilds-kvm-mips.yml
new file mode 100644
index 00000000000..81eeeb315bb
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-mips.yml
@@ -0,0 +1,5 @@
+cross-mips64el-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-mips64el-cross
+    TARGETS: mips64el-softmmu
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 024624908e8..5f607fc7b48 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -16,6 +16,7 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-ppc.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-mips.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index c7766782174..5f26626a512 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -392,6 +392,7 @@ MIPS KVM CPUs
 M: Huacai Chen <chenhc@lemote.com>
 S: Odd Fixes
 F: target/mips/kvm.c
+F: .gitlab-ci.d/crossbuilds-kvm-mips.yml
 
 PPC KVM CPUs
 M: David Gibson <david@gibson.dropbear.id.au>
-- 
2.26.2


