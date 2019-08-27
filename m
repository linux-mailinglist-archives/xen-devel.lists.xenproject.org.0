Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E18A9E4BB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 11:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2Y3S-00028P-HA; Tue, 27 Aug 2019 09:46:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=deUM=WX=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i2Y3R-00028A-62
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 09:46:21 +0000
X-Inumbo-ID: 855ea5ea-c8af-11e9-8980-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 855ea5ea-c8af-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 09:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566899180;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dng0AhqVZPM38aMq8YY9YOZnoQQL1HnvtXQ2Kd6180c=;
 b=gr0NSABmVX/bAGkbxzJCUCuhj3ZgFJKiIaYJ8djoWzjoB/QbaaHDKcJM
 y1tO/sazP7nx2Vx0LzPvxchj5sWqe27OYuShFC0lDQEhleUY7nPAR3BHr
 6DTIcEibg8ObkbhdUrTRLTx7a51TmZ7AWcI2WwEjwucLkbFZDKJ5ykWYN U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: McgfIaNBEGvMEQKOrczUGnBIHvQMbhANJN/cSRIo9g0qxmP3Xav6hqucmE73nQjEDzMVKWRp0Y
 RScGypITPX78HDr6wL6vwgWWMOOppVb/a5iC0+W9cZVuCkcN6HEs1nYrdg52pwfK2HRCGpBjEO
 6o7n9T7V5ufV6OXo1CNzEXuGL9mG3KNeWNJe4Yw/JL03AVp0jIKZTqtv4pS0CaTuCnCQcPXT05
 MXGCG0OhDVWrU6pHpd1sdQtxVud9l845vyk7lusf+idVpZs3KWGlae/GotRmGVWNb0B31vRy4G
 dks=
X-SBRS: 2.7
X-MesageID: 4748662
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,436,1559534400"; 
   d="scan'208";a="4748662"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v2 2/2] xen-bus: Avoid rewriting identical values to
 xenstore
Thread-Index: AQHVWZu4AfJbcgj9V0CJghQKigFNTacOxSww
Date: Tue, 27 Aug 2019 09:46:15 +0000
Message-ID: <322ae907c2594237bdc7b63a24f63bab@AMSPEX02CL03.citrite.net>
References: <20190823101534.465-1-anthony.perard@citrix.com>
 <20190823101534.465-3-anthony.perard@citrix.com>
