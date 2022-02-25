Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17024C4876
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279177.476758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcHr-0006ie-1Z; Fri, 25 Feb 2022 15:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279177.476758; Fri, 25 Feb 2022 15:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcHq-0006g4-Ug; Fri, 25 Feb 2022 15:13:38 +0000
Received: by outflank-mailman (input) for mailman id 279177;
 Fri, 25 Feb 2022 15:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcHp-0006fy-F9
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e28d66b-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:13:33 +0100 (CET)
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
X-Inumbo-ID: 7e28d66b-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KIhYkS7Gu6rrziwgHwY7wsgo17mkuu1fvf9ZT/ahnY8=;
  b=id1eF/w6/iDKAOd1Gj1ujsNOQ3u9wkSonJN7+ntMGIwFv0xyR2xzlGgQ
   mz5rxu0oZxbgN0fIqytfp1lC/n3PTs4cmGXcG8bDHmb6XGHUoRnxPpEXz
   kjI3teUn36pxueBdqfDV58LO9n/DRVZHRyrJAQyH3IfS9WQMFOM9/XFvD
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67264703
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XamYGqkmIzcizGZxAOAC2bfo5gwBJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcCmzXOvfcZmCmf91xOdjg8xsCvpXcnN82GVE/q3wzHyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DjWV7V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYQD53OpTok/ghUxBiKQNsHJdv17nKGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNmAxMEuYOHWjPH9OU7UBhrn5nED0SC10unG8p5Am43fcmVkZPL/Fb4OOJ43iqd9utkqRu
 G/u5WnyBRAectuFxlKt8Hihm+vOliPTQ58JGfuz8fsCqF+Owm0eDjUGWF39puO24mazX99ZI
 goJ9CsrsbM/6kWDScP0VBm15nWDu3Y0QMFMGuc37AWMzKv84AuDAGUACDlbZ7QOq8seVTEsk
 FiTkLvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKkxgQjIVc1LC7Oug5v+HjSY6
 yuDqTUzg/MPjc8B3ri/4XjKhSnpoonOSEgy/Aq/Y46+xlonPsj/PdXusAWFq6YbRGqEcrWfl
 HE9xcynyOsSMZGErhavUsQ3NZ6v6s/QZVUwnmVTN5Um8j2s/VuqcoZR/CxyKS9VDyoURdP6S
 BSN4F0Mvfe/KFPvNPYqONzpV6zG2IC9TYyNaxzCUjZZjnGdniej9TomW0Of1nuFfKMEwfBmY
 sfznSpB4B8n5UVbINieG7Z1PVwDnHlWKYbvqXbTlUXPPV22PiP9dFv9GAHSBt3VFYvdyOkvz
 /5RNtGR1zJUW/Dkby/c/OY7dA5WcCdnXMyr85QPLoZvxzaK/kl7Wpc9Jpt7JuRYc1l9zL+Ur
 hlRpGcCoLYAuZE3AVrTMS0yAF8edZ1+sWg6LUQR0aWAgBAejXKUxP5HLfMfJOB/nMQ6lKIcZ
 6RVKq2oX6UUIhyaqmt1UHUIhNE7HPhdrVnVZHTNjflWV8MIejElDfe/Jlq/rHRVV3Hv3Sb8y
 pX5vj7mrVM4b1wKJK7rhDiHkztdYVB1dDpOYnb1
IronPort-HdrOrdr: A9a23:opY5oKo7qkcARqRw88p/1ZwaV5oheYIsimQD101hICG8cqSj+P
 xG+85rsCMc6QxhP03I9urgBEDtex7hHP1OkOss1NWZPDUO0VHAROoJ0WKL+UyFJ8SUzIBgPM
 lbH5SWcOeAbmRHsQ==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="67264703"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, David Scott
	<dave@recoil.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Julien Grall
	<julien@xen.org>
Subject: [XEN PATCH v2 00/29] Toolstack build system improvement, toward non-recursive makefiles
Date: Fri, 25 Feb 2022 15:12:52 +0000
Message-ID: <20220225151321.44126-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.toolstack-build-system-v2

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

