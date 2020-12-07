Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C545E2D0EE6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46277.82156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEd5-0006BZ-8T; Mon, 07 Dec 2020 11:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46277.82156; Mon, 07 Dec 2020 11:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEd5-0006At-3g; Mon, 07 Dec 2020 11:24:31 +0000
Received: by outflank-mailman (input) for mailman id 46277;
 Mon, 07 Dec 2020 11:24:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmEd3-0005oS-JV
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:24:29 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e2d823ee-3c71-4da3-a7b3-9cdf9c83556e;
 Mon, 07 Dec 2020 11:24:26 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-_YrgJOFaN8GC0G1rT2DI5g-1; Mon, 07 Dec 2020 06:24:24 -0500
Received: by mail-wm1-f71.google.com with SMTP id b184so4036794wmh.6
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 03:24:24 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id m4sm8219391wrw.16.2020.12.07.03.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:24:22 -0800 (PST)
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
X-Inumbo-ID: e2d823ee-3c71-4da3-a7b3-9cdf9c83556e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607340266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SEo8ObuiWti6ikwYfSkzOi/pKrNqwxWSbgMNYO8oMYs=;
	b=Px2khBKQl+ncOkHrje3ZxzsjkwomljsUShZRcq9Fo1SQfN7EgwSfUwHnY5OumVqUrfDRM9
	B5g+BklnwkfRvVYvbUww84w949hzAPXAVxjAQHcER1VYEF1jC0YqhxnE7jP3fQ970ji3XF
	+YouDcRH6BGztwqRc6l+b/IwLfMZeL0=
X-MC-Unique: _YrgJOFaN8GC0G1rT2DI5g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SEo8ObuiWti6ikwYfSkzOi/pKrNqwxWSbgMNYO8oMYs=;
        b=irZKeEWh9a98FX+jRIhaZ4ERrwQJUoxKKR7w+t+4Lq/B9iKw6EMjshghl7qkWARkF4
         4TppZwQ22QksKQZqXScc0akVQbUmCwy46G03IPS9AyLoANcO43kDtJBZA+/B7p7bRx/g
         4uVvC2dIjkE86XK+u04oK/SwKaRTRgG66+PA+qLCKH4gO1BAeMCKk9UoY5ZdUoP9OZI3
         ko2r/vM3Ckc85RZtazbD1613wxh8JaICyHjX2GiGIN73ryAFpeGkFLfQYwacozRuPAhL
         xqt+CsjOqP575dxMAhUbHzEY5Ecq2hDFd+XdWsIoaAxjsbommM4drbuZax6gVn8HPpFH
         uhRg==
X-Gm-Message-State: AOAM532WT8QE+lobr3/BxKsOjFl4mI6ndChPFvqpufjA85Axr0n7Elv7
	qgR1yOK6bv8NbRQKs/lS3yV2R2tEWMpDOBY08s5u3XIxc/7aKlnUlu19BS5bRFZpRwYpM7TnwUb
	D+Dz3+rpBJADQiuCm+/O8odg5R7Q=
X-Received: by 2002:a7b:c1d7:: with SMTP id a23mr17761614wmj.62.1607340263562;
        Mon, 07 Dec 2020 03:24:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDr6itnK8hiEddAxr/Psf+fnJpJGiFVhvH4Vq5j5+wSxG6IJIVGf7oSHkC7/zpJDDY93Vnkg==
X-Received: by 2002:a7b:c1d7:: with SMTP id a23mr17761592wmj.62.1607340263423;
        Mon, 07 Dec 2020 03:24:23 -0800 (PST)
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
Subject: [PATCH v2 5/5] gitlab-ci: Add Xen cross-build jobs
Date: Mon,  7 Dec 2020 12:23:53 +0100
Message-Id: <20201207112353.3814480-6-philmd@redhat.com>
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

Cross-build ARM and X86 targets with only Xen accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 7a94a66b4b3..31f10f1e145 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -135,3 +135,18 @@ cross-win64-system:
   extends: .cross_system_build_job
   variables:
     IMAGE: fedora-win64-cross
+
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
-- 
2.26.2


