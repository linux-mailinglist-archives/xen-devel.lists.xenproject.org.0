Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0804C364662
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 16:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113024.215399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYV9s-0002Ee-H5; Mon, 19 Apr 2021 14:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113024.215399; Mon, 19 Apr 2021 14:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYV9s-0002EJ-Do; Mon, 19 Apr 2021 14:45:52 +0000
Received: by outflank-mailman (input) for mailman id 113024;
 Mon, 19 Apr 2021 14:45:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYV9q-0002EE-Te
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 14:45:50 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40005a1f-10d4-45cc-91bb-1baa02fb3e09;
 Mon, 19 Apr 2021 14:45:50 +0000 (UTC)
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
X-Inumbo-ID: 40005a1f-10d4-45cc-91bb-1baa02fb3e09
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618843549;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ty0T50ZwLIJw8cIZQrlAqYvyqKtKe+HTjC7QJM0MA1Y=;
  b=fWpwuLaf5tgOcPbkxxRSOs+8d7/SKEmeJEVVO3/tOP90+WebzPg9d0bm
   O/g4SX1KTTaSqUGelT7kyATcXVENOMzUh0uQ02bXAk1GJBAmSHLSYgUuo
   TWWQi78bQe+aKWhCSOBlc7TLUzkxrgrWp9dPPbbK/pUNE9cKLfJ5m5HLw
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JqQVed7TemJvuZL8HoVTxIOoU/YNzr5MICt/7gf1H5ciFYPibWlSQ6LNLLpqJI0p+r4H5lLFqb
 6im0kdC4CldH0N5lXBtYXLW5sELPW6hEE5c9P1Hn1KFdnWQV517et94x/M61FPLTOaq9+PYF2C
 iMTfXg7OzpjIrRg+CgO3K2W3ZYZZ9+hW8yHZg4Udk2/MilaW7c8f8EosTf2OW1hUzfIpFX0/qU
 iwgYRBaWL2EoxVABJnS3z6RQziNEnEaIdnmfowAeoxrdJdpgy8lVAzbMSKq69lJsn2pTuxgcpC
 fDY=
X-SBRS: 5.1
X-MesageID: 41896375
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3JbJnaCImuQccivlHeh2sceALOonbusQ8zAX/mhsVB1YddGZnc
 iynPIdkST5kioVRWtIo729EYOHRm7R8oMw3JkJMd6ZLWzbkUaLDKUn14vtxDX8Bzbzn9Q26Y
 5Me7VzYeeeMXFUlsD/iTPXL/8F4P2qtJ+lnv3fyXAFd3AJV4hF4x1iAgiWVm1aLTMnObMDGJ
 CR5tVKqlObEBx6Uu2BCmQYRO+GntXXlfvdCiIuPQIt6wWFkFqTmd3HOiWfty1+bxp/hY0M3E
 KAuAz/66WlvZiAu2Xh/l6W1bt6sp/MztNCAeaFl8QaLC794zzYGbhJavm5kx0e5M2p9VY2gP
 nAyi1QQ/hb2jfqUUye5TvrxgX63z4l5xbZuCClqEqmm+PVbnYeKaN69OZkWyqc0WUMlpVA9Z
 gO+GSju59eHXr77VzAzumNbT5GvA6Ju3Y4+NRj6EB3YM8lR5J6i5cQx09RGIdoJlOA1KkXVN
 NjC8zR/59tADWnRkGcumFuxeqlVWgoEiGHRVAfuteU3yI+pgEB83cl
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="41896375"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/shim: Simplify compat handling in write_start_info()
Date: Mon, 19 Apr 2021 15:45:24 +0100
Message-ID: <20210419144524.32608-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Factor out a compat boolean to remove the lfence overhead from multiple
is_pv_32bit_domain() calls.

For a compat guest, the upper 32 bits of rdx are zero, so there is no need to
have any conditional logic at all when mapping the start info page.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/pv/shim.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index d16c0048c0..533c194eef 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -280,12 +280,12 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
 static void write_start_info(struct domain *d)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
-    start_info_t *si = map_domain_page(_mfn(is_pv_32bit_domain(d) ? regs->edx
-                                                                  : regs->rdx));
+    bool compat = is_pv_32bit_domain(d);
+    start_info_t *si = map_domain_page(_mfn(regs->rdx));
     uint64_t param;
 
     snprintf(si->magic, sizeof(si->magic), "xen-3.0-x86_%s",
-             is_pv_32bit_domain(d) ? "32p" : "64");
+             compat ? "32p" : "64");
     si->nr_pages = domain_tot_pages(d);
     si->shared_info = virt_to_maddr(d->shared_info);
     si->flags = 0;
@@ -300,7 +300,7 @@ static void write_start_info(struct domain *d)
                                           &si->console.domU.mfn) )
         BUG();
 
-    if ( is_pv_32bit_domain(d) )
+    if ( compat )
         xlat_start_info(si, XLAT_start_info_console_domU);
 
     unmap_domain_page(si);
-- 
2.11.0


