Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F857A59F4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 08:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604369.941704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUG2-0003e7-3T; Tue, 19 Sep 2023 06:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604369.941704; Tue, 19 Sep 2023 06:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUG2-0003aw-04; Tue, 19 Sep 2023 06:30:50 +0000
Received: by outflank-mailman (input) for mailman id 604369;
 Tue, 19 Sep 2023 06:30:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72lO=FD=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiUG0-0003Oo-E3
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 06:30:48 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 112bfbdd-56b6-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 08:30:46 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50300141a64so4675361e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 23:30:46 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c229a00b003fe17901fcdsm17068780wmf.32.2023.09.18.23.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 23:30:45 -0700 (PDT)
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
X-Inumbo-ID: 112bfbdd-56b6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695105046; x=1695709846; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EDYk+qOA2va4SZvLoIEXCCrvnkUnu0bkO6jAIEslEMw=;
        b=MzkMnKqP2cxVRjYr1ASq08fkgsauMINkCYN1B2cJoR01FsnzSk+AjIBk7jitbieY1Y
         kJkesEL9nSkFjMXSwx4z+9XRqQhMTo+5vJ7CykdxE97cCmSmY+6GBSbJSaAwl96z9YMV
         83KWyC3HHrc48QbOrLrus0Kf2ynRAHz6Z3Wqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695105046; x=1695709846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDYk+qOA2va4SZvLoIEXCCrvnkUnu0bkO6jAIEslEMw=;
        b=f5dxsBRkImFP0S8XJmXy04ZVdnjRnEtwVrFW6Satv3Ry0jhYPD6QQN13WLJOO0ixCe
         3BsnZat2nEfP6BmLnqRNamyQwtTConkLVov1/264m+sQG6GSyoEVd1WpbDysNlrYrluZ
         tf9X+O4fvu8GIG9BQW5Nslx4uC0x9S5uCa0vyprAeEVlQ10Ttc64hMdJoU4hLGzwTAa+
         YZ1IBF5gxBpNw7dBqoGEcRJrhiz9k9REBE1ptWVHeMr/dwjx8H0C9kSxPS5jPvcaN8jD
         s4bt9k3ybiFAGNy/W+4DEO/I2pQR1Cb0ypBwcZzwgZ+uA/7q6VXvyy2QEAEH2G49uZdg
         0WiA==
X-Gm-Message-State: AOJu0YwkoqxJ6cZTM85QK8uCnA84lbc941EkOwXSoKag/2LkNgs1GwLv
	xc4sKZ/VfHPwTLzZn2dYsfClRCgBsPVFX19butU=
X-Google-Smtp-Source: AGHT+IFzEwZBjIi/q4ynfAcnblFgcm1mMCjJB44I5iAipvkYIlhxBKOyA5Q1VMRKAFY015LGQONOBg==
X-Received: by 2002:a05:6512:3290:b0:4fd:f77d:5051 with SMTP id p16-20020a056512329000b004fdf77d5051mr7869500lfe.26.1695105045981;
        Mon, 18 Sep 2023 23:30:45 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Javi Merino <javi.merino@cloud.com>
Subject: [XEN PATCH v3 0/4] python: Support setuptools
Date: Tue, 19 Sep 2023 07:30:25 +0100
Message-ID: <cover.1695102101.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds support for setuptools as distutils will be
deprecated in python 3.12.

Not done for this series:
  - Andrew suggested simplifying the code in m4/python_devel.m4[0] and
    this is not done yet.

[0] https://lore.kernel.org/xen-devel/fdf87d82-aa3c-fd2e-6271-848f1a806fb2@citrix.com/

Changes since v2:
  - These containers used for gitlab ci were missing setuptools in the
    previous series and now they have it:
    * alpine/3.18-arm64v8
    * opensuse-tumbleweed
    * debian/bookworm-i386
    * debian/bookworm-arm64v8
  - These containers used for gitlab ci are being kept without
    setuptools to test installations that don't have it:
    * centos/7
    * debian/stretch
    * ubuntu/trusty
    * ubuntu/xenial
    * ubuntu/bionic
  - Fix commit messages that talked about removing distutils support
    as we are keeping it.
  - Add my Signed-off-by to all commits
  - Clarify in the readme that python's minimum version is 2.7.
  - Fold the changes to the ./configure script into the patch that
    changes `m4/python_devel.m4`.  Create ./configure using autoconf
    2.69.

Changes since v1:
  - Update all containers to have setuptools, as python 3.12
    deprecates distutils in favour of setuptools
  - Keep python2's support by falling back to distutils if setuptools
    is not installed
  - Drop the commit about raising the baseline requirement for python,
    as we keep supporting python2

v1: https://lore.kernel.org/xen-devel/20230316171634.320626-1-marmarek@invisiblethingslab.com/
v2: https://lore.kernel.org/xen-devel/cover.1694450145.git.javi.merino@cloud.com/

Javi Merino (2):
  automation: add python3's setuptools to containers
  README: update to remove old note about the build system's python
    expectation

Marek Marczykowski-Górecki (2):
  tools: convert setup.py to use setuptools
  tools: don't use distutils in configure nor Makefile

 README                                        | 11 +---
 .../build/alpine/3.18-arm64v8.dockerfile      |  1 +
 automation/build/alpine/3.18.dockerfile       |  1 +
 automation/build/archlinux/current.dockerfile |  1 +
 .../build/debian/bookworm-arm64v8.dockerfile  |  1 +
 .../build/debian/bookworm-i386.dockerfile     |  1 +
 automation/build/debian/bookworm.dockerfile   |  1 +
 .../build/suse/opensuse-leap.dockerfile       |  1 +
 .../build/suse/opensuse-tumbleweed.dockerfile |  1 +
 automation/build/ubuntu/focal.dockerfile      |  1 +
 m4/python_devel.m4                            | 28 +++++-----
 tools/configure                               | 52 +++++++------------
 tools/libs/stat/Makefile                      |  4 +-
 tools/pygrub/setup.py                         |  7 ++-
 tools/python/setup.py                         |  7 ++-
 15 files changed, 57 insertions(+), 61 deletions(-)

-- 
2.42.0


