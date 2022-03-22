Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A64E3D76
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 12:22:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293375.498377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbA-0001rt-Tj; Tue, 22 Mar 2022 11:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293375.498377; Tue, 22 Mar 2022 11:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbA-0001ps-QZ; Tue, 22 Mar 2022 11:22:48 +0000
Received: by outflank-mailman (input) for mailman id 293375;
 Tue, 22 Mar 2022 11:22:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTH=UB=citrix.com=prvs=07349bdb1=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nWcb9-0001pm-QM
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 11:22:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 647803d3-a9d2-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 12:22:46 +0100 (CET)
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
X-Inumbo-ID: 647803d3-a9d2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647948166;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z9yuLYFxbZ33UQOUtPSdRzXNFDuUG6+5XTHn/aSrd5I=;
  b=Xz1OoEA4DQwXYdy55l7M8QXLJ4RcAx/vj2/g+l8rCBYsk1+/bzCKpasI
   UKGUMfUCKmCfw6qY87U1y/5W5dONzHx1xw/1x68+rm7y4xBCA2Em5zxDL
   fmPoPS7sM39DrhAURpyBTlPtpZnU/kKMMSCfgdeTvPk7iGiQo+U5fOv2H
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66847194
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:I7+lgqlvV8itz/iq+KiQOOjo5gwvJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLXm7UafrcZzf2fNx/a9mwoEMHu8eDxtRrSQU5pCgyQiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWVnV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYEywLJKjInrwkehQFAxFgG6pKp+XEGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHN2ozM02RP3WjPH8WGoAuxvr2iUXncjpqmk6sh/cYvmv6mVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHNaS0yaf+3SgwOrGhzrmWZk6Hae9sPVthTW7ymMfBRIMXHOnsPK5jQi4QNsZJ
 EsKkgItqq4o/UDtUdj5XDW/unePuhNaUN1Ve8U44gyQzqvf4y6CG3MJCDVGbbQOttIyRDEs/
 k+EmZXuHzMHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXrnQs54Fa+pjvX8ATzq3
 y2Rty86mqkSisgQka68+DjvvTWooZTYSx8v0S/eVGml8wBRaZasYsqj7l2zxe1bMI+TQ12Fv
 X4Fs8uT9uYDCdeKjiPlfQkWNOj3vbDfamSa2AMxWcl6n9iwx5K9Vdp7wit7IEExC+8JJC/Zf
 mnUtVwL56YGaRNGcpRLS462Ds0ry43pGtLkSu3YY7JyX3RhSOOU1HowPBDNhggBhGBpyPhiY
 snDLa5AGF5AUcxaICyKq/DxOFPB7gQ33ivtSJ/y1HxLOpLONSfOGd/p3LZjB93VDZ9oQi2Iq
 r6z1OPQkn2ztdEShAGNqub/ynhQcRAG6Wje8ZA/SwJ6ClMO9JsdI/HQ26g9XIdugr5YkOzFl
 lnkBBMHmAqg2CKWc1vXApyGVF8JdcwjxZ7cFXZxVWtEJlB5Odr/hEvhX8VfkUYbGBxLkqcvE
 qhtlzSoCfVTUDXXkwnxnrGmxLGOgC+D3FrUVwL8OWBXV8c5G2Thp4+1FiOypXJmJnfm6qMDT
 0iIi1qzrWwrHF85Uq47qZuHkjuMgJTqsLkrDhWSfYULJhmEHUoDA3WZs8Lb6vokcX3rrgZ2H
 S7PafvEjYEhe7MIzeQ=
IronPort-HdrOrdr: A9a23:rzmd361uXQcHlK4WDOMgogqjBLgkLtp133Aq2lEZdPRUGvb2qy
 nIpoV/6faUskd3ZJhOo7G90cW7LE80lqQFg7X5X43DYOCOggLBR+tfBOPZslnd8kbFmNK1u5
 0NT0EHMqySMWRH
