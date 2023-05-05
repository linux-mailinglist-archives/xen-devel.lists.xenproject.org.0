Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44326F8889
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 20:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530608.826349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzyJ-0002ea-BV; Fri, 05 May 2023 18:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530608.826349; Fri, 05 May 2023 18:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzyJ-0002cK-8a; Fri, 05 May 2023 18:15:59 +0000
Received: by outflank-mailman (input) for mailman id 530608;
 Fri, 05 May 2023 18:15:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XVLi=A2=citrix.com=prvs=4822586d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puzyH-0002Jh-C3
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 18:15:57 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df830fc7-eb70-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 20:15:55 +0200 (CEST)
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
X-Inumbo-ID: df830fc7-eb70-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683310555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E0aZkvgxxKojXoFk3hMdpQ/EPEKioiMdFoNuS2VCJ6c=;
  b=YHf2gqZXFdDXCTIqNXC/4ekQw7m2RQOlKA+xP9j1S14KCz1o/n7n4Mia
   RF0ep75VvHlczBPadilQAVvLUanwnWaZPTOIKkV6F8S2/9DHxGLHyH5+o
   ZRBfuvXER0GZwusYp/UJ8HmJk99owbMWo/TuNmQS0/eEse2FPruhayR3+
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110484431
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:lwgeXqKav5MbL6mWFE+RyJUlxSXFcZb7ZxGr2PjKsXjdYENS0GYHy
 DEWWGnUa/2MN2Okctl/OYi1pBxQv8KAmoMwTwtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wRjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c56JT9Q0
 qEyNAwwTRaBjNy4kZWETuxV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJ0JzhrE/
 TuuE2LRXCEVL+y6khO+ymu3gsXSjCjYV8FJLejtnhJtqALKnTFCYPEMbnOguuWwgEO6X9NZK
 mQX9zAooKx081akJvHiWzWorXjCuQQTM/JSDuk75Qel2qfSpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kOYgnnF4g5VvTv15usRG+2m
 mrRxMQju1kNpcMvibucoHrbvw+PoJrCcABkwTrTW1vwu2uVe7WZi5yUBUnztKgQd9zEHwDY4
 xDoiODFsrlQUMjleDilBbxUQer3v6vt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2GZUZ5CIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8fAK5zyUS9LUf84pNZTe9rxLJdxnnxurY8tbcmTI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDjoH
 yJkH5LSkX13CbSuChQ7BKZPdTjm21BnX8GpwyGWH8bfSjdb9JYJUaaAm+9/I9A5zsy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:7VfDn6gLuWahrjDjHmeJ6yK0aXBQXioji2hC6mlwRA09TyX5ra
 2TdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKF+Vzd8kXFndK1vp
 0QEZSWZueRMbEAt7ec3OG5eexQvOVu8sqT9JjjJ6EGd3AVV0lihT0JezpyCidNNW977QJSLu
 vn2iJAzQDQAEg/X4CAKVQuefPMnNHPnIKOW296O/Z2gDP+9Q9B8dTBYmOl4is=
X-Talos-CUID: =?us-ascii?q?9a23=3AS+gvzWrnMFi8+sXQzgQT8BXmUc0BLGP6kV3MH3K?=
 =?us-ascii?q?bD2RidrPEbmCU/Zoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AQuCpGAxDjWEA7q8buBmhWg+dl6yaqPqeB1s9tM4?=
 =?us-ascii?q?vgPGdLihaJiaWrzv0GbZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="110484431"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH v2 1/2] LICENSES: Improve the legibility of these files
Date: Fri, 5 May 2023 19:15:27 +0100
Message-ID: <20230505181528.3587485-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505181528.3587485-1-andrew.cooper3@citrix.com>
References: <20230505181528.3587485-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

