Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6582D06A0
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 19:56:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45785.81272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzCc-0006ID-Ht; Sun, 06 Dec 2020 18:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45785.81272; Sun, 06 Dec 2020 18:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzCc-0006He-E2; Sun, 06 Dec 2020 18:56:10 +0000
Received: by outflank-mailman (input) for mailman id 45785;
 Sun, 06 Dec 2020 18:56:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PoKi=FK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1klzCa-0005yj-Jh
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 18:56:08 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2994972a-f584-4d7d-b87e-7a7d6cf282f7;
 Sun, 06 Dec 2020 18:56:02 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-57U9OyrwNvGeEKNUk8K1oQ-1; Sun, 06 Dec 2020 13:55:58 -0500
Received: by mail-wm1-f70.google.com with SMTP id b184so3257956wmh.6
 for <xen-devel@lists.xenproject.org>; Sun, 06 Dec 2020 10:55:58 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f199sm10894749wme.15.2020.12.06.10.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:56 -0800 (PST)
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
X-Inumbo-ID: 2994972a-f584-4d7d-b87e-7a7d6cf282f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJv54j6i8iOuNb5cgwW4vcH7LWLUemKzrpTz+i6TyMo=;
	b=Tw6pHfaCsc5VycCo9AAHFWomLhs28bDl1BQgN7cHMVqoWf5UUd181PX7ciJ2WamgGNaV3o
	QMx3ZKuXovxOynfmuzDctdxonpsfdftoTf2q0uu1skeaD8Wm2/IgqyiXAkhox/8MFHU42f
	VK1U7E9nIwJ1UxH1gfbuqWrjrmUAMHs=
X-MC-Unique: 57U9OyrwNvGeEKNUk8K1oQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJv54j6i8iOuNb5cgwW4vcH7LWLUemKzrpTz+i6TyMo=;
        b=NGVyVlsAtkG/ZUKuoEpMrR5NyfJ5VtD82Cr8tM8Kun0ZpmQwx2gwb727kRWCu3Qkof
         B7iLrqZg8H1gsk+JPedEguXQ7aeK9Wm+PhbtereNG32NLYlk8vAoai31F58yiJawMMV0
         MwyX7e1JSf3dDMsjO/6u6PwL95ckp9Qkeqt9O4mkb2AybswAdZNqtjA9cVJHbBLA63Dy
         xRA0BSHi3BVIJh6hwQWSQOGgetFoTWrJO5Iwj8QSVRP8jwqh6CuAb5YWjbYxO0nH3w05
         fOCN/vtTPclyM9f5JI5kyZ6UeDJ6rPG1m9+Z/5GhugQ21ibDX8MP6I3JqxDpi7R6NSJH
         u5tg==
X-Gm-Message-State: AOAM531RiMPrr2Vrew7AnTCidpE30+/9xZ/5Gf/tNQK0Os+u6S9VQ5Vp
	TySs82WkwnrwI+EQM2AmVIMULUvq4rZliJv22uePxV/7QrwsjsKrpteIPeX/55uXNms+fiFvfr4
	IKzSFhxGVNtK5cd0U7NNsZrO2JKQ=
X-Received: by 2002:a5d:540f:: with SMTP id g15mr7837207wrv.397.1607280957359;
        Sun, 06 Dec 2020 10:55:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaQWa5KUxTpGy2U2kfc8S05U9x2ntHy5AYmvHAQPO8HICDiiXk9/Erff4S29pCdX8ZlczzjA==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr7837200wrv.397.1607280957219;
        Sun, 06 Dec 2020 10:55:57 -0800 (PST)
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
Subject: [PATCH 8/8] gitlab-ci: Add Xen cross-build jobs
Date: Sun,  6 Dec 2020 19:55:08 +0100
Message-Id: <20201206185508.3545711-9-philmd@redhat.com>
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

Cross-build ARM and X86 targets with only Xen accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds-xen.yml | 14 ++++++++++++++
 .gitlab-ci.yml                   |  1 +
 MAINTAINERS                      |  1 +
 3 files changed, 16 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-xen.yml

diff --git a/.gitlab-ci.d/crossbuilds-xen.yml b/.gitlab-ci.d/crossbuilds-xen.yml
new file mode 100644
index 00000000000..9c4def4feeb
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-xen.yml
@@ -0,0 +1,14 @@
+cross-amd64-xen:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-amd64-cross
+    ACCEL: xen
+    TARGETS: i386-softmmu,x86_64-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+
+cross-arm64-xen:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-arm64-cross
+    ACCEL: xen
+    TARGETS: aarch64-softmmu
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5f607fc7b48..9765c2199f7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -17,6 +17,7 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-ppc.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-mips.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-xen.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f26626a512..1581e120629 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -488,6 +488,7 @@ F: include/hw/xen/
 F: include/sysemu/xen.h
 F: include/sysemu/xen-mapcache.h
 F: stubs/xen-hw-stub.c
+F: .gitlab-ci.d/crossbuilds-xen.yml
 
 Guest CPU Cores (HAXM)
 ---------------------
-- 
2.26.2


