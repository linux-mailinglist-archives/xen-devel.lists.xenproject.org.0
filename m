Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E1715F73B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 20:58:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2h3V-0007GM-4q; Fri, 14 Feb 2020 19:55:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kWBW=4C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j2h3T-0007GH-FN
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 19:55:15 +0000
X-Inumbo-ID: ea47791a-4f63-11ea-bb15-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea47791a-4f63-11ea-bb15-12813bfff9fa;
 Fri, 14 Feb 2020 19:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581710114;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vJbYquKhzTURDxBSC6+aFfQAoKAp8avsVonHsh/50E8=;
 b=M3qs0iV0rKmLYFn+fCREHWitS6IZnu/jleqiDg5qXjUzMM382z8hdghH
 hcU844fnWyu9l1mCMIetGs7P2nMfGgXtwQmghbtbXwm3uc7ddA4fwgGkS
 SG/zamr8TiNhMphPTB0zivR/Edb6kvjadPMQwbAlLDdgeW/H9u4IjwKUN Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VteUx0HQqxY1mCExpFHzMNsnsaAVJUh1vZq6mByjxIiJFMExshijMiG3sH284tr++cvQeqyHgc
 4Ci6NlANC8swf2XuhJsmoETvQQ9HWQO2AI+u1LM0+I5dJSPpw3V2dJh1OreQgEuKGXNAAsp7IG
 GPY4YDnTQLxnhciunjTpRllhm1LIqpQMwbPDBk5wJ2iWwW3sJRt90dCTrS60yS8WR2HJpA/coU
 4EaEAgEBY7MAzKq7hQRHVbeXFbsElPJjf2hhBD/9adzRCxJG0/lDrF6gUVt4bUkDolrXLDQw2+
 O/I=
X-SBRS: 2.7
X-MesageID: 13110272
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,441,1574139600"; d="scan'208";a="13110272"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 14 Feb 2020 19:55:10 +0000
Message-ID: <20200214195510.22667-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/msr: Virtualise MSR_PLATFORM_ID properly
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhbiBJbnRlbC1vbmx5LCByZWFkLW9ubHkgTVNSIHJlbGF0ZWQgdG8gbWljcm9jb2Rl
IGxvYWRpbmcuICBFeHBvc2UgaXQKaW4gc2ltaWxhciBjaXJjdW1zdGFuY2VzIGFzIHRoZSBQQVRD
SExFVkVMIE1TUi4KClRoaXMgc2hvdWxkIGhhdmUgYmVlbiBhbG9uZ3NpZGUgYy9zIDAxMzg5NmNi
OGIyICJ4ODYvbXNyOiBGaXggaGFuZGxpbmcgb2YKTVNSX0FNRF9QQVRDSExFVkVML01TUl9JQTMy
X1VDT0RFX1JFViIKClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgoKVHVybnMgb3V0IEkgd3JvdGUgdGhpcyBuZWFybHkgYSB5ZWFyIGFnbyBhbmQgZGlk
bid0IHNlbmQgaXQuICBJdCBvYnZpb3VzbHkgZ290CmRyb3BwZWQgaW4gdGhlIGxlYWR1cCB0byBN
RFMuCi0tLQogeGVuL2FyY2gveDg2L21zci5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tc3IuYyBiL3hlbi9h
cmNoL3g4Ni9tc3IuYwppbmRleCA3ODU1NzRkZTY3Li4xY2VhNzc3NjgwIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvbXNyLmMKKysrIGIveGVuL2FyY2gveDg2L21zci5jCkBAIC0xNDMsNiArMTQz
LDEzIEBAIGludCBndWVzdF9yZG1zcihzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbXNyLCB1aW50
NjRfdCAqdmFsKQogICAgICAgICAvKiBOb3Qgb2ZmZXJlZCB0byBndWVzdHMuICovCiAgICAgICAg
IGdvdG8gZ3BfZmF1bHQ7CiAKKyAgICBjYXNlIE1TUl9JQTMyX1BMQVRGT1JNX0lEOgorICAgICAg
ICBpZiAoICEoY3AtPng4Nl92ZW5kb3IgJiBYODZfVkVORE9SX0lOVEVMKSB8fAorICAgICAgICAg
ICAgICEoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYgWDg2X1ZFTkRPUl9JTlRFTCkgKQorICAg
ICAgICAgICAgZ290byBncF9mYXVsdDsKKyAgICAgICAgcmRtc3JsKE1TUl9JQTMyX1BMQVRGT1JN
X0lELCAqdmFsKTsKKyAgICAgICAgYnJlYWs7CisKICAgICBjYXNlIE1TUl9BTURfUEFUQ0hMRVZF
TDoKICAgICAgICAgQlVJTERfQlVHX09OKE1TUl9JQTMyX1VDT0RFX1JFViAhPSBNU1JfQU1EX1BB
VENITEVWRUwpOwogICAgICAgICAvKgpAQCAtMjc1LDYgKzI4Miw3IEBAIGludCBndWVzdF93cm1z
cihzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbXNyLCB1aW50NjRfdCB2YWwpCiAgICAgewogICAg
ICAgICB1aW50NjRfdCByc3ZkOwogCisgICAgY2FzZSBNU1JfSUEzMl9QTEFURk9STV9JRDoKICAg
ICBjYXNlIE1TUl9JTlRFTF9DT1JFX1RIUkVBRF9DT1VOVDoKICAgICBjYXNlIE1TUl9JTlRFTF9Q
TEFURk9STV9JTkZPOgogICAgIGNhc2UgTVNSX0FSQ0hfQ0FQQUJJTElUSUVTOgotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
