Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D20031FADCF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 12:21:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl8iQ-00081L-AV; Tue, 16 Jun 2020 10:21:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jl8iO-00080c-9Q
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 10:21:12 +0000
X-Inumbo-ID: 19a42f3e-afbb-11ea-bb8b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19a42f3e-afbb-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 10:21:11 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GRjBZsy9kxu0D/p6GaawKqY6WO/uPQJvwbc/G4q2KaQ5qaPOv+gop+SJ8batzusqcUb1Y33edI
 m4SsHnYVBJk+UlGeFhlNb5hYWSmC949pc+azg6CJEKS7JTk6c98734WQMpaIJWHpvaupGCi4Gs
 Qm+GicgBjYNaP8/yNiPO2FvMfjxB6kI8IFqchSmZ9UgZIwn3Z0Mk60u1ByOwQJqTIHk6paQXBV
 1HbnjN3NQCdcnV0ExhnDJaFKCDBvco68gVfm1GOFSpOlEmlKuyvaJiM2Px7051woLMNExUVjfY
 J1o=
X-SBRS: 2.7
X-MesageID: 20489174
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20489174"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/hvm: check against VIOAPIC_LEVEL_TRIG in hvm_gsi_deassert
Date: Tue, 16 Jun 2020 12:20:56 +0200
Message-ID: <20200616102056.18074-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In order to avoid relying on the specific values of
VIOAPIC_{LEVEL/EDGE}_TRIG.

No functional change.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 6cbea63f4c..6772aec721 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -202,7 +202,7 @@ void hvm_gsi_deassert(struct domain *d, unsigned int gsi)
     int trig = vioapic_get_trigger_mode(d, gsi);
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
 
-    if ( trig <= VIOAPIC_EDGE_TRIG || gsi >= hvm_irq->nr_gsis )
+    if ( trig != VIOAPIC_LEVEL_TRIG || gsi >= hvm_irq->nr_gsis )
     {
         ASSERT(trig == VIOAPIC_EDGE_TRIG && gsi < hvm_irq->nr_gsis);
         return;
-- 
2.26.2


