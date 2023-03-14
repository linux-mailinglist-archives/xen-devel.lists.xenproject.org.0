Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ABD6B9788
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:16:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509637.785804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RY-0006pJ-KI; Tue, 14 Mar 2023 14:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509637.785804; Tue, 14 Mar 2023 14:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RY-0006mS-FO; Tue, 14 Mar 2023 14:16:00 +0000
Received: by outflank-mailman (input) for mailman id 509637;
 Tue, 14 Mar 2023 14:15:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc5RW-0004aQ-Cf
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:15:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc30a86f-c272-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 15:15:57 +0100 (CET)
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
X-Inumbo-ID: bc30a86f-c272-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678803357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RhC1mGV7dozUxwGGoY9ryBFu46grDUCVsN2pnDjVFLY=;
  b=UtsUDYG1DWZSxi8MqPKVMJGZ4R9BOM+mX9goABJdEl5Fj6fhyNofj2cZ
   Ecr13KBQjUWvL4DEBO7OSE2JkEsF2TatyyD6pFATae8LJFD3y5QHfr3um
   8FhxFB6xhsGF3JucS4VuluB7R8iKdemv4UaqFUgnHzt87SOUoFjHowiv3
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100156186
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:QqEyzqkYSeZVGGazo6LU7Ubo5gyZJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWUDuHPP7fZmryftl3aou1808A7MWBy98yGQo5qnhkFyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 acxayErNi+yvMDs+LKdd8RKgfQkLfC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/A/
 juboT2pXHn2MvSv7iqryHmggtbPlHOhXINOTZGzr9V11Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4DOkS+AyLjK3O7G6xA2EeSzdbZd8OtckoRCcr3
 FuEg9PoAzN0tLSfD3ma89+pQSiaYHZPazVYPGldEFVDuoO4yG0usv7RZo1KU7+T1uLEIhOq+
 zCskQUYgIUUjPdegs1X4mv7qz6ro5HISCs86QPWQn+p42tFWWK1W2C7wQOFtKgdde51WnHE5
 SFZwJbGsIjiGLnXzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meJ5Gu9B7cJZhNGiJObhKrgY/nGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 sfEKpzzVyxHUP0PIN+KqwA1gNcWKt0WnzuPFfgXMTz+uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75iCid+8D0GCLeWSnCOoeYuwaUicSBT6Wbe95YGKYZu42NORAkcNhMm6ehxI908z/kLy7egE
 7PUchYw9WcTTEbvcW2iAk2Popu2BcsXQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:EfCRlKoj0lwYwvoDBj85768aV5r3eYIsimQD101hICG9E/bo7P
 xG+c5x6faaslgssR0b9Oxoe5PwJU80jKQV3WBJB9eftWrdyQmVxeNZnPPfKlTbckWVygc679
 YET0EUMrLN5DZB4foSrzPIdOrIbeP3lpyAlKP19V8oZwdvcqRh5wByBkKgFFFsTgUuP+tbKH
 PZ3Ls/mwad
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100156186"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bernhard Kaindl
	<bernhard.kaindl@citrix.com>
Subject: [PATCH 7/7] tools/python: Drop shebangs from library files
Date: Tue, 14 Mar 2023 14:15:20 +0000
Message-ID: <20230314141520.3652451-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These aren't runable scripts, so shouldn't have shebangs.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/python/xen/migration/legacy.py | 1 -
 tools/python/xen/migration/libxc.py  | 1 -
 tools/python/xen/migration/libxl.py  | 1 -
 tools/python/xen/migration/public.py | 1 -
 tools/python/xen/migration/tests.py  | 1 -
 tools/python/xen/migration/verify.py | 1 -
 tools/python/xen/migration/xl.py     | 1 -
 tools/python/xen/util.py             | 1 -
 8 files changed, 8 deletions(-)

diff --git a/tools/python/xen/migration/legacy.py b/tools/python/xen/migration/legacy.py
index 6456d6157ce3..e196ca876095 100644
--- a/tools/python/xen/migration/legacy.py
+++ b/tools/python/xen/migration/legacy.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python
 # -*- coding: utf-8 -*-
 
 """
diff --git a/tools/python/xen/migration/libxc.py b/tools/python/xen/migration/libxc.py
index 9881f5ced4ea..e52e632cb106 100644
--- a/tools/python/xen/migration/libxc.py
+++ b/tools/python/xen/migration/libxc.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python
 # -*- coding: utf-8 -*-
 
 """
diff --git a/tools/python/xen/migration/libxl.py b/tools/python/xen/migration/libxl.py
index 5c4d4fe0631b..5dcb50fe0207 100644
--- a/tools/python/xen/migration/libxl.py
+++ b/tools/python/xen/migration/libxl.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python
 # -*- coding: utf-8 -*-
 
 """
diff --git a/tools/python/xen/migration/public.py b/tools/python/xen/migration/public.py
index fab2f84587b7..23183ef67db8 100644
--- a/tools/python/xen/migration/public.py
+++ b/tools/python/xen/migration/public.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python
 # -*- coding: utf-8 -*-
 
 """
diff --git a/tools/python/xen/migration/tests.py b/tools/python/xen/migration/tests.py
index f22e2c2b7cf0..fcf94b0bb264 100644
--- a/tools/python/xen/migration/tests.py
+++ b/tools/python/xen/migration/tests.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python
 # -*- coding: utf-8 -*-
 
 """
diff --git a/tools/python/xen/migration/verify.py b/tools/python/xen/migration/verify.py
index 1e38f4a3c01e..b847c4bd220f 100644
--- a/tools/python/xen/migration/verify.py
+++ b/tools/python/xen/migration/verify.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python
 # -*- coding: utf-8 -*-
 
 """
diff --git a/tools/python/xen/migration/xl.py b/tools/python/xen/migration/xl.py
index 978e744dfd95..139d496654df 100644
--- a/tools/python/xen/migration/xl.py
+++ b/tools/python/xen/migration/xl.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python
 # -*- coding: utf-8 -*-
 
 """
diff --git a/tools/python/xen/util.py b/tools/python/xen/util.py
index a11358eefa13..47ceb5bd21fe 100644
--- a/tools/python/xen/util.py
+++ b/tools/python/xen/util.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python
 # -*- coding: utf-8 -*-
 
 import os
-- 
2.30.2


