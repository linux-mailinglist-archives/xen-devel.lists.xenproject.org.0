Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0AD4630AA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 11:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234984.407746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms02a-0003Fn-Jb; Tue, 30 Nov 2021 10:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234984.407746; Tue, 30 Nov 2021 10:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms02a-0003Dv-Fm; Tue, 30 Nov 2021 10:07:12 +0000
Received: by outflank-mailman (input) for mailman id 234984;
 Tue, 30 Nov 2021 10:07:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms010-0007QZ-0D
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 10:05:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cf75c0e-51c5-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 11:05:32 +0100 (CET)
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
X-Inumbo-ID: 0cf75c0e-51c5-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638266732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GLNFdCsQo1lgG4rFh7qYYZT9z5k1wotugxCu0CDIj2s=;
  b=au9ftoYXWPShCl21mh2jFu9YImyBLso6I3S2cwg3PbAbiYbKOJFWxkgV
   n2KTfqL2lJ9sWDc+Lmc0eNdt955lz3Gi8+7lI9YJJPJQQ2MGGMLFv4Xl8
   pMjxwb9/Qjssk6/NtRz0YkVH6WNn22ohOjzF26DDCGexuzmdcwQEsbWRJ
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WGrmbQzjO3MmuKrT0AMqwfj83nx9+CdYXBIbqgbe5G9McsoLsuhJ+vYTDxsQ7U0x1dB53n6jBy
 RT+44sToPcTG+G9KwABZSsa2SojLVPVZN55ele5RX6EyiLqg6T8l3apV44dBfbTVHiLtMdbucN
 Viz25uBp8d5mz0dKkOzZagx8E45pvJuuNKKVHfIl1nClWAT2FvzCz22qnjbFL9+1EGYL/mM0YF
 EXH43GwPGLLHp03h6WTnpfJRF5q9lNlyVdAIuZSHHEFRXprttJnqp6u0zfIkXapLXmDwNrnNWb
 f3cUgc6H37p7vf3+z58ZJ8SZ
X-SBRS: 5.1
X-MesageID: 58910850
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hm929aCI0l5plBVW/+Tkw5YqxClBgxIJ4kV8jS/XYbTApD5w1z1Wy
 WEZCmjVOquPMGL3eYxxPdixo0IPsJXXx9E1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540ko7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/px6Zlo5oi
 +93q8aMGBcWG+7+oaNMekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjGZp3pATRZ4yY
 eImQ2d0Uw7dRyFVGWsxGLw7p9/3nCjGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFKvrhdCQplqKfNg1FCd9Y+X0T/eV0FRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8pDGJGT9bxgbQ+0RqmBN3CJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9JtAKuWglfxkzbpxsldrVj
 Kn74lg5CHh7ZibCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil08CDbagO3aPqub+7zkidBAGOHw/kOQPHsbrH+asMDpJ5yb5zexzdop7sb5Sk+uUr
 HixVlUBkAj0hGHdKBXMYXdmMeu9UZF6pHM9HCotIVf3hCRzPdfxtP8SJ8ktYL0q1O1/1vooH
 fMLTNqNX6ZUQTPd9jVDMZSk9N5+dA6mjB6lNja+ZGRtZIZpQgHEo4e2fgbm+CQUIDCwsM8y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg6Zucc8WKBjFyj+L7
 CqsAE8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYwq2uMPADm1oW4YNwH6wykPA77trr4bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFt3Z+uO4vgYhz3O4KlnO079/iJ2oOKKXEg608NgU8CBwG+Z6L8Y/
 No=
IronPort-HdrOrdr: A9a23:nkvmQatjFWvrgaJba5S4Sd9s7skDTNV00zEX/kB9WHVpmszxra
 GTdZMgpGfJYVcqKQgdcL+7Scq9qB/nmqKdpLNhWYtKPzOW3ldATrsSj7cKqgeIc0aVm4JgPO
 VbAs9D4bXLfCNHZK3BgDVQfexP/DD+ytHMudvj
X-IronPort-AV: E=Sophos;i="5.87,275,1631592000"; 
   d="scan'208";a="58910850"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 6/8] x86/boot: Adjust .text/.rodata/etc permissions in one place
Date: Tue, 30 Nov 2021 10:04:43 +0000
Message-ID: <20211130100445.31156-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211130100445.31156-1-andrew.cooper3@citrix.com>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

At the moment, we have two locations selecting restricted permissions, not
very far apart on boot, dependent on opposite answers from using_2M_mapping().
The later location however can shatter superpages if needed, while the former
cannot.

