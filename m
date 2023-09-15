Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2BE7A2838
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 22:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603362.940350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYW-0001bM-LL; Fri, 15 Sep 2023 20:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603362.940350; Fri, 15 Sep 2023 20:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYW-0001XY-FP; Fri, 15 Sep 2023 20:36:48 +0000
Received: by outflank-mailman (input) for mailman id 603362;
 Fri, 15 Sep 2023 20:36:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhFYU-0001T8-QQ
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 20:36:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96400495-5407-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 22:36:46 +0200 (CEST)
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
X-Inumbo-ID: 96400495-5407-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694810205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dnP+oePB0vRmA7Ftd/dfzOPN8MOvJT2QivCpHSwftUo=;
  b=NnwB3GwOnO8SvjmeYphhRsOJSoHZLkBM2bPEUwVlcZIS4F18H6udfgJ7
   WGzTRVkdU6Gcv42pW4gZclg6h94DLQAfjU7ljhZTZCelyTzLhTW4NV5Q6
   hxMWaYRKSR4t+bwtDP73V+7X9S8cjhMS7sU12MiCYEr8MmB5IrX391jSR
   o=;
X-CSE-ConnectionGUID: eus45eGnS1utRCA1wDu4og==
X-CSE-MsgGUID: Tom/6qoBRv24WmLJKJR2AQ==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 121464506
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:CyQJ2ao/F8zo5JUaNgPskv6+nh9eBmIuZRIvgKrLsJaIsI4StFCzt
 garIBmFPfaCZWSke90lOY3j9E1XvsOByYUwHAY+qSBmESoSopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5wePziRNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAD0QdUzeis2w++umVtNHr508ANS3O4xK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jucpjinXkxCarRzzxK59Xfr2PbItxnlAt4tEZma1dxQ2nSqkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBLT5utrqVD3GU8LjSrimaNi0cLGtEbigBJTbp+PG6/tt11EiWCI8+Tujs1Iad9SzML
 y6ioTUl2+geosgwjrinx3vu2i2Au8TOQVtgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9jhYyjJ5fK6fTgAahwzRoMUCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoFrtNieV0ln1umDq7qXXHI/KPi+L2iJm9E+xtDbdzRrphsPPsTPv9r
 L6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5U/SwJ3GSI/QDtJI6aIkdscl3lNw/w9ehHgo
 ivsBSe1CTPX2RX6FOl9Qis6Mem3AMcu8SpT0O5FFQ/A5kXPqL2HtM83H6bbt5F+nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:JEtqhKg8ylCL99lmw4/nszRHU3BQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: 9a23:6+ZrEW+WPlrdylHpoqiVv0MJAZx4f1Lb9y7NP3WTID92ZKDJTlDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ABSAEngwHvJFWDn6KbdPFtN7oKgyaqJipDQdTiJI?=
 =?us-ascii?q?sgdfeaRN1HxW+rg7ta7Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,150,1688443200"; 
   d="scan'208";a="121464506"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 3/7] x86/pv: Fix the determiniation of whether to inject #DB
Date: Fri, 15 Sep 2023 21:36:24 +0100
Message-ID: <20230915203628.837732-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915203628.837732-1-andrew.cooper3@citrix.com>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We long ago fixed the emulator to not inject exceptions behind our back.
Therefore, assert that that a PV event (including interrupts, because that
would be buggy too) isn't pending, rather than skipping the #DB injection if
one is.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>

v2:
 * Drop X86EMUL_DONE adjustment.
---
 xen/arch/x86/pv/emul-priv-op.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 142bc4818cb5..0d9f84f458ba 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1358,14 +1358,17 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
     switch ( rc )
     {
     case X86EMUL_OKAY:
+        ASSERT(!curr->arch.pv.trap_bounce.flags);
+
         if ( ctxt.ctxt.retire.singlestep )
             ctxt.bpmatch |= DR_STEP;
+
         if ( ctxt.bpmatch )
         {
             curr->arch.dr6 |= ctxt.bpmatch | DR_STATUS_RESERVED_ONE;
-            if ( !(curr->arch.pv.trap_bounce.flags & TBF_EXCEPTION) )
-                pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
         }
+
         /* fall through */
     case X86EMUL_RETRY:
         return EXCRET_fault_fixed;
-- 
2.30.2


