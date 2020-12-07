Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E142D119C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 14:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46528.82600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGMR-0004MH-UX; Mon, 07 Dec 2020 13:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46528.82600; Mon, 07 Dec 2020 13:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGMR-0004LQ-QD; Mon, 07 Dec 2020 13:15:27 +0000
Received: by outflank-mailman (input) for mailman id 46528;
 Mon, 07 Dec 2020 13:15:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmGMQ-0004Kw-S5
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:15:26 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 05d4123c-6f27-4e73-9918-471cb0d4d66d;
 Mon, 07 Dec 2020 13:15:26 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-yXxLE-j9PEW_K9JRFbeE9A-1; Mon, 07 Dec 2020 08:15:24 -0500
Received: by mail-wm1-f71.google.com with SMTP id r1so5333112wmn.8
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 05:15:23 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b3sm14942829wrp.57.2020.12.07.05.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:15:22 -0800 (PST)
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
X-Inumbo-ID: 05d4123c-6f27-4e73-9918-471cb0d4d66d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607346926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LrpyM62Xrmp0dmj6zHS9IbusrVswsePAgvUQq8W1ha4=;
	b=iYVyhUlO7Zg+2vqUm7Wcdm4bsG18bLtBV4hSs+wqhvKK6vb9+sutl90vA4N8eMqEZi4iUC
	NsK9NTsM+q9TxAnVPZ3XS3syAmz13qNdVHLg4ikUy4q5IUeFiO3w2zJPiE5IP2iHbJfE+x
	QiF4zHRa+QkUI/H9qRAfFzIvfzaeRCc=
X-MC-Unique: yXxLE-j9PEW_K9JRFbeE9A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LrpyM62Xrmp0dmj6zHS9IbusrVswsePAgvUQq8W1ha4=;
        b=WMxefesltkcxcYVz6hF+2jd85EvOYEod6DRS0/jQ2ywyqXZdYeOJ9uglUeHFqlpOUG
         JZyfyIVq4eh7eK2dJb1WcN2dcr5BIBwb9dhJe4n9P8NbrKKxxe/ur+Gn8/D0RaGAzBiU
         otZuwZeJiH/ClNqgOxNP6gMIWplFpUghI1MvVrthf5TtG+FdbMH2Z6fdOR924f1sUn46
         hmVp1d9qc0qWk5gjC7+tH9MG5oeCSNGJCnSqsmO3QIgnb5wM481a/IW0os28R4pXbnp9
         mBcE6/I42GICCFNl5nbS0DG1KA2D4lbFMMBO0B5Xauo4JYanFOUiHyTq0rKfqtMRc7Eo
         BYmA==
X-Gm-Message-State: AOAM5311QqzjLk4M1Cp4YT7XI+BQ3etMJNMKdFQXgOW81MPD9c3jSFVW
	YtMHbdM6a41FtJBbj21H+hMxTU46nPjktWE3zjDswL2k13bd5KKhDXxUIs1jUwUonVf27DaAQky
	8931faT1dVwvdJlgMfixJJS6u7Fk=
X-Received: by 2002:adf:eec6:: with SMTP id a6mr7411041wrp.239.1607346923077;
        Mon, 07 Dec 2020 05:15:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrSsP/k6tbNGXTd5ADaSfYhwBX1LosPwHROoqvLj3ywUi8jkYDiFzi1eqHTc0kTww1719V1w==
X-Received: by 2002:adf:eec6:: with SMTP id a6mr7411023wrp.239.1607346922931;
        Mon, 07 Dec 2020 05:15:22 -0800 (PST)
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
Subject: [PATCH v3 3/5] gitlab-ci: Introduce 'cross_accel_build_job' template
Date: Mon,  7 Dec 2020 14:15:01 +0100
Message-Id: <20201207131503.3858889-4-philmd@redhat.com>
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

Introduce a job template to cross-build accelerator specific
jobs (enable a specific accelerator, disabling the others).

The specific accelerator is selected by the $ACCEL environment
variable (default to KVM).

Extra options such disabling other accelerators are passed
via the $ACCEL_CONFIGURE_OPTS environment variable.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 099949aaef3..b59516301f4 100644
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
+        --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
+    - make -j$(expr $(nproc) + 1) all check-build
+
 .cross_user_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-- 
2.26.2


