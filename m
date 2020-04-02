Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E719C6F2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 18:19:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK2YV-0007uf-AN; Thu, 02 Apr 2020 16:18:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2q0J=5S=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jK2YU-0007ua-4G
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 16:18:58 +0000
X-Inumbo-ID: a6904a84-74fd-11ea-b58d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6904a84-74fd-11ea-b58d-bc764e2007e4;
 Thu, 02 Apr 2020 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585844336;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=1X9TKHRvXg8TwGrsMaRFTevKqbcYo0BBHmbYTPfNqdU=;
 b=Suigc0I/ZbjYk1Nr7eLM1iJx6aOV0HrMvZd218VlDfo1QCOqUdIqchbt
 sGFpjlhoP+PcBAWp07Y4/ET+4ESq1MT9U3ecIXKQtz4KqsP224ZLS2+Z3
 mQ11HJgeY2rf3h5JLF3GSnNAhCyGP4zZygtYuVuPmgPiH16aqxhezk93d M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DdBtcH2OPaho30HSSa8wHbjQuci25FrV7qDP13iiW284JaEsMrmwXoID4Ly/LD2bWtqeeKPmzp
 HkWGjvPGHSlDGh7Dhwk3hXuwEw8uGEFVcnJhgAEVy9+LXy9nimyKqfyvI+UKHH4gK5aoIST83u
 Uytcq8/v2oJAz16ik9bCmcd4gxJ7f2NsSYcEWenEbon0e3HgmljUEaU2Gp0iA6v9bVG9B6G5rX
 jiMbA2TA/Wn3j6cEM2MGr/6eWUo1VSWQSl5pODfnbmVHHgC+IoJH+1HyTWU7iOh2jx4qwg6vNs
 DfA=
X-SBRS: 2.7
X-MesageID: 15406123
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,336,1580792400"; d="scan'208";a="15406123"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] hvmloader: probe memory below 4G before allocation for OVMF
Date: Thu, 2 Apr 2020 17:18:48 +0100
Message-ID: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The area just below 4G where OVMF image is originally relocated is not
necessarily a hole - it might contain pages preallocated by device model
or the toolstack. By unconditionally populating on top of this memory
the original pages are getting lost while still potentially foreign mapped
in Dom0.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
That doesn't seem necessary for at least upstream toolstack now.
Alternative might be - to move population of this area to the toolstack
where there is more control over memory layout.
---
 tools/firmware/hvmloader/ovmf.c |  3 ++-
 tools/firmware/hvmloader/util.c | 14 ++++++++++++++
 tools/firmware/hvmloader/util.h |  3 +++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/firmware/hvmloader/ovmf.c b/tools/firmware/hvmloader/ovmf.c
index 23610a0..70d5f70 100644
--- a/tools/firmware/hvmloader/ovmf.c
+++ b/tools/firmware/hvmloader/ovmf.c
@@ -106,7 +106,8 @@ static void ovmf_load(const struct bios_config *config,
     {
         mfn = (uint32_t) (addr >> PAGE_SHIFT);
         addr += PAGE_SIZE;
-        mem_hole_populate_ram(mfn, 1);
+        if ( !mem_probe_ram(mfn) )
+            mem_hole_populate_ram(mfn, 1);
     }
 
     /* Check that source and destination does not overlaps. */
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 0c3f2d2..724cea0 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -398,6 +398,20 @@ int get_mem_mapping_layout(struct e820entry entries[], uint32_t *max_entries)
     return rc;
 }
 
+bool mem_probe_ram(xen_pfn_t mfn)
+{
+    uint32_t tmp, magic = 0xdeadbeef;
+    volatile uint32_t *addr = (volatile uint32_t *)(mfn << PAGE_SHIFT);
+
+    tmp = *addr;
+    *addr = magic;
+    if ( *addr != magic )
+        return 0;
+
+    *addr = tmp;
+    return 1;
+}
+
 void mem_hole_populate_ram(xen_pfn_t mfn, uint32_t nr_mfns)
 {
     static int over_allocated;
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 7bca641..00a7c13 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -194,6 +194,9 @@ int vprintf(const char *fmt, va_list ap);
 /* Buffer output */
 int snprintf(char *buf, size_t size, const char *fmt, ...) __attribute__ ((format (printf, 3, 4)));
 
+/* Probe whether a page is populated with RAM. */
+bool mem_probe_ram(xen_pfn_t mfn);
+
 /* Populate specified memory hole with RAM. */
 void mem_hole_populate_ram(xen_pfn_t mfn, uint32_t nr_mfns);
 
-- 
2.7.4


