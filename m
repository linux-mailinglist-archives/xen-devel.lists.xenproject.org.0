Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDA92D119D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 14:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46531.82612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGMY-0004SG-8t; Mon, 07 Dec 2020 13:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46531.82612; Mon, 07 Dec 2020 13:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGMY-0004Rh-4A; Mon, 07 Dec 2020 13:15:34 +0000
Received: by outflank-mailman (input) for mailman id 46531;
 Mon, 07 Dec 2020 13:15:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmGMW-0004QJ-2S
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:15:32 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 42c34097-2ba9-4419-97ca-04ee1ead0566;
 Mon, 07 Dec 2020 13:15:31 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-BYSBmJVWO9ulczKMftfZcQ-1; Mon, 07 Dec 2020 08:15:29 -0500
Received: by mail-wr1-f69.google.com with SMTP id n13so4827292wrs.10
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 05:15:29 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a62sm7862008wmh.40.2020.12.07.05.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:15:27 -0800 (PST)
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
X-Inumbo-ID: 42c34097-2ba9-4419-97ca-04ee1ead0566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607346931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R0x/t12SaUJO2Fk00rNBDpsAQee1BNuzclT5nFRV5W4=;
	b=hDDXTieIHZZkaFqpDDrWrlZF4vH4hW1anY0uUJPiDJLlRhZlUrJfGTujnJ7XbuJuSCRgbP
	GD4G7eMbbacRvu4jCbkHIr+ZMnjt/6lM0uRrFQYNwcI/ZDybSfyUmn8pEYMmJO11Siux9R
	6Qvy+YZDT7KkRDILDe5EsOTepGpRv5U=
X-MC-Unique: BYSBmJVWO9ulczKMftfZcQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R0x/t12SaUJO2Fk00rNBDpsAQee1BNuzclT5nFRV5W4=;
        b=G2V19B6kaawBZl7z+NmSRDvUqhrowvhaXNB/LBNgL6P5nD7RQfgEdheiBpRhltetR9
         QHhV0ID559vMid2mtnFkn5q/M5+6v6AFR4WO2pjdq4LFB/k7Pm8sya2P4H/ChCV7n0FD
         Ant8cDw8424FBbCrHqvEuaf0DSGVj2QwpzMvSLgIfX9NPbJua/O0QB8D9SRLfaxF+EOl
         i3iHN9l18DIRAcVb5qx1lHFVR+Vksqg5NT7q+pQCBJ8JCLNzJmkoCA0oB6Oxy12afjgA
         21mmVKTcX4zyA0X51+x/h2h5jV5TnyEilhcu6tHxsFWKp8rqlhXaCTPAVzL4Ky6zfBxY
         zxNw==
X-Gm-Message-State: AOAM530c9dYiN86WKpoekTDwuSFjhPm1o0SCdJvpjNi220znBsML8gCm
	dvAPFTZbYNwHi+yfOIwFIMTeYzkUNuO/zGce+yh2Gvjxu78jyC34LIzHsEPXdxowZI0A4RtrN1u
	unCuzGxZySRa9lkgFkrFGjcc1t0g=
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr1638513wrs.317.1607346928611;
        Mon, 07 Dec 2020 05:15:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/E42Mjl9lrV3uJy+mcMKaCC0ghVf2euOZZfgnjWsjT11kOCMnAwQ1c7Ca2DexAj4PkQkYFw==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr1638484wrs.317.1607346928431;
        Mon, 07 Dec 2020 05:15:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Claudio Fontana <cfontana@suse.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 4/5] gitlab-ci: Add KVM s390x cross-build jobs
Date: Mon,  7 Dec 2020 14:15:02 +0100
Message-Id: <20201207131503.3858889-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207131503.3858889-1-philmd@redhat.com>
References: <20201207131503.3858889-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cross-build s390x target with only KVM accelerator enabled.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index b59516301f4..51896bbc9fb 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,4 +1,3 @@
-
 .cross_system_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
@@ -120,6 +119,12 @@ cross-s390x-user:
   variables:
     IMAGE: debian-s390x-cross
 
+cross-s390x-kvm-only:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-s390x-cross
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
+
 cross-win32-system:
   extends: .cross_system_build_job
   variables:
-- 
2.26.2


