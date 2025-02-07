Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0CDA2C5B0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 15:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883731.1293654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgPU7-0003ws-50; Fri, 07 Feb 2025 14:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883731.1293654; Fri, 07 Feb 2025 14:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgPU7-0003uF-1I; Fri, 07 Feb 2025 14:37:35 +0000
Received: by outflank-mailman (input) for mailman id 883731;
 Fri, 07 Feb 2025 14:37:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTXj=U6=desiato.srs.infradead.org=BATV+283d3205a5fdf6ec7e2e+7838+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tgPU5-0003fk-9b
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 14:37:33 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e4b4831-e561-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 15:37:29 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tgPTx-0000000HBz1-3CSg; Fri, 07 Feb 2025 14:37:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tgPTw-0000000080s-1T6c; Fri, 07 Feb 2025 14:37:24 +0000
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
X-Inumbo-ID: 0e4b4831-e561-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=jqKBIjWS/VL/NerjFJ7l2smMvefEMdIXeKueSmtNuXM=; b=MKKeF0WkOdZdx0i7NBRAm39on6
	y9Zmbv3IOMDNE0uJoQ39VshYEZvnKrIUoG1hJhXrBp3oBos2Cya+Ac4rigAlMgFSqu+Kxzawoo4mJ
	CgxgnkpqM8EJ2St4+/5PMDGEtWQbz5Tb0g8WLiPJBYkhtLR+W3cYK7V4GG+I3qbW9qwNAIsmbiXZq
	/henGsqGvm0qTFwL7jLGXGjgkakz6CPFNN40julayByQ98c+Baw6d9RnQyHyDYfaKvTKIf5L0AoRF
	WZvPTj8S7xheeQgO6xnRHiyuejR6S0lHRADH+4/XFzUkMVfPltm2R3mYXCLMNvnZTEViY7l4Kcu/+
	MpZaYsxQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH 2/2] hw/xen: Add "mode" parameter to xen-block devices
Date: Fri,  7 Feb 2025 14:37:24 +0000
Message-ID: <20250207143724.30792-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207143724.30792-1-dwmw2@infradead.org>
References: <20250207143724.30792-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Block devices don't work in PV Grub (0.9x) if there is no mode specified. It
complains: "Error ENOENT when reading the mode"

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/block/xen-block.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 034a18b70e..e61eab466c 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -408,6 +408,8 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
     }
 
     xen_device_backend_printf(xendev, "info", "%u", blockdev->info);
+    xen_device_backend_printf(xendev, "mode",
+                              (blockdev->info & VDISK_READONLY) ? "r" : "w");
 
     xen_device_frontend_printf(xendev, "virtual-device", "%lu",
                                vdev->number);
-- 
2.48.1