Anthony PERARD (29):
  tools/console: have one Makefile per program/directory
  tools/debugger/gdbsx: Fix and cleanup makefiles
  tools/examples: cleanup Makefile
  tools/firmware/hvmloader: rework Makefile
  tools/fuzz/libelf: rework makefile
  tools/fuzz/x86_instruction_emulator: rework makefile
  tools/helper: Cleanup Makefile
  tools/hotplug: cleanup Makefiles
  tools/libfsimage: Cleanup makefiles
  tools/xenpaging: Rework makefile
  tools/xenstore: Cleanup makefile
  tools/xentop: rework makefile
  tools/xentrace: rework Makefile
  libs: rename LDUSELIBS to LDLIBS and use it instead of APPEND_LDFLAGS
  libs: Remove need for *installlocal targets
  libs,tools/include: Clean "clean" targets
  libs: Rename $(SRCS-y) to $(OBJS-y)
  libs/guest: rename ELF_OBJS to LIBELF_OBJS
  libs/guest: rework CFLAGS
  libs/store: use of -iquote instead of -I
  libs/stat: Fix and rework python-bindings build
  libs/stat: Fix and rework perl-binding build
  .gitignore: Cleanup ignores of tools/libs/*/{headers.chk,*.pc}
  stubdom: introduce xenlibs.mk
  tools/libs: create Makefile.common to be used by stubdom build system
  tools/xenstore: introduce Makefile.common to be used by stubdom
  stubdom: build xenstore*-stubdom using new Makefile.common
  stubdom: xenlibs linkfarm, ignore non-regular files
  tools/ocaml: fix build dependency target

 stubdom/Makefile                              |  24 +-
 tools/Makefile                                |   2 +-
 tools/console/Makefile                        |  49 +---
 tools/console/client/Makefile                 |  39 ++++
 tools/console/daemon/Makefile                 |  50 +++++
 tools/debugger/gdbsx/Makefile                 |  20 +-
 tools/debugger/gdbsx/gx/Makefile              |  15 +-
 tools/debugger/gdbsx/xg/Makefile              |  25 +--
 tools/examples/Makefile                       |  25 +--
 tools/firmware/hvmloader/Makefile             |  16 +-
 tools/fuzz/libelf/Makefile                    |  21 +-
 tools/fuzz/x86_instruction_emulator/Makefile  |  32 ++-
 tools/helpers/Makefile                        |  25 ++-
 tools/hotplug/FreeBSD/Makefile                |  11 +-
 tools/hotplug/Linux/Makefile                  |  16 +-
 tools/hotplug/Linux/systemd/Makefile          |  16 +-
 tools/hotplug/NetBSD/Makefile                 |   9 +-
 tools/hotplug/common/Makefile                 |  16 +-
 tools/include/Makefile                        |   1 +
 tools/include/xen-foreign/Makefile            |   1 +
 tools/libfsimage/common/Makefile              |  11 +-
 tools/libfsimage/ext2fs-lib/Makefile          |   9 -
 tools/libfsimage/ext2fs/Makefile              |   9 -
 tools/libfsimage/fat/Makefile                 |   9 -
 tools/libfsimage/iso9660/Makefile             |  11 -
 tools/libfsimage/reiserfs/Makefile            |   9 -
 tools/libfsimage/ufs/Makefile                 |   9 -
 tools/libfsimage/xfs/Makefile                 |   9 -
 tools/libfsimage/zfs/Makefile                 |   9 -
 tools/libs/call/Makefile                      |   7 +-
 tools/libs/ctrl/Makefile                      |  50 +----
 tools/libs/devicemodel/Makefile               |   7 +-
 tools/libs/evtchn/Makefile                    |   7 +-
 tools/libs/foreignmemory/Makefile             |   7 +-
 tools/libs/gnttab/Makefile                    |   9 +-
 tools/libs/guest/Makefile                     | 100 +--------
 tools/libs/hypfs/Makefile                     |   4 +-
 tools/libs/light/Makefile                     | 209 +++++++++---------
 tools/libs/stat/Makefile                      |  72 +++---
 tools/libs/store/Makefile                     |  18 +-
 tools/libs/toolcore/Makefile                  |   2 +-
 tools/libs/toollog/Makefile                   |   3 +-
 tools/libs/util/Makefile                      |  23 +-
 tools/libs/vchan/Makefile                     |   9 +-
 tools/ocaml/libs/eventchn/Makefile            |   8 +-
 tools/ocaml/libs/mmap/Makefile                |   8 +-
 tools/ocaml/libs/xb/Makefile                  |   8 +-
 tools/ocaml/libs/xc/Makefile                  |   8 +-
 tools/ocaml/libs/xentoollog/Makefile          |   8 +-
 tools/ocaml/libs/xl/Makefile                  |   8 +-
 tools/ocaml/libs/xs/Makefile                  |   8 +-
 tools/xenpaging/Makefile                      |  24 +-
 tools/xenstore/Makefile                       |  94 +++-----
 tools/xentop/Makefile                         |  21 +-
 tools/xentrace/Makefile                       |  19 +-
 stubdom/xenlibs.mk                            |  13 ++
 tools/libfsimage/Rules.mk                     |  26 +--
 tools/libfsimage/common.mk                    |  11 +
 tools/libs/libs.mk                            |  17 +-
 tools/libs/guest/xg_offline_page.c            |   2 +-
 tools/ocaml/Makefile.rules                    |   2 +-
 .gitignore                                    |  35 ---
 tools/console/client/.gitignore               |   1 +
 tools/console/daemon/.gitignore               |   1 +
 tools/fuzz/libelf/.gitignore                  |   2 +
 .../fuzz/x86_instruction_emulator/.gitignore  |   7 +
 tools/libs/.gitignore                         |   2 +
 tools/libs/call/Makefile.common               |   6 +
 tools/libs/ctrl/Makefile.common               |  44 ++++
 tools/libs/devicemodel/Makefile.common        |   6 +
 tools/libs/evtchn/Makefile.common             |   6 +
 tools/libs/foreignmemory/Makefile.common      |   6 +
 tools/libs/gnttab/Makefile.common             |   8 +
 tools/libs/guest/Makefile.common              |  84 +++++++
 tools/libs/stat/bindings/swig/perl/.empty     |   1 -
 tools/libs/stat/bindings/swig/python/.empty   |   1 -
 tools/libs/toolcore/Makefile.common           |   1 +
 tools/libs/toollog/Makefile.common            |   2 +
 tools/xenstore/Makefile.common                |  33 +++
 79 files changed, 732 insertions(+), 824 deletions(-)
 create mode 100644 tools/console/client/Makefile
 create mode 100644 tools/console/daemon/Makefile
 create mode 100644 stubdom/xenlibs.mk
 create mode 100644 tools/libfsimage/common.mk
 create mode 100644 tools/console/client/.gitignore
 create mode 100644 tools/console/daemon/.gitignore
 create mode 100644 tools/fuzz/libelf/.gitignore
 create mode 100644 tools/fuzz/x86_instruction_emulator/.gitignore
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


