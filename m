Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8AAEEA6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 17:38:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7iBX-0004eg-NG; Tue, 10 Sep 2019 15:36:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cDs3=XF=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i7iBV-0004da-W0
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 15:36:02 +0000
X-Inumbo-ID: b11e009a-d3e0-11e9-b76c-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b11e009a-d3e0-11e9-b76c-bc764e2007e4;
 Tue, 10 Sep 2019 15:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568129761;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZVce6GXhewmrcA4NiHuKyUZcU3KCBgXX0N0pHwDxscM=;
 b=QCYAoHLS+2AqORiK57ezse9Xhpyu+B/gF7e5HsKzOBVZO7Se+s9KmSbQ
 cThjjd6ujP6C8gG8/41rOVVqo6fD54NwUUNR3dDN0khVyW1gYaqUEFWcv
 /uSG9QUVIFPcQ0XM8uVgTa5gt91mWeQcEX+VwaHCTzbW0wn7kepx/NWgB k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oT71IKuMvKtwEp61aNUw1Fb46lgmREor+2jy9ikQVeYhgXMbTG1BIM2F5w9mdCdut4bodbhbLa
 MataW6q37T+4tuUmXUn+F4+hLFaMV6QXWBOdaBt65k1Zyf+GhdpFALIPra1r1rB02rr1KO9WoQ
 27pcuj/2CwdZR1Z37K7VdGrkVr5uMAlCu0Fgh5ZBKB2BIdud58Ch8pUBacGyZ92d51gtaXBQCp
 Ogwc+AkpRkXOMRUFXttsI77+HKvNIPHz/SAHJXl1Srkoh6Dd41H5WxUmLaG/KcvjxzvmzcpMJn
 Jys=
X-SBRS: 2.7
X-MesageID: 5667401
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5667401"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 2/3] Add V section entry to allow identification of
 Xen MAINTAINERS file
Thread-Index: AQHVYxQkUkwFCgYV8keKmP932Ov98qck7kUAgAADtQCAABH7gA==
Date: Tue, 10 Sep 2019 15:35:57 +0000
Message-ID: <E95BE9F8-9D7C-414B-BB33-1124CD55330F@citrix.com>
References: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
 <c3c41841ac809b600241b41400f18e12971aad8f.1567596460.git-series.lars.kurth@citrix.com>
 <2db8eb91-9ac2-8db5-cf98-2f7ef60ac0da@arm.com>
 <9dc5a111-93e0-43fe-fa13-4b225fd5fe1d@arm.com>
