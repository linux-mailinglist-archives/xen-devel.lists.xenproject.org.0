Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B72F17ADC5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 19:02:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9un8-0005u0-RW; Thu, 05 Mar 2020 18:00:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VwEW=4W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j9un7-0005tv-B7
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 18:00:13 +0000
X-Inumbo-ID: 28ce1cd2-5f0b-11ea-b52f-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28ce1cd2-5f0b-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 18:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583431212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=at5R+bT2/hoFkIEcWYIA94JT/YJT3ubWaT6l3gJ/41s=;
 b=Dh+D8XonlJP1sDmYASw02ynjm6zGLaJIJks1ovDibPjd9sKyDzEONjd4
 cRMi2ux9Q1EmBvmO6SKaiP08LEWdZnwAZreDxzo/qwuwvpoQwgE/vDSke
 5xEGmkqLgLhIv3mvv9y5SPdeXIUb7kZ+1vc2mIscCfr3aqRYnVEM6YAc2 M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jAtseGSMT8ACRDUh8wP0wJWhSo5jiycZclk+EU46epWt4hhn88r+DZ5oP99zfEd79iHQmAkjtS
 wAQ0gKfk4Juh4OPBxnfSe8NzWPrEUyP2k77aTvhfkhIcCHMcM6CdOEj66cbEnJfobBHqZSIe/Q
 RRbw9XdjqNpxmJ6E4RoELXT8bmQw7g2UVi/8/7kQWfNqR3uHwgI94FnNdmglq2IUUbqr3p0p1S
 FwpmLLfFffEkX6jYuLxOVn6rk5it3Jpf9VbTOrcXbPqB/xeg9KRDgU73zhITX9lwh/3rAPFFiD
 678=
X-SBRS: 2.7
X-MesageID: 13825280
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,518,1574139600"; d="scan'208";a="13825280"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 5 Mar 2020 18:00:09 +0000
Message-ID: <20200305180009.11365-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/dom0: Fix build with clang
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

ZmluZF9tZW1vcnkoKSBpc24ndCBtYXJrZWQgYXMgX19pbml0LCBzbyBpZiBpdCBpc24ndCBmdWxs
eSBpbmxpbmVkLCBpdCBlbmRzIHVwCnRyaXBwaW5nOgoKICBFcnJvcjogc2l6ZSBvZiBkb20wX2J1
aWxkLm86LnRleHQgaXMgMHgwYzEKCkZpeGVzOiA3M2I0N2VlYTIxICJ4ODYvZG9tMDogaW1wcm92
ZSBQVkggaW5pdHJkIGFuZCBtZXRhZGF0YSBwbGFjZW1lbnQiClNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2gg
PEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vZG9t
MF9idWlsZC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIGIv
eGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKaW5kZXggYzQxNTA0ZjIyZC4uZWUxZDUwYWNj
NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKKysrIGIveGVuL2Fy
Y2gveDg2L2h2bS9kb20wX2J1aWxkLmMKQEAgLTQ5MCw4ICs0OTAsOCBAQCBzdGF0aWMgaW50IF9f
aW5pdCBwdmhfcG9wdWxhdGVfcDJtKHN0cnVjdCBkb21haW4gKmQpCiAjdW5kZWYgTUIxX1BBR0VT
CiB9CiAKLXN0YXRpYyBwYWRkcl90IGZpbmRfbWVtb3J5KGNvbnN0IHN0cnVjdCBkb21haW4gKmQs
IGNvbnN0IHN0cnVjdCBlbGZfYmluYXJ5ICplbGYsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICBzaXplX3Qgc2l6ZSkKK3N0YXRpYyBwYWRkcl90IF9faW5pdCBmaW5kX21lbW9yeSgKKyAgICBj
b25zdCBzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgZWxmX2JpbmFyeSAqZWxmLCBzaXpl
X3Qgc2l6ZSkKIHsKICAgICBwYWRkcl90IGtlcm5lbF9zdGFydCA9IChwYWRkcl90KWVsZi0+ZGVz
dF9iYXNlICYgUEFHRV9NQVNLOwogICAgIHBhZGRyX3Qga2VybmVsX2VuZCA9IFJPVU5EVVAoKHBh
ZGRyX3QpZWxmLT5kZXN0X2Jhc2UgKyBlbGYtPmRlc3Rfc2l6ZSwKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
