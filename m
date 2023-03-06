Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF476AB8BE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 09:47:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506785.779988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6VA-00024M-0y; Mon, 06 Mar 2023 08:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506785.779988; Mon, 06 Mar 2023 08:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6V9-000221-Sd; Mon, 06 Mar 2023 08:47:23 +0000
Received: by outflank-mailman (input) for mailman id 506785;
 Mon, 06 Mar 2023 08:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4jh=66=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pZ6V8-0000dk-To
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 08:47:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 822d7c10-bbfb-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 09:47:22 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-DmKCntfRM1qxeZT9MJ-5Eg-1; Mon, 06 Mar 2023 03:47:16 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 188F43813F2F;
 Mon,  6 Mar 2023 08:47:16 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92FC3175AD;
 Mon,  6 Mar 2023 08:47:13 +0000 (UTC)
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
X-Inumbo-ID: 822d7c10-bbfb-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678092441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4T9cplH6CcELavmnQDL+WvQDU+eNL+kdMeEtlFvM8H4=;
	b=jThZ/X3t7qjLsFky59u0JMwMERLIW3z6thHSHWI+Bx7WIgzDXSISBzw6sF2MSWvtOfDIFH
	TmvZ3Ze4jOrO2Kk4uplPDo8X2F3Y0zMkdK7tG/5ZcxsyBkV9FcURe0+96XSkvSCgbo1LnT
	WnCjdzqr3yPN1wchTab5pKCpSpunyUY=
X-MC-Unique: DmKCntfRM1qxeZT9MJ-5Eg-1
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
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v4 5/5] gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs
Date: Mon,  6 Mar 2023 09:46:58 +0100
Message-Id: <20230306084658.29709-6-thuth@redhat.com>
In-Reply-To: <20230306084658.29709-1-thuth@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Hardly anybody still uses 32-bit arm environments for running QEMU,
so let's stop wasting our scarce CI minutes with these jobs.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index a25cb87ae4..61b8ac86ee 100644
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


