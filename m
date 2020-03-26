Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973C21936A9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 04:21:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHJ20-0008LG-6K; Thu, 26 Mar 2020 03:18:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ASzm=5L=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jHJ1y-0008LB-KI
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 03:18:06 +0000
X-Inumbo-ID: 67b6cfba-6f10-11ea-a6c1-bc764e2007e4
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67b6cfba-6f10-11ea-a6c1-bc764e2007e4;
 Thu, 26 Mar 2020 03:18:04 +0000 (UTC)
IronPort-SDR: yGKpKr3XmpRoGh4jmyg4W1uAevD2QLjZiD1ON2byDidsqEuEyPUs3q/9dSk6olm9LYhGPaJzmR
 hEsj/u6HM1QA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 20:18:03 -0700
IronPort-SDR: fZs7oxBOSssz8Mn6dBx+7e8vlZWmE/cZGX22s82Fq3c3SWFcJb/CFiSlWr2ArxDuHo4l5XOThg
 qS48MIVfjiYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="448481751"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga006.fm.intel.com with ESMTP; 25 Mar 2020 20:18:03 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Mar 2020 20:18:03 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Mar 2020 20:18:03 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.144]) with mapi id 14.03.0439.000;
 Thu, 26 Mar 2020 11:18:00 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 4/4] x86/nvmx: update exit bitmap when using virtual
 interrupt delivery
Thread-Index: AQHWAo7oQ2VIPQB0qEy5IngbZ76c4ahaNBZg
Date: Thu, 26 Mar 2020 03:17:59 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EA7AD@SHSMSX104.ccr.corp.intel.com>
References: <20200325101910.29168-1-roger.pau@citrix.com>
 <20200325101910.29168-5-roger.pau@citrix.com>
