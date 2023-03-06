Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED666AB8B7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 09:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506781.779945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6V1-0000lW-RG; Mon, 06 Mar 2023 08:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506781.779945; Mon, 06 Mar 2023 08:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6V1-0000fg-Kb; Mon, 06 Mar 2023 08:47:15 +0000
Received: by outflank-mailman (input) for mailman id 506781;
 Mon, 06 Mar 2023 08:47:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4jh=66=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pZ6Uz-0000dk-Sm
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 08:47:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bb705e8-bbfb-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 09:47:11 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-BweyhluRMwuANh_BPVGZnA-1; Mon, 06 Mar 2023 03:47:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AB3C1C05EB7;
 Mon,  6 Mar 2023 08:47:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21233440DE;
 Mon,  6 Mar 2023 08:47:02 +0000 (UTC)
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
X-Inumbo-ID: 7bb705e8-bbfb-11ed-96b4-2f268f93b82a
X-MC-Unique: BweyhluRMwuANh_BPVGZnA-1
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
Subject: [PATCH v4 1/5] docs/about/deprecated: Deprecate 32-bit x86 hosts for system emulation
Date: Mon,  6 Mar 2023 09:46:54 +0100
Message-Id: <20230306084658.29709-2-thuth@redhat.com>
In-Reply-To: <20230306084658.29709-1-thuth@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Hardly anybody still uses 32-bit x86 hosts today, so we should start
deprecating them to stop wasting our time and CI minutes here.
For example, there are also still some unresolved problems with these:
When emulating 64-bit binaries in user mode, TCG does not honor atomicity
for 64-bit accesses, which is "perhaps worse than not working at all"
(quoting Richard). Let's simply make it clear that people should use
64-bit x86 hosts nowadays and we do not intend to fix/maintain the old
32-bit stuff.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 15084f7bea..1ca9dc33d6 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -196,6 +196,17 @@ CI coverage support may bitrot away before the deprecation process
 completes. The little endian variants of MIPS (both 32 and 64 bit) are
 still a supported host architecture.
 
+System emulation on 32-bit x86 hosts (since 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+Support for 32-bit x86 host deployments is increasingly uncommon in mainstream
+OS distributions given the widespread availability of 64-bit x86 hardware.
+The QEMU project no longer considers 32-bit x86 support for system emulation to
+be an effective use of its limited resources, and thus intends to discontinue
+it. Since all recent x86 hardware from the past >10 years is capable of the
+64-bit x86 extensions, a corresponding 64-bit OS should be used instead.
+
+
 QEMU API (QAPI) events
 ----------------------
 
-- 
2.31.1


