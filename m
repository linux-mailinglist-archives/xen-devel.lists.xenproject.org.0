Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48E590512
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384782.620238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMk-0003EA-0Y; Thu, 11 Aug 2022 16:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384782.620238; Thu, 11 Aug 2022 16:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMj-0003B1-Sq; Thu, 11 Aug 2022 16:49:01 +0000
Received: by outflank-mailman (input) for mailman id 384782;
 Thu, 11 Aug 2022 16:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBMi-0003Aq-DH
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d5f7607-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:48:58 +0200 (CEST)
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
X-Inumbo-ID: 7d5f7607-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236538;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fkvuhsSqGjXFdyaMPkxvSxKuC8JTZ5Zq5j+rCFjjze4=;
  b=hMLha29TAwX1nUTvegNZU4f/zmPX3jyJC2kxr2/Bk8mN5dbW/rxLkLP9
   PYdQm5NOqzvvmNrsKczFlMzsTMfqfE+lo8mpHfg83t90aNWwc9+MNZSKQ
   Q4lAk1bqUZRAN9HVBYkoDgTLbQD4KAaAL7FGpz9IYZ8IT9abNCa8/Ko5p
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77134651
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9v+mx68icNaWz2tKd6XrDrUDFH6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GAbXjqCO6uINGX3ftwkbN6ypBsD7ZHVm9FiGwtu/388E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM25ayo0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGB000EpxI4v5LATtf2
 fBfeA9RUj29vrfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoahtTOlARGdQmkf2hnHXXeDxEslOF46Ew5gA/ySQuj+G2bISII7RmQ+1wkGeZn
 335uF3YIRE4N8XB4wucrVOz07qncSTTB9tJSezQGuRRqEaI2mUZBRkSVF26ifq0kEizX5RYM
 UN80igzqak/8mS7Q9+7WAe3yFabujYMVtwWFPc1gCmB0rHR4hqZLmEcQyRddcc9s8srWT0t0
 ETPlNTsbRRzsbi9WX+bsLCOoluaOycPKnQZTTQZVgZD6N7myKkpiQnFVNFkE6idgdj8GDW2y
 DePxAAuirNWgcMV2qGT+VHcnynqtpXPVhQy5AjcQiSi9AwRTIOhaoqhr0XV7PNcN4uHR3GGp
 nEPn8XY5+cLZbmBnTKAaP8AF7ao47CCKjK0qVxlEoQl9j+t02W+Zo0W6zZ7THqFKe5dJ2WvO
 hWK/1oMutkDZxNGcJObfaq6B8YF3Pj4DejlDOH4Yp0eXcRNWTG+qXQGiVGr44z9rKQ9ufhhZ
 8/DIJn1VChy5bdPl2TvGbpEuVM/7mVnnD6IG8imp/iy+eDGDEN5X4vpJ7dnggoRyKqf6DvY/
 N9EXydh40UOCbauCsU7HGN6ELzrEZTYLcqvwyCvXrTfSjeK4Ul4YxMr/ZsvepZ+g4NenfrS8
 3e2VydwkQSh3SWYcVzbOi05MtsDuKqTSlplVRHAwH7ygyRzCWpRxP53m2QLkUkPq7U4kK8co
 wgtcMScGPVfIgn6F8AmRcCk9ORKKUX07T9iygL/P1DTibY8GFGSkjIlFyOznBQz4t2f6ZJi/
 +H9jVOHGPLuhW1KVa7rVR5m9Hvp1VB1pQ64dxKgzgV7EKk0zLVXFg==
IronPort-HdrOrdr: A9a23:4+6yDKpglYo7/iZTrsHsxC0aV5oneYIsimQD101hICG8cqSj+f
 xG+85rsSMc6QxhPk3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakrDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77134651"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, David Scott
	<dave@recoil.org>, George Dunlap <george.dunlap@citrix.com>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Christian Lindig <christian.lindig@citrix.com>,
	"Wei Liu" <wl@xen.org>, Tim Deegan <tim@xen.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [XEN PATCH v4 00/32] Toolstack build system improvement, toward non-recursive makefiles
Date: Thu, 11 Aug 2022 17:48:13 +0100
Message-ID: <20220811164845.38083-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.toolstack-build-system-v4

Changes in v4:
- several new patches
- some changes to other patches listed in their changelogs

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