Collect together all the permission adjustments at the slightly later point in
boot, as we're may need to shatter a superpage to support __ro_after_init.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/setup.c | 74 ++++++++++++----------------------------------------
 1 file changed, 16 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 0e0e706404a3..8329263430ed 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1281,55 +1281,16 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                 }
             }
 
-            BUG_ON(using_2M_mapping() &&
-                   l2_table_offset((unsigned long)_erodata) ==
-                   l2_table_offset((unsigned long)_stext));
-
             /* Walk l2_xenmap[], relocating 2M superpage leaves. */
             pl2e = __va(__pa(l2_xenmap));
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
             {
-                unsigned int flags;
-
                 if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) ||
                      !(l2e_get_flags(*pl2e) & _PAGE_PSE) ||
                      (l2e_get_pfn(*pl2e) >= pte_update_limit) )
                     continue;
 
-                if ( !using_2M_mapping() )
-                {
-                    *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) +
-                                            xen_phys_start);
-                    continue;
-                }
-
-                if ( i < l2_table_offset((unsigned long)&__2M_text_end) )
-                {
-                    flags = PAGE_HYPERVISOR_RX | _PAGE_PSE;
-                }
-                else if ( i >= l2_table_offset((unsigned long)&__2M_rodata_start) &&
-                          i <  l2_table_offset((unsigned long)&__2M_rodata_end) )
-                {
-                    flags = PAGE_HYPERVISOR_RO | _PAGE_PSE;
-                }
-                else if ( i >= l2_table_offset((unsigned long)&__2M_init_start) &&
-                          i <  l2_table_offset((unsigned long)&__2M_init_end) )
-                {
-                    flags = PAGE_HYPERVISOR_RWX | _PAGE_PSE;
-                }
-                else if ( (i >= l2_table_offset((unsigned long)&__2M_rwdata_start) &&
-                           i <  l2_table_offset((unsigned long)&__2M_rwdata_end)) )
-                {
-                    flags = PAGE_HYPERVISOR_RW | _PAGE_PSE;
-                }
-                else
-                {
-                    *pl2e = l2e_empty();
-                    continue;
-                }
-
-                *pl2e = l2e_from_paddr(
-                    l2e_get_paddr(*pl2e) + xen_phys_start, flags);
+                *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) + xen_phys_start);
             }
 
             /* Re-sync the stack and then switch to relocated pagetables. */
@@ -1572,31 +1533,28 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 #endif
 
     /*
-     * If not using 2M mappings to gain suitable pagetable permissions
-     * directly from the relocation above, remap the code/data
-     * sections with decreased permissions.
+     * Restrict permissions on the Xen code/data.
+     *
+     * Mark .text as RX.
      */
-    if ( !using_2M_mapping() )
-    {
-        /* Mark .text as RX (avoiding the first 2M superpage). */
-        modify_xen_mappings(XEN_VIRT_START + MB(2),
-                            (unsigned long)&__2M_text_end,
-                            PAGE_HYPERVISOR_RX);
+    modify_xen_mappings((unsigned long)&_start,
+                        (unsigned long)&__2M_text_end,
+                        PAGE_HYPERVISOR_RX);
 
-        /* Mark .rodata as RO. */
-        modify_xen_mappings((unsigned long)&__2M_rodata_start,
-                            (unsigned long)&__2M_rodata_end,
-                            PAGE_HYPERVISOR_RO);
+    /* Mark .rodata as RO. */
+    modify_xen_mappings((unsigned long)&__2M_rodata_start,
+                        (unsigned long)&__2M_rodata_end,
+                        PAGE_HYPERVISOR_RO);
 
-        /* Mark .data and .bss as RW. */
-        modify_xen_mappings((unsigned long)&__2M_rwdata_start,
-                            (unsigned long)&__2M_rwdata_end,
-                            PAGE_HYPERVISOR_RW);
+    /* Mark .data and .bss as RW. */
+    modify_xen_mappings((unsigned long)&__2M_rwdata_start,
+                        (unsigned long)&__2M_rwdata_end,
+                        PAGE_HYPERVISOR_RW);
 
+    if ( !IS_ALIGNED((unsigned long)&__2M_rwdata_end, MB(2)) )
         /* Drop the remaining mappings in the shattered superpage. */
         destroy_xen_mappings((unsigned long)&__2M_rwdata_end,
                              ROUNDUP((unsigned long)&__2M_rwdata_end, MB(2)));
-    }
 
     nr_pages = 0;
     for ( i = 0; i < e820.nr_map; i++ )
-- 
2.11.0


