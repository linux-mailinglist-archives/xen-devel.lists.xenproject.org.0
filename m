Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9879BEF01
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:28:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830967.1246111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8g56-000596-An; Wed, 06 Nov 2024 13:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830967.1246111; Wed, 06 Nov 2024 13:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8g56-000571-7X; Wed, 06 Nov 2024 13:28:20 +0000
Received: by outflank-mailman (input) for mailman id 830967;
 Wed, 06 Nov 2024 13:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nSNS=SB=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t8g54-0004n0-8J
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:28:18 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e1650fa-9c42-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:28:05 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c948c41edeso8522844a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:27:25 -0800 (PST)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a9a3e3sm2708939a12.12.2024.11.06.05.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 05:05:22 -0800 (PST)
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
X-Inumbo-ID: 1e1650fa-9c42-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MjkiLCJoZWxvIjoibWFpbC1lZDEteDUyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFlMTY1MGZhLTljNDItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk5Njg2LjA1MzY3Miwic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730899325; x=1731504125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFLoWciaTmA2tQ6Z12/KNgBqEpyVG6EHnXcJYicMIAo=;
        b=ZcY17TFlFNHuatDqqq9CapqBhFa4m0db7LQ5wOBOdH81xtkyeU34M1q7z+0Fh6Kk4Z
         FjyB8FP94VFA4HoND41bnJWoy/ZM1oLOSp3O0oTjhCUhaLwD0Bc/LxJSznbFltErKV5M
         ElR44BgqEtcUUHsgdiDLoA7sSRwzwhMRLRgkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730899325; x=1731504125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFLoWciaTmA2tQ6Z12/KNgBqEpyVG6EHnXcJYicMIAo=;
        b=GmMktjt5g9hwEfnT2MXFp1aYeYXEUT66XS+p/qKYyRrvSUvuGC69tT5o+2uWq1kqDu
         RXXtLrLqh2NVHIWIYncj7SMQiJ3ioDWDCOFbZI1Tut6KDCTHTw55T6aIOksx0lyijl7v
         Jawo+B+dMmeDAiiuv/WLzmA69J0rDQcYpUiDuH9zqH24u+7Io7vx6OlnaPTYzkWn5Kiu
         eGnVn+AtpMbCXv6zA1orrQaWXbaEyImQuGKp62JachtVBWkrlZMVopHp7hbQmJLR9Jjz
         xi2ILks6i2mDq5R8LynTR88RhbOXLVO2ZoXrFyR/id6Je2zL2QuUwBlWyn8aRyTLzFYU
         pTpg==
X-Gm-Message-State: AOJu0YyyF4ekcwD1H3eNySUEMcXTtQTI4wPqF8+j8unmbKzHMiXpGa1+
	/jWKFW19TddURo5oKgJfX40NgTps18oNBl9ZuzTjLc22ecEJlgquvx77PfMIqlSASM+rQe2ocsV
	Mv2Y=
X-Google-Smtp-Source: AGHT+IFhF5eJ1NCqMhvlN94ZlOwt1rMoNRRphNR21v/J1QzPTaI6ZOEdpOtEdZciApMMzp9zUggwow==
X-Received: by 2002:a2e:bc21:0:b0:2fa:d354:1435 with SMTP id 38308e7fff4ca-2fdebd4588bmr100964861fa.0.1730898322608;
        Wed, 06 Nov 2024 05:05:22 -0800 (PST)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/6] automation: Refresh the remaining Debian containers
Date: Wed,  6 Nov 2024 13:05:01 +0000
Message-ID: <cover.1730743077.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of [0], to refresh the remaining Debian 12 containers. The
containers now use heredocs for readability, and use
"apt-get --no-install-recommends" to minimize the installation of
unnecessary packages.  All containers except Debian 12 arm64 and
x86_64 run as a normal user.  Debian 12 arm64 and x86_64 have been
kept running as root as Stefano asked for it as it would break the
xilinx workers that are currently in flux.

