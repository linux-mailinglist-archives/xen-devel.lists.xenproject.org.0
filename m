Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7720416FE58
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:56:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6vFp-0005FL-MI; Wed, 26 Feb 2020 11:53:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qsxb=4O=amazon.co.uk=prvs=3182d51f9=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6vFn-0005FG-Va
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:53:28 +0000
X-Inumbo-ID: 98c93310-588e-11ea-93ff-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98c93310-588e-11ea-93ff-12813bfff9fa;
 Wed, 26 Feb 2020 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582718006; x=1614254006;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eJ5pVb70xBfwQ6LqchvTpNQ3e4mAvVi7fy9fjBLVpy8=;
 b=Qqa5SNYgdjQi2CK5Pt968ic7a6rfsoLZnRSjvFbKqFmt94cbB+ilkun2
 GI1jh/lFktYDuou+DtTvlOQB1/oNoPdBw54OPB11/G+AckFWp+i2vAvVL
 pUmbTK52cu3ccjCCKJUsav9mTZc3ZK+Ax1VwC6nLJEJ44DeJESIqQODO9 Y=;
IronPort-SDR: v9xd7x4AQmEa+an+dQekWx1VMQTcQIE3HT+7mWPJhAhu6mLaSjQ2hZmAlvURUghhFuQ6VSMh/Y
 gWRPgrvm+NDg==
X-IronPort-AV: E=Sophos;i="5.70,488,1574121600"; d="scan'208";a="19743147"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Feb 2020 11:53:14 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 63AC6A2AD5; Wed, 26 Feb 2020 11:53:11 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 26 Feb 2020 11:53:10 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 26 Feb 2020 11:53:09 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 26 Feb 2020 11:53:09 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/2] domain: use PGC_extra domheap page for shared_info
Thread-Index: AQHV68GGHAJvfVndcEiEcAXBc0AZ06gtXSaAgAAA2dA=
Date: Wed, 26 Feb 2020 11:53:09 +0000
Message-ID: <c68a441ab80442de810d923ccb29916f@EX13D32EUC003.ant.amazon.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <108e5815-d399-8406-03b5-f5a3b9e46c3b@citrix.com>
In-Reply-To: <108e5815-d399-8406-03b5-f5a3b9e46c3b@citrix.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAyNiBGZWJydWFyeSAyMDIwIDExOjQ2DQo+
IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVuQHhlbi5vcmc+OyBWb2xvZHlteXIg
QmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBHZW9yZ2UNCj4gRHVubGFwIDxn
ZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nvbg0KPiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEtvbnJhZA0KPiBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFdlaSBMaXUgPHdsQHhlbi5v
cmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkb21haW46IHVzZSBQR0NfZXh0cmEgZG9t
aGVhcCBwYWdlIGZvcg0KPiBzaGFyZWRfaW5mbw0KPiANCj4gT24gMjUvMDIvMjAyMCAwOTo1Mywg
UGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IFRoZXJlJ3Mgbm8gcGFydGljdWxhciByZWFzb24gc2hh
cmVkX2luZm8gbmVlZCB1c2UgYSB4ZW5oZWFwIHBhZ2UuDQo+IA0KDQpPaywgJ3BhcnRpY3VsYXIn
IGlzIHRvbyB2YWd1ZSwgYWdyZWVkLiBJJ2xsIGVsYWJvcmF0ZS4NCg0KPiA/DQo+IA0KPiBUaGVy
ZSBhcmUgYSBudW1iZXIgb2YgQUJJLWNyaXRpY2FsIHJlYXNvbnMsIG5vdCBsZWFzdCB0aGUgZXZ0
Y2huX3BlbmRpbmcNCj4gZmllbGQgd2hpY2ggWGVuIG5lZWRzIHRvIHdyaXRlLg0KPiANCg0KSSBk
byBhZGRyZXNzIHRoaXMgc3BlY2lmaWNhbGx5IGluIHRoZSBjb21taXQgY29tbWVudC4NCg0KIkFT
U0VSVGlvbnMgYXJlIGFkZGVkIGJlZm9yZSBhcHBhcmVudGx5IHZ1bG5lcmFibGUgZGVyZWZlcmVu
Y2VzIGluIHRoZQ0KZXZlbnQgY2hhbm5lbCBjb2RlLiBUaGVzZSBzaG91bGQgbm90IGJlIGhpdCBi
ZWNhdXNlIGRvbWFpbl9raWxsKCkgY2FsbHMNCmV2dGNobl9kZXN0cm95KCkgYmVmb3JlIGNhbGxp
bmcgZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgYnV0IGFyZQ0KYWRkZWQgdG8gY2F0Y2gg
YW55IGZ1dHVyZSByZS1vcmRlcmluZy4iDQoNCj4gSSBjYW4gc2VlIHdoYXQgeW91J3JlIHRyeWlu
ZyB0byBkbywgYW5kIGl0IGxvb2tzIGZpbmUgaW4gcHJpbmNpcGxlLCBidXQNCj4gdGhlIGNvbW1p
dCBtZXNzYWdlIGlzbid0IHJlbW90ZWx5IGFjY3VyYXRlLsKgIFJlbWVtYmVyIHRoYXQgeW91IGFy
ZSBpbg0KPiB0aGUgcHJvY2VzcyBvZiBjaGFuZ2luZyB0aGUgbWVhbmluZy91c2FnZSBvZiB0aGUg
eGVuaGVhcCAtIHByZWV4aXRpbmcNCj4gdXNlcyBjb25mb3JtIHRvIHRoZSBvbGQgbWVhbmluZywg
d2hlcmUgdGhlIHNvbGUgZGlzdGluY3Rpb24gYmV0d2Vlbg0KPiBkb21oZWFwIGFuZCB4ZW5oZWFw
IHBhZ2VzIHdhcyB3aGV0aGVyIFhlbiByZXF1aXJlZCBhIHZpcnR1YWwgbWFwcGluZyBvcg0KPiBu
b3QuwqAgVGhlIGFuc3dlciBpcyAiYWJzb2x1dGVseSB5ZXMiIGZvciB0aGUgc2hhcmVkIGluZm8g
cGFnZS4NCj4gDQoNCldhcyB0aGF0IHRoZSBjYXNlPyBJIGhhdmVuJ3QgbWluZWQgdG8gZmluZCB3
aGVuIG1hcF9kb21haW5fcGFnZSgpIHdhcyBpbnRyb2R1Y2VkLiBBdCB0aGF0IHBvaW50LCBvZiBj
b3Vyc2UsIGFueSBzdHJpY3QgJ2JlaW5nIHZpcnR1YWxseSBtYXBwZWQnIGRpc3RpbmN0aW9uIGJl
dHdlZW4geGVuaGVhcCBhbmQgZG9taGVhcCB3YXMgcmVuZGVyZWQgaW5hY2N1cmF0ZS4NCg0KICBQ
YXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
