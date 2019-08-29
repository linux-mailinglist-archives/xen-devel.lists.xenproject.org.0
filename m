Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B950CA270A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 21:10:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3PlK-0000Rb-G3; Thu, 29 Aug 2019 19:07:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U2d+=WZ=amazon.de=prvs=137313476=wipawel@srs-us1.protection.inumbo.net>)
 id 1i3PlI-0000RM-Jn
 for xen-devel@lists.xen.org; Thu, 29 Aug 2019 19:07:12 +0000
X-Inumbo-ID: 33d121f2-ca90-11e9-b95f-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33d121f2-ca90-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 19:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1567105631; x=1598641631;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=bhtNNDDHIOYC738vSlm+zAYW1pc135Ae3EBs1RlnPXE=;
 b=VUWD7KQTSK9Hb0Vr/q23JI9Pz/wT0x0BicMj5CbF8OxWEOoW6zxFO7BW
 9Ai8qKkQhAWXKjKkKV8wzmZtMWv5zhQHPsjYPjNWO9nbVppacJsYZ5f5B
 GCYQy0D2siNg+6k+VvTVo4QRv2RqGvCimVNvRIoYlFmVP4K2gThaXbnV5 I=;
X-Amazon-filename: 0001-fixup-livepatch-Add-support-for-inline-asm-hotpatchi.patch, ATT00001.htm
X-IronPort-AV: E=Sophos;i="5.64,444,1559520000"; 
 d="htm'217?scan'217,208,217,223";a="825287545"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 29 Aug 2019 19:07:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 42D34A2300; Thu, 29 Aug 2019 19:07:02 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 29 Aug 2019 19:07:01 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 29 Aug 2019 19:07:00 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Thu, 29 Aug 2019 19:07:00 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Thread-Topic: [PATCH v2 08/12] livepatch: Add support for inline asm
 hotpatching expectations
Thread-Index: AQHVXLP51E8R16KsHkWyQYj+DxGXAqcSS+6AgAAE0YCAABn6AIAAFbyA
Date: Thu, 29 Aug 2019 19:07:00 +0000
Message-ID: <1FA2BDAE-B2A3-41A3-BAF8-BAB61607610C@amazon.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
 <20190827084624.116917-9-wipawel@amazon.de>
 <20190829155851.GA44799@konrads-mbp.lan>
 <A452587B-AE71-4848-81FD-8D3D2BCE4CEF@amazon.com>
 <20190829174912.GA22880@char.us.oracle.com>
In-Reply-To: <20190829174912.GA22880@char.us.oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
Content-Type: multipart/mixed;
 boundary="_005_1FA2BDAEB2A341A3BAF8BAB61607610Camazoncom_"
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 08/12] livepatch: Add support for inline
 asm hotpatching expectations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_005_1FA2BDAEB2A341A3BAF8BAB61607610Camazoncom_
Content-Type: multipart/alternative;
	boundary="_000_1FA2BDAEB2A341A3BAF8BAB61607610Camazoncom_"

--_000_1FA2BDAEB2A341A3BAF8BAB61607610Camazoncom_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

