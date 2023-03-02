Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC2E6A8536
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505047.777575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxK-0001L8-Gj; Thu, 02 Mar 2023 15:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505047.777575; Thu, 02 Mar 2023 15:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxK-0001KM-DX; Thu, 02 Mar 2023 15:34:54 +0000
Received: by outflank-mailman (input) for mailman id 505047;
 Thu, 02 Mar 2023 15:34:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMsQ=62=desiato.srs.infradead.org=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxH-0001Jv-Rt
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:34:52 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c40c7173-b90f-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx4-00FL3p-2y; Thu, 02 Mar 2023 15:34:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uzb-2c; Thu, 02 Mar 2023 15:34:38 +0000
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
X-Inumbo-ID: c40c7173-b90f-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=YlCfg83tKKXeKZ+xSZwkLL5PykObe3vQTOvEbi/RER8=; b=DiDdTZUfWBP8v/oc6s9Gc9aXNS
	DmyqgfC2P9B45IlIUhm2YWvDQPvHiiZMs/BQ89SxeyJSf5E2HTlj+ZCzcRLDa0/a8FcOF7iLVyAsr
	azJp1I8YoM3OeYPl25JZTvu502Qzn+fbod4+skxoIEbpuN/1J63rVR3AM6QHzcZ6C0ew0Bi3bDLiZ
	NgndzJqcMVw4VoCQT6RZfpUmBEixeCCy4YqtPMnkFoxfig4gTTDy3kCz02zrewows2QJy5Rnq/NO/
	2bzEUzX4V06JKvYJAVxYK0SX7k/mMvXK7NlLKPp9M5QOQRefoDNpjLAVnzAzJtdOT/V8H9wOYf48f
	/OS0Gfyw==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 20/25] hw/xen: Hook up emulated implementation for event channel operations
Date: Thu,  2 Mar 2023 15:34:30 +0000
Message-Id: <20230302153435.1170111-21-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

We provided the backend-facing evtchn functions very early on as part of
the core Xen platform support, since things like timers and xenstore need
to use them.

By what may or may not be an astonishing coincidence, those functions
just *happen* all to have exactly the right function prototypes to slot
into the evtchn_backend_ops table and be called by the PV backends.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 886fbf6b3b..98a7b85047 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -34,6 +34,7 @@
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
 #include "hw/irq.h"
+#include "hw/xen/xen_backend_ops.h"
 
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
@@ -278,6 +279,17 @@ static const TypeInfo xen_evtchn_info = {
     .class_init    = xen_evtchn_class_init,
 };
 
+static struct evtchn_backend_ops emu_evtchn_backend_ops = {
+    .open = xen_be_evtchn_open,
+    .bind_interdomain = xen_be_evtchn_bind_interdomain,
+    .unbind = xen_be_evtchn_unbind,
+    .close = xen_be_evtchn_close,
+    .get_fd = xen_be_evtchn_fd,
+    .notify = xen_be_evtchn_notify,
+    .unmask = xen_be_evtchn_unmask,
+    .pending = xen_be_evtchn_pending,
+};
+
 static void gsi_assert_bh(void *opaque)
 {
     struct vcpu_info *vi = kvm_xen_get_vcpu_info_hva(0);
@@ -318,6 +330,9 @@ void xen_evtchn_create(void)
     s->nr_pirq_inuse_words = DIV_ROUND_UP(s->nr_pirqs, 64);
     s->pirq_inuse_bitmap = g_new0(uint64_t, s->nr_pirq_inuse_words);
     s->pirq = g_new0(struct pirq_info, s->nr_pirqs);
+
+    /* Set event channel functions for backend drivers to use */
+    xen_evtchn_ops = &emu_evtchn_backend_ops;
 }
 
 void xen_evtchn_connect_gsis(qemu_irq *system_gsis)
-- 
2.39.0


