Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E254D9C4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 07:38:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350408.576752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1iC7-0000aT-UM; Thu, 16 Jun 2022 05:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350408.576752; Thu, 16 Jun 2022 05:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1iC7-0000YK-RP; Thu, 16 Jun 2022 05:37:27 +0000
Received: by outflank-mailman (input) for mailman id 350408;
 Thu, 16 Jun 2022 05:37:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7YVi=WX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o1iC6-0000YE-Lj
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 05:37:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65c10bbd-ed36-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 07:37:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EEB6221BC3;
 Thu, 16 Jun 2022 05:37:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8DAE139C4;
 Thu, 16 Jun 2022 05:37:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PojHK5LBqmKVRwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 16 Jun 2022 05:37:22 +0000
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
X-Inumbo-ID: 65c10bbd-ed36-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655357842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dts+yl7uUGQYgHpGD+VRq8p1wRFkW3OYpt27WoT5mBw=;
	b=Wx6s/9DMRIBUq5O2Ke+thHwBX/osV+aWHUpiZvIt+G+IFpLzMjvbRDuj/MJ050pNFTctl4
	8dE8pXdY3hRNQ0SbDIBUrxQXzeDaHSrwPiWsXhR6K0w0nwLIfI2c4YaTL8lAgab2z9P8Ij
	zoMmc13vZ8d1+vQZkTY/g1lOkI6qGa8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: viresh.kumar@linaro.org,
	hch@infradead.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v2] xen: don't require virtio with grants for non-PV guests
Date: Thu, 16 Jun 2022 07:37:15 +0200
Message-Id: <20220616053715.3166-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fa1f57421e0b ("xen/virtio: Enable restricted memory access using
Xen grant mappings") introduced a new requirement for using virtio
devices: the backend now needs to support the VIRTIO_F_ACCESS_PLATFORM
feature.

This is an undue requirement for non-PV guests, as those can be operated
with existing backends without any problem, as long as those backends
are running in dom0.

Per default allow virtio devices without grant support for non-PV
guests.

Add a new config item to always force use of grants for virtio.

Fixes: fa1f57421e0b ("xen/virtio: Enable restricted memory access using Xen grant mappings")
Reported-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- remove command line parameter (Christoph Hellwig)
---
 drivers/xen/Kconfig | 9 +++++++++
 include/xen/xen.h   | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index bfd5f4f706bc..a65bd92121a5 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -355,4 +355,13 @@ config XEN_VIRTIO
 
 	  If in doubt, say n.
 
+config XEN_VIRTIO_FORCE_GRANT
+	bool "Require Xen virtio support to use grants"
+	depends on XEN_VIRTIO
+	help
+	  Require virtio for Xen guests to use grant mappings.
+	  This will avoid the need to give the backend the right to map all
+	  of the guest memory. This will need support on the backend side
+	  (e.g. qemu or kernel, depending on the virtio device types used).
+
 endmenu
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 0780a81e140d..4d4188f20337 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -56,7 +56,7 @@ extern u64 xen_saved_max_mem_size;
 
 static inline void xen_set_restricted_virtio_memory_access(void)
 {
-	if (IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain())
+	if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain())
 		platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
 }
 
-- 
2.35.3


