Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE4229EDC4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 15:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14195.35244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY8Ug-0007gH-0Y; Thu, 29 Oct 2020 14:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14195.35244; Thu, 29 Oct 2020 14:01:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY8Uf-0007fu-Th; Thu, 29 Oct 2020 14:01:33 +0000
Received: by outflank-mailman (input) for mailman id 14195;
 Thu, 29 Oct 2020 14:01:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kY8Ue-0007fp-KE
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:01:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b261967-038a-452e-a746-fb7780b2e5e9;
 Thu, 29 Oct 2020 14:01:30 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kY8Ue-0007fp-KE
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:01:32 +0000
X-Inumbo-ID: 6b261967-038a-452e-a746-fb7780b2e5e9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6b261967-038a-452e-a746-fb7780b2e5e9;
	Thu, 29 Oct 2020 14:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603980090;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0C2T7H5utLXNgmzYD5sBnHV5mV4tc2r1W12ZbIfWW4U=;
  b=Tkicl1PwrkkbCOOJSqTj6ycb00e64Ez3vhN0k9sZAVpQDTIL3BHH3kUl
   YlEzHrt8lw1AcKtSkAEhca3ndvymFK99QcQCYltHGG0DxXJYSyZNBBmRJ
   YfS+l3B92y10o7mTsccX4roSGoJ9g3hSPHM+62GwlgjlzwJv7mYOggvVQ
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: u1wlRsvtVKk7DFfUXO06V3DGPG2mjL+Sawr5OB3JUIpJCRSSOXvUbWc2GjiGog3WStqg+Poslj
 0etr4Z1TuZXgSgGvCU0tpqM8a9II9yE0sKuJV0yJRTpAZlXuVG0a9hOQyt6ekuM4HsAu4Iwr1l
 7/kVipOaE+mEyljWIkdNhRumdLb2RVZ+TPiwPeerS8W7NI3tClAwfZduRuccDT458svBRizfYG
 ifxOZc8WqrfhoVtKAwD/LZhMlc7vmyISpU1xyhJJviScqR11B2gUASKL8xDKkf99Ii33bIyOrx
 bKs=
X-SBRS: None
X-MesageID: 30067431
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,430,1596513600"; 
   d="scan'208";a="30067431"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pv: Drop stale comment in dom0_construct_pv()
Date: Thu, 29 Oct 2020 14:00:41 +0000
Message-ID: <20201029140041.18343-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This comment has been around since c/s 1372bca0615 in 2004.  It is stale, as
it predates the introduction of struct vcpu.

It is not obvious that it was even correct at the time.  Where a vcpu (domain
at the time) has been configured to run is unrelated to construct the domain's
initial pagetables, etc.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Almost...  I'm not entirely sure NUMA memory allocation is plumbed through
correctly, but even that still has nothing to do with v->processor
---
 xen/arch/x86/pv/dom0_build.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index d79503d6a9..f7165309a2 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -616,7 +616,6 @@ int __init dom0_construct_pv(struct domain *d,
         v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
     }
 
-    /* WARNING: The new domain must have its 'processor' field filled in! */
     if ( !is_pv_32bit_domain(d) )
     {
         maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
-- 
2.11.0


