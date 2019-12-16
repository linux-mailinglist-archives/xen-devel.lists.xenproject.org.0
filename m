Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D597611FE4F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 07:01:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igjP5-0001FO-Mu; Mon, 16 Dec 2019 05:58:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtFZ=2G=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1igjP4-0001FI-Al
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 05:58:46 +0000
X-Inumbo-ID: 18de8c3e-1fc9-11ea-88e7-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18de8c3e-1fc9-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 05:58:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Dec 2019 21:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,320,1571727600"; d="scan'208";a="209194713"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga008.jf.intel.com with ESMTP; 15 Dec 2019 21:58:34 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Dec 2019 21:58:34 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 15 Dec 2019 21:58:33 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 15 Dec 2019 21:58:33 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.90]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.222]) with mapi id 14.03.0439.000;
 Mon, 16 Dec 2019 13:58:31 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [PATCH v2] IOMMU: make DMA containment of quarantined devices
 optional
Thread-Index: AQHVsbRLjoLF7aH0ZUm8KKdzBiHCg6e3hCCAgAACsgCAAALMgIAAAgQAgAACaYCAAAbwgIAAA40AgAAFvoCAAA45gIAEk05w
Date: Mon, 16 Dec 2019 05:58:31 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D642F5F@SHSMSX104.ccr.corp.intel.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
 <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
 <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
 <52a69b85-4c37-cf43-2f66-27eaf36da81a@suse.com>
 <604fd3ed-b9c0-6d61-efd9-5e0aaf750076@suse.com>
 <a37ad5d9-6961-a087-c111-bf525e00c1e4@suse.com>
 <826310cd-e82c-6d95-35f5-628d3df888cf@suse.com>
