Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CBF5FD9D1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422019.667804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixts-0001wz-QC; Thu, 13 Oct 2022 13:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422019.667804; Thu, 13 Oct 2022 13:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixts-0001tr-N0; Thu, 13 Oct 2022 13:05:24 +0000
Received: by outflank-mailman (input) for mailman id 422019;
 Thu, 13 Oct 2022 13:05:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixtr-0001tl-4S
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a37d5072-4af7-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 15:04:59 +0200 (CEST)
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
X-Inumbo-ID: a37d5072-4af7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666321;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4VD5kqizMtcaU6mhlTqgWMjJnwhwSgll9zXYieTMYuk=;
  b=dgRdw544u5ZZXhOR4TFtV5ytjl9z+nr1knB7SaK3yem27GYMkUgXxV6p
   plT5jhyQjsogT1r8oKXc55Uz3y5Xqzk4Qch97M7Pp8OLxY6HB/Jdw1Rn+
   R36Vf5cE9OKOot5TzZY5ONdUDeJCp4qboTMvgnNZrITOxf/CIZ3Q4MjBx
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83071467
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wMtFka5CYAKYEtUENdSysAxRtJXHchMFZxGqfqrLsTDasY5as4F+v
 mpOWW+OaPeLNmPwKNF1aI/n/RgEsZ6DztIxSgRurntmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gVlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5eJFlO0
 fAlNwouURCDuLOvm++jd7hz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozRHZoMwhjHz
 o7A1zWlWh0Eatqv8CWM0nD0p+nTtj/0cY1HQdVU8dY12QbOlwT/EiY+V0a/oPS/ol6zXZRYM
 UN80jUqhbg/8gqsVNaVdwG5pVaUsxhaXMBfe8U24R+A4rDZ6AGYAi4DVDEpQMYhr8UsQjsp0
 HeGmtroAXpkt7j9YXCS7LCPthupJDMYa2QFYEcsTwEI/t3iq4EblQ/UQ5BoF6vdps34H3T8z
 i6HqAA6hq4Plogb2qOj51fFjjmw4J/TQWYd6h3MW2O57itwfIO/e5Gz8l/f8OpBK4CCCFKGu
 RAslsyT6ulIEJ+MkTCWTfsENLaz7v2BPXvXhlsHN4I66z2n9nqnfIZRyDJzPkFkNoADYzCBX
 aPIkVoPvtkJZiLsNPIpJdLqYyg38UT+Pf3AbvDwYudRWLtOdA+4rTg1OFatjn+4xSDAjpoDE
 ZucdM+tC1MTBqJm0Ce6So8h7FM7+swt7TiNHM6mlnxLxZLbPSfIEuldbDNie8hjtMu5TBPpH
 8Gz3idg4zFWS6XAbybe6ub/xnhafCFgVfgaRyG6H9NvwzaK+kl7Vpc9Ipt7IeSJepi5cc+Zl
 kxRomcClDLCaYTvcG1mkExLZrL1RopYpnkmJyEqNlvA8yF9P9vxtP9HL8VoJONPGAlfIRlcF
 qBtRil9Kq4XFmSvF8o1N/ERU7COhDz03FnTbkJJkRA0foJ6Rhyhx+IIijDHrXBWZhdbQONk/
 NVMICuHHsdYL+mjZe6KAM+SI6SZ5CRNxb0jARWSf7G+uizEqeBXFsA4tddvS+lkFPkJ7mbyO
 9q+afvAmdTwng==
IronPort-HdrOrdr: A9a23:o7H4OKqzIbRJc/NuHgo9N34aV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="83071467"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Tim Deegan <tim@xen.org>, Nick Rosbrook
	<rosbrookn@gmail.com>, David Scott <dave@recoil.org>
Subject: [XEN PATCH for-4.17 v5 00/17] Toolstack build system improvement, toward non-recursive makefiles
Date: Thu, 13 Oct 2022 14:04:56 +0100
Message-ID: <20221013130513.52440-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.toolstack-build-system-v5

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

