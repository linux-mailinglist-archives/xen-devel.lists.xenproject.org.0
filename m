Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7D754B5E6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 18:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349232.575449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o19Jz-0003N5-Qj; Tue, 14 Jun 2022 16:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349232.575449; Tue, 14 Jun 2022 16:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o19Jz-0003L9-Lr; Tue, 14 Jun 2022 16:23:15 +0000
Received: by outflank-mailman (input) for mailman id 349232;
 Tue, 14 Jun 2022 16:23:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cShD=WV=citrix.com=prvs=157bf7d09=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o19Jy-0002Ro-Gl
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 16:23:14 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 497f4024-ebfe-11ec-a26a-b96bd03d9e80;
 Tue, 14 Jun 2022 18:23:13 +0200 (CEST)
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
X-Inumbo-ID: 497f4024-ebfe-11ec-a26a-b96bd03d9e80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655223793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9MlmA0ylP6rG0RiM/rbCen5PZYrP6dJUfb3R+KkbnFk=;
  b=UGh32qkUesmrdcOVwJOrEMapL11c8pHSR028XetLQnrf7zZGCjzdqQJY
   ZwhkkLw920G1/RbKd9HnJh3q2gCXoIvMh7GE61C/xlJRKc/5dlYpAZNWA
   R32vG2X9YzBDiqIvNsa5QRMWoF13Sc8s4kA3ZE31j7A5905nzSvt0Rgra
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 76142780
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:97t6kqijQ9I5jJ+PddKsB0HXX161GRAKZh0ujC45NGQN5FlHY01je
 htvCG3SPPnfYWH8Lop/YY+29x8E7MPRz9FgQVFkrXoyRX4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVrR4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTUwYrb9wN0RaRxVAQEiZYxKw4fVGXfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xNmQ2ME6fM0Un1lE/F4IflsaZrSjEdzxDgnDNoo1m/0PO9VkkuFTqGIWMIYHbLSlPpW6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvkXKoCGbv+8eRl6HWR22gSBRs+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8nyruIhlNFGM4YCIWbVddwtXYmJMLgUeaJjp8K5JZnuEZCBmpn
 W3X9nFh3etP5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSbzMfItPN/rVJxCIU3c+TPNB5jpgidmOMAtJGdrAgk1DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxa8dZCfM9EieVD7nlnnQv7HMmnpzz6gOH2TCPEFt843K6mM7lRAFWs+12Fr
 b6y9qKiln1ibQEJSnKLqdJLdAlRfSdT6FKfg5U/S9Nv6zFOQAkJY8I9C5t7E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:DxzUU6H8GtAsNQvSpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.91,300,1647316800"; 
   d="scan'208";a="76142780"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 3/4] build: set PERL
Date: Tue, 14 Jun 2022 17:22:47 +0100
Message-ID: <20220614162248.40278-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614162248.40278-1-anthony.perard@citrix.com>
References: <20220614162248.40278-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to use it in a moment.

Also update README about Perl requirement.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - update ./README

 xen/Makefile | 1 +
 README       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/Makefile b/xen/Makefile
index 82f5310b12..a6650a2acc 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -22,6 +22,7 @@ PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null)
 export PYTHON		?= $(PYTHON_INTERPRETER)
 
 export CHECKPOLICY	?= checkpolicy
+export PERL		?= perl
 
 $(if $(filter __%, $(MAKECMDGOALS)), \
     $(error targets prefixed with '__' are only for internal use))
diff --git a/README b/README
index 5e55047ffd..c1c18de7e0 100644
--- a/README
+++ b/README
@@ -64,6 +64,7 @@ provided by your OS distributor:
     * iproute package (/sbin/ip)
     * GNU bison and GNU flex
     * ACPI ASL compiler (iasl)
+    * Perl
 
 In addition to the above there are a number of optional build
 prerequisites. Omitting these will cause the related features to be
-- 
Anthony PERARD


