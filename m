Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E669449B27A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260061.449077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZb-0006Pf-C2; Tue, 25 Jan 2022 11:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260061.449077; Tue, 25 Jan 2022 11:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZb-0006My-80; Tue, 25 Jan 2022 11:01:15 +0000
Received: by outflank-mailman (input) for mailman id 260061;
 Tue, 25 Jan 2022 11:01:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJZY-0006Mn-T8
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a18469e-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:01:11 +0100 (CET)
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
X-Inumbo-ID: 1a18469e-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RbnF+cUWX/zeCYIhklqiVJ9S062lPHa4CENE7SUhk2w=;
  b=T4cFU2pZytaOeY+ibUT8NemjZszeIHB0q7BR7Esng0bkGCpMDHXEUffv
   HX3PXuOOr8UUSCWfQUp35w4H0nzXRHTuknKMX/eQ1lP1YQty4vslKcqaF
   CbIsK6whLQIf1B5GhdGDq8DxtSzzMIx+Iq0TbNdYAgO6Fch5xSTPyiaac
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ItJ1qdoxRsJcMVJ0a/HsVGxrNdJgESRKpGah2K9CTzILSQ1Eep5IDTL24jzWuHWjHyhoeSuE9V
 HI+NwxOE9R0wKsSx6ga9CkgRrZQRpXj/xDNWrZYNzJSfnw8gL3Qob/K9pU4naJ/hMLQKzwpXFs
 q5pVZUaGuESTEnTJ1bbOqHGyvyw87HED4njsOOjX6oCE/ATjgSwlMNQyXVlBgxRKUkzUR2IklL
 mjxwGzUjo3j5svrrzlarQWIfFNx0RFf4Du98/QJfam7b9AipbFaT93UsGJZldBCDDGlZLX4S7Z
 Fcx0FEocSdQEnxBDOlXsgDob
X-SBRS: 5.2
X-MesageID: 62699827
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XSGKt6ByhUMe/xVW//Xlw5YqxClBgxIJ4kV8jS/XYbTApGgrgjwFn
 WYeD27QOauOMGWkKYt1PI3koBkBvp7Qm4JhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940087wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/sieKp91U8
 st3uJWgEgx1ZLX+ue1FTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcGhmlh15AUQp4yY
 eJHcRZgTwXwbidXHQs4EahnjsisuXvgJmgwRFW9+vNsvjm7IBZK+LvqNsDcdpqVRMFWtkGCr
 2nC8iLyBRRyHMeE1TOP/3aoh+nOtSD2QoQfEPu/7PECqF+Owm0eDjUGWF39puO24ma0XNhVO
 kEP+i4jqKE03EOuR9j5GRa/pRassgYHXttME8Uz8AyX1rfP+AGdG3QFSThaLtchsaceTDgrz
 UOAnsmvCyZmtraUUlqC+rzSpjS3UQAeKmkEYi0IRBUE+PHspYgyilTESdMLOKy/g8DxGDrw6
 yuXtyV4jLIW5eY10KG88UHCkiibjJHDRQ4o5S3aRmugqAh+YeaNd4GurFTW8/tEBIKYVUWa+
 mgJndCE6+IDBo3LkzaCKM0HEau1/f+DPHvZiER2Apg63z23/jioeoU4yDp3PktuP+4PcCXlZ
 0KVsgRUjLdfM3enYrV+S56gAMQti677HJLqUe68RsVKSoh8ckmA5i4GWKKL9zmzyg52y/h5Y
 MrFN5b3ZZoHNUh55AOkRN8Q9IU1/C031TjYGcrj/TWuiaXLMRZ5Vow5GFeJa+k46oaNrwPU7
 8tTOqO29vlPbAHtSnKJqNBOdDjmOVB+XMmr8JIPKoZvNyI7QDlJNhPH/V82l2WJdYxxn/yAw
 HyyU1QwJLHX1SyeclXihpyOhdrSsXdDQZATYHRE0bWAgSFLjWOTAEE3LcdfkV4Pr7QL8BKMZ
 6NZE/hs+9wWItg9xxwTbIPmsKtpfwmxiASFMkKNOWZjJMY8FlOWpI61JmMDERXi6ALt6aPSR
 JX7jmvmrWcrHVw+XK46ltrxp79OgZTtsL0rBBaZSjWiUE7t7JJrO0TMYgwfeKkxxeH47mLCj
 W6+WE5AzcGU+tNd2ISX2cis8tn4e8MjThsyNzSKtt6eaHiFlldPNKcdCo5kixiHCjOtkEhjD
 M0Ip8zB3AovxQYT7NEkQu81lMrTJbLH/tdn8+itJ12TB3zDN1+qCiDuMRBnuvIfy7lHlxGxX
 07TqNBWNa/QYJHuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uN96sQY3BOy10gxOdGcgyEKq2nVdi4cU78qv40xCZPwjlZ50UlLZJHRU3ek4JyGZ9hWHFMtJ
 zuY2PjLi7hGnxKQeHsvD3ndm+FagM1W6hxNyVYDIXWPm8bE2aBrjEEAr2xvQ10MnBtd0u91N
 mx6DGFPJP2Dr2VymcxOf2GwAAUdVheXzVP8lgkSn2rDQkj2CmGUdD8hOfyA9Vwy+n5HemQJ5
 6mRzWvoXGq4fMz12SduC0dpp+a6EI50/wzG3sumA96ED98xZj+82v2iYm8Bqh3GB8IthRKY+
 bk2rbgoMaCrZzQNp6AbCpWB0eVCQR+JE2VOXPV98f5bBmrbYjyzhWCDJk3Zlhmh/BAWHZtU0
 /BTG/8=
