Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EE823CABA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 14:51:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3ItH-0003IU-4P; Wed, 05 Aug 2020 12:51:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBnt=BP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3ItG-0003IN-71
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 12:51:30 +0000
X-Inumbo-ID: f6f37747-bb4b-4353-b544-2153e2890fba
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6f37747-bb4b-4353-b544-2153e2890fba;
 Wed, 05 Aug 2020 12:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596631888;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DqXQeOCb8wl+MEQ6DYesZt1pzQQgZ5aV7kpKWqbWJ5o=;
 b=H6sz06H2dPEL86H4zFKqZYCmroR8zmFIr7RcZg+E2b6Yg7iX0N1/HOIP
 0bbAKEyLlrRDZSfXVLGh2V7uqPsyrt47pbtt0nB6NTTiqnu5ETtnpzmjm
 PqwGrnOoRAWiPVoEQymfAn2QB331yUaaF57SNuUgW71Dl456+PSY+maqq c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: H0IOtf+NmNNXtIb3vBP89mAfdirC7zbuDhNi6MaeCYBH7gNqSllvQWlWPDnHQfXv7QOxEAJPyE
 vqJDxUprDscE65Vj6snxU0t57kqjk2oJ1M0yuy3KDnHD04TyvydfNmf1H+SphV9xHPKAyrZism
 9PK/9kl6k897Kz/WK2/qAX0s3Cn1EsLumCMdengXLaGHlK5qPkJ3eXtovNruFsqiVXpgGLp/ms
 tlOw/8QKUtNutCdWlFlwPP8RT14wVjnAfoVfRLfqRoyTYVq2ags30+95hytNMAEYu+0/bTSKcB
 VhA=
X-SBRS: 3.7
X-MesageID: 24248781
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,436,1589256000"; d="scan'208";a="24248781"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/ioapic: Fix fixmap error path logic in
 ioapic_init_mappings()
Date: Wed, 5 Aug 2020 13:51:09 +0100
Message-ID: <20200805125109.7348-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In the case that bad_ioapic_register() fails, the current position of idx++
means that clear_fixmap(idx) will be called with the wrong index, and not
clean up the mapping just created.

Increment idx as part of the loop, rather than midway through the loop body.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/io_apic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 878ee5192d..e66fa99ec7 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2543,7 +2543,7 @@ static void __init ioapic_init_mappings(void)
 
     nr_irqs_gsi = 0;
 
-    for ( i = 0; i < nr_ioapics; i++ )
+    for ( i = 0; i < nr_ioapics; i++, idx++ )
     {
         union IO_APIC_reg_01 reg_01;
         paddr_t ioapic_phys = mp_ioapics[i].mpc_apicaddr;
@@ -2560,7 +2560,6 @@ static void __init ioapic_init_mappings(void)
         set_fixmap_nocache(idx, ioapic_phys);
         apic_printk(APIC_VERBOSE, "mapped IOAPIC to %08Lx (%08lx)\n",
                     __fix_to_virt(idx), ioapic_phys);
-        idx++;
 
         if ( bad_ioapic_register(i) )
         {
-- 
2.11.0


