Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1C5FCAA0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 20:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421345.666609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oigQt-0002Xj-0F; Wed, 12 Oct 2022 18:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421345.666609; Wed, 12 Oct 2022 18:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oigQs-0002VM-Tr; Wed, 12 Oct 2022 18:26:18 +0000
Received: by outflank-mailman (input) for mailman id 421345;
 Wed, 12 Oct 2022 18:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7nFe=2N=citrix.com=prvs=277557e37=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oigQq-00020j-Tr
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 18:26:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59b6f80e-4a5b-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 20:26:14 +0200 (CEST)
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
X-Inumbo-ID: 59b6f80e-4a5b-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665599174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=A8MzLqExStAlbN29a+wsKio2UVeipAQb6TPTHKe3Ju4=;
  b=B3Q3/UB0cQM+If+L59wPyiSB15hYT9PD6mO/xKPBMvt3o8RAIHQUwgmR
   RBDZoIzgQJY6r0Ca456wwkWjSGiaXo/DuBy3qEuTsQekzLLs4AQy1mzq6
   RQYunV+3zE0faXCCh2eomRUXoDruF2LOB4EvtYxBoCQxgSzKW+0dk+yF/
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81698666
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ld4uO6Cu2vJ0JRVW/znjw5YqxClBgxIJ4kV8jS/XYbTApDJ2gTcBm
 2sZCj+DbqmPNGH3LY9xbI21/U4BsJbXyIIwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K2o4GhwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2k6IbQ83+d6JFgXy
 vAVFiEQXiijp8yplefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVmPFsNBY14t+CvnnTlKBVTqU6PpLpx6G/WpOB0+Oi0bouFJILULSlTtm2Vh
 Uv9/l78PhxAZNmZwGa70l+XouCayEsXX6pNTeblp5aGmma75mEVEgxQalK9rtGwkEv4UNVaQ
 2QY8zQjhbI//0uqSp/6RRLQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6cLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aNTQsCUoDaAo9FDQJ7ufyvbELrjLhUYM2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD327xk5JAVdoKiN2bGKuPGpxdEdMOS
 BaL0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZonwzPBXJgDG9wRFEfUQD1
 XGzK5/E4ZEyUP0P8dZLb71Fje9DKt4Wnws/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0Z5oVD79q
 o8HX/ZmPj0FD4USlAGLrtNIRb3LRFBnba3LRzt/KrbffFI7SD54VZc8A9oJIuRYokicrc+Ql
 lnVZ6OS4AOXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:Tntm6KndI+eQmoae1kcQQn6La8bpDfIu3DAbv31ZSRFFG/Fxl6
 iV8sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNGftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAs9D4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="81698666"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: [PATCH 1/2] tools/ocaml/xc: Fix code legibility in stub_xc_domain_create()
Date: Wed, 12 Oct 2022 19:25:51 +0100
Message-ID: <20221012182552.26866-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221012182552.26866-1-andrew.cooper3@citrix.com>
References: <20221012182552.26866-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Reposition the defines to match the outer style and to make the logic
half-legible.

No functional change.

Fixes: 0570d7f276dd ("x86/msr: introduce an option for compatible MSR behavior selection")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 19335bdf4572..fe9c00ce008a 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -232,22 +232,20 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 
         /* Mnemonics for the named fields inside xen_x86_arch_domainconfig */
 #define VAL_EMUL_FLAGS          Field(arch_domconfig, 0)
+#define VAL_MISC_FLAGS          Field(arch_domconfig, 1)
 
 		cfg.arch.emulation_flags = ocaml_list_to_c_bitmap
 			/* ! x86_arch_emulation_flags X86_EMU_ none */
 			/* ! XEN_X86_EMU_ XEN_X86_EMU_ALL all */
 			(VAL_EMUL_FLAGS);
 
-#undef VAL_EMUL_FLAGS
-
-#define VAL_MISC_FLAGS          Field(arch_domconfig, 1)
-
 		cfg.arch.misc_flags = ocaml_list_to_c_bitmap
 			/* ! x86_arch_misc_flags X86_ none */
 			/* ! XEN_X86_ XEN_X86_MISC_FLAGS_MAX max */
 			(VAL_MISC_FLAGS);
 
 #undef VAL_MISC_FLAGS
+#undef VAL_EMUL_FLAGS
 
 #else
 		caml_failwith("Unhandled: x86");
-- 
2.11.0


