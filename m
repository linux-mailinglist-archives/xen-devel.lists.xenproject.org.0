Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D2159FDA2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 16:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392778.631346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrp8-0004H1-5h; Wed, 24 Aug 2022 14:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392778.631346; Wed, 24 Aug 2022 14:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrp8-0004EN-2s; Wed, 24 Aug 2022 14:57:42 +0000
Received: by outflank-mailman (input) for mailman id 392778;
 Wed, 24 Aug 2022 14:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC3Q=Y4=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1oQrp6-0004EH-M0
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 14:57:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 189d22c0-23bd-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 16:57:39 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A7F2106F;
 Wed, 24 Aug 2022 07:57:42 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E3F83F67D;
 Wed, 24 Aug 2022 07:57:37 -0700 (PDT)
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
X-Inumbo-ID: 189d22c0-23bd-11ed-9250-1f966e50362f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1 0/4] Yocto Gitlab CI
Date: Wed, 24 Aug 2022 15:57:16 +0100
Message-Id: <cover.1661352827.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is a first attempt to check if we could use Yocto in
gitlab ci to build and run xen on qemu for arm, arm64 and x86.

The first patch is making sure build-yocto.sh is not catched by
gitignore.

The second patch is creating a container with all elements required to
build Yocto, a checkout of the yocto layers required and an helper
script to build and run xen on qemu with yocto.

The third patch is creating containers with a first build of yocto done
so that susbsequent build with those containers would only rebuild what
was changed and take the rest from the cache.

The fourth patch is adding a way to easily clean locally created
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

Bertrand Marquis (4):
  automation: Only filter build-*/ in gitignore
  automation: Add elements for Yocto test and run
  automation: Add yocto containers with cache
  automation: Add a clean rule for containers

 .gitignore                                    |   2 +-
 automation/build/Makefile                     |  19 +-
 automation/build/yocto/build-yocto.sh         | 328 ++++++++++++++++++
 .../build/yocto/kirkstone-qemuarm.dockerfile  |  28 ++
 .../yocto/kirkstone-qemuarm64.dockerfile      |  28 ++
 .../yocto/kirkstone-qemux86-64.dockerfile     |  28 ++
 automation/build/yocto/kirkstone.dockerfile   | 100 ++++++
 7 files changed, 531 insertions(+), 2 deletions(-)
 create mode 100755 automation/build/yocto/build-yocto.sh
 create mode 100644 automation/build/yocto/kirkstone-qemuarm.dockerfile
 create mode 100644 automation/build/yocto/kirkstone-qemuarm64.dockerfile
 create mode 100644 automation/build/yocto/kirkstone-qemux86-64.dockerfile
 create mode 100644 automation/build/yocto/kirkstone.dockerfile

-- 
2.25.1