DQoNCk9uIDI5LiBBdWcgMjAxOSwgYXQgMTk6NDksIEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbTxtYWlsdG86a29ucmFkLndpbGtAb3JhY2xlLmNvbT4+IHdyb3Rl
Og0KDQpPbiBUaHUsIEF1ZyAyOSwgMjAxOSBhdCAwNDoxNjoxM1BNICswMDAwLCBXaWVjem9ya2ll
d2ljeiwgUGF3ZWwgd3JvdGU6DQoNCg0KT24gMjkuIEF1ZyAyMDE5LCBhdCAxNzo1OCwgS29ucmFk
IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPG1haWx0bzprb25yYWQud2ls
a0BvcmFjbGUuY29tPjxtYWlsdG86a29ucmFkLndpbGtAb3JhY2xlLmNvbT4+IHdyb3RlOg0KDQoN
Cg0K4oCmc25pcC4uDQoNCg0KQ291bGQgeW91IHBsZWFzZSB0cnkgd2l0aCB0aGUgcGF0Y2ggYXR0
YWNoZWQ/DQoNCkl0IGNvbXBpbGVkLCBidXQgdGhlIHRlc3QtY2FzZSB3YXMgbm90IGhhcHB5LiBT
ZWUgYXR0YWNoZWQgdGhlIGZ1bGwgc2VyaWFsIGxvZw0KDQoNCkFoLCBJIGZvcmdvdCBhYm91dCBl
bmRpYW5uZXNzIG9mIGNvdXJzZS4uLg0KSSBhbSBzZW5kaW5nIGFuIGltcHJvdmVkIHBhdGNoLiBJ
IGhvcGUgaXQgd29ya3MgdGhpcyB0aW1lIGFzIGV4cGVjdGVkLg0KDQoNCg0KDQoNCkFtYXpvbiBE
ZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJIDQpLcmF1c2Vuc3RyLiAzOA0KMTAxMTcgQmVy
bGluDQpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJp
Y2gNCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAx
NDkxNzMgQg0KU2l0ejogQmVybGluDQpVc3QtSUQ6IERFIDI4OSAyMzcgODc5DQoNCg0KDQoNCg0K
SWYgaXQgc3RpbGwgZmFpbHMsIGNvdWxkIHlvdSBwbGVhc2Ugc2VuZCBtZSB0aGUgb3V0cHV0IGZv
ciB0aGUgZm9sbG93aW5nDQpjb21tYW5kIHdpdGggdGhpcyBidWlsZD8NCg0Kb2JqZHVtcCAtZCB4
ZW4tc3ltcyB8IHNlZCAtbiAtZSAnLzx4ZW5fZXh0cmFfdmVyc2lvbj46JC8sL14kLyBwJyB8IHRh
aWwgLW4gKzINCg0KQWxzbyBpbmNsdWRlZCBpbiB0aGUgc2VyaWFsIGxvZy4NCg0KDQpCZXN0IFJl
Z2FyZHMsDQpQYXdlbCBXaWVjem9ya2lld2ljeg0KDQoNCg0KDQo8bGl2ZXBhdGNoLWhpa2V5OTYw
LnR4dD4NCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5z
dHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVn
ZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1
cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5
CgoK

