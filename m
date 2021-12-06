Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDEC46A1EA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239416.414953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOE-0005vc-Rj; Mon, 06 Dec 2021 17:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239416.414953; Mon, 06 Dec 2021 17:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOE-0005ts-OT; Mon, 06 Dec 2021 17:02:58 +0000
Received: by outflank-mailman (input) for mailman id 239416;
 Mon, 06 Dec 2021 17:02:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOD-0005ta-1F
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:02:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59a3eda5-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:02:55 +0100 (CET)
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
X-Inumbo-ID: 59a3eda5-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810175;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/MLBUm6LRp5jlDNoHboN38G/J77fSfY6CJn4+sPxHV8=;
  b=femy/F2Wg7nBcNN7sBvqo7XwuWZNj7OTYSldI4yY6JcB1NOmtCgaZj2H
   gWtQD5h+4dnwhpuDsmMNsKU9XmS6zFKSrcI7u6vn9lpyvDcLjJsekPMlO
   AZlXtYmDZ/lEbOvpTb4wvyU0t+3Y4oZ+cm9Db3c18xuDXlRdQzQ4Mq/nP
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CJ5nYeJZiZtaaIXMhDDYXS7M5ttIaBarD0oHlaFkXHVilSxn8A8Kymy8SWQAimN8m+HgynPcOX
 QTyrMfVKbrCz0Un4Q7Zoh+c8ddW9FCMR/3DdZjmXVVPckvNjLZ6Zr2XAXsIXAUh8GlS+wPSU7s
 UZ8d+9607pRlFT6l9tVbzaKIH2vXW0xodJd25z1i8CFNhHzGbDW//47VPxmU9gxYx9Mbg4ZuRm
 GbR7tRPzZ2pTnNAg86mDtP8wyJXRy1biPqbXCckhMNbwyAj3K3yW+WjRS2Av5u3WIVL94tAWce
 Y6kPrKlPhpnLFdClb0ilE3Bv
X-SBRS: 5.1
X-MesageID: 59323913
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Lc8Un6KlMCpPxtJKFE+R+5MlxSXFcZb7ZxGr2PjKsXjdYENShjAPn
 DEdWjiDOK2DYDb8f48ibdzlpk8PupGDytFqGgNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eg7xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Onutv8
 ch2saaIcgICE5TqgsYkcURxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gph3ZoVTK+FD
 yYfQThQTA3EYT4QA1YGEMMjxduGr0H6dQQN/Tp5ooJoujOOnWSdyoPFPd7YfNXMWMtUm1qDq
 3zP12PjCxoeOZqUzj/t2n6jiuLAhyrTRJMZFLr+8OVjxlKU2AQ7ExQTSFa/5+W5i0S3RtZDA
 0ES4W8qvK80skuxQbHVQBmQsHOC+BkGVLJ4EfA+6QyL4rrZ5UCeHGdsZjxOcts9r+ctWCcnk
 FSOmrvBHidzubeYTXac8La8rj6oPyURa2gYakcsQQIb7vH5rYo0jxaJScxseIa8iMH1Hjfhh
 SiHtiEki50ciMcK0+Ow+lWvqyKhoN3FQxA44i3TX3m59UVpaYi9fYuq5FPHq/FaI+6xQkGau
 XkYm+CX9O0UEYyWjyuJXfkMG7eyof2CNVX0g1RiAp0g/DSF4GO4cMZb5zQWDEZ2MO4UdDnxe
 kjRtAhNophJMxOXgbRfOtzrTZ5wlO65SIqjBqu8gsdyjoZZMw684hhzXkqq51vou2UVt7sdA
 LXGWJP5ZZoFMphPwD2zTuYb9LYkwCEi2G/eLazGIwSbPam2PyDMF+pcWLeaRqVgtf7f/l2Jm
 zpKH5LSk003bQHoXsXAHWf/x3guJGNzO535otc/mgWrcls/QzFJ5xM8LNocl21Zc0Z9y76gE
 pKVABYwJL/DaZvvc1/ihpdLMuyHYHqHhShnVRHAxH7xs5TZXa6h7b0Ea7w8dqQ9+epowJZcF
 qdeK5raU6kVEGqYq1zxiKURSqQ4LnxHYirUYEKYjMUXJcY8F2QlBPe6FucQyMX+JnXu7pZvy
 1FR/gjaXYACV2xf4DX+M5qSI6eKlSFFwopaBhKQSvEKIRmE2NU6ekTZ065sS+lReEqr+9dv/
 1vPafvujbKW+NFdHRigrf3skrpF5MMiRBcHRDeCsu7tXcQYl0L6qbJ9vC+zVWi1fAvJFG+KP
 425Ftnwb68KmkhkqY15H+o5xK4y/YK39bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFZ3ZOq0yvxJyCLZ6u44IRum6XYvrqaHS0hbIzKFlDdZcOluKIogz
 Op44JwW5gWzhwAEKNGDiiwIpW2AImZZC/cst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP3u0OyFDDfnw/EWn28dBc3Zle6gpXyFIiJkiSnoaXjPEAwxAMoy88SR5Yz0sb3rsra
 HRrLUB8OY6H4yxs2JpYR2mpFgxMWE+Z90j2xwdbnWHVVRD1BGnELWl7MueR5kEJtWlbe2EDr
 r2fzW/kVxfsfd3wgXRuCRI09aS7QIwj7BDGleCmA9+BTsszbjfSi6OzYXYF9kn8CsQriUyb/
 eRn8Y6cs0Eg2fL8d0HjN7Sn6A==
