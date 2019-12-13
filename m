Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3631F11E500
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:56:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iflNu-0000nj-SH; Fri, 13 Dec 2019 13:53:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8pyZ=2D=amazon.com=prvs=24328bf02=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iflNt-0000ne-CV
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:53:33 +0000
X-Inumbo-ID: f2f3f45c-1daf-11ea-8f0b-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2f3f45c-1daf-11ea-8f0b-12813bfff9fa;
 Fri, 13 Dec 2019 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576245212; x=1607781212;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p+5xSg1uZ1kcFAsPdYGxLl6LtaeUhcLFueqH1CTbIFw=;
 b=TepLoKimSurkobro0DFwALi4GKR88gr9/8NfsV8r43qrQgzn/ZYZXx/E
 Qag+u38euj2pUO3xSCDa+XdmKz5JLvB256nNMxsbykxTdfH0AP7fLn2Mi
 N61fUnvH42nGqJfeCm2Ore1zoxE396mqd6BKz2JHq9iQ9/UIqu4HCrdRL c=;
IronPort-SDR: +3IdKptKg11S62lpsrkFZvhd7FWS7N6fk1UvFIkX1AupvY/UiQk5XQu/mA0tzsaoSqmRqSaIl6
 w9ioFIiAK3Iw==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; 
   d="scan'208";a="4946449"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 13 Dec 2019 13:53:20 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id A710BA2AF5; Fri, 13 Dec 2019 13:53:16 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 13:53:16 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 13:53:15 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 13 Dec 2019 13:53:15 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
Thread-Index: AQHVsbS1kJ3BthO0hEaHKwCfCIG6jqe4CjuAgAACsgCAAALNgIAAAgQAgAACaICAAAE4sA==
Date: Fri, 13 Dec 2019 13:53:14 +0000
Message-ID: <52ba5440212540e691d0e998ff44448c@EX13D32EUC003.ant.amazon.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
 <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
 <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
