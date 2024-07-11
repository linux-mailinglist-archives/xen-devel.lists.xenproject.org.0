Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E192E5C3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757323.1166169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlo-00087s-Ts; Thu, 11 Jul 2024 11:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757323.1166169; Thu, 11 Jul 2024 11:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlo-00085k-Qj; Thu, 11 Jul 2024 11:15:28 +0000
Received: by outflank-mailman (input) for mailman id 757323;
 Thu, 11 Jul 2024 11:15:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrlm-0007rJ-S6
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:26 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de51938a-3f76-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 13:15:24 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a77cc73d35fso336803466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:24 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:22 -0700 (PDT)
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
X-Inumbo-ID: de51938a-3f76-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696523; x=1721301323; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vVPoKLvLIx9/Z6KXaOL1BRCRvyW2x3MJAeh+5pqVY4c=;
        b=WACPDeBgxHgrglWfCFeXPLIvQLympVWyLjSQMwwg4hxb7Ss8OdxCrWeQF4Caos7gMY
         /SJLGiKcL9f1e5L9ACRvvFq59TfQ9OUQnhAfkdb2dUn7wLEI7tfFbmNh7aCxjGE3rMG7
         ICnPYjDZ9py2wet2CoYaBpz9NzgNuytxF4oB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696523; x=1721301323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVPoKLvLIx9/Z6KXaOL1BRCRvyW2x3MJAeh+5pqVY4c=;
        b=Z2gIo0zULaTcy6ndxicz5ErTLfFBuEaHfV9y97e2OqSIaHqANYqbTzXLiexy/rTQ1l
         K+9ZdHVEX3r1et98Rw+G0iVo/pBSEE48k+7shiYCL3HKQNxKeJ9HCkS6Vpy1UV+uC2iv
         3blpLBiDeCo3JYSvMa5h/omwQ9GRSOif30hds+VafdEgbGk1nO9I3tx+AGWEGxj6ckPY
         lm+W0rKQ1z24RrU/Ik7ijau1M+sx3AmQ9UTYb8JdlyaekXH0WScQfp6YHk3P6cSK6u8Q
         EJWb7eRk5oyngR/00VW+UHWsU9BB1LTkli/p4Qzg9opNXJ1r/46i/FoXUGhG3rz+ILla
         KRGA==
X-Gm-Message-State: AOJu0YzVQxRZGomq1cd/b6w5FqIDOLXFwy03+W8hI4gBmA7phtisUdWP
	lwJMs0DW4IGWk5L9U2dyE8km4AvYXrHTkYep6EkS6FhAz+De10uc6OFaID+bgJv9pf+GqDcP8wa
	K
X-Google-Smtp-Source: AGHT+IFdBUIkzLRro62eu6ngygo7/DrnqmvzF/IZxTsU7pvynbq9reP2ajyKaRz0Z2g0DY8Ik3bEsw==
X-Received: by 2002:a17:907:2d90:b0:a77:c7d8:7b4c with SMTP id a640c23a62f3a-a7992169c21mr120541366b.11.1720696522742;
        Thu, 11 Jul 2024 04:15:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH for-4.19 v2 00/12] CI: part 3 (slimline, and PPC/RISCV fixes)
Date: Thu, 11 Jul 2024 12:15:05 +0100
Message-Id: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch 1 fixes a bug in the containerize script

Patches 2-5 remove useless/obsolete testing

Patch 6 fixes a bug with the archlinux testing configuration

Patches 7-9 adjust the PPC64 testing

Patches 10-11 adjust the RISCV64 testing

Patch 12 refreshes the custom GCC-IBT container


All changes here follow best-guidance for dockerfiles (non-root, heredocs for
improved legibility), and naming consistency improvements discussed previously
on the Committers call.  Breifly that's:

  $DISTRO-$VERSION(numeric)-$ARCH-*

which sort more nicely and don't require e.g. people to remember which order
buster/bullseye/bookworm are in terms of debain release.

For x86, this involves inserting an $ARCH of x86_64.  Right now, x86_64 is
implied by the absence, and all other variations have to state one.


Still to come:

 * OpenSUSE container fixes (resolves the final rolling distro vs
   allowed_failure problem)
 * Ubuntu/debian rename/trim
 * Add new jobs for latest releases (Ubuntu, Alpine, Fedora)

Andrew Cooper (12):
  CI: Fix CONTAINER_UID0=1 scripts/containerize

  CI: Remove useless/misleading randconfig jobs
  CI: Drop Debian Jessie dockerfiles
  CI: Drop Debian Stretch testing
  CI: Drop Ubuntu Trusty testing

  CI: Mark Archlinux/x86 as allowing failures

  CI: Introduce a debian:12-ppc64le container
  CI: Use debian:12-ppc64le for both build and test
  CI: Refresh bullseye-ppc64le as debian:11-ppc64le

  CI: Introduce debian:11/12-riscv64 containers
  CI: Swap to debian for riscv64 build and test

  CI: Refresh and upgrade the GCC-IBT container

 .../archlinux/current-riscv64.dockerfile      |  22 --
 automation/build/debian/11-ppc64le.dockerfile |  33 +++
 automation/build/debian/11-riscv64.dockerfile |  33 +++
 automation/build/debian/12-ppc64le.dockerfile |  36 +++
 automation/build/debian/12-riscv64.dockerfile |  36 +++
 ...ockerfile => 12-x86_64-gcc-ibt.dockerfile} |  81 +++---
 .../build/debian/bullseye-ppc64le.dockerfile  |  32 ---
 .../build/debian/jessie-i386.dockerfile       |  55 -----
 automation/build/debian/jessie.dockerfile     |  52 ----
 .../build/debian/stretch-i386.dockerfile      |  57 -----
 automation/build/debian/stretch.dockerfile    |  60 -----
 automation/build/ubuntu/trusty.dockerfile     |  51 ----
 automation/gitlab-ci/build.yaml               | 233 +++++++-----------
 automation/gitlab-ci/test.yaml                |  13 +-
 automation/scripts/containerize               |  15 +-
 automation/scripts/qemu-smoke-ppc64le.sh      |   4 +-
 .../qemu-system-ppc64/8.1.0-ppc64.dockerfile  |  38 ---
 17 files changed, 282 insertions(+), 569 deletions(-)
 delete mode 100644 automation/build/archlinux/current-riscv64.dockerfile
 create mode 100644 automation/build/debian/11-ppc64le.dockerfile
 create mode 100644 automation/build/debian/11-riscv64.dockerfile
 create mode 100644 automation/build/debian/12-ppc64le.dockerfile
 create mode 100644 automation/build/debian/12-riscv64.dockerfile
 rename automation/build/debian/{buster-gcc-ibt.dockerfile => 12-x86_64-gcc-ibt.dockerfile} (50%)
 delete mode 100644 automation/build/debian/bullseye-ppc64le.dockerfile
 delete mode 100644 automation/build/debian/jessie-i386.dockerfile
 delete mode 100644 automation/build/debian/jessie.dockerfile
 delete mode 100644 automation/build/debian/stretch-i386.dockerfile
 delete mode 100644 automation/build/debian/stretch.dockerfile
 delete mode 100644 automation/build/ubuntu/trusty.dockerfile
 delete mode 100644 automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile

-- 
2.39.2


