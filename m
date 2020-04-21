Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AFB1B2BFF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:12:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvVu-0005a8-HR; Tue, 21 Apr 2020 16:12:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvVs-0005Yk-QF
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:12:44 +0000
X-Inumbo-ID: eb4cf23e-83ea-11ea-b4f4-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb4cf23e-83ea-11ea-b4f4-bc764e2007e4;
 Tue, 21 Apr 2020 16:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s+d3Av6oel5qMTSwNLaojwyj9CuUdXJgvmHiictMXoI=;
 b=YWByUit3bQOKzVXz3HSTt5Nxkmlk3vHxEGVuuoXO9rz2E1UgEN6p6RK0
 tVhDD9WEvG0aTDPicmPiqJR0HqXJr1L+F1dq/RF+G2o+lRIspBpvANvWy
 PtMQTsh9mUpo63ol9U98rX4rfbEsbMg2RY7BDDf3I+Ssk7xfNbJgD5GP4 M=;
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
IronPort-SDR: q9maglSWzj19QYn3MKDXTkwLOC3tZHBAOphDPsyhBvZzMFAEiKTeKUfAIjQ5yE/KBLrAmsEsqS
 HFgjxL1hthFHWSTmySTWArecW2UaiuDBL5ouWTZh5suWaAQUVCqqS2i9PpFSpj+3Q2kQSJY8RO
 kXPMUIAXxNknd9J9+C4hPBHRAZNuishUiyq4cFFPwCxyVsXau8l7s+NkA9S9ZRJAZoJdB56uxN
 L4/G3S2TUSE1zaGbzCZDNG4gaouELAsh4tfja3tEvYBT1meGNegYnGTQUNG/O1rRPB8vd1rKUE
 glw=
X-SBRS: 2.7
X-MesageID: 16330448
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16330448"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 08/16] build: Introduce $(cpp_flags)
Date: Tue, 21 Apr 2020 17:12:00 +0100
Message-ID: <20200421161208.2429539-9-anthony.perard@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v5:
    - new patch

 xen/Rules.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 2e28c572305a..25bcf45612bd 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -123,6 +123,7 @@ $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
 
 c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_CFLAGS) '-D__OBJECT_FILE__="$@"'
 a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_AFLAGS)
+cpp_flags = $(filter-out -Wa$(comma)%,$(a_flags))
 
 include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
 
@@ -207,7 +208,7 @@ quiet_cmd_cc_s_c = CC      $@
 cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
 
 quiet_cmd_s_S = CPP     $@
-cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
+cmd_s_S = $(CPP) $(cpp_flags) $< -o $@
 
 %.i: %.c FORCE
 	$(call if_changed,cpp_i_c)
-- 
Anthony PERARD


