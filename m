Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732F41993E4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:50:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEQi-00033g-TI; Tue, 31 Mar 2020 10:47:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6p8=5Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJEQh-00032F-Aa
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:47:35 +0000
X-Inumbo-ID: 038cc518-733d-11ea-b4f4-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 038cc518-733d-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585651648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hJREXR/Deb6xN8gdjZwqytr8p+Qcw1FoTGCESEajh20=;
 b=VWXWNdVduAGTFZXcfLXzaB1LzcKnQOkh/sG8zUBS3q8Y5TwAvByuc/ja
 L94IZEwBenMQCXnhLlCQYVNP+LN3qAh7CpSuRdr0m2Q70IMZ6b1Box+cy
 Ovz6BxZfkPbdTT9jjk6JjLmn0uYENMOLW3dkBWjZdeivDhRYdDmFJcI52 w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M1Eh0mQ4Ys0U/xe6Q7L+JvVmMf0aCsAbBWLadE3vSGRZQbkzv+ClHUFKMDThikDWsVXVjMHeKH
 ssbS6H+M+tko5HYaokNkeNVS7TS28zzJrvyYelc2L5Y2KEbE4Ww5H/Or/2aD6AMZlCoi3r5h8n
 ZtyQJQcdhLgDJCflK6wSLcnM1l20avL5WggdaYfFBD5NHROHeG+AfU9EVsL+7GeJAyx04A6ra/
 4gY2dMNASHEIq03UmGLGqX6mtc/oF7yfjpCufrvRUwtM8kvxGBI/c4Xdnl2Ghi1It7H1fjFKyY
 Ad8=
X-SBRS: 2.7
X-MesageID: 14931634
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14931634"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v4 15/18] xen/build: use if_changed to build guest_%.o
Date: Tue, 31 Mar 2020 11:30:59 +0100
Message-ID: <20200331103102.1105674-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200331103102.1105674-1-anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use if_changed for building all guest_%.o objects, and make use of
command that already exist.

This patch make a change to the way guest_%.o files are built, and now
run the same commands that enforce unique symbols. But with patch
"xen,symbols: rework file symbols selection", ./symbols should still
select the file symbols directive intended to be used for guest_%.o
objects.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - remove the introduction of Kbuild's CFLAGS_$@
      and simply use make's per-target variable customization.
      Mostly to avoid using $(eval ) which might not work as expected on
      make 3.80.

 xen/arch/x86/mm/Makefile        | 14 ++++++++------
 xen/arch/x86/mm/hap/Makefile    | 15 +++++++++------
 xen/arch/x86/mm/shadow/Makefile | 14 ++++++++------
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index a2431fde6bb4..a66a57314489 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -11,11 +11,13 @@ obj-y += p2m.o p2m-pt.o
 obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o
 obj-y += paging.o
 
-guest_walk_%.o: guest_walk.c Makefile
-	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+guest_walk_%.o guest_walk_%.i guest_walk_%.s: CFLAGS-y += -DGUEST_PAGING_LEVELS=$*
 
-guest_walk_%.i: guest_walk.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+guest_walk_%.o: guest_walk.c FORCE
+	$(call if_changed_rule,cc_o_c)
 
-guest_walk_%.s: guest_walk.c Makefile
-	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
+guest_walk_%.i: guest_walk.c FORCE
+	$(call if_changed,cpp_i_c)
+
+guest_walk_%.s: guest_walk.c FORCE
+	$(call if_changed,cc_s_c)
diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
index 22e7ad54bd33..34720b2fbe2e 100644
--- a/xen/arch/x86/mm/hap/Makefile
+++ b/xen/arch/x86/mm/hap/Makefile
@@ -5,11 +5,14 @@ obj-y += guest_walk_4level.o
 obj-y += nested_hap.o
 obj-y += nested_ept.o
 
-guest_walk_%level.o: guest_walk.c Makefile
-	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+guest_walk_%level.o guest_walk_%level.i guest_walk_%level.s: \
+    CFLAGS-y += -DGUEST_PAGING_LEVELS=$*
 
-guest_walk_%level.i: guest_walk.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+guest_walk_%level.o: guest_walk.c FORCE
+	$(call if_changed_rule,cc_o_c)
 
-guest_walk_%level.s: guest_walk.c Makefile
-	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
+guest_walk_%level.i: guest_walk.c FORCE
+	$(call if_changed,cpp_i_c)
+
+guest_walk_%level.s: guest_walk.c FORCE
+	$(call if_changed,cc_s_c)
diff --git a/xen/arch/x86/mm/shadow/Makefile b/xen/arch/x86/mm/shadow/Makefile
index 23d3ff10802c..e00f9cb1aaba 100644
--- a/xen/arch/x86/mm/shadow/Makefile
+++ b/xen/arch/x86/mm/shadow/Makefile
@@ -6,11 +6,13 @@ else
 obj-y += none.o
 endif
 
-guest_%.o: multi.c Makefile
-	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+guest_%.o guest_%.i guest_%.s: CFLAGS-y += -DGUEST_PAGING_LEVELS=$*
 
-guest_%.i: multi.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+guest_%.o: multi.c FORCE
+	$(call if_changed_rule,cc_o_c)
 
-guest_%.s: multi.c Makefile
-	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
+guest_%.i: multi.c FORCE
+	$(call if_changed,cpp_i_c)
+
+guest_%.s: multi.c FORCE
+	$(call if_changed,cc_s_c)
-- 
Anthony PERARD


