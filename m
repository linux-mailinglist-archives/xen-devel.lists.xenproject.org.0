Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0C71DA058
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:02:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7Vn-0004af-Od; Tue, 19 May 2020 19:02:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7Vm-0004aK-6t
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:02:46 +0000
X-Inumbo-ID: 4cb0cda6-9a03-11ea-9887-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cb0cda6-9a03-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 19:02:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Va-0001da-JW; Tue, 19 May 2020 20:02:34 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 00/38] Upgrade most hosts/guests to buster
Date: Tue, 19 May 2020 20:01:52 +0100
Message-Id: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <xadimgnik@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

buster is Debian stable right now.  We don't want to be using
oldstable because Debian have a history of breaking it.

Paul: we should have a conversation about whether this should be
pushed soon, or deferred until after the Xen 4.14 release.

I have yet to do a final full formal retest of this series so it may
not be final.

Ian Jackson (38):
  ts-logs-capture: Cope if xl shutdown leaves domain running for a bit
  ts-xen-build-prep: Install rsync
  lvcreate argments: pass --yes -Z y -W y
  TestSupport: allow more time for apt
  Booting: Use `--' rather than `---' to introduce host cmdline
  di_installcmdline_core: Pass locale on d-i command line
  setupboot_grub2: Drop $submenu variable
  ts-leak-check: Ignore buster's udevd too
  Bodge systemd random seed arrangements
  Debian guests: Write systemd random seed file
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
  buster: Extend guest bootloaer workaround
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
  buster: Switch to Debian buster as the default suite

 Osstest.pm                                    |   2 +-
 Osstest/Debian.pm                             |  60 +++-
 Osstest/TestSupport.pm                        |  15 +-
 make-hosts-flight                             |   2 +-
 mfi-common                                    |   9 +
 mg-debian-installer-update                    |  20 ++
 overlay-buster/etc/grub.d/20_linux_xen        | 327 ++++++++++++++++++
 overlay-initrd-buster/sbin/reopen-console     | 126 +++++++
 .../override.conf                             |   3 +
 overlay/usr/local/bin/random-seed-add         |  33 ++
 production-config                             |   5 +
 sg-run-job                                    |   1 +
 ts-debian-di-fixup                            |  29 ++
 ts-debian-di-install                          |   2 +-
 ts-debian-fixup                               |   1 +
 ts-host-install                               |   4 +-
 ts-leak-check                                 |   1 +
 ts-logs-capture                               |   1 +
 ts-xen-build-prep                             |   6 +-
 19 files changed, 617 insertions(+), 30 deletions(-)
 create mode 100755 overlay-buster/etc/grub.d/20_linux_xen
 create mode 100755 overlay-initrd-buster/sbin/reopen-console
 create mode 100644 overlay/etc/systemd/system/systemd-random-seed.service.d/override.conf
 create mode 100755 overlay/usr/local/bin/random-seed-add
 create mode 100755 ts-debian-di-fixup

-- 
2.20.1


