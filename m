Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A609122977D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 13:33:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyCzl-0000tp-FE; Wed, 22 Jul 2020 11:33:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0IpC=BB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jyCzk-0000tk-JU
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 11:33:08 +0000
X-Inumbo-ID: 1c4a5a41-cc0f-11ea-8634-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c4a5a41-cc0f-11ea-8634-bc764e2007e4;
 Wed, 22 Jul 2020 11:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595417586;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FdaxwzmkB9ZWieOTZghY6131G37CtVZDjeBxVrfYhS8=;
 b=CpZ1ySfVM/MW7nMEcVx1NiOrzGCpvqEnMROny7WvtcHGWyqsPWB3W7Fd
 isoUDkJF/qnOQKxSFCHaSxlaMzXYxd3hIRidAjzIsqGOBlkjdfwTBuNc3
 alICthH+HvlJZXS7E66iWNIoZ1sG6ATamVxaeu+NJLin7ng9xNwdRgtJm s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ekTm3/qI8RXzXk83yaDTej46M1xn2o1cIDzjOc1HhXzYYKn/nKIpOPh88J/6vdcHLRscNVwtll
 VZ50KyIw7ZRUDsFZBtRIhAcRP6y4JdDeNQP4JZUym2FVrVXlQjuow6qHxxGH/fVkIhm2tsBHlz
 ZDvE4+HLW0hpjoPHvDGO/MesC3YlCD6sWYUv1DBFY2YatFGt1LyTD057xV29c6T/2PMKnN6k3F
 JVfaHY4YlNaBM/qIdvdIiRrLMmOSXfFVf3sLIgzQ06Ni4AdNTHgdQ3mhl1ISfwJ7yNdPfrsN9K
 ob0=
X-SBRS: 2.7
X-MesageID: 23256595
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23256595"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [OSSTEST PATCH 08/14] Executive: Use index for report__find_test
Thread-Topic: [OSSTEST PATCH 08/14] Executive: Use index for report__find_test
Thread-Index: AQHWX46tfAvUjKxsQUGNt2ymzIKIvqkTVxGA
Date: Wed, 22 Jul 2020 11:33:01 +0000
Message-ID: <3ACBEEA3-C17D-48AE-8AE5-52C9D92C8C46@citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
 <20200721184205.15232-9-ian.jackson@eu.citrix.com>
