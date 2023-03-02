Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3285B6A8662
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 17:31:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505239.777932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlqB-0002z6-7e; Thu, 02 Mar 2023 16:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505239.777932; Thu, 02 Mar 2023 16:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlqB-0002om-1t; Thu, 02 Mar 2023 16:31:35 +0000
Received: by outflank-mailman (input) for mailman id 505239;
 Thu, 02 Mar 2023 16:31:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuGR=62=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pXlq8-0001EZ-Sq
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 16:31:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0946a17-b917-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 17:31:32 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-Jq8Nao8XNiSn3fIGaKZl_g-1; Thu, 02 Mar 2023 11:31:26 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74665811E6E;
 Thu,  2 Mar 2023 16:31:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21E2C400EA93;
 Thu,  2 Mar 2023 16:31:23 +0000 (UTC)
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
X-Inumbo-ID: b0946a17-b917-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677774691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iwI738OIIkLAwRHwvOimrO1YGLXhalSEzhssZIG8uVE=;
	b=KP0Fjy0kZdSV/8/iACeMPCthcGL0olA7G6dUlolUD8TUmyJrY00mqrxDyIEfbhzZxuYRnu
	dtWzk5Oe+huvgm1USHX8vSNmq3jjSplgvNq1Xjs8B+T7nSkLIIMRY0AHWqu39pwIk+ekGp
	fsLVbB6VDsU5l5vbpTElJSNVDwDn3Vk=
X-MC-Unique: Jq8Nao8XNiSn3fIGaKZl_g-1
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
Subject: [PATCH v2 6/6] gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs
Date: Thu,  2 Mar 2023 17:31:06 +0100
Message-Id: <20230302163106.465559-7-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

Hardly anybody still uses 32-bit arm environments for running QEMU,
so let's stop wasting our scarce CI minutes with these jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 3ce51adf77..419b0c2fe1 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,13 +1,6 @@
 include:
   - local: '/.gitlab-ci.d/crossbuild-template.yml'
 
-cross-armel-system:
-  extends: .cross_system_build_job
-  needs:
-    job: armel-debian-cross-container
-  variables:
-    IMAGE: debian-armel-cross
-
 cross-armel-user:
   extends: .cross_user_build_job
   needs:
@@ -15,13 +8,6 @@ cross-armel-user:
   variables:
     IMAGE: debian-armel-cross
 
-cross-armhf-system:
-  extends: .cross_system_build_job
-  needs:
-    job: armhf-debian-cross-container
-  variables:
-    IMAGE: debian-armhf-cross
-
 cross-armhf-user:
   extends: .cross_user_build_job
   needs:
-- 
2.31.1


