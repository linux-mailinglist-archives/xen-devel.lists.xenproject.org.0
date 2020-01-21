Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCDF1435C5
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 03:50:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itjYG-0008MX-Th; Tue, 21 Jan 2020 02:46:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i4GT=3K=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1itjYF-0008MR-69
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 02:45:59 +0000
X-Inumbo-ID: 20340e8c-3bf8-11ea-aecd-bc764e2007e4
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20340e8c-3bf8-11ea-aecd-bc764e2007e4;
 Tue, 21 Jan 2020 02:45:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 18:45:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="227200457"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 20 Jan 2020 18:45:45 -0800
Received: from fmsmsx124.amr.corp.intel.com (10.18.125.39) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jan 2020 18:45:45 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx124.amr.corp.intel.com (10.18.125.39) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jan 2020 18:45:45 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.30]) with mapi id 14.03.0439.000;
 Tue, 21 Jan 2020 10:45:42 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v3 7/8] x86/HVM: don't needlessly intercept
 APERF/MPERF/TSC MSR reads
Thread-Index: AQHVxK++ESh37tCKKkiO6pikiaY7safxWy0AgAFtuwCAAbX4IA==
Date: Tue, 21 Jan 2020 02:45:43 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D73E781@SHSMSX104.ccr.corp.intel.com>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
 <0d2c44ca-d3ce-bb83-e3fc-0e5037c90143@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739AB2@SHSMSX104.ccr.corp.intel.com>
 <ec3798d3-c63b-8b2b-9c6e-c57741c81b27@suse.com>