In-Reply-To: <20190823101534.465-3-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen-bus: Avoid rewriting identical
 values to xenstore
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDIzIEF1Z3VzdCAyMDE5IDExOjE2Cj4gVG86
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZwo+IENjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IFBhdWwKPiBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IFN1YmplY3Q6IFtQQVRDSCB2MiAyLzJdIHhlbi1idXM6IEF2
b2lkIHJld3JpdGluZyBpZGVudGljYWwgdmFsdWVzIHRvIHhlbnN0b3JlCj4gCj4gV2hlbiBRRU1V
IHJlY2VpdmVzIGEgeGVuc3RvcmUgd2F0Y2ggZXZlbnQgc3VnZ2VzdGluZyB0aGF0IHRoZSAic3Rh
dGUiCj4gb2YgdGhlIGZyb250ZW5kIGNoYW5nZWQsIGl0IHJlY29yZHMgdGhpcyBpbiBpdHMgb3du
IHN0YXRlIGJ1dCBpdCBhbHNvCj4gcmUtd3JpdGUgdGhlIHZhbHVlIGJhY2sgaW50byB4ZW5zdG9y
ZSBldmVuIHNvIHRoZXJlIHdlcmUgbm8gY2hhbmdlLgo+IFRoaXMgdHJpZ2dlcnMgYW4gdW5uZWNl
c3NhcnkgeGVuc3RvcmUgd2F0Y2ggZXZlbnQgd2hpY2ggUUVNVSB3aWxsCj4gcHJvY2VzcyBhZ2Fp
biAoYW5kIG1heWJlIHRoZSBmcm9udGVuZCBhcyB3ZWxsKS4gQWxzbyBRRU1VIGNvdWxkCj4gcG90
ZW50aWFsbHkgd3JpdGUgYW4gYWxyZWFkeSBvbGQgdmFsdWUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
UGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCj4gLS0tCj4gCj4gTm90ZXM6
Cj4gICAgIHYyOgo+ICAgICAtIGZpeCBjb2Rpbmcgc3R5bGUKPiAgICAgLSBvbmx5IGNoYW5nZSBm
cm9udGVuZF9zZXRfc3RhdGUoKSBhbmQgdXNlICdwdWJsaXNoJyBpbnN0ZWFkIG9mICdleHBvcnQn
Lgo+IAo+ICBody94ZW4veGVuLWJ1cy5jIHwgMTEgKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcv
eGVuL3hlbi1idXMuYyBiL2h3L3hlbi94ZW4tYnVzLmMKPiBpbmRleCA2MmMxMjdiOTI2Li5hMDQ0
NzhhZDRmIDEwMDY0NAo+IC0tLSBhL2h3L3hlbi94ZW4tYnVzLmMKPiArKysgYi9ody94ZW4veGVu
LWJ1cy5jCj4gQEAgLTY5OCw3ICs2OTgsOCBAQCBpbnQgeGVuX2RldmljZV9mcm9udGVuZF9zY2Fu
ZihYZW5EZXZpY2UgKnhlbmRldiwgY29uc3QgY2hhciAqa2V5LAo+ICB9Cj4gCj4gIHN0YXRpYyB2
b2lkIHhlbl9kZXZpY2VfZnJvbnRlbmRfc2V0X3N0YXRlKFhlbkRldmljZSAqeGVuZGV2LAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIHhlbmJ1c19zdGF0
ZSBzdGF0ZSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51
bSB4ZW5idXNfc3RhdGUgc3RhdGUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgcHVibGlzaCkKPiAgewo+ICAgICAgY29uc3QgY2hhciAqdHlwZSA9IG9i
amVjdF9nZXRfdHlwZW5hbWUoT0JKRUNUKHhlbmRldikpOwo+IAo+IEBAIC03MTAsNyArNzExLDkg
QEAgc3RhdGljIHZvaWQgeGVuX2RldmljZV9mcm9udGVuZF9zZXRfc3RhdGUoWGVuRGV2aWNlICp4
ZW5kZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhzX3N0cnN0YXRl
KHN0YXRlKSk7Cj4gCj4gICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlID0gc3RhdGU7Cj4gLSAg
ICB4ZW5fZGV2aWNlX2Zyb250ZW5kX3ByaW50Zih4ZW5kZXYsICJzdGF0ZSIsICIldSIsIHN0YXRl
KTsKPiArICAgIGlmIChwdWJsaXNoKSB7Cj4gKyAgICAgICAgeGVuX2RldmljZV9mcm9udGVuZF9w
cmludGYoeGVuZGV2LCAic3RhdGUiLCAiJXUiLCBzdGF0ZSk7Cj4gKyAgICB9Cj4gIH0KPiAKPiAg
c3RhdGljIHZvaWQgeGVuX2RldmljZV9mcm9udGVuZF9jaGFuZ2VkKHZvaWQgKm9wYXF1ZSkKPiBA
QCAtNzI2LDcgKzcyOSw3IEBAIHN0YXRpYyB2b2lkIHhlbl9kZXZpY2VfZnJvbnRlbmRfY2hhbmdl
ZCh2b2lkICpvcGFxdWUpCj4gICAgICAgICAgc3RhdGUgPSBYZW5idXNTdGF0ZVVua25vd247Cj4g
ICAgICB9Cj4gCj4gLSAgICB4ZW5fZGV2aWNlX2Zyb250ZW5kX3NldF9zdGF0ZSh4ZW5kZXYsIHN0
YXRlKTsKPiArICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRfc2V0X3N0YXRlKHhlbmRldiwgc3RhdGUs
IGZhbHNlKTsKPiAKPiAgICAgIGlmIChzdGF0ZSA9PSBYZW5idXNTdGF0ZUluaXRpYWxpc2luZyAm
Jgo+ICAgICAgICAgIHhlbmRldi0+YmFja2VuZF9zdGF0ZSA9PSBYZW5idXNTdGF0ZUNsb3NlZCAm
Jgo+IEBAIC0xMTY5LDcgKzExNzIsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX3JlYWxpemUo
RGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQo+ICAgICAgeGVuX2RldmljZV9mcm9udGVu
ZF9wcmludGYoeGVuZGV2LCAiYmFja2VuZC1pZCIsICIldSIsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB4ZW5idXMtPmJhY2tlbmRfaWQpOwo+IAo+IC0gICAgeGVuX2RldmljZV9m
cm9udGVuZF9zZXRfc3RhdGUoeGVuZGV2LCBYZW5idXNTdGF0ZUluaXRpYWxpc2luZyk7Cj4gKyAg
ICB4ZW5fZGV2aWNlX2Zyb250ZW5kX3NldF9zdGF0ZSh4ZW5kZXYsIFhlbmJ1c1N0YXRlSW5pdGlh
bGlzaW5nLCB0cnVlKTsKPiAKPiAgICAgIHhlbmRldi0+ZXhpdC5ub3RpZnkgPSB4ZW5fZGV2aWNl
X2V4aXQ7Cj4gICAgICBxZW11X2FkZF9leGl0X25vdGlmaWVyKCZ4ZW5kZXYtPmV4aXQpOwo+IC0t
Cj4gQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
