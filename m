Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFFB6A94FA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:15:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505709.778604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2RS-0002Jf-LD; Fri, 03 Mar 2023 10:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505709.778604; Fri, 03 Mar 2023 10:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2RS-0002Hv-GB; Fri, 03 Mar 2023 10:15:10 +0000
Received: by outflank-mailman (input) for mailman id 505709;
 Fri, 03 Mar 2023 10:15:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M2mb=63=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pY2RQ-00022o-90
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:15:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 445af429-b9ac-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:15:06 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-mpFHp4drOdGIlxtLMzSiMw-1; Fri, 03 Mar 2023 05:15:00 -0500
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEE061871D9C;
 Fri,  3 Mar 2023 10:14:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3771B492C14;
 Fri,  3 Mar 2023 10:14:57 +0000 (UTC)
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
X-Inumbo-ID: 445af429-b9ac-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677838504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DHZuso5/0DhJfAOxX6dvaVSE+Y2aY/gn2NzRTirrpYs=;
	b=aUPZ+iFpxZkoFjH3/2yT+raBlIRVoAcq8WsHxYuC1h7klhcKPDezW5Sw2HiZoZ5jc2EBQq
	keU0y91RKIZQB/LUm7F5yIbTGi+wBVW3h+Y+t9jjMOpsdtOjaQkzmdUxn5XYBl8I3Gjt4T
	ZoUSdBgytq2U6Dae/2iocnAuDi2jT2g=
X-MC-Unique: mpFHp4drOdGIlxtLMzSiMw-1
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
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 1/6] docs/about/deprecated: Deprecate 32-bit x86 hosts
Date: Fri,  3 Mar 2023 11:14:47 +0100
Message-Id: <20230303101452.769367-2-thuth@redhat.com>
In-Reply-To: <20230303101452.769367-1-thuth@redhat.com>
References: <20230303101452.769367-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

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
 docs/about/deprecated.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 15084f7bea..f0c1e6b545 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -196,6 +196,18 @@ CI coverage support may bitrot away before the deprecation process
 completes. The little endian variants of MIPS (both 32 and 64 bit) are
 still a supported host architecture.
 
+32-bit x86 hosts (since 8.0)
+''''''''''''''''''''''''''''
+
+Support for 32-bit x86 host deployments is increasingly uncommon in
+mainstream OS distributions given the widespread availability of 64-bit
+x86 hardware. The QEMU project no longer considers 32-bit x86 support
+to be an effective use of its limited resources, and thus intends to
+discontinue it. Since all recent x86 hardware from the past >10 years
+is capable of the 64-bit x86 extensions, a corresponding 64-bit OS
+should be used instead.
+
+
 QEMU API (QAPI) events
 ----------------------
 
-- 
2.31.1


