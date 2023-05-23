Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334570E071
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 17:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538517.838498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Two-0003QW-IM; Tue, 23 May 2023 15:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538517.838498; Tue, 23 May 2023 15:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Two-0003Nw-FJ; Tue, 23 May 2023 15:29:14 +0000
Received: by outflank-mailman (input) for mailman id 538517;
 Tue, 23 May 2023 15:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1Twm-0003Nq-VJ
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 15:29:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f28e8ab-f97e-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 17:29:10 +0200 (CEST)
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
X-Inumbo-ID: 8f28e8ab-f97e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684855749;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mkCocN7i5a+MVKnvRRH3JXM3dGWs+ajYpoAKaFQWJoM=;
  b=IdQ6EnLXEPt5Xxw2LHyywpTpDLh0Uho8lnfpEYgNKp3XVsO3gHtEfKIl
   i63BcPsFjM4qzbOmkM01l1wG77PEMppMryNF862LVtdD0a+JoAOeXSuXm
   QgZgAeSap1yyzDvOCBl02X1wINQHx3xJu7XSAikISPSvnt0RdOAlYDkZz
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110491764
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:JbAUR6x1l1Rwwxk/s+l6t+ddxirEfRIJ4+MujC+fZmUNrF6WrkVTy
 2YbW2mEafbYazfyeogiOYi1oUkOu5LWn9A2HgQ4pSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRjP6sT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KX5Jr
 aQgcmwvVQmsvf+o5+mJRcRv2P12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMxhrJ/
 z2YowwVBDk8Cs2N2RWP8kuuvfXUmn/EBLkfDZyBo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXYht8F4SrNgrlvXk+yNvljfXzJfJtJcVDA4nNAxHWQSj
 AOrpMrGPyFxl+anRl+eqI7B+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hid21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshUVflhdwTXGo3h+Y1FAN7bWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPtMMMbCP2Nv4uO97Z5yEWIU/ITI6NaxwpRoAWPsgZmPGvp0mCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr9HuZdyn3BW+I8mbcyjp/hR+ebENSH9pHZsGAfmU93VG4vf+F+Er
 IkHZ5rWo/idOcWnChTqHUcoBQhiBRAG6Vre8KS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:uQORS62j2meTZx5CF2DJXwqjBIgkLtp133Aq2lEZdPU1SL36qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVxe9ZnOzf6gylNyri9vNMkY
 dMGpIObuEY1GIK6PoSNjPId+rIa+P3kpyVuQ==
X-Talos-CUID: 9a23:OvKnO2Gu1jJQD2KKqmJ48xZMIpp5UEbE403NPWjjO2lES+OsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AeD1Bww2pDnA4OEQZFb8IfZ2fSzUjxZq/GlAim5U?=
 =?us-ascii?q?/ufKeLissBGumgS2We9py?=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="110491764"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [OSSTEST PATCH] ts-xen-build-prep: Install python3-venv for QEMU
Date: Tue, 23 May 2023 16:27:48 +0100
Message-ID: <20230523152748.23726-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since QEMU commit 81e2b198a8cb ("configure: create a python venv
unconditionally"), a python venv is always created and this new package
is needed on Debian.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-xen-build-prep | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ts-xen-build-prep b/ts-xen-build-prep
index 3ae8f215..547bbc16 100755
--- a/ts-xen-build-prep
+++ b/ts-xen-build-prep
@@ -209,6 +209,7 @@ sub prep () {
                       libdevmapper-dev libxml-xpath-perl libelf-dev
                       ccache nasm checkpolicy ebtables
 		      python3-docutils python3-dev
+		      python3-venv
                       libtirpc-dev
                       libgnutls28-dev);
 
-- 
Anthony PERARD


