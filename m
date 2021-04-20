Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C4D365EBB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 19:41:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113966.217114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYuNY-0006px-74; Tue, 20 Apr 2021 17:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113966.217114; Tue, 20 Apr 2021 17:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYuNY-0006pb-42; Tue, 20 Apr 2021 17:41:40 +0000
Received: by outflank-mailman (input) for mailman id 113966;
 Tue, 20 Apr 2021 17:41:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NaoY=JR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYuNX-0006pW-BW
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 17:41:39 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fc69427-8ea6-4997-9185-eba36c67290c;
 Tue, 20 Apr 2021 17:41:38 +0000 (UTC)
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
X-Inumbo-ID: 6fc69427-8ea6-4997-9185-eba36c67290c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618940498;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q5uyq9I9RXtPb4NM4q7ITiFLsZVSwuRIAlxVd5e6Jjg=;
  b=A2MMKw/juuD2DbIvec2ElUrH+MYKTip4ygQWWu5dMsnZG8oabRSZEoc3
   OqbixB2O/cr7D7tqZcYlrT3CQQOi5y5vrjnCj3ksRzwxuhOpF7CWSxLkh
   9sxPiH8eLTD7WjXc1T90kMIt0z1zmKWTnfZqDy0lzy2eBMPAvPVkaSY+h
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iWyu2oC31fXjV2yajVp4uFhM6DHO70oy3AsCk3j88mzQXjV8uz3KTlixV3CM8ad8mMd+oSS7WE
 biEQLDWIUVS+zmTwc0NUYz32vD7hWGOb7WXchSn6LGcjg8DYl6FsmTvRnBc1k082sS0S4XEBHB
 xxCxDjqXQ6NjYT+8DYhMW4TWiiPrCJxj+yh7vv9ltja1cg7ms3pJ+CemvbTfPnz9N508tDSWsj
 kw4+obTzVPK3L2XDwidpV4tn3w+hzt7IIvo+Z3zNkqmReEqoWLZmFDceilLPZ5BFsyH+YrFaBI
 FFM=
X-SBRS: 5.1
X-MesageID: 41843399
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:v9Zi4qlPQRPwOBDlDxCFe1oKDcPpDfLK3DAbvn1ZSRFFG/Gwve
 rGppUm/DXzjyscX2xlpMuJP7OOTWiZ2Zl+54QQOrnKZniBhEKDKoZ+4Yz+hwDxAiGWzJ876Y
 5Me7VzYeeAbmRSot395GCDfOoI5Pmi3OSWifzFz3FrJDsaD51IywtiEA6UHglXaWB9dPgEPa
 GR7MZGuDasEE5/Bq/QaxU4dtPOusHRk9beaQMGbiRXkTWmty+i67LxDnGjvis2bjUn+9kf2F
 mAtwT446m52svLryPh6w==
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41843399"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/shim: Simplify compat handling in write_start_info()
Date: Tue, 20 Apr 2021 18:41:18 +0100
Message-ID: <20210420174118.2731-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Factor out a compat boolean to remove the lfence overhead from multiple
is_pv_32bit_domain() calls.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Reinstate the conditional for the start info pointer, in case Intel/AMD
   can't be persuaded to adjust the architectural guarentees for upper bits in
   compatibility mode transitions.
---
 xen/arch/x86/pv/shim.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index d16c0048c0..4c6f442274 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -280,12 +280,12 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
 static void write_start_info(struct domain *d)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
-    start_info_t *si = map_domain_page(_mfn(is_pv_32bit_domain(d) ? regs->edx
-                                                                  : regs->rdx));
+    bool compat = is_pv_32bit_domain(d);
+    start_info_t *si = map_domain_page(_mfn(compat ? regs->edx : regs->rdx));
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


