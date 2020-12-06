Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9252D069A
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 19:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45767.81237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzCG-0005yX-IE; Sun, 06 Dec 2020 18:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45767.81237; Sun, 06 Dec 2020 18:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klzCG-0005xu-Dn; Sun, 06 Dec 2020 18:55:48 +0000
Received: by outflank-mailman (input) for mailman id 45767;
 Sun, 06 Dec 2020 18:55:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PoKi=FK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1klzCE-0005oU-I0
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 18:55:46 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id fb91a125-8d6a-4446-baef-15f079abae10;
 Sun, 06 Dec 2020 18:55:45 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-CWcxd-CXO6-CHcSTaQhL6g-1; Sun, 06 Dec 2020 13:55:42 -0500
Received: by mail-wm1-f69.google.com with SMTP id k126so1497414wmb.0
 for <xen-devel@lists.xenproject.org>; Sun, 06 Dec 2020 10:55:42 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l1sm5951733wrq.64.2020.12.06.10.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:39 -0800 (PST)
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
X-Inumbo-ID: fb91a125-8d6a-4446-baef-15f079abae10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ICTgDX+4v4WDebhKXLX3qGQtibzA3mRvScrd6C7n6Ec=;
	b=aRApqZ4PbsbUtaZMEJs3B1XVmD/Ebgu2jnyneijYMZ4hMVCKlArNDBR80AO+1dVGh7VBH/
	09YDmKab6pg4m8tC3hBnDGm2kIwzHg88fdeMTrjEqJJr6NSmz2yECvWgMLgJ2bIKjq8Th2
	5GOZCzm3Ex9WAj7lgc6+6F5ZVoSH67U=
X-MC-Unique: CWcxd-CXO6-CHcSTaQhL6g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ICTgDX+4v4WDebhKXLX3qGQtibzA3mRvScrd6C7n6Ec=;
        b=SyMZmfnTiHe3k2vfVJPwsDoU5jGTpq5InTaM4tCGe5+0a/qp4XrSzmgwGvfePGvcbX
         SaK/pch/zDXPnmcN9gCHbS84sLBpcKvqBZfKQKWc9Ahe7xwJgUeDBLL3Brvg0yi1ET1O
         pvlqZOaGpgVHMByz8uKYYZymkd5nTMp8sqjb23bpd0tR4xg5ojNhSCtyWfDym8L0MPNH
         9A3UIN3dGevLnigKakCcnFI0tXrY0rO6XlErFCeSsu5jvtixsE9t9Mq35XVsC37bJ8l3
         0z4TONPo9wTkuzcBb9E7Bc7nda7TULpiaGogwS7oHmY07I7i1/edYNpZgHTKhqifJgGh
         p4KQ==
X-Gm-Message-State: AOAM533wdR+2oZN8p0nw+ooY3F4u0OBMLnx/qV1hQdY0G0iym9WvVz6f
	jV3Zuv5oQAyfKmw1wKesqp8u7C6sfQctLgUfhG+P36F0umDFkoZyuFJHtIYw/jlxZL0sQARmaVK
	rJNiI/SPjLYJ3PuzZg4J62iWiKWo=
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr14902023wme.189.1607280940117;
        Sun, 06 Dec 2020 10:55:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS0gmyZIlDu9x3zdPI4XoBOwxS0bhZqQbF0DZUVSQQ25mAYsGy/bDy2iLLg12EuoAvmHTkDA==
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr14902001wme.189.1607280939914;
        Sun, 06 Dec 2020 10:55:39 -0800 (PST)
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
Subject: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
Date: Sun,  6 Dec 2020 19:55:05 +0100
Message-Id: <20201206185508.3545711-6-philmd@redhat.com>
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

Cross-build s390x target with only KVM accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
 .gitlab-ci.yml                         | 1 +
 MAINTAINERS                            | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
new file mode 100644
index 00000000000..1731af62056
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
@@ -0,0 +1,6 @@
+cross-s390x-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-s390x-cross
+    TARGETS: s390x-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 573afceb3c7..a69619d7319 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -14,6 +14,7 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 40271eba592..d41401f6683 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -417,6 +417,7 @@ F: hw/intc/s390_flic.c
 F: hw/intc/s390_flic_kvm.c
 F: include/hw/s390x/s390_flic.h
 F: gdb-xml/s390*.xml
+F: .gitlab-ci.d/crossbuilds-kvm-s390x.yml
 T: git https://github.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
-- 
2.26.2