Anthony PERARD (32):
  tools/debugger/gdbsx: Fix and cleanup makefiles
  tools/firmware/hvmloader: rework Makefile
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
  tools: Add -Werror by default to all tools/
  tools: Remove -Werror everywhere else
  tools/hotplug: Generate "hotplugpath.sh" with configure
  libs/light/gentypes.py: allow to generate headers in subdirectory
  git-checkout.sh: handle running git-checkout from a different
    directory
  libs: Avoid exposing -Wl,--version-script to other built library
  libs: Fix auto-generation of version-script for unstable libs
  tools/include: Rework Makefile
  libs/light: Rework acpi table build targets
  libs/light: Rework generation of include/_libxl_*.h
  libs/light: Rework targets prerequisites
  libs/light: Makefile cleanup
  tools/golang/xenlight: Rework gengotypes.py and generation of *.gen.go

 tools/configure.ac                            |  2 +
 tools/Makefile                                |  2 +-
 tools/console/client/Makefile                 |  4 +-
 tools/console/daemon/Makefile                 |  7 +-
 tools/debugger/gdbsx/Makefile                 | 20 +++---
 tools/debugger/gdbsx/gx/Makefile              | 15 ++--
 tools/debugger/gdbsx/xg/Makefile              | 25 ++-----
 tools/debugger/kdd/Makefile                   |  1 -
 tools/firmware/hvmloader/Makefile             | 19 +++--
 tools/flask/utils/Makefile                    | 11 ++-
 tools/fuzz/cpu-policy/Makefile                |  2 +-
 tools/fuzz/x86_instruction_emulator/Makefile  | 35 +++++----
 tools/golang/xenlight/Makefile                |  8 ++-
 tools/helpers/Makefile                        | 23 +++---
 tools/hotplug/FreeBSD/Makefile                | 11 +--
 tools/hotplug/Linux/Makefile                  | 16 ++---
 tools/hotplug/Linux/systemd/Makefile          | 16 ++---
 tools/hotplug/NetBSD/Makefile                 |  9 +--
 tools/hotplug/common/Makefile                 | 20 ++----
 tools/include/Makefile                        | 28 ++++----
 tools/libfsimage/common/Makefile              | 11 +--
 tools/libfsimage/ext2fs-lib/Makefile          |  9 ---
 tools/libfsimage/ext2fs/Makefile              |  9 ---
 tools/libfsimage/fat/Makefile                 |  9 ---
 tools/libfsimage/iso9660/Makefile             | 11 ---
 tools/libfsimage/reiserfs/Makefile            |  9 ---
 tools/libfsimage/ufs/Makefile                 |  9 ---
 tools/libfsimage/xfs/Makefile                 |  9 ---
 tools/libfsimage/zfs/Makefile                 |  9 ---
 tools/libs/call/Makefile                      |  1 +
 tools/libs/ctrl/Makefile                      |  3 -
 tools/libs/devicemodel/Makefile               |  1 +
 tools/libs/evtchn/Makefile                    |  1 +
 tools/libs/foreignmemory/Makefile             |  1 +
 tools/libs/gnttab/Makefile                    |  1 +
 tools/libs/guest/Makefile                     |  3 -
 tools/libs/hypfs/Makefile                     |  1 +
 tools/libs/light/Makefile                     | 72 +++++++++++--------
 tools/libs/stat/Makefile                      |  2 +-
 tools/libs/store/Makefile                     |  1 +
 tools/libs/toolcore/Makefile                  |  1 +
 tools/libs/toollog/Makefile                   |  1 +
 tools/libs/util/Makefile                      |  6 +-
 tools/libs/vchan/Makefile                     |  3 -
 tools/misc/Makefile                           |  1 -
 tools/tests/cpu-policy/Makefile               |  2 +-
 tools/tests/depriv/Makefile                   |  2 +-
 tools/tests/resource/Makefile                 |  1 -
 tools/tests/tsx/Makefile                      |  1 -
 tools/tests/xenstore/Makefile                 |  1 -
 tools/xcutils/Makefile                        |  2 -
 tools/xenmon/Makefile                         |  1 -
 tools/xenpaging/Makefile                      | 25 ++++---
 tools/xenpmd/Makefile                         |  1 -
 tools/xentop/Makefile                         | 23 +++---
 tools/xentrace/Makefile                       | 29 +++-----
 tools/xl/Makefile                             |  2 +-
 tools/Rules.mk                                | 55 ++++++++++----
 tools/debugger/gdbsx/Rules.mk                 |  2 +-
 tools/firmware/Rules.mk                       |  2 -
 tools/libfsimage/Rules.mk                     | 26 +++----
 tools/libfsimage/common.mk                    | 11 +++
 tools/libs/libs.mk                            | 48 +++++++------
 tools/libs/light/libxl_x86_acpi.c             |  2 +-
 tools/ocaml/common.make                       |  2 +-
 .gitignore                                    | 38 ----------
 config/Tools.mk.in                            |  1 +
 scripts/git-checkout.sh                       |  4 +-
 tools/configure                               | 29 +++++++-
 .../fuzz/x86_instruction_emulator/.gitignore  |  7 ++
 tools/golang/xenlight/gengotypes.py           | 10 ++-
 tools/hotplug/common/hotplugpath.sh.in        | 16 +++++
 tools/libs/.gitignore                         |  2 +
 tools/libs/light/gentypes.py                  |  9 ++-
 tools/xenstore/Makefile.common                |  1 -
 75 files changed, 371 insertions(+), 442 deletions(-)
 create mode 100644 tools/libfsimage/common.mk
 create mode 100644 tools/fuzz/x86_instruction_emulator/.gitignore
 create mode 100644 tools/hotplug/common/hotplugpath.sh.in

-- 
Anthony PERARD


