Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6786B7902D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:01:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82g-0003Gg-Fv; Mon, 29 Jul 2019 15:58:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82e-0003EJ-0P
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:28 +0000
X-Inumbo-ID: b24b1e50-b219-11e9-a403-0f210b5ba57f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b24b1e50-b219-11e9-a403-0f210b5ba57f;
 Mon, 29 Jul 2019 15:58:25 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8dgea5gdejrI6ADeXTluuLwyLWHv9Z5NbBX5+nnMS58IZj9CgrxkOIblrc1+foGVv8BJNCnCVz
 /AhIRiVRvpZU5yN1TVh8EXr3P9Xh4KzwblVOkwVBngbWh8X0+l1OiwVPuKxmGe1QqHvXYJ2M1i
 1Cus8gtqcr3VkUcpySr/wZWGqdKwK5l99MKU0W97n5ZmNsz48rYtsmXweVUsQAIgk4HYFUIkVt
 btSqAKE1CsOt+juOWfv2CwQuyxl4LSwWk4Xvu1iPz9OEuz7qGyCJcJwJwf1OaAhkSZtR0J9Iwa
 JtU=
X-SBRS: 2.7
X-MesageID: 3671583
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3671583"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:25 +0100
Message-ID: <20190729153944.24239-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 16/35] OvmfPkg/XenHypercallLib: Enable it in
 PEIM
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsb3cgdG8gdXNlIFhlbiBoeXBlcmNhbGxzIGVhcmxpZXIsIGR1cmluZyB0aGUgUEVJTSBzdGFn
ZSwgYnV0Clhlbkh5cGVyY2FsbExpYkluaXQoKSBtdXN0IGJlIGNhbGxlZCBvbmNlIHRoZSBYZW5J
bmZvIEhPQiBpcyBjcmVhdGVkCndpdGggdGhlIEh5cGVyUGFnZSBzZXR1cC4KCkNoYW5nZSB0aGUg
cmV0dXJuIHZhbHVlIG9mIFhlbkh5cGVyY2FsbExpYkluaXQgc28gZmFpbHVyZSBjYW4gYmUKZGV0
ZWN0ZWQgd2hlbiB0aGUgY2FsbCBzaG91bGRuJ3QgZmFpbCwgYnV0IHN0aWxsIGhhdmUgdGhlIGNv
bnN0cnVjdG9yCmFsd2F5cyBzdWNjZWVkLgoKUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29y
ZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxl
cnNla0ByZWRoYXQuY29tPgotLS0KCk5vdGVzOgogICAgdjM6CiAgICAtIG9ubHkgbW9kaWZ5IFhl
bkh5cGVyY2FsbExpYiwgYW5kIHRvIHRoZSBtb2RpZmljYXRpb24gb2YgWGVuUGxhdGZvcm1QZWkK
ICAgICAgaW4gYSBzZXBhcmF0ZWQgcGF0Y2guCiAgICAtIEFsbG93IFhlbkh5cGVyY2FsbExpYklu
aXQgdG8gYmUgY2FsbGVkIG91dHNpZGUgdGhlIGxpYnJhcnkgaW5zdGVhZCBvZgogICAgICBjcmVh
dGluZyBhIG5ldyBmdW5jdGlvbiwgYnV0IGFsc28gcmV0dXJuIGZhaWx1cmUgb24gZmFpbHVyZSwK
ICAgICAgYW5kIGhhdmUgYSBuZXcgY29uc3RydWN0b3IgdGhhdCBuZXZlciBmYWlsLgoKIC4uLi9M
aWJyYXJ5L1hlbkh5cGVyY2FsbExpYi9YZW5IeXBlcmNhbGxMaWIuaW5mICB8ICA0ICsrLS0KIE92
bWZQa2cvSW5jbHVkZS9MaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi5oICAgICAgICB8IDEyICsrKysr
KysrKysrKwogLi4uL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliL1g4Nlhlbkh5cGVyY2FsbC5jICAg
IHwgIDggKy0tLS0tLS0KIE92bWZQa2cvTGlicmFyeS9YZW5IeXBlcmNhbGxMaWIvWGVuSHlwZXJj
YWxsLmMgICB8IDE2ICsrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvWGVu
SHlwZXJjYWxsTGliL1hlbkh5cGVyY2FsbExpYi5pbmYgYi9Pdm1mUGtnL0xpYnJhcnkvWGVuSHlw
ZXJjYWxsTGliL1hlbkh5cGVyY2FsbExpYi5pbmYKaW5kZXggMTIwOGYwMDU3YS4uMjFjZTViNDQz
NCAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi9YZW5IeXBlcmNh
bGxMaWIuaW5mCisrKyBiL092bWZQa2cvTGlicmFyeS9YZW5IeXBlcmNhbGxMaWIvWGVuSHlwZXJj
YWxsTGliLmluZgpAQCAtMTIsMTAgKzEyLDEwIEBAIFtEZWZpbmVzXQogICBGSUxFX0dVSUQgICAg
ICAgICAgICAgICAgICAgICAgPSBCNUVFOUEzMi1DQTVBLTQ5QTgtODJFMy1BREE0Q0NCNzdDN0MN
CiAgIE1PRFVMRV9UWVBFICAgICAgICAgICAgICAgICAgICA9IEJBU0UNCiAgIFZFUlNJT05fU1RS
SU5HICAgICAgICAgICAgICAgICA9IDEuMA0KLSAgQ09OU1RSVUNUT1IgICAgICAgICAgICAgICAg
ICAgID0gWGVuSHlwZXJjYWxsTGliSW5pdA0KKyAgQ09OU1RSVUNUT1IgICAgICAgICAgICAgICAg
ICAgID0gWGVuSHlwZXJjYWxsTGliQ29uc3RydWN0DQogDQogW0RlZmluZXMuSUEzMiwgRGVmaW5l
cy5YNjRdDQotICBMSUJSQVJZX0NMQVNTICAgICAgICAgICAgICAgICAgPSBYZW5IeXBlcmNhbGxM
aWJ8RFhFX0RSSVZFUiBVRUZJX0RSSVZFUg0KKyAgTElCUkFSWV9DTEFTUyAgICAgICAgICAgICAg
ICAgID0gWGVuSHlwZXJjYWxsTGlifFBFSU0gRFhFX0RSSVZFUiBVRUZJX0RSSVZFUg0KIA0KIFtE
ZWZpbmVzLkFSTSwgRGVmaW5lcy5BQVJDSDY0XQ0KICAgTElCUkFSWV9DTEFTUyAgICAgICAgICAg
ICAgICAgID0gWGVuSHlwZXJjYWxsTGliDQpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9JbmNsdWRlL0xp
YnJhcnkvWGVuSHlwZXJjYWxsTGliLmggYi9Pdm1mUGtnL0luY2x1ZGUvTGlicmFyeS9YZW5IeXBl
cmNhbGxMaWIuaAppbmRleCBjNDM4MjI3ODJiLi5jMTQ5MWRkNjUyIDEwMDY0NAotLS0gYS9Pdm1m
UGtnL0luY2x1ZGUvTGlicmFyeS9YZW5IeXBlcmNhbGxMaWIuaAorKysgYi9Pdm1mUGtnL0luY2x1
ZGUvTGlicmFyeS9YZW5IeXBlcmNhbGxMaWIuaApAQCAtMTAsNiArMTAsMTggQEAKICNpZm5kZWYg
X19YRU5fSFlQRVJDQUxMX0xJQl9IX18NCiAjZGVmaW5lIF9fWEVOX0hZUEVSQ0FMTF9MSUJfSF9f
DQogDQorLyoqDQorICBUbyBjYWxsIHdoZW4gdGhlIGdFZmlYZW5JbmZvR3VpZCBIT0IgYmVjYW1l
IGF2YWlsYWJsZSBhZnRlciB0aGUgbGlicmFyeSBpbml0DQorICBmdW5jdGlvbiBoYXMgYWxyZWFk
eSBiZWVuIGV4ZWN1dGVkLg0KKw0KKyAgVGhpcyBhbGxvdyB0byBtYWtlIGh5cGVyY2FsbCBpbiB0
aGUgUEVJTSBzdGFnZS4NCisqKi8NCitSRVRVUk5fU1RBVFVTDQorRUZJQVBJDQorWGVuSHlwZXJj
YWxsTGliSW5pdCAoDQorICBWT0lEDQorICApOw0KKw0KIC8qKg0KICAgQ2hlY2sgaWYgdGhlIFhl
biBIeXBlcmNhbGwgbGlicmFyeSBpcyBhYmxlIHRvIG1ha2UgY2FsbHMgdG8gdGhlIFhlbg0KICAg
aHlwZXJ2aXNvci4NCmRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGli
L1g4Nlhlbkh5cGVyY2FsbC5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi9YODZY
ZW5IeXBlcmNhbGwuYwppbmRleCAyNzA4M2Y5MjRmLi5mNzc5ZTQ2NDcwIDEwMDY0NAotLS0gYS9P
dm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliL1g4Nlhlbkh5cGVyY2FsbC5jCisrKyBiL092
bWZQa2cvTGlicmFyeS9YZW5IeXBlcmNhbGxMaWIvWDg2WGVuSHlwZXJjYWxsLmMKQEAgLTU5LDEz
ICs1OSw3IEBAIFhlbkh5cGVyY2FsbExpYkluaXQgKAogDQogICBHdWlkSG9iID0gR2V0Rmlyc3RH
dWlkSG9iICgmZ0VmaVhlbkluZm9HdWlkKTsNCiAgIGlmIChHdWlkSG9iID09IE5VTEwpIHsNCi0g
ICAgLy8NCi0gICAgLy8gV2UgZG9uJ3QgZmFpbCBsaWJyYXJ5IGNvbnN0cnVjdGlvbiwgc2luY2Ug
dGhhdCBoYXMgY2F0YXN0cm9waGljDQotICAgIC8vIGNvbnNlcXVlbmNlcyBmb3IgY2xpZW50IG1v
ZHVsZXMgKHdoZXJlYXMgdGhvc2UgbW9kdWxlcyBtYXkgZWFzaWx5IGJlDQotICAgIC8vIHJ1bm5p
bmcgb24gYSBub24tWGVuIHBsYXRmb3JtKS4gSW5zdGVhZCwgWGVuSHlwZXJjYWxsSXNBdmFpbGFi
bGUoKSBhYm92ZQ0KLSAgICAvLyB3aWxsIHJldHVybiBGQUxTRS4NCi0gICAgLy8NCi0gICAgcmV0
dXJuIFJFVFVSTl9TVUNDRVNTOw0KKyAgICByZXR1cm4gUkVUVVJOX05PVF9GT1VORDsNCiAgIH0N
CiAgIFhlbkluZm8gPSAoRUZJX1hFTl9JTkZPICopIEdFVF9HVUlEX0hPQl9EQVRBIChHdWlkSG9i
KTsNCiAgIEh5cGVyUGFnZSA9IFhlbkluZm8tPkh5cGVyUGFnZXM7DQpkaWZmIC0tZ2l0IGEvT3Zt
ZlBrZy9MaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi9YZW5IeXBlcmNhbGwuYyBiL092bWZQa2cvTGli
cmFyeS9YZW5IeXBlcmNhbGxMaWIvWGVuSHlwZXJjYWxsLmMKaW5kZXggYTJjNDFhMmE2OS4uZDRm
YTgwMjc0MyAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi9YZW5I
eXBlcmNhbGwuYworKysgYi9Pdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliL1hlbkh5cGVy
Y2FsbC5jCkBAIC0xNSw2ICsxNSwyMiBAQAogI2luY2x1ZGUgPExpYnJhcnkvRGVidWdMaWIuaD4N
CiAjaW5jbHVkZSA8TGlicmFyeS9YZW5IeXBlcmNhbGxMaWIuaD4NCiANCitSRVRVUk5fU1RBVFVT
DQorRUZJQVBJDQorWGVuSHlwZXJjYWxsTGliQ29uc3RydWN0ICgNCisgIFZPSUQNCisgICkNCit7
DQorICBYZW5IeXBlcmNhbGxMaWJJbml0ICgpOw0KKyAgLy8NCisgIC8vIFdlIGRvbid0IGZhaWwg
bGlicmFyeSBjb25zdHJ1Y3Rpb24sIHNpbmNlIHRoYXQgaGFzIGNhdGFzdHJvcGhpYw0KKyAgLy8g
Y29uc2VxdWVuY2VzIGZvciBjbGllbnQgbW9kdWxlcyAod2hlcmVhcyB0aG9zZSBtb2R1bGVzIG1h
eSBlYXNpbHkgYmUNCisgIC8vIHJ1bm5pbmcgb24gYSBub24tWGVuIHBsYXRmb3JtKS4gSW5zdGVh
ZCwgWGVuSHlwZXJjYWxsSXNBdmFpbGFibGUoKQ0KKyAgLy8gd2lsbCByZXR1cm4gRkFMU0UuDQor
ICAvLw0KKyAgcmV0dXJuIFJFVFVSTl9TVUNDRVNTOw0KK30NCisNCiBVSU5UNjQNCiBFRklBUEkN
CiBYZW5IeXBlcmNhbGxIdm1HZXRQYXJhbSAoDQotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
