Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24C163F2C8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 15:26:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450778.708224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kVd-0001oC-Kx; Thu, 01 Dec 2022 14:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450778.708224; Thu, 01 Dec 2022 14:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kVd-0001kk-Hz; Thu, 01 Dec 2022 14:25:53 +0000
Received: by outflank-mailman (input) for mailman id 450778;
 Thu, 01 Dec 2022 14:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecKG=37=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1p0kVb-0001kY-BX
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 14:25:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0db2441a-7184-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 15:25:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2B52D6E;
 Thu,  1 Dec 2022 06:25:55 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 248043F73D;
 Thu,  1 Dec 2022 06:25:48 -0800 (PST)
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
X-Inumbo-ID: 0db2441a-7184-11ed-8fd2-01056ac49cbb
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v6 0/3] Yocto Gitlab CI
Date: Thu,  1 Dec 2022 14:25:29 +0000
Message-Id: <cover.1669904508.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is a first attempt to check if we could use Yocto in
gitlab ci to build and run xen on qemu for arm, arm64 and x86.

The first patch is introducing a container template from which container
files can be generated for all combinations we want to support (qemu
arm, arm64 and x86 targets and hosts x86_64 and arm64).
It is also introducing a generic build script (build-yocto.sh) that is
used to create, build and run a Yocto project.

The second patch is adding a way to easily clean locally created
containers.

The third patch is introducing some gitlab CI templates and jobs so that
we can test a Xen source tree in gitlab-CI using Yocto.

This has been tested on a x86 host machine and on an arm host machine
(with mk_dsdt.c fix).

Changes in v6:
- fix qemux86 errors on arm hosts
- added some comments
- fix Makefile to not call docker a lot during each parse
- several fixes and improvments described in each patch

Changes in v5:
- automatic cleanup of generated docker files using INTERMEDIATE
- typo fixes
- rebase on Stefano's next branch
- remove clean rule cleaning all containers

Changes in v4:
- rework the container generation to support multiple hosts
- rework the container generation to use a single template for all
  docker files (make process is generating the docker files).

Changes in v3:
- limit number of jobs in yocto
- do not copy build script inside container
- add patch from Michal to create gitlab jobs

Changes in v2:
- remove gitignore patch which was merged
- add a --dump-log support in build-yocto.sh script and use it during
  container creation to see the error logs.


*** BLURB HERE ***

Bertrand Marquis (2):
  automation: Create Yocto docker images
  automation: Add a clean rule for containers

Michal Orzel (1):
  automation: Add CI test jobs for Yocto

 .gitignore                                 |   1 +
 automation/build/Makefile                  |  26 +-
 automation/build/yocto/build-yocto.sh      | 356 +++++++++++++++++++++
 automation/build/yocto/yocto.dockerfile.in | 114 +++++++
 automation/build/yocto/yocto.inc           |  44 +++
 automation/gitlab-ci/test.yaml             |  45 +++
 6 files changed, 583 insertions(+), 3 deletions(-)
 create mode 100755 automation/build/yocto/build-yocto.sh
 create mode 100644 automation/build/yocto/yocto.dockerfile.in
 create mode 100644 automation/build/yocto/yocto.inc

-- 
2.25.1


