Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31A032FA2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:29:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXm42-0002pO-Mk; Mon, 03 Jun 2019 12:27:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9f30=UC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hXm41-0002p0-P7
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:27:45 +0000
X-Inumbo-ID: fb22be3a-85fa-11e9-ba71-1f5b6f9313ca
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb22be3a-85fa-11e9-ba71-1f5b6f9313ca;
 Mon, 03 Jun 2019 12:27:41 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: DweiCrYQeE4cT185dbySV23iWYvyc3jibeFufp59nS06RT/tV4GtkyzaJ+M4WcNdFnKlKBe2fM
 D+ggoHYh/8Mdp6pqpKVs9Uc9brn+QwVcrkBITcHJLSXv9iQcdrcQC3VS2JBymRdfCDF/GMTDtp
 JkViCywafm0bmN0Jz6hJBqTTb5SFLzB3YZoynwSKbYTHZimvtdK3RYHkok2fv3IL7uQLjsXN1a
 Vpy2nUw05VUJxaHQJeGSFup5+uW3VTF86rkQ0Q2Ij7w1GsecYNhzeeI3om9Mwd78XoyVGaHdxU
 n5g=
X-SBRS: 2.7
X-MesageID: 1239386
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,546,1549947600"; 
   d="scan'208";a="1239386"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 3 Jun 2019 13:25:28 +0100
