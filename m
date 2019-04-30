Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F127F8B4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 14:22:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLRii-0004Bl-Fb; Tue, 30 Apr 2019 12:18:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GOyl=TA=amazon.de=prvs=0169a7198=wipawel@srs-us1.protection.inumbo.net>)
 id 1hLRig-0004Bg-CE
 for xen-devel@lists.xen.org; Tue, 30 Apr 2019 12:18:46 +0000
X-Inumbo-ID: 19862b56-6b42-11e9-b11d-1f1b9472fb45
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19862b56-6b42-11e9-b11d-1f1b9472fb45;
 Tue, 30 Apr 2019 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1556626725; x=1588162725;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=TwsztoujzaU6rLqa2ms6ppWmgC0HwPqQ9PZ4Mi5fA7M=;
 b=nVv9x8SQKl2Ez7W0fJUetr+oJ+a9O9BHpAt1GGeTc12pQulcGTjhJTY0
 EBIsodUX/FbVrYUxqrBhsBG4Fzc+aoVHFDhZYYUUDfcFiiS9u6GHLiHDh
 73j89xLPMH1/tPh4UuaJvQJ0nQ1gnKutQUFaOotCEuBlMATVsJbiXvLDA 4=;
X-IronPort-AV: E=Sophos;i="5.60,413,1549929600"; d="scan'208";a="764177432"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 30 Apr 2019 12:18:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x3UCISYs091903
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 30 Apr 2019 12:18:31 GMT
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 30 Apr 2019 12:18:31 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 30 Apr 2019 12:18:30 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 30 Apr 2019 12:18:30 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [livepatch-build-tools part2 3/6] create-diff-object: Add
 is_special_section() helper function
Thread-Index: AQHU9Ez85qHuegmgbEazB4ShFo8Fm6ZTVtEAgAFeOIA=
Date: Tue, 30 Apr 2019 12:18:30 +0000
Message-ID: <8D3077EC-0D5B-480A-AD09-178299170A63@amazon.com>
References: <20190416120716.26269-1-wipawel@amazon.de>
 <20190416120716.26269-3-wipawel@amazon.de>
 <e0e79860-47f5-175a-0e63-af2c45bd2341@citrix.com>
