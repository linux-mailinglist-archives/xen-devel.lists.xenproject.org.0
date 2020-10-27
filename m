Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A8129AF58
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 15:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12893.33347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPhA-00053r-E0; Tue, 27 Oct 2020 14:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12893.33347; Tue, 27 Oct 2020 14:11:28 +0000
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
	id 1kXPhA-00053S-9t; Tue, 27 Oct 2020 14:11:28 +0000
Received: by outflank-mailman (input) for mailman id 12893;
 Tue, 27 Oct 2020 14:11:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kXPh8-00053N-Po
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:11:26 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b7ba5b8-0cc2-4c44-9249-3eecfb49092d;
 Tue, 27 Oct 2020 14:11:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kXPh8-00053N-Po
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:11:26 +0000
X-Inumbo-ID: 4b7ba5b8-0cc2-4c44-9249-3eecfb49092d
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4b7ba5b8-0cc2-4c44-9249-3eecfb49092d;
	Tue, 27 Oct 2020 14:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603807885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j/2Q2d4NLk5j8Y791XgkMADfxqAFxYy385J6xuXYUOw=;
  b=M4suCh9dq3aBwLOke6796Ynu9v14vrEdH+qWDBJ1iB+9Nl+aNu+QlFqP
   2aZIPnNAEK6MSovbJMZHrVVNuZLlaDPoDbE3GxxvVqazbd3dSPXVZz3NB
   /3GGV+z8AkZiZDifek5IdCZG0kAyIXqaPFv3QNApsKuiY2Mt5qW9bT4gC
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: i3Xm9+72s+9SQAOfx/iEGcWF1xIlG8CV0kUKezAnXuNKS58307q0HDGBAIRxOYiSR6oj2TAX7Z
 yyxP6oPGngkVI/RSyARHYtmLw5SK3Z2ab8/WkrGSGJQDx3UJbZiVToh6oRsBIMjoP+5v4V1NrN
 QU9LWJSvCkwGshznU1Hi8muDhcOu2Wb/mJnVWSXZExzZYXyDFAayF+U+tRi7ROpfV8+f64FcLo
 xQ02QPUbzInVvX/dx6tG+ds9ETC8jtChebXeBGHoaCW9O/n1r89xzuU1wA9eyp1hL7BAvamhxW
 4oY=
X-SBRS: None
X-MesageID: 30949880
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,424,1596513600"; 
   d="scan'208";a="30949880"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/2] x86/pv: Drop FLUSH_TLB_GLOBAL in do_mmu_update() for XPTI
Date: Tue, 27 Oct 2020 14:10:36 +0000
Message-ID: <20201027141037.27357-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201027141037.27357-1-andrew.cooper3@citrix.com>
References: <20201027141037.27357-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

c/s 9d1d31ad9498 "x86: slightly reduce Meltdown band-aid overhead" removed the
use of Global TLB flushes on the Xen entry path, but added a FLUSH_TLB_GLOBAL
to the L4 path in do_mmu_update().

However, this was unnecessary.

The L4 resync will pick up any new mappings created by the L4 change.  Any
changes to existing mappings are the guests responsibility to flush, and if
one is needed, an MMUEXT_OP hypercall will follow.

This is (not really) XSA-286 (but necessary to simplify the logic).

Fixes: 9d1d31ad9498 ("x86: slightly reduce Meltdown band-aid overhead")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v3:
 * New
---
 xen/arch/x86/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b2f35b3e7d..38168189aa 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4188,7 +4188,7 @@ long do_mmu_update(
 
         cpumask_andnot(mask, pt_owner->dirty_cpumask, cpumask_of(cpu));
         if ( !cpumask_empty(mask) )
-            flush_mask(mask, FLUSH_TLB_GLOBAL | FLUSH_ROOT_PGTBL);
+            flush_mask(mask, FLUSH_ROOT_PGTBL);
     }
 
     perfc_add(num_page_updates, i);
-- 
2.11.0


