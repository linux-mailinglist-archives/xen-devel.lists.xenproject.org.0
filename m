Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B6E6A4003
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502370.774145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbPT-0005Eq-5J; Mon, 27 Feb 2023 11:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502370.774145; Mon, 27 Feb 2023 11:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbPT-0005CA-1N; Mon, 27 Feb 2023 11:11:11 +0000
Received: by outflank-mailman (input) for mailman id 502370;
 Mon, 27 Feb 2023 11:11:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TcQP=6X=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pWbPR-0004j5-OK
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:11:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a0d826a-b68f-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 12:11:00 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-3BnZ8YXjO9i2G0RP3ALa-A-1; Mon, 27 Feb 2023 06:10:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AD063848C27;
 Mon, 27 Feb 2023 11:10:55 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B36A740C6EC4;
 Mon, 27 Feb 2023 11:10:52 +0000 (UTC)
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
X-Inumbo-ID: 6a0d826a-b68f-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677496259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HqNrPaN6lC01QUipjdhuAjHY1FZrvMej85mjtvyYQtg=;
	b=C2VTv2wVMq/cu3Q4HjP0F05LIC9SLwoBqLFgJRKWOCyONeGLbvwlvU+Y3ACS/Sgri93zZo
	a7JVSgyPg9cze58z3+LSPHx7MC2IEZvv9XPu5P0sU/DTZVLUcLX71F25iRqMSf9SZ86l0b
	DQ+ZOPnkODcArZ+9B8nvGK5SRHhRsco=
X-MC-Unique: 3BnZ8YXjO9i2G0RP3ALa-A-1
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
Subject: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Date: Mon, 27 Feb 2023 12:10:48 +0100
Message-Id: <20230227111050.54083-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

We're struggling quite badly with our CI minutes on the shared
gitlab runners, so we urgently need to think of ways to cut down
our supported build and target environments. qemu-system-i386 and
qemu-system-arm are not really required anymore, since nobody uses
KVM on the corresponding systems for production anymore, and the
-x86_64 and -arch64 variants are a proper superset of those binaries.
So it's time to deprecate them and the corresponding 32-bit host
environments now.

This is a follow-up patch series from the previous discussion here:

 https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/

where people still mentioned that there is still interest in certain
support for 32-bit host hardware. But as far as I could see, there is
no real need for 32-bit host support for system emulation on x86 and
arm anymore, so it should be fine if we drop these host environments
now (these are also the two architectures that contribute the most to
the long test times in our CI, so we would benefit a lot by dropping
those).

Thomas Huth (2):
  docs/about: Deprecate 32-bit x86 hosts and qemu-system-i386
  docs/about: Deprecate 32-bit arm hosts and qemu-system-arm

 docs/about/deprecated.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.31.1


