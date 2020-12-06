Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794FA2D069D
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 19:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45760.81225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzCB-0005sl-8q; Sun, 06 Dec 2020 18:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45760.81225; Sun, 06 Dec 2020 18:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzCB-0005s3-3u; Sun, 06 Dec 2020 18:55:43 +0000
Received: by outflank-mailman (input) for mailman id 45760;
 Sun, 06 Dec 2020 18:55:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PoKi=FK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1klzC9-0005oU-Hi
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 18:55:41 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 30518ff7-d9df-4962-8512-180c8e08cb37;
 Sun, 06 Dec 2020 18:55:39 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-ZVaRvVsKMoSpEp0xxrxiWQ-1; Sun, 06 Dec 2020 13:55:35 -0500
Received: by mail-wm1-f70.google.com with SMTP id y187so4310699wmy.3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Dec 2020 10:55:35 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l8sm12023533wmf.35.2020.12.06.10.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:33 -0800 (PST)
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
X-Inumbo-ID: 30518ff7-d9df-4962-8512-180c8e08cb37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vxt3MEZXS260piBfvrRF2LPibTg2rLk2j2FgrTceEtE=;
	b=DdpqVZOKqK5n6md7/XluGVO0qo3tgrqmhdCP6EQBuIEVX4hvoXYVRuB6KrovLjArqrOdhh
	2LQcGTDxkLCmw4+LfOHEnqY1NB5T55N006XQMI2ioYBIdxuUaVgK+1TvYDpM/t96FVVUoa
	RZhtJa/Hpvng6lpVSdlOtw/+1N0A37U=
X-MC-Unique: ZVaRvVsKMoSpEp0xxrxiWQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vxt3MEZXS260piBfvrRF2LPibTg2rLk2j2FgrTceEtE=;
        b=LAetrLfOkWlkLyx5Z1u8QvqV4yQcW/0+cjKvpSSXnjtvSSdbAVYW2v8vQwAVAzfDTa
         niwX1Cy4LLQRQ7EWQomejpCdMHi3TDLE07KtS9nDU1gUcC84FGBKkhgiOZnkwE9HhSiN
         YJECvFDP+AtFqYLJU6HxoagsEsSWt/4/DH73GzbQ53eZyfFQfQKLiQ2hsYgmTgM7AoYs
         vMZYPbXh3cO43hOw5ET+lhhTe6qBD2c/0XQVo5fSyOG0LoH2qN5wTQCKC+dhiz3rHdkb
         WW8nDjiLQZXld3cHkgb5Xk1o+BcgdiSQEeBBIud+rTpc6rAaZD5z5B0fJtF84GhWxkFw
         4Rwg==
X-Gm-Message-State: AOAM530olqlQbk59stD0KCkgCzjxk2yJ+6XFv44R8YDhA/A2Vp59itKj
	Vjc8Twujwflt67uOiSnY4O/Dzo/gAnqHN+b2xeDxQ2ORVy6rVHsY+PBFHYt/RgbZt1JZ7P/jAxE
	yOPD2KAQL9qQaOlQCOsGh32Pq/bM=
X-Received: by 2002:a1c:48d:: with SMTP id 135mr14975797wme.147.1607280934466;
        Sun, 06 Dec 2020 10:55:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4k4/YkSarxB89UuEp4wGBYMDt9qPp414ZW0Hy6JgLmQ1zgyBWhlkGZseJ8x91ebcKHRE8vw==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr14975772wme.147.1607280934329;
        Sun, 06 Dec 2020 10:55:34 -0800 (PST)
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
Subject: [PATCH 4/8] gitlab-ci: Add KVM ARM cross-build jobs
Date: Sun,  6 Dec 2020 19:55:04 +0100
Message-Id: <20201206185508.3545711-5-philmd@redhat.com>
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

Cross-build ARM aarch64 target with KVM and TCG accelerators enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
later this job will build KVM-only.
---
 .gitlab-ci.d/crossbuilds-kvm-arm.yml | 5 +++++
 .gitlab-ci.yml                       | 1 +
 MAINTAINERS                          | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-arm.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-arm.yml b/.gitlab-ci.d/crossbuilds-kvm-arm.yml
new file mode 100644
index 00000000000..c74c6fdc9fb
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-arm.yml
@@ -0,0 +1,5 @@
+cross-arm64-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-arm64-cross
+    TARGETS: aarch64-softmmu
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cdfa1f82a3d..573afceb3c7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -13,6 +13,7 @@ include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d7e2fdb7e2..40271eba592 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -386,6 +386,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: target/arm/kvm.c
+F: .gitlab-ci.d/crossbuilds-kvm-arm.yml
 
 MIPS KVM CPUs
 M: Huacai Chen <chenhc@lemote.com>
-- 
2.26.2