In-Reply-To: <20200721184205.15232-9-ian.jackson@eu.citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C790B3B5B6FE44D862957E0A5F42FD0@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDIxLCAyMDIwLCBhdCA3OjQxIFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBBZnRlciB3ZSByZWZhY3RvciB0aGlzIHF1
ZXJ5IHRoZW4gd2UgY2FuIGVuYWJsZSB0aGUgaW5kZXggdXNlLg0KPiAoQm90aCBvZiB0aGVzZSB0
aGluZ3MgdG9nZXRoZXIgaW4gdGhpcyBjb21taXQgYmVjYXVzZSBJIGhhdmVuJ3QgcGVyZg0KPiB0
ZXN0ZWQgdGhlIHZlcnNpb24gd2l0aCBqdXN0IHRoZSByZWZhY3RvcmluZy4pDQo+IA0KPiAoV2Ug
aGF2ZSBwcm92aWRlZCBhbiBpbmRleCB0aGF0IGNhbiBhbnN3ZXIgdGhpcyBxdWVzdGlvbiByZWFs
bHkNCj4gcXVpY2tseSBpZiBhIHZlcnNpb24gaXMgc3BlY2lmaWVkLiAgQnV0IHRoZSBxdWVyeSBw
bGFubmVyIGNvdWxkbid0IHNlZQ0KPiB0aGF0IGJlY2F1c2UgaXQgd29ya3Mgd2l0aG91dCBzZWVp
bmcgdGhlIGJpbmQgdmFyaWFibGVzLCBzbyBkb2Vzbid0DQo+IGtub3cgdGhhdCB0aGUgdmFsdWUg
b2YgbmFtZSBpcyBnb2luZyB0byBiZSBzdWl0YWJsZSBmb3IgdGhpcyBpbmRleC4pDQo+IA0KPiAq
IENvbnZlcnQgdGhlIHR3byBFWElTVFMgc3VicXVlcmllcyBpbnRvIEpPSU4vQU5EIHdpdGggYSBE
SVNUSU5DVA0KPiAgY2xhdXNlIG5hbWluZyB0aGUgZmllbGRzIG9uIGZsaWdodHMsIHNvIGFzIHRv
IHJlcGxpY2F0ZSB0aGUgcHJldmlvdXMNCj4gIHJlc3VsdCByb3dzLiAgVGhlbiBkbyAkc2VsZWN0
aW9uIGZpZWxkIGxhc3QuICBUaGUgc3VicXVlcnkgaXMgYQ0KPiAgY29udmVuaWVudCB3YXkgdG8g
bGV0IHRoaXMgZG8gdGhlIHByZXZpb3VzIHRoaW5nIGZvciBhbGwgdGhlIHZhbHVlcw0KPiAgb2Yg
JHNlbGVjdGlvbiAoaW5jbHVkaW5nLCBub3RhYmx5LCAqKS4NCj4gDQo+ICogQWRkIHRoZSBhZGRp
dGlvbmFsIEFORCBjbGF1c2UgZm9yIHIubmFtZSwgd2hpY2ggaGFzIG5vIGxvZ2ljYWwNCj4gIGVm
ZmVjdCBnaXZlbiB0aGUgYWN0dWFsIHZhbHVlcyBvZiBuYW1lLCBlbmFibGluZyB0aGUgcXVlcnkg
cGxhbm5lcg0KPiAgdG8gdXNlIHRoaXMgaW5kZXguDQo+IA0KPiBQZXJmOiBJbiBteSB0ZXN0IGNh
c2UgdGhlIHNnLXJlcG9ydC1mbGlnaHQgcnVudGltZSBpcyBub3cgfjhzLiAgSSBhbQ0KPiByZWFz
b25hYmx5IGNvbmZpZGVudCB0aGF0IHRoaXMgd2lsbCBub3QgbWFrZSBvdGhlciB1c2UgY2FzZXMg
b2YgdGhpcw0KPiBjb2RlIHdvcnNlLg0KPiANCj4gUGVyZjogcnVudGltZSBvZiBteSB0ZXN0IGNh
c2Ugbm93IH4xMXMNCj4gDQo+IEV4YW1wbGUgcXVlcnkgYmVmb3JlIChmcm9tIHRoZSBQZXJsIERC
SSB0cmFjZSk6DQo+IA0KPiAgICAgICAgU0VMRUNUICoNCj4gICAgICAgICBGUk9NIGZsaWdodHMg
Zg0KPiAgICAgICAgV0hFUkUNCj4gICAgICAgICAgICAgICAgRVhJU1RTICgNCj4gICAgICAgICAg
ICAgICAgICAgU0VMRUNUIDENCj4gICAgICAgICAgICAgICAgICAgIEZST00gcnVudmFycyByDQo+
ICAgICAgICAgICAgICAgICAgIFdIRVJFIG5hbWU9Pw0KPiAgICAgICAgICAgICAgICAgICAgIEFO
RCB2YWw9Pw0KPiAgICAgICAgICAgICAgICAgICAgIEFORCByLmZsaWdodD1mLmZsaWdodA0KPiAg
ICAgICAgICAgICAgICAgICAgIEFORCAoICAgICAgKENBU0UNCj4gICAgICAgV0hFTiAoci5qb2Ip
IExJS0UgJ2J1aWxkLSUtcHJldicgVEhFTiAneHByZXYnDQo+ICAgICAgIFdIRU4gKChyLmpvYikg
TElLRSAnYnVpbGQtJS1mcmVlYnNkJw0KPiAgICAgICAgICAgICBBTkQgJ3gnID0gJ2ZyZWVic2Ri
dWlsZGpvYicpIFRIRU4gJ0RJU0NBUkQnDQo+ICAgICAgIEVMU0UgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICcnDQo+ICAgICAgIEVORCkNCj4gPSAnJykNCj4gICAgICAgICAg
ICAgICAgICkNCj4gICAgICAgICAgQU5EICggKFRSVUUgQU5EIGZsaWdodCA8PSAxNTE5MDMpIEFO
RCAoYmxlc3Npbmc9J3JlYWwnKSApDQo+ICAgICAgICAgIEFORCAoYnJhbmNoPT8pDQo+ICAgICAg
ICBPUkRFUiBCWSBmbGlnaHQgREVTQw0KPiAgICAgICAgTElNSVQgMQ0KDQpTbyB0aGlzIHNheXM6
DQoNCkdldCBtZSBhbGwgdGhlIGNvbHVtbnMNCmZvciB0aGUgaGlnaGVzdC1udW1iZXJlZCBmbGln
aHQNCldoZXJlOg0KICBUaGVyZSBpcyBhdCBsZWFzdCBvbmUgcnVudmFyIGZvciB0aGF0IGZsaWdo
dCBoYXMgdGhlIHNwZWNpZmllZCAkbmFtZSBhbmQgJHZhbHVlDQogIEFuZCB0aGUgam9iIGlzICpu
b3QqIGxpa2UgYnVpbGQtJS1wcmV2IG9yIGJ1aWxkLSUtZnJlZWJzZA0KICBUaGUgZmxpZ2h0IG51
bWJlciAoPykgaXMgPD0gMTUxOTAzLCBhbmQgYmxlc3NpbmcgPSByZWFsDQogIEZvciB0aGUgc3Bl
Y2lmaWVkICRicmFuY2gNCg0KV2hhdOKAmXMgdGhlIOKAnFRSVUUgYW5kIGZsaWdodCA8PSAxNTE5
MDPigJ0gZm9yPw0KDQo+IA0KPiBBZnRlcjoNCj4gDQo+ICAgICAgICBTRUxFQ1QgKg0KPiAgICAg
ICAgICBGUk9NICggU0VMRUNUIERJU1RJTkNUDQo+ICAgICAgICAgICAgICAgICAgICAgIGZsaWdo
dCwgc3RhcnRlZCwgYmxlc3NpbmcsIGJyYW5jaCwgaW50ZW5kZWQNCj4gICAgICAgICAgICAgICAg
IEZST00gZmxpZ2h0cyBmDQo+ICAgICAgICAgICAgICAgICAgICBKT0lOIHJ1bnZhcnMgciBVU0lO
RyAoZmxpZ2h0KQ0KPiAgICAgICAgICAgICAgICAgICBXSEVSRSBuYW1lPT8NCj4gICAgICAgICAg
ICAgICAgICAgICBBTkQgbmFtZSBMSUtFICdyZXZpc2lvbl8lJw0KPiAgICAgICAgICAgICAgICAg
ICAgIEFORCB2YWw9Pw0KPiAgICAgICAgICAgICAgICAgICAgIEFORCByLmZsaWdodD1mLmZsaWdo
dA0KPiAgICAgICAgICAgICAgICAgICAgIEFORCAoICAgICAgKENBU0UNCj4gICAgICAgV0hFTiAo
ci5qb2IpIExJS0UgJ2J1aWxkLSUtcHJldicgVEhFTiAneHByZXYnDQo+ICAgICAgIFdIRU4gKChy
LmpvYikgTElLRSAnYnVpbGQtJS1mcmVlYnNkJw0KPiAgICAgICAgICAgICBBTkQgJ3gnID0gJ2Zy
ZWVic2RidWlsZGpvYicpIFRIRU4gJ0RJU0NBUkQnDQo+ICAgICAgIEVMU0UgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICcnDQo+ICAgICAgIEVORCkNCj4gPSAnJykNCj4gICAg
ICAgICAgQU5EICggKFRSVUUgQU5EIGZsaWdodCA8PSAxNTE5MDMpIEFORCAoYmxlc3Npbmc9J3Jl
YWwnKSApDQo+ICAgICAgICAgIEFORCAoYnJhbmNoPT8pDQo+ICkgQVMgc3ViIFdIRVJFIFRSVUUN
Cj4gICAgICAgIE9SREVSIEJZIGZsaWdodCBERVNDDQo+ICAgICAgICBMSU1JVCAxDQoNCkFuZCB0
aGlzIHNheXMgKGVmZmVjdGl2ZWx5KQ0KDQpHZXQgbWUgPGZsaWdodCwgc3RhcnRlZCwgYmxlc3Np
bmcsIGJyYW5jaCwgaW50ZW5kZWQ+DQpGcm9tIHRoZSBoaWdoZXN0LW51bWJlcmVkIGZsaWdodA0K
V2hlcmUNCiAgVGhhdCBmbGlnaHQgaGFzIGEgcnVudmFyIHdpdGggc3BlY2lmaWVkIG5hbWUgYW5k
IHZhbHVlDQogIFRoZSBqb2IgKmRvZXNu4oCZdCogbG9vayBsaWtlIOKAnGJ1aWxkLSUtcHJlduKA
nSBvciDigJxidWlsZC0lLWZyZWVic2TigJ0NCiAgZmxpZ2h0ICYgYmxlc3NpbmcgYXMgYXBwcm9w
cmlhdGUNCiAgYnJhbmNoIGFzIHNwZWNpZmllZC4NCiAgDQpJc27igJl0IHRoZSByLmZsaWdodCA9
IGYuZmxpZ2h0IHJlZHVuZGFudCBpZiB3ZeKAmXJlIGpvaW5pbmcgb24gZmxpZ2h0Pw0KDQpBbHNv
LCBpbiBzcGl0ZSBvZiB0aGUgcGFyYWdyYXBoIGF0dGVtcHRpbmcgdG8gZXhwbGFpbiBpdCwgSeKA
mW0gYWZyYWlkIEkgZG9u4oCZdCB1bmRlcnN0YW5kIHdoYXQgdGhlIOKAnEFTIHN1YiBXSEVSRSBU
UlVF4oCdIGlzIGZvci4NCg0KQnV0IGl0IGxvb2tzIGxpa2UgdGhlIG5ldyBxdWVyeSBzaG91bGQg
ZG8gdGhlIHNhbWUgdGhpbmcgYXMgdGhlIG9sZCBxdWVyeSwgYXNzdW1pbmcgdGhhdCB0aGUgY29s
dW1ucyBmcm9tIHRoZSBzdWJxdWVyeSBhcmUgYWxsIHRoZSBjb2x1bW5zIHRoYXQgeW91IG5lZWQg
aW4gdGhlIGNvcnJlY3Qgb3JkZXIuDQoNCiAtR2VvcmdlDQoNCg==

