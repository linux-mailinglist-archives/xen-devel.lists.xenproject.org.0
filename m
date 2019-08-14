Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA98D355
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 14:39:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxsVq-0001lp-9p; Wed, 14 Aug 2019 12:36:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GkAm=WK=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxsVo-0001lk-33
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 12:36:20 +0000
X-Inumbo-ID: 1d26384a-be90-11e9-8474-576a3b284712
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d26384a-be90-11e9-8474-576a3b284712;
 Wed, 14 Aug 2019 12:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565786179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Kf/yeaGyAr1jHNdbmdaO+MvjNG45pACV7Wn1r9WlBo=;
 b=g20AJzB/rV8f1w9ycsN0Xc/LhLidi3WMq2w0DinmvoTn+tLx/FJxaESo
 rUstZIeb9sgGdpzihn7/7gj9TB19nGhx8RJsBymYffw0zrK/5fTSRHbhK
 AgZOX++okH63ERCtWjgVP6c6hq8YoEX0DBoZK7BApmEaDCa4HAgcYPIU8 k=;
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
IronPort-SDR: B2PAP1VOaZD6TfRSI9RX+hN1JNCBrZJLHunRTslPzDDMsPTRfBGC9/IE9lOExbc9sEh+ZAkS/j
 EM/0c0OYp9JBsZaEs6TDZxwnN14lP3LLF+E+/f6T3p7UJsXm40EfmSBVfEtRPeVh8Pg7tHPCdl
 2bg+VjPytLfuX3grTSbmHHPT1ARuc3Pw1k56I+JcFR2MdXC+Ble0A5tg7G/ey2j2588x5XTvPQ
 nrLYMH2e7B2B3SPUN0ZkkO2/S0jREnArsOMDWtqtQ3SmFqP4jvAPH16Ftw8RmOKrgxfByrn+KA
 b4I=
X-SBRS: 2.7
X-MesageID: 4251238
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,385,1559534400"; 
   d="scan'208";a="4251238"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH 5/6] iommu: tidy up iommu_us_hap_pt() and
 need_iommu_pt_sync() macros
Thread-Index: AQHVRuOcR30mXE7x90iLttuoVGpOQKbvafsAgAsWnkD//+QDAIAAIpGQ///kIICAACaCkP//9mEAAARemCA=
Date: Wed, 14 Aug 2019 12:35:57 +0000
Message-ID: <3e0736f5abb2460a865cc250e9b1b5a9@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-6-paul.durrant@citrix.com>
 <805cd751-819a-a7d6-0755-9e82bcde2a37@suse.com>
 <57e844af36d449d0a8961793e8649827@AMSPEX02CL03.citrite.net>
 <dcf5c21a-bce4-e315-9ae9-ac1f67c0c889@arm.com>
 <8e99da72bafe4b1a8a92e146b07a3082@AMSPEX02CL03.citrite.net>
 <da3a819d-6f04-a002-25a8-10ad209e6bc8@arm.com>
 <6c00b9a439aa4d57b2973752c8eaf393@AMSPEX02CL03.citrite.net>
 <bcfe1bab-fe1f-f6ae-52c9-8fa50b878963@arm.com>
