Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4A187EE28
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694941.1084247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHC-0002gu-Sn; Mon, 18 Mar 2024 16:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694941.1084247; Mon, 18 Mar 2024 16:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHC-0002fF-Pj; Mon, 18 Mar 2024 16:55:54 +0000
Received: by outflank-mailman (input) for mailman id 694941;
 Mon, 18 Mar 2024 16:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHB-0002f9-WD
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:55:54 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60cccd77-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:55:52 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-513dc99b709so3567308e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:55:52 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:50 -0700 (PDT)
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
X-Inumbo-ID: 60cccd77-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780951; x=1711385751; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C50NXD25vOco05Cszq76+7IApZVDAJzX6DHnuaE2dDI=;
        b=rTJ0ftQSnSVj8WCNGQJUK9skEmNIEV6uZ8iht5jqUR28wKQ3hnFd4iCPauZ8+mUq70
         +CtcvT+Q2QdIGqubBnvmBEIUIvl/0/G8d2HIwPs635b5r+H7e0pS1n8x0wM4I3yw6IJ/
         t6zUEO3pfRrVLZS9NQDdBHUVgyOGWfo1ZOkuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780951; x=1711385751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C50NXD25vOco05Cszq76+7IApZVDAJzX6DHnuaE2dDI=;
        b=ZqYPwVLw04pxTmwFFMVNK/lWj/z7Jh6rgSwc/cEIBFUgX+qeuL5rzPQdPCK4dcYCga
         flCBqkMwuM7HtnIHRBxnDRh0T8ATW8SAuECHPO+jgrU7IBqpoZU4P91ky/7/4XCDPgMz
         dLIDQwonWROnDCiUrL/kzHvDLRimfGcQcLT+8weQVJnI+EPBafVBPbk7A+JO/t0DBx7A
         lTaQn2cgV8PG80a3gRt36tgUUGJwRTNbk2V9DXCv7XwzF09vqI5Be91Q0JZTJSjuGoS9
         lLzhz2ITJIvd9O673SujqHdNSsr6roWjGAG+lvCVNXP/NEH+6FEtIfpqlsxNVEDQJfXC
         D0tA==
X-Gm-Message-State: AOJu0Yz5qyATToT5MBcqX0aylo0xz8pY3q6nWrYTVt/D99gysufQgD4Y
	LlqrdTS3I1KFjbUfBiK3JrQmEibHqHFM+w5zBgXqGSq95/0z0da6MDofry6oZEPuMix545W27TN
	5
X-Google-Smtp-Source: AGHT+IF4aN/OD1yniwnsuSk8uniUu3cP3qQ+kkghzZ/Tj1uemUkZMPpfmF/F4mk1eMsKu6UWpiLqdQ==
X-Received: by 2002:ac2:5f9c:0:b0:512:b0a7:2943 with SMTP id r28-20020ac25f9c000000b00512b0a72943mr60380lfe.5.1710780951260;
        Mon, 18 Mar 2024 09:55:51 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 00/36] Switch to Debian Bookworm
Date: Mon, 18 Mar 2024 16:55:09 +0000
Message-Id: <20240318165545.3898-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/osstest.git br.bookworm-v1

Hi,

I intend to push this series in two waves.

First, push up to commit "Temporally switch "qemu-mainline" branch to
Bookworm". This is to test that osstest still works fine if we need to use
"buster" for a branch. Also upstream QEMU doesn't build on buster anymore, so
I've included a commit to use bookworm for it.

Second, push the remaning two patches, at least a week later, which will switch
the default debian suite.

I did run many tests, but hopefully nothing breaks.

Cheers,

Anthony PERARD (36):
  production-config: Add bookworm debian install media filename
  ts-xen-build-prep: Only force git protocol v2 on buster
  mgi-common: Fix fetch_debian_package error message
  mg-debian-installer-update: Download non-free firmware from new repo.
  ts-host-install: fix ntp.conf path on bookworm
  ts-host-install: fix ntp server setting
  ts-host-install: Restart ntp service
  preseed_create: Use new "d-i grub-installer/update-nvram" for UEFI
    installation
  preseed_create: osstest-erase-other-disks: workaround creating
    /dev/sdXD files
  preseed_create: Workaround fail grub-install on arndale
  ts-host-install,preseed_create: Do lvm vgextend at install time
  di_installcmdline_core: Add link_wait_timeout to install cmdline
  Disable persistent net generator on Bookworm
  preseed_base, ts-host-install: Change NIC NamePolicy to "mac"
  ts-xen-build-prep: Change package selection for Bookworm
  bl_getmenu_open: Read grub.cfg as root
  target_editfile: Use the same user to retrieve and send
  ts-xen-install: remove "libc6-xen" package installation
  overlay-bookworm: Import grub's 20_linux_xen from Debian Bookworm
  overlay-bookworm: 20_linux_xen: Fix XSM entries generation
  ts-xtf-install: Install python symlink
  setupboot_grub2: Parse arm64 uefi grub verbes
  bookworm: Extend ARM clock workaround
  ts-nested-setup, setup l1 lvm volume groupe in guest
  ts-leak-check: add new name for udevd workers
  ts-debian-hvm-install: Allow udev failure in install media
  ts-debian-fixup: Fix nic names for bookworm
  ts-debian-install: keep avoiding to use pygrub
  ts-debian-hvm-install: Increase min guest ram size
  bookworm: Extend guest bootloader workaround
  ts-debian-*-install: Replace dots in hostnames by dashs
  ts-xen-install: Fix bridge setup, ask to copy MAC addr
  make-flight: Keep using buster for L2 guest in nested tests
  Temporally switch "qemu-mainline" branch to Bookworm
  Switch to Debian Bookworm as default suite
  make-hosts-flight: default to bookworm

 Osstest.pm                               |   2 +-
 Osstest/Debian.pm                        |  92 +++++-
 Osstest/TestSupport.pm                   |   4 +-
 make-flight                              |  16 +-
 make-hosts-flight                        |   2 +-
 mfi-common                               |   5 +-
 mg-debian-installer-update               |   9 +-
 mgi-common                               |   2 +-
 overlay-bookworm/etc/grub.d/20_linux_xen | 379 +++++++++++++++++++++++
 production-config                        |   2 +
 ts-debian-di-install                     |   4 +-
 ts-debian-fixup                          |  15 +
 ts-debian-hvm-install                    |  21 +-
 ts-debian-install                        |  17 +-
 ts-host-install                          |  42 ++-
 ts-leak-check                            |   1 +
 ts-nested-setup                          |  10 +-
 ts-xen-build-prep                        |  10 +-
 ts-xen-install                           |   5 +-
 ts-xtf-install                           |   6 +
 20 files changed, 591 insertions(+), 53 deletions(-)
 create mode 100755 overlay-bookworm/etc/grub.d/20_linux_xen

-- 
Anthony PERARD


