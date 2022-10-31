Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA1461389A
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432885.685569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVLr-0004Kw-Jv; Mon, 31 Oct 2022 14:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432885.685569; Mon, 31 Oct 2022 14:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVLr-0004Ih-Gv; Mon, 31 Oct 2022 14:01:19 +0000
Received: by outflank-mailman (input) for mailman id 432885;
 Mon, 31 Oct 2022 14:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+oh=3A=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1opVLq-0004Ib-6u
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 14:01:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7b1f0af5-5924-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 15:01:14 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D5DB1FB;
 Mon, 31 Oct 2022 07:01:22 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98A023F5A1;
 Mon, 31 Oct 2022 07:01:15 -0700 (PDT)
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
X-Inumbo-ID: 7b1f0af5-5924-11ed-8fd0-01056ac49cbb
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/4] Yocto Gitlab CI
Date: Mon, 31 Oct 2022 14:00:52 +0000
Message-Id: <cover.1667224593.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is a first attempt to check if we could use Yocto in
gitlab ci to build and run xen on qemu for arm, arm64 and x86.

The first patch is creating a container with all elements required to
build Yocto, a checkout of the yocto layers required and an helper
script to build and run xen on qemu with yocto.

The second patch is creating containers with a first build of yocto done
so that susbsequent build with those containers would only rebuild what
was changed and take the rest from the cache.

The third patch is adding a way to easily clean locally created
containers.

This is is mainly for discussion and sharing as there are still some
issues/problem to solve:
- building the qemu* containers can take several hours depending on the
  network bandwith and computing power of the machine where those are
  created
- produced containers containing the cache have a size between 8 and
  12GB depending on the architecture. We might need to store the build
  cache somewhere else to reduce the size. If we choose to have one
  single image, the needed size is around 20GB and we need up to 40GB
  during the build, which is why I splitted them.
- during the build and run, we use a bit more then 20GB of disk which is
  over the allowed size in gitlab

Once all problems passed, this can be used to build and run dom0 on qemu
with a modified Xen on the 3 archs in less than 10 minutes.

This has been tested on a x86 host machine and on an arm host machine
(with mk_dsdt.c fix).

Changes in v3:
- limit number of jobs in yocto
- do not copy build script inside container
- add patch from Michal to create gitlab jobs

Changes in v2:
- remove gitignore patch which was merged
- add a --dump-log support in build-yocto.sh script and use it during
  container creation to see the error logs.

Bertrand Marquis (3):
  automation: Add elements for Yocto test and run
  automation: Add yocto containers with cache
  automation: Add a clean rule for containers

Michal Orzel (1):
  automation: Add CI test jobs for Yocto

 automation/build/Makefile                     |  19 +-
 automation/build/yocto/build-yocto.sh         | 349 ++++++++++++++++++
 .../build/yocto/kirkstone-qemuarm.dockerfile  |  29 ++
 .../yocto/kirkstone-qemuarm64.dockerfile      |  29 ++
 .../yocto/kirkstone-qemux86-64.dockerfile     |  29 ++
 automation/build/yocto/kirkstone.dockerfile   |  97 +++++
 automation/gitlab-ci/test.yaml                |  34 ++
 7 files changed, 585 insertions(+), 1 deletion(-)
 create mode 100755 automation/build/yocto/build-yocto.sh
 create mode 100644 automation/build/yocto/kirkstone-qemuarm.dockerfile
 create mode 100644 automation/build/yocto/kirkstone-qemuarm64.dockerfile
 create mode 100644 automation/build/yocto/kirkstone-qemux86-64.dockerfile
 create mode 100644 automation/build/yocto/kirkstone.dockerfile

-- 
2.25.1


