Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E99268C27
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 15:24:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHoT7-0006C2-MD; Mon, 14 Sep 2020 13:24:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qknR=CX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kHoT6-0006Bx-HS
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 13:24:28 +0000
X-Inumbo-ID: af223f97-ad9b-47f8-a307-60c91c777180
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af223f97-ad9b-47f8-a307-60c91c777180;
 Mon, 14 Sep 2020 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600089866;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=i1uGOua5Jkx6qK7NnC5DbFszXE7k3984023lH2EEgJs=;
 b=WPaGy55bSnGFc/TPAoJsVUUK83rqTpFFgzCSlV+d4uRN06hKtjemjQdi
 n6LaA0ak0GJbbJ6zKS/TghGSlZtIXk60dx2L/8Wq8rBn65f5DFjqZuOAe
 qae+CQyvGSFKzXPMk5saOYaVvqa0NRQ99XzcRP9mJscQ2VRlw6DeajESB k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vjwFsciLPGIJW2s9ODx2CWXXqb4hcjnO6xRMLfBHjqdq02pTKmIGmfjjNBQ0EXUBGb5XVQ4Uaf
 HUGg8fnK8wPyTc1TF5rB8x+yadRe8YQbcTzan65MOBKEpSVoB+gRy7W1MeAHGoQDMr5349agFA
 vNXzcoIzTCtnI8ZJZAY3d1BdlWs2/L+oRHqrAOErRYP6vQmetx9XARXXBeG1xgYcvEVwW9oCBu
 ik4UTz0VuYLog1vnFsekw/TD3v1EhLd495CU+mFE+2nc1QfVRYOTICmfxWgrnGYNBVIHfr9l9b
 US4=
X-SBRS: 2.7
X-MesageID: 27607191
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,426,1592884800"; d="scan'208";a="27607191"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
 <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] travis: Fix build with newer Qemu
Date: Mon, 14 Sep 2020 14:23:55 +0100
Message-ID: <20200914132355.21076-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qemu requires a bleeding edge version of Python, not found in the current
travis environment.  Skip building Qemu in that case.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Wei Liu <wl@xen.org>
---
 scripts/travis-build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/travis-build b/scripts/travis-build
index 0cb15a89e4..08a1f66b84 100755
--- a/scripts/travis-build
+++ b/scripts/travis-build
@@ -16,6 +16,11 @@ cfgargs+=("--disable-rombios")
 cfgargs+=("--enable-docs")
 cfgargs+=("--with-system-seabios=/usr/share/seabios/bios.bin")
 
+# Qemu requires Python 3.7 or later
+if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 7); exit(not(res))"; then
+    cfgargs+=("--with-system-qemu=/bin/false")
+fi
+
 if [[ "${XEN_TARGET_ARCH}" == "x86_64" ]]; then
     cfgargs+=("--enable-tools")
 else
-- 
2.11.0


