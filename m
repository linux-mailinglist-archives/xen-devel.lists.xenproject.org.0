Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gU9GHcEzRmrJLgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:47:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216816F5798
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:47:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ITmOfOav;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1351517.1608684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfE11-00042J-IF; Thu, 02 Jul 2026 09:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351517.1608684; Thu, 02 Jul 2026 09:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfE11-0003zZ-F6; Thu, 02 Jul 2026 09:47:27 +0000
Received: by outflank-mailman (input) for mailman id 1351517;
 Thu, 02 Jul 2026 09:47:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stojkovicdusan555@gmail.com>) id 1wfE10-0003mp-Dq
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:47:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfE0z-00DHuU-7Z
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:47:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a463395-bab6-0a2a0a5309dd-0a2a4507b6fc-44
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:47:25 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a4633ac-9c8e-0a2a45070019-d155dd33a968-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:47:25 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4720f3bf164so186008f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 02:47:25 -0700 (PDT)
Received: from RTRKN1313-LIN.domain.local ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a15sm7539152f8f.14.2026.07.02.02.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 02:47:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782985644; x=1783590444; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHsFCClOErBCb2hCTW5Kdx5hfrAxpl2r1lI9X/xFrPM=;
        b=ITmOfOavKJQSNtGMR+RLZvrYCDrxTxb3AUuhd/0VvvyaHZVIqPDS9qRr/S+hLpkL9D
         /XO0wJKGXeJUJRZ3h3zURv77ws5Aj2iS819OLKOITpGLGbMja8lECXReJFxR/K6juqL7
         3C8VlmHGQaAy7Nw5cRs0TLdinIfx3lMfdqy49G2NuaDm1Ms9Z1bNjmKOiCquRL9gFG4U
         LopsGbWiIRGzEEKWEjCpRwE4E5QDNkegvexGieyfJpCmyZ6Wc289J3iuWyC1/XhqQWTw
         sHew7LmEnN30dXv0HhWjebNxOjyaBPids0LJKEIHCPXN2vs9m0mLMQfT5ou1gPmllkVu
         q8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985644; x=1783590444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BHsFCClOErBCb2hCTW5Kdx5hfrAxpl2r1lI9X/xFrPM=;
        b=eqm2ne+C41bzLTg9V7AOfq7dfHs1L41BPnbncOR58SlIA30p6IDFWNKbzgYDZEpbh3
         Ai9wF5MU4ZtJ3lsSI6YcWyiYN/k02YyiqwehiANyEHaA5h9KlaqIU+3Tm2mftHYshf5X
         h0ZK4XG17tNe/Ah2y4c/xWDic21cu+Gcl0X9YQmN8npOLmHlQWRVLEylzk1l0cdzmFua
         Rhrf2/5ySIILszqXqALpx4RimN55xJZrB7Uk3aDYSQ08uWxRExPEe86eFYNEu9655t/U
         e1yTg5HI+BfAv4gQIds5Q6oyzZuc6wfvLVY8svWJUeCrhI4LwQ3eAGB+B0srdc76X+tF
         g8Vg==
X-Forwarded-Encrypted: i=1; AHgh+RpkPPzCltjP74RsT8YgvqwcJGOcF/dvzNqO9+mgFk7pKnYjaZ7jqklGQLfiAyhoxrT30RMWNWdkoz8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzE+tHTkMG7uxP4ZhFNerldfUOYZob/gLY0AjCgfeII3q9TZIg5
	YnNaKN0I0sWhnQVo1R1Oc+/yww/GGuE2T5W5CRxqLg9K25MLXfdD801s
X-Gm-Gg: AfdE7cn5WoxBF86mu5m44DpbXiyn6SD7qVeR5uy39U1gg5VivjGJ0b9rDKLdIF7q+HE
	d1chUS7eVOnlO4zbggXNPEE/IImSnTZj9xG8fFvP7Pu6LVYIBD2meORvEuHfZ0mGzdk41Tb9rgd
	5j0s4wtRllILB+cFFTeVygkM0UjaOjRhlBwRFIBWeM/3WscSI5jAWyNuGdqkMuFYOcOnCEqegKF
	rmvYdGeNMSfGV/kSZgMvLc092ts0jRJdzBsh7eSGX8RC2phiU58fh08dbustyZewZsZn5zxbIJY
	rHx2Trey51xDS/41dhm3I4doX28U/CoXqpobRxP7JubaJiNbIStMmbTVVZ6p3QQk52PPZK1Sw92
	/5DkgjOlHSGzUhocnqAAce96ehjqLOjaK93dIrLqqdigyTzXCakFtjb5Ifdct4pJIXfg+cQVxxK
	VMPAf/GH/Efk4dAdZwJJVgJM2XdGjHO3mhIrQ+9FRAuQ==
X-Received: by 2002:a05:6000:290f:b0:46f:9026:4971 with SMTP id ffacd0b85a97d-475de54e175mr13729534f8f.11.1782985644267;
        Thu, 02 Jul 2026 02:47:24 -0700 (PDT)
From: Dusan Stojkovic <stojkovicdusan555@gmail.com>
Date: Thu, 02 Jul 2026 11:46:12 +0200
Subject: [PATCH RFC v3 1/2] vhost: accept Xen guest RAM sections for
 vhost-user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-vhost-xen-foreign-mapping-v3-1-2b8ef913382b@rt-rk.com>
References: <20260702-vhost-xen-foreign-mapping-v3-0-2b8ef913382b@rt-rk.com>
In-Reply-To: <20260702-vhost-xen-foreign-mapping-v3-0-2b8ef913382b@rt-rk.com>
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
X-purgate-ID: tlsNG-ef75cf/1782985645-FF33F25E-264A153B/0/0
X-purgate-type: clean
X-purgate-size: 3365
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:mst@redhat.com,m:sgarzare@redhat.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:xen-devel@lists.xenproject.org,m:viresh.kumar@linaro.org,m:Dusan.Stojkovic@rt-rk.com,m:Nikola.Jelic@rt-rk.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stojkovicdusan555@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 216816F5798

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
index af41841b52..ffc692b3e2 100644
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
+         * can be passed to a vhost-user backend.  The backend
+         * instead maps guest memory through the Xen foreign mapping
+         * interface, by guest physical address and domain id (see
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


