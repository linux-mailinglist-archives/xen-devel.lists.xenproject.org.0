Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFDC148DE1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 19:38:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv3oe-0005nf-VE; Fri, 24 Jan 2020 18:36:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9iSm=3N=amazon.co.uk=prvs=28596b9bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iv3od-0005na-7J
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 18:36:23 +0000
X-Inumbo-ID: 6b9e1196-3ed8-11ea-8095-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b9e1196-3ed8-11ea-8095-12813bfff9fa;
 Fri, 24 Jan 2020 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579890983; x=1611426983;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=neMSIkfUpMe36idr6e7ypmA0mumYZBMAJ6+IeTbUhw0=;
 b=VNvf3wHpjcpTQZ9IrrylZxxiXeWU/waQmEwCHI9rK323GXcOJ2A8fx7p
 /pkU8rcBBJokG7HMBMuY5hshkjHVgMy8dBl4gdR/HlE0zmugc7ij/TeCz
 guuttcdg6J1/JUpLxok+SGAfsmA2epaYiuEESk0jbNA64BEl/E+1hwDFn M=;
IronPort-SDR: M3YHnPb9PpBFTb7IEjc5OZPratW11ZHwoJgTVt+S73an/PgAAdR8jCSsdXY/AabDjFqZmTShDj
 +cWVBOhnBIkw==
X-IronPort-AV: E=Sophos;i="5.70,358,1574121600"; d="scan'208,217";a="13983493"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 24 Jan 2020 18:36:21 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4DC3BA1874; Fri, 24 Jan 2020 18:36:19 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 24 Jan 2020 18:36:19 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 24 Jan 2020 18:36:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 24 Jan 2020 18:36:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v4 7/7] mm: remove donate_page()
Thread-Index: AQHV0staB7eWog2VHk+DLMj+cAW1zaf6GZgAgAALJoM=
Date: Fri, 24 Jan 2020 18:36:17 +0000
Message-ID: <e7fe5c22-9570-41d4-9607-1b305690dbd8@amazon.co.uk>
References: <20200124153103.18321-1-pdurrant@amazon.com>
 <20200124153103.18321-8-pdurrant@amazon.com>,
 <dcacdb61-59d9-9d5d-db55-602ad44538c9@citrix.com>
In-Reply-To: <dcacdb61-59d9-9d5d-db55-602ad44538c9@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 7/7] mm: remove donate_page()
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============4997264148789162169=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4997264148789162169==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_e7fe5c22957041d496071b305690dbd8amazoncouk_"

--_000_e7fe5c22957041d496071b305690dbd8amazoncouk_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNClNlbnQgZnJvbSBXb3Jrc3BhY2UgT05FIEJveGVyDQpPbiAyNCBKYW4gMjAyMCAxNzo1Nywg
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+DQo+IE9u
IDI0LzAxLzIwMjAgMTU6MzEsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBUaGlzIGZ1bmN0aW9u
IGFwcGVhcnMgdG8gaGF2ZSBubyBjYWxsZXJzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPg0KPiBMb29rcyBsaWtlIHRtZW0gd2Fz
IHRoZSBzb2xlIHVzZXIuICBkb25hdGVfcGFnZSgpIHdhcyBpbnRyb2R1Y2VkIGJ5DQo+IDYwMDlm
NGRkYjIgYW5kIHRoZSBsYXN0IGNhbGxlciB3YXMgZHJvcHBlZCBieSBjNDkyZTE5ZmRkLg0KPg0K
PiBUaGlzIHBhdGNoIGlzIHN0YW5kYWxvbmUsIGFuZCBJIGNhbiB0d2VhayB0aGUgY29tbWl0IG1l
c3NhZ2Ugb24gY29tbWl0LA0KPiBpZiB5b3UncmUgaGFwcHkgd2l0aCB0aGF0Lg0KPg0KDQpGaW5l
IHdpdGggbWUuDQoNCiAgUGF1bA0KPiB+QW5kcmV3DQoNCg==

--_000_e7fe5c22957041d496071b305690dbd8amazoncouk_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGJyPg0KPGJyPg0K
PGRpdiBkaXI9Imx0ciI+U2VudCBmcm9tIFdvcmtzcGFjZSBPTkUgQm94ZXI8L2Rpdj4NCjxkaXYg
ZGlyPSJsdHIiPk9uIDI0IEphbiAyMDIwIDE3OjU3LCBBbmRyZXcgQ29vcGVyICZsdDthbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tJmd0OyB3cm90ZToNCjwvZGl2Pg0KPGRpdiBkaXI9Imx0ciI+Jmd0
OzwvZGl2Pg0KPGRpdiBkaXI9Imx0ciI+Jmd0OyBPbiAyNC8wMS8yMDIwIDE1OjMxLCBQYXVsIER1
cnJhbnQgd3JvdGU6IDwvZGl2Pg0KPGRpdiBkaXI9Imx0ciI+Jmd0OyAmZ3Q7IFRoaXMgZnVuY3Rp
b24gYXBwZWFycyB0byBoYXZlIG5vIGNhbGxlcnMuIDwvZGl2Pg0KPGRpdiBkaXI9Imx0ciI+Jmd0
OyAmZ3Q7IDwvZGl2Pg0KPGRpdiBkaXI9Imx0ciI+Jmd0OyAmZ3Q7IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCAmbHQ7cGR1cnJhbnRAYW1hem9uLmNvbSZndDsgPC9kaXY+DQo8ZGl2IGRpcj0i
bHRyIj4mZ3Q7PC9kaXY+DQo8ZGl2IGRpcj0ibHRyIj4mZ3Q7IExvb2tzIGxpa2UgdG1lbSB3YXMg
dGhlIHNvbGUgdXNlci4mbmJzcDsgZG9uYXRlX3BhZ2UoKSB3YXMgaW50cm9kdWNlZCBieQ0KPC9k
aXY+DQo8ZGl2IGRpcj0ibHRyIj4mZ3Q7IDYwMDlmNGRkYjIgYW5kIHRoZSBsYXN0IGNhbGxlciB3
YXMgZHJvcHBlZCBieSBjNDkyZTE5ZmRkLiA8L2Rpdj4NCjxkaXYgZGlyPSJsdHIiPiZndDs8L2Rp
dj4NCjxkaXYgZGlyPSJsdHIiPiZndDsgVGhpcyBwYXRjaCBpcyBzdGFuZGFsb25lLCBhbmQgSSBj
YW4gdHdlYWsgdGhlIGNvbW1pdCBtZXNzYWdlIG9uIGNvbW1pdCwNCjwvZGl2Pg0KPGRpdiBkaXI9
Imx0ciI+Jmd0OyBpZiB5b3UncmUgaGFwcHkgd2l0aCB0aGF0LiA8L2Rpdj4NCjxkaXYgZGlyPSJs
dHIiPiZndDs8L2Rpdj4NCjxicj4NCjxkaXYgZGlyPSJsdHIiPkZpbmUgd2l0aCBtZS48L2Rpdj4N
Cjxicj4NCjxkaXYgZGlyPSJsdHIiPiZuYnNwOyBQYXVsPC9kaXY+DQo8ZGl2IGRpcj0ibHRyIj4m
Z3Q7IH5BbmRyZXcgPC9kaXY+DQo8YnI+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_e7fe5c22957041d496071b305690dbd8amazoncouk_--


--===============4997264148789162169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4997264148789162169==--

