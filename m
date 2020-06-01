Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCC31EA55F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:54:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkte-0002HF-3X; Mon, 01 Jun 2020 13:54:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ele=7O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jfktc-0002Gy-BA
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:54:32 +0000
X-Inumbo-ID: 69163ce0-a40f-11ea-ab1d-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69163ce0-a40f-11ea-ab1d-12813bfff9fa;
 Mon, 01 Jun 2020 13:54:28 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sVIGuYT6wuHcAonyZ38W2nycDKp7UJw344QeU+pC4GVEpCF6iMHC2c3+fzesUdvrOvHW5waw1l
 14tRczf9UcUAdiWTz1aTwvKden+IEVCntbDPMu75Nze0dXDG5A/OEDiA03NwboGx3+tgWSmyw4
 452MGiLWj33XCMnplr+gb6bscf65+W1G1VP0aoNyI3svWOpnNIDKuGW/NZl4//YFsFyfiABiE1
 c6SpcODi54eY3TV8+oKP1fq5vI/MrJzun9gooG+7qyb9Olyjh4Zo79WScNBr6Uj1/AD3cq6Zyq
 jpw=
X-SBRS: 2.7
X-MesageID: 19215690
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,461,1583211600"; d="scan'208";a="19215690"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 2/2] build32: don't discard .shstrtab in linker script
Date: Mon, 1 Jun 2020 15:53:25 +0200
Message-ID: <20200601135325.34156-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200601135325.34156-1-roger.pau@citrix.com>
References: <20200601135325.34156-1-roger.pau@citrix.com>
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

LLVM linker doesn't support discarding .shstrtab, and complains with:

ld -melf_i386_fbsd -N -T build32.lds -o reloc.lnk reloc.o
ld: error: discarding .shstrtab section is not allowed

Add an explicit .shstrtab, .strtab and .symtab sections to the linker
script after the text section in order to make LLVM LD happy and match
the behavior of GNU LD.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
 - Also add .strtab and .symtab sections to match GNU behavior.
---
 xen/arch/x86/boot/build32.lds | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds
index 97454b40ff..1ab9418793 100644
--- a/xen/arch/x86/boot/build32.lds
+++ b/xen/arch/x86/boot/build32.lds
@@ -50,6 +50,20 @@ SECTIONS
         *(.got.plt)
   }
 
+  /*
+   * Discarding .shstrtab is not supported by LLD (LLVM LD) and will trigger an
+   * error. Also keep the rest of the control sections to match GNU LD behavior.
+   */
+  .shstrtab : {
+        *(.shstrtab)
+  }
+  .strtab : {
+        *(.strtab)
+  }
+  .symtab : {
+        *(.symtab)
+  }
+
   /DISCARD/ : {
         /*
          * Discard everything else, to prevent linkers from putting
-- 
2.26.2


