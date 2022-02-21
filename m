Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E30C4BD8E6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275958.471968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5XN-0000Qo-6b; Mon, 21 Feb 2022 10:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275958.471968; Mon, 21 Feb 2022 10:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5XN-0000Os-3G; Mon, 21 Feb 2022 10:03:21 +0000
Received: by outflank-mailman (input) for mailman id 275958;
 Mon, 21 Feb 2022 10:03:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvXl=TE=citrix.com=prvs=044a77a3b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nM5XM-00008I-9z
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:03:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d53d089-92fd-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 11:03:18 +0100 (CET)
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
X-Inumbo-ID: 7d53d089-92fd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645437798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=59BUrJyJFYGfQ4z14Fv38dK7j3O8WgWr/hGqJtw6/PQ=;
  b=do3PdFAeGGpMg4CzR0+7slfvKAh/RilG8FJt7GAnY5S7HtIjbO26py+h
   5Gd4kHnLK3yDyVO6nPIfAd0nGtoJRfNprJ+koldngXFq+eNoUdlPCd/TQ
   wBXm/uHiLn2r9sROJIwG1dmlKOrfOJrttpQzTCyOf5dJZU4ZgrvSEGlXS
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66881347
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:unQ4sqt6Z4XoIJeV/0Qy9JgrYufnVAZeMUV32f8akzHdYApBsoF/q
 tZmKWmEM6uCazHzeohyaYmwoUMCu5aGytZiTwo//Co3FHkX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQzy4bVvqYy2YLjW1nX4
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8OOr3rseYHTyBYCgBZH58epoXgeFyg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQxPESZOEEQUrsRILI7mrqSiGTGTzlZ61SJu6cSvWWP0yUkhdABN/KKI4fXFK25hH2wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3nsOGm3XKmDZVUkdPEwLm/7/p0SZSRu6zN
 WQz/joJhKoo6HWrV/jafS/g/kSj5zoDDo84//IB1CmBza/d4gC8D2cCTyJcZNFOiPLaVQDGx
 XfSwYq3WGUHXKm9DCvEq+zK9W/a1T09cDdaDRLoWzfp9DUKTGsbqhvUBuhuH6eu5jEeMWGhm
 mvaxMTSalh6sCLq60lZ1Q2d695PjsKQJuLQ2ukwdjj4hj6VnKb/O+SVBaHztJ6s1rqxQFibp
 2QjkMOD9u0IBpzlvHXTHLhWTO34uqfYamy0bbtT834JrWnFxpJeVdoIvGEWyLlBaa7ohgMFk
 GeM4FgMtfe/zVOhbLNtYpLZNijZ5fOIKDgRbdiNNoAmSsEoLGevpXgyDWbNjzGFuBV9yskXZ
 MbEGftA+F5HUMyLOhLtHLxDuVLqrwhjrV7uqWfTlUr/iuPGPCbPIVrHWXPXBt0EAGq/iF292
 75i2wGikH2zjMWWjvHrzLMu
IronPort-HdrOrdr: A9a23:VYWQmqPxKuRMEcBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="66881347"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] CI: Coverity tweaks
Date: Mon, 21 Feb 2022 10:02:54 +0000
Message-ID: <20220221100254.13661-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220221100254.13661-1-andrew.cooper3@citrix.com>
References: <20220221100254.13661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

 * Use workflow_dispatch to allow manual creation of the job.
 * Use parallel builds.  The workers have two vCPUs.
 * Shrink the dependency list further.  build-essential covers make and gcc,
   while bridge-utils and iproute2 are runtime dependencies not build
   dependencies.  Alter bzip2 to libbz2-dev.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 .github/workflows/coverity.yml | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
index 9d04b56fd31d..6e7b81e74f72 100644
--- a/.github/workflows/coverity.yml
+++ b/.github/workflows/coverity.yml
@@ -2,6 +2,7 @@ name: Coverity Scan
 
 # We only want to test official release code, not every pull request.
 on:
+  workflow_dispatch:
   schedule:
     - cron: '18 9 * * WED,SUN' # Bi-weekly at 9:18 UTC
 
@@ -11,11 +12,11 @@ jobs:
     steps:
     - name: Install build dependencies
       run: |
-        sudo apt-get install -y wget git gawk bridge-utils \
-          iproute2 bzip2 build-essential \
-          make gcc zlib1g-dev libncurses5-dev iasl \
-          libbz2-dev e2fslibs-dev git-core uuid-dev ocaml \
-          ocaml-findlib xz-utils libyajl-dev \
+        sudo apt-get install -y wget git gawk \
+          libbz2-dev build-essential \
+          zlib1g-dev libncurses5-dev iasl \
+          libbz2-dev e2fslibs-dev uuid-dev ocaml \
+          ocaml-findlib libyajl-dev \
           autoconf libtool liblzma-dev \
           python3-dev golang python-dev libsystemd-dev
 
@@ -31,7 +32,7 @@ jobs:
 
     - name: Pre build stuff
       run: |
-        make mini-os-dir
+        make -j`nproc` mini-os-dir
 
     - uses: vapier/coverity-scan-action@v1
       with:
@@ -39,3 +40,4 @@ jobs:
         project: XenProject
         email: ${{ secrets.COVERITY_SCAN_EMAIL }}
         token: ${{ secrets.COVERITY_SCAN_TOKEN }}
+        command: make -j`nproc` build
-- 
2.11.0


