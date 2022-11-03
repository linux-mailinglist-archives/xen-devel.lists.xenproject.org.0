Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DA3617BEE
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:52:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436389.690505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYm0-0001zo-2H; Thu, 03 Nov 2022 11:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436389.690505; Thu, 03 Nov 2022 11:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYlz-0001xU-Tv; Thu, 03 Nov 2022 11:52:39 +0000
Received: by outflank-mailman (input) for mailman id 436389;
 Thu, 03 Nov 2022 11:52:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glJU=3D=citrix.com=prvs=299622fb7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqYly-0001eL-F2
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:52:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02192e2f-5b6e-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 12:52:37 +0100 (CET)
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
X-Inumbo-ID: 02192e2f-5b6e-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667476357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BH7twRAUiMUydBZO/gMO5ZlXmj/1kHRKCl6OFwwuGo4=;
  b=GM4DdemX+/3OmS9drU8MHzBwrDUfsKtcC2FfJyIRksfAJhA2LUXRF+m8
   px9Q+MClUjT5nPL6nSE6Gx0cMYRNvbR44dUYhSyQu1CNIPYqemtN4idbs
   g22OD+rpS1uaaxLx0PzqrrQuJoeClZLBgQ8ZQq3D44gbqscQlhwxGJDsC
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 84512859
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VOhq263bOAfYPgR0JfbD5R5xkn2cJEfYwER7XKvMYLTBsI5bpzQGy
 WZNX2rTOPqONDH0L49+Otiy90kOscDTzIQ2SQE/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wVmPqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfXHFkq
 /g0AT83QhmFh+Pt66K7dMM1r5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TaGZgMxBbF9
 woq+UyjBRURC8aW1gaqrHmMns/KnSOqCII7QejQGvlC3wTImz175ActfVmmpfi0jGauVtQZL
 FYbkgIsp6Uv8E2gTvHmQga15nWDu3Y0e9dWCfx81wiLxYLd+QPfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaETcRBX8PY2kDVwRty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ikcQlr+xN14hRjfz9pA2ZxWL3znTUcuIrzljHdDyhwip2XqKsYYypsnPL7chqda/MGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUxRsd8rlxB71bmJNkNu28meC+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHgk0OCZ8PEi3yiDAdJ3T3
 r/CKK6R4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+labALSN7tktv3byOkwz
 zq4H5LUoyizrcWkOnWHmWLtBQ1iwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ895m5Ytzgp
 yjlMnK0PXKl2hUr3y3WNS04AF4uNL4jxU8G0dsEZwbwhyZ7Otjzs8/ytfIfJNEayQCq9tYsJ
 9FtRilKKq0npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:Dnlafa0BB8cLsyPYVg+hmQqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.95,235,1661832000"; 
   d="scan'208";a="84512859"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: [XEN PATCH for-4.17 v2 3/6] tools/include/xen-foreign: Add SPDX identifier to generated headers
Date: Thu, 3 Nov 2022 11:52:01 +0000
Message-ID: <20221103115204.49610-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221103115204.49610-1-anthony.perard@citrix.com>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The headers install in "/usr/include/xen/foreign/" are missing a
licence header. This patch adds a SPDX identifier to clarify that
the MIT licence is used.

The script now check that the licence of the input file is also MIT,
by checking for the presence of the SPDX identifier.

Also add information about which files are used to generate the
headers.

Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - Add a SPDX identifier instead of trying to capture the original
      licence text.
    - Check the SPDX identifier of the input headers.
    - Add information about which headers are used as input.

 tools/include/xen-foreign/mkheader.py | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tools/include/xen-foreign/mkheader.py b/tools/include/xen-foreign/mkheader.py
index fb268f0dce..ec8a321395 100644
--- a/tools/include/xen-foreign/mkheader.py
+++ b/tools/include/xen-foreign/mkheader.py
@@ -1,5 +1,6 @@
 #!/usr/bin/python
 
+from __future__ import print_function
 import sys, re;
 from structs import unions, structs, defines;
 
@@ -114,23 +115,37 @@ input  = "";
 output = "";
 fileid = re.sub("[-.]", "_", "__FOREIGN_%s__" % outfile.upper());
 
-# read input header files
 for name in infiles:
     f = open(name, "r");
+    # Check the licence of the input file, only SPDX identifier is accepted by
+    # this script.
+    line = f.readline()
+    if not line == "/* SPDX-License-Identifier: MIT */\n":
+        print("%s: Error: %s is missing SPDX identifier" % (sys.argv[0], name), file=sys.stderr)
+        exit(1)
     input += f.read();
     f.close();
 
+# replace path in "infiles" by path in '/usr/include' to avoid exposing the
+# build directory path in the generated headers.
+headers_name_list = ""
+public_headers_location = 'xen/include/public/'
+for name in infiles:
+    i = name.rindex(public_headers_location)
+    i += len(public_headers_location)
+    headers_name_list += " xen/%s" % (name[i:])
+
 # add header
-output += """
+output += """/* SPDX-License-Identifier: MIT */
 /*
  * public xen defines and struct for %s
- * generated by %s -- DO NOT EDIT
+ * generated from%s by %s -- DO NOT EDIT
  */
 
 #ifndef %s
 #define %s 1
 
-""" % (arch, sys.argv[0], fileid, fileid)
+""" % (arch, headers_name_list, sys.argv[0], fileid, fileid)
 
 if arch in header:
     output += header[arch];
-- 
Anthony PERARD