IronPort-HdrOrdr: A9a23:bqdbPKrOoytuDfXa1HNlwfcaV5oheYIsimQD101hICG8cqSj+P
 xG+85rsCMc6QxhP03I9urgBEDtex7hHP1OkOss1NWZPDUO0VHAROoJ0WKL+UyFJ8SUzIBgPM
 lbH5SWcOeAbmRHsQ==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59323913"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Andrew Cooper <andrew.cooper3@citrix.com>, "Elena
 Ufimtseva" <elena.ufimtseva@oracle.com>, Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 00/57] Toolstack build system improvement, toward non-recursive makefiles
Date: Mon, 6 Dec 2021 17:01:43 +0000
Message-ID: <20211206170241.13165-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.toolstack-build-system-v1

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

stubdom has some changes also as it won't be able to use tools/ Makefiles
as-is anymore.

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

Anthony PERARD (57):
  .gitignore: Non existing toolcore/include files.
  tools/configure.ac: Remove left over system_aio
  tools/Rules.mk: Remove $(CFLAGS.opic) from %.opic: %.S
  libs: Remove _paths.h from libs ctrl and util.
  libs: Remove -Iinclude from CFLAGS
  libs/libs.mk: Remove generic variable that already exist
  libs/guest: Drop spurious include in Makefile
  libs/light: Remove non-existing CFLAGS_libxl.o var
  libs/light: Remove -I.
  libs/stat: Remove duplicated CFLAGS from deps
  libs/store: Remove PKG_CONFIG_REMOVE
  tools: remove some unneeded subdir-distclean-* targets
  tools/firmware/hvmloader: remove "subdirs-*" prerequisite
  tools/flask/utils: remove unused variables/targets from Makefile
  tools/libacpi: cleanup Makefile, don't check for iasl binary
  tools/ocaml: Remove generation of _paths.h
  tools/xl: Remove unnecessary -I. from CFLAGS
  tools: Use config.h from autoconf instead of "buildmakevars2header"
  tools/configure.ac: Create ZLIB_LIBS and ZLIB_CFLAGS
  tools/Rules.mk: introduce FORCE target
  tools/include/xen-foreign: avoid to rely on default .SUFFIXES
  tools/console: have one Makefile per program/directory
  tools/debugger: Allow make to recurse into debugger/
  tools/debugger/gdbsx: Fix and cleanup makefiles
  tools/examples: cleanup Makefile
  tools/firmware/hvmloader: rework Makefile
  tools/fuzz/libelf: rework makefile
  tools/fuzz/x86_instruction_emulator: rework makefile
  tools/helper: Cleanup Makefile
  tools/hotplug: cleanup Makefiles
  tools/libfsimage: Cleanup makefiles
  tools/misc: rework Makefile
  tools/vchan: Collect targets in TARGETS
  tools/xcutils: rework Makefile
  tools/xenpaging: Rework makefile
  tools/xenstore: Cleanup makefile
  tools/xentop: rework makefile
  tools/xenstrace: rework Makefile
  libs: Remove both "libs" and "build" target
  libs: rename LDUSELIBS to LDLIBS and use it instead of APPEND_LDFLAGS
  libs: Remove need for *installlocal targets
  libs,tools/include: Clean "clean" targets
  libs: Rename $(SRCS-y) to $(OBJS-y)
  libs/guest: rename ELF_OBJS to LIBELF_OBJS
  libs/guest: rework CFLAGS
  libs/store: use of -iquote instead of -I
  libs/stat: Fix and rework python-bindings build
  libs/stat: Fix and rework perl-binding build
  libs/toolcore: don't install xentoolcore_internal.h anymore
  tools/Rules.mk: Cleanup %.pc rules
  .gitignore: Cleanup ignores of tools/libs/*/{headers.chk,*.pc}
  stubdom: only build libxen*.a from tools/libs/
  stubdom: introduce xenlibs.mk
  tools/libs: create Makefile.common to be used by stubdom build system
  tools/xenstore: introduce Makefile.common to be used by stubdom
  stubdom: build xenstore*-stubdom using new Makefile.common
  stubdom: xenlibs linkfarm, ignore non-regular files

 tools/configure.ac                           |  20 +-
 Config.mk                                    |   9 -
 stubdom/xenlibs.mk                           |  13 ++
 tools/Rules.mk                               |   9 +-
 tools/libfsimage/Rules.mk                    |  26 +--
 tools/libfsimage/common.mk                   |  11 +
 tools/libs/libs.mk                           |  36 +--
 .gitignore                                   |  44 +---
 config/Tools.mk.in                           |   3 +-
 configure                                    |  45 ++++
 docs/configure                               |  45 ++++
 m4/paths.m4                                  |   9 +
 stubdom/Makefile                             |  26 ++-
 tools/Makefile                               |  32 +--
 tools/config.h.in                            |  27 +++
 tools/configure                              |  67 +++++-
 tools/console/Makefile                       |  57 +----
 tools/console/client/Makefile                |  39 ++++
 tools/console/client/main.c                  |   1 -
 tools/console/daemon/Makefile                |  50 +++++
 tools/console/daemon/main.c                  |   1 -
 tools/debugger/Makefile                      |   8 +
 tools/debugger/gdbsx/Makefile                |  20 +-
 tools/debugger/gdbsx/gx/Makefile             |  15 +-
 tools/debugger/gdbsx/xg/Makefile             |  25 +--
 tools/examples/Makefile                      |  21 +-
 tools/firmware/Makefile                      |   3 -
 tools/firmware/hvmloader/Makefile            |  18 +-
 tools/flask/utils/Makefile                   |  16 +-
 tools/fuzz/libelf/Makefile                   |  21 +-
 tools/fuzz/x86_instruction_emulator/Makefile |  32 ++-
 tools/helpers/Makefile                       |  31 +--
 tools/helpers/init-xenstore-domain.c         |   1 -
 tools/hotplug/FreeBSD/Makefile               |  11 +-
 tools/hotplug/Linux/Makefile                 |  16 +-
 tools/hotplug/Linux/systemd/Makefile         |  16 +-
 tools/hotplug/NetBSD/Makefile                |   9 +-
 tools/hotplug/common/Makefile                |  16 +-
 tools/include/Makefile                       |   1 +
 tools/include/xen-foreign/Makefile           |   9 +-
 tools/libacpi/Makefile                       |  17 +-
 tools/libacpi/README                         |   6 -
 tools/libfsimage/common/Makefile             |  11 +-
 tools/libfsimage/ext2fs-lib/Makefile         |   9 -
 tools/libfsimage/ext2fs/Makefile             |   9 -
 tools/libfsimage/fat/Makefile                |   9 -
 tools/libfsimage/iso9660/Makefile            |  11 -
 tools/libfsimage/reiserfs/Makefile           |   9 -
 tools/libfsimage/ufs/Makefile                |   9 -
 tools/libfsimage/xfs/Makefile                |   9 -
 tools/libfsimage/zfs/Makefile                |   9 -
 tools/libs/call/Makefile                     |   7 +-
 tools/libs/call/Makefile.common              |   6 +
 tools/libs/ctrl/Makefile                     |  55 +----
 tools/libs/ctrl/Makefile.common              |  44 ++++
 tools/libs/ctrl/xc_private.h                 |   2 -
 tools/libs/devicemodel/Makefile              |   7 +-
 tools/libs/devicemodel/Makefile.common       |   6 +
 tools/libs/evtchn/Makefile                   |   7 +-
 tools/libs/evtchn/Makefile.common            |   6 +
 tools/libs/foreignmemory/Makefile            |   7 +-
 tools/libs/foreignmemory/Makefile.common     |   6 +
 tools/libs/gnttab/Makefile                   |   9 +-
 tools/libs/gnttab/Makefile.common            |   8 +
 tools/libs/guest/Makefile                    | 109 +--------
 tools/libs/guest/Makefile.common             |  84 +++++++
 tools/libs/guest/xg_dom_core.c               |   1 -
 tools/libs/guest/xg_offline_page.c           |   2 +-
 tools/libs/hypfs/Makefile                    |   4 +-
 tools/libs/light/Makefile                    | 222 +++++++++----------
 tools/libs/light/libxl_dom.c                 |   2 -
 tools/libs/light/libxl_internal.h            |   1 -
 tools/libs/light/libxl_utils.c               |   1 -
 tools/libs/stat/Makefile                     |  70 +++---
 tools/libs/stat/bindings/swig/perl/.empty    |   1 -
 tools/libs/stat/bindings/swig/python/.empty  |   1 -
 tools/libs/stat/xenstat_qmp.c                |   1 -
 tools/libs/store/Makefile                    |  20 +-
 tools/libs/toolcore/Makefile                 |  10 +-
 tools/libs/toolcore/Makefile.common          |   9 +
 tools/libs/toollog/Makefile                  |   3 +-
 tools/libs/toollog/Makefile.common           |   2 +
 tools/libs/util/Makefile                     |  27 +--
 tools/libs/vchan/Makefile                    |   9 +-
 tools/misc/Makefile                          |  16 +-
 tools/ocaml/xenstored/Makefile               |   7 -
 tools/ocaml/xenstored/systemd_stubs.c        |   2 -
 tools/vchan/Makefile                         |   6 +-
 tools/xcutils/Makefile                       |  15 +-
 tools/xenpaging/Makefile                     |  24 +-
 tools/xenstore/Makefile                      |  83 +++----
 tools/xenstore/Makefile.common               |  34 +++
 tools/xentop/Makefile                        |  19 +-
 tools/xentrace/Makefile                      |  11 +-
 tools/xl/Makefile                            |   9 +-
 tools/xl/xl.h                                |   1 -
 96 files changed, 953 insertions(+), 990 deletions(-)
 create mode 100644 stubdom/xenlibs.mk
 create mode 100644 tools/libfsimage/common.mk
 create mode 100644 tools/console/client/Makefile
 create mode 100644 tools/console/daemon/Makefile
 create mode 100644 tools/debugger/Makefile
 create mode 100644 tools/libs/call/Makefile.common
 create mode 100644 tools/libs/ctrl/Makefile.common
 create mode 100644 tools/libs/devicemodel/Makefile.common
 create mode 100644 tools/libs/evtchn/Makefile.common
 create mode 100644 tools/libs/foreignmemory/Makefile.common
 create mode 100644 tools/libs/gnttab/Makefile.common
 create mode 100644 tools/libs/guest/Makefile.common
 delete mode 100644 tools/libs/stat/bindings/swig/perl/.empty
 delete mode 100644 tools/libs/stat/bindings/swig/python/.empty
 create mode 100644 tools/libs/toolcore/Makefile.common
 create mode 100644 tools/libs/toollog/Makefile.common
 create mode 100644 tools/xenstore/Makefile.common

-- 
Anthony PERARD


