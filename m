Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF651700B7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 15:07:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6xJa-0002lz-Et; Wed, 26 Feb 2020 14:05:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qsxb=4O=amazon.co.uk=prvs=3182d51f9=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6xJY-0002lr-VE
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 14:05:29 +0000
X-Inumbo-ID: 0a9c021c-58a1-11ea-aba8-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a9c021c-58a1-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582725929; x=1614261929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H9z4ReTVVoXBib7ZVNacEGtzc37HUVs0lzYr4DriPgM=;
 b=v7NGTPxFgxrk0ogzC+7wkShUCOvbR/FQTz05tW1Skju9J0vPonl72CH/
 B9IcH8H+GliI9KLHDE+9MfgNZg7BUTh7oV8a+30yLdjx0EGNgVWSWy++V
 3g7yHHW2AsgFmpSgpEks3JQb8Wiia8Lb2B8Zn1cTswoTj6mgE252++8x2 g=;
IronPort-SDR: 4aWlW0xDKVb4qJ5ci737S484wziZiGL3vmcppCoD88Yg4rDJpdRADwJWSEj5ETEN4XE0XzDUnm
 eOVXL8LmHj8A==
X-IronPort-AV: E=Sophos;i="5.70,488,1574121600"; d="scan'208";a="28991130"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Feb 2020 14:05:26 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 74BA2A3C8C; Wed, 26 Feb 2020 14:05:22 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 26 Feb 2020 14:05:21 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 26 Feb 2020 14:05:20 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 26 Feb 2020 14:05:20 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH 2/2] domain: use PGC_extra domheap page for shared_info
Thread-Index: AQHV68GGHAJvfVndcEiEcAXBc0AZ06gtgfgAgAAAk6A=
Date: Wed, 26 Feb 2020 14:05:20 +0000
Message-ID: <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
In-Reply-To: <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.91]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI2IEZlYnJ1YXJ5IDIwMjAgMTM6NTgNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFZvbG9keW15ciBCYWJjaHVrDQo+
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Ow0KPiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+OyBJYW4gSmFja3Nvbg0KPiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEtvbnJhZCBS
emVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFdlaSBMaXUgPHdsQHhl
bi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkb21haW46IHVzZSBQR0NfZXh0cmEg
ZG9taGVhcCBwYWdlIGZvcg0KPiBzaGFyZWRfaW5mbw0KPiANCj4gT24gMjUuMDIuMjAyMCAxMDo1
MywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IFRoZXJlJ3Mgbm8gcGFydGljdWxhciByZWFzb24g
c2hhcmVkX2luZm8gbmVlZCB1c2UgYSB4ZW5oZWFwIHBhZ2UuIEl0J3MNCj4gPiBvbmx5IHB1cnBv
c2UgaXMgdG8gYmUgbWFwcGVkIGJ5IHRoZSBndWVzdCBzbyB1c2UgYSBQR0NfZXh0cmEgZG9taGVh
cA0KPiBwYWdlDQo+ID4gaW5zdGVhZC4NCj4gDQo+IFNpbmNlIHRoZSBjb3ZlciBsZXR0ZXIgYWxz
byBkb2Vzbid0IGdpdmUgYW55IGJhY2tncm91bmQgLSBpcyB0aGVyZSBhDQo+IHByb2JsZW0gd2l0
aCB0aGUgY3VycmVudCBhcnJhbmdlbWVudHM/IEFyZSB0aGVyZSBhbnkgZnVydGhlciBwbGFucw0K
PiBkZXBlbmRpbmcgb24gdGhpcyBiZWluZyBjaGFuZ2VkPyBPciBpcyB0aGlzIHNpbXBseSAibGV0
J3MgZG8gaXQNCj4gYmVjYXVzZSBub3cgd2UgY2FuIj8NCj4gDQoNClRoZSBnZW5lcmFsIGRpcmVj
dGlvbiBpcyB0byBnZXQgcmlkIG9mIHNoYXJlZCB4ZW5oZWFwIHBhZ2VzLiBLbm93aW5nIHRoYXQg
YSB4ZW5oZWFwIHBhZ2UgaXMgbm90IHNoYXJlZCB3aXRoIGEgZ3Vlc3QgbWFrZXMgZGVhbGluZyB3
aXRoIGxpdmUgdXBkYXRlIG11Y2ggZWFzaWVyLCBhbmQgYWxzbyBhbGxvd3MgYSBjaHVuayBvZiBj
b2RlIHRvIGJlIHJlbW92ZWQgZnJvbSBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJlc2VzKCkgKHRo
ZSBzaGFyZWQgeGVuaGVhcCB3YWxrIHdoaWNoIGRlLWFzc2lnbnMgdGhlbSBmcm9tIHRoZSBkeWlu
ZyBndWVzdCkuDQpUaGUgb25seSB4ZW5oZWFwIHBhZ2VzIHNoYXJlZCB3aXRoIGEgbm9ybWFsIGRv
bVUgKGFzIG9wcG9zZWQgdG8gYSBzeXN0ZW0gZG9tYWluLCB3aGljaCB3b3VsZCBiZSByZS1jcmVh
dGVkIG9uIGxpdmUgdXBkYXRlIGFueXdheSkgYXJlIEFGQUlDVCBzaGFyZWQtaW5mbyBhbmQgZ3Jh
bnQgdGFibGUvc3RhdHVzIGZyYW1lcy4gVGhpcyBzZXJpZXMgZGVhbHMgd2l0aCBzaGFyZWQtaW5m
byBidXQgSSBkbyBoYXZlIHByb3RvLXBhdGNoZXMgZm9yIHRoZSBncmFudCB0YWJsZSBjb2RlIHRv
by4NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
