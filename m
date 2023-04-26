Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0266EF6BA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 16:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526735.818649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgRB-0006vD-Qz; Wed, 26 Apr 2023 14:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526735.818649; Wed, 26 Apr 2023 14:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgRB-0006sW-O2; Wed, 26 Apr 2023 14:48:05 +0000
Received: by outflank-mailman (input) for mailman id 526735;
 Wed, 26 Apr 2023 14:48:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldec=AR=citrix.com=prvs=473a90206=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1prgRA-0006sP-8D
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 14:48:04 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56433a00-e441-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 16:48:01 +0200 (CEST)
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
X-Inumbo-ID: 56433a00-e441-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682520481;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GZ9NpsvUTgP/I90kLu9M40l73+ZnSwecSPLdpqLq8z8=;
  b=OR5kxCQ8e5juk9HlPeC6ABJYdOf9ukOP2jlWrvooFuv2vsebN266NmHh
   OSp2EFwJ+DPooet3zsgujBpVWB4LVKPlIEzztFFA8pUuwtFQQDlMqFv3l
   JL0sWWtRiUxnAkGJt+Gkk/p37N5Z0SNbTu4t5DV4hySjm08mEkj4A+Znu
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107351865
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Pu0twqlf8HIzQI0x986d+pvo5gy5JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKUTqHaaqJNGP9KYonatnl908FsZeDxt9hTwY4qS43RCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5gGGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ftCMhQTZTKkvcan5uupVvZKou8bEPC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/A+
 TmbpjSnX3n2MvTDzR+qyFeG2tT0siejALwRJua88vVT1Qj7Kms7V0RNCArTTeOCoku/UNJWL
 woT4DgjqYA78UDtRd74NzWzqWSIuRM0UNNKH+o3rgqKz8L85g+DA2EeQz1pado4tdQ3Tzgny
 l+ImdzyATVl9raSTBq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kbnh/JC9puDqOxptn0Ai3rh
 SCHqjAkgLcehtJN0L+0lW0rmBr1+MKPFFRsoFyKACT8tFgRiJOZi5KA7gLByehLDqGjakin5
 WoYhO66x9gyNMTY/MCSe9nhDI1F9t7cbm2G2g8yR8Rxn9i+0yX9JN4NuVmSMG8sa59ZImGxP
 Sc/rCsLvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBc2B2y8nTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035geDCOCHLFulUYADmggUFAESs+V29z
 jqiH5HSl0U3vBPWOUE7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJVzN/8T5mOt7E6Q8xvQ9qws91
 i3lMqOu4Aal1CKvxMTjQiwLVY4Dqr4l/CtkYHF8YA32s5XhCK72hJoim1IMVeFP3IReITRcF
 JHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:3bjfQqCGylXXJ6rlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:f70ywW9HXTx4oX70BEmVv0lOAOQ7eV/69lPBBRaqFXlPbJatdWbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Akoqr0A91GPCDWNc+fboyMZKQf5tsxouULWpRqq4?=
 =?us-ascii?q?pv5HcCy9CYDOZhw3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,228,1677560400"; 
   d="scan'208";a="107351865"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH] CI: Remove all use of /bin/false as a ROM
Date: Wed, 26 Apr 2023 15:47:48 +0100
Message-ID: <20230426144748.1236385-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As the recent work to get PCI Passthrough testing working shows, putting
`/bin/false` as a ROM into guest context doesn't work so well.

For all ROM paths where we're skipping the build, use a slightly-plausible but
likely non-existent path instead.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index d830cff7b7c7..197d085f3e07 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -67,9 +67,9 @@ else
 
     if [[ "${cc_is_clang}" == "y" ]]; then
         # SeaBIOS cannot be built with clang
-        cfgargs+=("--with-system-seabios=/usr/share/seabios/bios.bin")
+        cfgargs+=("--with-system-seabios=/usr/share/no-seabios.bin")
         # iPXE cannot be built with clang
-        cfgargs+=("--with-system-ipxe=/usr/lib/ipxe/ipxe.pxe")
+        cfgargs+=("--with-system-ipxe=/usr/share/no-ipxe.pxe")
         # newlib cannot be built with clang so we cannot build stubdoms
         cfgargs+=("--disable-stubdom")
     fi
@@ -87,7 +87,7 @@ else
 
     # SeaBIOS requires GCC 4.6 or later
     if [[ "${cc_is_gcc}" == "y" && "${cc_ver}" -lt 0x040600 ]]; then
-        cfgargs+=("--with-system-seabios=/bin/false")
+        cfgargs+=("--with-system-seabios=/usr/share/no-seabios.bin")
     fi
 
     ./configure "${cfgargs[@]}"
-- 
2.30.2