Message-ID: <1559564728-17167-6-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/5] xen/vm-event: Misc fixups
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ICogRHJvcCByZWR1bmRhbnQgYnJhY2tlcywgYW5kIGlubGluZSBxdWFsaWZpZXJzLgogKiBJbnNl
cnQgbmV3bGluZXMgYW5kIHNwYWNlcyB3aGVyZSBhcHByb3ByaWF0ZS4KICogRHJvcCByZWR1bmRh
bnQgTkRFQlVHIC0gZ2RwcmludCgpIGlzIGFscmVhZHkgY29uZGl0aW9uYWwuICBGaXggdGhlCiAg
IGxvZ2dpbmcgbGV2ZWwsIGFzIGdkcHJpbnRrKCkgYWxyZWFkeSBwcmVmaXhlcyB0aGUgZ3Vlc3Qg
bWFya2VyLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IFJhenZhbiBDb2pvY2FydSA8
cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KQ0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4KQ0M6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5j
b20+Ci0tLQogeGVuL2NvbW1vbi92bV9ldmVudC5jIHwgMjEgKysrKysrKysrKysrLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3ZtX2V2ZW50LmMgYi94ZW4vY29tbW9uL3ZtX2V2ZW50LmMKaW5k
ZXggNzJmNDJiNC4uZTg3MjY4MCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi92bV9ldmVudC5jCisr
KyBiL3hlbi9jb21tb24vdm1fZXZlbnQuYwpAQCAtMTAyLDYgKzEwMiw3IEBAIHN0YXRpYyBpbnQg
dm1fZXZlbnRfZW5hYmxlKAogc3RhdGljIHVuc2lnbmVkIGludCB2bV9ldmVudF9yaW5nX2F2YWls
YWJsZShzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQpCiB7CiAgICAgaW50IGF2YWlsX3JlcSA9
IFJJTkdfRlJFRV9SRVFVRVNUUygmdmVkLT5mcm9udF9yaW5nKTsKKwogICAgIGF2YWlsX3JlcSAt
PSB2ZWQtPnRhcmdldF9wcm9kdWNlcnM7CiAgICAgYXZhaWxfcmVxIC09IHZlZC0+Zm9yZWlnbl9w
cm9kdWNlcnM7CiAKQEAgLTE2OCw3ICsxNjksNyBAQCBzdGF0aWMgdm9pZCB2bV9ldmVudF93YWtl
X3F1ZXVlZChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQpCiAg
Ki8KIHZvaWQgdm1fZXZlbnRfd2FrZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qgdm1fZXZlbnRf
ZG9tYWluICp2ZWQpCiB7Ci0gICAgaWYgKCFsaXN0X2VtcHR5KCZ2ZWQtPndxLmxpc3QpKQorICAg
IGlmICggIWxpc3RfZW1wdHkoJnZlZC0+d3EubGlzdCkgKQogICAgICAgICB2bV9ldmVudF93YWtl
X3F1ZXVlZChkLCB2ZWQpOwogICAgIGVsc2UKICAgICAgICAgdm1fZXZlbnRfd2FrZV9ibG9ja2Vk
KGQsIHZlZCk7CkBAIC0yMTYsOCArMjE3LDggQEAgc3RhdGljIGludCB2bV9ldmVudF9kaXNhYmxl
KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2bV9ldmVudF9kb21haW4gKipwX3ZlZCkKICAgICBy
ZXR1cm4gMDsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIHZtX2V2ZW50X3JlbGVhc2Vfc2xvdChz
dHJ1Y3QgZG9tYWluICpkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQpCitzdGF0aWMgdm9pZCB2bV9ldmVudF9yZWxl
YXNlX3Nsb3Qoc3RydWN0IGRvbWFpbiAqZCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQpCiB7CiAgICAgLyogVXBkYXRlIHRoZSBh
Y2NvdW50aW5nICovCiAgICAgaWYgKCBjdXJyZW50LT5kb21haW4gPT0gZCApCkBAIC0yNTgsMTcg
KzI1OSwxNiBAQCB2b2lkIHZtX2V2ZW50X3B1dF9yZXF1ZXN0KHN0cnVjdCBkb21haW4gKmQsCiAg
ICAgUklOR19JRFggcmVxX3Byb2Q7CiAgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Owog
Ci0gICAgaWYoICF2bV9ldmVudF9jaGVja19yaW5nKHZlZCkpCisgICAgaWYoICF2bV9ldmVudF9j
aGVja19yaW5nKHZlZCkgKQogICAgICAgICByZXR1cm47CiAKICAgICBpZiAoIGN1cnItPmRvbWFp
biAhPSBkICkKICAgICB7CiAgICAgICAgIHJlcS0+ZmxhZ3MgfD0gVk1fRVZFTlRfRkxBR19GT1JF
SUdOOwotI2lmbmRlZiBOREVCVUcKKwogICAgICAgICBpZiAoICEocmVxLT5mbGFncyAmIFZNX0VW
RU5UX0ZMQUdfVkNQVV9QQVVTRUQpICkKLSAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19HX1dB
Uk5JTkcsICJkJWR2JWQgd2FzIG5vdCBwYXVzZWQuXG4iLAorICAgICAgICAgICAgZ2RwcmludGso
WEVOTE9HX1dBUk5JTkcsICJkJWR2JWQgd2FzIG5vdCBwYXVzZWQuXG4iLAogICAgICAgICAgICAg
ICAgICAgICAgZC0+ZG9tYWluX2lkLCByZXEtPnZjcHVfaWQpOwotI2VuZGlmCiAgICAgfQogCiAg
ICAgcmVxLT52ZXJzaW9uID0gVk1fRVZFTlRfSU5URVJGQUNFX1ZFUlNJT047CkBAIC00NzQsNiAr
NDc0LDcgQEAgc3RhdGljIGludCB2bV9ldmVudF9ncmFiX3Nsb3Qoc3RydWN0IHZtX2V2ZW50X2Rv
bWFpbiAqdmVkLCBpbnQgZm9yZWlnbikKIHN0YXRpYyBpbnQgdm1fZXZlbnRfd2FpdF90cnlfZ3Jh
YihzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQsIGludCAqcmMpCiB7CiAgICAgKnJjID0gdm1f
ZXZlbnRfZ3JhYl9zbG90KHZlZCwgMCk7CisKICAgICByZXR1cm4gKnJjOwogfQogCkBAIC00ODEs
MTMgKzQ4MiwxNSBAQCBzdGF0aWMgaW50IHZtX2V2ZW50X3dhaXRfdHJ5X2dyYWIoc3RydWN0IHZt
X2V2ZW50X2RvbWFpbiAqdmVkLCBpbnQgKnJjKQogc3RhdGljIGludCB2bV9ldmVudF93YWl0X3Ns
b3Qoc3RydWN0IHZtX2V2ZW50X2RvbWFpbiAqdmVkKQogewogICAgIGludCByYyA9IC1FQlVTWTsK
KwogICAgIHdhaXRfZXZlbnQodmVkLT53cSwgdm1fZXZlbnRfd2FpdF90cnlfZ3JhYih2ZWQsICZy
YykgIT0gLUVCVVNZKTsKKwogICAgIHJldHVybiByYzsKIH0KIAogYm9vbCB2bV9ldmVudF9jaGVj
a19yaW5nKHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZlZCkKIHsKLSAgICByZXR1cm4gKHZlZCAm
JiB2ZWQtPnJpbmdfcGFnZSk7CisgICAgcmV0dXJuIHZlZCAmJiB2ZWQtPnJpbmdfcGFnZTsKIH0K
IAogLyoKQEAgLTUxMSw3ICs1MTQsNyBAQCBpbnQgX192bV9ldmVudF9jbGFpbV9zbG90KHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZlZCwKICAgICBpZiAoIChjdXJy
ZW50LT5kb21haW4gPT0gZCkgJiYgYWxsb3dfc2xlZXAgKQogICAgICAgICByZXR1cm4gdm1fZXZl
bnRfd2FpdF9zbG90KHZlZCk7CiAgICAgZWxzZQotICAgICAgICByZXR1cm4gdm1fZXZlbnRfZ3Jh
Yl9zbG90KHZlZCwgKGN1cnJlbnQtPmRvbWFpbiAhPSBkKSk7CisgICAgICAgIHJldHVybiB2bV9l
dmVudF9ncmFiX3Nsb3QodmVkLCBjdXJyZW50LT5kb21haW4gIT0gZCk7CiB9CiAKICNpZmRlZiBD
T05GSUdfSEFTX01FTV9QQUdJTkcKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
