Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10197AE1D1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 00:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608150.946474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuHu-0006wZ-Ls; Mon, 25 Sep 2023 22:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608150.946474; Mon, 25 Sep 2023 22:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuHu-0006th-Hr; Mon, 25 Sep 2023 22:42:46 +0000
Received: by outflank-mailman (input) for mailman id 608150;
 Mon, 25 Sep 2023 22:42:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxCo=FJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qkuHt-0006e1-0Q
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 22:42:45 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6f4f79b-5bf4-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 00:42:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A1C0A8285640;
 Mon, 25 Sep 2023 17:42:42 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id n1dk3BGOU3I7; Mon, 25 Sep 2023 17:42:41 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B9B3782857FA;
 Mon, 25 Sep 2023 17:42:41 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PpeA1DajU-Mw; Mon, 25 Sep 2023 17:42:41 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 53ECC828562B;
 Mon, 25 Sep 2023 17:42:41 -0500 (CDT)
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
X-Inumbo-ID: d6f4f79b-5bf4-11ee-878a-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B9B3782857FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695681761; bh=qgDo1YeXt9Vr+PQZJaZuykif3Tl3ZhSAuBjemNQSJ2U=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Z3mItygE4ZKcaBJrINVS5yCRu5DQjHzeEo8WLadQKjf3pGUCliJSX7D514GCKEgiv
	 swSPfBZaQ+2y97yw2vjLUJ5f1DJ1jsUR5qajwC1MOzQJH74irgydiAFOR9yqRKW3ot
	 s57FDHhfpnScT8KwnfZTClxeMkK/W45U1A01mevU=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 1/3] automation: Drop ppc64le-*randconfig jobs
Date: Mon, 25 Sep 2023 17:42:28 -0500
Message-Id: <76d21ac8a0de7d5ebac8b39a8d552b931a6302a3.1695681330.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1695681330.git.sanastasio@raptorengineering.com>
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Since ppc64le is still undergoing early bringup, disable the randconfig
CI build which was causing spurious CI failures.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Reported-by: Jan Beulich <jbeulich@suse.com>
---
 automation/gitlab-ci/build.yaml | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 1619e9a558..32af30cced 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -563,24 +563,6 @@ debian-bullseye-gcc-ppc64le-debug:
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
 
-debian-bullseye-gcc-ppc64le-randconfig:
-  extends: .gcc-ppc64le-cross-build
-  variables:
-    CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: ppc64_defconfig
-    RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
-
-debian-bullseye-gcc-ppc64le-debug-randconfig:
-  extends: .gcc-ppc64le-cross-build-debug
-  variables:
-    CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: ppc64_defconfig
-    RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
-
 # Yocto test jobs
 yocto-qemuarm64:
   extends: .yocto-test-arm64
-- 
2.30.2