In-Reply-To: <e0e79860-47f5-175a-0e63-af2c45bd2341@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.137]
Content-ID: <0F3F3C00464D72498F8DB34DC1C54DF7@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch-build-tools part2 3/6]
 create-diff-object: Add is_special_section() helper function
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDI5LiBBcHIgMjAxOSwgYXQgMTc6MjUsIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vy
d2FsbEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDQvMTYvMTkgMTowNyBQTSwgUGF3ZWwg
V2llY3pvcmtpZXdpY3ogd3JvdGU6DQo+PiBUaGlzIGZ1bmN0aW9uIGRldGVybWluZXMsIGJhc2Vk
IG9uIHRoZSBnaXZlbiBzZWN0aW9uIG5hbWUsIGlmIHRoZQ0KPj4gc2VjdGlvbnMgYmVsb25ncyB0
byB0aGUgc3BlY2lhbCBzZWN0aW9ucyBjYXRlZ29yeS4NCj4+IEl0IHRyZWF0cyBhIG5hbWUgZnJv
bSB0aGUgc3BlY2lhbF9zZWN0aW9ucyBhcnJheSBhcyBhIHByZWZpeC4gQW55DQo+PiBzZWN0aW9u
cyB3aG9zZSBuYW1lIHN0YXJ0cyB3aXRoIHNwZWNpYWwgc2VjdGlvbiBwcmVmaXggaXMgY29uc2lk
ZXJlZA0KPj4gYSBzcGVjaWFsIHNlY3Rpb24uDQo+PiBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVj
em9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+DQo+PiBSZXZpZXdlZC1ieTogQW5kcmEtSXJp
bmEgUGFyYXNjaGl2IDxhbmRyYXByc0BhbWF6b24uY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEJqb2Vy
biBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+DQo+PiBSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50
aGV5IDxubWFudGhleUBhbWF6b24uZGU+DQo+PiAtLS0NCj4+ICBjb21tb24uYyB8IDIzICsrKysr
KysrKysrKysrKysrKysrKysrDQo+PiAgY29tbW9uLmggfCAgMSArDQo+PiAgMiBmaWxlcyBjaGFu
Z2VkLCAyNCBpbnNlcnRpb25zKCspDQo+PiBkaWZmIC0tZ2l0IGEvY29tbW9uLmMgYi9jb21tb24u
Yw0KPj4gaW5kZXggYzk2ODI5OS4uYTJjODYwYiAxMDA2NDQNCj4+IC0tLSBhL2NvbW1vbi5jDQo+
PiArKysgYi9jb21tb24uYw0KPj4gQEAgLTI5MCw2ICsyOTAsMjkgQEAgaW50IGlzX3JlZmVyZW5j
ZWRfc2VjdGlvbihjb25zdCBzdHJ1Y3Qgc2VjdGlvbiAqc2VjLCBjb25zdCBzdHJ1Y3Qga3BhdGNo
X2VsZiAqa2UNCj4+ICAJcmV0dXJuIGZhbHNlOw0KPj4gIH0NCj4+ICAraW50IGlzX3NwZWNpYWxf
c2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKQ0KPiANCj4gY29uc3QgZm9yIHRoZSBwYXJhbWV0
ZXI/DQoNCkFDSy4gV2lsbCBhZGQuDQoNCj4gDQo+PiArew0KPj4gKwlzdGF0aWMgc3RydWN0IHNw
ZWNpYWxfc2VjdGlvbl9uYW1lcyB7DQo+PiArCQljb25zdCBjaGFyICpuYW1lOw0KPj4gKwl9IG5h
bWVzW10gPSB7DQo+PiArCQl7IC5uYW1lCQk9ICIuYnVnX2ZyYW1lcyIgICAgICAgICAgICAgICAg
IH0sDQo+PiArCQl7IC5uYW1lCQk9ICIuZml4dXAiICAgICAgICAgICAgICAgICAgICAgIH0sDQo+
PiArCQl7IC5uYW1lCQk9ICIuZXhfdGFibGUiICAgICAgICAgICAgICAgICAgIH0sDQo+PiArCQl7
IC5uYW1lCQk9ICIuYWx0aW5zdHJ1Y3Rpb25zIiAgICAgICAgICAgIH0sDQo+PiArCQl7IC5uYW1l
CQk9ICIuYWx0aW5zdHJfcmVwbGFjZW1lbnQiICAgICAgIH0sDQo+PiArCQl7IC5uYW1lCQk9ICIu
bGl2ZXBhdGNoLmhvb2tzIiAgICAgICAgICAgIH0sDQo+PiArCQl7IC5uYW1lICAgICAgICAgPSBO
VUxMICAgICAgICAgICAgICAgICAgICAgICAgICB9LA0KPj4gKwl9Ow0KPj4gKwlzdHJ1Y3Qgc3Bl
Y2lhbF9zZWN0aW9uX25hbWVzICpzcGVjaWFsOw0KPiANCj4gV291bGRuJ3QgaXQgYmUgYmV0dGVy
IHRvIHJldXNlIHRoZSBleGlzdGluZyBzcGVjaWFsX3NlY3Rpb25zIGFycmF5IHJhdGhlciB0aGFu
IHBhcnRpYWxseSBkdXBsaWNhdGluZyBpdCBoZXJlPw0KDQpBZnRlciBsb29raW5nIGF0IHRoaXMg
Y29kZSBhZ2FpbiwgSSB0aGluayB5b3XigJlyZSByaWdodCBhbmQgaXQgd291bGQgYmUgYmV0dGVy
Lg0KSXQgd291bGQgcmVxdWlyZSB0byBleHBsaWNpdGx5IGNhbGwgb3V0IGFsbCBzZWN0aW9ucyB0
byBiZSBjb25zaWRlcmVkIHNwZWNpYWwgaW4NCnRoZSBzcGVjaWFsX3NlY3Rpb25zIGFycmF5LCBi
dXQgdGhpcyBpcyBhY3R1YWxseSB3aGF0IEkgbmVlZCBmb3IgZnVydGhlciBjaGFuZ2VzIGFueXdh
eS4NCg0KQUNLLiBXaWxsIGZpeC4gDQoNCj4gDQo+PiArDQo+PiArCWZvciAoc3BlY2lhbCA9IG5h
bWVzOyBzcGVjaWFsLT5uYW1lOyBzcGVjaWFsKyspIHsNCj4+ICsJCWlmICghc3RybmNtcChzZWMt
Pm5hbWUsIHNwZWNpYWwtPm5hbWUsIHN0cmxlbihzcGVjaWFsLT5uYW1lKSkpDQo+PiArCQkJcmV0
dXJuIHRydWU7DQo+IA0KPiBUaGlzIGNoZWNrIGlzIG5vdCBhcyBwcmVjaXNlIGFzIGl0IGNvdWxk
IGJlLCBzaW5jZSAiLmFsdGluc3RydWN0aW9uc2ZvbyIgd291bGQgYmUgY29uc2lkZXJlZCBzcGVj
aWFsIHdoZW4gaXQgYWN0dWFsbHkgbWVhbnMgbm90aGluZyB0byB0aGlzIHRvb2wuDQoNCkdpdmVu
IHRoZSBhYm92ZSByZWFzb25pbmcsIHRoYXTigJlzIHJpZ2h0Lg0KDQpBQ0suIFdpbGwgZml4Lg0K
DQo+IA0KPiAtLSANCj4gUm9zcyBMYWdlcndhbGwNCg0KDQpCZXN0IFJlZ2FyZHMsDQpQYXdlbCBX
aWVjem9ya2lld2ljegoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApL
cmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBT
Y2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdl
biBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
