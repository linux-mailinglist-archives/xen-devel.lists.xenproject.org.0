Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E26AB8BA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 09:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506783.779964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6V3-0001JK-Eb; Mon, 06 Mar 2023 08:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506783.779964; Mon, 06 Mar 2023 08:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6V3-0001Bd-9V; Mon, 06 Mar 2023 08:47:17 +0000
Received: by outflank-mailman (input) for mailman id 506783;
 Mon, 06 Mar 2023 08:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4jh=66=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pZ6V2-0000dk-8I
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 08:47:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e407da0-bbfb-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 09:47:15 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-1imUG1pVNKuXUSYHpP6cUQ-1; Mon, 06 Mar 2023 03:47:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BDFA101A52E;
 Mon,  6 Mar 2023 08:47:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46752175AD;
 Mon,  6 Mar 2023 08:47:08 +0000 (UTC)
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
X-Inumbo-ID: 7e407da0-bbfb-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678092434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOdHjT9I3a98EaTtzARQkAnvMgS9UeiFJMCcEWuHsDg=;
	b=DjAt4GJOOkGvRm5K2/rky9P1UeeDEp6qpryOkVblpWoOtXgwMuYKQ+21PLrkd2NLmkqTsL
	bleh6d+LTi/u/I6AUnmVMQe9N/A4AsVXlT1sgW/MNrOLlA3PPpb2xqKUAIaM8xu0QYjbiY
	a2kmrqa+nTE2lDSkR9O+X4bpmI7u8yA=
X-MC-Unique: 1imUG1pVNKuXUSYHpP6cUQ-1
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
Subject: [PATCH v4 3/5] gitlab-ci.d/crossbuilds: Drop the i386 system emulation job
Date: Mon,  6 Mar 2023 09:46:56 +0100
Message-Id: <20230306084658.29709-4-thuth@redhat.com>
In-Reply-To: <20230306084658.29709-1-thuth@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Hardly anybody still uses 32-bit x86 environments for running QEMU with
full system emulation, so let's stop wasting our scarce CI minutes with
this job.

(There are still the 32-bit MinGW and TCI jobs around for having
some compile test coverage on 32-bit)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index d3a31a2112..a25cb87ae4 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -43,16 +43,6 @@ cross-arm64-user:
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
 cross-i386-user:
   extends:
     - .cross_user_build_job
-- 
2.31.1


