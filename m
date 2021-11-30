Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D914630A1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 11:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234954.407714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00f-0008SC-0L; Tue, 30 Nov 2021 10:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234954.407714; Tue, 30 Nov 2021 10:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00e-0008I1-LS; Tue, 30 Nov 2021 10:05:12 +0000
Received: by outflank-mailman (input) for mailman id 234954;
 Tue, 30 Nov 2021 10:05:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms00c-0007QY-4T
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 10:05:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff37db96-51c4-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 11:05:08 +0100 (CET)
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
X-Inumbo-ID: ff37db96-51c4-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638266707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k17lutUB0RZWsOBqxvuCYcxmqhsCMjPR6N6SZca7JCE=;
  b=DnSbr+YXwO3DtjLgfkt39veuXJXUO6vw1m+I6ZNfKJen0rK1PtOisRDx
   wj0hMocxLgi7p7NbVbPVGBToZ82acRKSoJhVKf7TFjak4RsvpTElXsVcH
   JCpqbG3QEZ/U5ONQEG2XacajTVD25iZxRX3avxRYSjOJAtPUgENJUUZMK
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yAmE1mBS7t9rjRu6RiFSRZc9y3GCgG+BrdZV3WykPbv10DjlesEVpbIWTjsthEDnsSnMS0BPq+
 HgsgnTe5GZnGRy6IYrUPryuByTuTYsoU6ZycrUhS10KLV1rhQQNINEtgkh3Jzn8Fh3eySYTwhw
 J5XsJ8qu/XBIeNOVZR/i9fLP29mLQF6AAx2z8Oc1htRvytP5ZCoWqxswR39107uU9JIYWL99az
 GMzQz4Jy7RjQnwTpC8nrYrnkoCNuLWKH61OFv17R+vRHe5bapNbHtPdVpRlAOJo+rn/WcljCdX
 c0P9GP760IJ24eFPP7biY6aj
X-SBRS: 5.1
X-MesageID: 58889162
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LUyVaq5QhwnOkO5lJBXThgxRtPXAchMFZxGqfqrLsTDasY5as4F+v
 jZKDGuOPPuIMTTwfI8ibY+zoRsHuJPQz9NjTFNvrykwHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2dYw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 ZJMsrDtWzUSHKDysukvS0FcOAhYIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTTaaON
 pNHM1KDajz5TANoPEdKUa4zmcGomVzeSAAHtAqK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc/MXEuoWtRO/8YjZ3SyUNHBcShVoTsNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D4gbQ4xawZRGp8crVnl
 CNf8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxcza59fImGzP
 BW7VeZtCHl7ZyDCgUhfOd/ZNijX5fK4SYSNug78MLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI+cElJNhMb6epJl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:5YdaVqsiPsTp15Rnpfo9zQFu7skDTNV00zEX/kB9WHVpmszxra
 GTdZMgpGfJYVcqKQgdcL+7Scq9qB/nmqKdpLNhWYtKPzOW3ldATrsSj7cKqgeIc0aVm4JgPO
 VbAs9D4bXLfCNHZK3BgDVQfexP/DD+ytHMudvj
X-IronPort-AV: E=Sophos;i="5.87,275,1631592000"; 
   d="scan'208";a="58889162"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/8] x86/boot: Better describe the pagetable relocation loops
Date: Tue, 30 Nov 2021 10:04:39 +0000
Message-ID: <20211130100445.31156-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211130100445.31156-1-andrew.cooper3@citrix.com>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The first loop relocates all reachable non-leaf entries in idle_pg_table[],
which includes l2_xenmap[511]'s reference to l1_fixmap_x[].

The second loop relocates only leaf mappings in l2_xenmap[], so update the
skip condition to be opposite to the first loop.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/setup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6f241048425c..495b4b7d51fb 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1245,7 +1245,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             barrier();
             move_memory(e, XEN_IMG_OFFSET, _end - _start, 1);
 
-            /* Walk initial pagetables, relocating page directory entries. */
+            /* Walk idle_pg_table, relocating non-leaf entries. */
             pl4e = __va(__pa(idle_pg_table));
             for ( i = 0 ; i < L4_PAGETABLE_ENTRIES; i++, pl4e++ )
             {
@@ -1277,18 +1277,18 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                 }
             }
 
-            /* The only data mappings to be relocated are in the Xen area. */
-            pl2e = __va(__pa(l2_xenmap));
-
             BUG_ON(using_2M_mapping() &&
                    l2_table_offset((unsigned long)_erodata) ==
                    l2_table_offset((unsigned long)_stext));
 
+            /* Walk l2_xenmap[], relocating 2M superpage leaves. */
+            pl2e = __va(__pa(l2_xenmap));
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
             {
                 unsigned int flags;
 
                 if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) ||
+                     !(l2e_get_flags(*pl2e) & _PAGE_PSE) ||
                      (l2e_get_pfn(*pl2e) >= pte_update_limit) )
                     continue;
 
-- 
2.11.0


