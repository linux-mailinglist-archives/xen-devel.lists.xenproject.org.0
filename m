Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6E0A7BCF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 08:39:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Ot5-0003XG-Gk; Wed, 04 Sep 2019 06:35:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NniL=W7=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1i5Ot3-0003XB-NQ
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 06:35:25 +0000
X-Inumbo-ID: 2be5453e-cede-11e9-b299-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2be5453e-cede-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 06:35:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 23:35:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,465,1559545200"; d="scan'208";a="334101986"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga004.jf.intel.com with ESMTP; 03 Sep 2019 23:35:20 -0700
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 3 Sep 2019 23:35:11 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 3 Sep 2019 23:35:11 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.89]) with mapi id 14.03.0439.000;
 Wed, 4 Sep 2019 14:35:09 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH] vpci: don't allow access to devices not assigned to
 the domain
Thread-Index: AQHVYYW51cKc1tez00yZc0xuRwbw36cbEPyw
Date: Wed, 4 Sep 2019 06:35:08 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D562362@SHSMSX104.ccr.corp.intel.com>
References: <20190902113034.97934-1-roger.pau@citrix.com>
 <e4afc421-17ef-32a7-21f4-3ecb65ebb44a@suse.com>
In-Reply-To: <e4afc421-17ef-32a7-21f4-3ecb65ebb44a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTk4OTk0YTQtZTI5OC00Yjg4LTkxY2QtZDgyZmZkNTI1ODhiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUHE0QTNha2pPeEhzM25vRHVsYkVERENLcXQ0NFwvREpVN1lFQXo3d0Zwa05JcldOcmg0bjJxaEhMZmtuSXN4SmYifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] vpci: don't allow access to devices not
 assigned to the domain
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOmpiZXVsaWNoQHN1c2UuY29tXQ0KPiBTZW50OiBN
b25kYXksIFNlcHRlbWJlciAyLCAyMDE5IDc6NTggUE0NCj4gDQo+IE9uIDAyLjA5LjIwMTkgMTM6
MzAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gPiBEb24ndCBhbGxvdyB0aGUgaGFyZHdhcmUg
ZG9tYWluIHRvIGFjY2VzcyB0aGUgUENJIGNvbmZpZyBzcGFjZSBvZg0KPiA+IGRldmljZXMgbm90
IGFzc2lnbmVkIHRvIGl0LiBJZTogdGhlIGNvbmZpZyBzcGFjZSBvZiBpb21tdSBkZXZpY2VzDQo+
ID4gaW4gdXNlIGJ5IFhlbiBzaG91bGQgbm90IGJlIGFjY2Vzc2libGUgdG8gdGhlIGhhcmR3YXJl
IGRvbWFpbi4NCj4gDQo+IFdlbGwsIEkgYWdyZWUgd2l0aCB3aGF0IHlvdSBzYXkgYWJvdmUsIGJ1
dCB0aGUgY29kZSBjaGFuZ2UgZGlzYWxsb3dzDQo+IG11Y2ggbW9yZSB0aGFuIHRoaXMuIEluIHBh
cnRpY3VsYXIgRG9tMCAoYW5kIG1heWJlIHN0dWIgZG9tYWlucyB0b28pDQo+IG5lZWQgdG8gYmUg
YWJsZSB0byBhY2Nlc3MgdGhlIGNvbmZpZyBzcGFjZSBvZiBkZXZpY2VzIGFzc2lnbmVkIHRvDQo+
IGd1ZXN0cywgZS5nLiBmb3IgcWVtdSB0byBjb250cm9sIE1TSSBhbmQvb3IgTVNJLVguDQo+IA0K
PiA+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+ID4gKysrIGIveGVuL2RyaXZlcnMv
dnBjaS92cGNpLmMNCj4gPiBAQCAtMzE5LDcgKzMxOSwyMSBAQCB1aW50MzJfdCB2cGNpX3JlYWQo
cGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQNCj4gcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSkN
Cj4gPiAgICAgIC8qIEZpbmQgdGhlIFBDSSBkZXYgbWF0Y2hpbmcgdGhlIGFkZHJlc3MuICovDQo+
ID4gICAgICBwZGV2ID0gcGNpX2dldF9wZGV2X2J5X2RvbWFpbihkLCBzYmRmLnNlZywgc2JkZi5i
dXMsIHNiZGYuZGV2Zm4pOw0KPiA+ICAgICAgaWYgKCAhcGRldiApDQo+ID4gKyAgICB7DQo+ID4g
KyAgICAgICAgcGNpZGV2c19sb2NrKCk7DQo+ID4gKyAgICAgICAgcGRldiA9IHBjaV9nZXRfcGRl
dihzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2Zm4pOw0KPiA+ICsgICAgICAgIHBjaWRldnNf
dW5sb2NrKCk7DQo+IA0KPiBUaGUgbG9ja2luZyBoZXJlIHBvaW50cyBvdXQgYSBwcmUtZXhpc3Rp
bmcgaXNzdWU6IFdoaWxlDQo+IHBjaV9nZXRfcGRldl9ieV9kb21haW4oKSBkb2Vzbid0IGNoZWNr
IHRoYXQgdGhlIHBjaWRldnMgbG9jayBpcw0KPiBiZWluZyBoZWxkLCBpdCByZWFsbHkgc2hvdWxk
LiBJdCBub3QgZG9pbmcgc28gaXMgKEkgZ3Vlc3MpIGJlY2F1c2UNCj4gVlQtZCBjb2RlIHRvbyBs
b29rcyB0byBiZSB2aW9sYXRpbmcgdGhpcy4gS2V2aW4gLSB0aG91Z2h0cz8NCj4gDQoNCkl0J3Mg
dXNlZCBieSBhZGRyX3RvX2RtYV9wYWdlX21hZGRyLCB3aGlsZSB0aGUgbGF0dGVyIGlzIHVzZWQN
CmluIG1hbnkgY29kZSBwYXRocy4gU29tZSBvZiB0aGVtIGFscmVhZHkgaG9sZHMgdGhlIGxvY2sg
d2hpbGUNCm90aGVycyBkb24ndC4gSW5zdGVhZCBvZiBpbnRyb2R1Y2luZyB0cmlja2luZXNzIGlu
IHRob3NlIHBhdGhzLCBJDQp0aGluayB0aGlzIG1heSBiZSBmaXhlZCBpbiBhbiBlYXNpZXIgd2F5
IC0ganVzdCByZW1vdmluZyB0aGUgDQppbnZvY2F0aW9uIG9mIHBjaV9nZXRfcGRldl9ieV9kb21h
aW4uIFRoZSBvbmx5IHB1cnBvc2Ugb2YNCmN1cnJlbnQgdXNhZ2UgaXMgdG8gZmluZCB0aGUgcmVs
YXRlZCBEUkhELCBhbmQgdGhlbiBkbyBOVU1BLQ0KYXdhcmUgcGFnZSB0YWJsZSBhbGxvY2F0aW9u
LiBJdCdzIG5lZWRsZXNzIHRvIHJlcGVhdCBmaW5kaW5nIERSSEQNCmhlcmUuIFdlIGNhbiBqdXN0
IHJlY29yZCBpdCB3aGVuIGFzc2lnbl9kZXZpY2UgaGFwcGVucy4NCg0KTGV0J3MgdHdlYWsgYSBm
aXggZm9yIGl0Lg0KDQpUaGFua3MNCktldmluDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
