Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6862725AC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 15:35:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKLyd-0002sE-AB; Mon, 21 Sep 2020 13:35:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BjqN=C6=amazon.co.uk=prvs=5269d94c5=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kKLyb-0002s5-F1
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 13:35:29 +0000
X-Inumbo-ID: b1654acf-b4be-4898-bd5b-ad74418de4ec
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1654acf-b4be-4898-bd5b-ad74418de4ec;
 Mon, 21 Sep 2020 13:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1600695329; x=1632231329;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=jfEZki0rcxEi66HEr60UhsC4uDFWJ0eZ02s9yyfdtd0=;
 b=DmmSzSL7ds7mFYe4kPxGQLfUFZMdngmMlFsrp7SGiBVV9q2YTzm6XAAF
 BMaTigDQCNrVPr+PrhwwsvoI1uppS9c9h1mKr6RPqfWfV1kBWzjQrNIYw
 rRBIoHnktTJTEa2hCuo7wQm841ySxF2tgXG9JHGVkFXgOR4k7kFB7i/fk M=;
X-IronPort-AV: E=Sophos;i="5.77,286,1596499200"; d="scan'208";a="55296599"
Subject: RE: Memory ordering question in the shutdown deferral code
Thread-Topic: Memory ordering question in the shutdown deferral code
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 21 Sep 2020 13:35:27 +0000
Received: from EX13D37EUA003.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 241031A157B; Mon, 21 Sep 2020 13:35:25 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 21 Sep 2020 13:35:24 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 21 Sep 2020 13:35:24 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Xia,
 Hongyan" <hongyxia@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHWkAvNKxPhF20UiUS+iInofanuW6ly9+2AgAAST0CAAAuigIAAAVWAgAAAbJA=
Date: Mon, 21 Sep 2020 13:35:24 +0000
Message-ID: <6909eb6bc4dd4f16b4cd2f8119b3144d@EX13D32EUC003.ant.amazon.com>
References: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
 <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
 <92a6373003e142e9943a4057024a2616@EX13D32EUC003.ant.amazon.com>
 <ad81f6ac-6127-bea8-a503-d16d3dc175df@xen.org>
 <80e221e0-a1d5-4cc1-b083-1e8f537f016c@suse.com>
In-Reply-To: <80e221e0-a1d5-4cc1-b083-1e8f537f016c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.209]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIxIFNlcHRlbWJlciAyMDIwIDE0OjMyDQo+IFRvOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRA
YW1hem9uLmNvLnVrPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsNCj4gYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbTsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPjsgWGlhLCBIb25neWFuDQo+IDxob25neXhpYUBhbWF6b24uY29tPjsg
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxd
IE1lbW9yeSBvcmRlcmluZyBxdWVzdGlvbiBpbiB0aGUgc2h1dGRvd24gZGVmZXJyYWwgY29kZQ0K
PiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUg
b3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMg
c2FmZS4NCj4gDQo+IA0KPiANCj4gT24gMjEuMDkuMjAyMCAxNToyNywgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPiA+IEkgdGhpbmsgdGhpcyBwYXJ0IGlzIHJhY3kgYXQgbGVhc3Qgb24gbm9uLXg4NiBw
bGF0Zm9ybSBhcyB4ODYgc2VlbXMgdG8NCj4gPiBpbXBsZW1lbnQgc21wX21iKCkgd2l0aCBhIHN0
cm9uZyBtZW1vcnkgYmFycmllciAobWZlbmNlKS4NCj4gDQo+IFRoZSAic3RyZW5ndGgiIG9mIHRo
ZSBtZW1vcnkgYmFycmllciBkb2Vzbid0IG1hdHRlciBoZXJlIGltby4gSXQncw0KPiB0aGUgZnVs
bHkgY29oZXJlbnQgbWVtb3J5IG1vZGVsIChmb3IgV0IgdHlwZSBtZW1vcnkpIHdoaWNoIG1ha2Vz
DQo+IHRoaXMgYmUgZmluZSBvbiB4ODYuIFRoZSBiYXJyaWVyIHN0aWxsIG9ubHkgZ3VhcmFudGVl
cyBvcmRlcmluZywNCj4gbm90IHZpc2liaWxpdHkuDQo+IA0KDQpJbiB3aGljaCBjYXNlIEkgbWlz
dW5kZXJzdG9vZCB3aGF0IHRoZSAnc21wJyBtZWFucyBpbiB0aGlzIGNvbnRleHQgdGhlbi4NCg0K
ICBQYXVsDQo=

