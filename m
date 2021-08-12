Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C503E3EA402
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 13:49:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166264.303600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE9D0-00069w-NE; Thu, 12 Aug 2021 11:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166264.303600; Thu, 12 Aug 2021 11:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mE9D0-00067j-KC; Thu, 12 Aug 2021 11:49:14 +0000
Received: by outflank-mailman (input) for mailman id 166264;
 Thu, 12 Aug 2021 11:49:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyNM=ND=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mE9Cz-00067d-6l
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 11:49:13 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f33599-53e2-4d6c-9d50-45a9279917f1;
 Thu, 12 Aug 2021 11:49:12 +0000 (UTC)
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
X-Inumbo-ID: e7f33599-53e2-4d6c-9d50-45a9279917f1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628768951;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CL3znfpWELLv4litjeLtI8c/M9lffSXcm1hEov0YUxw=;
  b=PW5I+1Q79QPnu8c5lCFBCNk5RC0B4uXQmSbC93UZxtdOSKCcB4xDHFb3
   +C6PviVYz/k7HFcCxmNUv5ch0LtgVCoGqcYptSWeBQnr+rqfiKGvYkavF
   JLY7Cn/XJUF7jfGRj1RjFLrAqn36gQzdGf//dZGvENLpqgTK25K2q/145
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: R27mI2Eir9g7r4EgxXd8icAcU6DDlliLE5l86UHKaeY+w/LCTcNnPaTAgqlMvPZ2pvvg/L+jtX
 RzzMkb89c4tcFalCDJ03rvJebHGqsO01leWKSsmzcBzoxDbnWeBLPZLnqZBGK3De1eEvgqh6CP
 UwjVoPRh1wYcV6daVGVsfhjt7CRvLXktlSKGS9mvTaQN+yfz5MZotcQdi8ev0vRGmdn+IP8i5P
 sFAvU/TrzfgjpEl3CZH3kSCfmVrfeO2rXhaxbrf9fjW0ptpT6P4f4bFqg43Wze7HIE0bSTsDli
 QnZxwkXEZCeaw0iovqt/kmBS
X-SBRS: 5.1
X-MesageID: 50296498
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LGD9Gq0TjgIuHByJ3XsUyAqjBLwkLtp133Aq2lEZdPRUGvb4qy
 nIpoV86faUskd3ZJhOo6HiBEDtexzhHP1OkO0s1NWZLWvbUQKTRekIh+aP/9SJIVyGygc378
 ddmsZFZuEYdWIK6PrH3A==
X-IronPort-AV: E=Sophos;i="5.84,315,1620705600"; 
   d="scan'208";a="50296498"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/pv: Provide more helpful error when CONFIG_PV32 is absent
Date: Thu, 12 Aug 2021 12:48:57 +0100
Message-ID: <20210812114857.20971-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
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
---
 xen/arch/x86/pv/dom0_build.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index af47615b22..80e6c6e35b 100644
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
@@ -377,8 +377,12 @@ int __init dom0_construct_pv(struct domain *d,
 
             compatible = true;
         }
-    }
+#else
+        printk("Found 32-bit PV kernel, but CONFIG_PV32 missing\n");
+        rc = -ENODEV;
+        goto out;
 #endif
+    }
 
     compat = is_pv_32bit_domain(d);
 
-- 
2.11.0


