Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF11E7B96
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:20:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jed3R-0005oS-04; Fri, 29 May 2020 11:20:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jed3P-0005oN-FM
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:19:59 +0000
X-Inumbo-ID: 5461cc10-a19e-11ea-9dbe-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5461cc10-a19e-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 11:19:58 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3N-0003xZ-MS; Fri, 29 May 2020 12:19:57 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>
Subject: [OSSTEST PATCH v2 00/49] Switch to Debian buster (= Debian stable)
Date: Fri, 29 May 2020 12:18:56 +0100
Message-Id: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: committers@xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This series looks about as ready as it is going to be.  Unfortunately
there are still two issues, each of which cropped up once in my final
formal retest.  See below.

What are people's opinions?  Should I push this to osstest pretest
soon after the Xen codefreeze (eg, after we get the first push after
freeze) ?

The downside would be introducing new low-probability heisenbugs.  But
in my tests it seems that some existing heisenbugs may be abated.
It's hard to say for sure.  The upside is a lower risk that Debian
will break our stuff and also being able to commission a number of
machines which do not work with stretch (Debian oldstable).

The two issues:

1. In one test, libvirt segfaulted.  This is with osstest's own-built
   tested version of libvirt; osstest's own-build tested version of
   Linux; and osstest's own-built xen.git#master.

   http://logs.test-lab.xenproject.org/osstest/logs/150456/test-amd64-i386-libvirt/info.html
   http://logs.test-lab.xenproject.org/osstest/logs/150456/test-amd64-i386-libvirt/rimava1---var-log-kern.log.gz
   | May 28 21:39:11 rimava1 kernel: [ 1146.326593] libvirtd[16868]: segfault at 820 ip b72535b0 sp abce5090 error 4 in libc-2.28.so[b71f0000+14e000]

2. In one test, the Debian installer hung.  The kernel printed many
   soft lockup messages.  This is with osstest's own dom0 kernel and
   hypervisor, but the 4.19.67-2+deb10u1 kernel from Debian.

   http://logs.test-lab.xenproject.org/osstest/logs/150456/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm/info.html
   http://logs.test-lab.xenproject.org/osstest/logs/150456/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm/godello1---var-log-xen-qemu-dm-debianhvm.guest.osstest.log.gz

Ian Jackson (49):
  ts-logs-capture: Cope if xl shutdown leaves domain running for a bit
  ts-xen-build-prep: Install rsync
  lvcreate argments: pass --yes -Z y -W y
  TestSupport: allow more time for apt
  Booting: Use `--' rather than `---' to introduce host cmdline
  di_installcmdline_core: Pass locale on d-i command line
  setupboot_grub2: Drop $submenu variable
  ts-leak-check: Ignore buster's udevd too
  Bodge systemd random seed arrangements
  Debian guests made with xen-tools: Write systemd random seed file
  ts-debian-di-install: Provide guest with more RAM
  Debian: preseed: use priority= alias
  Debian: Specify `priority=critical' rather than locale
  Honour 'LinuxSerialConsole <suite>' host property
  buster: make-hosts-flight: Add to possible suites for hosts flight
  buster: Extend grub2 uefi no install workaround
  buster: ts-host-install: Extend net.ifnames workaround
  buster: Deinstall the "systemd" package
  buster: preseed partman-auto-lvm/guided_size
  buster: ts-host-install: NTP not honoured bug remains
  buster: Extend ARM clock workaround
  buster: Extend guest bootloader workaround
  Honour DebianImageFile_SUITE_ARCH
  buster: Specify DebianImageFile_SUITE_ARCH
  20_linux_xen: Copy Debian buster version into our initramfs area
  20_linux_xen: Adhoc template substitution
  20_linux_xen: Ignore xenpolicy and config files too
  20_linux_xen: Support Xen Security Modules (XSM/FLASK)
  mg-debian-installer-update: support overlay-intramfs-SUITE
  overlay-initrd-buster/sbin/reopen-console: Copy from Debian
  overlay-initrd-buster/sbin/reopen-console: Fix #932416
  buster: chiark-scripts: Install a new version on buster too
  buster: Provide TftpDiVersion
  buster: grub, arm64: extend chainloading workaround
  buster: setupboot_grub2: Note what files exist in /boot
  buster: setupboot_grub2: Handle missing policy file bug
  buster: Extend workaround for dhcpd EROFS bug
  ts-xen-install: Add $ho argument to some_extradebs
  ts-xen-install: Move some_extradebs to Debian.pm
  Debian.pm: Break out standard_extradebs
  Debian.pm: Move standard_extradebs to ts-host-install
  buster: Install own linux-libc-dev package (!)
  setupboot_grub2: Insist on space after directives
  setupboot_grub2: Print line number of entry we are using
  setupboot_grub2: Recognise --nounzip for initramfs
  setupboot_grub2: Copy hv command line from grub to xen.cfg
  setupboot_grub2: Do not boot with XSM policy etc. unless xsm=1
  buster 20_linux_xen: Only load policy in XSM-enabled builds
  buster: Switch to Debian buster as the default suite

 Osstest.pm                                    |   2 +-
 Osstest/Debian.pm                             | 128 +++++--
 Osstest/TestSupport.pm                        |  15 +-
 make-hosts-flight                             |   2 +-
 mfi-common                                    |   9 +
 mg-debian-installer-update                    |  20 ++
 overlay-buster/etc/grub.d/20_linux_xen        | 327 ++++++++++++++++++
 overlay-initrd-buster/sbin/reopen-console     | 126 +++++++
 .../override.conf                             |   3 +
 overlay/usr/local/bin/random-seed-add         |  33 ++
 production-config                             |   5 +
 ts-debian-di-install                          |   2 +-
 ts-debian-fixup                               |   6 +
 ts-host-install                               |   6 +-
 ts-leak-check                                 |   1 +
 ts-logs-capture                               |   1 +
 ts-xen-build-prep                             |   6 +-
 ts-xen-install                                |  41 +--
 18 files changed, 656 insertions(+), 77 deletions(-)
 create mode 100755 overlay-buster/etc/grub.d/20_linux_xen
 create mode 100755 overlay-initrd-buster/sbin/reopen-console
 create mode 100644 overlay/etc/systemd/system/systemd-random-seed.service.d/override.conf
 create mode 100755 overlay/usr/local/bin/random-seed-add

-- 
2.20.1