Anthony PERARD (17):
  tools/debugger/gdbsx: Fix and cleanup makefiles
  tools/xentrace: rework Makefile
  tools: Introduce $(xenlibs-ldflags, ) macro
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
  tools: Rework linking options for ocaml binding libraries

 tools/configure.ac                     |  2 +
 tools/console/client/Makefile          |  1 -
 tools/console/daemon/Makefile          |  1 -
 tools/debugger/gdbsx/Makefile          | 20 +++----
 tools/debugger/gdbsx/gx/Makefile       | 15 +++---
 tools/debugger/gdbsx/xg/Makefile       | 25 +++------
 tools/debugger/kdd/Makefile            |  1 -
 tools/flask/utils/Makefile             |  1 -
 tools/fuzz/cpu-policy/Makefile         |  2 +-
 tools/golang/xenlight/Makefile         |  8 +--
 tools/hotplug/common/Makefile          | 10 +---
 tools/include/Makefile                 | 28 +++++-----
 tools/libs/call/Makefile               |  1 +
 tools/libs/ctrl/Makefile               |  3 --
 tools/libs/devicemodel/Makefile        |  1 +
 tools/libs/evtchn/Makefile             |  1 +
 tools/libs/foreignmemory/Makefile      |  1 +
 tools/libs/gnttab/Makefile             |  1 +
 tools/libs/guest/Makefile              |  3 --
 tools/libs/hypfs/Makefile              |  1 +
 tools/libs/light/Makefile              | 72 +++++++++++++++-----------
 tools/libs/stat/Makefile               |  2 +-
 tools/libs/store/Makefile              |  1 +
 tools/libs/toolcore/Makefile           |  1 +
 tools/libs/toollog/Makefile            |  1 +
 tools/libs/util/Makefile               |  3 --
 tools/libs/vchan/Makefile              |  3 --
 tools/misc/Makefile                    |  1 -
 tools/ocaml/libs/eventchn/Makefile     |  2 +-
 tools/ocaml/libs/xc/Makefile           |  2 +-
 tools/ocaml/libs/xentoollog/Makefile   |  2 +-
 tools/ocaml/libs/xl/Makefile           |  2 +-
 tools/tests/cpu-policy/Makefile        |  2 +-
 tools/tests/depriv/Makefile            |  2 +-
 tools/tests/resource/Makefile          |  1 -
 tools/tests/tsx/Makefile               |  1 -
 tools/tests/xenstore/Makefile          |  1 -
 tools/xcutils/Makefile                 |  2 -
 tools/xenmon/Makefile                  |  1 -
 tools/xenpaging/Makefile               |  1 -
 tools/xenpmd/Makefile                  |  1 -
 tools/xentop/Makefile                  |  2 +-
 tools/xentrace/Makefile                | 29 ++++-------
 tools/xl/Makefile                      |  2 +-
 tools/Rules.mk                         | 20 +++++++
 tools/debugger/gdbsx/Rules.mk          |  2 +-
 tools/firmware/Rules.mk                |  2 -
 tools/libfsimage/common.mk             |  2 +-
 tools/libs/libs.mk                     | 21 +++++---
 tools/libs/light/libxl_x86_acpi.c      |  2 +-
 tools/ocaml/common.make                |  2 +-
 .gitignore                             |  6 ---
 config/Tools.mk.in                     |  1 +
 scripts/git-checkout.sh                |  4 +-
 tools/configure                        | 29 ++++++++++-
 tools/golang/xenlight/gengotypes.py    | 10 +++-
 tools/hotplug/common/hotplugpath.sh.in | 16 ++++++
 tools/libs/light/gentypes.py           |  9 ++--
 tools/xenstore/Makefile.common         |  1 -
 59 files changed, 218 insertions(+), 172 deletions(-)
 create mode 100644 tools/hotplug/common/hotplugpath.sh.in

-- 
Anthony PERARD


