Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB31089FF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 09:24:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZ9dH-0002Kx-IE; Mon, 25 Nov 2019 08:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z5e+=ZR=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iZ9dG-0002Ks-7Q
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 08:22:06 +0000
X-Inumbo-ID: a71de580-0f5c-11ea-b08b-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a71de580-0f5c-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 08:22:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 00:21:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; d="scan'208";a="202273816"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga008.jf.intel.com with ESMTP; 25 Nov 2019 00:21:58 -0800
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 25 Nov 2019 00:21:58 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 25 Nov 2019 00:21:58 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.127]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.2]) with mapi id 14.03.0439.000;
 Mon, 25 Nov 2019 16:21:56 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <pdurrant@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86 / iommu: set up a scratch page in the quarantine
 domain
Thread-Index: AQHVn5taQUurVQuThEODEM2YSd0uqaebjlXg
Date: Mon, 25 Nov 2019 08:21:55 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D60E9FD@SHSMSX104.ccr.corp.intel.com>
References: <20191120120859.1846-1-pdurrant@amazon.com>
In-Reply-To: <20191120120859.1846-1-pdurrant@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjYyNDlhZTUtYjRlOS00ZjY0LWI4MzktZDg1YzcyNGZhOGVlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidkJJTW1INVVHV3ZGTklsVmNndHhNZ3B1a1Rzdm5hMzIwSkFyTnUwRkRcL1BQNUhGa0trVEtNOExkZk9Ycm4reVkifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86 / iommu: set up a scratch page in the
 quarantine domain
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
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwZHVycmFudEBhbWF6b24uY29tXQ0KPiBTZW50
OiBXZWRuZXNkYXksIE5vdmVtYmVyIDIwLCAyMDE5IDg6MDkgUE0NCj4gDQo+IFRoaXMgcGF0Y2gg
aW50cm9kdWNlcyBhIG5ldyBpb21tdV9vcCB0byBmYWNpbGl0YXRlIGEgcGVyLWltcGxlbWVudGF0
aW9uDQo+IHF1YXJhbnRpbmUgc2V0IHVwLCBhbmQgdGhlbiBmdXJ0aGVyIGNvZGUgZm9yIHg4NiBp
bXBsZW1lbnRhdGlvbnMNCj4gKGFtZCBhbmQgdnRkKSB0byBzZXQgdXAgYSByZWFkL3dyb3RlIHNj
cmF0Y2ggcGFnZSB0byBzZXJ2ZSBhcyB0aGUgc291cmNlLw0KPiB0YXJnZXQgZm9yIGFsbCBETUEg
d2hpbHN0IGEgZGV2aWNlIGlzIGFzc2lnbmVkIHRvIGRvbV9pby4NCj4gDQo+IFRoZSByZWFzb24g
Zm9yIGRvaW5nIHRoaXMgaXMgdGhhdCBzb21lIGhhcmR3YXJlIG1heSBjb250aW51ZSB0byByZS10
cnkNCj4gRE1BLCBkZXNwaXRlIEZMUiwgaW4gdGhlIGV2ZW50IG9mIGFuIGVycm9yLiBIYXZpbmcg
YSBzY3JhdGNoIHBhZ2UgbWFwcGVkDQo+IHdpbGwgYWxsb3cgcGVuZGluZyBETUEgdG8gZHJhaW4g
YW5kIHRodXMgcXVpZXNjZSBzdWNoIGJ1Z2d5IGhhcmR3YXJlLg0KDQp0aGVuIHRoZXJlIGlzIG5v
IGRpYWdub3N0aWNzIGF0IGFsbCBzaW5jZSBhbGwgZmF1bHRzIGFyZSBxdWllc2NlbnQgbm93Li4u
DQp3aHkgZG8gd2Ugd2FudCB0byBzdXBwb3J0IHN1Y2ggYnVnZ3kgaGFyZHdhcmU/IElzIGl0IGJl
dHRlciB0byBtYWtlDQppdCBhbiBkZWZhdWx0LW9mZiBvcHRpb24gc2luY2UgYnVnZ3kgaXMgc3Vw
cG9zZWQgdG8gbmljaGUgY2FzZT8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50
IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiAtLS0NCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+DQo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gQ2M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+DQo+IENjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPiAtLS0NCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAu
YyAgICAgICB8IDU3ICsrKysrKysrKysrKysrKw0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YW1kL3BjaV9hbWRfaW9tbXUuYyAgIHwgIDkgKy0tDQo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9pb21tdS5jICAgICAgICAgICAgICAgfCAyNSArKysrKystDQo+ICB4ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvaW9tbXUuYyAgICAgICAgICAgfCA3MSArKysrKysrKysrKysrKystLS0tDQo+
ICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmggfCAgMiArDQo+
ICB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+
ICA2IGZpbGVzIGNoYW5nZWQsIDE0MyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFwLmMN
Cj4gYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFwLmMNCj4gaW5kZXggY2Q1
YzdkZTdjNS4uODQ0MGNjZjFjMSAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYW1kL2lvbW11X21hcC5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9p
b21tdV9tYXAuYw0KPiBAQCAtNTYwLDYgKzU2MCw2MyBAQCBpbnQNCj4gYW1kX2lvbW11X3Jlc2Vy
dmVfZG9tYWluX3VuaXR5X21hcChzdHJ1Y3QgZG9tYWluICpkb21haW4sDQo+ICAgICAgcmV0dXJu
IHJ0Ow0KPiAgfQ0KPiANCj4gK2ludCBhbWRfaW9tbXVfcXVhcmFudGluZV9pbml0KHN0cnVjdCBk
b21haW4gKmQpDQo+ICt7DQo+ICsgICAgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9t
bXUoZCk7DQo+ICsgICAgdW5zaWduZWQgaW50IGxldmVsOw0KPiArICAgIHN0cnVjdCBhbWRfaW9t
bXVfcHRlICp0YWJsZTsNCj4gKw0KPiArICAgIGlmICggaGQtPmFyY2gucm9vdF90YWJsZSApDQo+
ICsgICAgew0KPiArICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gKyAgICAgICAgcmV0
dXJuIDA7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgc3Bpbl9sb2NrKCZoZC0+YXJjaC5tYXBwaW5n
X2xvY2spOw0KPiArDQo+ICsgICAgbGV2ZWwgPSBoZC0+YXJjaC5wYWdpbmdfbW9kZTsNCj4gKw0K
PiArICAgIGhkLT5hcmNoLnJvb3RfdGFibGUgPSBhbGxvY19hbWRfaW9tbXVfcGd0YWJsZSgpOw0K
PiArICAgIGlmICggIWhkLT5hcmNoLnJvb3RfdGFibGUgKQ0KPiArICAgICAgICBnb3RvIG91dDsN
Cj4gKw0KPiArICAgIHRhYmxlID0gX19tYXBfZG9tYWluX3BhZ2UoaGQtPmFyY2gucm9vdF90YWJs
ZSk7DQo+ICsgICAgd2hpbGUgKCBsZXZlbCApDQo+ICsgICAgew0KPiArICAgICAgICBzdHJ1Y3Qg
cGFnZV9pbmZvICpwZzsNCj4gKyAgICAgICAgdW5zaWduZWQgaW50IGk7DQo+ICsNCj4gKyAgICAg
ICAgLyoNCj4gKyAgICAgICAgICogVGhlIHBndGFibGUgYWxsb2NhdG9yIGlzIGZpbmUgZm9yIHRo
ZSBsZWFmIHBhZ2UsIGFzIHdlbGwgYXMNCj4gKyAgICAgICAgICogcGFnZSB0YWJsZSBwYWdlcy4N
Cj4gKyAgICAgICAgICovDQo+ICsgICAgICAgIHBnID0gYWxsb2NfYW1kX2lvbW11X3BndGFibGUo
KTsNCj4gKyAgICAgICAgaWYgKCAhcGcgKQ0KPiArICAgICAgICAgICAgYnJlYWs7DQo+ICsNCj4g
KyAgICAgICAgZm9yICggaSA9IDA7IGkgPCBQVEVfUEVSX1RBQkxFX1NJWkU7IGkrKyApDQo+ICsg
ICAgICAgIHsNCj4gKyAgICAgICAgICAgIHN0cnVjdCBhbWRfaW9tbXVfcHRlICpwZGUgPSAmdGFi
bGVbaV07DQo+ICsNCj4gKyAgICAgICAgICAgIHNldF9pb21tdV9wZGVfcHJlc2VudChwZGUsIG1m
bl94KHBhZ2VfdG9fbWZuKHBnKSksIGxldmVsIC0gMSwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB0cnVlLCB0cnVlKTsNCj4gKyAgICAgICAgfQ0KPiArDQo+ICsgICAgICAg
IHVubWFwX2RvbWFpbl9wYWdlKHRhYmxlKTsNCj4gKyAgICAgICAgdGFibGUgPSBfX21hcF9kb21h
aW5fcGFnZShwZyk7DQo+ICsgICAgICAgIGxldmVsLS07DQo+ICsgICAgfQ0KPiArICAgIHVubWFw
X2RvbWFpbl9wYWdlKHRhYmxlKTsNCj4gKw0KPiArIG91dDoNCj4gKyAgICBzcGluX3VubG9jaygm
aGQtPmFyY2gubWFwcGluZ19sb2NrKTsNCj4gKw0KPiArICAgIGFtZF9pb21tdV9mbHVzaF9hbGxf
cGFnZXMoZCk7DQo+ICsNCj4gKyAgICAvKiBQYWdlcyBsZWFrZWQgaW4gZmFpbHVyZSBjYXNlICov
DQo+ICsgICAgcmV0dXJuIGxldmVsID8gLUVOT01FTSA6IDA7DQo+ICt9DQo+ICsNCj4gIC8qDQo+
ICAgKiBMb2NhbCB2YXJpYWJsZXM6DQo+ICAgKiBtb2RlOiBDDQo+IGRpZmYgLS1naXQgYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jDQo+IGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYw0KPiBpbmRleCA3NWEwZjFiNGFiLi5jNzg1
OGI0ZThmIDEwMDY0NA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2Ft
ZF9pb21tdS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lv
bW11LmMNCj4gQEAgLTk1LDEwICs5NSw2IEBAIHN0YXRpYyB2b2lkIGFtZF9pb21tdV9zZXR1cF9k
b21haW5fZGV2aWNlKA0KPiAgICAgIHU4IGJ1cyA9IHBkZXYtPmJ1czsNCj4gICAgICBjb25zdCBz
dHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkb21haW4pOw0KPiANCj4gLSAgICAv
KiBkb21faW8gaXMgdXNlZCBhcyBhIHNlbnRpbmVsIGZvciBxdWFyYW50aW5lZCBkZXZpY2VzICov
DQo+IC0gICAgaWYgKCBkb21haW4gPT0gZG9tX2lvICkNCj4gLSAgICAgICAgcmV0dXJuOw0KPiAt
DQo+ICAgICAgQlVHX09OKCAhaGQtPmFyY2gucm9vdF90YWJsZSB8fCAhaGQtPmFyY2gucGFnaW5n
X21vZGUgfHwNCj4gICAgICAgICAgICAgICFpb21tdS0+ZGV2X3RhYmxlLmJ1ZmZlciApOw0KPiAN
Cj4gQEAgLTI5MCwxMCArMjg2LDYgQEAgc3RhdGljIHZvaWQNCj4gYW1kX2lvbW11X2Rpc2FibGVf
ZG9tYWluX2RldmljZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkb21haW4sDQo+ICAgICAgaW50IHJl
cV9pZDsNCj4gICAgICB1OCBidXMgPSBwZGV2LT5idXM7DQo+IA0KPiAtICAgIC8qIGRvbV9pbyBp
cyB1c2VkIGFzIGEgc2VudGluZWwgZm9yIHF1YXJhbnRpbmVkIGRldmljZXMgKi8NCj4gLSAgICBp
ZiAoIGRvbWFpbiA9PSBkb21faW8gKQ0KPiAtICAgICAgICByZXR1cm47DQo+IC0NCj4gICAgICBC
VUdfT04gKCBpb21tdS0+ZGV2X3RhYmxlLmJ1ZmZlciA9PSBOVUxMICk7DQo+ICAgICAgcmVxX2lk
ID0gZ2V0X2RtYV9yZXF1ZXN0b3JfaWQoaW9tbXUtPnNlZywgUENJX0JERjIoYnVzLCBkZXZmbikp
Ow0KPiAgICAgIHRhYmxlID0gaW9tbXUtPmRldl90YWJsZS5idWZmZXI7DQo+IEBAIC02MzIsNiAr
NjI0LDcgQEAgc3RhdGljIHZvaWQgYW1kX2R1bXBfcDJtX3RhYmxlKHN0cnVjdCBkb21haW4NCj4g
KmQpDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11X29wcyBfX2luaXRjb25zdHJlbCBfaW9t
bXVfb3BzID0gew0KPiAgICAgIC5pbml0ID0gYW1kX2lvbW11X2RvbWFpbl9pbml0LA0KPiAgICAg
IC5od2RvbV9pbml0ID0gYW1kX2lvbW11X2h3ZG9tX2luaXQsDQo+ICsgICAgLnF1YXJhbnRpbmVf
aW5pdCA9IGFtZF9pb21tdV9xdWFyYW50aW5lX2luaXQsDQo+ICAgICAgLmFkZF9kZXZpY2UgPSBh
bWRfaW9tbXVfYWRkX2RldmljZSwNCj4gICAgICAucmVtb3ZlX2RldmljZSA9IGFtZF9pb21tdV9y
ZW1vdmVfZGV2aWNlLA0KPiAgICAgIC5hc3NpZ25fZGV2aWNlICA9IGFtZF9pb21tdV9hc3NpZ25f
ZGV2aWNlLA0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0K
PiBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4gaW5kZXggOGNiZTkwOGZmZi4u
MjUyODMyNjNkNyAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUu
Yw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+IEBAIC00NDAsNiAr
NDQwLDI4IEBAIGludCBpb21tdV9pb3RsYl9mbHVzaF9hbGwoc3RydWN0IGRvbWFpbiAqZCwNCj4g
dW5zaWduZWQgaW50IGZsdXNoX2ZsYWdzKQ0KPiAgICAgIHJldHVybiByYzsNCj4gIH0NCj4gDQo+
ICtzdGF0aWMgaW50IF9faW5pdCBpb21tdV9xdWFyYW50aW5lX2luaXQodm9pZCkNCj4gK3sNCj4g
KyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkb21faW8pOw0K
PiArICAgIGludCByYzsNCj4gKw0KPiArICAgIGRvbV9pby0+b3B0aW9ucyB8PSBYRU5fRE9NQ1RM
X0NERl9pb21tdTsNCj4gKw0KPiArICAgIHJjID0gaW9tbXVfZG9tYWluX2luaXQoZG9tX2lvLCAw
KTsNCj4gKyAgICBpZiAoIHJjICkNCj4gKyAgICAgICAgcmV0dXJuIHJjOw0KPiArDQo+ICsgICAg
aWYgKCAhaGQtPnBsYXRmb3JtX29wcy0+cXVhcmFudGluZV9pbml0ICkNCj4gKyAgICAgICAgcmV0
dXJuIDA7DQo+ICsNCj4gKyAgICByYyA9IGhkLT5wbGF0Zm9ybV9vcHMtPnF1YXJhbnRpbmVfaW5p
dChkb21faW8pOw0KPiArDQo+ICsgICAgaWYgKCAhcmMgKQ0KPiArICAgICAgICBwcmludGsoIlF1
YXJhbnRpbmUgaW5pdGlhbGl6ZWRcbiIpOw0KPiArDQo+ICsgICAgcmV0dXJuIHJjOw0KPiArfQ0K
PiArDQo+ICBpbnQgX19pbml0IGlvbW11X3NldHVwKHZvaWQpDQo+ICB7DQo+ICAgICAgaW50IHJj
ID0gLUVOT0RFVjsNCj4gQEAgLTQ3Myw4ICs0OTUsNyBAQCBpbnQgX19pbml0IGlvbW11X3NldHVw
KHZvaWQpDQo+ICAgICAgfQ0KPiAgICAgIGVsc2UNCj4gICAgICB7DQo+IC0gICAgICAgIGRvbV9p
by0+b3B0aW9ucyB8PSBYRU5fRE9NQ1RMX0NERl9pb21tdTsNCj4gLSAgICAgICAgaWYgKCBpb21t
dV9kb21haW5faW5pdChkb21faW8sIDApICkNCj4gKyAgICAgICAgaWYgKCBpb21tdV9xdWFyYW50
aW5lX2luaXQoKSApDQo+ICAgICAgICAgICAgICBwYW5pYygiQ291bGQgbm90IHNldCB1cCBxdWFy
YW50aW5lXG4iKTsNCj4gDQo+ICAgICAgICAgIHByaW50aygiIC0gRG9tMCBtb2RlOiAlc1xuIiwN
Cj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gaW5kZXggMjVhZDY0OWMzNC4u
YzIwZjJjYTAyOSAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lv
bW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gQEAg
LTEyOTEsMTAgKzEyOTEsNiBAQCBpbnQgZG9tYWluX2NvbnRleHRfbWFwcGluZ19vbmUoDQo+ICAg
ICAgaW50IGFnYXcsIHJjLCByZXQ7DQo+ICAgICAgYm9vbF90IGZsdXNoX2Rldl9pb3RsYjsNCj4g
DQo+IC0gICAgLyogZG9tX2lvIGlzIHVzZWQgYXMgYSBzZW50aW5lbCBmb3IgcXVhcmFudGluZWQg
ZGV2aWNlcyAqLw0KPiAtICAgIGlmICggZG9tYWluID09IGRvbV9pbyApDQo+IC0gICAgICAgIHJl
dHVybiAwOw0KPiAtDQo+ICAgICAgQVNTRVJUKHBjaWRldnNfbG9ja2VkKCkpOw0KPiAgICAgIHNw
aW5fbG9jaygmaW9tbXUtPmxvY2spOw0KPiAgICAgIG1hZGRyID0gYnVzX3RvX2NvbnRleHRfbWFk
ZHIoaW9tbXUsIGJ1cyk7DQo+IEBAIC0xNTQxLDEwICsxNTM3LDYgQEAgaW50IGRvbWFpbl9jb250
ZXh0X3VubWFwX29uZSgNCj4gICAgICBpbnQgaW9tbXVfZG9taWQsIHJjLCByZXQ7DQo+ICAgICAg
Ym9vbF90IGZsdXNoX2Rldl9pb3RsYjsNCj4gDQo+IC0gICAgLyogZG9tX2lvIGlzIHVzZWQgYXMg
YSBzZW50aW5lbCBmb3IgcXVhcmFudGluZWQgZGV2aWNlcyAqLw0KPiAtICAgIGlmICggZG9tYWlu
ID09IGRvbV9pbyApDQo+IC0gICAgICAgIHJldHVybiAwOw0KPiAtDQo+ICAgICAgQVNTRVJUKHBj
aWRldnNfbG9ja2VkKCkpOw0KPiAgICAgIHNwaW5fbG9jaygmaW9tbXUtPmxvY2spOw0KPiANCj4g
QEAgLTE2NzcsMTAgKzE2NjksNiBAQCBzdGF0aWMgaW50IGRvbWFpbl9jb250ZXh0X3VubWFwKHN0
cnVjdA0KPiBkb21haW4gKmRvbWFpbiwgdTggZGV2Zm4sDQo+ICAgICAgICAgIGdvdG8gb3V0Ow0K
PiAgICAgIH0NCj4gDQo+IC0gICAgLyogZG9tX2lvIGlzIHVzZWQgYXMgYSBzZW50aW5lbCBmb3Ig
cXVhcmFudGluZWQgZGV2aWNlcyAqLw0KPiAtICAgIGlmICggZG9tYWluID09IGRvbV9pbyApDQo+
IC0gICAgICAgIGdvdG8gb3V0Ow0KPiAtDQo+ICAgICAgLyoNCj4gICAgICAgKiBpZiBubyBvdGhl
ciBkZXZpY2VzIHVuZGVyIHRoZSBzYW1lIGlvbW11IG93bmVkIGJ5IHRoaXMgZG9tYWluLA0KPiAg
ICAgICAqIGNsZWFyIGlvbW11IGluIGlvbW11X2JpdG1hcCBhbmQgY2xlYXIgZG9tYWluX2lkIGlu
IGRvbWlkX2JpdG1wDQo+IEBAIC0yNjgzLDkgKzI2NzEsNjggQEAgc3RhdGljIHZvaWQgdnRkX2R1
bXBfcDJtX3RhYmxlKHN0cnVjdCBkb21haW4NCj4gKmQpDQo+ICAgICAgdnRkX2R1bXBfcDJtX3Rh
YmxlX2xldmVsKGhkLT5hcmNoLnBnZF9tYWRkciwgYWdhd190b19sZXZlbChoZC0NCj4gPmFyY2gu
YWdhdyksIDAsIDApOw0KPiAgfQ0KPiANCj4gK3N0YXRpYyBpbnQgaW50ZWxfaW9tbXVfcXVhcmFu
dGluZV9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+ICt7DQo+ICsgICAgc3RydWN0IGRvbWFpbl9p
b21tdSAqaGQgPSBkb21faW9tbXUoZCk7DQo+ICsgICAgc3RydWN0IGRtYV9wdGUgKnBhcmVudDsN
Cj4gKyAgICB1bnNpZ25lZCBpbnQgbGV2ZWwgPSBhZ2F3X3RvX2xldmVsKGhkLT5hcmNoLmFnYXcp
Ow0KPiArICAgIGludCByYzsNCj4gKw0KPiArICAgIGlmICggaGQtPmFyY2gucGdkX21hZGRyICkN
Cj4gKyAgICB7DQo+ICsgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiArICAgICAgICBy
ZXR1cm4gMDsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICBzcGluX2xvY2soJmhkLT5hcmNoLm1hcHBp
bmdfbG9jayk7DQo+ICsNCj4gKyAgICBoZC0+YXJjaC5wZ2RfbWFkZHIgPSBhbGxvY19wZ3RhYmxl
X21hZGRyKDEsIGhkLT5ub2RlKTsNCj4gKyAgICBpZiAoICFoZC0+YXJjaC5wZ2RfbWFkZHIgKQ0K
PiArICAgICAgICBnb3RvIG91dDsNCj4gKw0KPiArICAgIHBhcmVudCA9IChzdHJ1Y3QgZG1hX3B0
ZSAqKW1hcF92dGRfZG9tYWluX3BhZ2UoaGQtDQo+ID5hcmNoLnBnZF9tYWRkcik7DQo+ICsgICAg
d2hpbGUgKCBsZXZlbCApDQo+ICsgICAgew0KPiArICAgICAgICB1aW50NjRfdCBtYWRkcjsNCj4g
KyAgICAgICAgdW5zaWduZWQgaW50IG9mZnNldDsNCj4gKw0KPiArICAgICAgICAvKg0KPiArICAg
ICAgICAgKiBUaGUgcGd0YWJsZSBhbGxvY2F0b3IgaXMgZmluZSBmb3IgdGhlIGxlYWYgcGFnZSwg
YXMgd2VsbCBhcw0KPiArICAgICAgICAgKiBwYWdlIHRhYmxlIHBhZ2VzLg0KPiArICAgICAgICAg
Ki8NCj4gKyAgICAgICAgbWFkZHIgPSBhbGxvY19wZ3RhYmxlX21hZGRyKDEsIGhkLT5ub2RlKTsN
Cj4gKyAgICAgICAgaWYgKCAhbWFkZHIgKQ0KPiArICAgICAgICAgICAgYnJlYWs7DQo+ICsNCj4g
KyAgICAgICAgZm9yICggb2Zmc2V0ID0gMDsgb2Zmc2V0IDwgUFRFX05VTTsgb2Zmc2V0KysgKQ0K
PiArICAgICAgICB7DQo+ICsgICAgICAgICAgICBzdHJ1Y3QgZG1hX3B0ZSAqcHRlID0gJnBhcmVu
dFtvZmZzZXRdOw0KPiArDQo+ICsgICAgICAgICAgICBkbWFfc2V0X3B0ZV9hZGRyKCpwdGUsIG1h
ZGRyKTsNCj4gKyAgICAgICAgICAgIGRtYV9zZXRfcHRlX3JlYWRhYmxlKCpwdGUpOw0KPiArICAg
ICAgICAgICAgZG1hX3NldF9wdGVfd3JpdGFibGUoKnB0ZSk7DQo+ICsgICAgICAgIH0NCj4gKyAg
ICAgICAgaW9tbXVfZmx1c2hfY2FjaGVfcGFnZShwYXJlbnQsIDEpOw0KPiArDQo+ICsgICAgICAg
IHVubWFwX3Z0ZF9kb21haW5fcGFnZShwYXJlbnQpOw0KPiArICAgICAgICBwYXJlbnQgPSBtYXBf
dnRkX2RvbWFpbl9wYWdlKG1hZGRyKTsNCj4gKyAgICAgICAgbGV2ZWwtLTsNCj4gKyAgICB9DQo+
ICsgICAgdW5tYXBfdnRkX2RvbWFpbl9wYWdlKHBhcmVudCk7DQo+ICsNCj4gKyBvdXQ6DQo+ICsg
ICAgc3Bpbl91bmxvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+ICsNCj4gKyAgICByYyA9
IGlvbW11X2ZsdXNoX2lvdGxiX2FsbChkKTsNCj4gKw0KPiArICAgIC8qIFBhZ2VzIGxlYWtlZCBp
biBmYWlsdXJlIGNhc2UgKi8NCj4gKyAgICByZXR1cm4gbGV2ZWwgPyAtRU5PTUVNIDogcmM7DQo+
ICt9DQo+ICsNCj4gIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgX19pbml0Y29uc3RyZWwgaW50ZWxf
aW9tbXVfb3BzID0gew0KPiAgICAgIC5pbml0ID0gaW50ZWxfaW9tbXVfZG9tYWluX2luaXQsDQo+
ICAgICAgLmh3ZG9tX2luaXQgPSBpbnRlbF9pb21tdV9od2RvbV9pbml0LA0KPiArICAgIC5xdWFy
YW50aW5lX2luaXQgPSBpbnRlbF9pb21tdV9xdWFyYW50aW5lX2luaXQsDQo+ICAgICAgLmFkZF9k
ZXZpY2UgPSBpbnRlbF9pb21tdV9hZGRfZGV2aWNlLA0KPiAgICAgIC5lbmFibGVfZGV2aWNlID0g
aW50ZWxfaW9tbXVfZW5hYmxlX2RldmljZSwNCj4gICAgICAucmVtb3ZlX2RldmljZSA9IGludGVs
X2lvbW11X3JlbW92ZV9kZXZpY2UsDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2
L2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmgNCj4gYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9z
dm0vYW1kLWlvbW11LXByb3RvLmgNCj4gaW5kZXggOGVkOTQ4Mjc5MS4uMzlmYjEwZjU2NyAxMDA2
NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1wcm90by5o
DQo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS9hbWQtaW9tbXUtcHJvdG8uaA0K
PiBAQCAtNTQsNiArNTQsOCBAQCBpbnQgYW1kX2lvbW11X2luaXRfbGF0ZSh2b2lkKTsNCj4gIGlu
dCBhbWRfaW9tbXVfdXBkYXRlX2l2cnNfbWFwcGluZ19hY3BpKHZvaWQpOw0KPiAgaW50IGlvdl9h
ZGp1c3RfaXJxX2FmZmluaXRpZXModm9pZCk7DQo+IA0KPiAraW50IGFtZF9pb21tdV9xdWFyYW50
aW5lX2luaXQoc3RydWN0IGRvbWFpbiAqZCk7DQo+ICsNCj4gIC8qIG1hcHBpbmcgZnVuY3Rpb25z
ICovDQo+ICBpbnQgX19tdXN0X2NoZWNrIGFtZF9pb21tdV9tYXBfcGFnZShzdHJ1Y3QgZG9tYWlu
ICpkLCBkZm5fdCBkZm4sDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
Zm5fdCBtZm4sIHVuc2lnbmVkIGludCBmbGFncywNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3hlbi9pb21tdS5oIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4gaW5kZXggOTc0YmQzZmZl
OC4uNjk3N2RkYmI5NyAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4g
KysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4gQEAgLTIxMSw2ICsyMTEsNyBAQCB0eXBl
ZGVmIGludCBpb21tdV9ncmRtX3QoeGVuX3Bmbl90IHN0YXJ0LA0KPiB4ZW5fdWxvbmdfdCBuciwg
dTMyIGlkLCB2b2lkICpjdHh0KTsNCj4gIHN0cnVjdCBpb21tdV9vcHMgew0KPiAgICAgIGludCAo
KmluaXQpKHN0cnVjdCBkb21haW4gKmQpOw0KPiAgICAgIHZvaWQgKCpod2RvbV9pbml0KShzdHJ1
Y3QgZG9tYWluICpkKTsNCj4gKyAgICBpbnQgKCpxdWFyYW50aW5lX2luaXQpKHN0cnVjdCBkb21h
aW4gKmQpOw0KPiAgICAgIGludCAoKmFkZF9kZXZpY2UpKHU4IGRldmZuLCBkZXZpY2VfdCAqZGV2
KTsNCj4gICAgICBpbnQgKCplbmFibGVfZGV2aWNlKShkZXZpY2VfdCAqZGV2KTsNCj4gICAgICBp
bnQgKCpyZW1vdmVfZGV2aWNlKSh1OCBkZXZmbiwgZGV2aWNlX3QgKmRldik7DQo+IC0tDQo+IDIu
MjAuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
