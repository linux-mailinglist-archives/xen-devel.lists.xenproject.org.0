Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C7C249910
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 11:11:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8K6w-0002gE-Hw; Wed, 19 Aug 2020 09:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHFf=B5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8K6v-0002g9-5u
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 09:10:21 +0000
X-Inumbo-ID: 3d26b84b-67f3-4bbb-8159-3c06e4f90066
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d26b84b-67f3-4bbb-8159-3c06e4f90066;
 Wed, 19 Aug 2020 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597828219;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jCitDRQUg5XjUba0RiJypJv4B8YexhlZ8EGeDhtKxls=;
 b=bBwuzfYCvMwircuJQi75KBzhDaADbhiAbng6LnH6GgKyOPw2A7zjULAh
 c+ypnSAx/Oi1rD9owS1RhpVnNUSYOHTdiEOsxJaep26rJNawzV73qn30i
 5CxySRHk/gdczHwhQr1a6+rlow44y16FF1NL/IIhkUXd/TttY5I/TafwC Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Rs1wbWERMAFxWEgGt3l4Wdrqz1qXBXowhOGwljDuzUqXoa0yOBI/XDEMP53x+8y26ZRfU3x+ci
 Go3aKPd7uEPaHMclAet0/J3stL6LYvGpQa1zRp1IUZoRBvzclyLpHc4eQJa7rXMvpEbQc431Md
 1DuGwPF+NMCfcLZPnq/hCYuMHUpRIAzgcepz90CjDR7P9g/nJhkvSYGTgilzZ4YVMvMDnKbw5O
 N+4Bl7Nmx6YTLLdJnlxFJXaRyd9ieH23AjVC/qAzB/Y49AnskcbN6oZw77GxijmBQlD2TgCmgs
 khk=
X-SBRS: 2.7
X-MesageID: 25153395
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,330,1592884800"; d="scan'208";a="25153395"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/vpic: fix vpic_elcr_mask macro parameter usage
Date: Wed, 19 Aug 2020 11:09:51 +0200
Message-ID: <20200819090951.15374-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

vpic_elcr_mask wasn't using the v parameter, and instead worked
because in the context of the callers v would be vpic. Fix this by
correctly using the parameter. While there also remove the unneeded
casts to uint8_t and the ending semicolon.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vpic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index ea38903d3f..27ad4bef3f 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -41,7 +41,7 @@
 #define vpic_lock(v)   spin_lock(__vpic_lock(v))
 #define vpic_unlock(v) spin_unlock(__vpic_lock(v))
 #define vpic_is_locked(v) spin_is_locked(__vpic_lock(v))
-#define vpic_elcr_mask(v) (vpic->is_master ? (uint8_t)0xf8 : (uint8_t)0xde);
+#define vpic_elcr_mask(v) ((v)->is_master ? 0xf8 : 0xde)
 
 /* Return the highest priority found in mask. Return 8 if none. */
 #define VPIC_PRIO_NONE 8
-- 
2.28.0