In-Reply-To: <ec3798d3-c63b-8b2b-9c6e-c57741c81b27@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTljMzM1OWItMzNmNy00MDBkLTgyOTgtMDVkZWZiZmU1NDMyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiU3ZjZjRyUEUwVGxaclRGMVlSM0o4QmJLTkdpdUQyVEJNVVljU09tcGh3WUNnZW5IRkV2TXRZZk44QnRKR3AxYyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 7/8] x86/HVM: don't needlessly intercept
 APERF/MPERF/TSC MSR reads
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
SmFudWFyeSAyMCwgMjAyMCA0OjMzIFBNDQo+IA0KPiBPbiAxOS4wMS4yMDIwIDAzOjQ0LCBUaWFu
LCBLZXZpbiB3cm90ZToNCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KPiA+PiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDcsIDIwMjAgMTI6MzkgQU0NCj4gPj4NCj4g
Pj4gSWYgdGhlIGhhcmR3YXJlIGNhbiBoYW5kbGUgYWNjZXNzZXMsIHdlIHNob3VsZCBhbGxvdyBp
dCB0byBkbyBzby4gVGhpcw0KPiA+PiB3YXkgd2UgY2FuIGV4cG9zZSBFRlJPIHRvIEhWTSBndWVz
dHMsIGFuZCAiYWxsIiB0aGF0J3MgbGVmdCBmb3IgZXhwb3NpbmcNCj4gPj4gQVBFUkYvTVBFUkYg
aXMgdG8gZmlndXJlIG91dCBob3cgdG8gaGFuZGxlIHdyaXRlcyB0byB0aGVzZSBNU1JzLiAoTm90
ZQ0KPiA+PiB0aGF0IHRoZSBsZWFmIDYgZ3Vlc3QgQ1BVSUQgY2hlY2tzIHdpbGwgZXZhbHVhdGUg
dG8gZmFsc2UgZm9yIG5vdywgYXMNCj4gPj4gcmVjYWxjdWxhdGVfbWlzYygpIHphcHMgdGhlIGVu
dGlyZSBsZWFmIGZvciBub3cuKQ0KPiA+Pg0KPiA+PiBGb3IgVFNDIHRoZSBpbnRlcmNlcHRzIGFy
ZSBtYWRlIG1pcnJvciB0aGUgUkRUU0Mgb25lcy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPiANCj4gVGhhbmtzLiBJIGFzc3VtZSB5
b3UndmUgc2VlbiBBbmRyZXcncyBjb21tZW50LCBhbmQgaGVuY2UgSSB0YWtlIGl0DQo+IHRoYXQg
dGhlIFItYiBhbHNvIGFwcGxpZXMgdG8gdGhlIGFkanVzdGVkIHZlcnNpb24gKG5vdCBwb3N0ZWQg
eWV0KToNCg0Kc29ycnkgSSdtIG5vdCBzdXJlIHdoaWNoIGNvbW1lbnQgaXMgcmVmZXJyZWQgaGVy
ZS4gSWYgeW91IHdpbGwNCmFueXdheSBzZW5kIG91dCBhIG5ldyB2ZXJzaW9uLCBwbGVhc2UgZHJv
cCBteSBSLWIgYW5kIEkgd2lsbA0KZG91YmxlIGNoZWNrIGFnYWluIHRob3VnaCB0aGUgYmVsb3cg
dmVyc2lvbiBhbG9uZSBsb29rcyBnb29kLg0KDQo+IA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZteC92bWNzLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jDQo+IEBAIC0x
MTQwLDggKzExNDAsMTMgQEAgc3RhdGljIGludCBjb25zdHJ1Y3Rfdm1jcyhzdHJ1Y3QgdmNwdSAq
dg0KPiAgICAgICAgICB2bXhfY2xlYXJfbXNyX2ludGVyY2VwdCh2LCBNU1JfSUEzMl9TWVNFTlRF
Ul9DUywgVk1YX01TUl9SVyk7DQo+ICAgICAgICAgIHZteF9jbGVhcl9tc3JfaW50ZXJjZXB0KHYs
IE1TUl9JQTMyX1NZU0VOVEVSX0VTUCwgVk1YX01TUl9SVyk7DQo+ICAgICAgICAgIHZteF9jbGVh
cl9tc3JfaW50ZXJjZXB0KHYsIE1TUl9JQTMyX1NZU0VOVEVSX0VJUCwgVk1YX01TUl9SVyk7DQo+
ICsNCj4gKyAgICAgICAgaWYgKCAhKHYtPmFyY2guaHZtLnZteC5leGVjX2NvbnRyb2wgJiBDUFVf
QkFTRURfUkRUU0NfRVhJVElORykgKQ0KPiArICAgICAgICAgICAgdm14X2NsZWFyX21zcl9pbnRl
cmNlcHQodiwgTVNSX0lBMzJfVFNDLCBWTVhfTVNSX1IpOw0KPiArDQo+ICAgICAgICAgIGlmICgg
cGFnaW5nX21vZGVfaGFwKGQpICYmICghaXNfaW9tbXVfZW5hYmxlZChkKSB8fCBpb21tdV9zbm9v
cCkgKQ0KPiAgICAgICAgICAgICAgdm14X2NsZWFyX21zcl9pbnRlcmNlcHQodiwgTVNSX0lBMzJf
Q1JfUEFULCBWTVhfTVNSX1JXKTsNCj4gKw0KPiAgICAgICAgICBpZiAoICh2bWV4aXRfY3RsICYg
Vk1fRVhJVF9DTEVBUl9CTkRDRkdTKSAmJg0KPiAgICAgICAgICAgICAgICh2bWVudHJ5X2N0bCAm
IFZNX0VOVFJZX0xPQURfQk5EQ0ZHUykgKQ0KPiAgICAgICAgICAgICAgdm14X2NsZWFyX21zcl9p
bnRlcmNlcHQodiwgTVNSX0lBMzJfQk5EQ0ZHUywgVk1YX01TUl9SVyk7DQo+IA0KPiBwbHVzIHRo
aXMgZXh0cmEgdm14LmMgaHVuazoNCj4gDQo+IEBAIC0xMjQ5LDcgKzEyNjEsMTIgQEAgc3RhdGlj
IHZvaWQgdm14X3NldF9yZHRzY19leGl0aW5nKHN0cnVjdA0KPiAgICAgIHZteF92bWNzX2VudGVy
KHYpOw0KPiAgICAgIHYtPmFyY2guaHZtLnZteC5leGVjX2NvbnRyb2wgJj0gfkNQVV9CQVNFRF9S
RFRTQ19FWElUSU5HOw0KPiAgICAgIGlmICggZW5hYmxlICkNCj4gKyAgICB7DQo+ICAgICAgICAg
IHYtPmFyY2guaHZtLnZteC5leGVjX2NvbnRyb2wgfD0gQ1BVX0JBU0VEX1JEVFNDX0VYSVRJTkc7
DQo+ICsgICAgICAgIHZteF9zZXRfbXNyX2ludGVyY2VwdCh2LCBNU1JfSUEzMl9UU0MsIFZNWF9N
U1JfUik7DQo+ICsgICAgfQ0KPiArICAgIGVsc2UNCj4gKyAgICAgICAgdm14X2NsZWFyX21zcl9p
bnRlcmNlcHQodiwgTVNSX0lBMzJfVFNDLCBWTVhfTVNSX1IpOw0KPiAgICAgIHZteF91cGRhdGVf
Y3B1X2V4ZWNfY29udHJvbCh2KTsNCj4gICAgICB2bXhfdm1jc19leGl0KHYpOw0KPiAgfQ0KPiAN
Cj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
