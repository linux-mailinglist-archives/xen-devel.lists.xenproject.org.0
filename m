Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFD6AB8B6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 09:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506782.779959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6V3-0001Bf-4d; Mon, 06 Mar 2023 08:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506782.779959; Mon, 06 Mar 2023 08:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6V2-00018I-UJ; Mon, 06 Mar 2023 08:47:16 +0000
Received: by outflank-mailman (input) for mailman id 506782;
 Mon, 06 Mar 2023 08:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4jh=66=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pZ6V2-0000ol-2g
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 08:47:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cb2f890-bbfb-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 09:47:13 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-NkXWXKrvNS6cNOE-ISoWlA-1; Mon, 06 Mar 2023 03:47:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 027C487A391;
 Mon,  6 Mar 2023 08:47:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC35A175AD;
 Mon,  6 Mar 2023 08:47:05 +0000 (UTC)
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
X-Inumbo-ID: 7cb2f890-bbfb-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678092431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=37MyqIGrJ8NDqQYDY+IFgkqLJhkh+Oz/+/sGdhCxVu4=;
	b=d93zdGY+sC/dp6PQ7r4RRuswWzSmxDJYAbbV1op3/OuLn4cXrFdWqrCdf8h7zeWpA2xdPb
	Z5vDvXkamjiToVj1vzHZ4npFlx+spxnJO/JNuqiX4JuQHQF0SL6pJZ6UDkzB9Gd6MFcNNz
	lOEfw9nLUHg67R+kM+/+LzEni1fshAA=
X-MC-Unique: NkXWXKrvNS6cNOE-ISoWlA-1
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
Subject: [PATCH v4 2/5] docs/about/deprecated: Deprecate the qemu-system-i386 binary
Date: Mon,  6 Mar 2023 09:46:55 +0100
Message-Id: <20230306084658.29709-3-thuth@redhat.com>
In-Reply-To: <20230306084658.29709-1-thuth@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
binary is a proper superset of the qemu-system-i386 binary. With the
32-bit host support being deprecated, it is now also possible to
deprecate the qemu-system-i386 binary.

With regards to 32-bit KVM support in the x86 Linux kernel,
the developers confirmed that they do not need a recent
qemu-system-i386 binary here:

 https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1ca9dc33d6..c4fcc6b33c 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -34,6 +34,20 @@ deprecating the build option and no longer defend it in CI. The
 ``--enable-gcov`` build option remains for analysis test case
 coverage.
 
+``qemu-system-i386`` binary (since 8.0)
+'''''''''''''''''''''''''''''''''''''''
+
+The ``qemu-system-i386`` binary was mainly useful for running with KVM
+on 32-bit x86 hosts, but most Linux distributions already removed their
+support for 32-bit x86 kernels, so hardly anybody still needs this. The
+``qemu-system-x86_64`` binary is a proper superset and can be used to
+run 32-bit guests by selecting a 32-bit CPU model, including KVM support
+on x86_64 hosts. Thus users are recommended to reconfigure their systems
+to use the ``qemu-system-x86_64`` binary instead. If a 32-bit CPU guest
+environment should be enforced, you can switch off the "long mode" CPU
+flag, e.g. with ``-cpu max,lm=off``.
+
+
 System emulator command line arguments
 --------------------------------------
 
-- 
2.31.1


