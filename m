Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0361150609
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:22:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyahV-0007v7-2R; Mon, 03 Feb 2020 12:19:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyahT-0007uM-CP
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:19:35 +0000
X-Inumbo-ID: 6e27ee38-467f-11ea-ad98-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e27ee38-467f-11ea-ad98-bc764e2007e4;
 Mon, 03 Feb 2020 12:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580732371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dvQW9MIsyWDQY5I+Bv2ITSBB5rrdAmVHJebyr3CDIl0=;
 b=cgB13nzCFCPl+TBdc0J27BafLTBaRtorHA7a3Zz7jDz7OQeMI6s7rbiO
 jWYd6mVI/t5POop4NlpjxaAEdOeeuX6uXhhiukV/L025vsHN3l/pC1+yw
 glhWQkv7YD4bjqytX4tmHlMiUpPPOMWAQqHo3vqwgawwDzd2PfYzh4HFM s=;
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
IronPort-SDR: IGDWJU1o3O1XBPrhCZmkcJgvxkrr0tEI73RZ/BvEVXzKykK+NYk16u4Nmz+ewbEpj4HWvQDKNS
 1HjhEtX37ukihXlgSK/7dFgk9liRLHDRbN3GCQ4ADhLZs+7CP1mZatWf/LyGWEXZ4jS/OwdYBJ
 rnZMauMa7Nt6ifhRpH6FRfyKBO8+EKuGnnIThnqWJEnoT6vI4kSZEUddsHu55F/kUyEnXYMn7v
 6pw9saCXUBuSZBkmVsApI6tUzqjiP5Ln+mTevmbxBMQQ4qYYQUR3sDXmNIrwGYQemeduNII+up
 nvY=
X-SBRS: 2.7
X-MesageID: 12208584
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="12208584"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 13:19:16 +0100
Message-ID: <20200203121919.15748-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200203121919.15748-1-roger.pau@citrix.com>
References: <20200203121919.15748-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/4] x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBkb2luZyBhIHZpcnR1YWwgdm1leGl0IChpZTogYSB2bWV4aXQgaGFuZGxlZCBieSB0aGUg
TDEgVk1NKQppbnRlcnJ1cHRzIHNob3VsZG4ndCBiZSBpbmplY3RlZCB1c2luZyB0aGUgdmlydHVh
bCBpbnRlcnJ1cHQgZGVsaXZlcnkKbWVjaGFuaXNtIHVubGVzcyB0aGUgQWNrIG9uIGV4aXQgdm1l
eGl0IGNvbnRyb2wgYml0IGlzbid0IHNldCBpbiB0aGUKbmVzdGVkIHZtY3MuCgpHYXRlIHRoZSBj
YWxsIHRvIG52bXhfdXBkYXRlX2FwaWN2IGhlbHBlciBvbiB3aGV0aGVyIHRoZSBuZXN0ZWQgdm1j
cwpoYXMgdGhlIEFjayBvbiBleGl0IGJpdCBzZXQgaW4gdGhlIHZtZXhpdCBjb250cm9sIGZpZWxk
LgoKTm90ZSB0aGF0IHRoaXMgZml4ZXMgdGhlIHVzYWdlIG9mIHgyQVBJQyBieSB0aGUgTDEgVk1N
LCBhdCBsZWFzdCB3aGVuCnRoZSBMMSBWTU0gaXMgWGVuLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYxOgog
LSBDYWxsIG52bXhfdXBkYXRlX2FwaWN2IGlmIHRoZSAiQWNrIG9uIGV4aXQiIHZtZXhpdCBjb250
cm9sIGJpdAogICBpc24ndCBzZXQuCi0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIHwg
NyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2
L2h2bS92bXgvdnZteC5jCmluZGV4IGQ4YWIxNjdkNjIuLjNkOTdhMjkzYjIgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92
dm14LmMKQEAgLTEzOTMsNyArMTM5MywxMiBAQCBzdGF0aWMgdm9pZCB2aXJ0dWFsX3ZtZXhpdChz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKICAgICAvKiB1cGRhdGluZyBob3N0IGNyMCB0byBz
eW5jIFRTIGJpdCAqLwogICAgIF9fdm13cml0ZShIT1NUX0NSMCwgdi0+YXJjaC5odm0udm14Lmhv
c3RfY3IwKTsKIAotICAgIGlmICggY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5ICkK
KyAgICBpZiAoIGNwdV9oYXNfdm14X3ZpcnR1YWxfaW50cl9kZWxpdmVyeSAmJgorICAgICAgICAg
LyoKKyAgICAgICAgICAqIE9ubHkgaW5qZWN0IHRoZSB2ZWN0b3IgaWYgdGhlIEFjayBvbiBleGl0
IGJpdCBpcyBub3Qgc2V0LCBlbHNlIHRoZQorICAgICAgICAgICogaW50ZXJydXB0IHdpbGwgYmUg
c2lnbmFsZWQgaW4gdGhlIHZtY3MgVk1fRVhJVF9JTlRSX0lORk8gZmllbGQuCisgICAgICAgICAg
Ki8KKyAgICAgICAgICEoZ2V0X3Z2bWNzKHYsIFZNX0VYSVRfQ09OVFJPTFMpICYgVk1fRVhJVF9B
Q0tfSU5UUl9PTl9FWElUKSApCiAgICAgICAgIG52bXhfdXBkYXRlX2FwaWN2KHYpOwogCiAgICAg
bnZjcHUtPm52X3Ztc3dpdGNoX2luX3Byb2dyZXNzID0gMDsKLS0gCjIuMjUuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