IronPort-HdrOrdr: A9a23:qTRIEquV53bFjPosuvZR9zJM7skDfNV00zEX/kB9WHVpmszxra
 +TdZMgpHrJYVcqKRYdcL+7WZVoLUmwyXcX2/hyAV7BZmnbUQKTRekIh7cKqweQfxEWndQy6U
 4PScRD4aXLfDtHsfo=
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62699827"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Liu <wl@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Doug
 Goldstein" <cardoe@cardoe.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v9 00/30] xen: Build system improvements, now with out-of-tree build!
Date: Tue, 25 Jan 2022 11:00:33 +0000
Message-ID: <20220125110103.3527686-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-v9

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

Anthony PERARD (30):
  build: set XEN_BUILD_EFI earlier
  build: avoid re-executing the main Makefile by introducing build.mk
  build: fix exported variable name CFLAGS_stack_boundary
  build: set ALL_OBJS in main Makefile; move prelink.o to main Makefile
  build: prepare to always invoke $(MAKE) from xen/, use $(obj)
  build: rework test/livepatch/Makefile
  build: rework cloc recipe
  build: fix enforce unique symbols for recent clang version
  build: build everything from the root dir, use obj=$subdir
  build: introduce if_changed_deps
  build: rename __LINKER__ to LINKER_SCRIPT
  build: hook kconfig into xen build system
  xen/tools/kconfig: fix build with -Wdeclaration-after-statement
  build: remove KBUILD_ specific from Makefile.host
  build: handle always-y and hostprogs-always-y
  build: start building the tools with the main makefiles
  build: add headers path to CFLAGS once for all archs
  build: generate x86's asm-macros.h with filechk
  build: clean-up "clean" rules of duplication
  build: rework "clean" to clean from the root dir
  build: use main rune to build host binary x86's mkelf32 and mkreloc
  build: rework coverage and ubsan CFLAGS handling
  build,x86: remove the need for build32.mk
  build: grab common EFI source files in arch specific dir
  build: replace $(BASEDIR) by $(objtree)
  build: replace $(BASEDIR) and use $(srctree)
  build: rework "headers*.chk" prerequisite in include/
  build: specify source tree in include/ for prerequisite
  build: shuffle main Makefile
  build: adding out-of-tree support to the xen build

 .gitignore                                   |   2 +
 xen/Kconfig                                  |   4 +-
 xen/Makefile                                 | 367 ++++++++++-------
 xen/Rules.mk                                 | 227 +++++++----
 xen/arch/arm/Makefile                        |  53 +--
 xen/arch/arm/arch.mk                         |   5 +-
 xen/arch/arm/efi/Makefile                    |   4 +-
 xen/arch/arm/include/asm/config.h            |   2 +-
 xen/arch/riscv/arch.mk                       |   2 -
 xen/arch/x86/Makefile                        | 204 ++++------
 xen/arch/x86/Rules.mk                        |   8 +-
 xen/arch/x86/arch.mk                         |  59 ++-
 xen/arch/x86/boot/Makefile                   |  57 ++-
 xen/arch/x86/boot/build32.mk                 |  40 --
 xen/arch/x86/efi/Makefile                    |  11 +-
 xen/build.mk                                 |  90 +++++
 xen/common/Makefile                          |  13 +-
 xen/common/efi/efi-common.mk                 |  16 +
 xen/common/libelf/Makefile                   |   4 +-
 xen/common/libfdt/Makefile                   |   8 +-
 xen/include/Makefile                         |  76 ++--
 xen/scripts/Kbuild.include                   |  69 +++-
 xen/scripts/Kconfig.include                  |   2 +-
 xen/scripts/Makefile.clean                   |  32 +-
 xen/{tools/kconfig => scripts}/Makefile.host |  37 +-
 xen/test/Makefile                            |   7 +-
 xen/test/livepatch/Makefile                  | 213 ++++------
 xen/tools/Makefile                           |  14 +-
 xen/tools/fixdep.c                           | 404 +++++++++++++++++++
 xen/tools/kconfig/Makefile                   |   3 +
 xen/tools/kconfig/Makefile.kconfig           | 106 -----
 xen/tools/kconfig/confdata.c                 |   2 +-
 xen/xsm/flask/Makefile                       |  43 +-
 xen/xsm/flask/policy/mkaccess_vector.sh      |   7 +-
 xen/xsm/flask/ss/Makefile                    |   3 +-
 35 files changed, 1371 insertions(+), 823 deletions(-)
 delete mode 100644 xen/arch/x86/boot/build32.mk
 create mode 100644 xen/build.mk
 create mode 100644 xen/common/efi/efi-common.mk
 rename xen/{tools/kconfig => scripts}/Makefile.host (85%)
 create mode 100644 xen/tools/fixdep.c
 delete mode 100644 xen/tools/kconfig/Makefile.kconfig

-- 
Anthony PERARD


