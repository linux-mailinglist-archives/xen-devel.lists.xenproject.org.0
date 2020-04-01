Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2177019AD00
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 15:41:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJdZC-0000wE-Rl; Wed, 01 Apr 2020 13:38:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eFaW=5R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jJdZB-0000w9-7v
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 13:38:01 +0000
X-Inumbo-ID: 00ac59da-741e-11ea-bacc-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00ac59da-741e-11ea-bacc-12813bfff9fa;
 Wed, 01 Apr 2020 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585748280;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DdzrpYbUr6wVxb2p2gxB787Cbfg7TTvKh4VHOu/TyzE=;
 b=KR7piUIWjkyImhXEzkXHu2FXPsmWWY8xC4KcS0uZcTn8JNVUDL2Y6suG
 m3AYjUFc4j8CjN5CzBOS6iZ2EE3uf3xXcu/Yg9hsPCUVo7f6+UpLaw+q3
 LIEYUFIICoaGc1z9CqKAX9c0K/Swo4Qt4q3rmAAtadH4uxAZfeeiAW1gy w=;
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
IronPort-SDR: sZPiwuXttoB/QIfvMQye0xdMLzUrUni/Sx02jv5gzK2YNZYIoANBX9OD53TKRCAAunRPX0c4qB
 RJ/E0i5ZvcsBWhdu0WwA7eFRRll4hWZwPixd4GxXNBOdYVZPIEZh5ZS1hB5XYFNqtNSY2lj5Rt
 k4ueFC+h49ysZVu0fZ64Lq4fuZ/ca4WD0i9tpNGBHUdpO+w4JDYE5NOMWSlUvjTHw1jOcD97j3
 RoLzaWUBl7bUAtYSmJk6Bx01cCvHTxSknHgJVteH0iMeITuvK3VdCBuqxREQ/2mXNW4gc7lWPE
 pro=
X-SBRS: 2.7
X-MesageID: 15325383
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,331,1580792400"; d="scan'208";a="15325383"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] timeout: adjust timeout when running nested tests
Date: Wed, 1 Apr 2020 15:37:40 +0200
Message-ID: <20200401133740.64685-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Expand the timeouts when the host is nested. The current algorithm
uses base_timeout * 2 ^ nesting_level.

This fixes the issues reported by the nested tests on elbling boxes:

http://logs.test-lab.xenproject.org/osstest/logs/149283/

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 Osstest/TestSupport.pm | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 1c13e2af..ff749a32 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -436,6 +436,7 @@ END
 
 sub target_adjust_timeout ($$) {
     my ($ho,$timeoutref) = @_; # $ho might be a $gho
+    my $nestinglvl = $ho->{NestingLevel} || $ho->{Host}{NestingLevel};
     my $adjust = sub {
 	my ($factor, $what) = @_;
 	return unless defined $factor;
@@ -450,6 +451,9 @@ sub target_adjust_timeout ($$) {
 	$adjust->(guest_var($ho,$guest_var), "guest variable $guest_var");
     }
     $adjust->(get_target_property($ho,"TimeoutFactor"), "target TimeoutFactor");
+    if ($nestinglvl) {
+        $adjust->(1 << $nestinglvl, "nesting level");
+    }
 }
 
 #---------- running commands eg on targets ----------
-- 
2.26.0


