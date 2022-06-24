Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B51DC559E06
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355602.583345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnY-00059V-Pv; Fri, 24 Jun 2022 16:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355602.583345; Fri, 24 Jun 2022 16:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnY-00056E-LG; Fri, 24 Jun 2022 16:04:44 +0000
Received: by outflank-mailman (input) for mailman id 355602;
 Fri, 24 Jun 2022 16:04:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnW-0004qb-JA
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58f3da0c-f3d7-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 18:04:39 +0200 (CEST)
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
X-Inumbo-ID: 58f3da0c-f3d7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZnL4iDV/JErozwnMFG24hDXAd8++8V6DJ1eS0kuExCY=;
  b=FrCmoyV/K8tCwytg3rOVcwpnvyMFn+iC+fhOriYWG67A3ekQ2unVQpwQ
   J04YA4cNzIQgkPzW1K5XFSEOjd2QRgzoynazS6OWpue+0goTuxp0r3+n7
   mskwmPAaJnvrpbz5EwthKeRc3wV/3lQVSZmSJiBs0ITvDTDUnZi0kALh7
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73701972
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:z/dWV6k4MZZMojTgYLzakiDo5gwYJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdDT3SPPeLZWL9Ktx3a4mxpkwPusKGm4dhHQRs+H9gRiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EgLd9IR2NYy24DnWV/V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYCig0H/zXvNwmVxxAUBtiep1s+r/mPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGMmU3NUWfOXWjPH9UAc4BorqWp0CmfhII9lWki6klwGvqmVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHMCezBKV/3TqgfXA9QvgQ54bHrC88v9sgXWQy3YVBRlQUkG0ydGjjVW0QdVYK
 Eo89S8nrKx0/0uuJvHwWxC+qTiZsB8ZR8FdDeQS7xuEwa7ZpQ2eAwAsTCNFadEgnN87Q3otz
 FDht9HmHzt0q5WOVGmQsLyTqFuaNTAOKG4eZQcNVQYf/8T4u4Y3kw7OSdB4VqWyi7XdCTz2h
 jyHsiU6r7ESltIQkbW2+0jdhDChrYSPSRQ6ji3bV3yoxhl0b4mkY8qv81ezxfRKIZudT1KBl
 GMZgMXY5+cLZbmBmyCAT/8ENK247PaCdjvHiBhgGIdJyti20yf9J8YKumg4fRo3dJZfEdP0X
 KPNkUB++b4CJ1+SVqtye8GLF4Ma56rgNMuwA5g4ceFyjohNmB6vpX8zOxbLgjiywCDAgolkZ
 87FLJ/E4WIyTP0+kWHoH7p1PaoDnHhW+I/FeXzsI/1LO5K6bWXdd7oKOUDmggsRvPLd+1W9H
 zqy2qK3J/RjvA7WOHC/HXY7dwxiEJTCLcmeRzZrXuCCOBF6P2oqFuXcx7gsE6Q8wfkLzr+Zp
 y7hAhcHoLYauZEhAV/SApyEQOOHYHqChShjYXxE0aiAgRDPnrpDHI9ALsBqLNHLBcRozOJuT
 ultRvhs9s9nE2ydkxxENMGVhNU7KHyD2FLfVwL4MWNXV8MxGGT0FirMI1KHGN8mVXHs66PTY
 tSIi2vmfHb0b14zUp+INK3+lA3ZULp0sLsaYnYk6+J7IC3EmLWG4QSr5hPrC6ng8Sn++wY=
IronPort-HdrOrdr: A9a23:RPIPMqDsij/SHLvlHemm55DYdb4zR+YMi2TC1yhKJiC9Ffbo8v
 xG/c5rsiMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILBFvAH0WKI+VPd8kPFmtK1rZ
 0QEJRDNA==
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="73701972"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Juergen Gross <jgross@suse.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, George Dunlap <george.dunlap@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "David
 Scott" <dave@recoil.org>, Stefano Stabellini <sstabellini@kernel.org>, "Tim
 Deegan" <tim@xen.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH v3 00/25] Toolstack build system improvement, toward non-recursive makefiles
