Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173646A94FB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:15:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505711.778624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2RU-0002oM-5P; Fri, 03 Mar 2023 10:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505711.778624; Fri, 03 Mar 2023 10:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2RU-0002mF-0z; Fri, 03 Mar 2023 10:15:12 +0000
Received: by outflank-mailman (input) for mailman id 505711;
 Fri, 03 Mar 2023 10:15:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M2mb=63=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pY2RT-00022o-2s
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:15:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 466aee2b-b9ac-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:15:09 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584--lM7xaz9Md-CoiMDdufbdQ-1; Fri, 03 Mar 2023 05:15:05 -0500
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C76B1C05B17;
 Fri,  3 Mar 2023 10:15:04 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6054D492C3E;
 Fri,  3 Mar 2023 10:15:02 +0000 (UTC)
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
X-Inumbo-ID: 466aee2b-b9ac-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677838508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpA69n947yXoh4gqIJjGzU3sLNRw3vGXKAhlnCotvoU=;
	b=IkIvPd+OSyZ5BafAA+vEWMT7583BLZTNJrAjAHFor1n3n2RIffXkSDWvraPsEOD6PdX/Xt
	HF7sOZjXtKzPnlzuEokaa4p7zCidg9LbxcEnWq4y6yAwbAtAQ4w3o9XqQ8wgRweanRDXaH
	L2uF99xAobMSZOzU23CilxrIm/2cUyI=
X-MC-Unique: -lM7xaz9Md-CoiMDdufbdQ-1
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Berrange <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Date: Fri,  3 Mar 2023 11:14:49 +0100
Message-Id: <20230303101452.769367-4-thuth@redhat.com>
In-Reply-To: <20230303101452.769367-1-thuth@redhat.com>
References: <20230303101452.769367-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

Hardly anybody still uses 32-bit x86 environments for running QEMU,
so let's stop wasting our scarce CI minutes with these jobs.

(There are still the 32-bit MinGW and TCI jobs around for having
some compile test coverage on 32-bit, and the dockerfile can stay
in case someone wants to reproduce a flaw locally)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index d3a31a2112..b96439146f 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -43,26 +43,6 @@ cross-arm64-user:
   variables:
     IMAGE: debian-arm64-cross
 
-cross-i386-system:
-  extends:
-    - .cross_system_build_job
-    - .cross_test_artifacts
-  needs:
-    job: i386-fedora-cross-container
-  variables:
-    IMAGE: fedora-i386-cross
-    MAKE_CHECK_ARGS: check-qtest
-
-cross-i386-user:
-  extends:
-    - .cross_user_build_job
-    - .cross_test_artifacts
-  needs:
-    job: i386-fedora-cross-container
-  variables:
-    IMAGE: fedora-i386-cross
-    MAKE_CHECK_ARGS: check
-
 cross-i386-tci:
   extends:
     - .cross_accel_build_job
-- 
2.31.1


