Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EB97DCC74
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 13:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625652.975137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxnS2-0006z5-E3; Tue, 31 Oct 2023 12:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625652.975137; Tue, 31 Oct 2023 12:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxnS2-0006wb-BL; Tue, 31 Oct 2023 12:02:30 +0000
Received: by outflank-mailman (input) for mailman id 625652;
 Tue, 31 Oct 2023 12:02:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8KE=GN=citrix.com=prvs=661c0debb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qxnS1-0006wT-BD
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 12:02:29 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ae58dc5-77e5-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 13:02:26 +0100 (CET)
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
X-Inumbo-ID: 5ae58dc5-77e5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698753746;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jp5vE5wCHfEYuloOa15nRVv8FboPWyr4raV5pQHa31M=;
  b=TeSbfgHS2CNc/8ergxRLzUfwoqUvIG8/qg3DYNLWf23GsGBHaeVIkQ/M
   6R/SiRlKN2gQFskM7QRYaNrxtltz2nDaYOqhd70k0a1JZPeFLAJqhDO/j
   E/QCFeioD0Jzdp6+B0OQd7E9+FQyMzBJ86ZvRhaX3YiNFbi8ZbooB5kpX
   c=;
X-CSE-ConnectionGUID: 9Trui3+mStyi52p/sZsRpA==
X-CSE-MsgGUID: hWCYK9liSMizljwk4UyJ+g==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127129590
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:3Zxni64dCp4CQX1APmYPIAxRtBLHchMFZxGqfqrLsTDasY5as4F+v
 jQfWGnSbP+JZjH8Ltt0ao3n9h4CupeEnIBlSgZtri1gHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKgQ5QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mp
 MACNTFWLRW4m/O3neijDfJenf47BZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxBnB/
 DObrjyR7hcyNOO0+BnU9nOXo+7dmSHkW94vBZ/7+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 neMlsnsDCZis5WUT2yc7baeqT6uOSkTInQGbCVCRgwAi/HDrYcpn1TwR9BsOKevi5v+HjSY/
 tyRhHFg3fNJ15dNjvjquw+f696xmnTXZl8J/BjWBSGg1R9oZdP/f8uz20Ph9d8Vee51UWK9U
 Gg4d9m2tb5fXc7Xz3HcG43hD5nzuazZbme0bUpHWsl5rWrwoRZPaKgKuFlDyFFV3tHokNMDS
 GTUowpVrKRLJnqsYrQfj2mZUJ9ykvGI+TgITJnpgjtyjntZLlTvENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+57mHFmlTyMHsqmp/hC7VZ5TCfKIYrpzXPXM7tnhE96iF69H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUUG6WTNg5UPLIare1M2cFzN/teNmdvNjaQ5xfUK/goJl
 1nhMnJlJK3X3CSeeF3RMSgyAF4tNL4mxU8G0eUXFQ7A8xAejUyHs8/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:yjb18q6wTqnOBmABjgPXwMzXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeVfxLqn7zr8GzDvss5xvJ
 0QFJSW0eeAb2SSW/yKhTWFLw==
X-Talos-CUID: 9a23:Zc1G8286kWQxLA6Jl/iVvx8oAN0kKT7Y92vBIhLiESFyeqavUXbFrQ==
X-Talos-MUID: 9a23:OLloCQW4FAHjJH7q/D/TrwBBZcNp2IGvGkQPjpZahtimdiMlbg==
X-IronPort-AV: E=Sophos;i="6.03,265,1694750400"; 
   d="scan'208";a="127129590"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18] docs: Fix IOMMU command line docs some more
Date: Tue, 31 Oct 2023 12:02:15 +0000
Message-ID: <20231031120215.3307356-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Make the command line docs match the actual implementation, and state that the
default behaviour is selected at compile time.

Fixes: 980d6acf1517 ("IOMMU: make DMA containment of quarantined devices optional")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 docs/misc/xen-command-line.pandoc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6b07d0f3a17f..9a19a04157cb 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1480,7 +1480,8 @@ detection of systems known to misbehave upon accesses to that port.
 > Default: `new` unless directed-EOI is supported
 
 ### iommu
-    = List of [ <bool>, verbose, debug, force, required, quarantine[=scratch-page],
+    = List of [ <bool>, verbose, debug, force, required,
+                quarantine=<bool>|scratch-page,
                 sharept, superpages, intremap, intpost, crash-disable,
                 snoop, qinval, igfx, amd-iommu-perdev-intremap,
                 dom0-{passthrough,strict} ]
@@ -1519,7 +1520,8 @@ boolean (e.g. `iommu=no`) can override this and leave the IOMMUs disabled.
     successfully.
 
 *   The `quarantine` option can be used to control Xen's behavior when
-    de-assigning devices from guests.
+    de-assigning devices from guests.  The default behaviour is chosen at
+    compile time, and is one of `CONFIG_IOMMU_QUARANTINE_{NONE,BASIC,SCRATCH_PAGE}`.
 
     When a PCI device is assigned to an untrusted domain, it is possible
     for that domain to program the device to DMA to an arbitrary address.

base-commit: 9659b2a6d73b14620e187f9c626a09323853c459
-- 
2.30.2


