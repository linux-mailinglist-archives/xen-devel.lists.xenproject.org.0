Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7585154034
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 09:31:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izcWS-0000me-Op; Thu, 06 Feb 2020 08:28:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RI0J=32=amazon.co.uk=prvs=29855b991=pdurrant@srs-us1.protection.inumbo.net>)
 id 1izcWQ-0000mZ-PF
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 08:28:26 +0000
X-Inumbo-ID: a4623d36-48ba-11ea-aeed-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4623d36-48ba-11ea-aeed-12813bfff9fa;
 Thu, 06 Feb 2020 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580977706; x=1612513706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M7qMwkSPWxSxDClwDnvT1vE68TRrDOHfLkS6Rxe8eRw=;
 b=Tuo97DV5iMMZFZ42c0wqQAwS/WbSl1PL7Js3S4SGiHhcmLViRoY8V7wU
 LfOsuBH/TAZWEwimCKoxpEF13FnoPvm8hT+qrl7Pwt5W2RQfnAc6R/QkR
 13dqwfMdysS7WAqDuTaJ10KIKPDalS8VEdZ6Tpq+B0nJ8LpCXCUV9pHOw 0=;
IronPort-SDR: bcqoPKqXV0+9BpBeBAVaKLsetpbGE5b3gncW3fBOu+eegZvWw1n/wKnyr8utkExQIdGc77abCg
 Rrc3Buc75vwA==
X-IronPort-AV: E=Sophos;i="5.70,408,1574121600"; d="scan'208";a="16475813"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 06 Feb 2020 08:28:24 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 23FB9A23A6; Thu,  6 Feb 2020 08:28:19 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 6 Feb 2020 08:28:19 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 6 Feb 2020 08:28:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 6 Feb 2020 08:28:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 0/4] purge free_shared_domheap_page()
Thread-Index: AQHV2oCoSQ6jJjHUtUGr3S6VkEPAzagN2XmQ
Date: Thu, 6 Feb 2020 08:28:18 +0000
Message-ID: <fe250b28cc42442c86fdb108e1702c45@EX13D32EUC003.ant.amazon.com>
References: <20200203105654.22998-1-pdurrant@amazon.com>
In-Reply-To: <20200203105654.22998-1-pdurrant@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v9 0/4] purge free_shared_domheap_page()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QUZBSUNUIHRoZXNlIHBhdGNoZXMgaGF2ZSB0aGUgbmVjZXNzYXJ5IEEtYi9SLWItcywgb3IgYXJl
IHRoZXJlIHNvbWUgbWlzc2luZyB0aGF0IEkgbmVlZCB0byBjaGFzZT8NCg0KICBQYXVsDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFu
dEBhbWF6b24uY29tPg0KPiBTZW50OiAwMyBGZWJydWFyeSAyMDIwIDEwOjU3DQo+IFRvOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50
QGFtYXpvbi5jby51az47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBJYW4NCj4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+OyBKdW4NCj4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+OyBLb25yYWQg
Unplc3p1dGVrIFdpbGsNCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPjsgVm9sb2R5bXlyDQo+
IEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgV2VpIExpdSA8d2xAeGVuLm9y
Zz4NCj4gU3ViamVjdDogW1BBVENIIHY5IDAvNF0gcHVyZ2UgZnJlZV9zaGFyZWRfZG9taGVhcF9w
YWdlKCkNCj4gDQo+IFBhdWwgRHVycmFudCAoNCk6DQo+ICAgeDg2IC8gdm14OiBtb3ZlIHRlYXJk
b3duIGZyb20gZG9tYWluX2Rlc3Ryb3koKS4uLg0KPiAgIGFkZCBhIGRvbWFpbl90b3RfcGFnZXMo
KSBoZWxwZXIgZnVuY3Rpb24NCj4gICBtbTogbWFrZSBwYWdlcyBhbGxvY2F0ZWQgd2l0aCBNRU1G
X25vX3JlZmNvdW50IHNhZmUgdG8gYXNzaWduDQo+ICAgeDg2IC8gdm14OiB1c2UgYSBNRU1GX25v
X3JlZmNvdW50IGRvbWhlYXAgcGFnZSBmb3INCj4gICAgIEFQSUNfREVGQVVMVF9QSFlTX0JBU0UN
Cj4gDQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvZG9tY3RsLmMgICAgIHwgIDIgKy0NCj4gIHhlbi9h
cmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgfCAgMiArLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMgICAgICB8IDI1ICsrKysrKysrLS0tDQo+ICB4ZW4vYXJjaC94ODYvbW0uYyAgICAg
ICAgICAgICAgIHwgMTUgKystLS0tLQ0KPiAgeGVuL2FyY2gveDg2L21tL3AybS1wb2QuYyAgICAg
ICB8IDEwICsrLS0tDQo+ICB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jIHwgIDIgKy0N
Cj4gIHhlbi9hcmNoL3g4Ni9tc2kuYyAgICAgICAgICAgICAgfCAgMiArLQ0KPiAgeGVuL2FyY2gv
eDg2L251bWEuYyAgICAgICAgICAgICB8ICAyICstDQo+ICB4ZW4vYXJjaC94ODYvcHYvZG9tMF9i
dWlsZC5jICAgIHwgMjUgKysrKysrLS0tLS0NCj4gIHhlbi9hcmNoL3g4Ni9wdi9kb21haW4uYyAg
ICAgICAgfCAgMiArLQ0KPiAgeGVuL2FyY2gveDg2L3B2L3NoaW0uYyAgICAgICAgICB8ICA0ICst
DQo+ICB4ZW4vY29tbW9uL2RvbWN0bC5jICAgICAgICAgICAgIHwgIDIgKy0NCj4gIHhlbi9jb21t
b24vZ3JhbnRfdGFibGUuYyAgICAgICAgfCAgNCArLQ0KPiAgeGVuL2NvbW1vbi9rZXloYW5kbGVy
LmMgICAgICAgICB8ICAyICstDQo+ICB4ZW4vY29tbW9uL21lbW9yeS5jICAgICAgICAgICAgIHwg
IDIgKy0NCj4gIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jICAgICAgICAgfCA3OCArKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0NCj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCAgICAg
ICAgfCAgNSArKy0NCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCAgICAgICAgfCAgOSArKy0t
DQo+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmggICAgIHwgIDQgKy0NCj4gIHhlbi9pbmNs
dWRlL3hlbi9zY2hlZC5oICAgICAgICAgfCAyNyArKysrKysrKystLS0NCj4gIDIwIGZpbGVzIGNo
YW5nZWQsIDE0MyBpbnNlcnRpb25zKCspLCA4MSBkZWxldGlvbnMoLSkNCj4gLS0tDQo+IENjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBDYzogR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KPiBDYzogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+DQo+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
Pg0KPiBDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPg0KPiBDYzogS29u
cmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPg0KPiBDYzogIlJvZ2Vy
IFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4u
b3JnPg0KPiBDYzogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29t
Pg0KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gLS0NCj4gMi4yMC4xDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
