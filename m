Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7611A675E48
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 20:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482098.747443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxJb-0006x9-Oe; Fri, 20 Jan 2023 19:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482098.747443; Fri, 20 Jan 2023 19:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxJb-0006vK-Ki; Fri, 20 Jan 2023 19:44:43 +0000
Received: by outflank-mailman (input) for mailman id 482098;
 Fri, 20 Jan 2023 19:44:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8tu/=5R=citrix.com=prvs=37768f290=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIxJZ-0006vE-R3
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 19:44:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deafe211-98fa-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 20:44:39 +0100 (CET)
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
X-Inumbo-ID: deafe211-98fa-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674243879;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Td+vdsM413b3H/N28Va3gpuwUXIu5Ol+q6BrZxznVVc=;
  b=RBEfXn1zqhiPIcJuWal92wJNJwHVrQk4/Pgpp86qlbS36JZkt/gJCE3l
   DlAmB5sNhHw4Rq8BOqITqIgGgLZ1iWqwAr0Vbw55Qb/VObGRmds7RqyzQ
   S2UzXNdMTM7dDIscXdaJF1Tzjl2VggrSCadIvRZGKLHpHAJAO8UVGd5zh
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93536163
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:32mh+6wKCyD4FTyNZh16t+f+xirEfRIJ4+MujC+fZmUNrF6WrkVVy
 2MbCDqGM6zZZmTzfIojad+0/UIDvZLSm9JkQVBrpSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRnP6gT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KW1C1
 u4ZEzUKVz6Smefozo2+ZM9qhMt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZQOwx3G/
 zydl4j/KhsXc8y6xBbdzkipieXpniTQQp0IP7Lto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYDX/JAHut87xuCooLW/gKYC24sXjNHLts8u6ceXic23
 1WEm9foAz1Hs7CPT3+ZsLCOoluaOycPKnQZTTQZVgZD6N7myKkxhB/SStdoEIauk8b4Xzr3x
 li3QDMW3utJy5RRjuPioA6B2mj3znTUcuIrzgnbfXCk1QZ+XaC0eYn252few9BGLonMGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUxRsd8rlxB71bmJNkNu28meC+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHwk0PyZ8OlwBdmB2yckC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+XCPiXEFO5VbAPWBgzc0E9iiF+Nm
 zq4H5LaoyizrcWkOnWHmWLtBQ5iwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ895m5Ytzgp
 ynnMmcBkQqXuJEyAVnSApyVQO+1DMkXQLNSFXBEAGtELFB6ONb/sfxFK8dsFVTlncQ6pcNJo
 zA+U53oKpxypv7volzxsbGVQFReSSmW
IronPort-HdrOrdr: A9a23:tY31Ta3DnEOz7ly0uqcwbwqjBKMkLtp133Aq2lEZdPU1SKGlfq
 WV954mPHDP+VUssQ4b6LK90cW7L080lqQY3WByB9eftWDd0QOVxepZgrcKrQeAJ8T2zJ856Z
 td
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="93536163"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH for-4.17 v6 0/5] Toolstack build system improvement, toward non-recursive makefiles
Date: Fri, 20 Jan 2023 19:44:26 +0000
Message-ID: <20230120194431.55922-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.toolstack-build-system-v6

Changes in v6:
- For unstable libs, use --default-symver instead of a generated
  version-script.
- Two new patches to deal with $(xenlibs-*,) macros.
- Second patch description reworded.

Changes in v5:
- rebased on staging
- added "tools: Rework linking options for ocaml binding libraries"

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

Anthony PERARD (5):
  libs: Fix auto-generation of version-script for unstable libs
  libs/light: Rework targets prerequisites
  libs/light: Makefile cleanup
  tools: Introduce macro $(xenlibs-cflags,) and introduce $(USELIBS) in
    subdirs
  tools: Rework $(xenlibs-ldlibs, ) to provide library flags only.

 tools/console/client/Makefile     |  8 ++++--
 tools/console/daemon/Makefile     | 11 ++++----
 tools/helpers/Makefile            | 29 ++++++++-----------
 tools/libs/call/Makefile          |  1 +
 tools/libs/ctrl/Makefile          |  3 --
 tools/libs/devicemodel/Makefile   |  1 +
 tools/libs/evtchn/Makefile        |  1 +
 tools/libs/foreignmemory/Makefile |  1 +
 tools/libs/gnttab/Makefile        |  1 +
 tools/libs/guest/Makefile         |  3 --
 tools/libs/hypfs/Makefile         |  1 +
 tools/libs/light/Makefile         | 47 ++++++++++++++++---------------
 tools/libs/stat/Makefile          |  2 +-
 tools/libs/store/Makefile         |  1 +
 tools/libs/toolcore/Makefile      |  1 +
 tools/libs/toollog/Makefile       |  1 +
 tools/libs/util/Makefile          |  3 --
 tools/libs/vchan/Makefile         |  3 --
 tools/Rules.mk                    | 22 +++++++++------
 tools/libs/libs.mk                | 11 ++++----
 tools/libs/light/libxl_x86_acpi.c |  2 +-
 .gitignore                        |  6 ----
 22 files changed, 75 insertions(+), 84 deletions(-)

-- 
Anthony PERARD


