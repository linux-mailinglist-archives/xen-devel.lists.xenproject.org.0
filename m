Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC2B3A8646
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 18:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142263.262560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBnU-0001NK-RK; Tue, 15 Jun 2021 16:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142263.262560; Tue, 15 Jun 2021 16:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBnU-0001IL-Mu; Tue, 15 Jun 2021 16:20:16 +0000
Received: by outflank-mailman (input) for mailman id 142263;
 Tue, 15 Jun 2021 16:20:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6ws=LJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltBnT-0001I3-9X
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 16:20:15 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdb62d00-d648-4f72-aed7-cbfa368f4b73;
 Tue, 15 Jun 2021 16:20:14 +0000 (UTC)
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
X-Inumbo-ID: fdb62d00-d648-4f72-aed7-cbfa368f4b73
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623774013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F5Mje3VKXtUyGE4h1vE6y2c0mTHqiWniCE7C39mKUeA=;
  b=eXB0iBdiIRRaVmyydaENHFqVULnp0b5lGOg2eyDqC8SWkMwhNtddwZsV
   /aT9WPslym35rNEOaCCEkc4aCUuVMKSUPRCO4IGiPTj17W6AJgqvPlSUZ
   z8/pnh4rfTu8Gt0pf3J0B5bHP2dQqU0uoO99bnnyNOe+zMZOo5PubFBpA
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5wWe7+wJYhbgc3ZA/tjz/BPbwzUU6BsTgBZ/ylAsbtojZw81FYJKt4P5MpT0mI7bEJjlxxvS0g
 fmUeWU9OVZzln/mq00OxvASNsVhn2cZY5qawOCsv/Am8v0nepNzkq1Bir5JzdKp5SB0VUlig9n
 TGxDgjBpS0HUjEdd++cp837SOziPflpi1yHIfQ95/sCBWVSZzpP+ETLfWAXLv92peDKxHlEneR
 do8/Y1sAvwhpusB4Zy/ROvqgQ83VnNqje6B4Zh9WzYJd/4Ss/BcVF9M0ggrWJyl2MSVNxbx4Dr
 6Fw=
X-SBRS: 5.1
X-MesageID: 46185786
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JTKuIaABeTjyqPrlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.83,275,1616472000"; 
   d="scan'208";a="46185786"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH 0/5] tools/tests: More cleanup for automation improvements
Date: Tue, 15 Jun 2021 17:19:00 +0100
Message-ID: <20210615161905.9831-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This series takes us one step closer towards the "autotests" plan for
simplifying the running of unit and low level system tests.

With this series in place, all the tests which need running in dom0 have
working install/uninstall targets, so they can be packaged suitably.

Some questions, concerning future changes.

Ian: Presuambly OSSTest is going to complain if I stick a test- prefix on
depriv-fd-checker?  I've left that test alone for now, as it was the only
preexisting test with working install runes.

Jan/Roger: x86_emulator and vpci use $(HOSTCC) not $(CC).  While they are unit
tests, we still potentially want to run them in dom0 rather than the build
environment - particularly for x86_emulator which is heavily CPUID based and
wants to run on a wide set of hardware.  Any issues moving them off $(HOSTCC)?

Roger: vhpet isn't even wired into the build system, and seems non-trivial to
run in the first place.  How should "success" be judged?

Andrew Cooper (5):
  tools/tests: Drop obsolete mce-test infrastructure
  tools/tests: Drop run runes
  tests/resource: Rework Makefile
  tests/cpu-policy: Rework Makefile
  tests/xenstore: Rework Makefile

 .gitignore                                         |   2 -
 tools/misc/.gitignore                              |   1 +
 tools/misc/Makefile                                |   4 +
 tools/{tests/mce-test/tools => misc}/xen-mceinj.c  |  32 +--
 tools/tests/Makefile                               |   1 -
 tools/tests/cpu-policy/Makefile                    |  33 +--
 tools/tests/mce-test/Makefile                      |  12 -
 tools/tests/mce-test/README                        |  75 ------
 tools/tests/mce-test/cases/srao_llc/dom0/cases.sh  |  73 ------
 tools/tests/mce-test/cases/srao_llc/guest/cases.sh |  94 --------
 tools/tests/mce-test/cases/srao_llc/xen/cases.sh   |  69 ------
 tools/tests/mce-test/cases/srao_mem/dom0/cases.sh  |  73 ------
 tools/tests/mce-test/cases/srao_mem/guest/cases.sh |  94 --------
 tools/tests/mce-test/cases/srao_mem/xen/cases.sh   |  69 ------
 tools/tests/mce-test/cases/ucna_llc/dom0/cases.sh  |  72 ------
 tools/tests/mce-test/cases/ucna_llc/guest/cases.sh |  92 --------
 tools/tests/mce-test/cases/ucna_llc/xen/cases.sh   |  68 ------
 tools/tests/mce-test/config/setup.conf             |  24 --
 tools/tests/mce-test/lib/xen-mceinj-tool.sh        | 260 ---------------------
 tools/tests/mce-test/tools/Makefile                |  24 --
 tools/tests/mce-test/tools/README                  |  24 --
 tools/tests/resource/Makefile                      |  11 +-
 tools/tests/vpci/Makefile                          |   4 -
 tools/tests/x86_emulator/Makefile                  |   4 -
 tools/tests/xenstore/.gitignore                    |   1 +
 tools/tests/xenstore/Makefile                      |  31 ++-
 .../tests/xenstore/{xs-test.c => test-xenstore.c}  |   0
 27 files changed, 71 insertions(+), 1176 deletions(-)
 rename tools/{tests/mce-test/tools => misc}/xen-mceinj.c (97%)
 delete mode 100644 tools/tests/mce-test/Makefile
 delete mode 100644 tools/tests/mce-test/README
 delete mode 100644 tools/tests/mce-test/cases/srao_llc/dom0/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_llc/guest/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_llc/xen/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_mem/dom0/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_mem/guest/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/srao_mem/xen/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/ucna_llc/dom0/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/ucna_llc/guest/cases.sh
 delete mode 100644 tools/tests/mce-test/cases/ucna_llc/xen/cases.sh
 delete mode 100644 tools/tests/mce-test/config/setup.conf
 delete mode 100644 tools/tests/mce-test/lib/xen-mceinj-tool.sh
 delete mode 100644 tools/tests/mce-test/tools/Makefile
 delete mode 100644 tools/tests/mce-test/tools/README
 create mode 100644 tools/tests/xenstore/.gitignore
 rename tools/tests/xenstore/{xs-test.c => test-xenstore.c} (100%)

-- 
2.11.0


