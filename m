Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E558B157A75
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 14:23:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j18xj-0006Gf-S0; Mon, 10 Feb 2020 13:18:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8uky=36=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j18xi-0006GZ-Nh
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 13:18:54 +0000
X-Inumbo-ID: e1ee476c-4c07-11ea-8cad-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1ee476c-4c07-11ea-8cad-bc764e2007e4;
 Mon, 10 Feb 2020 13:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581340733;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=zVHYbeqqY6rE5AK10xq5c+T7g0bb1AZCwHUj+R05lvo=;
 b=d0oidAl1ZlwmtjLg6ODUmgHhNX07sOfpsAMcW26Snini5+QpdgFfjGyu
 LeCPDlBLaNQ3ks8IwNQTnRXzOIAM3Otx5MXdlmJpmDsQIbPOQFHLFUQqB
 8ikSIajq5Mb8nCzuvfuFSYY0oZDO/oW4l0b3Sk+zw0Pbu1LSxSEWrpAbH 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /K0TpT/dllT0N2YfvUWMCM7xYCIQQFsJ19UPZFiyWNosnxvhfwis/h4q72F3WwkA7JffuL0Gq7
 GeQ+FFH6Gd20Zn8/Yx9SM1HgmmwOC3kN/n1/COr/W2H63t02NvjIeoYNwAVCtn0J/XQreNqaer
 /U6/ojIcchpxrnBaFqGtdtNsCxczk8FSYuEH/5ISSd5GsIv8p59PhgW89KYwXRDoGbO6Aw/eUA
 J52EsiI/nEj4b+ZHny8Bhr6HmHPqC1R/jZzcQ+zSDQLTtcqVAF295+Oo5YQM2jT10n4elLLIb2
 PUs=
X-SBRS: 2.7
X-MesageID: 12206241
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12206241"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 10 Feb 2020 13:18:48 +0000
Message-ID: <20200210131848.17812-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] production-config: Update
 TftpDiVersion_stretch
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogcHJvZHVjdGlvbi1jb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wcm9kdWN0aW9uLWNvbmZpZyBiL3Byb2R1
Y3Rpb24tY29uZmlnCmluZGV4IDQxZjY4NDA5Li4xMDNiODkxNSAxMDA2NDQKLS0tIGEvcHJvZHVj
dGlvbi1jb25maWcKKysrIGIvcHJvZHVjdGlvbi1jb25maWcKQEAgLTkwLDcgKzkwLDcgQEAgVGZ0
cE5ldGJvb3RHcm91cCBvc3N0ZXN0CiAjIFVwZGF0ZSB3aXRoIC4vbWctZGViaWFuLWluc3RhbGxl
ci11cGRhdGUoLWFsbCkKIFRmdHBEaVZlcnNpb25fd2hlZXp5IDIwMTYtMDYtMDgKIFRmdHBEaVZl
cnNpb25famVzc2llIDIwMTgtMDYtMjYKLVRmdHBEaVZlcnNpb25fc3RyZXRjaCAyMDE5LTA5LTEw
CitUZnRwRGlWZXJzaW9uX3N0cmV0Y2ggMjAyMC0wMi0xMAogCiBEZWJpYW5TbmFwc2hvdEJhY2tw
b3J0c19qZXNzaWUgaHR0cDovL3NuYXBzaG90LmRlYmlhbi5vcmcvYXJjaGl2ZS9kZWJpYW4vMjAx
OTAyMDZUMjExMzE0Wi8KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
