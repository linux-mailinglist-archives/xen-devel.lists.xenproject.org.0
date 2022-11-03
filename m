Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32757617BF0
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436396.690526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYmE-0003DC-S5; Thu, 03 Nov 2022 11:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436396.690526; Thu, 03 Nov 2022 11:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYmE-0003Ai-Nz; Thu, 03 Nov 2022 11:52:54 +0000
Received: by outflank-mailman (input) for mailman id 436396;
 Thu, 03 Nov 2022 11:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glJU=3D=citrix.com=prvs=299622fb7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqYmC-00016T-W4
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:52:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a6def8a-5b6e-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 12:52:51 +0100 (CET)
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
X-Inumbo-ID: 0a6def8a-5b6e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667476371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mk0ItgibVfLUgrlbVRLDfctz2qQER5glO6g98oh7u4s=;
  b=Ioqa121hyfLBf5NJeXGcmgih5PNRUYiZ0BAqXrnsB75o5A7V2ZWp2zc7
   /dkS6RaVXwGQmnJmE4tWNv08cD3RUOHQLSnTc14angcXxf5po5BUz33nj
   OeuHeOvKhbB4n62mLRtJymcEozcZGaqeopIE6+AHkAx3RmhNTNJfWWY0n
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83691397
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jTkLwaLd2pVy8aJ4FE+RHJUlxSXFcZb7ZxGr2PjKsXjdYENS1GFUz
 GAZDT3Xa/uCZmWmct9xaN++90tX7cLcm9IxGlRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5wRlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5LLiJc2
 MREGQpWTS+IgMmZwLWeeNJj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozRG5QMxRfHz
 o7A13jpBksXP/Kk8yPb61Wrt97gw3P9So1HQdVU8dY12QbOlwT/EiY+dVa9u+j/tUe4VPpWM
 UlS8S0rxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4EfA+6QyL4rrZ5UCeHGdsZiFFQMwrsokxXzNC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 Fi3QDMW3utJy5RRjuPioA6B02nESoX1ohAd2iqUTE+dsjJDP62abIuDxljcyMR7I9PMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONl1HszDaJz9zq3+KTJrU3YE
 c7CGftA9V5AVcxaIMOeHo/xK4MDyCEk3n/0Tpvm1Rmh2rf2TCfLF+hZaQfXNb1jsvzsTODpH
 zF3bpXi9vmieLemPnm/HXA7cDjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9UNokihrc+Rp
 ynVZ6Ot4ACg7ZExAVnVNysLhXKGdcoXkE/XygR2bQ70hSB4P9rwhErdHrNuFYQaGCVY5aYcZ
 5E4lw+oW5yjlhyvF+whUKTA
IronPort-HdrOrdr: A9a23:rjMKGK0D2ieGtnFcOr10qgqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV+6faUskd2ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfBEWndQ96U
 4PScdD4aXLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.95,235,1661832000"; 
   d="scan'208";a="83691397"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: [XEN PATCH for-4.17 v2 5/6] Rework COPYING installed in /usr/include/xen/, due to several licences
Date: Thu, 3 Nov 2022 11:52:03 +0000
Message-ID: <20221103115204.49610-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221103115204.49610-1-anthony.perard@citrix.com>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The notice in the COPYING file in "xen/include/public/COPYING" doesn't
really apply to the files that ultimately are been install at
"/usr/include/xen". The issue are headers in the "sys/" subdirectory
that comes from other projects such as Linux or FreeBSD.

The main issue is that there are two headers that have a different
licence than the MIT licence:

- xen-sys/Linux/gntalloc.h (installed as "sys/gntalloc.h") is public
  domain.
- xen-sys/FreeBSD/gntdev.h (installed as "sys/gntdev.h") is BSD-2.

To clarify this, we'll install a COPYING file with a different notice.

Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - change notice to be more generic and allow more headers and more
      licence exception without having to rewrite the notice.

 tools/include/Makefile    |  1 -
 tools/include/xen/COPYING | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 tools/include/xen/COPYING

diff --git a/tools/include/Makefile b/tools/include/Makefile
index 81c3d09039..f838171e8c 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -24,7 +24,6 @@ xen-foreign:
 xen-dir:
 	mkdir -p xen/libelf acpi
 	find xen/ acpi/ -type l -exec rm '{}' +
-	ln -s $(XEN_ROOT)/xen/include/public/COPYING xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*.h xen/
 	ln -s $(XEN_ROOT)/xen/include/public/*/ xen/
 	ln -s ../xen-sys/$(XEN_OS) xen/sys
diff --git a/tools/include/xen/COPYING b/tools/include/xen/COPYING
new file mode 100644
index 0000000000..fe3f9b7557
--- /dev/null
+++ b/tools/include/xen/COPYING
@@ -0,0 +1,26 @@
+XEN NOTICE
+==========
+
+This licence applies to all files within this subdirectory ("/usr/include/xen")
+with the exception of "sys/" which may include headers under different
+licences.
+
+=====================================================================
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to
+deal in the Software without restriction, including without limitation the
+rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+sell copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+DEALINGS IN THE SOFTWARE.
-- 
Anthony PERARD


