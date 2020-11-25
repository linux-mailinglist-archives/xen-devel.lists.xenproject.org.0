Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866642C3811
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 05:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37139.69369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPH-0000wO-T8; Wed, 25 Nov 2020 04:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37139.69369; Wed, 25 Nov 2020 04:27:51 +0000
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
	id 1khmPH-0000uy-N4; Wed, 25 Nov 2020 04:27:51 +0000
Received: by outflank-mailman (input) for mailman id 37139;
 Wed, 25 Nov 2020 04:27:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPF-0000sA-Gi
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d84af08-07af-408b-9549-f1d41c7a8398;
 Wed, 25 Nov 2020 04:27:49 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAA0120B80;
 Wed, 25 Nov 2020 04:27:47 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPF-0000sA-Gi
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:49 +0000
X-Inumbo-ID: 5d84af08-07af-408b-9549-f1d41c7a8398
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5d84af08-07af-408b-9549-f1d41c7a8398;
	Wed, 25 Nov 2020 04:27:49 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DAA0120B80;
	Wed, 25 Nov 2020 04:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278468;
	bh=CSa1gG/RT/f6nzrrY+UMikNynTa9ntaJ3vNiNTwvCr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1wZDPkPH+OUlmjAMm+FNgrz4aWEbP6zSYC8XHfBIRR2qqUb7tBS7kyTCCYRAHlWfL
	 xE0iP4zVKTyOKHErM/NCtGCTRgFeSLPgKcOcKFI0X/3pamr/+wQQ+I1CDWrXx9we11
	 wQMkDCDnwOOGe8xxvmLqRqUpWNI7hsM3MS+7hqy0=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 03/12] automation: pass --disable-werror for QEMUU builds if libc is musl
Date: Tue, 24 Nov 2020 20:27:36 -0800
Message-Id: <20201125042745.31986-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

QEMU upstream builds with warnings when libc is musl:

  #warning redirecting incorrect #include <sys/signal.h> to <signal.h>

Disable -Werror by passing --disable-werror to the QEMUU config script
if libc is musl.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/scripts/build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/automation/scripts/build b/automation/scripts/build
index 7038e5eb50..3fb2fe134c 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -28,6 +28,11 @@ if [[ "${CC}" == "clang"* ]]; then
     cfgargs+=("--disable-stubdom")
 fi
 
+# disable --disable-werror for QEMUU when building with MUSL
+if ! test -z "$(ldd /bin/ls|grep musl|head -1)"; then
+	cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
+fi
+
 # Qemu requires Python 3.5 or later
 if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))"; then
     cfgargs+=("--with-system-qemu=/bin/false")
-- 
2.17.1