The updated containers have been tested in
https://gitlab.com/xen-project/people/javimerino/xen/-/pipelines/1526520801

Changes since v1[0]:
  - In containerfiles, repeat the "LABEL" intruction for each label and
    avoid the backslash at the end of lines.
  - Use ENV VAR=value consistently in dockerfiles.
  - Dropped the patch that moved the Debian 12 arm64 and x86_64
    containers to run as a normal user.
  - Added a patch to drop the "-y" in "apt-get update"
  - Move libnl-3-dev to the libxl section in the Debian 12 x86_64
    dockerfile.
  - Add missing requires for libxenguest dombuilder in the Debian 12
    x86_64 dockerfile
  - Move the expect dependency to the section for tests

[0] https://lore.kernel.org/xen-devel/cover.1729760501.git.javi.merino@cloud.com

Javi Merino (6):
  CI: Refresh the Debian 12 x86_64 container
  CI: Refresh the Debian 12 x86_32 container
  CI: Refresh the Debian 12 arm64 container
  CI: Refresh the Debian 12 arm32 cross compile container
  CI: Refresh the Debian 12 cppcheck container
  CI: Don't use -y with apt-get update

 automation/build/debian/11-ppc64le.dockerfile |  2 +-
 automation/build/debian/11-riscv64.dockerfile |  2 +-
 .../debian/12-arm64v8-arm32-gcc.dockerfile    | 28 +++++++
 .../debian/12-arm64v8-cppcheck.dockerfile     | 79 +++++++++++++++++++
 automation/build/debian/12-arm64v8.dockerfile | 68 ++++++++++++++++
 automation/build/debian/12-ppc64le.dockerfile |  2 +-
 automation/build/debian/12-riscv64.dockerfile |  2 +-
 automation/build/debian/12-x86_32.dockerfile  | 50 ++++++++++++
 .../build/debian/12-x86_64-gcc-ibt.dockerfile |  4 +-
 automation/build/debian/12-x86_64.dockerfile  | 71 +++++++++++++++++
 .../bookworm-arm64v8-arm32-gcc.dockerfile     | 24 ------
 .../build/debian/bookworm-arm64v8.dockerfile  | 55 -------------
 .../build/debian/bookworm-cppcheck.dockerfile | 54 -------------
 .../build/debian/bookworm-i386.dockerfile     | 50 ------------
 automation/build/debian/bookworm.dockerfile   | 57 -------------
 .../build/ubuntu/16.04-x86_64.dockerfile      |  2 +-
 .../build/ubuntu/18.04-x86_64.dockerfile      |  2 +-
 .../build/ubuntu/20.04-x86_64.dockerfile      |  2 +-
 .../build/ubuntu/22.04-x86_64.dockerfile      |  2 +-
 .../build/ubuntu/24.04-x86_64.dockerfile      |  2 +-
 automation/gitlab-ci/build.yaml               | 68 ++++++++--------
 automation/gitlab-ci/test.yaml                | 32 ++++----
 automation/scripts/containerize               | 10 +--
 23 files changed, 362 insertions(+), 306 deletions(-)
 create mode 100644 automation/build/debian/12-arm64v8-arm32-gcc.dockerfile
 create mode 100644 automation/build/debian/12-arm64v8-cppcheck.dockerfile
 create mode 100644 automation/build/debian/12-arm64v8.dockerfile
 create mode 100644 automation/build/debian/12-x86_32.dockerfile
 create mode 100644 automation/build/debian/12-x86_64.dockerfile
 delete mode 100644 automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
 delete mode 100644 automation/build/debian/bookworm-arm64v8.dockerfile
 delete mode 100644 automation/build/debian/bookworm-cppcheck.dockerfile
 delete mode 100644 automation/build/debian/bookworm-i386.dockerfile
 delete mode 100644 automation/build/debian/bookworm.dockerfile

-- 
2.45.2


