Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970A716FF4B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:49:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6w6N-0002fd-Fu; Wed, 26 Feb 2020 12:47:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sq7e=4O=intel.com=farrah.chen@srs-us1.protection.inumbo.net>)
 id 1j6w6L-0002d6-O0
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:47:45 +0000
X-Inumbo-ID: 27fcfcd6-5896-11ea-940c-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27fcfcd6-5896-11ea-940c-12813bfff9fa;
 Wed, 26 Feb 2020 12:47:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 04:47:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; d="scan'208";a="438414219"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga006.fm.intel.com with ESMTP; 26 Feb 2020 04:47:32 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 26 Feb 2020 04:47:32 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 26 Feb 2020 04:47:31 -0800
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 26 Feb 2020 04:47:31 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.98]) with mapi id 14.03.0439.000;
 Wed, 26 Feb 2020 20:47:29 +0800
From: "Chen, Farrah" <farrah.chen@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
 <roger.pau@citrix.com>
Thread-Topic: [PATCH] x86/vPMU: don't blindly assume IA32_PERF_CAPABILITIES
 MSR exists
Thread-Index: AQHV7IXWjPy1AAwQ80awdDxW+SzEoKgsuouAgAAIeoCAAASVgIAApCEA
Date: Wed, 26 Feb 2020 12:47:29 +0000
Message-ID: <1B925CC0CD9F3341B32D442251E7E1DC3E3DC28C@SHSMSX104.ccr.corp.intel.com>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54@SHSMSX104.ccr.corp.intel.com>
 <b33cc365-6537-d816-8a89-eadd514a2427@suse.com>
 <20200226100937.GA24458@Air-de-Roger.citrite.net>
 <75a795c2-4218-5e1a-7db8-4167e69fabca@suse.com>
 <9746ed58-b786-011d-5890-22a1a12195f7@citrix.com>
In-Reply-To: <9746ed58-b786-011d-5890-22a1a12195f7@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/vPMU: don't blindly assume
 IA32_PERF_CAPABILITIES MSR exists
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Hao,
 Xudong" <xudong.hao@intel.com>, Wei Liu <wl@xen.org>, "Gao,
 Chao" <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBhcHBsaWVkIHRoaXMgcGF0Y2ggdG8gWGVuIGFuZCByZXRlc3RlZCwgWGVuIG9uIEtWTSBib290
