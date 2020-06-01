Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872991EA537
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:41:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkgV-0001E7-8l; Mon, 01 Jun 2020 13:40:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfgE=7O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jfkgT-0001E2-D3
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:40:57 +0000
X-Inumbo-ID: 84e9b336-a40d-11ea-81bc-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84e9b336-a40d-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 13:40:56 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EiEC/4LNeYzNvajZEdL3Yks2kRlluXttvjFpXKdHb7DO0ZMwGZoFv6vXdEGnI43ZsuBkXp6oG9
 X5h6LMaGyEg0QQCDGSfXrMx+6HNtG5xQEqGw3YiIkEJswL6NlEuv2plg+U4QrTvpA3ueqZZivg
 I4sfJ83kT+H4K56t0xe53B4C23kHA5qeN1KeHy4sMMClQ8sAEVeWG0q/t7OW6XCxBZfORqQay4
 uAGPFyWcsY3bWVY2ndCWps9y9He5bu9b5suoPwI3pkzpcA4ODVLhdM8bqg8E2AFkV/OdRnhZa8
 q0I=
X-SBRS: 2.7
X-MesageID: 19661962
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,460,1583211600"; d="scan'208";a="19661962"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] docs/ucode: Extend runtime microcode loading
 documentation
Date: Mon, 1 Jun 2020 14:40:25 +0100
Message-ID: <20200601134025.24142-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Extend the disclaimer about runtime loading.  While we've done our best to
make the mechaism reliable, the safety of late loading does ultimately depend
on the contents of the blobs.

Extend the xen-ucode portion with examples of how to use it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
---
 docs/admin-guide/microcode-loading.rst | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/docs/admin-guide/microcode-loading.rst b/docs/admin-guide/microcode-loading.rst
index 5f0f661a2e..8cd5d0351b 100644
--- a/docs/admin-guide/microcode-loading.rst
+++ b/docs/admin-guide/microcode-loading.rst
@@ -104,8 +104,8 @@ modules to find any CPIO archives, and search the archive for the applicable
 file.  Xen will stop searching at the first match.
 
 
-Run time microcode loading
---------------------------
+Runtime microcode loading
+-------------------------
 
 .. warning::
 
@@ -113,7 +113,23 @@ Run time microcode loading
    or at boot time.  Not all microcode updates (or parts thereof) can be
    applied at runtime.
 
-The ``xen-ucode`` utility can be used to initiate a runtime microcode load.
+   Given the proprietry nature of microcode, we are unable to make any claim
+   that a runtime microcode is risk-free.  Any runtime microcode loading needs
+   adequate testing on a dev instance before being rolled out to production
+   systems.
+
+The ``xen-ucode`` utility can be used to initiate a runtime microcode load::
+
+  [root@host ~]# xen-ucode
+  xen-ucode: Xen microcode updating tool
+  Usage: xen-ucode <microcode blob>
+  [root@host ~]#
+
+e.g. With a Linux dom0 on a Haswell system::
+
+  [root@host ~]# xen-ucode /lib/firmware/intel-ucode/06-3c-03
+  [root@host ~]#
+
 It will pass the blob to Xen, which will check to see whether the blob is
 correct for the processor, and newer than the running microcode.
 
-- 
2.11.0


