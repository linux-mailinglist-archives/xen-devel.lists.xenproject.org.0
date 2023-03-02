Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCF36A8663
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 17:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505238.777925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlqA-0002pR-Lx; Thu, 02 Mar 2023 16:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505238.777925; Thu, 02 Mar 2023 16:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlqA-0002lV-Gb; Thu, 02 Mar 2023 16:31:34 +0000
Received: by outflank-mailman (input) for mailman id 505238;
 Thu, 02 Mar 2023 16:31:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuGR=62=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pXlq8-0001IZ-Sk
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 16:31:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af99e17a-b917-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 17:31:31 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-z0xiPiE1MZGTjYv3zq48oQ-1; Thu, 02 Mar 2023 11:31:25 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0A7E101A55E;
 Thu,  2 Mar 2023 16:31:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CA32400EA93;
 Thu,  2 Mar 2023 16:31:21 +0000 (UTC)
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
X-Inumbo-ID: af99e17a-b917-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677774689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mTfeuO/znvs5lHRChCVKJ8TB4KKBsOzPzos7lhRqsaw=;
	b=Zjgy+PsPdD2VCyEiPDZvP0AS3BGIcaxUYd6jSTBQyT58vSnjGwz+FM785FVD3YjEv4iiHq
	qKgIczpd581Ng3QkUOFPd4M+35kNNmJGxYDHSiQeBTsYSLORiOjJJ5zDOalHZRx6I2yVVl
	9d/YUCN+biviMcJT/nHTS9ZbBkKgfKM=
X-MC-Unique: z0xiPiE1MZGTjYv3zq48oQ-1
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
Subject: [PATCH v2 5/6] docs/about/deprecated: Deprecate 32-bit arm hosts
Date: Thu,  2 Mar 2023 17:31:05 +0100
Message-Id: <20230302163106.465559-6-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

For running QEMU in system emulation mode, the user needs a rather
strong host system, i.e. not only an embedded low-frequency controller.
All recent beefy arm host machines should support 64-bit now, it's
unlikely that anybody is still seriously using QEMU on a 32-bit arm
CPU, so we deprecate the 32-bit arm hosts here to finally save use
some time and precious CI minutes.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 21ce70b5c9..c7113a7510 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -229,6 +229,15 @@ discontinue it. Since all recent x86 hardware from the past >10 years
 is capable of the 64-bit x86 extensions, a corresponding 64-bit OS
 should be used instead.
 
+System emulation on 32-bit arm hosts (since 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+Since QEMU needs a strong host machine for running full system emulation, and
+all recent powerful arm hosts support 64-bit, the QEMU project deprecates the
+support for running any system emulation on 32-bit arm hosts in general. Use
+64-bit arm hosts for system emulation instead. (Note: "user" mode emulation
+continuous to be supported on 32-bit arm hosts, too)
+
 
 QEMU API (QAPI) events
 ----------------------
-- 
2.31.1