X-IronPort-AV: E=Sophos;i="5.90,201,1643691600"; 
   d="scan'208";a="66847194"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, George Dunlap <george.dunlap@citrix.com>, Wei Liu
	<wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Jan Beulich
	<jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [XEN PATCH v10 0/7] xen: Build system improvements, now with out-of-tree build!
Date: Tue, 22 Mar 2022 11:22:31 +0000
Message-ID: <20220322112238.1117737-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-v10

v10:
    Mainly a rebase (changes needed in patches 1 and 3).
    One comment change in patch 1.

v9:
    One new patch (patch 3).
    Otherwise, detailed change logs in patches.

    Removed the rfc part about doing out-of-tree build without setting VPATH
    (which would have allowed mixed in-tree / out-of-tree builds).

v8:
    Mostly rework of v7. With many patch already applied.
    Some detail changes that are spread through many patches:
    - `make cloc` recipe should now work throughout the series, update of it is
      done in 3 patches.
    - new patch "build: fix enforce unique symbols for recent clang version"
      to fix an issue with clang.
    - introducing $(srctree) and $(objtree) earlier
    - introducing $(srcdir) as shortcut for $(srctree)/$(src)
    - introduce usage of -iquote instead of -I in some cases
    More detail change log can be found in patches notes.

    Also this v8 present a work-in-progress of the ability to do out-of-tree
    build without setting VPATH. This is presented as an alternative to force
    use of out-of-tree build. As the last patch show, it allows to build the
    xen-shim without the linkfarm and we don't need to make any other changes
    to any thing that build xen (osstest, distribution packages, xen.git, ...,
    and developers finger macros). The patches are only there as WIP / RFC as
    they were some concern about the usefulness and extra changes needed.
    We can decide whether those changes are good or if this is too much and we
    should force out-of-tree build for the hypervisor.

v7:
    Out-of-tree build!

    This mean many more patches. Everything after patch 27 is new.

    There's a few new patch before that, but otherwise are rework of v6.

Hi,

I have work toward building Xen (the hypervisor) with Linux's build system,
Kbuild.

The main reason for that is to be able to have out-of-tree build. It's annoying
when a build fail because of the pvshim. Other benefit is a much faster
rebuild, and `make clean` doesn't take ages, and better dependencies to figure
out what needs to be rebuild.

Cheers,

Anthony PERARD (7):
  build: grab common EFI source files in arch specific dir
  build: replace $(BASEDIR) by $(objtree)
  build: replace $(BASEDIR) and use $(srctree)
  build: rework "headers*.chk" prerequisite in include/
  build: specify source tree in include/ for prerequisite
  build: shuffle main Makefile
  build: adding out-of-tree support to the xen build

 .gitignore                   |   1 +
 xen/Kconfig                  |   4 +-
 xen/Makefile                 | 187 +++++++++++++++++++++++++++--------
 xen/Rules.mk                 |  22 ++++-
 xen/arch/arm/Makefile        |  10 +-
 xen/arch/arm/efi/Makefile    |   4 +-
 xen/arch/x86/Makefile        |  32 +++---
 xen/arch/x86/arch.mk         |   7 +-
 xen/arch/x86/boot/Makefile   |   6 ++
 xen/arch/x86/efi/Makefile    |   5 +-
 xen/build.mk                 |   4 +-
 xen/common/Makefile          |   4 +-
 xen/common/efi/efi-common.mk |  16 +++
 xen/common/libfdt/Makefile   |   2 +-
 xen/include/Makefile         |  60 ++++++-----
 xen/scripts/Kconfig.include  |   2 +-
 xen/scripts/Makefile.clean   |   5 +-
 xen/test/livepatch/Makefile  |  14 +--
 xen/xsm/flask/Makefile       |  13 +--
 xen/xsm/flask/ss/Makefile    |   1 +
 20 files changed, 283 insertions(+), 116 deletions(-)
 create mode 100644 xen/common/efi/efi-common.mk

-- 
Anthony PERARD


