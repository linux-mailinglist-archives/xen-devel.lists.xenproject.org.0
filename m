Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5212D0EE4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:24:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46271.82144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEcz-00065P-VB; Mon, 07 Dec 2020 11:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46271.82144; Mon, 07 Dec 2020 11:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEcz-00064d-PF; Mon, 07 Dec 2020 11:24:25 +0000
Received: by outflank-mailman (input) for mailman id 46271;
 Mon, 07 Dec 2020 11:24:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmEcy-00063G-2S
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:24:24 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 19013f29-cbe6-4e0a-a20f-9bf3558a909f;
 Mon, 07 Dec 2020 11:24:23 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-yvgGKGDEN7S1A3FygGVl0A-1; Mon, 07 Dec 2020 06:24:19 -0500
Received: by mail-wm1-f71.google.com with SMTP id h68so5246059wme.5
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 03:24:19 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id e16sm4243619wra.94.2020.12.07.03.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:24:17 -0800 (PST)
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
X-Inumbo-ID: 19013f29-cbe6-4e0a-a20f-9bf3558a909f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607340263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MSG4LDxzGyW4ZC1IxX3fWcY4XCf9aUhCu+WzuAKC2lo=;
	b=VmRjGieL6BLT+YxmQ3uHu3d1jVIP0E89ZI3smZ+HHyXvy3NGHxM11k/8buwE0r7qdtCxwy
	hahiX81aRo3vBfCM7ZddmqWXhLJ7LcKqXP1nLCxGhAvSV8yQzi2QAruFIw6DmzlaBT1vEm
	ucOat+CQ18N5NRSAHzlKcLp7InCaND4=
X-MC-Unique: yvgGKGDEN7S1A3FygGVl0A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MSG4LDxzGyW4ZC1IxX3fWcY4XCf9aUhCu+WzuAKC2lo=;
        b=sQbneVg7P1I/5u903Aw5aVtZfwk1zYhT1vAftZ5r4ZHux8REM4wcxDi3f9LvJq8BmM
         8ZdyxUWb0o01acf4cDnBy9W8MzHBKp7CbVdxMU1hBI+aHt5JHe8W5rEgoF8SZIu5Swvw
         JdS0gsHVKTaA+ADWFQDvNfgX+7TU1wnaQFxpHfe5a/F2DWKmfVXvSm7y9rvX30/Bm1ks
         AJ8OvjnzcgTgXgLXRbL2TpYZxlwQ01LSjuP1KKyvoI+nrnE2DAbLESWPKsycW06hZdOO
         f/EfVzmcO30tkHqQDtR6PNJPwk7xDBY9990W8Z/02CIS2A+oI8aWXIMT1b9+fbqv31TH
         0CaQ==
X-Gm-Message-State: AOAM530cUId3HjE+LGFN1guE3TDDR3EtnTcDwY5cDvWcXwibo8HJWXrb
	xJnGIQRqehj9JgyM+fXCe/MkIm7mlei3C0yfVAngZDOHjDrGoFClRst4M2h9/wn1zr+TFThfojo
	tFtZiN3SuxVZJ4rZpwXLw4gUtfww=
X-Received: by 2002:adf:e444:: with SMTP id t4mr19219659wrm.152.1607340258415;
        Mon, 07 Dec 2020 03:24:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoNIgHdpMpGp2bUcwaH+FdRRx2uvKYslTLHSrs8jOZKgCeWvKJMTuuRmK450fuWJjSTjvKmw==
X-Received: by 2002:adf:e444:: with SMTP id t4mr19219640wrm.152.1607340258267;
        Mon, 07 Dec 2020 03:24:18 -0800 (PST)
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
Subject: [PATCH v2 4/5] gitlab-ci: Add KVM s390x cross-build jobs
Date: Mon,  7 Dec 2020 12:23:52 +0100
Message-Id: <20201207112353.3814480-5-philmd@redhat.com>
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

Cross-build s390x target with only KVM accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index d8685ade376..7a94a66b4b3 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,4 +1,3 @@
-
 .cross_system_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
@@ -120,6 +119,13 @@ cross-s390x-user:
   variables:
     IMAGE: debian-s390x-cross
 
+cross-s390x-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-s390x-cross
+    TARGETS: s390x-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
+
 cross-win32-system:
   extends: .cross_system_build_job
   variables:
-- 
2.26.2


