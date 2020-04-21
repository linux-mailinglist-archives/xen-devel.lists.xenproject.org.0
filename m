Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0346D1B2C08
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:13:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvW9-0005qL-JV; Tue, 21 Apr 2020 16:13:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvW7-0005oV-Hd
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:12:59 +0000
X-Inumbo-ID: f1d545e9-83ea-11ea-9160-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1d545e9-83ea-11ea-9160-12813bfff9fa;
 Tue, 21 Apr 2020 16:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CYI3fXntoKuTBeVkyy91OK1emIZvOATrp8gvGepHy7M=;
 b=PD7zjurtAAs+MC42N1bqh/fC5Th2gxBbA2KzKD/woz588YbCbUOj2ORM
 iB4VibyGe8FSpwk5HV9wpt7Kf9Xk2XJD6UdpmEhdhzVf62ADO34/w+4tv
 mSUFSALFbxaqWs4Jq4al9ZX/q40sbpDjnITKELi9fxpnadn4Cy/V37wgA g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vqf/pjQitzpEos5dEuzl3VApKVPOredEl9GVRmphC3CN+HN+RqMhN2quBTVhZpeHoA9sVkXlKP
 AQ0EP+69wNmpk55q9nNxngpJFt6RsaV6dtcBLX8tS1fxZHe5K1oAWC0+z7Q9RoW/4aGQwn2xZA
 zcEh4XaqeQLzeUn6+doLT+n9ju7UQsrBtdOEMGIL2TQwfMRzY9+jcISypAJbqvCF8eYOeQSlKv
 RDGm6lSQsvYdWINdYdI8vPt+2NaC+tvUxR26L8VG5u1U857J4f7d2Uf7d9GYtN2dYoh3M1780n
 XqE=
X-SBRS: 2.7
X-MesageID: 15998908
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="15998908"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 14/16] build: use if_changed to build mm/*/guest_%.o
Date: Tue, 21 Apr 2020 17:12:06 +0100
Message-ID: <20200421161208.2429539-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421161208.2429539-1-anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
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

The current command only runs `CC`, but the runes to build every other
object in Xen also runs `objcopy` (when CONFIG_ENFORCE_UNIQUE_SYMBOLS=y)
which modify the file symbol. But with patch
"xen,symbols: rework file symbols selection", ./symbols should still
select the file symbols directive intended to be used for guest_%.o
objects.

The goal here is to reduce the number of commands written in
makefiles.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v5:
    - reword commit message
    
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


