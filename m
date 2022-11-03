Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5BE617BEB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:52:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436388.690494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYlx-0001j4-PO; Thu, 03 Nov 2022 11:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436388.690494; Thu, 03 Nov 2022 11:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYlx-0001fc-MI; Thu, 03 Nov 2022 11:52:37 +0000
Received: by outflank-mailman (input) for mailman id 436388;
 Thu, 03 Nov 2022 11:52:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glJU=3D=citrix.com=prvs=299622fb7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqYlw-0001eL-NA
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:52:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0062c129-5b6e-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 12:52:34 +0100 (CET)
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
X-Inumbo-ID: 0062c129-5b6e-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667476354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BNAyLUdt4UV1P3pSVrxGUK3VQpouEea1kpneLROz3mM=;
  b=P7N6vOG/M+9WaPf+VqTs2o733SFxpcdj5jedGGTm3FIeQYPY8v+1uxB5
   gdGoh+y/T92SX6q5tTo8H7aXwSmPUB75Usm/EMUegm9WXX082zstf+vkO
   o5BfenL7zBqCOvKDdp3teEZuQAymXLwDsgLCJPSJmYFJqAvPXVWCznf/U
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83691348
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ckr0r69rbsDPiKSsfzZZDrUDe36TJUtcMsCJ2f8bNWPcYEJGY0x3x
 mMeXWmDOffeNGv3fIx2Ooy/9kwGuJfRxtVkHVFr+yE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPKgQ5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklrr
 t5bdRxddSqjxMCEh5iQVvtSmd4KeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZUOwBfB/
 T6Wl4j/KhcRaOSekzWnyWC9hcCSzTOkH4gLEpTto5aGh3XMnzdOWXX6T2CTgfS/kF/4ZNtZJ
 GQd4C9opq83nGSpRNTgWxyzoFafowURHdFXFoUS1gaJzabF5heDMUINRDVBdd8Oudc/QHoh0
 Vrht9nkHyB1ubuZD3eU7K6JrCiaMDIQa2QFYEcsUg8t89Tl5oYpgXrnXttlVaK4kNDxMTXx2
 CyR6jgzga0JiswG3Ln9+krI6xquu5zIQwgd9gjRGGW/4WtRf5W5boal7Vza6/doL4uDSFSF+
 n8elKCjAPsmVM/X0nbXGaNUQe/vt63t3CDgbUBHOsIDtGmBq2WZXcNy0nZUD1t7DNkeUGq8C
 KPMgj956JhWNXqsSKZ4ZYOtFsgnpZTd+cTZuuP8NYQXPMUoHOOT1GQ3PBPLgTix+KQ5uftnU
 ap3Z/pAGprz5U5P6DOtD9kQ3rYwrszV7TOCHMurp/hLPFf3WZJ0dVvnGAHTBgzaxPneyOkwz
 zq4H5LToyizqMWkPkHqHXc7dDjm10QTC5HssNBwfeWeOAdgE2xJI6aPn+x9ItA8xPkPyLigE
 pSBtqhwkQSXuJE6AV/SNiALhE3HAP6TUk7XzQRzZA31ihDPkK6k7bsFdotfQFXU3LUL8BKAd
 NFcIp3oPxi6Ym6Yk9jrRcWi8dcKmdXCrV7mAhdJlxBlL8Y8GVSSpIO7FuYtnQFXZheKWQIFi
 +XI/mvmrVArHmyO0O6+hCqT8m6M
IronPort-HdrOrdr: A9a23:Bn/aMK+3uQ9v9Tnc+oVuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.95,235,1661832000"; 
   d="scan'208";a="83691348"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH for-4.17 v2 2/6] xen: Used SPDX identifier in some public headers
Date: Thu, 3 Nov 2022 11:52:00 +0000
Message-ID: <20221103115204.49610-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221103115204.49610-1-anthony.perard@citrix.com>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The script "tools/include/xen-foreign/mkheader.py" is going to do a
sanity check on the licences of those headers. To ease this, we will
replace the verbatim copy of the MIT licence by its SPDX identifier
equivalent.

The text of the licence has been check to be the same as the one at
https://spdx.org/licenses/MIT.html, except we don't have "(including
the next paragraph)". The text is also the same as the one in
"xen/include/public/COPYING".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - new patch

 xen/include/public/arch-arm.h            | 19 +------------------
 xen/include/public/arch-x86/xen-x86_32.h | 19 +------------------
 xen/include/public/arch-x86/xen-x86_64.h | 19 +------------------
 xen/include/public/arch-x86/xen.h        | 19 +------------------
 xen/include/public/xen.h                 | 19 +------------------
 5 files changed, 5 insertions(+), 90 deletions(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index c8b6058d3a..1528ced509 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * arch-arm.h
  *
  * Guest OS interface to ARM Xen.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright 2011 (C) Citrix Systems
  */
 
diff --git a/xen/include/public/arch-x86/xen-x86_32.h b/xen/include/public/arch-x86/xen-x86_32.h
index 19d7388633..139438e835 100644
--- a/xen/include/public/arch-x86/xen-x86_32.h
+++ b/xen/include/public/arch-x86/xen-x86_32.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * xen-x86_32.h
  *
  * Guest OS interface to x86 32-bit Xen.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2004-2007, K A Fraser
  */
 
diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
index 40aed14366..5d9035ed22 100644
--- a/xen/include/public/arch-x86/xen-x86_64.h
+++ b/xen/include/public/arch-x86/xen-x86_64.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * xen-x86_64.h
  *
  * Guest OS interface to x86 64-bit Xen.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2004-2006, K A Fraser
  */
 
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 546dd4496a..93b9d600b0 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * arch-x86/xen.h
  *
  * Guest OS interface to x86 Xen.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2004-2006, K A Fraser
  */
 
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index e373592c33..920567e006 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -1,26 +1,9 @@
+/* SPDX-License-Identifier: MIT */
 /******************************************************************************
  * xen.h
  *
  * Guest OS interface to Xen.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Copyright (c) 2004, K A Fraser
  */
 
-- 
Anthony PERARD


