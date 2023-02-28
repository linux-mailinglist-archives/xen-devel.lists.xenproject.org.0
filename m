Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD766A5EA3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 19:17:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503659.776002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX4XA-0006lA-Tw; Tue, 28 Feb 2023 18:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503659.776002; Tue, 28 Feb 2023 18:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX4XA-0006hm-Qd; Tue, 28 Feb 2023 18:17:04 +0000
Received: by outflank-mailman (input) for mailman id 503659;
 Tue, 28 Feb 2023 18:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJ3u=6Y=citrix.com=prvs=4169be7e0=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pX4X8-0006hf-V6
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 18:17:02 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17bbda0f-b794-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 19:17:01 +0100 (CET)
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
X-Inumbo-ID: 17bbda0f-b794-11ed-9695-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677608220;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b8T+i+8za8gCu8VFptAzjxjhvNwzD5zK8ipbmxYf9AI=;
  b=X7/bSHQ4oR5yN3Z9qaUxeWhac2by67g7uLstuFT8XdaDpRBLskWLIDYr
   pAKFATdaSMyqQxg3Y8lE0pjooGSxFLjPtasv36/bBBeenj5ikKk4LB52m
   AZKWQD8m83SJMfaU8I5xuRX6z5sbQl24zJV+4Ge1YBWrHFGJQ0pqwBGBS
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101318358
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:mpUoNqieuEPIgBe5ZBLB2yRfX161ehAKZh0ujC45NGQN5FlHY01je
 htvUDuAa63fYDH2edgjao+w9EIB7J+Dn4BhTFdvrX8zHnwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5gWOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ6MTIBYjbfl9uz/7mUFqoy28ACd+jSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 judpjSiX0Fy2Nq39h+5rGKhtMr2myrdWbkDReeB3OdUnwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+Yz8g2Kx4Lf6hyVAWVCRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnop4thvrZ3JTdzVbI3ZZE01cuYKLTJwPYgznbM9hHKKT0s3MHA777
 GzJ8nU6pu4ytJtev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BWO0e+yzMUJVJdPUUOQS9PZNijS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9gZ
 srBK5f0USdGWMyLKQZaoM9HjNcWKt0WnzuPFfgXMTz8uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikn1ivBnFSnCPq+Y7dAlaRUXX8Liq86S7gMbfeFs5cIzgYteNqY4cl3tNxPwFx7qYr
 yrmBSe1CjPX3BX6FOlDUVg7AJuHYHq1hStT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:LQfVm6H90vmgXN1fpLqEGceALOsnbusQ8zAXPhZKOHpom62j5q
 KTdZEgvnXJYVkqKQkdcK+7SdK9qB/nmKKdpLNwAV7AZniChILLFuBfBOLZqlXd8m/Fh41gPM
 FbH5SWY+efMbEVt6nHCQCDYqwd6ejCyqWhj+Wb43BxQRpycKF740NYJ2+gYylLbTgDP58wHp
 jZwsZcvTKvdTA2Q62AdwA4dtmGndjCnpCjXBIPA1oGxWC1/FSV1II=
X-IronPort-AV: E=Sophos;i="5.98,222,1673931600"; 
   d="scan'208";a="101318358"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH] automation: Rework archlinux container
Date: Tue, 28 Feb 2023 18:16:49 +0000
Message-ID: <20230228181649.51066-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Base image "archlinux/base" isn't available anymore,
    https://lists.archlinux.org/pipermail/arch-dev-public/2020-November/030181.html

But instead of switching to archlinux/archlinux, we will use the
official image from Docker. Main difference is that the first one is
updated daily while the second is updated weekly.

Also, as we will install the packages from "base-devel" anyway, switch
to the "base-devel" tag.

"dev86" package is now available from the main repo, no need for
multilib repo anymore.

It is recommended to initialise local signing key used by pacman, so
let's do that.

Replace "markdown" by "discount" as the former isn't available anymore
and has been replaced by the later.

Also, clean pacman's cache.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    Testing done here:
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/791402512

 automation/build/archlinux/current.dockerfile | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index d46fc9d9ca..13fb472d9e 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -1,16 +1,15 @@
-FROM archlinux/base
+FROM archlinux:base-devel
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-# Enable multilib repo, for dev86 package
-RUN echo $'[multilib]\nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
+RUN pacman-key --init
 
 RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
-        base-devel \
         bin86 \
         bridge-utils \
         bzip2 \
         dev86 \
+        discount \
         dtc \
         e2fsprogs \
         ghostscript \
@@ -29,7 +28,6 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
         libnl \
         libpng \
         libseccomp \
-        markdown \
         net-tools \
         nss \
         perl \
@@ -46,7 +44,8 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
         wget \
         xz \
         yajl \
-        zlib
+        zlib \
+    && yes | pacman -S --clean --clean
 
 ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
 
-- 
Anthony PERARD