ZWQgdXAgc3VjY2Vzc2Z1bGx5LCB0aGFua3MgYSBsb3QuDQoNClRoYW5rcywNCkZhbg0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDI2LCAyMDIwIDY6NTYg
UE0NClRvOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmc7IENoZW4sIEZhcnJhaCA8ZmFycmFoLmNoZW5AaW50ZWwuY29tPjsgSGFvLCBYdWRvbmcgPHh1
ZG9uZy5oYW9AaW50ZWwuY29tPjsgR2FvLCBDaGFvIDxjaGFvLmdhb0BpbnRlbC5jb20+OyBXZWkg
TGl1IDx3bEB4ZW4ub3JnPg0KU3ViamVjdDogUmU6IFtQQVRDSF0geDg2L3ZQTVU6IGRvbid0IGJs
aW5kbHkgYXNzdW1lIElBMzJfUEVSRl9DQVBBQklMSVRJRVMgTVNSIGV4aXN0cw0KDQpPbiAyNi8w
Mi8yMDIwIDEwOjM5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjYuMDIuMjAyMCAxMTowOSwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIFdlZCwgRmViIDI2LCAyMDIwIGF0IDEwOjE5
OjE5QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IEp1c3QgbGlrZSBWTVgnZXMgbGJy
X3RzeF9maXh1cF9jaGVjaygpIHRoZSByZXNwZWN0aXZlIENQVUlEIGJpdCANCj4+PiBzaG91bGQg
YmUgY29uc3VsdGVkIGZpcnN0Lg0KPj4+DQo+Pj4gUmVwb3J0ZWQtYnk6IEZhcnJhaCBDaGVuIDxm
YXJyYWguY2hlbkBpbnRlbC5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPj4+DQo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11X2lu
dGVsLmMNCj4+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfaW50ZWwuYw0KPj4+IEBAIC05
MDAsNyArOTAwLDYgQEAgaW50IHZteF92cG11X2luaXRpYWxpc2Uoc3RydWN0IHZjcHUgKnYpDQo+
Pj4gIA0KPj4+ICBpbnQgX19pbml0IGNvcmUyX3ZwbXVfaW5pdCh2b2lkKQ0KPj4+ICB7DQo+Pj4g
LSAgICB1NjQgY2FwczsNCj4+PiAgICAgIHVuc2lnbmVkIGludCB2ZXJzaW9uID0gMDsNCj4+PiAg
ICAgIHVuc2lnbmVkIGludCBpOw0KPj4+ICANCj4+PiBAQCAtOTMyLDggKzkzMSwxNCBAQCBpbnQg
X19pbml0IGNvcmUyX3ZwbXVfaW5pdCh2b2lkKQ0KPj4+ICANCj4+PiAgICAgIGFyY2hfcG1jX2Nu
dCA9IGNvcmUyX2dldF9hcmNoX3BtY19jb3VudCgpOw0KPj4+ICAgICAgZml4ZWRfcG1jX2NudCA9
IGNvcmUyX2dldF9maXhlZF9wbWNfY291bnQoKTsNCj4+PiAtICAgIHJkbXNybChNU1JfSUEzMl9Q
RVJGX0NBUEFCSUxJVElFUywgY2Fwcyk7DQo+Pj4gLSAgICBmdWxsX3dpZHRoX3dyaXRlID0gKGNh
cHMgPj4gMTMpICYgMTsNCj4+PiArDQo+Pj4gKyAgICBpZiAoIGNwdV9oYXNfcGRjbSApDQo+Pj4g
KyAgICB7DQo+Pj4gKyAgICAgICAgdWludDY0X3QgY2FwczsNCj4+PiArDQo+Pj4gKyAgICAgICAg
cmRtc3JsKE1TUl9JQTMyX1BFUkZfQ0FQQUJJTElUSUVTLCBjYXBzKTsNCj4+PiArICAgICAgICBm
dWxsX3dpZHRoX3dyaXRlID0gKGNhcHMgPj4gMTMpICYgMTsNCj4+IFdpbGwgUE1VIHdvcmsgd2l0
aG91dCBQRENNPw0KDQpUaGUgcGVyZm9ybWFuY2UgY291bnRlciBpbnRlcmZhY2UgaW4gQ1BVcyBw
cmVkYXRlIHRoZSBpbnRyb2R1Y3Rpb24gb2YgUEVSRl9DQVBTLg0KDQo+PiBJJ3ZlIGJlZW4gZ3Jl
cHBpbmcgdGhlIEludGVsIFNETXMsIGJ1dCB0aGUgb25seSBtZW50aW9uIGlzIHRoYXQgUERDTSAN
Cj4+IHNpZ25hbCB0aGUgYXZhaWxhYmlsaXR5IG9mIE1TUl9JQTMyX1BFUkZfQ0FQQUJJTElUSUVT
Lg0KPiBXZWxsLCB0aGVyZSdzIG5vIG90aGVyIHVzZSBvZiB0aGUgTVNSIGFmYWljcyBleGNlcHQg
Zm9yIGdldHRpbmcgdGhlIA0KPiBvbmUgYml0IGhlcmUsIHNvIEkgYXNzdW1lIGl0J2xsIHdvcmsu
DQoNCkl0IGlzIGFuIG9mZi1ieS1kZWZhdWx0LCBvdXRzaWRlIHNlY3VyaXR5IHN1cHBvcnQgYXJl
YSBvZiBmdW5jdGlvbmFsaXR5IHdpdGgga25vd24gZnVuY3Rpb25hbCBidWdzIG91dHN0YW5kaW5n
IGFnYWluc3QgaXQuDQoNCiJub3QgY3Jhc2giIGlzIGEgZmluZSBpbXByb3ZlbWVudCBvbiB0aGUg
c3RhdHVzIHF1by4NCg0KfkFuZHJldw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
