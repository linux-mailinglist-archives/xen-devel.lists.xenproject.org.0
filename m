Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA63ED302
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 13:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167276.305335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFaet-0003i0-Jx; Mon, 16 Aug 2021 11:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167276.305335; Mon, 16 Aug 2021 11:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFaet-0003fc-FB; Mon, 16 Aug 2021 11:19:59 +0000
Received: by outflank-mailman (input) for mailman id 167276;
 Mon, 16 Aug 2021 11:19:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJmv=NH=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mFaes-00035f-Bu
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 11:19:58 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0f44f5c-fe83-11eb-a455-12813bfff9fa;
 Mon, 16 Aug 2021 11:19:53 +0000 (UTC)
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
X-Inumbo-ID: e0f44f5c-fe83-11eb-a455-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629112793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T9jifUsBPMFYoxfOQRqxjgyngUYneVp/G9jmw1xPbXY=;
  b=Q9NoCGfocjnpoSJWbOjnudKqoQQM2SQR1QnDlecUl/7NhIhmU1KbVDT3
   1oh7vc9+Xd6vWhMInodsgcpBGyjQXfilqPhH+Uwx/JgdOpFZWOXqnOpOa
   I9decznwK1l9Awr6ee6FMXM14ETY7To1rThuX/+OYL0f3htv1tlpde34Y
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: t5DE/kdH4a0O/Lrh5Q5BHnyA2jQKni/xQVWXq/I/jFmvNm+/L7gRSgEP6ARpcIywZRjSZY9TBR
 gJ3fZ4IxjcYmW/x2hu98e45WoEbKPm3OmD29cgEWbBY8WxuYGa3eeP9nymi8oTucsmjbm/ElNI
 E5vrcE2f3S5CdrGMS+lT4fzynwVstXhDb9IqFWSSlXg388g7pGezdxEsu9Buw6tIKoVhOOFIqJ
 q7gnDSj+W4beyMztxOlyRFM2t27f8cfMWZU92Zd2yfX7OGKI8x1doE5xVCrX+vEZBR4Zw/UZKP
 Qv90XSMRiRn5aRjZAEbfuvr/
X-SBRS: 5.1
X-MesageID: 52241876
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/ZxsL6Oxu3N8bcBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.84,324,1620705600"; 
   d="scan'208";a="52241876"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 2/2] x86/pv: Provide more helpful error when CONFIG_PV32 is absent
Date: Mon, 16 Aug 2021 12:19:27 +0100
Message-ID: <20210816111927.16913-3-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210816111927.16913-1-jane.malalane@citrix.com>
References: <20210816111927.16913-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently, when booting a 32bit dom0 kernel, the message isn't very
helpful:

  (XEN)  Xen  kernel: 64-bit, lsb
  (XEN)  Dom0 kernel: 32-bit, PAE, lsb, paddr 0x100000 -> 0x112000
  (XEN) Mismatch between Xen and DOM0 kernel
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Could not construct domain 0
  (XEN) ****************************************

With this adjustment, it now looks like this:

  (XEN)  Xen  kernel: 64-bit, lsb
  (XEN) Found 32-bit PV kernel, but CONFIG_PV32 missing
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Could not construct domain 0
  (XEN) ****************************************

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * switch to EOPNOTSUPP
---
 xen/arch/x86/pv/dom0_build.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 8712baccc1..d5a1a6a4e2 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -362,9 +362,9 @@ int __init dom0_construct_pv(struct domain *d,
     compatible = false;
     machine = elf_uval(&elf, elf.ehdr, e_machine);
 
-#ifdef CONFIG_PV32
     if ( elf_32bit(&elf) )
     {
+#ifdef CONFIG_PV32
         if ( parms.pae == XEN_PAE_BIMODAL )
             parms.pae = XEN_PAE_EXTCR3;
         if ( parms.pae && machine == EM_386 )
@@ -377,8 +377,11 @@ int __init dom0_construct_pv(struct domain *d,
 
             compatible = true;
         }
-    }
+#else
+        printk("Found 32-bit PV kernel, but CONFIG_PV32 missing\n");
+        return -EOPNOTSUPP;
 #endif
+    }
 
     compat = is_pv_32bit_domain(d);
 
-- 
2.11.0