--_000_1FA2BDAEB2A341A3BAF8BAB61607610Camazoncom_
Content-Type: text/html; charset="utf-8"
Content-ID: <04AFA72F4F997645B0181377D1552032@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDI5LiBBdWcgMjAxOSwgYXQgMTk6NDksIEtvbnJhZCBSemVzenV0ZWsgV2lsayAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOmtvbnJhZC53aWxrQG9yYWNsZS5jb20iIGNsYXNzPSIiPmtvbnJhZC53aWxrQG9y
YWNsZS5jb208L2E+Jmd0OyB3cm90ZTo8L2Rpdj4NCjxiciBjbGFzcz0iQXBwbGUtaW50ZXJjaGFu
Z2UtbmV3bGluZSI+DQo8ZGl2IGNsYXNzPSIiPg0KPGRpdiBjbGFzcz0iIj5PbiBUaHUsIEF1ZyAy
OSwgMjAxOSBhdCAwNDoxNjoxM1BNICYjNDM7MDAwMCwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdy
b3RlOjxiciBjbGFzcz0iIj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNsYXNzPSIiPjxiciBj
bGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCk9uIDI5LiBBdWcgMjAxOSwgYXQgMTc6NTgsIEtvbnJh
ZCBSemVzenV0ZWsgV2lsayAmbHQ7PGEgaHJlZj0ibWFpbHRvOmtvbnJhZC53aWxrQG9yYWNsZS5j
b20iIGNsYXNzPSIiPmtvbnJhZC53aWxrQG9yYWNsZS5jb208L2E+Jmx0OzxhIGhyZWY9Im1haWx0
bzprb25yYWQud2lsa0BvcmFjbGUuY29tIiBjbGFzcz0iIj5tYWlsdG86a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbTwvYT4mZ3Q7Jmd0OyB3cm90ZTo8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+DQo8
YnIgY2xhc3M9IiI+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3Rl
Pg0KPGRpdj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXY+4oCmc25pcC4uPC9kaXY+DQo8YnIg
Y2xhc3M9IiI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9
IiI+DQo8ZGl2IGNsYXNzPSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+PGJy
IGNsYXNzPSIiPg0KQ291bGQgeW91IHBsZWFzZSB0cnkgd2l0aCB0aGUgcGF0Y2ggYXR0YWNoZWQ/
PGJyIGNsYXNzPSIiPg0KPC9ibG9ja3F1b3RlPg0KPGJyIGNsYXNzPSIiPg0KSXQgY29tcGlsZWQs
IGJ1dCB0aGUgdGVzdC1jYXNlIHdhcyBub3QgaGFwcHkuIFNlZSBhdHRhY2hlZCB0aGUgZnVsbCBz
ZXJpYWwgbG9nPGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8L2Rpdj4NCjwv
YmxvY2txdW90ZT4NCjxkaXY+PGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8ZGl2PkFoLCBJIGZvcmdv
dCBhYm91dCBlbmRpYW5uZXNzIG9mIGNvdXJzZS4uLjwvZGl2Pg0KPGRpdj5JIGFtIHNlbmRpbmcg
YW4gaW1wcm92ZWQgcGF0Y2guIEkgaG9wZSBpdCB3b3JrcyB0aGlzIHRpbWUgYXMgZXhwZWN0ZWQu
PC9kaXY+DQo8YnIgY2xhc3M9IiI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjbGFzcz0iIj4N
CjxkaXYgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIg
Y2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KPGJy
IGNsYXNzPSIiPg0KQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkg8YnIgY2xh
c3M9IiI+DQpLcmF1c2Vuc3RyLiAzODxiciBjbGFzcz0iIj4NCjEwMTE3IEJlcmxpbjxiciBjbGFz
cz0iIj4NCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJi
cmljaDxiciBjbGFzcz0iIj4NCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5i
dXJnIHVudGVyIEhSQiAxNDkxNzMgQjxiciBjbGFzcz0iIj4NClNpdHo6IEJlcmxpbjxiciBjbGFz
cz0iIj4NClVzdC1JRDogREUgMjg5IDIzNyA4Nzk8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+
DQo8YnIgY2xhc3M9IiI+DQo8L2Jsb2NrcXVvdGU+DQo8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9
IiI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQpJZiBp
dCBzdGlsbCBmYWlscywgY291bGQgeW91IHBsZWFzZSBzZW5kIG1lIHRoZSBvdXRwdXQgZm9yIHRo
ZSBmb2xsb3dpbmc8YnIgY2xhc3M9IiI+DQpjb21tYW5kIHdpdGggdGhpcyBidWlsZD88YnIgY2xh
c3M9IiI+DQo8YnIgY2xhc3M9IiI+DQpvYmpkdW1wIC1kIHhlbi1zeW1zIHwgc2VkIC1uIC1lICcv
Jmx0O3hlbl9leHRyYV92ZXJzaW9uJmd0OzokLywvXiQvIHAnIHwgdGFpbCAtbiAmIzQzOzI8YnIg
Y2xhc3M9IiI+DQo8L2Jsb2NrcXVvdGU+DQo8YnIgY2xhc3M9IiI+DQpBbHNvIGluY2x1ZGVkIGlu
IHRoZSBzZXJpYWwgbG9nLjxiciBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxibG9ja3F1b3Rl
IHR5cGU9ImNpdGUiIGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCkJlc3QgUmVnYXJkcyw8YnIgY2xh
c3M9IiI+DQpQYXdlbCBXaWVjem9ya2lld2ljejxiciBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4N
CjxiciBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjwvYmxvY2txdW90ZT4NCjxiciBjbGFzcz0i
Ij4NCjxzcGFuIGlkPSJjaWQ6QUJBNDIxN0EtNDAyRS00OUM4LTlGOTYtQzg2Q0E2M0UyMDg5QGFt
YXpvbi5jb20iPiZsdDtsaXZlcGF0Y2gtaGlrZXk5NjAudHh0Jmd0Ozwvc3Bhbj48L2Rpdj4NCjwv
ZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8YnI+PGJyPjxicj5BbWF6b24gRGV2ZWxvcG1l
bnQgQ2VudGVyIEdlcm1hbnkgR21iSAo8YnI+S3JhdXNlbnN0ci4gMzgKPGJyPjEwMTE3IEJlcmxp
bgo8YnI+R2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJy
aWNoCjxicj5FaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBI
UkIgMTQ5MTczIEIKPGJyPlNpdHo6IEJlcmxpbgo8YnI+VXN0LUlEOiBERSAyODkgMjM3IDg3OQo8
YnI+PGJyPjxicj4KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_1FA2BDAEB2A341A3BAF8BAB61607610Camazoncom_--

