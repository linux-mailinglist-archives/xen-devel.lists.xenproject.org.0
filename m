Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B7226C8D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 18:59:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxZ85-0003Zc-Cl; Mon, 20 Jul 2020 16:59:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jxZ83-0003ZX-Mi
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 16:59:03 +0000
X-Inumbo-ID: 4f39d1f8-caaa-11ea-9fe1-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f39d1f8-caaa-11ea-9fe1-12813bfff9fa;
 Mon, 20 Jul 2020 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595264343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CwfgH+SVS7p5qhpGDrc3g/YyX6iBPChRKZUui8AeAvo=;
 b=aPpdi1MR/XZISNACKIqMZguDGPr1GKwhtzk5Ynq8UfQq9JclKqqONTQA
 h16mGASifodnSqWubz2UpcLjmIXBF1HdiS1vSv73ZRhfJJY90EKmfSYmA
 5r55a9Au9srK+GHgFDicoMuE8cNlFc1yjQSXKzHjl+foE3RAysigEWoXv c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OAp5d3Yvfz4GcMFx61wDzJy+QB4s9MoSlndlhDqXgfPhZ2JSJSpa/+j2eBdFRIOY0tlUdpUlCa
 6EOlnhxCcFQVxjr2OWAy9/QhDJ0fuEwBTiJ2NdVcSJpwmVXkgVcIFfh4j+OEe8AyPqTqDxo5Pj
 aUgB85aEtsmJMfaeNC2dDwoqqapnUqbY3alH0yBz3LzZmvIzOjGa66p3ii4IzPh1uY/GapmRtW
 o2IHZ/6234bjgKY+IuUMhVvdX3PVcQ9It8vb2yyMcWg2lu9W0nWUrtRFDAllrpD2mcy8QtpBHZ
 qN0=
X-SBRS: 2.7
X-MesageID: 23105255
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,375,1589256000"; d="scan'208,223";a="23105255"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] docs: Replace non-UTF-8 character in hypfs-paths.pandoc
Date: Mon, 20 Jul 2020 17:58:33 +0100
Message-ID: <20200720165833.14209-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From the docs cronjob on xenbits:

  /usr/bin/pandoc --number-sections --toc --standalone misc/hypfs-paths.pandoc --output html/misc/hypfs-paths.html
  pandoc: Cannot decode byte '\x92': Data.Text.Internal.Encoding.decodeUtf8: Invalid UTF-8 stream
  make: *** [Makefile:236: html/misc/hypfs-paths.html] Error 1

Fixes: 5a4a411bde4 ("docs: specify stability of hypfs path documentation")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 docs/misc/hypfs-paths.pandoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index 81d70bb80c..dddb592bc5 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -74,7 +74,7 @@ you write finds a path present, it can rely on behavior in future versions of
 the hypervisors, and in different configurations.  Specifically:
 
 1. Conditions under which paths are used may be extended, restricted, or
-   removed.  For example, a path that’s always available only on ARM systems
+   removed.  For example, a path that's always available only on ARM systems
    may become available on x86; or a path available on both systems may be
    restricted to only appearing on ARM systems.  Paths may also disappear
    entirely.
-- 
2.11.0


