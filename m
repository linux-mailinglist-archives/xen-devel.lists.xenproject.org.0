Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CA37CFE80
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 17:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619442.964603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVBd-0001qa-Bi; Thu, 19 Oct 2023 15:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619442.964603; Thu, 19 Oct 2023 15:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVBd-0001nc-8C; Thu, 19 Oct 2023 15:43:49 +0000
Received: by outflank-mailman (input) for mailman id 619442;
 Thu, 19 Oct 2023 15:43:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Lg=GB=casper.srs.infradead.org=BATV+06ae5fa416ae820d9d5a+7361+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtV8s-0005v1-8J
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 15:40:58 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e57cd846-6e95-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 17:40:57 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qtV8N-007ot2-OQ; Thu, 19 Oct 2023 15:40:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qtV8N-000PvA-1E; Thu, 19 Oct 2023 16:40:27 +0100
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
X-Inumbo-ID: e57cd846-6e95-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=jF67pHzxnrAWKEiszZxt5RKIgpusteGMnWw5yDJqImc=; b=imohxcfvgtCWq+2zIFKG49ThyV
	XP3T0mbUzGafIoUgVEIf2465cbSeAm78X1hwmUxQahR16j7YiaU4r0Gk2qVLKbmHzaZVMBYb+A+UH
	19tWH9EOZYj7xm2ZyAHOAU+Oyb5chRdqPvM9ERgCQWIpvyTuq2IBluPudM0rAaGlDAMqZjkEli+RS
	YpRi2jDv2eTzGGsc+5wCfgmtOS5HAHxT9wM80mUGHemr5aAQ/ItWqmoFJ6HYSwsPZlMEWszuVQlDt
	2DjW5zMibQLcUhji1knXOysxeWn2uzpvR108GmHMt2vpyQopheQTAB7sN5iR1UN0GQOFkwVEIS3f9
	R4Td0/QQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v2 22/24] tests/avocado: switch to using xen-net-device for Xen guest tests
Date: Thu, 19 Oct 2023 16:40:18 +0100
Message-Id: <20231019154020.99080-23-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019154020.99080-1-dwmw2@infradead.org>
References: <20231019154020.99080-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Fix the filename in the MAINTAINERS file too.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 MAINTAINERS                    | 2 +-
 tests/avocado/kvm_xen_guest.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9bd4fe378d..d74043d8a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -476,7 +476,7 @@ S: Supported
 F: include/sysemu/kvm_xen.h
 F: target/i386/kvm/xen*
 F: hw/i386/kvm/xen*
-F: tests/avocado/xen_guest.py
+F: tests/avocado/kvm_xen_guest.py
 
 Guest CPU Cores (other accelerators)
 ------------------------------------
diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
index 5391283113..f098028eeb 100644
--- a/tests/avocado/kvm_xen_guest.py
+++ b/tests/avocado/kvm_xen_guest.py
@@ -61,7 +61,7 @@ def run_and_check(self):
                          '-append', self.kernel_params,
                          '-drive',  f"file={self.rootfs},if=none,format=raw,id=drv0",
                          '-device', 'xen-disk,drive=drv0,vdev=xvda',
-                         '-device', 'virtio-net-pci,netdev=unet',
+                         '-device', 'xen-net-device,netdev=unet',
                          '-netdev', 'user,id=unet,hostfwd=:127.0.0.1:0-:22')
 
         try:
-- 
2.40.1