--_005_1FA2BDAEB2A341A3BAF8BAB61607610Camazoncom_
Content-Type: application/octet-stream;
	name="0001-fixup-livepatch-Add-support-for-inline-asm-hotpatchi.patch"
Content-Description: 0001-fixup-livepatch-Add-support-for-inline-asm-hotpatchi.patch
Content-Disposition: attachment;
	filename="0001-fixup-livepatch-Add-support-for-inline-asm-hotpatchi.patch";
	size=1460; creation-date="Thu, 29 Aug 2019 19:07:00 GMT";
	modification-date="Thu, 29 Aug 2019 19:07:00 GMT"
Content-ID: <185BF70CC9E27840A3D0EB4F846E504B@amazon.com>
Content-Transfer-Encoding: base64

RnJvbSAzZTBlYjBjZjM3ZGRiMTk3Y2RiY2FmNTg3YjhiYTZhNmExYmFkYmNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24u
ZGU+CkRhdGU6IFRodSwgMjkgQXVnIDIwMTkgMTU6NDM6MjMgKzAwMDAKU3ViamVjdDogW1BBVENI
XSBmaXh1cCEgbGl2ZXBhdGNoOiBBZGQgc3VwcG9ydCBmb3IgaW5saW5lIGFzbSBob3RwYXRjaGlu
ZwogZXhwZWN0YXRpb25zCgotLS0KIHhlbi90ZXN0L2xpdmVwYXRjaC9NYWtlZmlsZSB8IDQgKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUgYi94ZW4vdGVzdC9saXZlcGF0Y2gv
TWFrZWZpbGUKaW5kZXggMDY3ODYxOTAzZi4uYTc4NTdkM2EyZSAxMDA2NDQKLS0tIGEveGVuL3Rl
c3QvbGl2ZXBhdGNoL01ha2VmaWxlCisrKyBiL3hlbi90ZXN0L2xpdmVwYXRjaC9NYWtlZmlsZQpA
QCAtMTg2LDEwICsxODYsMTAgQEAgeGVuX2FjdGlvbnNfaG9va3Nfbm9yZXZlcnQubzogY29uZmln
LmgKICQoTElWRVBBVENIX0FDVElPTl9IT09LU19OT1JFVkVSVCk6IHhlbl9hY3Rpb25faG9va3Nf
bWFya2VyLm8geGVuX2hlbGxvX3dvcmxkX2Z1bmMubyBub3RlLm8geGVuX25vdGUubwogCSQoTEQp
ICQoTERGTEFHUykgJChidWlsZF9pZF9saW5rZXIpIC1yIC1vICQoTElWRVBBVENIX0FDVElPTl9I
T09LU19OT1JFVkVSVCkgJF4KIAotQ09ERV9HRVRfRVhQRUNUPSQoc2hlbGwgb2JqZHVtcCAtZCAt
LWluc24td2lkdGg9MSAkKDEpIHwgZ3JlcCAtQTYgLUUgJzwnJCgyKSc+OicgfCB0YWlsIC1uICsy
IHwgYXdrICdCRUdJTiB7cHJpbnRmICJ7In0ge3ByaW50ZiAiMHglcywiLCAkJDJ9JyB8IHNlZCAn
cy8sJCQvfS9nJykKK0VYUEVDVF9CWVRFU19DT1VOVCA6PSA4CitDT0RFX0dFVF9FWFBFQ1Q9JChz
aGVsbCAkKE9CSkRVTVApIC1kIC0taW5zbi13aWR0aD0xICQoMSkgfCBzZWQgLW4gLWUgJy88JyQo
MiknPjokJC8sL14kJC8gcCcgfCB0YWlsIC1uICsyIHwgaGVhZCAtbiAkKEVYUEVDVF9CWVRFU19D
T1VOVCkgfCBhd2sgJyQkMD0kJDIge3ByaW50ZiAiJXMiLCBzdWJzdHIoJCQwLGxlbmd0aC0xKX0n
IHwgc2VkICdzLy5cezJcfS8weCYsL2cnIHwgc2VkICdzL14vey87cy8sJCQvfS9nJykKIC5QSE9O
WTogZXhwZWN0X2NvbmZpZy5oCiBleHBlY3RfY29uZmlnLmg6IEVYUEVDVF9CWVRFUz0kKGNhbGwg
Q09ERV9HRVRfRVhQRUNULCQoQkFTRURJUikveGVuLXN5bXMseGVuX2V4dHJhX3ZlcnNpb24pCi1l
eHBlY3RfY29uZmlnLmg6IEVYUEVDVF9CWVRFU19DT1VOVD02CiBleHBlY3RfY29uZmlnLmg6IHhl
bl9leHBlY3RhdGlvbnMubwogCShzZXQgLWU7IFwKIAkgZWNobyAiI2RlZmluZSBFWFBFQ1RfQllU
RVMgJChFWFBFQ1RfQllURVMpIjsgXAotLSAKMi4xNi41Cgo=