Date: Fri, 24 Jun 2022 17:03:57 +0100
Message-ID: <20220624160422.53457-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.toolstack-build-system-v3

Changes in v3:
- rebased
- several new patches, starting with 13/25 "tools/libs/util: cleanup Makefile"
- introducing macros to deal with linking with in-tree xen libraries
- Add -Werror to CFLAGS for all builds in tools/

Changes in v2:
- one new patch
- other changes described in patch notes

Hi everyone,

I've been looking at reworking the build system we have for the "tools/", and
transforming it to something that suit it better. There are a lot of
dependencies between different sub-directories so it would be nice if GNU make
could actually handle them. This is possible with "non-recursive makefiles".

With non-recursive makefiles, make will have to load/include all the makefiles
and thus will have complete overview of all the dependencies. This will allow
make to build the necessary targets in other directory, and we won't need to
build sub-directories one by one.

To help with this transformation, I've chosen to go with a recent project
called "subdirmk". It help to deal with the fact that all makefiles will share
the same namespace, it is hooked into autoconf, we can easily run `make` from
any subdirectory. Together "autoconf" and "subdirmk" will also help to get
closer to be able to do out-of-tree build of the tools, but I'm mainly looking
to have non-recursive makefile.

Link to the project:
    https://www.chiark.greenend.org.uk/ucgi/~ian/git/subdirmk.git/

But before getting to the main course, I've got quite a few cleanup and some
changes to the makefiles. I start the patch series with patches that remove old
left over stuff, then start reworking makefiles. They are some common changes like
removing the "build" targets in many places as "all" would be the more common
way to spell it and "all" is the default target anyway. They are other changes
related to the conversion to "subdirmk", I start to use the variable $(TARGETS)
in several makefiles, this variable will have a special meaning in subdirmk
which will build those target by default.

As for the conversion to non-recursive makefile, with subdirmk, I have this WIP
branch, it contains some changes that I'm trying out, some notes, and the
conversion, one Makefile per commit. Cleanup are still needed, some makefile
not converted yet, but it's otherwise mostly done.

    https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.toolstack-build-system-v1-wip-extra

With that branch, you could tried something like:
    ./configure; cd tools/xl; make
and `xl` should be built as well as all the xen library needed.
Also, things like `make clean` or rebuild should be faster in the all tools/
directory.

Cheers,

