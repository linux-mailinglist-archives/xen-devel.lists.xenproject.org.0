Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF018B5F9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 12:56:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxURI-0002Wa-BU; Tue, 13 Aug 2019 10:54:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxURG-0002WJ-Qp
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 10:54:02 +0000
X-Inumbo-ID: a8176090-bdb8-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a8176090-bdb8-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 10:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565693641;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9z6PKWHwjMviQJJ+Zn6rH5iWq4EvXtwXDSLdBAoqTc0=;
 b=gYmAn+vKS9Qb/dxwpb1rORZ+nN5RxswZelzxSpjpYiskAabvARySlZtA
 FUpl77gFCyA1TsP+WpnA4IeEgLed4LCnVR9xmc5l1Y0h4fYaJFHPLgird
 TeP69i8XoM82c/WXGnugA57JKR3CQ2Bw6qtk06IDnLpjhNU1/Yq5qvyv+ E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iSblhgUSAy+QMR5kR1pilUQNHPf8HAkOzuIB3nS+tnPAgL+JFPyxa3dtQuu4E9N38FG5oqyxZn
 mZG8TodZndFF2GDn3bBfXZLaHh4TsY0CP2vB3poAOeu03hBO13FnCU5ArCw10SOEuN5erUqeUL
 z5+2JlJ1tvd6trFF8kBIsYvYTI5f17bAsPITg8fsuQOjxdbmYtmJd66uVKYkEqjDHPs/4HewYI
 ejVv3alB/8nGVULYl1787jHrarRfUqeSmNGomC4Vo9f0WRqeLlB9wqi7v3k6bdHbtEA/MkVBt5
 BLk=
X-SBRS: 2.7
X-MesageID: 4196469
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4196469"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 13 Aug 2019 11:53:50 +0100
Message-ID: <20190813105352.32412-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] xen: Drop obsolete DOMCTLs
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
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Rob Hoes <Rob.Hoes@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgZG9tY3RscyBleGlzdCB0byB3b3JrIGFyb3VuZCBidWdzIGluIG9ic29sZXRlIDMyYml0
IFBWIGd1ZXN0cy4gIFRoZXkgYXJlCm5vIGxvbmdlciB1c2VmdWwuCgpBbmRyZXcgQ29vcGVyICgy
KToKICB4ZW46IERyb3AgWEVOX0RPTUNUTF9zdXBwcmVzc19zcHVyaW91c19wYWdlX2ZhdWx0cwog
IHhlbjogRHJvcCBYRU5fRE9NQ1RMX3tnZXQsc2V0fV9tYWNoaW5lX2FkZHJlc3Nfc2l6ZQoKIHRv
b2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oICAgICAgIHwgIDkgLS0tLS0tLS0KIHRvb2xzL2xp
YnhjL3hjX2RvbWFpbi5jICAgICAgICAgICAgIHwgNDEgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgICAgICB8ICA1IC0tLS0t
CiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpICAgICB8ICA1IC0tLS0tCiB0b29scy9v
Y2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyB8IDI2IC0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
dG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jICAgfCA0NSAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvZG9tY3RsLmMgICAgICAgICAgICAg
ICB8IDE2IC0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAgICAgICAgICAgICAg
IHwgMTQgLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oICAgICAgICB8
ICAzIC0tLQogeGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oICAgICAgICAgfCAxOCArKystLS0t
LS0tLS0tLS0KIHhlbi94c20vZmxhc2svaG9va3MuYyAgICAgICAgICAgICAgIHwgIDMgLS0tCiB4
ZW4veHNtL2ZsYXNrL3BvbGljeS9hY2Nlc3NfdmVjdG9ycyB8ICA3ICsrKy0tLQogMTIgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxODYgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
