Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F4158164
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 18:31:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Crk-0006XI-Ie; Mon, 10 Feb 2020 17:29:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rnvo=36=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1Crj-0006XC-LU
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 17:28:59 +0000
X-Inumbo-ID: d091063b-4c2a-11ea-b4ed-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d091063b-4c2a-11ea-b4ed-12813bfff9fa;
 Mon, 10 Feb 2020 17:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581355737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uUoQTuZEsUGEVGHSUK0BEbUiZ5gXBfpmyEflI5hxczI=;
 b=Fk0JBh5ZXPtfNx2hGwA3MMJ5RFx9bfUzussmiyhszGS83wwinnm8293x
 SpJmaLW1Daf5rgv1hlKvtnqLtmx2J/eMZTFzRqpO7XS9Ej3XOEfcYw3y1
 X+M8bfinMgBJ6odrDxLdwfr+ah73am0bz5pn8XJ2hS4pyJH1D7EoHqoHa U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3NwHMWxwBZOvTz9oEguqw3OmoJ6ovwJyphb9ygKPrlcrvgDMInAAXCfbcOF/SGKMpuq8NgoWuV
 rfHlYSTjb6kSUl7SrKqHtS1fkO3nxBcyNUeWoGuGljpnzzEfbBKUXYZRdMVCeIMVIvdQnowDbC
 eEkaWaJ3vfY5xyCORVSShL2OJVxXDzO2SqrPn9jYOjl3L8gU4hOS0Tp0cwZc7YoowiOgVhNPWR
 hEdjI3GNCbEtoGpbeCS+CAv14BW1gB4/Q45cc1UDsmMyfuuaW8AEYa4L7htjIINdmdgGSsgAgu
 L6E=
