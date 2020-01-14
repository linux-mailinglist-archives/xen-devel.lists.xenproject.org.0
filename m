Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593EC13A4FA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 11:07:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irJ4B-0001JM-Bz; Tue, 14 Jan 2020 10:04:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5ZHO=3D=amazon.co.uk=prvs=275b1edda=pdurrant@srs-us1.protection.inumbo.net>)
 id 1irJ49-0001JD-Af
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 10:04:53 +0000
X-Inumbo-ID: 4ea298c6-36b5-11ea-835f-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ea298c6-36b5-11ea-835f-12813bfff9fa;
 Tue, 14 Jan 2020 10:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1578996293; x=1610532293;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OJcE96Uq0q63OE1Qpp5SQqKPgJtbnrcvYNbVGPsevJo=;
 b=tOuziFkqL36qebM1SAaRKvcExmmS4pwwkCJcOrEXDMO8+Yy9Ct/oU+VO
 +tKye2QfAcaEfNmZ+ZG69tB3D8U6bXQh9+yZXRMRw+w7jWIL5xN0lxELi
 chltmuKVsVBFD3SKvmS8jgCCoK86k7/OPwuethQPR3FcHlwK9pIs/2Lqc Y=;
IronPort-SDR: KEfwJMrcM8hyncYMoYi3ZYjyP1VBxSZXt3a7WZvYtHtJ0VEmG1hDhUbKvs1AYq68rH1ztqVoXz
 FWVoAR72Jwkw==
X-IronPort-AV: E=Sophos;i="5.69,432,1571702400"; d="scan'208";a="18583684"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 14 Jan 2020 10:04:41 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3BC49A202B; Tue, 14 Jan 2020 10:04:41 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 Jan 2020 10:04:18 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 Jan 2020 10:04:17 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 14 Jan 2020 10:04:16 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, "jandryuk@gmail.com" <jandryuk@gmail.com>
Thread-Topic: [Xen-devel] [PATCH v2 4/6] libxl: allow creation of domains with
 a specified or random domid
Thread-Index: AQHVxuK4l/uYkINmxEmsaDd03sDBHafoy8EAgAAJl7CAAExbgIAA1ASQ
Date: Tue, 14 Jan 2020 10:04:16 +0000
Message-ID: <0f66b7ef6e6344bbb65b17c588b6a15d@EX13D32EUC003.ant.amazon.com>
References: <20200109114816.2293-1-pdurrant@amazon.com>
 <20200109114816.2293-5-pdurrant@amazon.com>
 <CAKf6xptYj+qwpjHLFidnGidphmOZtyu56menMd0ScfLh-X064A@mail.gmail.com>
 <6696d0425bbb4b50a064221b37bdcfaf@EX13D32EUC003.ant.amazon.com>
 <01d32c81-9977-980a-f6c9-75a8cbbd370c@xen.org>
