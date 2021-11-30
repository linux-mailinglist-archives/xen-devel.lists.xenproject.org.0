Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2EF4630A3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 11:05:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234951.407675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00c-0007YL-Cp; Tue, 30 Nov 2021 10:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234951.407675; Tue, 30 Nov 2021 10:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00c-0007Sl-6a; Tue, 30 Nov 2021 10:05:10 +0000
Received: by outflank-mailman (input) for mailman id 234951;
 Tue, 30 Nov 2021 10:05:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms00a-0007QZ-G2
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 10:05:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd497a53-51c4-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 11:05:06 +0100 (CET)
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
X-Inumbo-ID: fd497a53-51c4-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638266706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UmrIciFLECFu2qgzBROqeWeJVWmkLeHOoIn8Mew+k14=;
  b=WCH6Hn2D03fXLMAJDmYCNMdwWXgjRhAO7mC/HV/7HUoQoiD+ccTJyjCG
   2cA60CSOYg9Mc362esy05hXmHeoto3Ik7KvyHqGqM9feuYe/iIHhE48+E
   ZmWhhiwhvo+sUWMftgLXCqRArOpFoLLVy7yppy+Ao0cgZPxQHxU1ZpBhP
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: DwQIvjSLadEzVLvulfIxfuWOR8aAz4X9R9CxKpVmKwmCP/04mPU32NTOgnzcfe3mGOrgMb9WUd
 xg6RvQAF1AFnjcWZxuGsWnUNtwm8UCzVQJEB+5CuYSoNLGut7H316dWNmMxKyy6OpMwLPbF0IQ
 6Em5oiKGfTKh6xVmMZgbuzfemGyqw6w1trC7uHmF3wTgBlFc9f+8U4KbplyOJwtTy3IuE/x0wT
 DhVjkmMBLdO1CYASYs4MCs5oqYN9UKUp6GalT/hI3k11f+Aw6qSRg5HP2aAN0uKPcS9+BLy5i7
 /tXMuejKmx5daOZj5LNrdYO1
X-SBRS: 5.1
X-MesageID: 59281586
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lZNkkK0T+DRb2KgHKPbD5R52kn2cJEfYwER7XKvMYLTBsI5bpzVVz
 zQaCmyDaK2KYTD0eI8gaN6z8x8FusWGz9NqGQFkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wLZh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhvf8g6
 e5fhYWKEg4mIpDCoLsdVkhzKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t15oeRKuOO
 aL1bxJAVCucXj0XPGwcUpIdmL6TjEm4eSdX/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaljwzCvtrAd0j0lqExbbp7T7GBm1VZQcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/46SPbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL1D2BLwQKChRqlEGp/ZgLa1
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOu2EkfR4yaZheJWWBj
 KrvVeV5v8Q70JyCN/IfXm5MI55ykfiI+SrNCJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DLejP3KJqNFLdjjn7xETXPjLliCeTcbbSiIOJY3rI6S5LWoJd9M3kqJLuP3P+
 33hCEZUxECm3S/MKBmQa2AlY7TqBM4toXU+NC0qHFCpx3l8Ptr/sPZBL8M6Les96ehu7f9oV
 P1ZKc+ONetCF2bc8DMHYJij8IE7LEa3hRiDNjaOaSQke8IyXBTA/9LpJ1O99CQHAietm9E5p
 rmsilHSTZYZHlwwB8fKcvO/iVi2uCFFyu51WkLJJPhVeVntr9c2e3Cg0KdvLphVexvZxzac2
 wKHOjsipLHA890v7d3EpaGYtIP1QeFwKVVXQjvA5rGsOCiEomf6md1cUPyFdCz2XX/v/Pnwf
 v1cyvzxPaFVnFtOtIYgQb9nwbhnuonqrr5eiA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arXR3P4ZrTDe8PApLRio/yRw5reGDR1fMhTkZPax91ep3FfJG
 dschfM=
IronPort-HdrOrdr: A9a23:7iwPBKwx6EUp4DXk4xAZKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.87,275,1631592000"; 
   d="scan'208";a="59281586"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/8] x86/boot: Drop incorrect mapping at l2_xenmap[0]
Date: Tue, 30 Nov 2021 10:04:38 +0000
Message-ID: <20211130100445.31156-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211130100445.31156-1-andrew.cooper3@citrix.com>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It has been 4 years since the default load address changed from 1M to 2M, and
_stext ceased residing in l2_xenmap[0].  We should not be inserting an unused
mapping.

To ensure we don't create mappings accidentally, loop from 0 and obey
_PAGE_PRESENT on all entries.

Fixes: 7ed93f3a0dff ("x86: change default load address from 1 MiB to 2 MiB")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Previously posted on its own.
---
 xen/arch/x86/setup.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index da47cdea14a1..6f241048425c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1279,16 +1279,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
             /* The only data mappings to be relocated are in the Xen area. */
             pl2e = __va(__pa(l2_xenmap));
-            /*
-             * Undo the temporary-hooking of the l1_directmap.  __2M_text_start
-             * is contained in this PTE.
-             */
+
             BUG_ON(using_2M_mapping() &&
                    l2_table_offset((unsigned long)_erodata) ==
                    l2_table_offset((unsigned long)_stext));
-            *pl2e++ = l2e_from_pfn(xen_phys_start >> PAGE_SHIFT,
-                                   PAGE_HYPERVISOR_RX | _PAGE_PSE);
-            for ( i = 1; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
+
+            for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
             {
                 unsigned int flags;
 
-- 
2.11.0


