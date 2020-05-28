Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB601E6434
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 16:41:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeJi9-0006cS-8z; Thu, 28 May 2020 14:40:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNTM=7K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jeJi8-0006cM-0i
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 14:40:44 +0000
X-Inumbo-ID: 318dd56a-a0f1-11ea-81bc-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 318dd56a-a0f1-11ea-81bc-bc764e2007e4;
 Thu, 28 May 2020 14:40:36 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: n0X8arZrp+V6NldKp9SgBONEnoWCNEfodvtEjriYw2SWvek747YOBU8ZTr1bEibCB3W1RbTfCE
 hUjUStG/LOStGHyfxQArWMBR2RU1P2DoYgIMP/cqoYoRuMglw34XWImAhxfWzUf56qpnh1AjaL
 Kfn9ewuEATU/dLbzSI2Mb3X7rlVE8Eg48tY1u5SZJfvDbLOYFaiNsQ6Lpjym0wRwNavybmCdNJ
 +1tAs8q9NZGR+GVK9ySDQXshjbr/405zed5LGXWBWYc5GWYbA+H8S8RkZZGBgDpLceHDs8Lp1n
 bpM=
X-SBRS: 2.7
X-MesageID: 19406330
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,445,1583211600"; d="scan'208";a="19406330"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 2/3] build32: don't discard .shstrtab in linker script
Date: Thu, 28 May 2020 16:40:22 +0200
Message-ID: <20200528144023.10814-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528144023.10814-1-roger.pau@citrix.com>
References: <20200528144023.10814-1-roger.pau@citrix.com>
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

LLVM linker doesn't support discarding .shstrtab, and complains with:

ld -melf_i386_fbsd -N -T build32.lds -o reloc.lnk reloc.o
ld: error: discarding .shstrtab section is not allowed

Add an explicit .shstrtab section to the linker script after the text
section in order to make LLVM LD happy.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/build32.lds | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds
index 97454b40ff..5bd42ee4d9 100644
--- a/xen/arch/x86/boot/build32.lds
+++ b/xen/arch/x86/boot/build32.lds
@@ -50,6 +50,11 @@ SECTIONS
         *(.got.plt)
   }
 
+  .shstrtab : {
+        /* Discarding .shstrtab is not supported by LLD (LLVM LD). */
+        *(.shstrtab)
+  }
+
   /DISCARD/ : {
         /*
          * Discard everything else, to prevent linkers from putting
-- 
2.26.2


