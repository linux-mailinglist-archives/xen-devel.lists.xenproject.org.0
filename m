Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F297C301123
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 00:53:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73149.131897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l36FK-00059f-Ja; Fri, 22 Jan 2021 23:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73149.131897; Fri, 22 Jan 2021 23:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l36FK-00059E-G9; Fri, 22 Jan 2021 23:53:42 +0000
Received: by outflank-mailman (input) for mailman id 73149;
 Fri, 22 Jan 2021 23:53:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1bT=GZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l36FJ-000591-7w
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 23:53:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b8b8f36-b8c9-489b-8f80-1cbab9bd780d;
 Fri, 22 Jan 2021 23:53:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBBD223B3E;
 Fri, 22 Jan 2021 23:53:39 +0000 (UTC)
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
X-Inumbo-ID: 8b8b8f36-b8c9-489b-8f80-1cbab9bd780d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611359620;
	bh=Uhnrtf9LwnUYzocKKHV6J972vNMtuAW6aKq9earp7Og=;
	h=From:To:Cc:Subject:Date:From;
	b=h0qmUJzaKYdMG2fJytgn5zENXbhGM8FvgYZ5EGpHK4fVuSNdfzhze8duMJmp7gopM
	 s+z8/vsmXM0l4QsigFim9trNOWVKw5A2pGtCQ26vYC8FwTbXH8Z7jHVhsx4Q+WbYt+
	 Xk5qKdTrWRcatygukJp3jQ/DJqQBYSUvXzDzz6i0gMhoLr0MrP+094mP+QiNE7kNhV
	 WKPyU6+pVbYt8EnQY0wvqRnal/2iXxllBdZBRKYULcZ6dGZsrGhJck8jnwsYEykzhm
	 GSbOSSme2XPKHMIBzNXde2VkIfvMqoPZG8CEpsw2RImd95mf5Dm3jr1ChIPsMG7OGB
	 YvZBHvGodzh6g==
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH] automation: fix qemu-alpine-arm64.sh
Date: Fri, 22 Jan 2021 15:53:37 -0800
Message-Id: <20210122235337.5414-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Remove copy/paste error introduced by f58976544ff4 ("automation: use
test-artifacts/qemu-system-aarch64 instead of Debian's")

Fixes: f58976544ff4 ("automation: use test-artifacts/qemu-system-aarch64 instead of Debian's")
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/scripts/qemu-alpine-arm64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-alpine-arm64.sh b/automation/scripts/qemu-alpine-arm64.sh
index e2240f9ab4..f4ac2d856f 100755
--- a/automation/scripts/qemu-alpine-arm64.sh
+++ b/automation/scripts/qemu-alpine-arm64.sh
@@ -69,7 +69,7 @@ find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
 cd ../..
 
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
-curl -fsSLO curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
 ./binaries/qemu-system-aarch64 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
-- 
2.17.1