In-Reply-To: <9dc5a111-93e0-43fe-fa13-4b225fd5fe1d@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <2A6E242E969F52498B06D2532776779F@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 2/3] Add V section entry to allow
 identification of Xen MAINTAINERS file
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiAxMC8wOS8yMDE5LCAxNjozMSwgIkp1bGllbiBHcmFsbCIgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPiB3cm90ZToNCg0KICAgIEhpLA0KICAgIA0KICAgIEFjdHVhbGx5LCBJIGhhdmUgb25lIHF1
ZXN0aW9uIGFib3V0IHRoZSB0ZW1wbGF0ZSAobXkgYWNrIHN0aWxsIHN0YW5kcykuDQogICAgDQog
ICAgT24gOS8xMC8xOSA0OjE4IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQogICAgPiBIaSBMYXJz
LA0KICAgID4gDQogICAgPiBPbiA5LzQvMTkgMTI6MzAgUE0sIExhcnMgS3VydGggd3JvdGU6DQog
ICAgPj4gVGhpcyBjaGFuZ2UgcHJvdmlkZXMgc3VmZmljaWVudCBpbmZvcm1hdGlvbiB0byBhbGxv
dyBnZXRfbWFpbnRhaW5lci5wbCAvDQogICAgPj4gYWRkX21haW50YWluZXJzLnBsIHNjcmlwdHMg
dG8gYmUgcnVuIG9uIHhlbiBzaXN0ZXIgcmVwb3NpdG9yaWVzIHN1Y2ggYXMNCiAgICA+PiBtaW5p
LW9zLmdpdCwgb3NzdGVzdC5naXQsIGV0Yw0KICAgID4+DQogICAgPj4gQSBzdWdnZXN0ZWQgdGVt
cGxhdGUgZm9yIHNpc3RlciByZXBvc2l0b3JpZXMgb2YgWGVuIGlzDQogICAgPj4NCiAgICA+PiA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
ICAgID4+IFRoaXMgZmlsZSBmb2xsb3dzIHRoZSBzYW1lIGNvbnZlbnRpb25zIGFzIG91dGxpbmVk
IGluDQogICAgPj4geGVuLmdpdDpNQUlOVEFJTkVSUy4gUGxlYXNlIHJlZmVyIHRvIHRoZSBmaWxl
IGluIHhlbi5naXQNCiAgICA+PiBmb3IgbW9yZSBpbmZvcm1hdGlvbi4NCiAgICA+Pg0KICAgID4+
IFRIRSBSRVNUDQogICAgPj4gTTogICAgICBNQUlOVEFJTkVSMSA8bWFpbnRhaW5lcjFAZW1haWwu
Y29tPg0KICAgID4+IE06ICAgICAgTUFJTlRBSU5FUjIgPG1haW50YWluZXIyQGVtYWlsLmNvbT4N
CiAgICA+PiBMOiAgICAgIHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KICAgIA0KICAg
IEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgdGhlIHNjcmlwdHMgd291bGQgYmUgdXNl
ZCBmb3IgVW5pa3JhZnQuIA0KICAgIElmIHNvLCBkbyB3ZSBleHBlY3QgdGhlbSB0byBDQyB4ZW4t
ZGV2ZWwgZXZlcnl0aW1lPw0KDQpJbiB0aGF0IGNhc2UsIHRoZSB0ZW1wbGF0ZSBoYXMgdG8gYmUg
YWRhcHRlZC4gSSB3YXMgbWFpbmx5IHRoaW5raW5nIG9mIA0KWFRGLCBPU1NURVNULCBsaXZlcGF0
Y2gtYnVpbGQtdG9vbHMuIElmIGl0IHdlcmUgdXNlZCBzYXkgZm9yIG1pbmlvcw0KKHdoaWNoIEkg
dGhpbmsgaXQgc2hvdWxkKSAgdGhlIEw6IGZpZWxkIHdvdWxkIG9idmlvdXNseSBuZWVkIGNoYW5n
aW5nDQogDQpPbmNlIHRoaXMgc2VyaWVzIGlzIHRocm91Z2gsIEkgd2lsbCBzdWJtaXQgbWFpbnRh
aW5lciBmaWxlcyBmb3IgYWxsIHRob3NlDQpwcm9qZWN0cyBtYWtpbmcgc3VyZSB0aGF0IHRoZXkg
aGF2ZSB0aGUgcmlnaHQgTDogZmllbGQuDQoNCiAgICBJZiB0aGUgYW5zd2VyIGlzIG5vLCB0aGVu
IHdlIHdpbGwgcHJvYmFibHkgd2FudCB0byBhZGRfbWFpbnRhaW5lcnMucGwuDQogICAgDQpJIGJh
c2ljYWxseSBkcm9wcGVkIHRoZSBvcmlnaW5hbCBwYXRjaCBmb3IgVW5pa3JhZnQgYXMgbm9ib2R5
IGhhcyByZXNwb25kZWQuDQpJIHdhcyBub3QgcGxhbm5pbmcgdG8gcGljayB0aGlzIHVwLCB1bmxl
c3Mgc29tZW9uZSBmcm9tIFVuaWtyYWZ0IHJ1bnMgd2l0aCBpdCANCg0KUmVnYXJkcw0KTGFycw0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
