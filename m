Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AB3469656
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238872.413976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDjz-0004k2-1h; Mon, 06 Dec 2021 13:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238872.413976; Mon, 06 Dec 2021 13:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDjy-0004h7-UH; Mon, 06 Dec 2021 13:09:10 +0000
Received: by outflank-mailman (input) for mailman id 238872;
 Mon, 06 Dec 2021 13:09:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Xlh=QX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1muDjx-0004gj-D8
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:09:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0ab5429-5695-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 14:09:08 +0100 (CET)
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
X-Inumbo-ID: b0ab5429-5695-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638796147;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+i/cei/bpytCa2fBr5hnfAPuM5YQs1bp5y5I3yPOIm8=;
  b=c6+r+xTPGRfLezpvdZlUcgHRSMaRwiKI5b1+DOAGUsipS/8Ui6oPNZi2
   WYPcpNvRsFnqqLYsRO5GRc96QFT3g0MPKRwdfOe0EUyoT9V4LaKTVSR32
   WYEofvya9zwQUiH2PU3v0Pfj4i3K3B5u9bZ0nUd3JvTdGJKFJdnewao6z
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /Ao5kkJBxVLDmkhEpCb9lOEG5c3IvYIXm7B+N05NDvUEXi0Osu+kw3ooC7RZ7oXPXCUGh50Sgd
 W2iOCL8JVj/IrJ+1ibksei6l0h927YFNWuID/fjlBl7gZ84n8BoTQ0Ds1sC3/BcmFw5C4ZumPn
 jocbt9eFsi2vMcq1dvtKlTKCvYxt4vymlCt01TaoaM8xc5fY/VzvV1Zp4lntr0GxWyU/HofQjd
 ovkHpGgnGjcBz54+/AzJiJnnyxcaRDDtuQBY8nfA5UjbYvBmbfHSxONndu+/vUUaET4jqQbV7+
 KzZOQBJRRDxGgDH9Vxs3967B
X-SBRS: None
X-MesageID: 59298447
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2UNGxa2H0npYChuV0fbD5e92kn2cJEfYwER7XKvMYLTBsI5bpzcOz
 zZLWjjXPq6LamSkLd4nPoW/808HvZ+Dyd43HFFrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es5w7Bh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhmfZD0
 PYUjqOMRAZzOI7lis0CDh5TDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t15ofTaqCO
 KL1bxIyNj/kTiNAOm4oEcwuscirhWDUNARX/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalhg6acJzStYF1AyMkKz3yhSwGTUDRSEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/46SPbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP8D2BLwQKChRqlEGp/ZgPb1
 JTjs5LBhN3i9bnXyESwrBwlRdlEJ5+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZZbI260O
 hWN5lM5CHpv0J2CN/Ufj2WZUZtC8EQdPY69CqC8giRmPPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLa0XOTz4ieLGDJNUIJ9bWGazghcRsPnZ/V6Lq
 okHbKNnCXx3CYXDX8UeyqZLRXhiEJTxLcyeRxV/erHRLwx4NnsmDvONk7otd5Y8x/Zel/vS/
 2H7UUhdkQKtiXrCIASMS3ZidLKwAsov8SNlZXQhbQSyxnwuQYez96NDJZE5SqYqqb54xvluQ
 vhbJ8jZWqZTSi7K8ig2ZIXmqNAwbwyigA+DZnL3YDU2c5N6aRbO/9voIlnm+CUUV3Llvsoiu
 bywkAjcRMNbFQhlCc/XbtOpzk+w4idByL4jAROQL4AKKkv28YVsJyjgtdMNIpkBeUfZ2z+X9
 weKGhNE9+PDlJA4rYvSjqeeoob3T+YnRhhGH3PW5KqdPDXB+jbx2pdJVeuFcGyPVG7w/6n+N
 +xZw+ulba8ClVdO9YF9D6xq3eQ14N62/+1WyQFtHXPqaVW3C+w/finajJcX7qAdlKVEvQaWW
 16U/ogIMLqED8rpDVoNKVd3de+Ez/wVxmHf4PldzJ8WP8OrEG5riXlvAiQ=
IronPort-HdrOrdr: A9a23:BpsrTqBxJvLJV5TlHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.87,291,1631592000"; 
   d="scan'208";a="59298447"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/boot: Restrict directmap permissions for .text/.rodata
Date: Mon, 6 Dec 2021 13:08:55 +0000
Message-ID: <20211206130855.15372-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

While we've been diligent to ensure that the main text/data/rodata mappings
have suitable restrictions, their aliases via the directmap were left fully
RW.  Worse, we even had pieces of code making use of this as a feature.

Restrict the permissions, as we have no legitimate need for writeability of
these areas via the directmap alias.

Note that the pagetables and cpu0_stack do get written through their directmap
alias, so we can't just read-only the whole image.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Ever so slightly RFC, as it has only had light testing.

Notes:
 * The stubs are still have RX via one alias, RW via another, and these need
   to stay.  Hardening options include splitting the stubs so the SYSCALL ones
   can be read-only after setup, and/or expanding the stub size to 4k per CPU
   so we really can keep the writeable alias as not present when the stub
   isn't in active use.
 * Future CPUs with Protection Key Supervisor (Sapphire Rapids and later)
   would be able to inhibit writeability outside of a permitted region, and
   because the protection key is per logical thread, we woulnd't need to
   expand the stubs to 4k per CPU.
 * At the time of writing, PV Shim still makes use of .rodata's read/write
   alias in the directmap to patch the hypercall table, but that runs earlier
   on boot.  Also, there are patches out to address this.
 * For backporting, this patch depends on c/s e7f147bf4ac7 ("x86/crash: Drop
   manual hooking of exception_table[]"), and nothing would break at compile
   time if the dependency was missing.
---
 xen/arch/x86/setup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f40a9fe5d351..c8641c227d9a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1566,6 +1566,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         destroy_xen_mappings((unsigned long)&__2M_rwdata_end,
                              ROUNDUP((unsigned long)&__2M_rwdata_end, MB(2)));
 
+    /*
+     * Mark all of .text and .rodata as RO in the directmap - we don't want
+     * these sections writeable via any alias.
+     */
+    modify_xen_mappings((unsigned long)__va(__pa(_start)),
+                        (unsigned long)__va(__pa(__2M_rodata_end)),
+                        PAGE_HYPERVISOR_RO);
+
     nr_pages = 0;
     for ( i = 0; i < e820.nr_map; i++ )
         if ( e820.map[i].type == E820_RAM )
-- 
2.11.0