--_005_1FA2BDAEB2A341A3BAF8BAB61607610Camazoncom_
Content-Type: text/html; name="ATT00001.htm"
Content-Description: ATT00001.htm
Content-Disposition: attachment; filename="ATT00001.htm"; size=853;
	creation-date="Thu, 29 Aug 2019 19:07:00 GMT";
	modification-date="Thu, 29 Aug 2019 19:07:00 GMT"
Content-ID: <2A89F61BA0B19745AF838763481BACE0@amazon.com>
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXMtYXNjaWkiPjwvaGVhZD48Ym9keSBzdHlsZT0id29yZC13cmFwOiBi
cmVhay13b3JkOyAtd2Via2l0LW5ic3AtbW9kZTogc3BhY2U7IGxpbmUtYnJlYWs6IGFmdGVyLXdo
aXRlLXNwYWNlOyIgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPjxkaXYgY2xhc3M9IiI+DQo8ZGl2IGRp
cj0iYXV0byIgc3R5bGU9IndvcmQtd3JhcDogYnJlYWstd29yZDsgLXdlYmtpdC1uYnNwLW1vZGU6
IHNwYWNlOyBsaW5lLWJyZWFrOiBhZnRlci13aGl0ZS1zcGFjZTsiIGNsYXNzPSIiPjxkaXYgc3R5
bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQt
ZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9ybWFsOyBm
b250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogbm9ybWFsOyBsZXR0ZXItc3Bh
Y2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10
cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAt
d2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsiPkJl
c3QgUmVnYXJkcyw8YnIgY2xhc3M9IiI+UGF3ZWwgV2llY3pvcmtpZXdpY3o8L2Rpdj48YnIgY2xh
c3M9IkFwcGxlLWludGVyY2hhbmdlLW5ld2xpbmUiPjwvZGl2PjxiciBjbGFzcz0iQXBwbGUtaW50
ZXJjaGFuZ2UtbmV3bGluZSI+DQo8L2Rpdj4NCjxiciBjbGFzcz0iIj48L2JvZHk+PC9odG1sPg==

--_005_1FA2BDAEB2A341A3BAF8BAB61607610Camazoncom_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--_005_1FA2BDAEB2A341A3BAF8BAB61607610Camazoncom_--


