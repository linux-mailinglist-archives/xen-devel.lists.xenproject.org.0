Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B055B4630AB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 11:07:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234986.407757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms02b-0003YL-Tl; Tue, 30 Nov 2021 10:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234986.407757; Tue, 30 Nov 2021 10:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms02b-0003VM-Pu; Tue, 30 Nov 2021 10:07:13 +0000
Received: by outflank-mailman (input) for mailman id 234986;
 Tue, 30 Nov 2021 10:07:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms00y-0007QZ-WD
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 10:05:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c6b8da7-51c5-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 11:05:31 +0100 (CET)
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
X-Inumbo-ID: 0c6b8da7-51c5-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638266731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4EShEwNY9aWo7yke4YUUnldLOjOyr7C+VW8CJKESj9k=;
  b=a8QyVjwrRNMgo7NT8+G5MMIpAWnAt2WgCuyGJkvGHmTugSV/oQclsR6Y
   2Ddvv0N4hjiarOTlbBABfVJ7PWChf0QJ+ODVkKVP4nKCYfwbSy/mzzmOq
   ARPLSz/zOcCg4tc1FRotrnILuFFT1ZbM7qqSUMaUmvkGQaNMrvvuHt6x8
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QSHdRY3RDTIphduj1x+qVnVb1NJwPpU3BWe0BT/Kgh1XORIY/arrR51Gfe0Y+6BWemUND5635Q
 dXIa1g8ZJ/K7PwNfr5njrKxyAuqfIoGHAAjYMWPDNTNVCAvuW+C4yRQ0UJAPf/4Ru6dgvZsNb7
 gvA12UE66HS9BLpiT4DFCVuUK4EjwmQFu3TlNnnSlmSm3U542yOsH48NXSWAvnYc0SkQ1p7K0q
 vLzi4CSu4hTfX8YhKY1lEYxJeaUF1fQ0D8A9CN1gECB4mt32JqAznt1ZkbRxE7Y20V9gdKaGKs
 FsW+5+2HyrEE75v48fEDLAUp
X-SBRS: 5.1
X-MesageID: 60914846
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GXFjfakHIMPp5qT7OxOd+YXo5gxMIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMXmyDPf/bY2P1L9h0bou/p0sCu5OBzIVrGQZkry02RSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Uw2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 O9BuJ2abxkHBKHJtuE3cSNaLHBQA5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ66PP
 pZJNWQHgBLoQwJ3PVcIE40FpqShqWmlYidZiUyJqv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJqH+A7wieT5JDY5iicLEo+TAEQRuIf4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud14WtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0uTA3Dt4ade51q2VtW
 lBfwKByC8hUUPmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehw5aJ9dImS3O
 hOJ0e+02HO1FCDxBUOQS9jsY/nGMIC6TYi1PhwqRoQmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnWNrNNIcwlVdSNT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C8t6gKxOrO4
 F+nXUpUlAj2iXHdcF3YYXF/crL/G514qCtjbyArOF+p3VklYJqus/hDJ8dmI+F/+bwx1+NwQ
 tkEZ96EXqZFRAPY9mlPdpL6toFjKkim3FrcIyq/bTEjVJd8XAiVqMT8dw7i+XBWXCq6vMczu
 ZO60QbfTcZRTghuFp+OOvmu00mwrT4Wn+crBxnEJdxaeUPN9ol2KnOu0q9rcp9UcRian2mUz
 QebBxsctNLhmY5t/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkVsW4YpxF7FnkfA369f1/uIIyw1lGDPAbkixC6MmKX6DhJEduqpIz75fmA23R
 kPQpYUKZeTXYJvoQAwLOQ4oTuWfzvVFyDDd4MM8LFj++CIqrqGMVl9fPkXUhSFQRFev3FjJH
 Qv1VBYq1jGC
IronPort-HdrOrdr: A9a23:3smwwKO2cvDQY8BcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.87,275,1631592000"; 
   d="scan'208";a="60914846"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/8] x86/mm: Drop bogus cacheability logic in update_xen_mappings()
Date: Tue, 30 Nov 2021 10:04:41 +0000
Message-ID: <20211130100445.31156-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211130100445.31156-1-andrew.cooper3@citrix.com>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is no circumstance under which any part of the Xen image in memory wants
to have any cacheability other than Write Back.

Furthermore, unmapping random pieces of Xen like that comes with a non-trivial
risk of a Triple Fault, or other fatal condition.  Even if it appears to work,
an NMI or interrupt as a far wider reach into Xen mappings than calling
map_pages_to_xen() thrice.

Simplfy the safety checking to a BUG_ON().  It is substantially more correct
and robust than following either of the unlikely(alias) paths.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I'm half tempted to drop the check entirely, but in that case it would be
better to inline the result into the two callers.
---
 xen/arch/x86/mm.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 4d799032dc82..9bd4e5cc1d2f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -785,24 +785,21 @@ bool is_iomem_page(mfn_t mfn)
 
 static int update_xen_mappings(unsigned long mfn, unsigned int cacheattr)
 {
-    int err = 0;
     bool alias = mfn >= PFN_DOWN(xen_phys_start) &&
          mfn < PFN_UP(xen_phys_start + xen_virt_end - XEN_VIRT_START);
-    unsigned long xen_va =
-        XEN_VIRT_START + ((mfn - PFN_DOWN(xen_phys_start)) << PAGE_SHIFT);
+
+    /*
+     * Something is catastrophically broken if someone is trying to change the
+     * cacheability of Xen in memory...
+     */
+    BUG_ON(alias);
 
     if ( boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) )
         return 0;
 
-    if ( unlikely(alias) && cacheattr )
-        err = map_pages_to_xen(xen_va, _mfn(mfn), 1, 0);
-    if ( !err )
-        err = map_pages_to_xen((unsigned long)mfn_to_virt(mfn), _mfn(mfn), 1,
-                     PAGE_HYPERVISOR | cacheattr_to_pte_flags(cacheattr));
-    if ( unlikely(alias) && !cacheattr && !err )
-        err = map_pages_to_xen(xen_va, _mfn(mfn), 1, PAGE_HYPERVISOR);
-
-    return err;
+    return map_pages_to_xen(
+        (unsigned long)mfn_to_virt(mfn), _mfn(mfn), 1,
+        PAGE_HYPERVISOR | cacheattr_to_pte_flags(cacheattr));
 }
 
 #ifndef NDEBUG
-- 
2.11.0


