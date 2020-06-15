Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F381C1F99CE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:16:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkptz-0007qj-RV; Mon, 15 Jun 2020 14:15:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkpty-0007qe-9F
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:15:54 +0000
X-Inumbo-ID: b8871778-af12-11ea-bca7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8871778-af12-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 14:15:53 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VXRaQHLY4k7JjwaoxKNDHqKX0pr/aBzrF1Bbk363BgZ0pD1EnDAEaIUav89syhYzpOix2wEk6T
 fbU6En0io1tAXmylQSQ1n1Z/dSlK5n3ib3bJC1WrvAXEk5HMhUXXPrQnqrOQjEHLfcZ1JceZf3
 ivBl5mCl4VuS5CVq+yoJ6j/iurALy7wXY9Yg13AqRvJPkDO+7A6Q15dkywCGG52h96VIhJXoWd
 r8I/n+eQT9C380AaKmhNNHTKMBa/TU5+FSxvGuADahUtSZoovtv4aEwA/kFkqo1lu1sNkL4WRM
 YAg=
X-SBRS: 2.7
X-MesageID: 20064836
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20064836"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 6/9] x86/gen-cpuid: Distinguish default vs max in feature
 annotations
Date: Mon, 15 Jun 2020 15:15:29 +0100
Message-ID: <20200615141532.1927-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200615141532.1927-1-andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The toolstack logic can now correctly distinguish a clean boot from a
migrate/restore.

Allow lowercase a/s/h to be used to annotate a non-default feature.

Due to the emulator work prepared earlier in 4.14, this now allows VMs to
explicity opt in to the TSXLDTRK, MOVDIR{I,64B} and SERIALIZE instructions via
their xl.cfg file, rather than getting them as a matter of default.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>
---
 xen/tools/gen-cpuid.py | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 037954cfb8..ffd9529fdf 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -130,17 +130,13 @@ def crunch_numbers(state):
                  MTRR, PGE, MCA, CMOV, PAT, PSE36, MMX, FXSR)
     state.common_1d = common_1d
 
-    state.pv_def = state.raw['A']
-    state.hvm_shadow_def = state.pv_def | state.raw['S']
-    state.hvm_hap_def = state.hvm_shadow_def | state.raw['H']
-
-    # TODO: Ignore def/max split until the toolstack migration logic is fixed
-    state.pv_max = state.pv_def
-    state.hvm_shadow_max = state.hvm_shadow_def
-    state.hvm_hap_max = state.hvm_hap_def
-    # state.pv_max =                                state.raw['A'] | state.raw['a']
-    # state.hvm_shadow_max = state.pv_max         | state.raw['S'] | state.raw['s']
-    # state.hvm_hap_max =    state.hvm_shadow_max | state.raw['H'] | state.raw['h']
+    state.pv_def =                                state.raw['A']
+    state.hvm_shadow_def = state.pv_def         | state.raw['S']
+    state.hvm_hap_def =    state.hvm_shadow_def | state.raw['H']
+
+    state.pv_max =                                state.raw['A'] | state.raw['a']
+    state.hvm_shadow_max = state.pv_max         | state.raw['S'] | state.raw['s']
+    state.hvm_hap_max =    state.hvm_shadow_max | state.raw['H'] | state.raw['h']
 
     #
     # Feature dependency information.
-- 
2.11.0


