Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC40108C5A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 11:55:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZC00-0006i7-Mu; Mon, 25 Nov 2019 10:53:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xvqO=ZR=amazon.com=prvs=225c401bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZBzz-0006i2-KM
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 10:53:43 +0000
X-Inumbo-ID: d8c74cce-0f71-11ea-b08b-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8c74cce-0f71-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574679224; x=1606215224;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lVsf6qCHya8cb9BDhWJKU5vUPAEiWRObNFQh845Z5us=;
 b=d6zGQ/N6GEHp7PIJeJgirtu4fy+ZUa5dp3oFegFojFvDdlzwiCo25qte
 HlvmBdsb440CM5uFAsMj8n5fD1l52nYdQoAa9MQUwNl2c8sYc7t00QMEK
 xxNV5FA87KRlHGHANMqNHj0OGpXaQZVbzuS0AWSvcgf86DCuuIuWk+mAL 4=;
IronPort-SDR: uMqIpgxvcSrrVbL5sJ4os2X+7cT14kvogsYBKQM0WqwQMwDKw6U3StBsUni+shbqcZiu52XH/9
 Kknne76R193A==
X-IronPort-AV: E=Sophos;i="5.69,241,1571702400"; 
   d="scan'208";a="4753344"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 25 Nov 2019 10:53:42 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 26C88A1E05; Mon, 25 Nov 2019 10:53:40 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 25 Nov 2019 10:53:39 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 25 Nov 2019 10:53:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 25 Nov 2019 10:53:38 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v3 1/3] introduce GFN notification for
 translated domains
Thread-Index: AQHVo3b/6uDP9z2g1Ey0UMYoj1NXIqebsCcwgAAFb4CAAAB4cA==
Date: Mon, 25 Nov 2019 10:53:38 +0000
Message-ID: <89d2dc44e2004f3ab4129226dffca194@EX13D32EUC003.ant.amazon.com>
References: <62a3d98f-8173-1b13-f20e-9bd000f0923f@suse.com>
 <db8a9729-8408-c4a2-e28b-042c72bae186@suse.com>
 <0380ff3e991e4857b7c77e9d97edbcf4@EX13D32EUC003.ant.amazon.com>
 <bc008f88-6630-a42e-9de8-3816c42a6c92@suse.com>
In-Reply-To: <bc008f88-6630-a42e-9de8-3816c42a6c92@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.185]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 1/3] introduce GFN notification for
 translated domains
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Sander
 Eikelenboom <linux@eikelenboom.it>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI1IE5vdmVtYmVyIDIwMTkgMTA6NTENCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT47IFJvZ2VyDQo+IFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU2FuZGVyIEVpa2VsZW5ib29tDQo+IDxsaW51eEBl
aWtlbGVuYm9vbS5pdD47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNv
bT47DQo+IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJh
ZCBXaWxrDQo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPjsgSnVsaWVuIEdyYWxsDQo+IDxqdWxpZW5AeGVuLm9yZz47IFdlaSBMaXUgPHds
QHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjMgMS8zXSBpbnRy
b2R1Y2UgR0ZOIG5vdGlmaWNhdGlvbiBmb3INCj4gdHJhbnNsYXRlZCBkb21haW5zDQo+IA0KPiBP
biAyNS4xMS4yMDE5IDExOjM3LCAgRHVycmFudCwgUGF1bCAgd3JvdGU6DQo+ID4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5j
ZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBKYW4NCj4gPj4gQmV1bGlj
aA0KPiA+PiBTZW50OiAyNSBOb3ZlbWJlciAyMDE5IDA5OjU4DQo+ID4+DQo+ID4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4gPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYw0K
PiA+PiBAQCAtNDMwNCw5ICs0MzA0LDE3IEBAIHN0YXRpYyBpbnQgaHZtb3Bfc2V0X3BhcmFtKA0K
PiA+PiAgICAgICAgICBpZiAoIGEudmFsdWUgPiBTSFVURE9XTl9NQVggKQ0KPiA+PiAgICAgICAg
ICAgICAgcmMgPSAtRUlOVkFMOw0KPiA+PiAgICAgICAgICBicmVhazsNCj4gPj4gKw0KPiA+PiAg
ICAgIGNhc2UgSFZNX1BBUkFNX0lPUkVRX1NFUlZFUl9QRk46DQo+ID4+IC0gICAgICAgIGQtPmFy
Y2guaHZtLmlvcmVxX2dmbi5iYXNlID0gYS52YWx1ZTsNCj4gPj4gKyAgICAgICAgaWYgKCBkLT5h
cmNoLmh2bS5wYXJhbXNbSFZNX1BBUkFNX05SX0lPUkVRX1NFUlZFUl9QQUdFU10gKQ0KPiA+PiAr
ICAgICAgICAgICAgcmMgPSBub3RpZnlfZ2ZuKA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAg
ZCwNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgIF9nZm4oYS52YWx1ZSArIGQtPmFyY2guaHZt
LnBhcmFtcw0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW0hWTV9Q
QVJBTV9OUl9JT1JFUV9TRVJWRVJfUEFHRVNdDQo+IC0NCj4gPj4gMSkpOw0KPiA+DQo+ID4gSUlS
QyB0aGUgUEZOIGlzIHR5cGljYWxseSBzZXQgYnkgdGhlIHRvb2xzdGFjayBiZWZvcmUgdGhlIG51
bWJlciBvZg0KPiA+IHBhZ2VzLCBzbyB0aGUgbm90aWZ5IHdpbGwgYmUgZm9yIGEudmFsdWUgLSAx
LCBpLmUuIHRoZSBwcmV2aW91cyBnZm4uDQo+ID4gSXMgdGhhdCBhIHByb2JsZW0/DQo+IA0KPiBU
aGVyZSdzIGFuIGlmKCkgYXJvdW5kIHRoZSBpbnZvY2F0aW9uIHRvIGF2b2lkIHRoaXMgc2l0dWF0
aW9uLCBzbyBJJ20NCj4gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgcXVlc3Rpb24uDQoN
CkQnb2guLi4gTWlzc2VkIGl0LiBTb3JyeSBmb3IgdGhlIG5vaXNlLg0KDQogIFBhdWwNCg0KPiAN
Cj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
