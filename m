Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E5A461CB5
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 18:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234768.407400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrkQa-0007oU-UB; Mon, 29 Nov 2021 17:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234768.407400; Mon, 29 Nov 2021 17:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrkQa-0007lZ-Qi; Mon, 29 Nov 2021 17:26:56 +0000
Received: by outflank-mailman (input) for mailman id 234768;
 Mon, 29 Nov 2021 17:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Z1H=QQ=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mrkQY-0007lT-PW
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 17:26:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a2f172d-5139-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 18:26:53 +0100 (CET)
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
X-Inumbo-ID: 8a2f172d-5139-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638206813;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LgAYVrwXcCN/hnjAXyshxLDQR7k9TL7p2qGhfipP85g=;
  b=Q9SwNu0ooymp/g1gOjBD7MmRAZriRTO2+U5zHfYKvWS/8+L0l/noOcun
   EJsDy5jTAtpw2oPo23e9peauGTv80iU2wSP+1LQuxXTqxhgGQi/G2iJxV
   quiHfLk6oaXePNTrw5GozU9Aa45xwZzYD8SM9+gKONJyihsJHPJU60G0w
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3QRIQvlYtTUExbzD1+z4kiqWHSoV6QWH5xmBEwX7QRinsdFpmin7jnxCshdZjljJWCD9sNGlcl
 I379AEVFTjICj7Z49lwKnd4/yy0lQlVin/69HXO3ghAI4sYxYenYjVQWry55HndkJFEKHAzG+K
 HrAZ3I+d4tML74qbCpxxs6oso61L6Ec7WXZMCjjvIYmbNH1kJYSJur8MOR3riuhgBFeNPafHX7
 VsohNGBwVYj3q/8mw3P7aIKuKaLt/dTCmtVs8RMuzYS3vtBywOz/G7RrZlQu9W7tcTi6oR5doB
 nNWarnuPWbvMd0Is/tyd5Qk5
X-SBRS: 5.1
X-MesageID: 58830142
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eL2aNqAnMUYIuRVW/+/kw5YqxClBgxIJ4kV8jS/XYbTApDklgTBRz
 GYeCjjUOP2MZTf0L4pyYNzipxxX65OBzoc3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5400M7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/syyDxdR66
 fV0j7eCVho5Yq7quOExXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjGdr3pkSR54yY
 eIjdAtKfDXnPCF1K3cpD50ApPiMiCnGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiEadtEQYUPtwKtcR2h6Q2vbXxSacKmdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqnBNzHJmRtR
 FBex6CjABkmVPlhbhClTuQXB62O7P2YKjDailMHN8B/rGT0oSL8J9sJsG0WyKJV3iAsI2WBj
 Kj741052XOuFCHyMf8fj3yZVqzGMpQM5fy6D6uJP7Kik7B6dROd/TEGWKJj9zuFraTYqolmY
 c3zWZ/1VR4yUP07pBLrF7Z1+eJ6nUgWmDKMLa0XOjz6iNJyklbOEuxbWLZPB8hkhJ65TPL9r
 4wCapDUkkoHC4UToED/qOYuELzDFlBjbbieliCdXrfcSua/MG1+WfLX3507fIlpw/ZcmuvSp
 ynvUU5E0lvvw3bALFzSOHxkbbruW7d5rG46YnNwbQr5hSB7bNb99robers2YaIjqL5pw8lrQ
 qRXYM6HGPlOFGjKomxPcZnnoYV+Xx23ngbSbTG9aT0ycsc4FQzE89PpZCX18ywKAnblvMcyu
 eT4hAjaXYACV0JpC8OPMKCjyFa4vH48nuNuXhSXfokPKRu0qIUzcn7/lP46Jc0IOC7v/DrC2
 lbEGwocqMnMv5QxrIvDi5ebotr7COB5BEdbQTXWtO7kKSnA82O/6oZcS+LULyvFXWb59aj+N
 +VYy/bwbK8OkFpQ6tcuFr9qyeQ15sf1pq8cxQNhRS2ZY1OuA7JmA3+HwcgQ6fEdmu4H4VO7C
 hCV591XGbSVI8e0QlceKT0sYvmHyfxJyCLZ6u44IRmi6SJ6lFZdvZ6+4/VYZPRhEYZI
IronPort-HdrOrdr: A9a23:jg3+kaMNbDNL0cBcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58830142"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/boot: Drop incorrect mapping at l2_xenmap[0]
Date: Mon, 29 Nov 2021 17:26:17 +0000
Message-ID: <20211129172617.12779-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It has been 4 years since the default load address changed from 1M to 2M, and
_stext ceased residing in l2_xenmap[0].  We should not be inserting an unused
mapping.

To ensure we don't create/remove mappings accidentally, loop from 0 and obey
_PAGE_PRESENT on all entries.

Fixes: 7ed93f3a0dff ("x86: change default load address from 1 MiB to 2 MiB")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I ought to have spotted this in c/s 52975142d154 ("x86/boot: Create the
l2_xenmap[] mappings dynamically") too.
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


