Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFF67E59FE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 16:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629318.981452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0kT7-00023j-8m; Wed, 08 Nov 2023 15:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629318.981452; Wed, 08 Nov 2023 15:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0kT7-00021u-4W; Wed, 08 Nov 2023 15:27:49 +0000
Received: by outflank-mailman (input) for mailman id 629318;
 Wed, 08 Nov 2023 15:27:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L2E1=GV=citrix.com=prvs=669c226bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r0kT5-0001ly-Rz
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 15:27:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ddab65b-7e4b-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 16:27:47 +0100 (CET)
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
X-Inumbo-ID: 5ddab65b-7e4b-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1699457267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U47fe4dzuabd1XFgAOtn7u1DE8NYVen41zChGJGziKI=;
  b=PBzF73DXN34vnYPjlJOfF/Ze+Sn5Gt+L75REOpo9XIxFDNwtisMI6eqY
   Xn8qF1yoaVbxiUnKPXj20c/KQi3+H5jVT7hWCJD7y3ljQpBu3cKhkxsKH
   Gvl2SUUctACm1NDG3Bcuw4ziefjYy2cM12nUNcSsgwTzAlw53pzIlClxk
   4=;
X-CSE-ConnectionGUID: O7ec57rRToercaUqjXa8Kg==
X-CSE-MsgGUID: 0iuvoY++SsqqxftDbraSTQ==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127132502
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ZEL4CaIDtQYfU0cLFE+R6pUlxSXFcZb7ZxGr2PjKsXjdYENS1TJUy
 DMWCjiBOqqIMGametB2bt7k8EkOuZXRnN9kGgtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5wRuPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5QXmxFq
 KMCEgwKYwqIjt+vwoKyGspj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGspM0yojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQGpwOxBvA/
 Aoq+UyhAwwEM+3cigGe62u8iPPjlznyY74rQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkTgxTVX5BcGai6ptTvHHf7x
 DXikcQlr+xN14hRjfz9pA2WxW30znTUcuIrziKIU2n4sRlDWImofYeh1EHZ3f8QD4nMGzFto
 0M4d9iiAPEmVM/cxXDUHb1RTdlF9N7fbmeA3wQH840JsmT1oSD+J+i89RknfB8xWvvobwMFd
 6M6Vel5z5hJNX/iVrdtYoS+EKzGJoC7Toy6D5g4gjdUC6WdlTNrHwk0PiZ8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlglDKIFcqjn0v6i+X2iJuppVAtaQTmUwzExPrZ+1u9H
 yh3bKNmNCmzoMWhO3KKoOb/3HgBLGQhBICeliCkXrfrH+aSI0l4U6W56ep4K+RYc1F9yr+gE
 oeVBhUJlzISRBTvdW23V5yUQOq1As8h9CxkYHdE0JTB8yFLXLtDJZw3L/MfFYTLPsQ5pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:CS1+y6jqBP8XyE0BVh+KQrXs53BQX8d23DAbv31ZSRFFG/FwyP
 rDoB1L73LJYWgqMk3IwerwQZVoMkmsjaKdgLNhdItKOTOM11dAQ7sSiLcKrwePJ8S6zJ866U
 4CSdk3NDSTNykfsS+S2mDRLz9j+qjhzEnBv5ab854Hd2FXgtRbnmVE43GgYy5LrWd9ZKYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5nmhY/rehkPAj8g8U2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/M28ZOH8uFj+kSM3HJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1QdPhb2jf0RCWYsBHt0w7v3HIF8Hn502KVhnPlvIjQWC86I9Apv/MVTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uPp2Y4m+J7tQ0SbWJeUs4fkWUsxjIVLH4yJlO71GnhKp
 gsMCjo3ocZTbpdVQGagoAg+q3oYp15JGb8fqFLgL3u79EepgEE86MVqfZv40so5dYzTYJJ6P
 /DNbktnLZSTtUOZaY4H+sZR9CrY1a9NS4kHVjiU2gPLpt3Tk7lutry+vE49euqcJsHwN87n4
 nASkpRsSo3d1j1AcOD0ZVX+lSVKV/NKwjF24Vb/dx0q7f8TL3kPWmKT00vidKpp7EaDtfAU/
 i+NZpKC7voLHfoG4xOwwriMqMiXkU2QYkQoJI2SliOqsXEJsnjsfHaau/aIP73HTMtSgrEcw
 g+tfjIVbV9B2yQKw7FaULqKgzQk2TEjOxNLJQ=
X-Talos-CUID: =?us-ascii?q?9a23=3AH/swPmk5vMOlI+OWDsMy0bAl2WTXOVqCwXyNfFW?=
 =?us-ascii?q?CNWFkUracdEaSyKo0sMU7zg=3D=3D?=
X-Talos-MUID: 9a23:8voECgWPTi9aDWfq/GftmS9lBYQr2L+3EVADjbkMocC/CRUlbg==
X-IronPort-AV: E=Sophos;i="6.03,286,1694750400"; 
   d="scan'208";a="127132502"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18 3/3] docs/sphinx: Fix indexing
Date: Wed, 8 Nov 2023 15:27:27 +0000
Message-ID: <20231108152727.58764-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231108152727.58764-1-andrew.cooper3@citrix.com>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

sphinx-build reports:

  docs/designs/launch/hyperlaunch.rst: WARNING: document isn't included in any toctree
  docs/designs/launch/hyperlaunch-devicetree.rst: WARNING: document isn't included in any toctree
  docs/misc/xen-makefiles/makefiles.rst: WARNING: document isn't included in any toctree
  docs/misra/C-language-toolchain.rst: WARNING: document isn't included in any toctree
  docs/misra/C-runtime-failures.rst: WARNING: document isn't included in any toctree
  docs/misra/documenting-violations.rst: WARNING: document isn't included in any toctree
  docs/misra/exclude-list.rst: WARNING: document isn't included in any toctree
  docs/misra/xen-static-analysis.rst: WARNING: document isn't included in any toctree

Create an up-to-date index.rst in misra/ create an "unsorted docs" section at
the top level to contain everything else.  They can be re-filed at a later
date.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>
---
 docs/index.rst       | 13 +++++++------
 docs/misra/index.rst | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+), 6 deletions(-)
 create mode 100644 docs/misra/index.rst

diff --git a/docs/index.rst b/docs/index.rst
index f3f779f89ce5..22fdde80590c 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -53,17 +53,18 @@ kind of development environment.
    hypervisor-guide/index
 
 
-MISRA C coding guidelines
--------------------------
+Unsorted documents
+------------------
 
-MISRA C rules and directive to be used as coding guidelines when writing
-Xen hypervisor code.
+Documents in need of some rearranging.
 
 .. toctree::
    :maxdepth: 2
 
-   misra/rules
-   misra/deviations
+   designs/launch/hyperlaunch
+   designs/launch/hyperlaunch-devicetree
+   misc/xen-makefiles/makefiles
+   misra/index
 
 
 Miscellanea
diff --git a/docs/misra/index.rst b/docs/misra/index.rst
new file mode 100644
index 000000000000..c59730c46d88
--- /dev/null
+++ b/docs/misra/index.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+MISRA C coding guidelines
+=========================
+
+MISRA C rules and directive to be used as coding guidelines when writing
+Xen hypervisor code.
+
+.. toctree::
+   :maxdepth: 2
+
+   rules
+   deviations
+   C-language-toolchain
+   C-runtime-failures
+   documenting-violations
+   exclude-list
+   xen-static-analysis
-- 
2.30.2