Anthony PERARD (25):
  tools/console: have one Makefile per program/directory
  tools/debugger/gdbsx: Fix and cleanup makefiles
  tools/examples: cleanup Makefile
  tools/firmware/hvmloader: rework Makefile
  tools/fuzz/libelf: rework makefile
  tools/fuzz/x86_instruction_emulator: rework makefile
  tools/hotplug: cleanup Makefiles
  tools/libfsimage: Cleanup makefiles
  tools/xenpaging: Rework makefile
  tools/xentop: rework makefile
  tools/xentrace: rework Makefile
  .gitignore: Cleanup ignores of tools/libs/*/{headers.chk,*.pc}
  tools/libs/util: cleanup Makefile
  tools/flask/utils: list build targets in $(TARGETS)
  libs/libs.mk: Rename $(LIB) to $(TARGETS)
  libs/libs.mk: Remove the need for $(PKG_CONFIG_INST)
  libs/libs.mk: Rework target headers.chk dependencies
  tools: Introduce $(xenlibs-rpath,..) to replace $(SHDEPS_lib*)
  tools: Introduce $(xenlibs-ldlibs, ) macro
  tools: Introduce $(xenlibs-ldflags, ) macro
  tools/helper: Cleanup Makefile
  tools/console: Use $(xenlibs-ldlibs,)
  tools/helpers: Fix build of xen-init-dom0 with -Werror
  tools: Add -Werror by default to all tools/
  tools: Remove -Werror everywhere else

 tools/configure.ac                            |  1 +
 tools/Makefile                                |  2 +-
 tools/console/Makefile                        | 49 +----------------
 tools/console/client/Makefile                 | 37 +++++++++++++
 tools/console/daemon/Makefile                 | 45 +++++++++++++++
 tools/debugger/gdbsx/Makefile                 | 20 +++----
 tools/debugger/gdbsx/gx/Makefile              | 15 +++--
 tools/debugger/gdbsx/xg/Makefile              | 25 +++------
 tools/debugger/kdd/Makefile                   |  1 -
 tools/examples/Makefile                       | 25 ++-------
 tools/firmware/hvmloader/Makefile             | 16 +++---
 tools/flask/utils/Makefile                    | 11 ++--
 tools/fuzz/cpu-policy/Makefile                |  2 +-
 tools/fuzz/libelf/Makefile                    | 21 ++++---
 tools/fuzz/x86_instruction_emulator/Makefile  | 32 +++++------
 tools/golang/xenlight/Makefile                |  2 +-
 tools/helpers/Makefile                        | 23 ++++----
 tools/hotplug/FreeBSD/Makefile                | 11 +---
 tools/hotplug/Linux/Makefile                  | 16 ++----
 tools/hotplug/Linux/systemd/Makefile          | 16 +++---
 tools/hotplug/NetBSD/Makefile                 |  9 +--
 tools/hotplug/common/Makefile                 | 16 ++----
 tools/libfsimage/common/Makefile              | 11 +---
 tools/libfsimage/ext2fs-lib/Makefile          |  9 ---
 tools/libfsimage/ext2fs/Makefile              |  9 ---
 tools/libfsimage/fat/Makefile                 |  9 ---
 tools/libfsimage/iso9660/Makefile             | 11 ----
 tools/libfsimage/reiserfs/Makefile            |  9 ---
 tools/libfsimage/ufs/Makefile                 |  9 ---
 tools/libfsimage/xfs/Makefile                 |  9 ---
 tools/libfsimage/zfs/Makefile                 |  9 ---
 tools/libs/util/Makefile                      |  3 +-
 tools/misc/Makefile                           |  1 -
 tools/tests/cpu-policy/Makefile               |  2 +-
 tools/tests/depriv/Makefile                   |  2 +-
 tools/tests/resource/Makefile                 |  1 -
 tools/tests/tsx/Makefile                      |  1 -
 tools/tests/xenstore/Makefile                 |  1 -
 tools/xcutils/Makefile                        |  2 -
 tools/xenmon/Makefile                         |  1 -
 tools/xenpaging/Makefile                      | 25 ++++-----
 tools/xenpmd/Makefile                         |  1 -
 tools/xentop/Makefile                         | 23 ++++----
 tools/xentrace/Makefile                       | 21 +++----
 tools/xl/Makefile                             |  2 +-
 tools/Rules.mk                                | 55 ++++++++++++++-----
 tools/debugger/gdbsx/Rules.mk                 |  2 +-
 tools/firmware/Rules.mk                       |  2 -
 tools/libfsimage/Rules.mk                     | 26 +++------
 tools/libfsimage/common.mk                    | 11 ++++
 tools/libs/libs.mk                            | 31 +++++------
 tools/helpers/xen-init-dom0.c                 |  2 +
 tools/ocaml/common.make                       |  2 +-
 .gitignore                                    | 35 ------------
 config/Tools.mk.in                            |  1 +
 tools/configure                               | 26 +++++++++
 tools/console/client/.gitignore               |  1 +
 tools/console/daemon/.gitignore               |  1 +
 tools/fuzz/libelf/.gitignore                  |  2 +
 .../fuzz/x86_instruction_emulator/.gitignore  |  7 +++
 tools/libs/.gitignore                         |  2 +
 tools/xenstore/Makefile.common                |  1 -
 62 files changed, 349 insertions(+), 424 deletions(-)
 create mode 100644 tools/console/client/Makefile
 create mode 100644 tools/console/daemon/Makefile
 create mode 100644 tools/libfsimage/common.mk
 create mode 100644 tools/console/client/.gitignore
 create mode 100644 tools/console/daemon/.gitignore
 create mode 100644 tools/fuzz/libelf/.gitignore
 create mode 100644 tools/fuzz/x86_instruction_emulator/.gitignore

-- 
Anthony PERARD


