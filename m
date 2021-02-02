Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457BD30C48E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 16:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80614.147527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6y2y-0004sn-QD; Tue, 02 Feb 2021 15:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80614.147527; Tue, 02 Feb 2021 15:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6y2y-0004sO-Mr; Tue, 02 Feb 2021 15:56:56 +0000
Received: by outflank-mailman (input) for mailman id 80614;
 Tue, 02 Feb 2021 15:56:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y9eS=HE=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1l6y2x-0004s2-Bs
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 15:56:55 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0810bf4a-0376-4a38-baf6-545f2149b5f5;
 Tue, 02 Feb 2021 15:56:54 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-SAE8JIHWPN2Un753zj4IYA-1; Tue, 02 Feb 2021 10:56:50 -0500
Received: by mail-wm1-f70.google.com with SMTP id b201so1624354wmb.9
 for <xen-devel@lists.xenproject.org>; Tue, 02 Feb 2021 07:56:50 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id u206sm3928158wme.12.2021.02.02.07.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:56:46 -0800 (PST)
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
X-Inumbo-ID: 0810bf4a-0376-4a38-baf6-545f2149b5f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612281413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FIeU5vr6P9ETMb5WrDe1IVgUMo9nsV2GwJpRkYb6CD0=;
	b=UzIapkeEU1SxYG/lEu20y2R2YdcwSNeckq+OcI36h6+uTSA3Bj2VAxRYcELUCqs9dKaDcp
	iXUCi71VtOA4GgsC8+j5koC/JHHe7W74UEx5gs0PGOwC4hzsXYwHk46GJ+egCEy5ifKFpl
	ClIrXAuDwzjOfVzb2DrmdeMlqCvwcqE=
X-MC-Unique: SAE8JIHWPN2Un753zj4IYA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FIeU5vr6P9ETMb5WrDe1IVgUMo9nsV2GwJpRkYb6CD0=;
        b=JXqNc5mDa91In2MHGWTY6Memec9Y01wY2+sGOjDj1CPwkvHGrf2EYJrYHwVbJATQu8
         /vdIPD4fbCVkhCXulEonwtBpW6rjD3uu87HGyjc7i4bVy7tgRKPnbpGuBo+45jMUF8FO
         WnMLUGdh5Z56+CeuKzA08ydH/6XpmdG0XyTNzgreYHDAasVwRBAOa+gj5YpFcHZnnOgH
         x3y3CqQuusX64uheZw1udRLHExmcygKxpQLxHyNW2m7ycJBgF4QKLUfljH2oa6POXeBU
         8+RTO1jff5Kripg27iTPea7sl2QXisNBiJ9JHYxJzw64gK28cdO+E+HbuD2W5oZOoQcu
         wnbA==
X-Gm-Message-State: AOAM533DdhE2w2zkoBvG1YgyGdyp5+CRsacfbaI2nszD1HRL5DyZfwOu
	cD15ytymg8ikr1E4w4TiWHYZcaEjH4o9x/asqqP7pzw2x++YxK/bxvED9UrYdW8/YqB8gIX3Sf7
	DmL06MiM/YRsHQvQSlTYbkJ4igFQ=
X-Received: by 2002:a05:600c:28b:: with SMTP id 11mr4281530wmk.98.1612281409506;
        Tue, 02 Feb 2021 07:56:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKYLHerQzAoFfIr5Ish+YXWqEJkYkVd0aR+Ev7o1WaT/vyuU1T9BTgcwcLSBvcLIpm7WrhFg==
X-Received: by 2002:a05:600c:28b:: with SMTP id 11mr4281362wmk.98.1612281406773;
        Tue, 02 Feb 2021 07:56:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/i386/xen: Remove dead code
Date: Tue,  2 Feb 2021 16:56:44 +0100
Message-Id: <20210202155644.998812-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

'drivers_blacklisted' is never accessed, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/xen/xen_platform.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 7c4db35debb..01ae1fb1618 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -60,7 +60,6 @@ struct PCIXenPlatformState {
     MemoryRegion bar;
     MemoryRegion mmio_bar;
     uint8_t flags; /* used only for version_id == 2 */
-    int drivers_blacklisted;
     uint16_t driver_product_version;
 
     /* Log from guest drivers */
@@ -245,18 +244,10 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
 
 static uint32_t platform_fixed_ioport_readw(void *opaque, uint32_t addr)
 {
-    PCIXenPlatformState *s = opaque;
-
     switch (addr) {
     case 0:
-        if (s->drivers_blacklisted) {
-            /* The drivers will recognise this magic number and refuse
-             * to do anything. */
-            return 0xd249;
-        } else {
-            /* Magic value so that you can identify the interface. */
-            return 0x49d2;
-        }
+        /* Magic value so that you can identify the interface. */
+        return 0x49d2;
     default:
         return 0xffff;
     }
-- 
2.26.2


