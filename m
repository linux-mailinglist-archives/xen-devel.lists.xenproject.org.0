Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F26A865E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 17:31:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505236.777906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlq2-00024f-4c; Thu, 02 Mar 2023 16:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505236.777906; Thu, 02 Mar 2023 16:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlq1-00021h-W2; Thu, 02 Mar 2023 16:31:25 +0000
Received: by outflank-mailman (input) for mailman id 505236;
 Thu, 02 Mar 2023 16:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuGR=62=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pXlq0-0001EZ-7J
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 16:31:24 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab694b36-b917-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 17:31:23 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-ljrgtJZkOLWCI0Dxai-ocQ-1; Thu, 02 Mar 2023 11:31:19 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 870D1802D38;
 Thu,  2 Mar 2023 16:31:18 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 443AE400EA93;
 Thu,  2 Mar 2023 16:31:16 +0000 (UTC)
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
X-Inumbo-ID: ab694b36-b917-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677774682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UosB4aUxpi/5dWz6XRm7RMey1SsdH1cuc7g1it7tUeE=;
	b=Co0OSiG7yh2Lw8ZV2THS+LjQmjMyh3ZwKRTSWTDu2WGq+XAhLCZ4CEgyqs973NnP8Sya+s
	A7LBiSwSG5+B5KN7Tj/byfAqG3ZM7Fh7K5xHcgCI7lB5zxQaVFnJ6/e43cUPCNvlAbGAnO
	kOv6Big/noLBZb6VhnC68NELRfLqFtw=
X-MC-Unique: ljrgtJZkOLWCI0Dxai-ocQ-1
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
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH v2 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Date: Thu,  2 Mar 2023 17:31:03 +0100
Message-Id: <20230302163106.465559-4-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

Hardly anybody still uses 32-bit x86 environments for running QEMU,
so let's stop wasting our scarce CI minutes with these jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 101416080c..3ce51adf77 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -43,22 +43,6 @@ cross-arm64-user:
   variables:
     IMAGE: debian-arm64-cross
 
-cross-i386-system:
-  extends: .cross_system_build_job
-  needs:
-    job: i386-fedora-cross-container
-  variables:
-    IMAGE: fedora-i386-cross
-    MAKE_CHECK_ARGS: check-qtest
-
-cross-i386-user:
-  extends: .cross_user_build_job
-  needs:
-    job: i386-fedora-cross-container
-  variables:
-    IMAGE: fedora-i386-cross
-    MAKE_CHECK_ARGS: check
-
 cross-i386-tci:
   extends: .cross_accel_build_job
   timeout: 60m
-- 
2.31.1