X-SBRS: 2.7
X-MesageID: 12214557
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12214557"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 10 Feb 2020 18:28:24 +0100
Message-ID: <20200210172829.43604-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210172829.43604-1-roger.pau@citrix.com>
References: <20200210172829.43604-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 2/7] x86/paging: add TLB flush hooks
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
Cc: Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIHNoYWRvdyBhbmQgaGFwIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIGhlbHBlcnMgdG8gcGVy
Zm9ybSBndWVzdApUTEIgZmx1c2hlcy4gTm90ZSB0aGF0IHRoZSBjb2RlIGZvciBib3RoIGlzIGV4
YWN0bHkgdGhlIHNhbWUgYXQgdGhlCm1vbWVudCwgYW5kIGlzIGNvcGllZCBmcm9tIGh2bV9mbHVz
aF92Y3B1X3RsYi4gVGhpcyB3aWxsIGJlIGNoYW5nZWQgYnkKZnVydGhlciBwYXRjaGVzIHRoYXQg
d2lsbCBhZGQgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgb3B0aW1pemF0aW9ucyB0bwp0aGVtLgoK
Tm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhl
bi5vcmc+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYzOgogLSBGaXggc3RyYXkgbmV3bGluZSByZW1vdmFs
LgogLSBGaXggcmV0dXJuIG9mIHNoYWRvd19mbHVzaF90bGIgZHVtbXkgZnVuY3Rpb24uCi0tLQog
eGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICB8IDUxICsrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYyAgICAgICB8IDU0ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5j
IHwgNTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2hhcC5oICAgICAgIHwgIDMgKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvc2hhZG93LmggICAg
fCAxMiArKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDEyNyBpbnNlcnRpb25zKCspLCA0OCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gv
eDg2L2h2bS9odm0uYwppbmRleCAwMGE5ZTcwYjdjLi40MDQ5ZjU3MjMyIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTM5
OTAsNTUgKzM5OTAsMTAgQEAgc3RhdGljIHZvaWQgaHZtX3MzX3Jlc3VtZShzdHJ1Y3QgZG9tYWlu
ICpkKQogYm9vbCBodm1fZmx1c2hfdmNwdV90bGIoYm9vbCAoKmZsdXNoX3ZjcHUpKHZvaWQgKmN0
eHQsIHN0cnVjdCB2Y3B1ICp2KSwKICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmN0eHQp
CiB7Ci0gICAgc3RhdGljIERFRklORV9QRVJfQ1BVKGNwdW1hc2tfdCwgZmx1c2hfY3B1bWFzayk7
Ci0gICAgY3B1bWFza190ICptYXNrID0gJnRoaXNfY3B1KGZsdXNoX2NwdW1hc2spOwotICAgIHN0
cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47Ci0gICAgc3RydWN0IHZjcHUgKnY7Ci0K
LSAgICAvKiBBdm9pZCBkZWFkbG9jayBpZiBtb3JlIHRoYW4gb25lIHZjcHUgdHJpZXMgdGhpcyBh
dCB0aGUgc2FtZSB0aW1lLiAqLwotICAgIGlmICggIXNwaW5fdHJ5bG9jaygmZC0+aHlwZXJjYWxs
X2RlYWRsb2NrX211dGV4KSApCi0gICAgICAgIHJldHVybiBmYWxzZTsKLQotICAgIC8qIFBhdXNl
IGFsbCBvdGhlciB2Y3B1cy4gKi8KLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCi0gICAgICAg
IGlmICggdiAhPSBjdXJyZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwgdikgKQotICAgICAgICAgICAg
dmNwdV9wYXVzZV9ub3N5bmModik7Ci0KLSAgICAvKiBOb3cgdGhhdCBhbGwgVkNQVXMgYXJlIHNp
Z25hbGxlZCB0byBkZXNjaGVkdWxlLCB3ZSB3YWl0Li4uICovCi0gICAgZm9yX2VhY2hfdmNwdSAo
IGQsIHYgKQotICAgICAgICBpZiAoIHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1KGN0eHQsIHYp
ICkKLSAgICAgICAgICAgIHdoaWxlICggIXZjcHVfcnVubmFibGUodikgJiYgdi0+aXNfcnVubmlu
ZyApCi0gICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7Ci0KLSAgICAvKiBBbGwgb3RoZXIgdmNw
dXMgYXJlIHBhdXNlZCwgc2FmZSB0byB1bmxvY2sgbm93LiAqLwotICAgIHNwaW5fdW5sb2NrKCZk
LT5oeXBlcmNhbGxfZGVhZGxvY2tfbXV0ZXgpOwotCi0gICAgY3B1bWFza19jbGVhcihtYXNrKTsK
LQotICAgIC8qIEZsdXNoIHBhZ2luZy1tb2RlIHNvZnQgc3RhdGUgKGUuZy4sIHZhLT5nZm4gY2Fj
aGU7IFBBRSBQRFBFIGNhY2hlKS4gKi8KLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCi0gICAg
ewotICAgICAgICB1bnNpZ25lZCBpbnQgY3B1OwotCi0gICAgICAgIGlmICggIWZsdXNoX3ZjcHUo
Y3R4dCwgdikgKQotICAgICAgICAgICAgY29udGludWU7Ci0KLSAgICAgICAgcGFnaW5nX3VwZGF0
ZV9jcjModiwgZmFsc2UpOworICAgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gY3VycmVudC0+ZG9t
YWluOwogCi0gICAgICAgIGNwdSA9IHJlYWRfYXRvbWljKCZ2LT5kaXJ0eV9jcHUpOwotICAgICAg
ICBpZiAoIGlzX3ZjcHVfZGlydHlfY3B1KGNwdSkgKQotICAgICAgICAgICAgX19jcHVtYXNrX3Nl
dF9jcHUoY3B1LCBtYXNrKTsKLSAgICB9Ci0KLSAgICAvKiBGbHVzaCBUTEJzIG9uIGFsbCBDUFVz
IHdpdGggZGlydHkgdmNwdSBzdGF0ZS4gKi8KLSAgICBmbHVzaF90bGJfbWFzayhtYXNrKTsKLQot
ICAgIC8qIERvbmUuICovCi0gICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQotICAgICAgICBpZiAo
IHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1KGN0eHQsIHYpICkKLSAgICAgICAgICAgIHZjcHVf
dW5wYXVzZSh2KTsKLQotICAgIHJldHVybiB0cnVlOworICAgIHJldHVybiBzaGFkb3dfbW9kZV9l
bmFibGVkKGN1cnJkKSA/IHNoYWRvd19mbHVzaF90bGIoZmx1c2hfdmNwdSwgY3R4dCkKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBoYXBfZmx1c2hfdGxiKGZsdXNoX3Zj
cHUsIGN0eHQpOwogfQogCiBzdGF0aWMgYm9vbCBhbHdheXNfZmx1c2godm9pZCAqY3R4dCwgc3Ry
dWN0IHZjcHUgKnYpCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jIGIveGVu
L2FyY2gveDg2L21tL2hhcC9oYXAuYwppbmRleCAzZDkzZjM0NTFjLi42ODk0YzFhYTM4IDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9o
YXAvaGFwLmMKQEAgLTY2OSw2ICs2NjksNjAgQEAgc3RhdGljIHZvaWQgaGFwX3VwZGF0ZV9jcjMo
c3RydWN0IHZjcHUgKnYsIGludCBkb19sb2NraW5nLCBib29sIG5vZmx1c2gpCiAgICAgaHZtX3Vw
ZGF0ZV9ndWVzdF9jcjModiwgbm9mbHVzaCk7CiB9CiAKK2Jvb2wgaGFwX2ZsdXNoX3RsYihib29s
ICgqZmx1c2hfdmNwdSkodm9pZCAqY3R4dCwgc3RydWN0IHZjcHUgKnYpLAorICAgICAgICAgICAg
ICAgICAgIHZvaWQgKmN0eHQpCit7CisgICAgc3RhdGljIERFRklORV9QRVJfQ1BVKGNwdW1hc2tf
dCwgZmx1c2hfY3B1bWFzayk7CisgICAgY3B1bWFza190ICptYXNrID0gJnRoaXNfY3B1KGZsdXNo
X2NwdW1hc2spOworICAgIHN0cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47CisgICAg
c3RydWN0IHZjcHUgKnY7CisKKyAgICAvKiBBdm9pZCBkZWFkbG9jayBpZiBtb3JlIHRoYW4gb25l
IHZjcHUgdHJpZXMgdGhpcyBhdCB0aGUgc2FtZSB0aW1lLiAqLworICAgIGlmICggIXNwaW5fdHJ5
bG9jaygmZC0+aHlwZXJjYWxsX2RlYWRsb2NrX211dGV4KSApCisgICAgICAgIHJldHVybiBmYWxz
ZTsKKworICAgIC8qIFBhdXNlIGFsbCBvdGhlciB2Y3B1cy4gKi8KKyAgICBmb3JfZWFjaF92Y3B1
ICggZCwgdiApCisgICAgICAgIGlmICggdiAhPSBjdXJyZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwg
dikgKQorICAgICAgICAgICAgdmNwdV9wYXVzZV9ub3N5bmModik7CisKKyAgICAvKiBOb3cgdGhh
dCBhbGwgVkNQVXMgYXJlIHNpZ25hbGxlZCB0byBkZXNjaGVkdWxlLCB3ZSB3YWl0Li4uICovCisg
ICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQorICAgICAgICBpZiAoIHYgIT0gY3VycmVudCAmJiBm
bHVzaF92Y3B1KGN0eHQsIHYpICkKKyAgICAgICAgICAgIHdoaWxlICggIXZjcHVfcnVubmFibGUo
dikgJiYgdi0+aXNfcnVubmluZyApCisgICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7CisKKyAg
ICAvKiBBbGwgb3RoZXIgdmNwdXMgYXJlIHBhdXNlZCwgc2FmZSB0byB1bmxvY2sgbm93LiAqLwor
ICAgIHNwaW5fdW5sb2NrKCZkLT5oeXBlcmNhbGxfZGVhZGxvY2tfbXV0ZXgpOworCisgICAgY3B1
bWFza19jbGVhcihtYXNrKTsKKworICAgIC8qIEZsdXNoIHBhZ2luZy1tb2RlIHNvZnQgc3RhdGUg
KGUuZy4sIHZhLT5nZm4gY2FjaGU7IFBBRSBQRFBFIGNhY2hlKS4gKi8KKyAgICBmb3JfZWFjaF92
Y3B1ICggZCwgdiApCisgICAgeworICAgICAgICB1bnNpZ25lZCBpbnQgY3B1OworCisgICAgICAg
IGlmICggIWZsdXNoX3ZjcHUoY3R4dCwgdikgKQorICAgICAgICAgICAgY29udGludWU7CisKKyAg
ICAgICAgcGFnaW5nX3VwZGF0ZV9jcjModiwgZmFsc2UpOworCisgICAgICAgIGNwdSA9IHJlYWRf
YXRvbWljKCZ2LT5kaXJ0eV9jcHUpOworICAgICAgICBpZiAoIGlzX3ZjcHVfZGlydHlfY3B1KGNw
dSkgKQorICAgICAgICAgICAgX19jcHVtYXNrX3NldF9jcHUoY3B1LCBtYXNrKTsKKyAgICB9CisK
KyAgICAvKiBGbHVzaCBUTEJzIG9uIGFsbCBDUFVzIHdpdGggZGlydHkgdmNwdSBzdGF0ZS4gKi8K
KyAgICBmbHVzaF90bGJfbWFzayhtYXNrKTsKKworICAgIC8qIERvbmUuICovCisgICAgZm9yX2Vh
Y2hfdmNwdSAoIGQsIHYgKQorICAgICAgICBpZiAoIHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1
KGN0eHQsIHYpICkKKyAgICAgICAgICAgIHZjcHVfdW5wYXVzZSh2KTsKKworICAgIHJldHVybiB0
cnVlOworfQorCiBjb25zdCBzdHJ1Y3QgcGFnaW5nX21vZGUgKgogaGFwX3BhZ2luZ19nZXRfbW9k
ZShzdHJ1Y3QgdmNwdSAqdikKIHsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cv
Y29tbW9uLmMgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCmluZGV4IDYyMTJlYzJj
NGEuLmVlOTBlNTViNDEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9u
LmMKKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYwpAQCAtMzM1Nyw2ICszMzU3
LDYxIEBAIG91dDoKICAgICByZXR1cm4gcmM7CiB9CiAKKy8qIEZsdWhzIFRMQiBvZiBzZWxlY3Rl
ZCB2Q1BVcy4gKi8KK2Jvb2wgc2hhZG93X2ZsdXNoX3RsYihib29sICgqZmx1c2hfdmNwdSkodm9p
ZCAqY3R4dCwgc3RydWN0IHZjcHUgKnYpLAorICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmN0
eHQpCit7CisgICAgc3RhdGljIERFRklORV9QRVJfQ1BVKGNwdW1hc2tfdCwgZmx1c2hfY3B1bWFz
ayk7CisgICAgY3B1bWFza190ICptYXNrID0gJnRoaXNfY3B1KGZsdXNoX2NwdW1hc2spOworICAg
IHN0cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47CisgICAgc3RydWN0IHZjcHUgKnY7
CisKKyAgICAvKiBBdm9pZCBkZWFkbG9jayBpZiBtb3JlIHRoYW4gb25lIHZjcHUgdHJpZXMgdGhp
cyBhdCB0aGUgc2FtZSB0aW1lLiAqLworICAgIGlmICggIXNwaW5fdHJ5bG9jaygmZC0+aHlwZXJj
YWxsX2RlYWRsb2NrX211dGV4KSApCisgICAgICAgIHJldHVybiBmYWxzZTsKKworICAgIC8qIFBh
dXNlIGFsbCBvdGhlciB2Y3B1cy4gKi8KKyAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCisgICAg
ICAgIGlmICggdiAhPSBjdXJyZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwgdikgKQorICAgICAgICAg
ICAgdmNwdV9wYXVzZV9ub3N5bmModik7CisKKyAgICAvKiBOb3cgdGhhdCBhbGwgVkNQVXMgYXJl
IHNpZ25hbGxlZCB0byBkZXNjaGVkdWxlLCB3ZSB3YWl0Li4uICovCisgICAgZm9yX2VhY2hfdmNw
dSAoIGQsIHYgKQorICAgICAgICBpZiAoIHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1KGN0eHQs
IHYpICkKKyAgICAgICAgICAgIHdoaWxlICggIXZjcHVfcnVubmFibGUodikgJiYgdi0+aXNfcnVu
bmluZyApCisgICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7CisKKyAgICAvKiBBbGwgb3RoZXIg
dmNwdXMgYXJlIHBhdXNlZCwgc2FmZSB0byB1bmxvY2sgbm93LiAqLworICAgIHNwaW5fdW5sb2Nr
KCZkLT5oeXBlcmNhbGxfZGVhZGxvY2tfbXV0ZXgpOworCisgICAgY3B1bWFza19jbGVhcihtYXNr
KTsKKworICAgIC8qIEZsdXNoIHBhZ2luZy1tb2RlIHNvZnQgc3RhdGUgKGUuZy4sIHZhLT5nZm4g
Y2FjaGU7IFBBRSBQRFBFIGNhY2hlKS4gKi8KKyAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCisg
ICAgeworICAgICAgICB1bnNpZ25lZCBpbnQgY3B1OworCisgICAgICAgIGlmICggIWZsdXNoX3Zj
cHUoY3R4dCwgdikgKQorICAgICAgICAgICAgY29udGludWU7CisKKyAgICAgICAgcGFnaW5nX3Vw
ZGF0ZV9jcjModiwgZmFsc2UpOworCisgICAgICAgIGNwdSA9IHJlYWRfYXRvbWljKCZ2LT5kaXJ0
eV9jcHUpOworICAgICAgICBpZiAoIGlzX3ZjcHVfZGlydHlfY3B1KGNwdSkgKQorICAgICAgICAg
ICAgX19jcHVtYXNrX3NldF9jcHUoY3B1LCBtYXNrKTsKKyAgICB9CisKKyAgICAvKiBGbHVzaCBU
TEJzIG9uIGFsbCBDUFVzIHdpdGggZGlydHkgdmNwdSBzdGF0ZS4gKi8KKyAgICBmbHVzaF90bGJf
bWFzayhtYXNrKTsKKworICAgIC8qIERvbmUuICovCisgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYg
KQorICAgICAgICBpZiAoIHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1KGN0eHQsIHYpICkKKyAg
ICAgICAgICAgIHZjcHVfdW5wYXVzZSh2KTsKKworICAgIHJldHVybiB0cnVlOworfQorCiAvKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKiovCiAvKiBTaGFkb3ctY29udHJvbCBYRU5fRE9NQ1RMIGRpc3BhdGNoZXIg
Ki8KIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXAuaCBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvaGFwLmgKaW5kZXggYjk0YmZiNGVkMC4uMGM2YWEyNmI5YiAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXAuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2hhcC5o
CkBAIC00Niw2ICs0Niw5IEBAIGludCAgIGhhcF90cmFja19kaXJ0eV92cmFtKHN0cnVjdCBkb21h
aW4gKmQsCiBleHRlcm4gY29uc3Qgc3RydWN0IHBhZ2luZ19tb2RlICpoYXBfcGFnaW5nX2dldF9t
b2RlKHN0cnVjdCB2Y3B1ICopOwogaW50IGhhcF9zZXRfYWxsb2NhdGlvbihzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBpbnQgcGFnZXMsIGJvb2wgKnByZWVtcHRlZCk7CiAKK2Jvb2wgaGFwX2Zs
dXNoX3RsYihib29sICgqZmx1c2hfdmNwdSkodm9pZCAqY3R4dCwgc3RydWN0IHZjcHUgKnYpLAor
ICAgICAgICAgICAgICAgICAgIHZvaWQgKmN0eHQpOworCiAjZW5kaWYgLyogWEVOX0hBUF9IICov
CiAKIC8qCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3NoYWRvdy5oIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9zaGFkb3cuaAppbmRleCA5MDdjNzFmNDk3Li5jZmQ0NjUwYTE2IDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3NoYWRvdy5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvc2hhZG93LmgKQEAgLTk1LDYgKzk1LDEwIEBAIHZvaWQgc2hhZG93X2Jsb3dfdGFibGVz
X3Blcl9kb21haW4oc3RydWN0IGRvbWFpbiAqZCk7CiBpbnQgc2hhZG93X3NldF9hbGxvY2F0aW9u
KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBwYWdlcywKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYm9vbCAqcHJlZW1wdGVkKTsKIAorLyogRmx1c2ggdGhlIFRMQiBvZiB0aGUgc2Vs
ZWN0ZWQgdkNQVXMuICovCitib29sIHNoYWRvd19mbHVzaF90bGIoYm9vbCAoKmZsdXNoX3ZjcHUp
KHZvaWQgKmN0eHQsIHN0cnVjdCB2Y3B1ICp2KSwKKyAgICAgICAgICAgICAgICAgICAgICB2b2lk
ICpjdHh0KTsKKwogI2Vsc2UgLyogIUNPTkZJR19TSEFET1dfUEFHSU5HICovCiAKICNkZWZpbmUg
c2hhZG93X3RlYXJkb3duKGQsIHApIEFTU0VSVChpc19wdl9kb21haW4oZCkpCkBAIC0xMDYsNiAr
MTEwLDE0IEBAIGludCBzaGFkb3dfc2V0X2FsbG9jYXRpb24oc3RydWN0IGRvbWFpbiAqZCwgdW5z
aWduZWQgaW50IHBhZ2VzLAogI2RlZmluZSBzaGFkb3dfc2V0X2FsbG9jYXRpb24oZCwgcGFnZXMs
IHByZWVtcHRlZCkgXAogICAgICh7IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyAtRU9QTk9UU1VQUDsg
fSkKIAorc3RhdGljIGlubGluZSBib29sIHNoYWRvd19mbHVzaF90bGIoYm9vbCAoKmZsdXNoX3Zj
cHUpKHZvaWQgKmN0eHQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHZjcHUgKnYpLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdm9pZCAqY3R4dCkKK3sKKyAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKKyAg
ICByZXR1cm4gZmFsc2U7Cit9CisKIHN0YXRpYyBpbmxpbmUgdm9pZCBzaF9yZW1vdmVfc2hhZG93
cyhzdHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBnbWZuLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGludCBmYXN0LCBpbnQgYWxsKSB7fQogCi0tIAoyLjI1LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
