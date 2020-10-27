Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E04429AA2D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 12:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12783.33116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMiC-0003WP-05; Tue, 27 Oct 2020 11:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12783.33116; Tue, 27 Oct 2020 11:00:19 +0000
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
	id 1kXMiB-0003W4-Sq; Tue, 27 Oct 2020 11:00:19 +0000
Received: by outflank-mailman (input) for mailman id 12783;
 Tue, 27 Oct 2020 11:00:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z16P=EC=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kXMiA-0003Vz-2A
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 11:00:18 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cf6879f-c274-406e-b102-6c89e1415c50;
 Tue, 27 Oct 2020 11:00:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z16P=EC=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kXMiA-0003Vz-2A
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 11:00:18 +0000
X-Inumbo-ID: 3cf6879f-c274-406e-b102-6c89e1415c50
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3cf6879f-c274-406e-b102-6c89e1415c50;
	Tue, 27 Oct 2020 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603796416;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bnzilUGUttNZba4BEWffCGoa6x7FSjyqhCYjTIOednw=;
  b=c8AeIn40fP4wh8isxdSahruQiAbggDSHzk47ITRnCIFdDQtY74KU6kFN
   juXg7u7Dw5gxFU04am/2Ackmm/RyGLINO4Oe2r04e3ujbA8w37jzu05F7
   LdjOeG01bSxKscwaui/PPzXxrQ9U72czVZc6gANY96cw8VU3lFYwmn7lo
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fgYDooBJu1m9oJNlNgvljkvzOf4GAW6lL6MsihnZ7zJ0L8k4VKcEaNvwVoJI8SFAIPlyKw48h2
 exzprB6oSJrRUQSCqpzsNDLg1IB5HmCzO4lFep0xGVIWCCta+p4y2aUFQa7kzqTW/qJwHLF7hN
 lTG6S9iGLDGAzgRtu9jDOEDfNJZwKL1N1uKLWMBpsN0ALzHihxfPSoC80rYHBPAjW1v/sjsJK3
 WniYXv8nrszKiIkIrxA9i2MMOZsVsLk9uwUnrHcVptqtJgbOXamDStEc8HIQgZMralpuRO6uOW
 a9g=
X-SBRS: None
X-MesageID: 29824937
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,423,1596513600"; 
   d="scan'208";a="29824937"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>
Subject: [PATCH] {x86,arm}/mm.c: Make populate_pt_range __init
Date: Tue, 27 Oct 2020 10:58:39 +0000
Message-ID: <20201027105839.129217-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It's only called from another __init function.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 xen/arch/arm/mm.c | 2 +-
 xen/arch/x86/mm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 9c4b26bf07..dbd9f3fe4c 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1298,7 +1298,7 @@ int map_pages_to_xen(unsigned long virt,
     return xen_pt_update(virt, mfn, nr_mfns, flags);
 }
 
-int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
 }
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b2f35b3e7d..1f7ddf318b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5529,7 +5529,7 @@ int map_pages_to_xen(
     return rc;
 }
 
-int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return map_pages_to_xen(virt, INVALID_MFN, nr_mfns, MAP_SMALL_PAGES);
 }
-- 
2.25.1