A few newlines go a very long way.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 LICENSES/BSD-2-Clause       | 4 ++++
 LICENSES/BSD-3-Clause       | 4 ++++
 LICENSES/BSD-3-Clause-Clear | 4 ++++
 LICENSES/CC-BY-4.0          | 5 +++++
 LICENSES/GPL-2.0            | 6 ++++++
 LICENSES/LGPL-2.0           | 6 ++++++
 LICENSES/LGPL-2.1           | 6 ++++++
 LICENSES/MIT                | 4 ++++
 8 files changed, 39 insertions(+)

diff --git a/LICENSES/BSD-2-Clause b/LICENSES/BSD-2-Clause
index da366e2ce50b..694d8c93221c 100644
--- a/LICENSES/BSD-2-Clause
+++ b/LICENSES/BSD-2-Clause
@@ -1,10 +1,14 @@
 Valid-License-Identifier: BSD-2-Clause
+
 SPDX-URL: https://spdx.org/licenses/BSD-2-Clause.html
+
 Usage-Guide:
+
   To use the BSD 2-clause "Simplified" License put the following SPDX
   tag/value pair into a comment according to the placement guidelines in
   the licensing rules documentation:
     SPDX-License-Identifier: BSD-2-Clause
+
 License-Text:
 
 Copyright (c) <year> <owner> . All rights reserved.
diff --git a/LICENSES/BSD-3-Clause b/LICENSES/BSD-3-Clause
index 34c7f057c8d5..1441947f92e0 100644
--- a/LICENSES/BSD-3-Clause
+++ b/LICENSES/BSD-3-Clause
@@ -1,10 +1,14 @@
 Valid-License-Identifier: BSD-3-Clause
+
 SPDX-URL: https://spdx.org/licenses/BSD-3-Clause.html
+
 Usage-Guide:
+
   To use the BSD 3-clause "New" or "Revised" License put the following SPDX
   tag/value pair into a comment according to the placement guidelines in
   the licensing rules documentation:
     SPDX-License-Identifier: BSD-3-Clause
+
 License-Text:
 
 Copyright (c) <year> <owner> . All rights reserved.
diff --git a/LICENSES/BSD-3-Clause-Clear b/LICENSES/BSD-3-Clause-Clear
index e53b56092b90..2b27f24a65a0 100644
--- a/LICENSES/BSD-3-Clause-Clear
+++ b/LICENSES/BSD-3-Clause-Clear
@@ -1,10 +1,14 @@
 Valid-License-Identifier: BSD-3-Clause-Clear
+
 SPDX-URL: https://spdx.org/licenses/BSD-3-Clause-Clear.html
+
 Usage-Guide:
+
   To use the BSD 3-clause "Clear" License put the following SPDX
   tag/value pair into a comment according to the placement guidelines in
   the licensing rules documentation:
     SPDX-License-Identifier: BSD-3-Clause-Clear
+
 License-Text:
 
 The Clear BSD License
diff --git a/LICENSES/CC-BY-4.0 b/LICENSES/CC-BY-4.0
index 27dfefa95ccf..4197ceb180ff 100644
--- a/LICENSES/CC-BY-4.0
+++ b/LICENSES/CC-BY-4.0
@@ -1,15 +1,20 @@
 Valid-License-Identifier: CC-BY-4.0
+
 SPDX-URL: https://spdx.org/licenses/CC-BY-4.0
+
 Usage-Guide:
+
   Do NOT use this license for code, but it's acceptable for content like artwork
   or documentation. When using it for the latter, it's best to use it together
   with a GPL2 compatible license using "OR", as CC-BY-4.0 texts processed by
   the kernel's build system might combine it with content taken from more
   restrictive licenses.
+
   To use the Creative Commons Attribution 4.0 International license put
   the following SPDX tag/value pair into a comment according to the
   placement guidelines in the licensing rules documentation:
     SPDX-License-Identifier: CC-BY-4.0
+
 License-Text:
 
 Creative Commons Attribution 4.0 International
