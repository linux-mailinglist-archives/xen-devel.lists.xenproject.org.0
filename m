Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F47F1993DB
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:49:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEQZ-0002vr-9a; Tue, 31 Mar 2020 10:47:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6p8=5Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJEQX-0002uY-9C
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:47:25 +0000
X-Inumbo-ID: fe66ed16-733c-11ea-83d8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe66ed16-733c-11ea-83d8-bc764e2007e4;
 Tue, 31 Mar 2020 10:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585651639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OFAz1fugU3l3YdNV5mZP5c0I0tExp22dADHA+0CiQhM=;
 b=KApy001RsL3+yLM/84Mo6qzQq6tMonqNhNL84OWNOhf71vJn5NivbYHa
 kbJAwEo5Go3hbaoCHaTNCegSSfxB21i/V1zUFSIHs6YLb+/7qYsJpEOm0
 25UlN6wfu7I1ddK9WHLoqgV0fRWlSl1tIiF43+8Xdy+hbPw2PCU3MxxGp 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AyEooyTpBqlOIWVXy3xFHTEcW0CEkYpDuLUyZnvUsv7BHR4ALDW7+qBFx/qWQrD4WtMusLgvTr
 hG53AY9mh4XSiCK0ayJn9KIqQKOWjeX5bVb0AAiTTTdYPsjzJWqXzFqO35fJ5bY1+5kA5vApli
 YBwlcF03FKg74rvgckr08MhTaQUjwxkdo477xHcdaNRuUE0qJgpyOtyvS8/NrQQREPJQaUksZQ
 5vD6ZNg4uMX2mkIyVgIZiJvzu3GC8+qwWMt1M2042SR1wpPnCp6G2//JkM0PXltg91tIjTrRP/
 CvU=
X-SBRS: 2.7
X-MesageID: 15246893
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15246893"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v4 10/18] xen/build: use if_changed on built_in.o
Date: Tue, 31 Mar 2020 11:30:54 +0100
Message-ID: <20200331103102.1105674-11-anthony.perard@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In the case where $(obj-y) is empty, we also replace $(c_flags) by
$(XEN_CFLAGS) to avoid generating an .%.d dependency file. This avoid
make trying to include %.h file in the ld command if $(obj-y) isn't
empty anymore on a second run.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - Have cmd_ld_builtin depends on CONFIG_LTO, which simplify built_in.o
      rule.

 xen/Rules.mk | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 5e668f5ba0d8..c744175fd6f0 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -130,15 +130,24 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
 c_flags += $(CFLAGS-y)
 a_flags += $(CFLAGS-y) $(AFLAGS-y)
 
-built_in.o: $(obj-y) $(extra-y)
-ifeq ($(obj-y),)
-	$(CC) $(c_flags) -c -x c /dev/null -o $@
-else
+quiet_cmd_ld_builtin = LD      $@
 ifeq ($(CONFIG_LTO),y)
-	$(LD_LTO) -r -o $@ $(filter-out $(extra-y),$^)
+cmd_ld_builtin = \
+    $(LD_LTO) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
 else
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
+cmd_ld_builtin = \
+    $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
 endif
+
+quiet_cmd_cc_builtin = LD      $@
+cmd_cc_builtin = \
+    $(CC) $(XEN_CFLAGS) -c -x c /dev/null -o $@
+
+built_in.o: $(obj-y) $(extra-y) FORCE
+ifeq ($(obj-y),)
+	$(call if_changed,cc_builtin)
+else
+	$(call if_changed,ld_builtin)
 endif
 
 targets += built_in.o
-- 
Anthony PERARD


