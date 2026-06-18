Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WIkLARgSNGqyNQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 17:43:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4ED6A14F2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 17:43:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UK5r4pp1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1341410.1601874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEtO-0008Vo-3v; Thu, 18 Jun 2026 15:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341410.1601874; Thu, 18 Jun 2026 15:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEtN-0008QP-T4; Thu, 18 Jun 2026 15:42:57 +0000
Received: by outflank-mailman (input) for mailman id 1341410;
 Thu, 18 Jun 2026 15:42:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stojkovicdusan555@gmail.com>) id 1waEsb-0008GB-T0
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 15:42:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEsb-002UN8-9l
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 17:42:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a34119d-bab6-0a2a0a5309dd-0a2a450c9a6a-46
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 17:42:09 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a3411d1-94a4-0a2a450c0019-d155dd31b5b2-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 17:42:09 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-46019edc13dso643109f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 08:42:09 -0700 (PDT)
Received: from RTRKN1313-LIN.domain.local ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c473bsm69038581f8f.28.2026.06.18.08.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 08:42:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781797329; x=1782402129; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwvkO6znXhIa5qM7wiZu9yQsBOrMOtM8ilQjUKeprio=;
        b=UK5r4pp1pOEtegL19gUPBVrXTWqCAaxPQ3Ek5nQBJJ5FTVf0SgaoTKCpnVz1RikpM7
         /xqmeczEFoN3z5/0TIe1edIy9CuLRT7YMlejZj5dRgIe68jIxYOFvpt2fF7gx4M0wCgM
         ah1NFAWXoVD7wQFea4/ROu6H0Z1PlZP9MXMUCIRI135ymbDw/GhnvXfhZU6D1YeJI4mP
         lQHjuD1F+AHKLcmORCgVXZMDE65TwlVLOSp8JIKevoBc/aQWsxAYUgu9MrX3k/Ln27cU
         ccaZOziQsmELKgIs+h/f429b4I+smorQd5pDGeO46OKXtxlw8oLzxK1zjOMrCqrzFjav
         4zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781797329; x=1782402129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bwvkO6znXhIa5qM7wiZu9yQsBOrMOtM8ilQjUKeprio=;
        b=LTFAerhgg3B5ijSwxthgZDuddL5Msop/NNzLcNyhkGMqpGI2pmh4Hfl3XGJwqGfux7
         xfxga87n3NUk2ssN/QlZa5QWTBRju6qd4Xqi8QhaLUbzD2tAUcpUGcNqte4oYHmQDE2w
         Fc5Xy3mjy7MIF2vu9uWcaz3LMJ3fiJ1iHbAYWspy5sVi4WDYJy6S5jdKqdq1jceWk1i5
         vKfkWW4B+F2MJr/p+V+Z9rZyL9tHHy6smOAQ+PyiC05k5cKD9dve8HQLKqdp/ENZIQAE
         LCsYUbERSpmFJ0VlZLb9UuwREXrkUFzj/qx8YdZ5tVHpwr+zOsbCFEe+F7jNthqXLn+S
         CK4w==
X-Forwarded-Encrypted: i=1; AFNElJ8wQMrR4VbhRZPM0saUcZPHJ2AtfaZnL7b62qm4EeFXxrCoQL6LQ6xQ19DFOgBD3qZTlPp8EWmNdpo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9y54xrrQaF3swQmo6T2MTF9Ba3PD3GX8pZAUCs+Gnjv7drc6l
	TkBJlVDvHLFaGL9z+VBzTDsZf8TWJJnwlLixgw6Jn063ah14D0RW3hlP
X-Gm-Gg: AfdE7cmIflTlRIOZ2fZL+IDxX5JgHKSalXDJTzfvN922PiWfG+WOhMBbk7hh+wHdDeq
	d+ccjhsB/0YITiDDl3CyfS0ObBhAp6Txbxt/JI99eVDpPdJdCf6AUzA/enS4aTlT3P3/duni8nf
	jakfGDZ7Ioi/sjTzd7CBLrdLH7RZ3FafJNILPUpe/0bChbglQMZ5oYdLZ7B0G/MGpC8VV1DKteb
	eOOVYLu46KtEfb93PgwBIrMmta1Yrbgfa2jNGQGRJFoHZ1iOW92IsTjvQ+Y0mrKM4qLmI1hEjYb
	c0e9XhuSeK0gqIO83n7gKU7/XuFlDzPJXHTzsU8mFYWH2vZOgTMe4XetIHxCHeCzlAtRCofCMOk
	gAG85KYAKVL8AZub90oZCMVH/dQKiF9JzDeAoLi1sANVCVj9FjEnTfTnR1wgb8NE3fpWd2RvEAh
	Lm4IE7+6XUPIvQMNS9qvjwKSxboJ31GsgaJHp6PrmkOvYbvSEsU19y
X-Received: by 2002:a05:6000:2382:b0:45e:df08:b02 with SMTP id ffacd0b85a97d-46240cf9461mr15122509f8f.28.1781797328378;
        Thu, 18 Jun 2026 08:42:08 -0700 (PDT)
From: Dusan Stojkovic <stojkovicdusan555@gmail.com>
Date: Thu, 18 Jun 2026 17:39:36 +0200
Subject: [PATCH RFC 1/2] vhost: accept Xen guest RAM sections for
 vhost-user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-vhost-xen-foreign-mapping-v1-1-7f60a6241971@rt-rk.com>
References: <20260618-vhost-xen-foreign-mapping-v1-0-7f60a6241971@rt-rk.com>
In-Reply-To: <20260618-vhost-xen-foreign-mapping-v1-0-7f60a6241971@rt-rk.com>
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
X-purgate-ID: tlsNG-d25034/1781797329-51DF4ABF-D137DFF2/0/0
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
X-Rspamd-Queue-Id: 4E4ED6A14F2

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


