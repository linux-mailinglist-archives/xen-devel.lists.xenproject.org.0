Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE1B1C5A39
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:57:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVz0f-0006vc-Vx; Tue, 05 May 2020 14:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWWA=6T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jVz0e-0006vV-18
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:57:24 +0000
X-Inumbo-ID: b847467c-8ee0-11ea-ae69-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b847467c-8ee0-11ea-ae69-bc764e2007e4;
 Tue, 05 May 2020 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588690640;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jpg7LSRrdpRK6MQdn8AuGg28BoPfjPRlErfxvAtNaHw=;
 b=FYxKJRnY20Wgkf3Z7mqwm4WeSKcljjsHkeL8rTsHK7xIUM2b2mVlxj23
 357ndltpw46axP53Cl1HJ67qV6Kv/0Ike5uGeFZ4wbuW2qY+eqWWHOs3d
 gf+oDvGSFpPcrwzzXXHmf7QsNVILxmvMIIhG1xXBwoFINB/fA9724zuNm w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4x16cARGe7unI3ZgSDVGTtkJHmYxjfgOdIa05dG8ZKkrtZah3zgGxOhAYaDCWaHNPuqk0phdWG
 abGpw7aBunaYxtfssOLC8P0GffcBB/vz8Env/1bskU2jFn2giw1v4RZKF1vOdANZB2jL6hiEfe
 v0FKE/wpfWjLEK9kiQmFd4SxHX1PxTMcxAU4TJYhYt5dyxdvywL57ljke4FHG7la7LG/XdWB1B
 P1a68h2IUnLhMR06TF5CaWpYBNqfne1U93porHWKrgRYqQBF95nXQjHa8YEz8XLbI+bJEwezSf
 ue4=
X-SBRS: 2.7
X-MesageID: 17080200
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,355,1583211600"; d="scan'208";a="17080200"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH RFC] automation: split logs into separate files
Date: Tue, 5 May 2020 16:57:10 +0200
Message-ID: <20200505145710.17630-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Doug Goldstein <cardoe@cardoe.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The aim of this patch is to make it easier to digest the output of the
gitlab jobs, as the current is IMO too long and that makes it hard to
spot what went wrong. So this patch does the following:
 - Rename build.log into run.log.
 - Split each build log into a logs folder, using the
   build{-kconfig}.log file. Note the default kconfig (either random
   or not) will use the name build.log.
 - The output from kconfig is also saved as kconfig{-kconfig}.log.
 - The build and configure output is no longer part of the default
   gitlab output.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I find the output from the gitlab tests hard to consume, as it's
thousands of lines long. With this change such output is split into
several smaller files, IMO easier to consume, and the default output
should make it also easier to identify exactly which step went wrong.
---
 automation/gitlab-ci/build.yaml |  3 ++-
 automation/scripts/build        | 18 +++++++++++-------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 1e61d30c85..697fe7cc55 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -2,9 +2,10 @@
   stage: build
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
   script:
-    - ./automation/scripts/build 2>&1 | tee build.log
+    - ./automation/scripts/build 2>&1 | tee run.log
   artifacts:
     paths:
+      - logs/
       - binaries/
       - xen-config
       - '*.log'
diff --git a/automation/scripts/build b/automation/scripts/build
index 0cd0f3971d..704b428f86 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -8,11 +8,14 @@ cc-ver()
     $CC -dumpversion | awk -F. '{ printf "0x%02x%02x%02x", $1, $2, $3 }'
 }
 
+mkdir logs
+
 # random config or default config
 if [[ "${RANDCONFIG}" == "y" ]]; then
-    make -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
+    make -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig \
+         > logs/kconfig.log 2>&1
 else
-    make -C xen defconfig
+    make -C xen defconfig > logs/kconfig.log 2>&1
 fi
 
 # build up our configure options
@@ -38,9 +41,9 @@ if [[ "${CC}" == "gcc" && `cc-ver` -lt 0x040600 ]]; then
     cfgargs+=("--with-system-seabios=/bin/false")
 fi
 
-./configure "${cfgargs[@]}"
+./configure "${cfgargs[@]}" > logs/configure.log 2>&1
 
-make -j$(nproc) dist
+make -j$(nproc) dist > logs/build.log 2>&1
 
 # Extract artifacts to avoid getting rewritten by customised builds
 cp xen/.config xen-config
@@ -58,8 +61,9 @@ esac
 cfg_dir="automation/configs/${arch}"
 for cfg in `ls ${cfg_dir}`; do
     echo "Building $cfg"
-    make -j$(nproc) -C xen clean
+    make -j$(nproc) -C xen clean > /dev/null 2>&1
     rm -f xen/.config
-    make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} XEN_CONFIG_EXPERT=y defconfig
-    make -j$(nproc) -C xen XEN_CONFIG_EXPERT=y
+    make -C xen KBUILD_DEFCONFIG=../../../../${cfg_dir}/${cfg} \
+         XEN_CONFIG_EXPERT=y defconfig > logs/kconfig-${cfg}.log 2>&1
+    make -j$(nproc) -C xen XEN_CONFIG_EXPERT=y > logs/build-${cfg}.log 2>&1
 done
-- 
2.26.2


