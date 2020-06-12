Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3431F7B2E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:57:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjm3Y-0006ML-12; Fri, 12 Jun 2020 15:57:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h37=7Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jjm3W-0006Lr-4d
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:57:22 +0000
X-Inumbo-ID: 6624bcfa-acc5-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6624bcfa-acc5-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 15:57:21 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rVAZ4lcV09ivW5keN6zjsXLA88pLfNsACRUUlIrMjY0Np5SExn6kfS/MQ39zwDOZc/r4NY9NQi
 oa+niKpIOqTzC7qZN+SdHYA8agDCLiZZGPM6p/clhXW7jR/ogaTT4LeqZL6jwMN6f0X9egi3xX
 EBrvU2B3oUdCMR+ayxGN9l0tO26jz9tz/Try8F0FaOeVOaVrv7OmH0/pQoCeuh0iUT458ogL35
 vmqnKSRxO9V4I1UAIuY/JInBXcH6MKNCARP07by0SEtbDOK+xK6iubEoG8YEGOX4DDj2OV53qW
 Hts=
X-SBRS: 2.7
X-MesageID: 19919135
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="19919135"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 5/8] x86/hvm: only translate ISA interrupts to GSIs
 in virtual timers
Date: Fri, 12 Jun 2020 17:56:37 +0200
Message-ID: <20200612155640.4101-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612155640.4101-1-roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Only call hvm_isa_irq_to_gsi for ISA interrupts, interrupts
originating from an IO APIC pin already use a GSI and don't need to be
translated.

I haven't observed any issues from this, but I think it's better to
use it correctly.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 62c87867c5..6a975fc668 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -86,7 +86,7 @@ static int pt_irq_vector(struct periodic_time *pt, enum hvm_intsrc src)
         return pt->irq;
 
     isa_irq = pt->irq;
-    gsi = hvm_isa_irq_to_gsi(isa_irq);
+    gsi = pt->source == PTSRC_isa ? hvm_isa_irq_to_gsi(isa_irq) : pt->irq;
 
     if ( src == hvm_intsrc_pic )
         return (v->domain->arch.hvm.vpic[isa_irq >> 3].irq_base
-- 
2.26.2


