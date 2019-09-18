Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84285B5EA3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 10:06:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAUus-00021r-Gu; Wed, 18 Sep 2019 08:02:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cE4e=XN=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iAUur-00021I-3W
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 08:02:21 +0000
X-Inumbo-ID: a27e3c5c-d9ea-11e9-9627-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a27e3c5c-d9ea-11e9-9627-12813bfff9fa;
 Wed, 18 Sep 2019 08:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568793739;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=82Jl4eSd1fQDtHDIvaAF0D9wr+oeDLcuHji7pzzjmdI=;
 b=M0HEd4OZ4CX7YKTPfL7DcbXCd5NcCHt1jEooLIzBgaxOVjW+DYDkuTH6
 ziEgSEdMmhe+dlUsgh/eCp65La7VGBEoAZm+DSiDaV3/Ig/spjER3s/V/
 aWnMzKx9je6dfFdw9rVzcF8hcQblfNuW3ixdjaIdgvF7+DQvSlAf1x8bo Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5ObLy3D4rtmFpRRmRW7d8guQNv5mnLNQlz7W7KwRAtO19aVFANYUtwuE4sYfujTScOm3hLYmmc
 hszTV669aGKNom0BE0eFSHqWDsSA2kxMgTnq/XVumR15sD/NMCQ6aRHQwD0ZxjMttTPJNAfkHk
 tVHd7p88H2cTS1zTvRn0Ep331ZHO8OqYtcTubefsNKXkJCqmRI5oz4tv8pwwzrcsdn1U22ODk7
 ODxWJTmJ1BAtiQhtKKuplKpBPhVuMyreh9t5c93F0ym598kg+scQQCEi7tu5lvR350JIZKLxzO
 rgo=
X-SBRS: 2.7
X-MesageID: 5712873
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5712873"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v12 6/6] introduce a 'passthrough' configuration option
 to xl.cfg...
Thread-Index: AQHVbHDvn5jHVxPMFkKSD7X9lZILUact9NGAgAMg16A=
Date: Wed, 18 Sep 2019 08:02:13 +0000
Message-ID: <3d92e138948744a499c4ea02e2bff4bd@AMSPEX02CL03.citrite.net>
References: <20190916092708.2624-1-paul.durrant@citrix.com>
 <abda0597-4744-d75e-2b54-d914919f8e76@citrix.com>
In-Reply-To: <abda0597-4744-d75e-2b54-d914919f8e76@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v12 6/6] introduce a 'passthrough'
 configuration option to xl.cfg...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+DQo+IFNlbnQ6IDE2IFNlcHRlbWJlciAyMDE5IDExOjE1DQo+
IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
OyBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+OyBJYW4gSmFj
a3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBB
bmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlDQo+IER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSAoWGVu
Lm9yZykgPHRpbUB4ZW4ub3JnPjsNCj4gQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+OyBEYXZpZCBTY290dCA8ZGF2ZUByZWNvaWwub3JnPjsgVm9sb2R5bXlyIEJhYmNo
dWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTIgNi82XSBpbnRyb2R1
Y2UgYSAncGFzc3Rocm91Z2gnIGNvbmZpZ3VyYXRpb24gb3B0aW9uIHRvIHhsLmNmZy4uLg0KPiAN
Cj4gT24gOS8xNi8xOSAxMDoyNyBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IC4uLmFuZCBo
ZW5jZSB0aGUgYWJpbGl0eSB0byBkaXNhYmxlIElPTU1VIG1hcHBpbmdzLCBhbmQgY29udHJvbCBF
UFQNCj4gPiBzaGFyaW5nLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3ICds
aWJ4bF9wYXNzdGhyb3VnaCcgZW51bWVyYXRpb24gaW50bw0KPiA+IGxpYnhsX2RvbWFpbl9jcmVh
dGVfaW5mby4gVGhlIHZhbHVlIHdpbGwgYmUgc2V0IGJ5IHhsIGVpdGhlciB3aGVuIGl0IHBhcnNl
cw0KPiA+IGEgbmV3ICdwYXNzdGhyb3VnaCcgb3B0aW9uIGluIHhsLmNmZywgb3IgaW1wbGljaXRs
eSBpZiB0aGVyZSBpcyBwYXNzdGhyb3VnaA0KPiA+IGhhcmR3YXJlIHNwZWNpZmllZCBmb3IgdGhl
IGRvbWFpbi4NCj4gPg0KPiA+IElmIHRoZSB2YWx1ZSBvZiB0aGUgcGFzc3Rocm91Z2ggY29uZmln
dXJhdGlvbiBvcHRpb24gaXMgJ2Rpc2FibGVkJyB0aGVuDQo+ID4gdGhlIFhFTl9ET01DVExfQ0RG
X2lvbW11IGZsYWcgd2lsbCBiZSBjbGVhciBpbiB0aGUgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4N
Cj4gPiBmbGFncywgdGh1cyBhbGxvd2luZyB0aGUgdG9vbHN0YWNrIHRvIGNvbnRyb2wgd2hldGhl
ciB0aGUgZG9tYWluIGdldHMNCj4gPiBJT01NVSBtYXBwaW5ncyBvciBub3QgKHdoZXJlIHByZXZp
b3VzbHkgdGhleSB3ZXJlIGdsb2JhbGx5IHNldCkuDQo+ID4NCj4gPiBJZiB0aGUgdmFsdWUgb2Yg
dGhlIHBhc3N0aHJvdWdoIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGlzICdzeW5jX3B0JyB0aGVuDQo+
ID4gYSBuZXcgJ2lvbW11X29wdHMnIGZpZWxkIGluIHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHdp
bGwgYmUgc2V0IHdpdGggdGhlDQo+ID4gdmFsdWUgWEVOX0RPTUNUTF9JT01NVV9ub19zaGFyZXB0
LiBUaGlzIHdpbGwgb3ZlcnJpZGUgdGhlIGdsb2JhbCBkZWZhdWx0DQo+ID4gc2V0IGluIGlvbW11
X2hhcF9wdF9zaGFyZSwgdGh1cyBhbGxvd2luZyB0aGUgdG9vbHN0YWNrIHRvIGNvbnRyb2wgd2hl
dGhlcg0KPiA+IEVQVCBzaGFyaW5nIGlzIHVzZWQgZm9yIHRoZSBkb21haW4uDQo+ID4NCj4gPiBJ
ZiB0aGUgdmFsdWUgb2YgcGFzc3Rocm91Z2ggaXMgJ2VuYWJsZWQnIHRoZW4geGwgd2lsbCBjaG9v
c2UgYW4gYXBwcm9wcmlhdGUNCj4gPiBkZWZhdWx0IGFjY29yZGluZyB0byB0aGUgdHlwZSBvZiBk
b21haW4gYW5kIGhhcmR3YXJlIHN1cHBvcnQuDQo+IA0KPiBNaW5vciBzdWdnZXN0aW9uOiBJIHBy
ZWZlciB1c2luZyBhIHdvcmQgbGlrZSAiYXV0byIgd2hlbiB5b3UncmUgbGV0dGluZw0KPiB0aGUg
Y29tcHV0ZXIgZGVjaWRlIHNvbWV0aGluZy4NCg0KTm90IHN1cmUgSSBsaWtlIHRoYXQuIEknbGwg
d2FpdCBmb3IgYSBzZWNvbmQgb3BpbmlvbiBvbiB0aGF0IG9uZS4NCg0KPiANCj4gSSdkIGFsc28u
Li4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiBiL2RvY3Mv
bWFuL3hsLmNmZy41LnBvZC5pbg0KPiA+IGluZGV4IGM5OWQ0MDMwN2UuLjE1NGQ4NDdmYjkgMTAw
NjQ0DQo+ID4gLS0tIGEvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluDQo+ID4gKysrIGIvZG9jcy9t
YW4veGwuY2ZnLjUucG9kLmluDQo+ID4gQEAgLTYwNSw2ICs2MDUsNjIgQEAgb3B0aW9uIHNob3Vs
ZCBvbmx5IGJlIHVzZWQgd2l0aCBhIHRydXN0ZWQgZGV2aWNlIHRyZWUuDQo+ID4gIE5vdGUgdGhh
dCB0aGUgcGFydGlhbCBkZXZpY2UgdHJlZSBzaG91bGQgYXZvaWQgdXNpbmcgdGhlIHBoYW5kbGUg
NjUwMDANCj4gPiAgd2hpY2ggaXMgcmVzZXJ2ZWQgYnkgdGhlIHRvb2xzdGFjay4NCj4gPg0KPiA+
ICs9aXRlbSBCPHBhc3N0aHJvdWdoPSJTVFJJTkciPg0KPiA+ICsNCj4gPiArU3BlY2lmeSB3aGV0
aGVyIElPTU1VIG1hcHBpbmdzIGFyZSBlbmFibGVkIGZvciB0aGUgZG9tYWluIGFuZCBoZW5jZSB3
aGV0aGVyDQo+ID4gK2l0IHdpbGwgYmUgZW5hYmxlZCBmb3IgcGFzc3Rocm91Z2ggaGFyZHdhcmUu
IFZhbGlkIHZhbHVlcyBmb3IgdGhpcyBvcHRpb24NCj4gPiArYXJlOg0KPiA+ICsNCj4gPiArPW92
ZXIgNA0KPiA+ICsNCj4gPiArPWl0ZW0gQjxkaXNhYmxlZD4NCj4gPiArDQo+ID4gK0lPTU1VIG1h
cHBpbmdzIGFyZSBkaXNhYmxlZCBmb3IgdGhlIGRvbWFpbiBhbmQgc28gaGFyZHdhcmUgbWF5IG5v
dCBiZQ0KPiA+ICtwYXNzZWQgdGhyb3VnaC4NCj4gPiArDQo+ID4gK1RoaXMgb3B0aW9uIGlzIHRo
ZSBkZWZhdWx0IGlmIG5vIHBhc3N0aHJvdWdoIGhhcmR3YXJlIGlzIHNwZWNpZmllZCBpbiB0aGUN
Cj4gPiArZG9tYWluJ3MgY29uZmlndXJhdGlvbi4NCj4gPiArDQo+ID4gKz1pdGVtIEI8c3luY19w
dD4NCj4gPiArDQo+ID4gK1RoaXMgb3B0aW9uIG1lYW5zIHRoYXQgSU9NTVUgbWFwcGluZ3Mgd2ls
bCBiZSBzeW5jaHJvbml6ZWQgd2l0aCB0aGUNCj4gPiArZG9tYWluJ3MgUDJNIHRhYmxlIGFzIGZv
bGxvd3M6DQo+ID4gKw0KPiA+ICtGb3IgYSBQViBkb21haW4sIGFsbCB3cml0YWJsZSBwYWdlcyBh
c3NpZ25lZCB0byB0aGUgZG9tYWluIGFyZSBpZGVudGl0eQ0KPiA+ICttYXBwZWQgYnkgTUZOIGlu
IHRoZSBJT01NVSBwYWdlIHRhYmxlLiBUaHVzIGEgZGV2aWNlIGRyaXZlciBydW5uaW5nIGluIHRo
ZQ0KPiA+ICtkb21haW4gbWF5IHByb2dyYW0gcGFzc3Rocm91Z2ggaGFyZHdhcmUgZm9yIERNQSB1
c2luZyBNRk4gdmFsdWVzDQo+ID4gKyhpLmUuIGhvc3QvbWFjaGluZSBmcmFtZSBudW1iZXJzKSBs
b29rZWQgdXAgaW4gaXRzIFAyTS4NCj4gPiArDQo+ID4gK0ZvciBhbiBIVk0gZG9tYWluLCBhbGwg
bm9uLWZvcmVpZ24gUkFNIHBhZ2VzIHByZXNlbnQgaW4gaXRzIFAyTSB3aWxsIGJlDQo+ID4gK21h
cHBlZCBieSBHRk4gaW4gdGhlIElPTU1VIHBhZ2UgdGFibGUuIFRodXMgYSBkZXZpY2UgZHJpdmVy
IHJ1bm5pbmcgaW4gdGhlDQo+ID4gK2RvbWFpbiBtYXkgcHJvZ3JhbSBwYXNzdGhyb3VnaCBoYXJk
d2FyZSB1c2luZyBHRk4gdmFsdWVzIChpLmUuIGd1ZXN0DQo+ID4gK3BoeXNpY2FsIGZyYW1lIG51
bWJlcnMpIHdpdGhvdXQgYW55IGZ1cnRoZXIgdHJhbnNsYXRpb24uDQo+ID4gKw0KPiA+ICtUaGlz
IG9wdGlvbiBpcyBub3QgY3VycmVudGx5IGF2YWlsYWJsZSBvbiBBcm0uDQo+ID4gKw0KPiA+ICs9
aXRlbSBCPHNoYXJlX3B0Pg0KPiA+ICsNCj4gPiArVGhpcyBvcHRpb24gaXMgdW5hdmFpbGFibGUg
Zm9yIGEgUFYgZG9tYWluLiBGb3IgYW4gSFZNIGRvbWFpbiwgdGhpcyBvcHRpb24NCj4gPiArbWVh
bnMgdGhhdCB0aGUgSU9NTVUgd2lsbCBiZSBwcm9ncmFtbWVkIHRvIGRpcmVjdGx5IHJlZmVyZW5j
ZSB0aGUgZG9tYWluJ3MNCj4gPiArUDJNIHRhYmxlIGFzIGl0cyBwYWdlIHRhYmxlLiBGcm9tIHRo
ZSBwb2ludCBvZiB2aWV3IG9mIGEgZGV2aWNlIGRyaXZlcg0KPiA+ICtydW5uaW5nIGluIHRoZSBk
b21haW4gdGhpcyBpcyBmdW5jdGlvbmFsbHkgZXF1aXZhbGVudCB0byBCPHN5bmNfcHQ+IGJ1dA0K
PiA+ICtwbGFjZXMgbGVzcyBsb2FkIG9uIHRoZSBoeXBlcnZpc29yIGFuZCBzbyBzaG91bGQgZ2Vu
ZXJhbGx5IGJlIHNlbGVjdGVkIGluDQo+ID4gK3ByZWZlcmVuY2UuIEhvd2V2ZXIsIHRoZSBhdmFp
bGFiaWxpdHkgb2YgdGhpcyBvcHRpb24gaXMgaGFyZHdhcmUgc3BlY2lmaWMuDQo+ID4gK0lmIEI8
eGwgaW5mbz4gcmVwb3J0cyBCPHZpcnRfY2Fwcz4gY29udGFpbmluZyBCPGlvbW11X2hhcF9wdF9z
aGFyZT4gdGhlbg0KPiA+ICt0aGlzIG9wdGlvbiBtYXkgYmUgdXNlZC4NCj4gPiArDQo+ID4gKz1p
dGVtIEI8ZW5hYmxlZD4NCj4gPiArDQo+ID4gK1RoaXMgb3B0aW9uIGVuYWJsZXMgSU9NTVUgbWFw
cGluZ3MgYW5kIHNlbGVjdHMgYW4gYXBwcm9wcmlhdGUgZGVmYXVsdA0KPiA+ICtvcGVyYXRpbmcg
bW9kZS4gRm9yIEhWTSBkb21haW5zIHJ1bm5pbmcgb24gcGxhdGZvcm1zIHdoZXJlIHRoZSBvcHRp
b24gaXMNCj4gPiArYXZhaWxhYmxlLCB0aGlzIGlzIGVxdWl2YWxlbnQgdG8gQjxzaGFyZV9wdD4u
IE90aGVyd2lzZSwgYW5kIGFsc28gZm9yIFBWDQo+ID4gK2RvbWFpbnMsIHRoaXMgb3B0aW9ucyBp
cyBlcXVpdmFsZW50IHRvIEI8c3luY19wdD4uDQo+IA0KPiAuLi5wdXQgdGhlIG9wdGlvbiB3ZSB3
YW50IC8gZXhwZWN0IHBlb3BsZSBuZWFyZXIgdGhlIHRvcCAoZWl0aGVyIGZpcnN0DQo+IG9yIHNl
Y29uZCkuDQo+IA0KDQpPaywgSSdsbCBkbyB0aGF0Lg0KDQogIFBhdWwNCg0KPiBUaGFua3MsDQo+
ICAtR2VvcmdlDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