In-Reply-To: <01d32c81-9977-980a-f6c9-75a8cbbd370c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.165]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 4/6] libxl: allow creation of domains
 with a specified or random domid
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiAxMyBKYW51YXJ5IDIwMjAgMjI6MjQNCj4gVG86IER1cnJhbnQs
IFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IGphbmRyeXVrQGdtYWlsLmNvbQ0KPiBDYzog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWwgPHhl
bi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT47IFdlaQ0KPiBMaXUgPHdsQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJl
OiBbWGVuLWRldmVsXSBbUEFUQ0ggdjIgNC82XSBsaWJ4bDogYWxsb3cgY3JlYXRpb24gb2YgZG9t
YWlucw0KPiB3aXRoIGEgc3BlY2lmaWVkIG9yIHJhbmRvbSBkb21pZA0KPiANCj4gSGkgUGF1bCwN
Cj4gDQo+IE9uIDEzLzAxLzIwMjAgMTY6NTQsIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+ID4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IGphbmRyeXVrQGdtYWlsLmNvbSA8
amFuZHJ5dWtAZ21haWwuY29tPg0KPiA+PiBTZW50OiAxMyBKYW51YXJ5IDIwMjAgMTY6MTYNCj4g
Pj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gPj4gQ2M6IHhl
bi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgQW50aG9ueSBQRVJBUkQN
Cj4gPj4gPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT47DQo+IFdlaQ0KPiA+PiBMaXUgPHdsQHhlbi5vcmc+DQo+ID4+IFN1
YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjIgNC82XSBsaWJ4bDogYWxsb3cgY3JlYXRp
b24gb2YNCj4gZG9tYWlucw0KPiA+PiB3aXRoIGEgc3BlY2lmaWVkIG9yIHJhbmRvbSBkb21pZA0K
PiA+Pg0KPiA+PiBPbiBUaHUsIEphbiA5LCAyMDIwIGF0IDY6NTAgQU0gUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPg0KPiB3cm90ZToNCj4gPj4+DQo+ID4+PiBUaGlzIHBhdGNoIGFk
ZHMgYSAnZG9taWQnIGZpZWxkIHRvIGxpYnhsX2RvbWFpbl9jcmVhdGVfaW5mbyBhbmQgdGhlbg0K
PiA+Pj4gbW9kaWZpZXMgZG9fZG9tYWluX2NyZWF0ZSgpIHRvIHVzZSB0aGF0IHZhbHVlIGlmIGl0
IGlzIHZhbGlkLiBBbnkNCj4gdmFsaWQNCj4gPj4+IGRvbWlkIHdpbGwgYmUgY2hlY2tlZCBhZ2Fp
bnN0IHRoZSByZXRpcmVkIGRvbWlkIGxpc3QgYmVmb3JlIGJlaW5nDQo+IHBhc3NlZA0KPiA+Pj4g
dG8gbGlieGxfX2RvbWFpbl9tYWtlKCkuDQo+ID4+PiBJZiB0aGUgZG9taWQgdmFsdWUgaXMgaW52
YWxpZCB0aGVuIFhlbiB3aWxsIGNob29zZSB0aGUgZG9taWQsIGFzDQo+IGJlZm9yZSwNCj4gPj4+
IHVubGVzcyB0aGUgdmFsdWUgaXMgdGhlIG5ldyBzcGVjaWFsIFJBTkRPTV9ET01JRCB2YWx1ZSBh
ZGRlZCB0byB0aGUNCj4gQVBJLg0KPiA+Pj4gVGhpcyB2YWx1ZSBpbnN0cnVjdHMgbGlieGxfX2Rv
bWFpbl9tYWtlKCkgdG8gc2VsZWN0IGEgcmFuZG9tIGRvbWlkDQo+ID4+IHZhbHVlLA0KPiA+Pj4g
Y2hlY2sgaXQgZm9yIHZhbGlkaXR5LCB2ZXJpZnkgaXQgZG9lcyBub3QgbWF0Y2ggYSByZXRpcmVk
IGRvbWFpbiwgYW5kDQo+ID4+IHRoZW4NCj4gPj4+IHBhc3MgaXQgdG8gWGVuJ3MgWEVOX0RPTUNU
TF9jcmVhdGVkb21haW4gb3BlcmF0aW9uLiBJZiBYZW4gZGV0ZXJtaW5lcw0KPiA+PiB0aGF0DQo+
ID4+PiBpdCBjby1pbmNpZGVzIHdpdGggYW4gZXhpc3RpbmcgZG9tYWluLCBhIG5ldyByYW5kb20g
dmFsdWUgd2lsbCBiZQ0KPiA+Pj4gc2VsZWN0ZWQgYW5kIHRoZSBvcGVyYXRpb24gd2lsbCBiZSBy
ZS10cmllZC4NCj4gPj4+DQo+ID4+PiBOT1RFOiBsaWJ4bF9fbG9ndigpIGlzIGFsc28gbW9kaWZp
ZWQgdG8gb25seSBsb2cgdmFsaWQgZG9taWQgdmFsdWVzIGluDQo+ID4+PiAgICAgICAgbWVzc2Fn
ZXMgcmF0aGVyIHRoYW4gYW55IGRvbWlkLCB2YWxpZCBvciBvdGhlcndpc2UsIHRoYXQgaXMgbm90
DQo+ID4+PiAgICAgICAgSU5WQUxJRF9ET01JRC4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4+PiAtLS0NCj4gPj4+IENj
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4NCj4gPj4+IENjOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPg0KPiA+Pj4gQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPg0KPiA+Pj4NCj4gPj4+IHYyOg0KPiA+Pj4gICAtIFJlLXdvcmtlZCB0byB1
c2UgYSB2YWx1ZSBmcm9tIGxpYnhsX2RvbWFpbl9jcmVhdGVfaW5mbw0KPiA+Pj4gLS0tDQo+ID4+
PiAgIHRvb2xzL2xpYnhsL2xpYnhsLmggICAgICAgICAgfCAgOSArKysrKysrKysNCj4gPj4+ICAg
dG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgICB8IDMyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystDQo+ID4+PiAgIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMgfCAgMiArLQ0K
PiA+Pj4gICB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgIHwgIDEgKw0KPiA+Pj4gICA0IGZp
bGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+Pg0KPiA+
Pg0KPiA+PiA8c25pcD4NCj4gPj4NCj4gPj4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4
bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jDQo+ID4+PiBpbmRleCAxODM1
YTU1MDJjLi5lZTc2ZGVlMzY0IDEwMDY0NA0KPiA+Pj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxf
Y3JlYXRlLmMNCj4gPj4+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jDQo+ID4+PiBA
QCAtNjAwLDkgKzYwMCwzOSBAQCBpbnQgbGlieGxfX2RvbWFpbl9tYWtlKGxpYnhsX19nYyAqZ2Ms
DQo+ID4+IGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmlnLA0KPiA+Pj4gICAgICAgICAgICAg
ICBnb3RvIG91dDsNCj4gPj4+ICAgICAgICAgICB9DQo+ID4+Pg0KPiA+Pj4gLSAgICAgICAgcmV0
ID0geGNfZG9tYWluX2NyZWF0ZShjdHgtPnhjaCwgZG9taWQsICZjcmVhdGUpOw0KPiA+Pj4gKyAg
ICAgICAgaWYgKGxpYnhsX2RvbWlkX3ZhbGlkX2d1ZXN0KGluZm8tPmRvbWlkKSkgew0KPiA+Pj4g
KyAgICAgICAgICAgICpkb21pZCA9IGluZm8tPmRvbWlkOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAg
ICAgICAgIGlmIChsaWJ4bF9faXNfcmV0aXJlZF9kb21pZChnYywgKmRvbWlkKSkgew0KPiA+Pj4g
KyAgICAgICAgICAgICAgICBMT0dFRChFUlJPUiwgKmRvbWlkLCAiZG9tYWluIGlkIGlzIHJldGly
ZWQiKTsNCj4gPj4+ICsgICAgICAgICAgICAgICAgcmMgPSBFUlJPUl9GQUlMOw0KPiA+Pj4gKyAg
ICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gPj4+ICsgICAgICAgICAgICB9DQo+ID4+PiArICAg
ICAgICB9IGVsc2UgaWYgKGluZm8tPmRvbWlkID09IFJBTkRPTV9ET01JRCkgew0KPiA+Pj4gKyAg
ICAgICAgICAgICpkb21pZCA9IDA7IC8qIFplcm8tb3V0IGluaXRpYWwgdmFsdWUgKi8NCj4gPj4+
ICsgICAgICAgIH0NCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgIGZvciAoOzspIHsNCj4gPj4+ICsg
ICAgICAgICAgICBpZiAoaW5mby0+ZG9taWQgPT0gUkFORE9NX0RPTUlEKSB7DQo+ID4+PiArICAg
ICAgICAgICAgICAgIC8qIFJhbmRvbWl6ZSBsb3dlciBvcmRlciBieXRlcyAqLw0KPiA+Pj4gKyAg
ICAgICAgICAgICAgICByZXQgPSBsaWJ4bF9fcmFuZG9tX2J5dGVzKGdjLCAodm9pZCAqKWRvbWlk
LA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVv
Zih1aW50MTZfdCkpOw0KPiA+Pg0KPiA+PiBDYXN0aW5nIHRvIHZvaWQgKiBhc3N1bWVzIGxpdHRs
ZSBlbmRpYW4uDQo+ID4NCj4gPiBJIHRoaW5rIHRoYXQncyBhIGZhaXJseSBzYWZlIGFzc3VtcHRp
b24gYXMgZmFyIGFzIFhlbiBnb2VzLi4uDQo+IA0KPiBOb3QgcmVhbGx5LCB0aGVyZSBhcmUgdGVj
aG5pY2FsbHkgbm90aGluZyAob3RoZXIgdGhhbiBidWcgZml4ZXMpDQo+IHByZXZlbnRpbmcgdXMg
dG8gdXNlIGEgYmlnIGVuZGlhbiBndWVzdCBvbiBYZW4gb24gQXJtLg0KPg0KDQpPay4NCiANCj4g
SSBhY3R1YWxseSBkaWQgcGxheSB3aXRoIGJpZyBlbmRpYW4gb24gWGVuIGluIHRoZSBwYXN0IGFu
ZCBtYW5hZ2VkIHRvDQo+IGdldCBhIGd1ZXN0IHJ1bm5pbmcuIFRoZSBtYWluIGFubm95aW5nIHBh
cnQgaXMgTGludXggYXMgaXQgaXMgYXNzdW1pbmcNCj4gdG8gdXNlIHRoZSBzYW1lIGVuZGlhbiBh
cyB0aGUgaHlwZXJ2aXNvci4gQnV0IG90aGVyIE9TIG1heSBub3QgaGF2ZSB0aGlzDQo+IGlzc3Vl
cy4uLg0KPiANCj4gVGhlIGh5cGVydmlzb3IgaXRzZWxmIGlzIGxpa2VseSBnb2luZyB0byBzdGF5
IGxpdHRsZSBlbmRpYW4sIHNvIGRvZXMgdGhlDQo+IGludGVyZmFjZS4gRm9yIHRoZSB0b29scywg
d2Ugc2hvdWxkIGFpbSB0byBub3QgaW50cm9kdWNlIG1vcmUgYXNzdW1wdGlvbg0KPiB0aGF0IHRo
ZSBzb2Z0d2FyZSB3aWxsIGJlIGxpdHRsZSBlbmRpYW4uDQo+IA0KDQpGYWlyIGVub3VnaC4gSWYg
dGhlcmUncyBhIHJlYWxpc3RpYyBwb3NzaWJpbGl0eSBvZiBydW5uaW5nIGEgQkUgdG9vbHMgZG9t
YWluIHRoZW4gSSdsbCBjb2RlIGFjY29yZGluZ2x5Lg0KDQogIFBhdWwNCg0KPiBDaGVlcnMsDQo+
IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