In-Reply-To: <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gSsO8cmdlbiBH
cm/Dnw0KPiBTZW50OiAxMyBEZWNlbWJlciAyMDE5IDEzOjQ3DQo+IFRvOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBXZWkgTGl1DQo+IDx3bEB4ZW4ub3JnPjsgS29ucmFk
IFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9yZ2Uu
RHVubGFwQGV1LmNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPjsNCj4gUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+OyBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AY2l0cml4LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBSZTog
W1hlbi1kZXZlbF0gW1BBVENIIHYyXSBJT01NVTogbWFrZSBETUEgY29udGFpbm1lbnQgb2YNCj4g
cXVhcmFudGluZWQgZGV2aWNlcyBvcHRpb25hbA0KPiANCj4gT24gMTMuMTIuMTkgMTQ6MzgsIEph
biBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDEzLjEyLjIwMTkgMTQ6MzEsIErDvHJnZW4gR3Jvw58g
d3JvdGU6DQo+ID4+IE9uIDEzLjEyLjE5IDE0OjIxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+
IE9uIDEzLjEyLjIwMTkgMTQ6MTEsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+ID4+Pj4gT24gMTMu
MTIuMTkgMTM6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+Pj4+PiBDb250YWluaW5nIHN0aWxs
IGluIGZsaWdodCBETUEgd2FzIGludHJvZHVjZWQgdG8gd29yayBhcm91bmQgY2VydGFpbg0KPiA+
Pj4+PiBkZXZpY2VzIC8gc3lzdGVtcyBoYW5naW5nIGhhcmQgdXBvbiBoaXR0aW5nIGFuIElPTU1V
IGZhdWx0LiBQYXNzaW5nDQo+ID4+Pj4+IHRocm91Z2ggKHN1Y2gpIGRldmljZXMgKG9uIHN1Y2gg
c3lzdGVtcykgaXMgaW5oZXJlbnRseSBpbnNlY3VyZSAoYXMNCj4gPj4+Pj4gZ3Vlc3RzIGNvdWxk
IGVhc2lseSBhcnJhbmdlIGZvciBJT01NVSBmYXVsdHMgdG8gb2NjdXIpLiBEZWZhdWx0aW5nDQo+
IHRvDQo+ID4+Pj4+IGEgbW9kZSB3aGVyZSBhZG1pbnMgbWF5IG5vdCBldmVuIGJlY29tZSBhd2Fy
ZSBvZiBpc3N1ZXMgd2l0aCBkZXZpY2VzDQo+IGNhbg0KPiA+Pj4+PiBiZSBjb25zaWRlcmVkIHVu
ZGVzaXJhYmxlLiBUaGVyZWZvcmUgY29udmVydCB0aGlzIG1vZGUgb2Ygb3BlcmF0aW9uDQo+IHRv
DQo+ID4+Pj4+IGFuIG9wdGlvbmFsIG9uZSwgbm90IG9uZSBlbmFibGVkIGJ5IGRlZmF1bHQuDQo+
ID4+Pj4+DQo+ID4+Pj4+IFRoaXMgaW52b2x2ZXMgcmVzdXJyZWN0aW5nIGNvZGUgY29tbWl0IGVh
Mzg4Njc4MzFkYSAoIng4NiAvIGlvbW11Og0KPiBzZXQNCj4gPj4+Pj4gdXAgYSBzY3JhdGNoIHBh
Z2UgaW4gdGhlIHF1YXJhbnRpbmUgZG9tYWluIikgZGlkIHJlbW92ZSwgaW4gYQ0KPiBzbGlnaHRs
eQ0KPiA+Pj4+PiBleHRlbmRlZCBhbmQgYWJzdHJhY3RlZCBmYXNoaW9uLiBIZXJlLCBpbnN0ZWFk
IG9mIHJlaW50cm9kdWNpbmcgYQ0KPiBwcmV0dHkNCj4gPj4+Pj4gcG9pbnRsZXNzIHVzZSBvZiAi
Z290byIgaW4gZG9tYWluX2NvbnRleHRfdW5tYXAoKSwgYW5kIGluc3RlYWQgb2YNCj4gbWFraW5n
DQo+ID4+Pj4+IHRoZSBmdW5jdGlvbiAoYXQgbGVhc3QgdGVtcG9yYXJpbHkpIGluY29uc2lzdGVu
dCwgdGFrZSB0aGUNCj4gb3Bwb3J0dW5pdHkNCj4gPj4+Pj4gYW5kIHJlcGxhY2UgdGhlIG90aGVy
IHNpbWlsYXJseSBwb2ludGxlc3MgImdvdG8iIGFzIHdlbGwuDQo+ID4+Pj4+DQo+ID4+Pj4+IElu
IG9yZGVyIHRvIGtleSB0aGUgcmUtaW5zdGF0ZWQgYnlwYXNzZXMgb2ZmIG9mIHRoZXJlIChub3Qp
IGJlaW5nIGENCj4gcm9vdA0KPiA+Pj4+PiBwYWdlIHRhYmxlIHRoaXMgZnVydGhlciByZXF1aXJl
cyBtb3ZpbmcgdGhlDQo+IGFsbG9jYXRlX2RvbWFpbl9yZXNvdXJjZXMoKQ0KPiA+Pj4+PiBpbnZv
Y2F0aW9uIGZyb20gcmVhc3NpZ25fZGV2aWNlKCkgdG8gYW1kX2lvbW11X3NldHVwX2RvbWFpbl9k
ZXZpY2UoKQ0KPiAob3INCj4gPj4+Pj4gZWxzZSByZWFzc2lnbl9kZXZpY2UoKSB3b3VsZCBhbGxv
Y2F0ZSBhIHJvb3QgcGFnZSB0YWJsZSBhbnl3YXkpOw0KPiB0aGlzIGlzDQo+ID4+Pj4+IGJlbmln
biB0byB0aGUgc2Vjb25kIGNhbGxlciBvZiB0aGUgbGF0dGVyIGZ1bmN0aW9uLg0KPiA+Pj4+Pg0K
PiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
ID4+Pj4+IC0tLQ0KPiA+Pj4+PiBBcyBmYXIgYXMgNC4xMyBpcyBjb25jZXJuZWQsIEkgZ3Vlc3Mg
aWYgd2UgY2FuJ3QgY29tZSB0byBhbg0KPiBhZ3JlZW1lbnQNCj4gPj4+Pj4gaGVyZSwgdGhlIG9u
bHkgb3RoZXIgb3B0aW9uIGlzIHRvIHJldmVydCBlYTM4ODY3ODMxZGEgZnJvbSB0aGUNCj4gYnJh
bmNoLA0KPiA+Pj4+PiBmb3IgaGF2aW5nIGJlZW4gY29tbWl0dGVkIHByZW1hdHVyZWx5IChJJ20g
bm90IHNvIG11Y2ggd29ycmllZCBhYm91dA0KPiB0aGUNCj4gPj4+Pj4gbWFzdGVyIGJyYW5jaCwg
d2hlcmUgd2UgaGF2ZSBhbXBsZSB0aW1lIHVudGlsIDQuMTQpLiBXaGF0IEkgc3VyZWx5DQo+IHdh
bnQNCj4gPj4+Pj4gdG8gc2VlIHVzIGF2b2lkIGlzIGEgYmFjayBhbmQgZm9ydGggaW4gYmVoYXZp
b3Igb2YgcmVsZWFzZWQNCj4gdmVyc2lvbnMuDQo+ID4+Pj4+IChOb3RlIHRoYXQgNC4xMi4yIGlz
IHNpbWlsYXJseSBibG9ja2VkIG9uIGEgZGVjaXNpb24gZWl0aGVyIHdheQ0KPiBoZXJlLikNCj4g
Pj4+Pg0KPiA+Pj4+IEknbSBub3QgcmVhbGx5IHN1cmUgd2UgcmVhbGx5IG5lZWQgdG8gcmV2ZXJ0
IGVhMzg4Njc4MzFkYSBiZWZvcmUgdGhlDQo+ID4+Pj4gNC4xMyByZWxlYXNlLiBJdCBtaWdodCBu
b3QgYmUgb3B0aW1hbCwgYnV0IEknbSBxdWl0ZSBzdXJlIHRoZSBudW1iZXINCj4gb2YNCj4gPj4+
PiBjYXNlcyB3aGVyZSB0aGlzIGNvdWxkIGJlIGFuIGlzc3VlIGlzIHJhdGhlciBzbWFsbCBhbHJl
YWR5LCBhbmQgSQ0KPiB0ZW5kDQo+ID4+Pj4gdG8gYWdyZWUgd2l0aCBQYXVsIHRoYXQgYWRtaW5z
IHdobyByZWFsbHkgY2FyZSB3aWxsIG1vcmUgbGlrZWx5IHdhbnQNCj4gdG8NCj4gPj4+PiBzZWxl
Y3QgdGhlIG9wdGlvbiB3aGVyZSB0aGUgc3lzdGVtIHdpbGwgImp1c3Qgd29yayIuIElNTyB0aGUN
Cj4gIm5vdGljZWFibGUNCj4gPj4+PiBmYWlsdXJlIiBpcyBzb21ldGhpbmcgd2hpY2ggd2lsbCBi
ZSBzZWxlY3RlZCBtb3N0bHkgYnkgZGV2ZWxvcGVycy4NCj4gQnV0DQo+ID4+Pj4gSSdtIG5vdCBh
biBleHBlcnQgaW4gdGhhdCBhcmVhLCBzbyBJIGRvbid0IHdhbnQgdG8gaW5mbHVlbmNlIHRoZQ0K
PiA+Pj4+IGRlY2lzaW9uIHJlZ2FyZGluZyB0aGUgdG8gYmUgc2VsZWN0ZWQgZGVmYXVsdCB0b28g
bXVjaC4NCj4gPj4+DQo+ID4+PiBBbiBhZG1pbiBub3Qgd2FudGluZyB0byBrbm93IGlzLCB0byBt
ZSwgdGhlIHNhbWUgYXMgdGhlbSBub3Qgd2FudGluZw0KPiA+Pj4gdG8ga25vdyBhYm91dCBzZWN1
cml0eSBpc3N1ZXMsIGFuZCBoZW5jZSBub3Qgc3Vic2NyaWJpbmcgdG8gb3VyDQo+ID4+PiBhbm5v
dW5jZW1lbnRzIGxpc3RzLiBJIGNhbiBhY2NlcHQgdGhpcyBiZWluZyBhIHJlYXNvbmFibGUgdGhp
bmcgdG8NCj4gPj4+IGRvIHdoZW4gaXQgaXMgYW4gX2luZm9ybWVkXyBkZWNpc2lvbi4gQnV0IHdp
dGggdGhlIGN1cnJlbnQNCj4gPj4+IGFycmFuZ2VtZW50cyB0aGVyZSdzIG5vIHdheSB3aGF0c29l
dmVyIGZvciBhbiBhZG1pbiB0byBrbm93Lg0KPiA+Pg0KPiA+PiBNYXliZSBJIGhhdmUgbWlzdW5k
ZXJzdG9vZCB0aGUgY3VycmVudCBzdGF0ZSwgYnV0IEkgdGhvdWdodCB0aGF0IGl0DQo+ID4+IHdv
dWxkIGp1c3Qgc2lsZW50bHkgaGlkZSBxdWlya3kgZGV2aWNlcyB3aXRob3V0IGltcG9zaW5nIGEg
c2VjdXJpdHkNCj4gPj4gcmlzay4gV2Ugd291bGQgbm90IGxlYXJuIHdoaWNoIGRldmljZXMgYXJl
IHF1aXJreSwgYnV0IE9UT0ggSSBkb3VidA0KPiA+PiB3ZSdkIGdldCBtYW55IHJlcG9ydHMgYWJv
dXQgdGhvc2UgaW4gY2FzZSB5b3VyIHBhdGNoIGdvZXMgaW4uDQo+ID4NCj4gPiBXZSBkb24ndCB3
YW50IG9yIG5lZWQgc3VjaCByZXBvcnRzLCB0aGF0J3Mgbm90IHRoZSBwb2ludC4gVGhlDQo+ID4g
c2VjdXJpdHkgcmlzayBjb21lcyBmcm9tIHRoZSBxdWlya2luZXNzIG9mIHRoZSBkZXZpY2VzIC0g
YWRtaW5zDQo+ID4gbWF5IHdyb25nbHkgdGhpbmsgYWxsIGlzIHdlbGwgYW5kIGV4cG9zZSBxdWly
a3kgZGV2aWNlcyB0byBub3QNCj4gPiBzdWZmaWNpZW50bHkgdHJ1c3RlZCBndWVzdHMuIChJIHNh
eSB0aGlzIGZ1bGx5IHJlYWxpemluZyB0aGF0DQo+ID4gZXhwb3NpbmcgZGV2aWNlcyB0byB1bnRy
dXN0ZWQgZ3Vlc3RzIGlzIGFsbW9zdCBhbHdheXMgYSBjZXJ0YWluDQo+ID4gbGV2ZWwgb2Ygcmlz
ay4pDQo+IA0KPiBEbyB3ZSBfa25vd18gdGhvc2UgZGV2aWNlcyBhcmUgcHJvYmxlbWF0aWMgZnJv
bSBzZWN1cml0eSBzdGFuZHBvaW50Pw0KPiBOb3JtYWxseSB0aGUgSU9NTVUgc2hvdWxkIGRvIHRo
ZSBpc29sYXRpb24ganVzdCBmaW5lLiBJZiBpdCBkb2Vzbid0DQo+IHRoZW4gaXRzIG5vdCB0aGUg
cXVpcmt5IGRldmljZSB3aGljaCBpcyBwcm9ibGVtYXRpYywgYnV0IHRoZSBJT01NVS4NCj4gDQo+
IEkgdGhvdWdodCB0aGUgcHJvYmxlbSB3YXMgdGhhdCB0aGUgcXVpcmt5IGRldmljZXMgd291bGQg
bm90IHN0b3AgYWxsDQo+IChyZWFkKSBETUEgZXZlbiB3aGVuIGJlaW5nIHVuYXNzaWduZWQgZnJv
bSB0aGUgZ3Vlc3QgcmVzdWx0aW5nIGluDQo+IGZhdGFsIElPTU1VIGZhdWx0cy4gVGhlIGR1bW15
IHBhZ2Ugc2hvdWxkIHN0b3AgdGhvc2UgZmF1bHRzIHRvIGhhcHBlbg0KPiByZXN1bHRpbmcgaW4g
YSBtb3JlIHN0YWJsZSBzeXN0ZW0uDQoNClRoYXQncyByaWdodC4NCg0KPiANCj4gU28gd2hhdCBh
cmUgdGhlIHNlY3VyaXR5IHByb2JsZW1zIHdoaWNoIGFyZSBhZGRlZCBieSB0aGlzIGJlaGF2aW9y
Pw0KPiANCg0KU2luY2UgKm5vdCogaGF2aW5nIHRoZSAnc2luaycgcGFnZSBhbGxvd3MgYSBndWVz
dCBwdWxsIG9mZiBhIGhvc3QgRG9TIGluIHRoZSBwcmVzZW5jZSBvZiBzdWNoIGgvdywgc2VjdXJp
dHkgaXMgc3VyZWx5IGluY3JlYXNlZCBieSBoYXZpbmcgaXQ/DQoNCiAgUGF1bA0KDQo+IA0KPiBK
dWVyZ2VuDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
