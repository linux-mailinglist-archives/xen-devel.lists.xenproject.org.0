Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35480325464
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:11:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89868.169708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFK9m-0002Pe-IL; Thu, 25 Feb 2021 17:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89868.169708; Thu, 25 Feb 2021 17:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFK9m-0002PB-Ey; Thu, 25 Feb 2021 17:10:30 +0000
Received: by outflank-mailman (input) for mailman id 89868;
 Thu, 25 Feb 2021 17:10:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFK9k-0002NX-Ue
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:10:28 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3a0ebe1-0e34-4ef8-8561-8587438a6937;
 Thu, 25 Feb 2021 17:10:24 +0000 (UTC)
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
X-Inumbo-ID: c3a0ebe1-0e34-4ef8-8561-8587438a6937
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614273023;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kNj715ReiVr9iSfrE07jiAXIxtnsUBFtABZQwDxEAto=;
  b=JZC/ui6zn5yR9PtebrpHjyfnZYyIMJe14PmNOuU9iR/HiIF6UW+IJ+T5
   FTyoY8X93BFA6HszRO93OrhLfYj26Hg2xnl/1RBg2sAVETZTPv3hBGPca
   Bz9PRRwr++/tWcLNJrRpVbZd+o3x0P9J/BrDTy3o3ENTPrtJ5GqjNMb3w
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: COegb4ZToJqx916T8zRxHV6xoRQ9dWyjVxY4ybCI4Wamia0/emKp4ch94xhJY8KnYWQq8fJeaQ
 8N+hjidaM9JqLF9WwQkJ3k5/WiTuZTVSgQSNGDC2q8a3CPGWqr6ac05unLW4ytuG/KhoTKP18h
 QXkwoxaxeENybYC1GjPqj0LCIFixkzmjnUM1vG8eR0WySu/8LLSHY930kigrmzz3X4wBcGK0pV
 kM0E5g5N+9S1VTm4xnoN6mvAjFHQ+prBPhCHfPLa88MXJ5mU+v/hcsUrX65uSW0m71yGEsKodF
 Dsk=
X-SBRS: 5.2
X-MesageID: 38055921
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,206,1610427600"; 
   d="scan'208";a="38055921"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.15] x86/dmop: Properly fail for PV guests
Date: Thu, 25 Feb 2021 17:09:36 +0000
Message-ID: <20210225170936.3008-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The current code has an early exit for PV guests, but it returns 0 having done
nothing.

Fixes: 524a98c2ac5 ("public / x86: introduce __HYPERCALL_dm_op...")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>
CC: Paul Durrant <paul@xen.org>

For 4.15.  Found while testing XEN_DMOP_nr_vcpus.  Needs backporting to all
stable releases.
---
 xen/arch/x86/hvm/dm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 5bc172a5d4..612749442e 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -365,6 +365,7 @@ int dm_op(const struct dmop_args *op_args)
     if ( rc )
         return rc;
 
+    rc = -EINVAL;
     if ( !is_hvm_domain(d) )
         goto out;
 
-- 
2.11.0


