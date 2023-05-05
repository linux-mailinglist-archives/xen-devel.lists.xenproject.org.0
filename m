Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FA06F8372
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 15:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530327.825881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puv84-00046S-C4; Fri, 05 May 2023 13:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530327.825881; Fri, 05 May 2023 13:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puv84-00043P-83; Fri, 05 May 2023 13:05:44 +0000
Received: by outflank-mailman (input) for mailman id 530327;
 Fri, 05 May 2023 13:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XVLi=A2=citrix.com=prvs=4822586d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puv82-0003zO-OD
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 13:05:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 899ce7c8-eb45-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 15:05:41 +0200 (CEST)
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
X-Inumbo-ID: 899ce7c8-eb45-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683291942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4e+XjBWakkBin20cYWqiIerVP51elQbRzoIyhzyYm2o=;
  b=hakdqJd5ugNOJu+NI7hp7CCMJakGJ0XOh85aSLQzHfY/zjepDZYtQOBI
   7ImEGnMgX8DCY90zs1SyY0+WccGI5EIis5aMRAc1cl/1eLZXZZCz00svK
   Hy+1byRfDqR/cxXUhMmjfGg47QOBjDx8KLLlmJT/16U3A32jNCC2eG/dL
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108401386
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:3NIipq9xDPUPxShaHkxMDrUDmX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GEfXjyOaKvbYjenKNgiaIiypEhU7Z+Ax4RrGQRo+Cg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKgW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl3z
 tIheWwEbSrEpNOO6oK3dvlPq8EseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxhbE/
 judrzqR7hcyFNCWwjO6/VCW1tTCw33LcoMqReyz36s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqC8p+EoDX0PjIaRUcAeCsFQA0t89Tl5oYpgXryos1LSfDvyIevQHepn
 m7M9XJl71kOsSIV/5yA02mW3zuvnN/qfzYf1gnrTkGI6wwsMeZJeLeUBUjnAedoddjJFQPc7
 SFdxKBy/8hVU8jTyXXlrPElWejwuq3baGC0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5ycCl/KI+SzNDKy8Uza3SsEZmPW71C9vf1WM+GvmjVIhl6oyU
 b/CL5b3VyxEVf02lGHpLwv47YLHOwhknT+DLXwF503PPUWiiI69Fu5ebQrmghER56KYugTFm
 +ti2z+x40wHCoXWO3CHmbP/2HhWdRDX87iq8Z0IHgNCSyI6cFwc5wj5nep9J9c/wPsIxo8lP
 BiVAydl9bY2vlWfQS3iV5ypQOqHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:oVL1Eq+3qKMuWJ8BjdJuk+DfI+orL9Y04lQ7vn2ZKCYlFPBw8v
 rF8cjzuiWUtN98YhEdcKm7VpVoIkmskqKdg7NhWItKNTOO0ACVxedZnOjfKlXbdxEWndQtsZ
 uIHZIOauEZ0jBB4voTh2GDYq8d/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3ARQHoHWuV73GsVFdrnZOoiJKA6IscSVPknSvZIHX?=
 =?us-ascii?q?/KldRYo2ZdU+z1aZrxp8=3D?=
X-Talos-MUID: 9a23:f41KWAsS4PDmOULOs82npD1rP85X7IaUWHsAz8s2kci8ZH17EmLI
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="108401386"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH 1/2] LICENSES: Improve the legibility of these files
Date: Fri, 5 May 2023 14:05:32 +0100
Message-ID: <20230505130533.3580545-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
References: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

A few newlines go a very long way

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
 LICENSES/GPL-2.0            | 5 +++++
 LICENSES/LGPL-2.0           | 6 ++++++
 LICENSES/LGPL-2.1           | 6 ++++++
 LICENSES/MIT                | 4 ++++
 8 files changed, 38 insertions(+)

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
index 9f09528a8bce..0022a7c17788 100644
--- a/LICENSES/GPL-2.0
+++ b/LICENSES/GPL-2.0
@@ -2,11 +2,15 @@ Valid-License-Identifier: GPL-2.0
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
@@ -15,6 +19,7 @@ Usage-Guide:
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


