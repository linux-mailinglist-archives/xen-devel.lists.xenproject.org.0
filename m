Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99506161C5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 12:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435806.689623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBvq-0002Om-LN; Wed, 02 Nov 2022 11:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435806.689623; Wed, 02 Nov 2022 11:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBvq-0002Lo-GF; Wed, 02 Nov 2022 11:29:18 +0000
Received: by outflank-mailman (input) for mailman id 435806;
 Wed, 02 Nov 2022 11:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cji=3C=citrix.com=prvs=298722737=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqBvo-00021c-N6
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 11:29:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 944c0787-5aa1-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 12:29:15 +0100 (CET)
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
X-Inumbo-ID: 944c0787-5aa1-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667388555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pr0JfmwP5/FWVhK0t5YQqcQll6KmEYKssZtRV/z9j94=;
  b=UMMiSzEnIy3yybdqtVAE/goJXOZnIS4g04N/vpLt77TZjbNKqpwlKJBf
   8W82RDZira55YRqW1wvl35l+m5V4pt0/d8k+IYJeGlfT5dko6oqgwz2ed
   0ErxmmXiJ9VvmOmbLrBB1CeeZqSpZgVT1iIgPAw4rBa59MDS7CdaTu3Pv
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 84016409
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aRFRLKC8Hj8+IhVW/+Tjw5YqxClBgxIJ4kV8jS/XYbTApD9xhDIHz
 GMXWGjQOK3eZTP8fd93Yd7n8x5XucKHmIVlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WpA5ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxeV7OERI2
 sUjDTkOLUzSgumcwZicVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKFJoTTG5kNzy50o
 Ere43TYBSwYGuW11GGOyTGMmevJtzH0Ddd6+LqQqacx3Qz7KnYoIB8LUVq2p9Gph0j4XMhQQ
 2QP4TYnp6U28E2tT/H+Uge+rXrCuQQTM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313peZqymjfxccK2AqbDUBCwAC5rHLoos+kxbORdZLC7Oug5v+HjSY/
 tyRhHFg3fNJ15dNjvjluwCc696xmnTXZjE26jzyWE2c1SZwZ835Nomjw1nxyukVee51UWK9l
 HQDnsGf6sUHApeMiDGBTY0xIV252xqWGGaC2AAyRvHN4xzooif+Jt4IvFmSMW8zaq45lSnVj
 Fg/UO+7zLtaJzOUYKB+eOpd4Ox6nPG7RbwJuh05B+eig6SdlifdokmChmbKhQgBdXTAdolmY
 P+mnT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiDKEu1abwPfP7llhE9hnOky2
 48BX/ZmNj0FCLGuCsUp2dN7wa82wYgTWsmt9p0/mh+rKQt6AmAxY8I9Mpt4E7GJa599z76Ql
 kxRr2cClzITc1WbdljRAp2iAZuzNatCQYUTZHJybQ3wiyl9P+5CLs43LvMKQFXuz8Q7pdYcc
 hXPU5zo7ihnItgfxwkgUA==
IronPort-HdrOrdr: A9a23:Nf8BuKhH4RKMi8ondNUPty3BtXBQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.95,232,1661832000"; 
   d="scan'208";a="84016409"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: [XEN PATCH for-4.17 2/4] tools/include/xen-foreign: Capture licences from the input headers
Date: Wed, 2 Nov 2022 11:28:52 +0000
Message-ID: <20221102112854.49020-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221102112854.49020-1-anthony.perard@citrix.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The headers install in "/usr/include/xen/foreign/" are missing a
licence.

While we could probably just add the MIT licence to the generated
file, this patch instead try to grab the licence from the original
input file.

Since licences are in the first multiline C comments, we just look for
that. Also with this patch, the possible licences will not be in the
"input" variable anymore, but it should be unnecessary to generate the
foreign header.

With this change, the licence will be copied 2 or 3 time in the
install headers depending on the number of input headers.

Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    Maybe instead of this, we should just stamp this on the generated header
        /* SPDX-License-Identifier: MIT */
    
    but we would be missing the "Copyright" informations. I guess we could
    look for those line with Copyright and copy them.
    
    Or, we could replace the licence in the input header by a SPDX and have
    the script parse that. (Probably still need to grab the Copyright lines)
    
    CC: Andrew Cooper <andrew.cooper3@citrix.com>
    CC: George Dunlap <george.dunlap@citrix.com>
    CC: Jan Beulich <jbeulich@suse.com>
    CC: Julien Grall <julien@xen.org>
    CC: Stefano Stabellini <sstabellini@kernel.org>
    CC: Wei Liu <wl@xen.org>

 tools/include/xen-foreign/mkheader.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/include/xen-foreign/mkheader.py b/tools/include/xen-foreign/mkheader.py
index fb268f0dce..07a9bcbd01 100644
--- a/tools/include/xen-foreign/mkheader.py
+++ b/tools/include/xen-foreign/mkheader.py
@@ -114,9 +114,19 @@ input  = "";
 output = "";
 fileid = re.sub("[-.]", "_", "__FOREIGN_%s__" % outfile.upper());
 
-# read input header files
+# Try to captures licences headers from original files.
+# heuristic: just look for the end of the first multiline comment.
+licence_headers = "";
+
 for name in infiles:
     f = open(name, "r");
+    while True:
+        line = f.readline()
+        if not line:
+            break
+        licence_headers += line
+        if line == " */\n":
+            break
     input += f.read();
     f.close();
 
@@ -126,11 +136,12 @@ output += """
  * public xen defines and struct for %s
  * generated by %s -- DO NOT EDIT
  */
+%s
 
 #ifndef %s
 #define %s 1
 
-""" % (arch, sys.argv[0], fileid, fileid)
+""" % (arch, sys.argv[0], licence_headers, fileid, fileid)
 
 if arch in header:
     output += header[arch];
-- 
Anthony PERARD


