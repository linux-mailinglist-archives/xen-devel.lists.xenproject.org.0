Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B055738C80
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 19:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553030.863351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC1Bk-0005Vs-5P; Wed, 21 Jun 2023 17:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553030.863351; Wed, 21 Jun 2023 17:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC1Bk-0005SY-2K; Wed, 21 Jun 2023 17:00:12 +0000
Received: by outflank-mailman (input) for mailman id 553030;
 Wed, 21 Jun 2023 17:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gfgj=CJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qC1Bj-0005SM-Ao
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 17:00:11 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 131539d7-1055-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 19:00:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E750582856E5
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 12:00:06 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id XioM9KpfcErI; Wed, 21 Jun 2023 12:00:06 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 52F858285BE8;
 Wed, 21 Jun 2023 12:00:06 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TGuLeV71IBQd; Wed, 21 Jun 2023 12:00:06 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 020548285AF3;
 Wed, 21 Jun 2023 12:00:05 -0500 (CDT)
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
X-Inumbo-ID: 131539d7-1055-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 52F858285BE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687366806; bh=37EGcJz08jntUuTWlay8W465dwhX4/NOU7Vu1RmJwjE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=pIX/MsMwVKyAvr8gIG1B5rQsjSPBs23If/HbZuHdao27Y13dyX44TO3406i3yjUXu
	 wrzKW4VBdstqT8DKY90MeRm2Ua+CwGbb1j8auQ7Uc/MfvTsGIq3OqW7W08ZBJgf3hC
	 I0oeUY2Aa8PkbPFATP4WmpDheWoW/luASlpFOI1A=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 2/4] automation: Fix KBUILD_DEFCONFIG for *ppc64le jobs
Date: Wed, 21 Jun 2023 11:59:51 -0500
Message-Id: <910f301dadbd2e15ef23837bb2e95903b8f0711e.1687366665.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1687366665.git.sanastasio@raptorengineering.com>
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

During an iteration of the initial ppc64le support patchset the default
defconfig was renamed but build.yaml wasn't updated to reflect this. Fix
it up.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 automation/gitlab-ci/build.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build=
.yaml
index bd8c7332db..c401f62d61 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -548,21 +548,21 @@ debian-bullseye-gcc-ppc64le:
   extends: .gcc-ppc64le-cross-build
   variables:
     CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: openpower_defconfig
+    KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
=20
 debian-bullseye-gcc-ppc64le-debug:
   extends: .gcc-ppc64le-cross-build-debug
   variables:
     CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: openpower_defconfig
+    KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
=20
 debian-bullseye-gcc-ppc64le-randconfig:
   extends: .gcc-ppc64le-cross-build
   variables:
     CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: openpower_defconfig
+    KBUILD_DEFCONFIG: ppc64_defconfig
     RANDCONFIG: y
     EXTRA_FIXED_RANDCONFIG:
       CONFIG_COVERAGE=3Dn
@@ -571,7 +571,7 @@ debian-bullseye-gcc-ppc64le-debug-randconfig:
   extends: .gcc-ppc64le-cross-build-debug
   variables:
     CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: openpower_defconfig
+    KBUILD_DEFCONFIG: ppc64_defconfig
     RANDCONFIG: y
     EXTRA_FIXED_RANDCONFIG:
       CONFIG_COVERAGE=3Dn
--=20
2.30.2