In-Reply-To: <bcfe1bab-fe1f-f6ae-52c9-8fa50b878963@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 5/6] iommu: tidy up iommu_us_hap_pt() and
 need_iommu_pt_sync() macros
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+ID4+Pj4+Pj4gKy8qIEFyZSB3
ZSB1c2luZyB0aGUgZG9tYWluIFAyTSB0YWJsZSBhcyBpdHMgSU9NTVUgcGFnZXRhYmxlPyAqLw0K
PiA+Pj4+Pj4+ICsjZGVmaW5lIGlvbW11X3VzZV9oYXBfcHQoZCkgXA0KPiA+Pj4+Pj4+ICsgICAg
KGhhcF9lbmFibGVkKGQpICYmIGlzX2lvbW11X2VuYWJsZWQoZCkgJiYgaW9tbXVfaGFwX3B0X3No
YXJlKQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IERvZXMgdGhpcyBidWlsZCBmb3IgQXJtLCBzZWVpbmcg
dGhhdCB0aGVyZSdzIG5vIGhhcF9lbmFibGVkKCkNCj4gPj4+Pj4+IGRlZmluaXRpb24gdGhlcmU/
IE9yIGhhdmUgSSBtaXNzZWQgaXRzIGFkZGl0aW9uIGVhcmxpZXIgaW4gdGhpcw0KPiA+Pj4+Pj4g
c2VyaWVzPw0KPiA+Pj4+Pg0KPiA+Pj4+PiBJdCBtb3ZlZCB0byBjb21tb24gY29kZSBzY2hlZC5o
IGluIGFuIGVhcmxpZXIgcGF0Y2guDQo+ID4+Pj4NCj4gPj4+PiBJIHdlbnQgdGhyb3VnaCB0aGUg
c2VyaWVzIGFuZCBkaWRuJ3QgZmluZCB3aGVyZSBoYXBfZW5hYmxlZCgpIGlzIGRlZmluZWQgZm9y
IEFybQ0KPiA+Pj4+IGluIHRoaXMgc2VyaWVzLiBEbyB5b3UgbWluZCBwb2ludGluZyB0aGUgZXhh
Y3QgcGF0Y2g/DQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiBTb3JyeSwgSSB3YXNuJ3QgY2xlYXIuLi4g
VGhlIGNoYW5nZSBpcyBpbiBteSBvdGhlciBzZXJpZXMsICJ1c2Ugc3Rhc2hlZCBkb21haW4gY3Jl
YXRlIGZsYWdzIiwNCj4gd2hpY2gNCj4gPj4gaXMgYSBwcmUtcmVxdWlzaXRlIGZvciB0aGlzIHNl
cmllcyAoYXMgY2FsbGVkIG91dCBpbiB0aGUgY292ZXIgbGV0dGVyKS4gVGhlIGNoYW5nZSBpcyBt
YWRlIGluIHBhdGNoDQo+ICMyDQo+ID4+IG9mIHRoYXQgc2VyaWVzOiBodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDcvbXNnMDIyNTYuaHRt
bC4NCj4gPj4NCj4gPj4gT2guIEkgdW5kZXJzdGFuZCB0aGlzIGFkZHMgYmVuZWZpdHMgYXMgdGhl
IGltcGxlbWVudGF0aW9uIGlzIG5vdyBjb21tb24uIEJ1dCB0aGUNCj4gPj4gZG93bnNpZGUgaXMg
aGFwX2VuYWJsZWQoKSB3aWxsIG5vdyByZXF1aXJlIGV2YWx1YXRpb24gb24gQXJtIGV2ZW4gaXQg
aXMNCj4gPj4gZXZhbHVhdGVzIHRvIHRydWUuLi4gVGhpcyB3aWxsIHByZXZlbnQgdGhlIGNvbXBp
bGVyIHRvIHJlbW92ZSBhbnkgbm9uLUhBUCBjb2RlDQo+ID4+IHBhdGhzIChhc3N1bWluZyB0aGVy
ZSBhcmUgYW55IGluIHRoZSBjb21tb24gY29kZSkuDQo+ID4NCj4gPiBUaGVyZSB3YXMgb25lIGlu
IHRoZSBjb21tb24gaW9tbXUgY29kZSB0aGF0IHRodXMgcmVxdWlyZWQgYSAjaWZkZWYgZm9yIEFS
TS4NCj4gDQo+IEFueSBDT05GSUdfe0FSTSwgWDg2fSBmZWVscyBhbiBhYnVzZSBvZiBjb21tb24g
Y29kZS4gU28gSSBhbSBhbHdheXMgaW4gZmF2b3Igb2YNCj4gZHJvcHBpbmcgdGhlbSA6KS4gTXkg
Y29uY2VybiBpcyB0aGF0IGEgZmV3IG9mIHRoZSBoZWxwZXJzIHdpbGwgbGlrZWx5IHJldHVybiBh
DQo+IHNpbmdsZSB2YWx1ZSBmb3IgYW55IGFyY2hpdGVjdHVyZSBieSB4ODYuIEJ1dCB0aGF0J3Mg
YSBkaWZmZXJlbnQgcHJvYmxlbS4uLg0KPiANCj4gPg0KPiA+Pg0KPiA+PiBGdXJ0aGVybW9yZSwg
MiBwYXJ0cyBvZiB0aGUgaW9tbXVfdXNlX2hhcF9wdCgpIGNvbmRpdGlvbiB3aWxsIGFsd2F5cyBy
ZXR1cm5pbmcNCj4gPj4gYWx3YXlzIHRydWUuIEJ1dCBhcyB0aGV5IGFyZSBub24tY29uc3RhbnQs
IHNvIHRoZXkgd2lsbCBhbHdheXMgYmUgZXZhbHVhdGVkLg0KPiA+Pg0KPiA+PiBJdCBpcyBhbHNv
IHByb2JhYmx5IGdvaW5nIHRvIGNvbmZ1c2UgZGV2ZWxvcGVyIGFzIHRoZXkgbWF5IHRoaW5rIG5v
bi1IQVAgaXMNCj4gPj4gc3VwcG9ydGVkIG9uIEFybS4gWW91IGNhbid0IGZpbmQgZWFzaWx5IHRo
YXQgYm90aCBoYXBfZW5hYmxlZCguLi4pIGFuZA0KPiA+PiBpb21tdV9oYXBfcHRfc2hhcmUgd2ls
bCBhbHdheXMgZXZhbHVhdGUgdG8gdHJ1ZS4NCj4gPj4NCj4gPj4gU28gYXNpZGUgdGhlIGNvbW1v
biBpbXBsZW1lbnRhdGlvbiwgd2hhdCBpcyB0aGUgcmVhbCBnYWluIGZvciBBcm0/DQo+ID4NCj4g
PiBUaGVyZSdzIG5vIHJlYWwgZ2FpbiBmb3IgQVJNLCB0aGUgZ2FpbiBpcyBpbiB0aGUgcmVkdWN0
aW9uIGluIGlmZGVmLWVyeSBhbmQgdGh1cyB0aWRpbmVzcyBvZiBjb2RlLiBJDQo+IGNvdWxkIHB1
dCBiYWNrIHNvbWUgaWZkZWZzIGlmIHlvdSdkIHByZWZlciwgb3IgSSBjb3VsZCBqdXN0IHB1dCBh
IGNvbW1lbnQgc3RhdGluZyB0aGF0DQo+IGlvbW11X3VzZV9oYXBfcHQoKSB3aWxsIGFsd2F5cyBi
ZSB0cnVlIGZvciBBUk0uIFdoaWNoIHdvdWxkIHlvdSBwcmVmZXI/DQo+IA0KPiBMb29raW5nIGF0
IHRoZSBwYXRjaCAjNiwgaW9tbXVfdXNlX2hhcF9wdCgpIGlzIHJlaW1wbGVtZW50ZWQgd2l0aDoN
Cj4gDQo+ICNkZWZpbmUgaW9tbXVfdXNlX2hhcF9wdChkKSAgICAgICAoZG9tX2lvbW11KGQpLT5o
YXBfcHRfc2hhcmUpDQo+IA0KPiBZb3UgYWxzbyBoYXZlIGEgY29tbWVudCBtZW50aW9uaW5nIEFy
bSBzeXN0ZW1zIGluIHRoZSBzYW1lIHBhdGNoLg0KPiANCj4gU28gSSB3b3VsZCBiZSBoYXBweSB3
aXRoIHRoaXMgcGF0Y2ggYXNzdW1pbmcgdGhhdCBwYXRjaCAjNiBkb2VzIG5vdCBjaGFuZ2UuDQo+
IA0KDQpPaywgdGhhbmtzLiBJJ2xsIHNlZSBhYm91dCBhZGRpbmcgYSBwYXRjaCBmb3IgYXJjaCBz
cGVjaWZpYyBkZWZzIG9mIHRoaW5ncyBsaWtlIGlzX2h2bV9kb21haW4oKSBhbmQgaXNfcHZfZG9t
YWluKCksIGFuZCBoYXBfZW5hYmxlZCgpLg0KDQogIFBhdWwNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
