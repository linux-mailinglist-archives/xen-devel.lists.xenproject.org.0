Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B6E6A4002
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502369.774131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbPR-0004sS-TA; Mon, 27 Feb 2023 11:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502369.774131; Mon, 27 Feb 2023 11:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbPR-0004lC-On; Mon, 27 Feb 2023 11:11:09 +0000
Received: by outflank-mailman (input) for mailman id 502369;
 Mon, 27 Feb 2023 11:11:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TcQP=6X=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pWbPP-0004iF-Q8
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:11:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d2912c1-b68f-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 12:11:05 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-DJ-jRS76Mjy4jXphQxQ3Uw-1; Mon, 27 Feb 2023 06:11:01 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 996A7101A521;
 Mon, 27 Feb 2023 11:11:00 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 348B440C6EC4;
 Mon, 27 Feb 2023 11:10:58 +0000 (UTC)
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
X-Inumbo-ID: 6d2912c1-b68f-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677496264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KioUJTM1KSsfU9iQtLnRn1SvfePLH+pSeG29+t/WJ4c=;
	b=foGPiIr6kX+diJGlxiVLlXqr+CVhEjSZywLo57EbubDu1CkSavZz034YU81YT9aiLEcuSm
	MoGg55Di95uZLtfIieoIPeLlvGe/5JumY1lych27hrvUcUdIZrx4yn/qxHTWTcTuRpDXY4
	uVAwJQkgHhfvXU4JS4dUfREfdEMCraY=
X-MC-Unique: DJ-jRS76Mjy4jXphQxQ3Uw-1
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 2/2] docs/about: Deprecate 32-bit arm hosts and qemu-system-arm
Date: Mon, 27 Feb 2023 12:10:50 +0100
Message-Id: <20230227111050.54083-3-thuth@redhat.com>
In-Reply-To: <20230227111050.54083-1-thuth@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

qemu-system-aarch64 is a proper superset of qemu-system-arm,
and the latter was mainly still required for 32-bit KVM support.
But this 32-bit KVM arm support has been dropped in the Linux
kernel a couple of years ago already,so we don't really need
qemu-system-arm anymore, thus deprecated it now.

Additionally, it's quite unlikely that anybody is still running
full system emulation on a 32-bit arm host nowadays. All recent
strong arm host machines should support 64-bit now, so we also
deprecate the 32-bit hosts here to finally save some precious
minutes in our CI.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 98517f5187..a52e45b570 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -208,6 +208,23 @@ QEMU will soon drop the support for 32-bit x86 host systems and the
 ``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
 superset of ``qemu-system-i386``) on a 64-bit host machine instead.
 
+System emulation on 32-bit arm hosts and ``qemu-system-arm`` (since 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``. The
+latter was mainly a requirement for running KVM on 32-bit arm hosts, but
+this 32-bit KVM support has been removed some years ago already (see:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=541ad0150ca4
+). Thus the QEMU project will drop the ``qemu-system-arm`` binary in a
+future release -- use ``qemu-system-aarch64`` instead.
+
+Since you need a strong host machine for running full system emulation,
+and all recent strong hosts support 64-bit anyway, the QEMU project
+also deprecates the support for running any system emulation on 32-bit
+arm hosts in general. Use 64-bit arm hosts for system emulation instead.
+(Note: "user" mode emulation continuous to be supported on 32-bit arm
+hosts, too)
+
 
 QEMU API (QAPI) events
 ----------------------
-- 
2.31.1