diff --git a/LICENSES/GPL-2.0 b/LICENSES/GPL-2.0
index 9f09528a8bce..fa5c66236fe9 100644
--- a/LICENSES/GPL-2.0
+++ b/LICENSES/GPL-2.0
@@ -2,19 +2,25 @@ Valid-License-Identifier: GPL-2.0
 Valid-License-Identifier: GPL-2.0-only
 Valid-License-Identifier: GPL-2.0+
 Valid-License-Identifier: GPL-2.0-or-later
+
 SPDX-URL: https://spdx.org/licenses/GPL-2.0.html
+
 Usage-Guide:
+
   To use this license in source code, put one of the following SPDX
   tag/value pairs into a comment according to the placement
   guidelines in the licensing rules documentation.
+
   For 'GNU General Public License (GPL) version 2 only' use:
     SPDX-License-Identifier: GPL-2.0-only
   or (now deprecated)
     SPDX-License-Identifier: GPL-2.0
+
   For 'GNU General Public License (GPL) version 2 or any later version' use:
     SPDX-License-Identifier: GPL-2.0+
   or
     SPDX-License-Identifier: GPL-2.0-or-later
+
 License-Text:
 
 		    GNU GENERAL PUBLIC LICENSE
diff --git a/LICENSES/LGPL-2.0 b/LICENSES/LGPL-2.0
index 957d798fe037..2fa16d72eabf 100644
--- a/LICENSES/LGPL-2.0
+++ b/LICENSES/LGPL-2.0
@@ -1,15 +1,21 @@
 Valid-License-Identifier: LGPL-2.0
 Valid-License-Identifier: LGPL-2.0+
+
 SPDX-URL: https://spdx.org/licenses/LGPL-2.0.html
+
 Usage-Guide:
+
   To use this license in source code, put one of the following SPDX
   tag/value pairs into a comment according to the placement
   guidelines in the licensing rules documentation.
+
   For 'GNU Library General Public License (LGPL) version 2.0 only' use:
     SPDX-License-Identifier: LGPL-2.0
+
   For 'GNU Library General Public License (LGPL) version 2.0 or any later
   version' use:
     SPDX-License-Identifier: LGPL-2.0+
+
 License-Text:
 
 GNU LIBRARY GENERAL PUBLIC LICENSE
diff --git a/LICENSES/LGPL-2.1 b/LICENSES/LGPL-2.1
index 27bb4342a3e8..b366c7e49199 100644
--- a/LICENSES/LGPL-2.1
+++ b/LICENSES/LGPL-2.1
@@ -1,15 +1,21 @@
 Valid-License-Identifier: LGPL-2.1
 Valid-License-Identifier: LGPL-2.1+
+
 SPDX-URL: https://spdx.org/licenses/LGPL-2.1.html
+
 Usage-Guide:
+
   To use this license in source code, put one of the following SPDX
   tag/value pairs into a comment according to the placement
   guidelines in the licensing rules documentation.
+
   For 'GNU Lesser General Public License (LGPL) version 2.1 only' use:
     SPDX-License-Identifier: LGPL-2.1
+
   For 'GNU Lesser General Public License (LGPL) version 2.1 or any later
   version' use:
     SPDX-License-Identifier: LGPL-2.1+
+
 License-Text:
 
 GNU LESSER GENERAL PUBLIC LICENSE
diff --git a/LICENSES/MIT b/LICENSES/MIT
index f33a68ceb3ea..eba1549f93e4 100644
--- a/LICENSES/MIT
+++ b/LICENSES/MIT
@@ -1,10 +1,14 @@
 Valid-License-Identifier: MIT
+
 SPDX-URL: https://spdx.org/licenses/MIT.html
+
 Usage-Guide:
+
   To use the MIT License put the following SPDX tag/value pair into a
   comment according to the placement guidelines in the licensing rules
   documentation:
     SPDX-License-Identifier: MIT
+
 License-Text:
 
 MIT License
-- 
2.30.2


