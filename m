Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFB6AEBC0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:40:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gKm-00010K-Bc; Tue, 10 Sep 2019 13:37:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M1KC=XF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i7gKl-000109-AS
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:37:27 +0000
X-Inumbo-ID: 20604640-d3d0-11e9-b299-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20604640-d3d0-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 13:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568122647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xQ5ZR1tDj65JQrot8nH5zMjCsaBMn7SmAUS+wlo3EKM=;
 b=IyRQYqXkjohCjvecSa4nm26NUBJN4WyPO6VEPdklEccdE51nLtmWA/62
 AjcuZiMZBJnRN0bUxr1WmVeez+QSEf2u2TnH1WXe08o5iP1Q38VMlEB6x
 4zPj3RPqBVaZ3ada4uNZNfiUlJ7p/4PM6F0hmdw4yTWAZ4ff3vHkFYDHF M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dR2aLHoYmO022M4a/DRQtLnfHO/a9ayItRlaOzG5HCgAp2calF93d8wFS03jHrmElBO7+iYGaM
 cMI2wHmqvRkN7lLpMyVdrdC4Vk9BGQwxMPqXfr7kuMdhFuzZpFCeAtqDLNYkw3IiUbm0rTVKN7
 uj3ChPDWoKIIDxtwMtqOicq+HL+bwDFKwphfPwZzaeT3NXPtoc/ian7yvQx2piZbeAhlcdbhnM
 4NFp3VVXOjnyKjLxnSfWbBvA5yiuP21+9X44w8tNlIGVXpa64CAxBrJhWmSkO8tEEcPuv4qYPk
 pnk=
