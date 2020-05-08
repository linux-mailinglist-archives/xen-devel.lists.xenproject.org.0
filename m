Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727EB1CB2CA
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 17:28:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX4ul-0000wj-Io; Fri, 08 May 2020 15:27:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jX4uk-0000wd-HM
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 15:27:50 +0000
X-Inumbo-ID: 796f4096-9140-11ea-9887-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 796f4096-9140-11ea-9887-bc764e2007e4;
 Fri, 08 May 2020 15:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588951670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rWD7JG3rxsZ/VbK7A2DoYPoErxiSrz+GJ4tgtyShxYc=;
 b=G/Tq+DRooWqrCv+CfXcTjjbvxF1dbNutf4hcZn/iUI+iOod0ub3PT2Dt
 7JBegNbFCW4RJ3TE+3D1/EhfCBm/0PTskWysJfql+UsctxnyGfgFeqcp4
 0kBdOd8/0dmR5R9L/yYFpl394Q0X04bFI+XekO07SbyPorYVLqqjGBC9M o=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: G0qHJbCARlPKqDc3xWvLoKCwNkkQ/OjZUm9DlvVedlJ+Xbqzlj+D9pmd0Q2EFW4U9eszAfKF/L
 LckIdMDsOWhfLYbCdoOxYrAdH4JshgQlwlTZbBpMyHN/YltCcrcd6h+E4JJqEwT70fE2iQaCwu
 ehKigCvM7t55ZRfCe95gfs+LxGh7ZGtnPhuyZbgmSEErT5nSEUEyvNBMlTTAKHi97pJ5pKwIov
 QZb/dbY3MnDG9SpjznqRrkCyPaeVp1xzKEPuRzCkSnrDDqIPKoKQWrNMHeSSr20Y9PR5Z62rtc
 uVc=
X-SBRS: 2.7
X-MesageID: 17098576
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,368,1583211600"; d="scan'208";a="17098576"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/gen-cpuid: Distinguish default vs max in feature
 annotations
Date: Fri, 8 May 2020 16:27:29 +0100
Message-ID: <20200508152729.14295-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Allow lowercase a/s/h to be used to annotate a non-default feature.

However, until the toolstack migration logic is fixed, it is not safe to
activate yet.  Tolerate the annotations, but ignore them for now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

This patch has been pending the toolstack work for several months now, and we
want to start using the max tags for x86 emul work.
---
 xen/include/public/arch-x86/cpufeatureset.h | 2 ++
 xen/tools/gen-cpuid.py                      | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index e2749245f3..0ffab6c57b 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -87,6 +87,8 @@ enum {
  *   'A' = All guests.
  *   'S' = All HVM guests (not PV guests).
  *   'H' = HVM HAP guests (not PV or HVM Shadow guests).
+ *   Upper case => Available by default
+ *   Lower case => Can be opted-in to, but not available by default.
  */
 
 /* Intel-defined CPU features, CPUID level 0x00000001.edx, word 0 */
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index af5610a5e6..d90a2d85c7 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -23,6 +23,7 @@ def __init__(self, input, output):
         self.raw = {
             '!': set(),
             'A': set(), 'S': set(), 'H': set(),
+            'a': set(), 's': set(), 'h': set(),
         }
 
         # State calculated
@@ -133,9 +134,13 @@ def crunch_numbers(state):
     state.hvm_shadow_def = state.pv_def | state.raw['S']
     state.hvm_hap_def = state.hvm_shadow_def | state.raw['H']
 
+    # TODO: Ignore def/max split until the toolstack migration logic is fixed
     state.pv_max = state.pv_def
     state.hvm_shadow_max = state.hvm_shadow_def
     state.hvm_hap_max = state.hvm_hap_def
+    # state.pv_max = state.raw['A'] | state.raw['a']
+    # state.hvm_shadow_max = state.pv_max | state.raw['S'] | state.raw['s']
+    # state.hvm_hap_max = state.hvm_shadow_max | state.raw['H'] | state.raw['h']
 
     #
     # Feature dependency information.
-- 
2.11.0


