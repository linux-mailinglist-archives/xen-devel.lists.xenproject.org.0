Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9FA70E1F2
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538553.838581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1q-0006Qq-Pe; Tue, 23 May 2023 16:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538553.838581; Tue, 23 May 2023 16:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1q-0006Ld-K3; Tue, 23 May 2023 16:38:30 +0000
Received: by outflank-mailman (input) for mailman id 538553;
 Tue, 23 May 2023 16:38:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V1o-0006Dr-OV
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cf31a17-f988-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 18:38:26 +0200 (CEST)
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
X-Inumbo-ID: 3cf31a17-f988-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859906;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ehPXLskpRZYpYI4YTcAs0IW9d4IX2bw/AKtNWOoxDTU=;
  b=ATyznmYY3c0AfBe/OqDaFuH6QoZnllwByE62Zai3DaVNKMc/v74/ly+3
   VqVFH79/Pmkh/Zdcw/zKMLCA+0VBAevIqnktxQhBxAc30qhelQOxeokpd
   k8n47WvwjF6JiO8T30QkfpwLq2cu7HMBnHSNTeJuxyD9RM2DomeA3dHAR
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108859023
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:latz1qz7XGd82WUK/0p6t+dNwSrEfRIJ4+MujC+fZmUNrF6WrkVWn
 2QYWWzXO6rfYmfxLtt3aorio0gFuZDWn9EyTVNupSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRjP6sT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KT1o+
 PYFDA1TVSqKiOzr2Z2kQNR9uP12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNzhbF9
 zqcpAwVBDkKOOK45WaI1UmzqfPDuS24BIYiJKKBo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0V8JLFuwm6CmE0qfO/xuCHW8AUyJAb9o98sQxQFQC1
 ViPhdrlQyNutL69TmiU/bOZ6zi1PEA9JGsDfjMNTBFD7cPqpooylTrQQt0lG6mw5vX3BDXxz
 jaivCU4wbIJgqYjzL6n9FrKhzatoJnhTQMv4AjTGGW/4WtRe4qNd4Gur1/B4p5oJ4+DQl6Ml
 HMNgcSZ4aYFCpTlvCaKSu8cEaqp4/uAOTv0jltmHp1n/DOok1aoeoZW5zNyLVloKe4LfDboZ
 AnYvgY5zJVeJmewZKl7JYe4Ed03zLPIHM7gEPvTa7JmXJ91cwOW+TB0UmSZ1WvtjUsEnLk2P
 NGQdsPEJXQQBLljzTG2b/wAyrJtzSc7rV4/XriikU7hi+DHIifIF/FcagDmgv0FAL2s/CPY+
 ct7CpWx8RxQXrDnTTbdzJ8tFAVfRZQkPqzep8tSf++FBwNpHmA9FvPcqY8cl5xZc7d9zbmRo
 CzkMqNM4B+m3CCcd13WApx2QOm3NauTu07XKsDF0byA/3E4Kbii464EH3fcVel2rbczpRKYo
 hRsRilhPhitYm6fk9j+RcOnxGCHSPhMrVzmAsZdSGJjF6OMviSQkjMeQiPh9TMVEg28vtYkr
 rur22vzGMRTG1syVJqNOav3kztdWETxf8orBSP1ziR7Ih2woOCG1QSq5hPIHy38AUqanWbLv
 +pnKRwZufPMs+cIzTU9vojd993BO7InTiJn85zzse7e2d/yojDynuetkY+gIVjgaY8D0P76P
 7QKkKmsYaFvcZQjm9MULouHBJkWv7PHz4K2BCw9dJkXRzxH0o9dH0Q=
IronPort-HdrOrdr: A9a23:H5lduKALrKZxAenlHelc55DYdb4zR+YMi2TDt3oddfU1SL39qy
 nKpp4mPHDP5wr5NEtPpTniAtjkfZq/z+8X3WB5B97LMDUO3lHIEGgL1+DfKlbbak/DH4BmtZ
 uICJIOb+EZDTJB/LrHCAvTKade/DFQmprY+9s3zB1WPHBXg7kL1XYeNu4CeHcGPjWvA/ACZe
 Ohz/sCnRWMU1INYP+2A3EUNtKz2uEixPrdEGY77wdM0nj0sQ+V
X-Talos-CUID: =?us-ascii?q?9a23=3Aw8kwQGoOghl7nuRt2a9Lb7jmUZwDf3fA6EqOGHW?=
 =?us-ascii?q?xBmg0UZKKQ2KBxpoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AdAcT6A69SdyEzUgxu/+t0/W+xox475qJJBwAtq4?=
 =?us-ascii?q?ZlNWIESIzZzOtvCuOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="108859023"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Ross Lagerwall" <ross.lagerwall@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Subject: [XEN PATCH 00/15] build: cleanup build log, avoid user's CFLAGS, avoid too many include of Config.mk
Date: Tue, 23 May 2023 17:37:56 +0100
Message-ID: <20230523163811.30792-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-removing-config.mk-v1

Hi,

This series of patch cleanup the remaining rules still displaying their command
line.

Then, some change are made in Config.mk to remove build-id stuff only used by
Xen build.

Then, the variable AFLAGS and CFLAGS are been renamed XEN_AFLAGS and XEN_CFLAGS
from the beginning to about inclusion of users CFLAGS as those are usually made
for user space program, not kernel, especially in build environment for distro
packages.

Last patch removes the inclusion of Config.mk from xen/Rules.mk, as this slow
down the build unnecessarily. xen/Makefile should do everything necessary to
setup the build of the hypervisor, and is its only entry point.

Thanks,

Anthony PERARD (15):
  build: hide that we are updating xen/lib/x86
  build: rework asm-offsets.* build step to use kbuild
  build, x86: clean build log for boot/ targets
  build: hide policy.bin commands
  build: introduce a generic command for gzip
  build: quiet for .allconfig.tmp target
  build: move XEN_HAS_BUILD_ID out of Config.mk
  build: use $(filechk, ) for all compat/.xlat/%.lst
  build: hide commands run for kconfig
  build: rename $(AFLAGS) to $(XEN_AFLAGS)
  build: rename CFLAGS to XEN_CFLAGS in xen/Makefile
  build: avoid Config.mk's CFLAGS
  build: fix compile.h compiler version command line
  Config.mk: move $(cc-option, ) to config/compiler-testing.mk
  build: remove Config.mk include from Rules.mk

 Config.mk                   | 39 +------------------
 config/compiler-testing.mk  | 25 +++++++++++++
 xen/Makefile                | 75 +++++++++++++++++++++++++------------
 xen/Rules.mk                |  7 +++-
 xen/arch/arm/Makefile       |  2 +-
 xen/arch/arm/arch.mk        |  8 +++-
 xen/arch/riscv/Makefile     |  2 +-
 xen/arch/riscv/arch.mk      |  4 +-
 xen/arch/x86/Makefile       | 12 +++---
 xen/arch/x86/arch.mk        | 62 +++++++++++++++---------------
 xen/arch/x86/boot/Makefile  | 16 ++++++--
 xen/build.mk                | 24 +++++++-----
 xen/common/Makefile         |  8 ++--
 xen/include/Makefile        | 10 ++---
 xen/scripts/Kbuild.include  | 10 +++++
 xen/test/livepatch/Makefile |  4 +-
 xen/tools/kconfig/Makefile  | 14 +++----
 xen/xsm/flask/Makefile      |  9 ++++-
 18 files changed, 193 insertions(+), 138 deletions(-)
 create mode 100644 config/compiler-testing.mk

-- 
Anthony PERARD


