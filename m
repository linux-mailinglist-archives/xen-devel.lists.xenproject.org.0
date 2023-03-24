Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2356C8819
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 23:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514469.796745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfpaX-0004wU-3v; Fri, 24 Mar 2023 22:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514469.796745; Fri, 24 Mar 2023 22:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfpaW-0004uP-Vv; Fri, 24 Mar 2023 22:08:44 +0000
Received: by outflank-mailman (input) for mailman id 514469;
 Fri, 24 Mar 2023 22:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfpaV-0004uJ-5f
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 22:08:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd72415-ca90-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 23:08:40 +0100 (CET)
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
X-Inumbo-ID: 6dd72415-ca90-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679695720;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GJUjm1x5LRvqL5EDLYrkqj21m5mZTtD0QpN/WYKinHo=;
  b=eq9LtYISNpqYExeUdfcqvcU7JSq0IuSCyr+f9zgcn2CZtorbLUcIlSTi
   mAtFV5KqKOKTPkOniU4tlWkfMIvZdouyWfUL1Pe9eOqTrsuwlH0y1AWPZ
   vKeA4FlfVzxpIoVDRFge3WfTQHiaUdHOGO8ZkvUYSpxB4BH5iLzNqGMJc
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104701282
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:05ABa6P4UPBTG6XvrR3Zl8FynXyQoLVcMsEvi/4bfWQNrUoigz0Cm
 2dLW2mFPv2JYGL3e412PNmz/R9Vv5fWytdiSAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5ABmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sVxG0VL8
 +YGFG0iVhe52/ia7ey7QMA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXSGZoNxxzI/
 Aoq+UzLHREnLt7OxACXzX2pgKzXsD/6dL0NQejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52ml6IDZ/gKYDWgsVSNaZZots8peeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwA2K3UmYCkeUzdYzOHkmt0poj+RTtxKRfvdYsLOJd3g/
 9ybhHFg2ORN05NRjP3TEUPv2Gz1+MWQJuIhzkCOBz/+sFskDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEoMtzhUJxznPO5SLwJs8w4ifIQCqWdiSfdpH0+DaJu9zmFfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9ogPUsQ7nlmnwv7HMmrpylLJJLCPBZ5v59ZagrRBg34hYvYyDjoH
 yF3bZHbkEQECbCmP0E6M+c7dDg3EJTyPriuw+Q/SwJJClQO9L0JYxMJ/Y4cRg==
IronPort-HdrOrdr: A9a23:bV1R3qnxxq2pE0NBLIM0sW4gufTpDfLr3DAbv31ZSRFFG/Fxl6
 iV7ZImPH7P6Ar5PUtKpTnuAsi9qB/nhPtICOoqTM6ftWvdyROVxehZhOOMrQEIcxeOjdK1vp
 0QF5SWZueAamRSvILW2iT9NfAKqePqzEmvv43j5kYody1RL4tHyChYJDqhOnBXYi4DP7YFfa
 DshfZvln6ueXEadMSpCmNtZYX+jtfWjo/hZRIcJzNP0njtsQ+V
X-IronPort-AV: E=Sophos;i="5.98,289,1673931600"; 
   d="scan'208";a="104701282"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/boot: Restrict directmap permissions for .text/.rodata
Date: Fri, 24 Mar 2023 22:08:24 +0000
Message-ID: <20230324220824.3279825-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

While we've been diligent to ensure that the main text/data/rodata mappings
have suitable restrictions, their aliases via the directmap were left fully
read/write.  Worse, we even had pieces of code making use of this as a
feature.

Restrict the permissions for .text/rodata, as we have no legitimate need for
writeability of these areas via the directmap alias.  Note that the
compile-time allocated pagetables do get written through their directmap
alias, so need to remain writeable.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Update comments and commit message for clarity, and over changes.

Notes:
 * The stubs are still have RX via one alias, RW via another, and these need
   to stay.  We should harden this using PKS (available on SPR and later) to
   block incidental writes.
 * Backing memory for livepatch text/rodata needs similar treatment.
 * For backporting, this patch depends on c/s e7f147bf4ac7 ("x86/crash: Drop
   manual hooking of exception_table[]") and c/s e7db635f4428 ("x86/pv-shim:
   Don't modify the hypercall table").  No compile error will occur from
   getting these dependencies wrong.
---
 xen/arch/x86/setup.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2b44a3ae26dd..b29229933d8c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1667,6 +1667,16 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         destroy_xen_mappings((unsigned long)&__2M_rwdata_end,
                              ROUNDUP((unsigned long)&__2M_rwdata_end, MB(2)));
 
+    /*
+     * Mark all of .text and .rodata as RO in the directmap - we don't want
+     * these sections writeable via any alias.  The compile-time allocated
+     * pagetables are written via their directmap alias, so data/bss needs to
+     * remain writeable.
+     */
+    modify_xen_mappings((unsigned long)__va(__pa(_start)),
+                        (unsigned long)__va(__pa(__2M_rodata_end)),
+                        PAGE_HYPERVISOR_RO);
+
     nr_pages = 0;
     for ( i = 0; i < e820.nr_map; i++ )
         if ( e820.map[i].type == E820_RAM )
-- 
2.30.2


