Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A056F2AAD6B
	for <lists+xen-devel@lfdr.de>; Sun,  8 Nov 2020 21:49:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21817.48180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbrbs-0002Iv-MR; Sun, 08 Nov 2020 20:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21817.48180; Sun, 08 Nov 2020 20:48:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbrbs-0002IW-Im; Sun, 08 Nov 2020 20:48:24 +0000
Received: by outflank-mailman (input) for mailman id 21817;
 Sun, 08 Nov 2020 20:48:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q0OR=EO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kbrbr-0002IR-A6
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 20:48:23 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bea7b5fe-f014-4c0f-b11a-6147d862d0cc;
 Sun, 08 Nov 2020 20:48:20 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-iSxbM1-PP6mlzMlhdqhbZA-1; Sun, 08 Nov 2020 15:48:16 -0500
Received: by mail-wr1-f72.google.com with SMTP id e18so3367686wrs.23
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2020 12:48:16 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id n9sm10582699wmd.4.2020.11.08.12.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 12:48:14 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=q0OR=EO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kbrbr-0002IR-A6
	for xen-devel@lists.xenproject.org; Sun, 08 Nov 2020 20:48:23 +0000
X-Inumbo-ID: bea7b5fe-f014-4c0f-b11a-6147d862d0cc
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id bea7b5fe-f014-4c0f-b11a-6147d862d0cc;
	Sun, 08 Nov 2020 20:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604868500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JaO3dtFj5WhHKtEHsZu2VQNZlyIz3aXfJ70aU8Z8ugU=;
	b=FMSo9KduK12oOyn0FMV19Wve2+3gMAyPw6N4B5ByRAI3cAjoYvSkjoKLPvyrcVTvOKHwpt
	pC+tfvkZ3EVyNR+uSx+vq7h3r+sTb/AP0qTR9Qie6qqjvryZ5VoyC2xAphPjdI1GbmP43z
	vGP9C4mb1CAvLgilHO2W0zGBeyRXbkk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-iSxbM1-PP6mlzMlhdqhbZA-1; Sun, 08 Nov 2020 15:48:16 -0500
X-MC-Unique: iSxbM1-PP6mlzMlhdqhbZA-1
Received: by mail-wr1-f72.google.com with SMTP id e18so3367686wrs.23
        for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2020 12:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JaO3dtFj5WhHKtEHsZu2VQNZlyIz3aXfJ70aU8Z8ugU=;
        b=fdoatJ9rJEOFCrMfYKFLVJ6l+mJAxA5/q8JANfFb5UD1YjE8w6SI69FFxjlN9+W2BN
         iFNW9seuysfnl7ytAnHNJ2zerV93xP0QLZ0ti32VqqrcblcECkbaVwmeXPintVI/nlgv
         Kn+7AgBwmxIz0N9fh7B46R2CNgZb5M+aHGCdaM6xA3ACj/vU7mdrmEu0acfbQE1ZGy5G
         ulLp5RYf53VCugQBb3vyOeiPtWD7p3l+CGdWRqc9yGtgXjnBnkN299wG+ZFw1RJRkJIf
         i8cv0241ixONSpOuMDbyedO98r8ogV81zV7dEVdbfzk2GN+gbSbwGJ/2phQ5Nl3AnTaa
         bMXQ==
X-Gm-Message-State: AOAM532arU5PejqUZ9mMngcXvwgiGlO8cLIYsCqhX8D0CmUwEqoa9hT7
	jQvKK1f3jLVPFaXeFQeoEpmtYoq5cxnZA7XX+c25HLrLDpSySAetvhKda5GRK0v4UmkXCjwUJa/
	6ieOqCZjsi9jDhsy2nc8o+vqYC4s=
X-Received: by 2002:adf:dc4c:: with SMTP id m12mr14577106wrj.177.1604868495165;
        Sun, 08 Nov 2020 12:48:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznq1KGLX1Fjb9gaA2+nc6mWhBkui9o+7ISQgnfxHqJ/igupLFrf03tBjTb6p55sq27Y5Ymbg==
X-Received: by 2002:adf:dc4c:: with SMTP id m12mr14577088wrj.177.1604868494995;
        Sun, 08 Nov 2020 12:48:14 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id n9sm10582699wmd.4.2020.11.08.12.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 12:48:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Richard Henderson <rth@twiddle.net>,
	Fam Zheng <fam@euphon.net>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH-for-6.0 v4 15/17] gitlab-ci: Add test for Xen (on CentOS 7)
Date: Sun,  8 Nov 2020 21:45:33 +0100
Message-Id: <20201108204535.2319870-16-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201108204535.2319870-1-philmd@redhat.com>
References: <20201108204535.2319870-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen packages are available in CentOS 7, but have been
removed from CentOS 8. Use the CentOS 7 container.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org
---
 .gitlab-ci.yml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2f0da7b3dc1..8e15266c277 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -557,6 +557,27 @@ check-crypto-only-gnutls:
     IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
+build-xen-centos:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: centos7
+    TARGETS: i386-softmmu x86_64-softmmu
+    CONFIGURE_ARGS: --enable-xen
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    paths:
+      - build
+
+check-xen-centos:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-xen-centos
+      artifacts: true
+  variables:
+    IMAGE: centos7
+    MAKE_CHECK_ARGS: check
+
+
 # We don't need to exercise every backend with every front-end
 build-trace-multi-user:
   <<: *native_build_job_definition
-- 
2.26.2