In-Reply-To: <20200325101910.29168-5-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/4] x86/nvmx: update exit bitmap when
 using virtual interrupt delivery
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIE1hcmNoIDI1LCAyMDIwIDY6MTkgUE0NCj4gDQo+IEZvcmNlIGFuIHVwZGF0ZSBv
ZiB0aGUgRU9JIGV4aXQgYml0bWFwIGluIG52bXhfdXBkYXRlX2FwaWN2LCBiZWNhdXNlDQo+IHRo
ZSBvbmUgcGVyZm9ybWVkIGluIHZteF9pbnRyX2Fzc2lzdCBtaWdodCBub3QgYmUgcmVhY2hlZCBp
ZiB0aGUNCj4gaW50ZXJydXB0IGlzIGludGVyY2VwdGVkIGJ5IG52bXhfaW50cl9pbnRlcmNlcHQg
cmV0dXJuaW5nIHRydWUuDQo+IA0KPiBFeHRyYWN0IHRoZSBjb2RlIHRvIHVwZGF0ZSB0aGUgZXhp
dCBiaXRtYXAgZnJvbSB2bXhfaW50cl9hc3Npc3QgaW50byBhDQo+IGhlbHBlciBhbmQgdXNlIGl0
IGluIG52bXhfdXBkYXRlX2FwaWN2Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0K
PiAgLSBSZXdvcmQgY29tbWl0IG1lc3NhZ2UuDQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS92
bXgvaW50ci5jICAgICAgIHwgMjEgKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICB4ZW4vYXJjaC94
ODYvaHZtL3ZteC92dm14LmMgICAgICAgfCAgMiArKw0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vdm14L3ZteC5oIHwgIDIgKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3Zt
eC9pbnRyLmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC9pbnRyLmMNCj4gaW5kZXggNDlhMTI5NWYw
OS4uMDAwZTE0YWY0OSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvaW50ci5j
DQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L2ludHIuYw0KPiBAQCAtMjI0LDYgKzIyNCwx
OCBAQCBzdGF0aWMgaW50IG52bXhfaW50cl9pbnRlcmNlcHQoc3RydWN0IHZjcHUgKnYsIHN0cnVj
dA0KPiBodm1faW50YWNrIGludGFjaykNCj4gICAgICByZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICt2
b2lkIHZteF9zeW5jX2V4aXRfYml0bWFwKHN0cnVjdCB2Y3B1ICp2KQ0KPiArew0KPiArICAgIGNv
bnN0IHVuc2lnbmVkIGludCBuID0gQVJSQVlfU0laRSh2LT5hcmNoLmh2bS52bXguZW9pX2V4aXRf
Yml0bWFwKTsNCj4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gKw0KPiArICAgIHdoaWxlICggKGkg
PSBmaW5kX2ZpcnN0X2JpdCgmdi0+YXJjaC5odm0udm14LmVvaV9leGl0bWFwX2NoYW5nZWQsIG4p
KSA8DQo+IG4gKQ0KPiArICAgIHsNCj4gKyAgICAgICAgY2xlYXJfYml0KGksICZ2LT5hcmNoLmh2
bS52bXguZW9pX2V4aXRtYXBfY2hhbmdlZCk7DQo+ICsgICAgICAgIF9fdm13cml0ZShFT0lfRVhJ
VF9CSVRNQVAoaSksIHYtPmFyY2guaHZtLnZteC5lb2lfZXhpdF9iaXRtYXBbaV0pOw0KPiArICAg
IH0NCj4gK30NCj4gKw0KPiAgdm9pZCB2bXhfaW50cl9hc3Npc3Qodm9pZCkNCj4gIHsNCj4gICAg
ICBzdHJ1Y3QgaHZtX2ludGFjayBpbnRhY2s7DQo+IEBAIC0zMTgsNyArMzMwLDYgQEAgdm9pZCB2
bXhfaW50cl9hc3Npc3Qodm9pZCkNCj4gICAgICAgICAgICAgICAgaW50YWNrLnNvdXJjZSAhPSBo
dm1faW50c3JjX3ZlY3RvciApDQo+ICAgICAgew0KPiAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0
YXR1czsNCj4gLSAgICAgICAgdW5zaWduZWQgaW50IGksIG47DQo+IA0KPiAgICAgICAgIC8qDQo+
ICAgICAgICAgICogaW50YWNrLnZlY3RvciBpcyB0aGUgaGlnaGVzdCBwcmlvcml0eSB2ZWN0b3Iu
IFNvIHdlIHNldCBlb2lfZXhpdF9iaXRtYXANCj4gQEAgLTM3OSwxMyArMzkwLDcgQEAgdm9pZCB2
bXhfaW50cl9hc3Npc3Qodm9pZCkNCj4gICAgICAgICAgICAgICAgICAgICAgaW50YWNrLnZlY3Rv
cjsNCj4gICAgICAgICAgX192bXdyaXRlKEdVRVNUX0lOVFJfU1RBVFVTLCBzdGF0dXMpOw0KPiAN
Cj4gLSAgICAgICAgbiA9IEFSUkFZX1NJWkUodi0+YXJjaC5odm0udm14LmVvaV9leGl0X2JpdG1h
cCk7DQo+IC0gICAgICAgIHdoaWxlICggKGkgPSBmaW5kX2ZpcnN0X2JpdCgmdi0+YXJjaC5odm0u
dm14LmVvaV9leGl0bWFwX2NoYW5nZWQsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBuKSkgPCBuICkNCj4gLSAgICAgICAgew0KPiAtICAgICAgICAgICAgY2xlYXJfYml0
KGksICZ2LT5hcmNoLmh2bS52bXguZW9pX2V4aXRtYXBfY2hhbmdlZCk7DQo+IC0gICAgICAgICAg
ICBfX3Ztd3JpdGUoRU9JX0VYSVRfQklUTUFQKGkpLCB2LT5hcmNoLmh2bS52bXguZW9pX2V4aXRf
Yml0bWFwW2ldKTsNCj4gLSAgICAgICAgfQ0KPiArICAgICAgICB2bXhfc3luY19leGl0X2JpdG1h
cCh2KTsNCj4gDQo+ICAgICAgICAgIHB0X2ludHJfcG9zdCh2LCBpbnRhY2spOw0KPiAgICAgIH0N
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3Z2bXguYw0KPiBpbmRleCA4NDMxYzkxMmExLi44NDVkZDg3Zjc1IDEwMDY0NA0K
PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMNCj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS92bXgvdnZteC5jDQo+IEBAIC0xNDE4LDYgKzE0MTgsOCBAQCBzdGF0aWMgdm9pZCBudm14
X3VwZGF0ZV9hcGljdihzdHJ1Y3QgdmNwdSAqdikNCj4gICAgICAgICAgc3RhdHVzIHw9IHJ2aSAm
IFZNWF9HVUVTVF9JTlRSX1NUQVRVU19TVUJGSUVMRF9CSVRNQVNLOw0KPiAgICAgICAgICBfX3Zt
d3JpdGUoR1VFU1RfSU5UUl9TVEFUVVMsIHN0YXR1cyk7DQo+ICAgICAgfQ0KPiArDQo+ICsgICAg
dm14X3N5bmNfZXhpdF9iaXRtYXAodik7DQoNClNpbWlsYXJseSwgSSdkIGxpa2UgdG8gZG8gdGhl
IHN5bmMgd2l0aGluIHRoZSBjb25kaXRpb25hbCBibG9jaywgd2hlbiBpbnRyDQpzdGF0dXMgaXMg
YWN0dWFsbHkgY2hhbmdlZC4gT3RoZXJ3aXNlLCBpdCBiZWNvbWVzIGNoZWNraW5nIGJpdG1hcCBj
aGFuZ2UNCmluIGV2ZXJ5IHZtZW50cnkgd2hlbiBhcGljdiBpcyBlbmFibGVkLg0KDQo+ICB9DQo+
IA0KPiAgc3RhdGljIHZvaWQgdmlydHVhbF92bWV4aXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MpDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm14LmggYi94
ZW4vaW5jbHVkZS9hc20tDQo+IHg4Ni9odm0vdm14L3ZteC5oDQo+IGluZGV4IGIzMzRlMWVjOTQu
LjExMWNjZDdlNjEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92
bXguaA0KPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm14LmgNCj4gQEAgLTYx
MCw2ICs2MTAsOCBAQCB2b2lkIHVwZGF0ZV9ndWVzdF9laXAodm9pZCk7DQo+ICB2b2lkIHZteF9w
aV9wZXJfY3B1X2luaXQodW5zaWduZWQgaW50IGNwdSk7DQo+ICB2b2lkIHZteF9waV9kZXNjX2Zp
eHVwKHVuc2lnbmVkIGludCBjcHUpOw0KPiANCj4gK3ZvaWQgdm14X3N5bmNfZXhpdF9iaXRtYXAo
c3RydWN0IHZjcHUgKnYpOw0KPiArDQo+ICAjaWZkZWYgQ09ORklHX0hWTQ0KPiAgdm9pZCB2bXhf
cGlfaG9va3NfYXNzaWduKHN0cnVjdCBkb21haW4gKmQpOw0KPiAgdm9pZCB2bXhfcGlfaG9va3Nf
ZGVhc3NpZ24oc3RydWN0IGRvbWFpbiAqZCk7DQo+IC0tDQo+IDIuMjYuMA0KDQo=

