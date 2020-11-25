Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A12C3816
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 05:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37145.69417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPW-0001Kx-Dd; Wed, 25 Nov 2020 04:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37145.69417; Wed, 25 Nov 2020 04:28:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPW-0001K5-83; Wed, 25 Nov 2020 04:28:06 +0000
Received: by outflank-mailman (input) for mailman id 37145;
 Wed, 25 Nov 2020 04:28:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPU-0000sM-08
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 976f4d4b-5100-479f-9da3-48865daf123c;
 Wed, 25 Nov 2020 04:27:50 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 755D0208C3;
 Wed, 25 Nov 2020 04:27:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPU-0000sM-08
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:04 +0000
X-Inumbo-ID: 976f4d4b-5100-479f-9da3-48865daf123c
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 976f4d4b-5100-479f-9da3-48865daf123c;
	Wed, 25 Nov 2020 04:27:50 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 755D0208C3;
	Wed, 25 Nov 2020 04:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278469;
	bh=KQsbwCY1k0XuZYdXiSfsiaplbcxxxjQeQ4+gIm03Bo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZK8FpxKj+Nqy2ZUpuKcyjEWsJhA7/6x2cIFxmPOFR3pvJdjkxWfwe3vl91BkSVCKa
	 eKM90XH1uBWGtjW0o8bIu6cWh4qpAVd2V+RJdwRVVtNiGvb5vbz7fyUpubYXt6Fdoe
	 l7Ie98tR0bVFYWE5JXyMlk9h5TlzScf0r4kr2LUI=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 06/12] automation: add alpine linux 3.12 x86 build container
Date: Tue, 24 Nov 2020 20:27:39 -0800
Message-Id: <20201125042745.31986-6-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/build/alpine/3.12.dockerfile | 52 +++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 automation/build/alpine/3.12.dockerfile

diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.12.dockerfile
new file mode 100644
index 0000000000..2c02417ee6
--- /dev/null
+++ b/automation/build/alpine/3.12.dockerfile
@@ -0,0 +1,52 @@
+FROM alpine:3.12
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN \
+  # apk
+  apk update && \
+  \
+  # xen build deps
+  apk add argp-standalone && \
+  apk add autoconf && \
+  apk add automake && \
+  apk add bash && \
+  apk add curl && \
+  apk add curl-dev && \
+  apk add dev86 && \
+  apk add gcc  && \
+  apk add clang  && \
+  apk add gettext && \
+  apk add git && \
+  apk add iasl && \
+  apk add libaio-dev && \
+  apk add linux-headers && \
+  apk add make && \
+  apk add musl-dev  && \
+  apk add libc6-compat && \
+  apk add ncurses-dev && \
+  apk add patch  && \
+  apk add python3-dev && \
+  apk add texinfo && \
+  apk add util-linux-dev && \
+  apk add xz-dev && \
+  apk add yajl-dev && \
+  apk add zlib-dev && \
+  \
+  # qemu build deps
+  apk add bison && \
+  apk add flex && \
+  apk add glib-dev && \
+  apk add libattr && \
+  apk add libcap-ng-dev && \
+  apk add pixman-dev && \
+  \
+  # cleanup
+  rm -rf /tmp/* && \
+  rm -f /var/cache/apk/*
-- 
2.17.1


