Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8714428CBFC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 12:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6149.16210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSHtF-0004ro-49; Tue, 13 Oct 2020 10:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6149.16210; Tue, 13 Oct 2020 10:50:45 +0000
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
	id 1kSHtF-0004rP-0q; Tue, 13 Oct 2020 10:50:45 +0000
Received: by outflank-mailman (input) for mailman id 6149;
 Tue, 13 Oct 2020 10:50:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNIz=DU=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kSHtD-0004rJ-Py
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 10:50:43 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3ae139a-c45a-4f3f-86fa-a8fa42e3bb4d;
 Tue, 13 Oct 2020 10:50:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pNIz=DU=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kSHtD-0004rJ-Py
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 10:50:43 +0000
X-Inumbo-ID: a3ae139a-c45a-4f3f-86fa-a8fa42e3bb4d
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a3ae139a-c45a-4f3f-86fa-a8fa42e3bb4d;
	Tue, 13 Oct 2020 10:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602586241;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=bgPSfY5K8mqechUVxCHXmSrJrO0bpaOpkjX5pNnorcI=;
  b=VBI1Tb6w4bcjWUIv6fwQCLtTJvVKrkNZQt+uYHn8oITs5JO9NJc/u6DS
   vIH+AH1t9KJz4QTJRuLA4i5D+Abbakc4dx8zJudkpJbUE1oFiWgVWhWrO
   NPtL06h0N2zqmLIJWPHyzL88AiBbsNVWwK4Wg9BsEr/avPlDMq1WLfaBq
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: toMqVemWoncfsNyagp7tIjtaccWD2ZM0P2gqiQimPUlzyLy7Is/ri76BAspjK4j9vC/qqNQk1n
 OYrdKId7Dusg/GtjUdYoKIgACrqwTr0+GAP6AnYTVPQtLr6xe0A6wPVayA4kDJxaoZirroMeIi
 sx411r4Fq4Nvz9MyB5VRr6uWQL8OmsEfF455ipbnshQZFRIqBS1+mwLKv/6YRHMZfFJs2pEw0m
 QrbqJpTGw5Bd//VQa2lzIb1o55gzSVfDouo52MXGdDG7cwuxcggdUpxGus7y3Qa/vm2YweMA6l
 uJU=
X-SBRS: 2.5
X-MesageID: 29126438
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,370,1596513600"; 
   d="scan'208";a="29126438"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<wl@xen.org>, <iwj@xenproject.org>, Igor Druzhinin
	<igor.druzhinin@citrix.com>
Subject: [PATCH] hvmloader: flip "ACPI data" to ACPI NVS type for ACPI table region
Date: Tue, 13 Oct 2020 11:50:16 +0100
Message-ID: <1602586216-27371-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

ACPI specification contains statements describing memory marked with regular
"ACPI data" type as reclaimable by the guest. Although the guest shouldn't
really do it if it wants kexec or similar functionality to work, there
could still be ambiguities in treating these regions as potentially regular
RAM.

One such an example is SeaBIOS which currently reports "ACPI data" regions as
RAM to the guest in its e801 call. The guest then tries to use this region
for initrd placement and gets stuck. While arguably SeaBIOS needs to be fixed
here, that is just one example of the potential problems from using
reclaimable memory type.

Flip the type to "ACPI NVS" which doesn't have this ambiguity in it and is
described by the spec as non-reclaimable (so cannot ever be treated like RAM).

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 tools/firmware/hvmloader/e820.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
index 38bcf18..8870099 100644
--- a/tools/firmware/hvmloader/e820.c
+++ b/tools/firmware/hvmloader/e820.c
@@ -202,16 +202,17 @@ int build_e820_table(struct e820entry *e820,
     nr++;
 
     /*
-     * Mark populated reserved memory that contains ACPI tables as ACPI data.
+     * Mark populated reserved memory that contains ACPI tables as ACPI NVS.
      * That should help the guest to treat it correctly later: e.g. pass to
-     * the next kernel on kexec or reclaim if necessary.
+     * the next kernel on kexec and prevent space reclaim which is possible
+     * with regular ACPI data type accoring to ACPI spec v6.3.
      */
 
     if ( acpi_enabled )
     {
         e820[nr].addr = RESERVED_MEMBASE;
         e820[nr].size = acpi_mem_end - RESERVED_MEMBASE;
-        e820[nr].type = E820_ACPI;
+        e820[nr].type = E820_NVS;
         nr++;
     }
 
-- 
2.7.4