X-SBRS: 2.7
X-MesageID: 5371482
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5371482"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 08/11] ioreq: allow decoding accesses to MMCFG regions
Thread-Index: AQHVYnK6HPxLNHZdKEiVk9AL9bXw3ack8W1Q
Date: Tue, 10 Sep 2019 13:37:22 +0000
Message-ID: <c0e071533f374c6083effd593c50ff5c@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-9-roger.pau@citrix.com>
In-Reply-To: <20190903161428.7159-9-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 08/11] ioreq: allow decoding accesses to
 MMCFG regions
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAwMyBTZXB0ZW1iZXIgMjAxOSAxNzoxNA0KPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsg
QW5kcmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHds
QHhlbi5vcmc+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggdjIgMDgvMTFdIGlvcmVxOiBhbGxvdyBkZWNvZGluZyBhY2Nlc3NlcyB0byBN
TUNGRyByZWdpb25zDQo+IA0KPiBQaWNrIHVwIG9uIHRoZSBpbmZyYXN0cnVjdHVyZSBhbHJlYWR5
IGFkZGVkIGZvciB2UENJIGFuZCBhbGxvdyBpb3JlcQ0KPiB0byBkZWNvZGUgYWNjZXNzZXMgdG8g
TU1DRkcgcmVnaW9ucyByZWdpc3RlcmVkIGZvciBhIGRvbWFpbi4gVGhpcw0KPiBpbmZyYXN0cnVj
dHVyZSBpcyBzdGlsbCBvbmx5IGFjY2Vzc2libGUgZnJvbSBpbnRlcm5hbCBjYWxsZXJzLCBzbw0K
PiBNTUNGRyByZWdpb25zIGNhbiBvbmx5IGJlIHJlZ2lzdGVyZWQgZnJvbSB0aGUgaW50ZXJuYWwg
ZG9tYWluIGJ1aWxkZXINCj4gdXNlZCBieSBQVkggZG9tMC4NCj4gDQo+IE5vdGUgdGhhdCB0aGUg
dlBDSSBpbmZyYXN0cnVjdHVyZSB0byBkZWNvZGUgYW5kIGhhbmRsZSBhY2Nlc3NlcyB0bw0KPiBN
TUNGRyByZWdpb25zIHdpbGwgYmUgcmVtb3ZlZCBpbiBmb2xsb3dpbmcgcGF0Y2hlcyB3aGVuIHZQ
Q0kgaXMNCj4gc3dpdGNoZWQgdG8gYmVjb21lIGFuIGludGVybmFsIGlvcmVxIHNlcnZlci4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pg0KDQpbc25pcF0NCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyBiL3hl
bi9hcmNoL3g4Ni9odm0vaW9yZXEuYw0KPiBpbmRleCA2MzM5ZTVmODg0Li5mZWNkYzI3ODZmIDEw
MDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMNCj4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS9pb3JlcS5jDQo+IEBAIC0xMDkwLDIxICsxMDkwLDM0IEBAIGludCBodm1fbWFwX2lv
X3JhbmdlX3RvX2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpkLCBpb3NlcnZpZF90IGlkLA0K
PiAgICAgICAgICAvKiBQQ0kgY29uZmlnIHNwYWNlIGFjY2Vzc2VzIGFyZSBoYW5kbGVkIGludGVy
bmFsbHkuICovDQo+ICAgICAgICAgIGlmICggc3RhcnQgPD0gMHhjZjggKyA4ICYmIDB4Y2Y4IDw9
IGVuZCApDQo+ICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gLSAgICAgICAgZWxzZQ0KPiAtICAg
ICAgICAgICAgLyogZmFsbHRocm91Z2guICovDQo+ICsgICAgICAgIGJyZWFrOw0KPiArDQo+ICAg
ICAgY2FzZSBYRU5fRE1PUF9JT19SQU5HRV9NRU1PUlk6DQo+ICsgICAgew0KPiArICAgICAgICBj
b25zdCBzdHJ1Y3QgaHZtX21tY2ZnICptbWNmZzsNCj4gKw0KPiArICAgICAgICByYyA9IC1FSU5W
QUw7DQo+ICsgICAgICAgIC8qIFBDSSBjb25maWcgc3BhY2UgYWNjZXNzZXMgYXJlIGhhbmRsZWQg
aW50ZXJuYWxseS4gKi8NCj4gKyAgICAgICAgcmVhZF9sb2NrKCZkLT5hcmNoLmh2bS5tbWNmZ19s
b2NrKTsNCj4gKyAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIG1tY2ZnLCAmZC0+YXJjaC5o
dm0ubW1jZmdfcmVnaW9ucywgbmV4dCApDQo+ICsgICAgICAgICAgICBpZiAoIHN0YXJ0IDw9IG1t
Y2ZnLT5hZGRyICsgbW1jZmctPnNpemUgJiYgbW1jZmctPmFkZHIgPD0gZW5kICkNCj4gKyAgICAg
ICAgICAgIHsNCj4gKyAgICAgICAgICAgICAgICByZWFkX3VubG9jaygmZC0+YXJjaC5odm0ubW1j
ZmdfbG9jayk7DQo+ICsgICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+ICsgICAgICAgICAgICB9
DQo+ICsgICAgICAgIHJlYWRfdW5sb2NrKCZkLT5hcmNoLmh2bS5tbWNmZ19sb2NrKTsNCj4gKyAg
ICAgICAgYnJlYWs7DQo+ICsgICAgfQ0KPiArDQoNCkxpa2Ugd2l0aCBjZjggcmVnaXN0cmF0aW9u
LCBJIGRvbid0IHRoaW5rIHlvdSB3YW50IHRvIGVycm9yIGhlcmUuIEl0J3MgbmV2ZXIgYmVlbiBh
IGhhcmQgZXJyb3IgZm9yIGFuIGV4dGVybmFsIGVtdWxhdG9yIHRvIGF0dGVtcHQgdG8gcmVnaXN0
ZXIgZm9yIGFjY2Vzc2VzIHRoYXQgYXJlIGFjdHVhbGx5IGhhbmRsZWQgd2l0aGluIFhlbi4gRG9p
bmcgc28gd291bGQgbWVhbiB0aGF0IHdlIG1heSBuZWVkIHRvIHRlYWNoIFFFTVUgd2hhdCBYZW4g
ZG9lcyBhbmQgZG9lc24ndCBkZWFsIHdpdGggaW50ZXJuYWxseSBhbmQgdGhhdCBzZWVtcyBsaWtl
IGFuIHVubmVjZXNzYXJ5IGhlYWRhY2hlLg0KDQogIFBhdWwNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
