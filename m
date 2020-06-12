Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3471F7B35
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:57:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjm3O-0006K5-FK; Fri, 12 Jun 2020 15:57:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h37=7Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jjm3N-0006K0-4q
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:57:13 +0000
X-Inumbo-ID: 60389534-acc5-11ea-b5e3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60389534-acc5-11ea-b5e3-12813bfff9fa;
 Fri, 12 Jun 2020 15:57:12 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tJYIR2S3Ocd5uXt8pWAoShrj2UMDT+WR9oxPAsF9CJqVNZYh0HUpjT7joDzDm7OYui4jLzBkIr
 5i/INQSZZUgypeKxultSdhU11yxeTufQkknSiDM8gRz0szZ4pLgdA/v1SqCCgOwEer3uslnldD
 cKbpI2joK5PNzfo2XsCh1ndozWh2TtA+sa6dVcqVkaMxrMQYCAWrOQntbkwGoEOe1goRKcu19Z
 YCT6b2yJtr/jCEUIBEK3H+yQZ3+X/1Xoe31c6xUGRIeUZkrxQPXyqESLrG6ywIwmQEuCOhjz4W
 Cis=
X-SBRS: 2.7
X-MesageID: 20213493
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20213493"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 1/8] x86/hvm: fix vIO-APIC build without
 IRQ0_SPECIAL_ROUTING
Date: Fri, 12 Jun 2020 17:56:33 +0200
Message-ID: <20200612155640.4101-2-roger.pau@citrix.com>
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

pit_channel0_enabled needs to be guarded with IRQ0_SPECIAL_ROUTING
since it's only used when the special handling of ISA IRQ 0 is enabled.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vioapic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index b87facb0e0..bd41036137 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -391,10 +391,12 @@ static void ioapic_inj_irq(
     vlapic_set_irq(target, vector, trig_mode);
 }
 
+#ifdef IRQ0_SPECIAL_ROUTING
 static inline int pit_channel0_enabled(void)
 {
     return pt_active(&current->domain->arch.vpit.pt0);
 }
+#endif
 
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 {
-- 
2.26.2


