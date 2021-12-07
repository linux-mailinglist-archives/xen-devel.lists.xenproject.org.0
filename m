Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6B846B997
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 11:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240869.417628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY6f-0007cp-QL; Tue, 07 Dec 2021 10:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240869.417628; Tue, 07 Dec 2021 10:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY6f-0007b6-Mw; Tue, 07 Dec 2021 10:53:57 +0000
Received: by outflank-mailman (input) for mailman id 240869;
 Tue, 07 Dec 2021 10:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WjKu=QY=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1muY6e-0007ZY-Nc
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 10:53:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f833264e-574b-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 11:53:55 +0100 (CET)
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
X-Inumbo-ID: f833264e-574b-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638874435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D7++fhzoY5NWbD5Y83bEMQFPNo1ym85KhSzs/zIuiyA=;
  b=KMq8qKoGhEuT348bBaBD3sOHdQ6bv1epIGNHTWRiubxFsYFUNpEwPN+H
   Ow68ONU5mr0kVfFdctEb3/IDfODkjRiHdoooxx7cRFzWSeG7pnIrPVGds
   1qCS5EE/exAJg6cGAoWs0sjOAUa/F5ZnidjyMQ+Kgo801sKQPCO4lSvk9
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dt+gcHzbw+IghTrs6Y9yWDtVdrHZ0IJqqCQqaeELLI4qBa1p96yxj6egxuJL7bJGOtyNpqeMt+
 HXF/LLsI/fW2+c1hu3dngvRPjNqqwsCafgCGiV4dOr9zbUIIqyCk3MxpeWU09Yg+DTGXyccYJd
 KUXeiTA3BSxwgo8WuQA7HniXVfAOJwdylK7H9b6n2pDT2TWuJIMnA/CqQTf85bbwCyvbhn+mR3
 EIE9Mf2uSn6Fh352VK0uBXU9efhA/yzYD7cDq6IJawDrqCYYiUEdkUdpg9f3uVHb8cOmBzvquY
 Qh8P8qVn81GeJRuZn0ewaqvS
X-SBRS: 5.1
X-MesageID: 59828125
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RZs2naIKuMu/DqCxFE+R6JIlxSXFcZb7ZxGr2PjKsXjdYENS0zMHz
 WcbUD3VOf7fZWH9eI93PY7n/B4OsJXdzt9jG1RlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eg7xLZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2ErsE29
 9dG7qWcbiEgYZ/dvPQsDjRhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gph1poeRKyDD
 yYfQWVXVBj4JDxCBnwoK5IOhuSVpnzVbTIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wh
 EjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCssy8NHOVSGLYDxCarw/Xm8iKJNzUpd2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRON/Ni2+AswGzARN8wGGxFAbpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmr2qy76I94Iumkiei+F1/ronhezP
 yfuVf55vscPbBNGk4cpC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk3nVKeGrZGuZd2l39W+I8mbc2ip/hR+eHFPyD9pHZsGAbmU93VG4vY+liIq
 IgGaJPRo/idOcWnChTqHUcoBQhiBRAG6Vre8KS7r8aPfVhrHn8PEfjUze9zcoBphf0NxOzJ4
 mu8SglTz1+m3S/LLgCDa3ZCbrLzXMkg8SJnbHJ0ZVv4iWI+ZYuP7bsEc8dld7cQ6+E+n+V/S
 OMIepvcD60XGCjH4TkUcbL0sJdmKEawnQuLMif8OGo/cpdsShbn4NjhegezpiACAjDu7Zk1o
 qG61xOdSp0GHlwwAMHTYfOp7lWwoXlCx74iAxqWeoFeIRy+/pJrJir9iu4MD/sNcRiTlCGH0
 wu2AAsDobWfqYEC79SU17uPqJ2kErUiExMCTXXb97u/KQLT4nGnnd1bSO+NcD3QCDH09aGla
 bkHxv3wKqRazlNDso46GLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeaOeAN87SGVIMIBYoM7aY3vYOlziOtfk4LS0WPsOsEGZrhamKAySxtQ==
IronPort-HdrOrdr: A9a23:83Ab7qOB6VbppsBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.87,293,1631592000"; 
   d="scan'208";a="59828125"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/boot: Drop pte_update_limit from physical relocation logic
Date: Tue, 7 Dec 2021 10:53:37 +0000
Message-ID: <20211207105339.28440-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211207105339.28440-1-andrew.cooper3@citrix.com>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This check has existed in one form or another since c/s 369bafdb1c1 "xen: Big
changes to x86 start-of-day" in 2007.  Even then, AFAICT, it wasn't necessary
because there was a clean split between the statically created entries (L3 and
higher) and the dynamically created ones (L2 and lower).

Without dissecting the myriad changes over the past 14 years, I'm pretty
certain Xen only booted by accident when l2_xenmap[0] was handled specially
and skipped the pte_update_limit check which would have left it corrupt.

Nevertheless, as of right now, all non-leaf PTEs (the first loop), and all 2M
xenmap leaf mappings (the second loop) need relocating.  They are no unused
mappings in the range, no mappings which will be encountered multiple times,
and it is unlikely that such mappings would be introduced.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/setup.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c8641c227d9a..0492856292cf 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1230,7 +1230,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             l3_pgentry_t *pl3e;
             l2_pgentry_t *pl2e;
             int i, j, k;
-            unsigned long pte_update_limit;
 
             /* Select relocation address. */
             xen_phys_start = end - reloc_size;
@@ -1238,14 +1237,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             bootsym(trampoline_xen_phys_start) = xen_phys_start;
 
             /*
-             * No PTEs pointing above this address are candidates for relocation.
-             * Due to possibility of partial overlap of the end of source image
-             * and the beginning of region for destination image some PTEs may
-             * point to addresses in range [e, e + XEN_IMG_OFFSET).
-             */
-            pte_update_limit = PFN_DOWN(e);
-
-            /*
              * Perform relocation to new physical address.
              * Before doing so we must sync static/global data with main memory
              * with a barrier(). After this we must *not* modify static/global
@@ -1267,8 +1258,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                 {
                     /* Not present, 1GB mapping, or already relocated? */
                     if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) ||
-                         (l3e_get_flags(*pl3e) & _PAGE_PSE) ||
-                         (l3e_get_pfn(*pl3e) >= pte_update_limit) )
+                         (l3e_get_flags(*pl3e) & _PAGE_PSE) )
                         continue;
                     *pl3e = l3e_from_intpte(l3e_get_intpte(*pl3e) +
                                             xen_phys_start);
@@ -1277,8 +1267,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                     {
                         /* Not present, PSE, or already relocated? */
                         if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) ||
-                             (l2e_get_flags(*pl2e) & _PAGE_PSE) ||
-                             (l2e_get_pfn(*pl2e) >= pte_update_limit) )
+                             (l2e_get_flags(*pl2e) & _PAGE_PSE) )
                             continue;
                         *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) +
                                                 xen_phys_start);
@@ -1291,8 +1280,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
             {
                 if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) ||
-                     !(l2e_get_flags(*pl2e) & _PAGE_PSE) ||
-                     (l2e_get_pfn(*pl2e) >= pte_update_limit) )
+                     !(l2e_get_flags(*pl2e) & _PAGE_PSE) )
                     continue;
 
                 *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) + xen_phys_start);
-- 
2.11.0