In-Reply-To: <826310cd-e82c-6d95-35f5-628d3df888cf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZWE1N2NjZDItZmUzYy00MGZmLTkyOTctOGNiYmQyMThkZDgwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoielJLR0Fma2l3Qmtlbmp0NE9lZUx0eCt1aDUwRjRjeWlEVm9sa04zWVdSSlduXC9lNUdZSURGS0tjMjFwaUU3Vk0ifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
RGVjZW1iZXIgMTMsIDIwMTkgMTE6MzYgUE0NCj4gDQo+IE9uIDEzLjEyLjE5IDE1OjQ1LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4gPiBPbiAxMy4xMi4yMDE5IDE1OjI0LCBKw7xyZ2VuIEdyb8OfIHdy
b3RlOg0KPiA+PiBPbiAxMy4xMi4xOSAxNToxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+PiBP
biAxMy4xMi4yMDE5IDE0OjQ2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPiA+Pj4+IE9uIDEzLjEy
LjE5IDE0OjM4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+Pj4gT24gMTMuMTIuMjAxOSAxNDoz
MSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4gPj4+Pj4+IE1heWJlIEkgaGF2ZSBtaXN1bmRlcnN0
b29kIHRoZSBjdXJyZW50IHN0YXRlLCBidXQgSSB0aG91Z2h0IHRoYXQgaXQNCj4gPj4+Pj4+IHdv
dWxkIGp1c3Qgc2lsZW50bHkgaGlkZSBxdWlya3kgZGV2aWNlcyB3aXRob3V0IGltcG9zaW5nIGEg
c2VjdXJpdHkNCj4gPj4+Pj4+IHJpc2suIFdlIHdvdWxkIG5vdCBsZWFybiB3aGljaCBkZXZpY2Vz
IGFyZSBxdWlya3ksIGJ1dCBPVE9IIEkgZG91YnQNCj4gPj4+Pj4+IHdlJ2QgZ2V0IG1hbnkgcmVw
b3J0cyBhYm91dCB0aG9zZSBpbiBjYXNlIHlvdXIgcGF0Y2ggZ29lcyBpbi4NCj4gPj4+Pj4NCj4g
Pj4+Pj4gV2UgZG9uJ3Qgd2FudCBvciBuZWVkIHN1Y2ggcmVwb3J0cywgdGhhdCdzIG5vdCB0aGUg
cG9pbnQuIFRoZQ0KPiA+Pj4+PiBzZWN1cml0eSByaXNrIGNvbWVzIGZyb20gdGhlIHF1aXJraW5l
c3Mgb2YgdGhlIGRldmljZXMgLSBhZG1pbnMNCj4gPj4+Pj4gbWF5IHdyb25nbHkgdGhpbmsgYWxs
IGlzIHdlbGwgYW5kIGV4cG9zZSBxdWlya3kgZGV2aWNlcyB0byBub3QNCj4gPj4+Pj4gc3VmZmlj
aWVudGx5IHRydXN0ZWQgZ3Vlc3RzLiAoSSBzYXkgdGhpcyBmdWxseSByZWFsaXppbmcgdGhhdA0K
PiA+Pj4+PiBleHBvc2luZyBkZXZpY2VzIHRvIHVudHJ1c3RlZCBndWVzdHMgaXMgYWxtb3N0IGFs
d2F5cyBhIGNlcnRhaW4NCj4gPj4+Pj4gbGV2ZWwgb2Ygcmlzay4pDQo+ID4+Pj4NCj4gPj4+PiBE
byB3ZSBfa25vd18gdGhvc2UgZGV2aWNlcyBhcmUgcHJvYmxlbWF0aWMgZnJvbSBzZWN1cml0eSBz
dGFuZHBvaW50Pw0KPiA+Pj4+IE5vcm1hbGx5IHRoZSBJT01NVSBzaG91bGQgZG8gdGhlIGlzb2xh
dGlvbiBqdXN0IGZpbmUuIElmIGl0IGRvZXNuJ3QNCj4gPj4+PiB0aGVuIGl0cyBub3QgdGhlIHF1
aXJreSBkZXZpY2Ugd2hpY2ggaXMgcHJvYmxlbWF0aWMsIGJ1dCB0aGUgSU9NTVUuDQo+ID4+Pj4N
Cj4gPj4+PiBJIHRob3VnaHQgdGhlIHByb2JsZW0gd2FzIHRoYXQgdGhlIHF1aXJreSBkZXZpY2Vz
IHdvdWxkIG5vdCBzdG9wIGFsbA0KPiA+Pj4+IChyZWFkKSBETUEgZXZlbiB3aGVuIGJlaW5nIHVu
YXNzaWduZWQgZnJvbSB0aGUgZ3Vlc3QgcmVzdWx0aW5nIGluDQo+ID4+Pj4gZmF0YWwgSU9NTVUg
ZmF1bHRzLiBUaGUgZHVtbXkgcGFnZSBzaG91bGQgc3RvcCB0aG9zZSBmYXVsdHMgdG8NCj4gaGFw
cGVuDQo+ID4+Pj4gcmVzdWx0aW5nIGluIGEgbW9yZSBzdGFibGUgc3lzdGVtLg0KPiA+Pj4NCj4g
Pj4+IElPTU1VIGZhdWx0cyBieSB0aGVtc2VsdmVzIGFyZSBub3QgaW1wYWN0aW5nIHN0YWJpbGl0
eSAodGhleSB3aWxsDQo+ID4+PiBhZGQgcHJvY2Vzc2luZyBvdmVyaGVhZCwgeWVzKS4gVGhlIHBy
b2JsZW0sIGFjY29yZGluZyB0byBQYXVsJ3MNCj4gPj4+IGRlc2NyaXB0aW9uLCBpcyB0aGF0IHRo
ZSBvY2N1cnJlbmNlIG9mIGF0IGxlYXN0IHNvbWUgZm9ybXMgb2YgSU9NTVUNCj4gPj4+IGZhdWx0
cyAobm90IHByZXNlbnQgb25lcyBhcyBpdCBzZWVtcywgYXMgb3Bwb3NlZCB0byBwZXJtaXNzaW9u
DQo+ID4+PiB2aW9sYXRpb24gb25lcykgaXMgZmF0YWwgdG8gY2VydGFpbiBzeXN0ZW1zLiBJcnJl
c3BlY3RpdmUgb2YgdGhlDQo+ID4+PiBzaW5rIHBhZ2UgdXNlZCBhZnRlciBkZS1hc3NpZ25tZW50
IGEgZ3Vlc3QgY2FuIGFycmFuZ2UgZm9yIElPTU1VDQo+ID4+PiBmYXVsdHMgdG8gb2NjdXIgZXZl
biB3aGlsZSBpdCBzdGlsbCBoYXMgdGhlIGRldmljZSBhc3NpZ25lZC4gSGVuY2UNCj4gPj4+IGl0
IGlzIGltcG9ydGFudCBmb3IgdGhlIGFkbWluIHRvIGtub3cgdGhhdCB0aGVpciBzeXN0ZW0gKG5v
dCB0aGUNCj4gPj4+IHRoZSBwYXJ0aWN1bGFyIGRldmljZSkgYmVoYXZlcyBpbiB0aGlzIHVuZGVz
aXJhYmxlIHdheS4NCj4gPj4NCj4gPj4gU28gaG93IGRvZXMgdGhlIGFkbWluIGxlYXJuIHRoaXM/
IEl0cyBub3QgYXMgaWYgeW91ciBwYXRjaCB3b3VsZCByZXN1bHQNCj4gPj4gaW4gYSBzeXN0ZW0g
Y3Jhc2ggb3IgaGFuZyBhbGwgdGhlIHRpbWUsIHJpZ2h0PyBUaGlzIHdvdWxkIGJlIHRoZSBjYXNl
DQo+ID4+IG9ubHkgaWYgdGhlcmUgZWl0aGVyIGlzIGEgbWFsaWNpb3VzIChvbiBwdXJwb3NlIG9y
IGR1ZSB0byBhIGJ1ZykgZ3Vlc3QNCj4gPj4gd2hpY2ggZ2V0cyB0aGUgZGV2aWNlIGFzc2lnbmVk
LCBvciBpZiB0aGVyZSBoYXBwZW5zIHRvIGJlIGEgcGVuZGluZyBETUENCj4gPj4gb3BlcmF0aW9u
IHdoZW4gdGhlIGRldmljZSBnZXRzIHVuYXNzaWduZWQuDQo+ID4NCj4gPiBJIGRpZG4ndCBjbGFp
bSB0aGUgY2hhbmdlIHdvdWxkIGNvdmVyIGFsbCBjYXNlcy4gQWxsIEkgYW0gY2xhaW1pbmcNCj4g
PiBpcyB0aGF0IGl0IGluY3JlYXNlcyB0aGUgY2hhbmNlcyBvZiBhZG1pbnMgYmVjb21pbmcgYXdh
cmUgb2YgcmVhc29ucw0KPiA+IG5vdCB0byBwYXNzIHRocm91Z2ggZGV2aWNlcyB0byBjZXJ0YWlu
IGd1ZXN0cy4NCj4gDQo+IFNvIGNvbWJpbmVkIHdpdGggeW91ciBhbnN3ZXIgdGhpcyBtZWFucyB0
byBtZToNCj4gDQo+IFdpdGggeW91ciBwYXRjaCAob3IgdGhlIG9yaWdpbmFsIG9uZSByZXZlcnRl
ZCkgYSBEb1Mgd2lsbCBvY2N1ciBlaXRoZXINCj4gZHVlIHRvIGEgbWFsaWNpb3VzIGd1ZXN0IG9y
IGluIGNhc2UgYSBETUEgaXMgc3RpbGwgcGVuZGluZy4gQXMgYSByZXN1bHQNCj4gdGhlIGFkbWlu
IHdpbGwgbm8gbG9uZ2VyIHBhc3MgdGhpcyBkZXZpY2UgdG8gYW55IHVudHJ1c3RlZCBndWVzdC4N
Cj4gDQo+IFdpdGggdGhlIGN1cnJlbnQgNC4xMy1zdGFnaW5nIGEgRG9TIHdpbGwgb2NjdXIgb25s
eSBkdWUgdG8gYSBtYWxpY2lvdXMNCj4gZ3Vlc3QuIFRoZSBhZG1pbiB3aWxsIHRoZW4gbm8gbG9u
Z2VyIHBhc3MgdGhpcyBkZXZpY2UgdG8gYW55IHVudHJ1c3RlZA0KPiBndWVzdC4NCj4gDQo+IFNv
IHJpZ2h0IG5vdyB3aXRob3V0IGFueSB1bnRydXN0ZWQgZ3Vlc3Qgbm8gRG9TLCB3aGlsZSBwb3Nz
aWJseSBEb1Mgd2l0aA0KPiB5b3VyIHBhdGNoLiBIb3cgaXMgdGhhdCBiZXR0ZXI/DQo+IA0KDQpJ
J2Qgc3VnZ2VzdCBzZXBhcmF0aW5nIHJ1bi10aW1lIERvUyBmcm9tIG9yaWdpbmFsIHF1YXJhbnRp
bmUgcHVycG9zZQ0Kb2YgdGhpcyBwYXRjaC4NCg0KRm9yIHF1YXJhbnRpbmUsIEknbSB3aXRoIEph
biB0aGF0IGdpdmluZyBhZG1pbiB0aGUgY2hhbmNlIG9mIGtub3dpbmcNCndoZXRoZXIgcXVhcmFu
dGluZSBpcyByZXF1aXJlZCBpcyBpbXBvcnRhbnQuIFNheSBhbiBhZG1pbiBqdXN0IGdldHMNCmEg
c2FtcGxlIGRldmljZSBmcm9tIGEgbmV3IHZlbmRvciBhbmQgbmVlZHMgdG8gZGVjaWRlIHdoZXRo
ZXIgaGlzDQplbXBsb3llciBzaG91bGQgcHV0IHN1Y2ggZGV2aWNlIGluIHRoZWlyIHByb2R1Y3Rp
b24gc3lzdGVtLiBJdCdzDQplc3NlbnRpYWwgdG8gaGF2ZSBhIGRlZmF1bHQgY29uZmlndXJhdGlv
biB3aGljaCBjYW4gd2FybiBvbiBhbnkgDQpwb3NzaWJsZSB2aW9sYXRpb24gb2YgdGhlIGV4cGVj
dGF0aW9ucyBvbiBhIGdvb2QgYXNzaWduYWJsZSBkZXZpY2UuIA0KVGhlbiB0aGUgYWRtaW4gY2Fu
IGxvb2sgYXQgWGVuIHVzZXIgZ3VpZGUgdG8gZmluZCBvdXQgd2hhdCB0aGUgd2FybmluZw0KaW5m
b3JtYXRpb24gbWVhbnMgYW5kIHRoZW4gZG9lcyB3aGF0ZXZlciByZXF1aXJlZCAodXN1YWxseSBt
ZWFucw0KbW9yZSBzY3J1dGluaXphdGlvbiB0aGFuIHRoZSB3YXJuaW5nIGl0c2VsZikgdG8gZmln
dXJlIG91dCB3aGV0aGVyIA0KaWRlbnRpZmllZCBwcm9ibGVtcyBhcmUgc2FmZSAoZS5nLiBieSBl
bmFibGluZyBxdWFyYW50aW5lKSBvciBhcmUNCnJlYWwgaW5kaWNhdG9ycyBvZiBib2d1cyBpbXBs
ZW1lbnRhdGlvbiAodGhlbiBzaG91bGQgbm90IHVzZSBpdCkuDQpIYXZpbmcgcXVhcmFudGluZSBk
ZWZhdWx0IG9uIG1lYW5zIHRoYXQgZXZlcnkgYWRtaW4gc2hvdWxkIHJlbWVtYmVyDQp0aGF0IFhl
biBhbHJlYWR5IGVuYWJsZXMgc29tZSBiYW5kLWFpZHMgb24gYmVuaWduIHdhcm5pbmdzIHNvIGhl
DQpzaG91bGQgZXhwbGljaXRseSB0dXJuIG9mZiB0aG9zZSBvcHRpb25zIHRvIGRvIGV2YWx1YXRp
b24gd2hpY2gsIHRvIG1lDQppcyBub3QgcmVhbGlzdGljLg0KDQpPbiB0aGUgb3RoZXIgaGFuZCwg
YWx0aG91Z2ggYSBzaW5rIHBhZ2UgY2FuIGhlbHAgbWl0aWdhdGUgcnVuLXRpbWUgRG9TLA0KaG93
IHRvIGhhbmRsZSBpdCBzaG91bGQgYmUgYW4gYWRtaW4gcG9saWN5LiBJZiBEb1MgaXMgY2F1c2Vk
IGJ5IA0KbWFsaWNpb3VzIGd1ZXN0LCBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIHdhcm4gdGhlIGFk
bWluIGFuZCB0aGVuIHN3aXRjaA0KdG8gc2luayBwYWdlIGFmdGVyIG1lZXRpbmcgYSBEb1MgZGV0
ZWN0aW9uIGNvbmRpdGlvbiAoZS5nLiBudW1iZXIgb2YNCmZhdWx0cyB3aXRoaW4gYSB0aW1pbmcg
d2luZG93IGV4Y2VlZHMgYSB0aHJlc2hvbGQpLiBMb3RzIG9mIHN1Y2ggd2FybmluZ3MNCmZyb20g
bXVsdGlwbGUgVk1zIG1heSBpbXBseSBhIG1hc3NpdmUgYXR0YWNrIHRoZW4gdGhlIGFkbWluIG1h
eSBhZG9wdA0KbW9yZSBjb21wcmVoZW5zaXZlIGFuYWx5c2lzIG9yIGRlZmVuc2l2ZSBtZWFucy4g
VGhlbiBpdCdzIGFsc28gcG9zc2libGUNCnRoYXQgRG9TIGlzIGNhdXNlZCBieSBhIHZ1bG5lcmFi
aWxpdHkgd2l0aGluIHRoZSBndWVzdC4gSW4gc3VjaCBjYXNlLCB0aGUNCmd1ZXN0IG1heSB3YW50
IHRvIGNvbnRhaW4gdGhlIERvUyBhdHRhY2sgaXRzZWxmIHRocm91Z2ggYSB2aXJ0dWFsIElPTU1V
Lg0KVGhlbiBYZW4gbmVlZHMgdG8ga25vdyB0aGUgZmF1bHQgYW5kIHRoZW4gZm9yd2FyZCB0byB0
aGUgZ3Vlc3QgdGhyb3VnaA0KdGhlIHZJT01NVS4gSW4gZWl0aGVyIGNhc2UgSSBkb24ndCB0aGlu
ayBjdXJyZW50IHBhdGNoIGlzIHN1ZmZpY2llbnQuIFNvIGl0J3MNCmJldHRlciB0byBsZWF2ZSBE
b1MgaW1wcm92ZWQgc2VwYXJhdGVseSAob2YgY291cnNlIHRoZSBzaW5rIGxvZ2ljIGNhbiBiZSAN
CmxldmVyYWdlZCksIGdpdmVuIHRoZSB0aW1lbGluZSBvZiA0LjEzLiANCg0KVGhhbmtzDQpLZXZp
bg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
