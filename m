Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2694BD959
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 12:15:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276182.472279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6et-0007Dq-4D; Mon, 21 Feb 2022 11:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276182.472279; Mon, 21 Feb 2022 11:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6et-0007An-0A; Mon, 21 Feb 2022 11:15:11 +0000
Received: by outflank-mailman (input) for mailman id 276182;
 Mon, 21 Feb 2022 11:15:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvXl=TE=citrix.com=prvs=044a77a3b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nM6eq-0007Ah-PA
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 11:15:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85af6c6b-9307-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 12:15:07 +0100 (CET)
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
X-Inumbo-ID: 85af6c6b-9307-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645442107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bz3LYT5LcO5fV2QHfp3H6miIX/JdkycEPHStL4fNAlY=;
  b=e1mfgKV7725fK7ZdJEJmLmIXdM5nRMGxyXr+BV+cwGyNoVLsDHYxYFTW
   inzJDEKgrD1mUwYavBVfAeT+v2MTazNcS+9LCCbn9VHCBq9SWwS3ynyFM
   nZWdy0j1yrH7rfD0tWUa/41xTMGf0qg0hRNxH5+gUh4kFWJisWPHIuHQf
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64640921
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GQyTKqNyYtmRSlXvrR31l8FynXyQoLVcMsEvi/4bfWQNrUpzhmZWn
 DAcCGqGbPaIa2SgeosnYNiwoUtQvZXSmINqGQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2Ncw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 MxU8saUFxYSHoaSo6M3fx1yNwVCIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQaiCP
 5tDMFKDajzBID1UB3A+BKkOld6xolb1eDx1ukKa8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvGtJk6TePisKQw2RvKmzJVWEZ+uUaHTeeRulenHIh7d
 V0v2gFwlu8Y2EiBav3BQEjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblQ5oi59hM8O75FvG2Fzv
 rOdt5awXGE07uXJIZ6I3urM9VuP1T4pwXjujMPuZS8M+JHdrY46lXojpf4zQffu3rUZ9dwdq
 g1mTRTSZZ1O16bnNI3hpDgrZg5AQbCTE2YICv3/BD7N0++ATNfNi3aUwVba9+1cC42SU0OMu
 nMJ8+DHsrxTVsHRxXHcHb9cdF1M2xpiGGeB6WOD4rF7r2j9k5JdVds4DM5CyLdBbZ9fJG6Bj
 L77sgJN/p5DVEZGnocsC79d//8ClPC6ffy8D6i8RoMXPvBZKV/WlAkzNBX49z28zyARfVQXZ
 M7znTCEVi1BV8yKDVOeGo8g7FPc7npgnTiKHcijlXxKE9O2PRaodFvMC3PWBshR0U9OiFy9H
 wp3XydS9yhibQ==
IronPort-HdrOrdr: A9a23:4ljzcqFNb45GoKt5pLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="64640921"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] CI: Coverity tweaks
Date: Mon, 21 Feb 2022 11:14:54 +0000
Message-ID: <20220221111454.2925-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220221100254.13661-4-andrew.cooper3@citrix.com>
References: <20220221100254.13661-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

 * Use workflow_dispatch to allow manual creation of the job.
 * Use parallel builds; the workers have two vCPUs.  Also, use the build-*
   targets rather than the ones which expand to dist-*.
 * Shrink the dependency list further.  build-essential covers make and gcc,
   while bridge-utils and iproute2 are runtime dependencies not build
   dependencies.  Alter bzip2 to libbz2-dev.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Merge with existing command:
---
 .github/workflows/coverity.yml | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
index 9d04b56fd31d..427fb86f947f 100644
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
 
@@ -31,11 +32,11 @@ jobs:
 
     - name: Pre build stuff
       run: |
-        make mini-os-dir
+        make -j`nproc` mini-os-dir
 
     - uses: vapier/coverity-scan-action@v1
       with:
-        command: make xen tools && make -C extras/mini-os/
+        command: make -j`nproc` build-xen build-tools && make -j`nproc` -C extras/mini-os/
         project: XenProject
         email: ${{ secrets.COVERITY_SCAN_EMAIL }}
         token: ${{ secrets.COVERITY_SCAN_TOKEN }}
-- 
2.11.0


