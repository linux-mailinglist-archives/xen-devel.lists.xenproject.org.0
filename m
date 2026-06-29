Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gkMcBplNQmq74QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:48:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF986D90C3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:48:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mV7T5+VU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1347468.1605315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we9Xc-0005Tj-M2; Mon, 29 Jun 2026 10:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347468.1605315; Mon, 29 Jun 2026 10:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we9Xc-0005Qs-GZ; Mon, 29 Jun 2026 10:48:40 +0000
Received: by outflank-mailman (input) for mailman id 1347468;
 Mon, 29 Jun 2026 10:48:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stojkovicdusan555@gmail.com>) id 1we9Xa-0005Qb-V6
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 10:48:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we9Xa-00HDHB-3H
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 12:48:38 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a424d84-bab6-0a2a0a5309dd-0a2a4507b498-10
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:48:38 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a424d85-9c8e-0a2a45070019-d155dd2fe96e-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:48:37 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4704d652e9cso1190428f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 03:48:37 -0700 (PDT)
Received: from RTRKN1313-LIN.domain.local
 (cable-89-216-248-190.dynamic.sbb.rs. [89.216.248.190])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46cf775a4f0sm39691675f8f.17.2026.06.29.03.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 03:48:37 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782730117; x=1783334917; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwvkO6znXhIa5qM7wiZu9yQsBOrMOtM8ilQjUKeprio=;
        b=mV7T5+VUwpfK1XCTdtd+iG4OvHu2n9RWi7rFl01EKALpHDhNIxGfBElU4v5UHPTqgn
         rQBIMdVSnDN8q3emVY7zLaaYLebhEPfUImbq+gCmNfisz1xuJ6CCrpN8h37+3QKcLNRC
         Zpgz1xaFdCARAZYQ4WmRaE3QtV7I4vbfp4ghMh4Z5u3vlLl4fkUADl55h/FpRqX6kiWs
         BG60nUtL6aHBiZxEQxDmP5FZM2oAQt6ZMyrcOz7d2JTj4Dcd+uMtloaC6W4pSvKgXBlj
         rzhDfasHa7TcJphOasU/ofbTTIjQ70qWdsWeFOZEzR0gi2gkIYaz4oAjg1lqIo2CEWF2
         LOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730117; x=1783334917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bwvkO6znXhIa5qM7wiZu9yQsBOrMOtM8ilQjUKeprio=;
        b=CDe6Cn+ZlCj4k9YtR+BeTzDyFhN4dhaG38zuyT+/MLq7zOV/HV06TqsfMCxHMJDr4/
         2wWaZHKNouYy6nVp5IieEbecwDsmk8DqWCiVXphRIbARl61V0AxJ9SFBX860NqWy37Mh
         NdlTdZw1KvUnvDplPglGNPXeNbF/Ze7i+SNMmtMUF/PFnxVd3+zvkvgZpgh5yira/P+F
         Ry7YNDkVYoo9jq2J/j1Q+Hj+jglHXdiiWcXSKA6CaBMN6XywnWNVveFIGBJXnyd5GRtX
         3fTiIPvdKIb5McPZbbd6imOUa1kdmZhbMjUXAPt9PAJjyT1ad8Wx4NzE8TV1OgNqIqFP
         XhSA==
X-Forwarded-Encrypted: i=1; AHgh+RoU0X4VNdrl1bWiP8lS/90Rc05O1PvfKT5mXpf3n9Taz0YEtbVMRrnJQUhNaWInCy8EWWgz5lTg/iQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxit913t+bHgPwSIb6xdGg4yTc8QNHnXuZRAlzC9JXG17rwASx6
	IzZF1z2+ZRy69dJXLLeiFS0m0wF37RFLClqz0b1hynqOuNGpIyinn4oj
X-Gm-Gg: AfdE7cnDk4Yka6yGfJvLMJfpi4ojKRtqr0iE+ULnIAvrjNMFK6yhODwN5kstNrZxpuF
	JngznfRVLgv7s8PDzcbTiURBG9ahrn2CW9GqRNycHCbNVsRDisofZ3sPJd1BYN2HAGX57PQ7/po
	0UrUdde2ED4xEB0yNd9W3xtFXgUVVdevCybr5ZBhR/7NrjXuSz+7bl6qVMuhQKKkqyHFRqwr3uN
	6vlsYAHrsYwTHVGcTGi7O/fUbZOFZIm85Ctv9SIJ0Kwwh/k5vRdNZU+NP6eNvaQEx26bWI0i8qu
	8rsJ9JaDj61f+m7xXAKlDynododfIwFAqnVL6EPO49wR2HkBdEemA61KRpAz7ekDbevf4QYniN0
	RDugjB0d5O+djKLGDgVtdByGVqjq1zohZxX68CoPVCKsjrQLZThmfDe14+KytNHn86cCiHTIWJE
	30KJrg8k3RtDWVofSh6U81hodvqw8W13KZW2kKy08chDjwohYSp7YhqQrShLKUZKw7AqVp/3d5K
	m+mX3pQ4vsKlWaTqtt1
