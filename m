Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358186F8887
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 20:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530607.826340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzy6-0002M6-1W; Fri, 05 May 2023 18:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530607.826340; Fri, 05 May 2023 18:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzy5-0002Jp-ST; Fri, 05 May 2023 18:15:45 +0000
Received: by outflank-mailman (input) for mailman id 530607;
 Fri, 05 May 2023 18:15:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XVLi=A2=citrix.com=prvs=4822586d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puzy4-0002Jh-Ag
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 18:15:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6d0f8cc-eb70-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 20:15:40 +0200 (CEST)
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
X-Inumbo-ID: d6d0f8cc-eb70-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683310540;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YVh+aeiq4kunPj4X2l6hp6BB23HOhzrXAxxBHMLanWU=;
  b=IqamYFkJhiLKp4/BBN7UYgMWgRT+DNu4/7ihKNNrzHVcxs7IaPFQZZta
   asyPmSu3EPR5iPLFPIhOb/r+Te487QeapfGwFlCmTPdPqPhkbxJ84jWJA
   dsKESNIKsMBJd+J7wL27JeyGG3iQuPJ2pjaCMWgDBE82vexua6fy/Pkvs
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108058101
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:aGceR62GQmxPirbjD/bD5YNxkn2cJEfYwER7XKvMYLTBsI5bpz0Ez
 zcWDzzQaPuDZDbzLd90Otvjph4FvJSAnd9rQFA/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFmOKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfI1929
 PIJFgg3YD+Jmr2Q4K6pdPtJr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ0FxhvI/
 zqfl4j/KhpGLsKi9wjfy232xbD0wTH8G4YcLLLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPIJTbd8slvUjPOJvUDAXDNsoiN9hMIOlvEORDI76
 GezkfzjGGNJkKGHd2C43+LBxd+tAhT5PVPudAddE1teuYSy+dhs5v7cZo09SfDo17UZDRm1m
 mnX93Zm2t3/mOZRj82GEUb7byVAT3QjZio8/U3pU22s9WuVj6b1NtXzuTA3ARutRbt1r2VtX
 1BewaByFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9LdsKum8ifRYxaZlsldrVX
 aMukVkJuM870IWCNMebnL5d++x1lPO9RLwJp9jfb8ZUY4gZSTJrCBpGPBbKt0i0yRhErE3KE
 cvDGSpaJSpAWPsPIfvfb7t17ILHMQhknDKJGc6jk0j2uVdcDVbMIYo43JK1RrhRxMu5TM/9q
 r6z6+PiJ81jbdDD
IronPort-HdrOrdr: A9a23:vkstY6FprdPlgHFlpLqEGMeALOsnbusQ8zAXPiBKJCC9E/bo8/
 xG+c5w6faaslkssR0b9+xoW5PwJE80l6QFgrX5VI3KNGXbUQ2TTb2KhbGI/9SKIVydygcy78
 ddmtNFebrN5VgRt7eH3OG7eexQv+VuJsqT9JnjJ3QGd3AaV0l5hT0JbDpyiidNNXN77ZxSLu
 vk2uN34wCOVF4wdcqBCnwMT4H41qD2fMKPW29/O/Y/gjP+9g+V1A==
X-Talos-CUID: 9a23:vLLr225C7EuUA7wjNNss1nAsG840TEXnwljaPhCeKXp7dq+wYArF
X-Talos-MUID: 9a23:pBUAvAROuaMk+To9RXTn2Ct8CflauZ2xUgNSqskUvIqAOxR/bmI=
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="108058101"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/2] LICENSES improvements/corrections
Date: Fri, 5 May 2023 19:15:26 +0100
Message-ID: <20230505181528.3587485-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Noticed in light of the recent LGPL changes to libacpi, but sadly only after
the fact.  Minor updates in the second patch.

Andrew Cooper (2):
  LICENSES: Improve the legibility of these files
  LICENSES: Remove the use of deprecated SPDX tags

 LICENSES/BSD-2-Clause               |  4 ++++
 LICENSES/BSD-3-Clause               |  4 ++++
 LICENSES/BSD-3-Clause-Clear         |  4 ++++
 LICENSES/CC-BY-4.0                  |  5 +++++
 LICENSES/GPL-2.0                    | 21 ++++++++++++++-------
 LICENSES/LGPL-2.0                   | 17 ++++++++++++-----
 LICENSES/LGPL-2.1                   | 17 ++++++++++++-----
 LICENSES/MIT                        |  4 ++++
 tools/libacpi/Makefile              |  2 +-
 tools/libacpi/acpi2_0.h             |  2 +-
 tools/libacpi/build.c               |  2 +-
 tools/libacpi/dsdt.asl              |  2 +-
 tools/libacpi/dsdt_acpi_info.asl    |  2 +-
 tools/libacpi/libacpi.h             |  2 +-
 tools/libacpi/mk_dsdt.c             |  2 +-
 tools/libacpi/ssdt_laptop_slate.asl |  2 +-
 tools/libacpi/ssdt_pm.asl           |  2 +-
 tools/libacpi/ssdt_s3.asl           |  2 +-
 tools/libacpi/ssdt_s4.asl           |  2 +-
 tools/libacpi/ssdt_tpm.asl          |  2 +-
 tools/libacpi/static_tables.c       |  2 +-
 21 files changed, 72 insertions(+), 30 deletions(-)


base-commit: e93e635e142d45e3904efb4a05e2b3b52a708b4f
-- 
2.30.2


