Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC56A400E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502368.774124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbPR-0004l8-J2; Mon, 27 Feb 2023 11:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502368.774124; Mon, 27 Feb 2023 11:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbPR-0004iQ-GK; Mon, 27 Feb 2023 11:11:09 +0000
Received: by outflank-mailman (input) for mailman id 502368;
 Mon, 27 Feb 2023 11:11:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TcQP=6X=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pWbPP-0004iF-5D
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:11:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a8590d1-b68f-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 12:11:01 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-gGMehePCNs6EjNRatlKlsA-1; Mon, 27 Feb 2023 06:10:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E28DB3C10682;
 Mon, 27 Feb 2023 11:10:57 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FFFB40C6EC4;
 Mon, 27 Feb 2023 11:10:55 +0000 (UTC)
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
X-Inumbo-ID: 6a8590d1-b68f-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677496260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wU7XSs59OHmkrBANt2Ig03ayelNixYK5a46ZpJhqPYA=;
	b=eB8rZMdcY4idh1C/q/bns7ACAMitDj67PhQY2i+UpniN9YNzvn3ct6ugBMLH6ke/j9nCpZ
	ef2pVmhO/TupQ32r8bIkhDhV9aLT+pQywihxheT80Eev0YDW0jcpdDHz7H1CMIc0BCk/Lm
	7nzMq2RoR8BohFh9HsDQ1LlrZdl37BU=
X-MC-Unique: gGMehePCNs6EjNRatlKlsA-1
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
Subject: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and qemu-system-i386
Date: Mon, 27 Feb 2023 12:10:49 +0100
Message-Id: <20230227111050.54083-2-thuth@redhat.com>
In-Reply-To: <20230227111050.54083-1-thuth@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

Hardly anybody still uses 32-bit x86 hosts today, so we should
start deprecating them to finally have less test efforts.
With regards to 32-bit KVM support in the x86 Linux kernel,
the developers confirmed that they do not need a recent
qemu-system-i386 binary here:

 https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 15084f7bea..98517f5187 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -196,6 +196,19 @@ CI coverage support may bitrot away before the deprecation process
 completes. The little endian variants of MIPS (both 32 and 64 bit) are
 still a supported host architecture.
 
+32-bit x86 hosts and ``qemu-system-i386`` (since 8.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Testing 32-bit x86 host OS support takes a lot of precious time during the
+QEMU contiguous integration tests, and considering that most OS vendors
+stopped shipping 32-bit variants of their x86 OS distributions and most
+x86 hardware from the past >10 years is capable of 64-bit, keeping the
+32-bit support alive is an inadequate burden for the QEMU project. Thus
+QEMU will soon drop the support for 32-bit x86 host systems and the
+``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
+superset of ``qemu-system-i386``) on a 64-bit host machine instead.
+
+
 QEMU API (QAPI) events
 ----------------------
 
-- 
2.31.1