X-Received: by 2002:a05:6000:18a3:b0:473:975c:4fd1 with SMTP id ffacd0b85a97d-473975c51admr5618332f8f.25.1782730117239;
        Mon, 29 Jun 2026 03:48:37 -0700 (PDT)
From: Dusan Stojkovic <stojkovicdusan555@gmail.com>
Date: Mon, 29 Jun 2026 12:46:25 +0200
Subject: [PATCH RFC v2 1/2] vhost: accept Xen guest RAM sections for
 vhost-user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-vhost-xen-foreign-mapping-v2-1-19e4685e7575@rt-rk.com>
References: <20260629-vhost-xen-foreign-mapping-v2-0-19e4685e7575@rt-rk.com>
In-Reply-To: <20260629-vhost-xen-foreign-mapping-v2-0-19e4685e7575@rt-rk.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 xen-devel@lists.xenproject.org, Viresh Kumar <viresh.kumar@linaro.org>, 
 Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>, 
 Nikola Jelic <Nikola.Jelic@rt-rk.com>
X-Mailer: b4 0.13.0
X-purgate-ID: tlsNG-ef75cf/1782730118-FEB3B25E-1710D2AD/0/0
X-purgate-type: clean
X-purgate-size: 3356
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[stojkovicdusan555@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:mst@redhat.com,m:sgarzare@redhat.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:xen-devel@lists.xenproject.org,m:viresh.kumar@linaro.org,m:Dusan.Stojkovic@rt-rk.com,m:Nikola.Jelic@rt-rk.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,xenproject.org,gmail.com,lists.xenproject.org,linaro.org,rt-rk.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[stojkovicdusan555@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FF986D90C3

From: Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>

When QEMU runs as a Xen device model, the guest's RAM is not allocated
by QEMU and is not backed by a file descriptor that could be shared
with a vhost-user backend: accesses from QEMU go through the Xen
mapcache and memory_region_get_fd() returns -1. vhost_section()
therefore filters out every RAM section, the vhost memory listener
registers no regions, and starting any vhost-user device fails with
"Failed initializing vhost-user memory map".

With VHOST_USER_PROTOCOL_F_XEN_MMAP the backend does not need an fd or
a process-local mapping it maps guest memory itself through the Xen
foreign mapping interface, using the guest physical address and domain
id. Accept the Xen RAM region in vhost_section() so that it reaches
the backend's memory table.

The Xen grant region (xen.grants) must never be accepted: grant
references can only be mapped individually on demand via
address_space_map(), and deriving a host pointer for the whole region,
as vhost_region_add_section() does, aborts in the Xen mapcache. Note
that xen_mr_is_memory() returns true for both the RAM and the grants
region, so the grants region is excluded explicitly.

Because of the necessity to exlude xen.grants, the missing stub for
xen_mr_is_grants is added so that it can be called from common code.

Signed-off-by: Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>
Signed-off-by: Nikola Jelic <Nikola.Jelic@rt-rk.com>
---
 hw/virtio/vhost.c  | 18 ++++++++++++++++++
 hw/xen/xen_stubs.c |  5 +++++
 2 files changed, 23 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index af41841b52..26770d06d5 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -29,6 +29,7 @@
 #include "system/dma.h"
 #include "system/memory.h"
 #include "system/ramblock.h"
+#include "system/xen.h"
 #include "trace.h"
 
 /* enabled until disconnected backend stabilizes */
@@ -657,6 +658,23 @@ static bool vhost_section(struct vhost_dev *dev, MemoryRegionSection *section)
             return false;
         }
 
+        /*
+         * Under Xen, the guest's RAM is not backed by an fd that
+         * be passed to a vhost-user backend.  The backend instead
+         * guest memory through the Xen foreign mapping interface,
+         * by guest physical address and domain id (see
+         * VHOST_USER_PROTOCOL_F_XEN_MMAP), so accept the Xen RAM
+         * region even though it has no fd.
+         */
+        if (xen_enabled()) {
+            if (xen_mr_is_memory(mr) && !xen_mr_is_grants(mr)) {
+                trace_vhost_section(mr->name);
+                return true;
+            }
+            trace_vhost_reject_section(mr->name, 4);
+            return false;
+        }
+
         /*
          * Some backends (like vhost-user) can only handle memory regions
          * that have an fd (can be mapped into a different process). Filter
diff --git a/hw/xen/xen_stubs.c b/hw/xen/xen_stubs.c
index f830768d99..7af39bceb0 100644
--- a/hw/xen/xen_stubs.c
+++ b/hw/xen/xen_stubs.c
@@ -29,6 +29,11 @@ bool xen_mr_is_memory(const MemoryRegion *mr)
     g_assert_not_reached();
 }
 
+bool xen_mr_is_grants(const MemoryRegion *mr)
+{
+    g_assert_not_reached();
+}
+
 bool xen_map_cache_enabled(void)
 {
     return false;

-- 
2.43.0


