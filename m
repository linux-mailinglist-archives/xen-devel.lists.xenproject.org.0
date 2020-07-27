Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115EF22F618
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 19:06:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k06Zg-0006s7-2v; Mon, 27 Jul 2020 17:06:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k06Ze-0006s0-Vf
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 17:06:03 +0000
X-Inumbo-ID: 72e92cc6-d02b-11ea-8ad9-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72e92cc6-d02b-11ea-8ad9-bc764e2007e4;
 Mon, 27 Jul 2020 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595869562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dFV/5IIieWSOyYLpuMea63bzinjrU9UWYgTJ7LkynSg=;
 b=QN/r0ryMllnh41ZJKvznUKbIbis/5iIlLxAEBhsmugf+38kyo0ZAJPbD
 Ivv9H5uc2zmJ3IxCwawAQJ3QD3BMFpf1cL2Yz3KCORa/4DAKhu6bNbbhQ
 XMY6Z6XYyWzDBaArK3wTZwW+WRi3uxeYxG1lOd+vBU59emlFmlwf5rVwU M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yX0Ucm7OmM9ftMh86I8MenFv19Jl15favDXMS1gmwiOs726c9E7XWQ6DfS6NhCbf7Yx5kJlvun
 ICR0PpJB8CmlbWKP8a2CS8m4x4dRvg9TZATeU3UTnouR72F0u4sS++/mxdQ+m9xRGC+WuANi63
 ANe5dWZrpj/Ur3UEuG74BTf4G92WneT9hdmOqi4hVFVnKIAeX9V+bbrWXru+MyXroPqGn9HBU0
 1lKGaH01YRIvIe7PhSUGzPYHchfzMuzPzCmw6J7WYHBbkpEGiJ7vDxc2s9Pk76huPiTWGQypCD
 35k=
X-SBRS: 2.7
X-MesageID: 23469017
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23469017"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 5/5] x86/hvm: only translate ISA interrupts to GSIs in
 virtual timers
Date: Mon, 27 Jul 2020 19:05:39 +0200
Message-ID: <20200727170539.55798-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727170539.55798-1-roger.pau@citrix.com>
References: <20200727170539.55798-1-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Only call hvm_isa_irq_to_gsi for ISA interrupts, interrupts
originating from an IO APIC pin already use a GSI and don't need to be
translated.

I haven't observed any issues from this, but I think it's better to
use it correctly.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Delay the setting of gsi a bit.
---
 xen/arch/x86/hvm/vpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 62c87867c5..c68bbd1558 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -86,13 +86,13 @@ static int pt_irq_vector(struct periodic_time *pt, enum hvm_intsrc src)
         return pt->irq;
 
     isa_irq = pt->irq;
-    gsi = hvm_isa_irq_to_gsi(isa_irq);
 
     if ( src == hvm_intsrc_pic )
         return (v->domain->arch.hvm.vpic[isa_irq >> 3].irq_base
                 + (isa_irq & 7));
 
     ASSERT(src == hvm_intsrc_lapic);
+    gsi = pt->source == PTSRC_isa ? hvm_isa_irq_to_gsi(isa_irq) : pt->irq;
     vector = vioapic_get_vector(v->domain, gsi);
     if ( vector < 0 )
     {
-- 
2.27.0


