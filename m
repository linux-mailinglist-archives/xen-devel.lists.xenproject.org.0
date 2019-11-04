Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B89EDBE5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 10:49:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRYwi-00031B-Jj; Mon, 04 Nov 2019 09:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n2O2=Y4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iRYwg-00030N-Uy
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 09:46:47 +0000
X-Inumbo-ID: 0317322c-fee8-11e9-86af-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0317322c-fee8-11e9-86af-bc764e2007e4;
 Mon, 04 Nov 2019 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572860805;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZVsEs2ddnChkxXYWRJEARl+R88Os/hMeIjbA6BDIUNY=;
 b=f8atO1LQsEf8u1J3nEvqRJVBiSTVdN0HaWZbuvm4hkpZ5Kb2wLaAO1O3
 NWgXzW88wJlJ6Ur0KlhNB17Aj52NahuY25JKcRO4HisI/rJIPovZHujGp
 mLd9LrtKqnjsbxyg+yhMAK0pMzMqEgABQ6YxcXoczzPH7Ix24Sx98SzyF A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Hb+pdOOlmVuTDRdpav5Zr1qQmetXGbk6gtyFYadBlJqtIu41bx3cy/0XXeWBNTKjLJqaHm5F0e
 SIEiiWRA0YZJzQ/As9fdbY+4PC//ZsTNh44P3eKEtFynuYU0cXqqzkdnu7NE46/0K8mg1km16w
 jrtq+/hqhhuDUVchrh/Pdxoresy9/CPnpS81Z1jxuIsujjlHCDRAR98ryxl4wKC0+cYAGiazZS
 +V0ge6ZV6XwyXtIyAenrKXrP1PxNqv7KMx5vN9uxQmNKSaAE/I7MYgX30hTmb+fAY2Lu49uc7U
 zNM=
X-SBRS: 2.7
X-MesageID: 7899060
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,266,1569297600"; 
   d="scan'208";a="7899060"
Date: Mon, 4 Nov 2019 10:46:33 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20191104094633.GZ17494@Air-de-Roger>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
 <20191030082428.GW17494@Air-de-Roger>
 <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
 <20191030172313.GX17494@Air-de-Roger>
 <35c7a91d-1c46-e99e-5f9c-60d9e17721bf@oracle.com>
 <83625673-5e84-20ba-b7bf-e3e527eecbc0@suse.com>
 <b61f1b50-c050-2482-527e-f7740058b5f9@oracle.com>
 <20191031152304.GY17494@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D5E24A7@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D5E24A7@SHSMSX104.ccr.corp.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBOb3YgMDIsIDIwMTkgYXQgMDc6NDg6MDZBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5j
b21dCj4gPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAzMSwgMjAxOSAxMToyMyBQTQo+ID4gCj4g
PiBPbiBUaHUsIE9jdCAzMSwgMjAxOSBhdCAwNzo1MjoyM0FNIC0wNzAwLCBKb2UgSmluIHdyb3Rl
Ogo+ID4gPiBPbiAxMC8zMS8xOSAxOjAxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gPiBP
biAzMC4xMC4yMDE5IDE5OjAxLCBKb2UgSmluIHdyb3RlOgo+ID4gPiA+PiBPbiAxMC8zMC8xOSAx
MDoyMyBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPj4+IE9uIFdlZCwgT2N0IDMw
LCAyMDE5IGF0IDA5OjM4OjE2QU0gLTA3MDAsIEpvZSBKaW4gd3JvdGU6Cj4gPiA+ID4+Pj4gT24g
MTAvMzAvMTkgMToyNCBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPj4+Pj4gQ2Fu
IHlvdSB0cnkgdG8gYWRkIHRoZSBmb2xsb3dpbmcgZGVidWcgcGF0Y2ggb24gdG9wIG9mIHRoZSBl
eGlzdGluZwo+ID4gPiA+Pj4+PiBvbmUgYW5kIHJlcG9ydCB0aGUgb3V0cHV0IHRoYXQgeW91IGdl
dCBvbiB0aGUgWGVuIGNvbnNvbGU/Cj4gPiA+ID4+Pj4KPiA+ID4gPj4+PiBBcHBsaWVkIGRlYnVn
IHBhdGNoIGFuZCBydW4gdGhlIHRlc3QgYWdhaW4sIG5vdCBvZiBhbnkgbG9nIHByaW50ZWQsCj4g
PiA+ID4+Pj4gYXR0YWNoZWQgWGVuIGxvZyBvbiBzZXJpYWwgY29uc29sZSwgc2VlbXMgcGlfdXBk
YXRlX2lydGUoKSBub3QgYmVlbgo+ID4gPiA+Pj4+IGNhbGxlZCBmb3IgaW9tbXVfaW50cG9zdCB3
YXMgZmFsc2UuCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gSSBoYXZlIHRvIGFkbWl0IEknbSBsb3N0IGF0
IHRoaXMgcG9pbnQuIERvZXMgaXQgbWVhbiB0aGUgb3JpZ2luYWwKPiA+ID4gPj4+IGlzc3VlIGhh
ZCBub3RoaW5nIHRvIGRvIHdpdGggcG9zdGVkIGludGVycnVwdHM/Cj4gPiA+ID4+Cj4gPiA+ID4+
IExvb2tzIHdoZW4gaW5qZWN0IGlycSBieSB2bGFwaWNfc2V0X2lycSgpLCBpdCBjaGVja2VkIGJ5
Cj4gPiA+ID4+IGh2bV9mdW5jcy5kZWxpdmVyX3Bvc3RlZF9pbnRyIHJhdGhlciB0aGFuIGlvbW11
X2ludHBvc3Q6Cj4gPiA+ID4+Cj4gPiA+ID4+ICAxNzYgICAgIGlmICggaHZtX2Z1bmNzLmRlbGl2
ZXJfcG9zdGVkX2ludHIgKQo+ID4gPiA+PiAgMTc3ICAgICAgICAgaHZtX2Z1bmNzLmRlbGl2ZXJf
cG9zdGVkX2ludHIodGFyZ2V0LCB2ZWMpOwo+ID4gPiA+Pgo+ID4gPiA+PiBBbmQgZGVsaXZlcl9w
b3N0ZWRfaW50cigpIHdvdWxkIGJlIHRoZXJlLCB3aGVuIHZteCBlbmFibGVkOgo+ID4gPiA+Pgo+
ID4gPiA+PiAoWEVOKSBIVk06IFZNWCBlbmFibGVkCj4gPiA+ID4+IChYRU4pIEhWTTogSGFyZHdh
cmUgQXNzaXN0ZWQgUGFnaW5nIChIQVApIGRldGVjdGVkCj4gPiA+ID4+IChYRU4pIEhWTTogSEFQ
IHBhZ2Ugc2l6ZXM6IDRrQiwgMk1CLCAxR0IKPiA+ID4gPgo+ID4gPiA+IEkgY2FuJ3Qgc2VlIHRo
ZSBjb25uZWN0aW9uLiBzdGFydF92bXgoKSBoYXMKPiA+ID4gPgo+ID4gPiA+ICAgICBpZiAoIGNw
dV9oYXNfdm14X3Bvc3RlZF9pbnRyX3Byb2Nlc3NpbmcgKQo+ID4gPiA+ICAgICB7Cj4gPiA+ID4g
ICAgICAgICBhbGxvY19kaXJlY3RfYXBpY192ZWN0b3IoJnBvc3RlZF9pbnRyX3ZlY3RvciwKPiA+
IHBpX25vdGlmaWNhdGlvbl9pbnRlcnJ1cHQpOwo+ID4gPiA+ICAgICAgICAgaWYgKCBpb21tdV9p
bnRwb3N0ICkKPiA+ID4gPiAgICAgICAgICAgICBhbGxvY19kaXJlY3RfYXBpY192ZWN0b3IoJnBp
X3dha2V1cF92ZWN0b3IsCj4gPiBwaV93YWtldXBfaW50ZXJydXB0KTsKPiA+ID4gPgo+ID4gPiA+
ICAgICAgICAgdm14X2Z1bmN0aW9uX3RhYmxlLmRlbGl2ZXJfcG9zdGVkX2ludHIgPSB2bXhfZGVs
aXZlcl9wb3N0ZWRfaW50cjsKPiA+ID4gPiAgICAgICAgIHZteF9mdW5jdGlvbl90YWJsZS5zeW5j
X3Bpcl90b19pcnIgICAgID0gdm14X3N5bmNfcGlyX3RvX2lycjsKPiA+ID4gPiAgICAgICAgIHZt
eF9mdW5jdGlvbl90YWJsZS50ZXN0X3BpciAgICAgICAgICAgID0gdm14X3Rlc3RfcGlyOwo+ID4g
PiA+ICAgICB9Cj4gPiA+ID4KPiA+ID4gPiBpLmUuIHRoZSBob29rIGlzIHByZXNlbnQgb25seSB3
aGVuIHBvc3RlZCBpbnRlcnJ1cHRzIGFyZQo+ID4gPiA+IGF2YWlsYWJsZSBpbiBnZW5lcmFsLiBJ
LmUuIGFsc28gd2l0aCBqdXN0IENQVS1zaWRlIHBvc3RlZAo+ID4gPiA+IGludGVycnVwdHMsIHll
cywgd2hpY2ggZ2V0cyBjb25maXJtZWQgYnkgeW91ciAiYXBpY3Y9MCIKPiA+ID4gPiB0ZXN0LiBZ
ZXQgd2l0aCBqdXN0IENQVS1zaWRlIHBvc3RlZCBpbnRlcnJ1cHRzIEknbQo+ID4gPiA+IHN0cnVn
Z2xpbmcgYWdhaW4gdG8gdW5kZXJzdGFuZCB5b3VyIG9yaWdpbmFsIHByb2JsZW0KPiA+ID4gPiBk
ZXNjcmlwdGlvbiwgYW5kIHRoZSBuZWVkIHRvIGZpZGRsZSB3aXRoIElPTU1VIHNpZGUgY29kZS4K
PiA+ID4KPiA+ID4gWWVzLCBvbiBteSB0ZXN0IGVudiwgY3B1X2hhc192bXhfcG9zdGVkX2ludHJf
cHJvY2Vzc2luZyA9PSB0cnVlICYmCj4gPiBpb21tdV9pbnRwb3N0ID09IGZhbHNlLAo+ID4gPiB3
aXRoIHRoaXMsIHBvc3RlZCBpbnRlcnJ1cHRzIGJlZW4gZW5hYmxlZC4KPiA+IAo+ID4gSSdtIHN0
aWxsIHF1aXRlIGxvc3QuIE15IHJlYWRpbmcgb2YgdGhlIEludGVsIFZULWQgc3BlYyBpcyB0aGF0
IHRoZQo+ID4gcG9zdGVkIGludGVycnVwdCBkZXNjcmlwdG9yICh3aGljaCBjb250YWlucyB0aGUg
UElSUikgaXMgdXNlZCBpbgo+ID4gY29uanVuY3Rpb24gd2l0aCBhIHBvc3RlZCBpbnRlcnJ1cHQg
cmVtYXBwaW5nIGVudHJ5IGluIHRoZSBpb21tdSwgc28KPiA+IHRoYXQgaW50ZXJydXB0cyBnZXQg
cmVjb3JkZWQgaW4gdGhlIFBJUlIgYW5kIGxhdGVyIHN5bmNlZCBieSB0aGUKPiA+IGh5cGVydmlz
b3IgaW50byB0aGUgdmxhcGljIElSUiB3aGVuIHJlc3VtaW5nIHRoZSB2aXJ0dWFsIENQVS4KPiAK
PiB0aGVyZSBhcmUgdHdvIHBhcnRzLiBJbnRlbCBmaXJzdCBpbXBsZW1lbnRzIENQVSBwb3N0ZWQg
aW50ZXJydXB0LAo+IHdoaWNoIGFsbG93cyBvbmUgQ1BVIHRvIHBvc3QgSVBJIGludG8gbm9uLXJv
b3QgY29udGV4dCBpbiBhbm90aGVyCj4gQ1BVIHRocm91Z2ggcG9zdGVkIGludGVycnVwdCBkZXNj
cmlwdG9yLiBMYXRlciBWVC1kIHBvc3RlZCAKPiBpbnRlcnJ1cHQgY29tZXMsIHdoaWNoIHVzZSBp
bnRlcnJ1cHQgcmVtYXBwaW5nIGVudHJ5IGFuZCB0aGUKPiBzYW1lIHBvc3RlZCBpbnRlcnJ1cHQg
ZGVzY3JpcHRvciAodXNpbmcgbW9yZSBmaWVsZHMpIHRvIGNvbnZlcnQKPiBhIGRldmljZSBpbnRl
cnJ1cHQgaW50byBhIHBvc3RlZCBpbnRlcnJ1cHQuIFRoZSBwb3N0aW5nIHByb2Nlc3MgaXMKPiBz
YW1lIG9uIHRoZSBkZXN0IENQVSwgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIGl0J3MgZnJvbSBhbm90
aGVyIENQVQo+IG9yIGEgZGV2aWNlLiAKClRoYW5rcyBmb3IgdGhlIGRlc2NyaXB0aW9uLgoKU28g
dGhlIHByb2JsZW0gcmVwb3J0ZWQgYnkgSmluIGhhcHBlbnMgd2hlbiB1c2luZyBDUFUgcG9zdGVk
CmludGVycnVwdHMgYnV0IG5vdCBWVC1kIHBvc3RlZCBpbnRlcnJ1cHRzLCBpbiB3aGljaCBjYXNl
IHRoZXJlCnNob3VsZG4ndCBiZSBhIG5lZWQgdG8gc3luYyBQSVJSIHdpdGggSVJSIHdoZW4gaW50
ZXJydXB0cyBmcm9tIGEKcGFzc3Rocm91Z2ggZGV2aWNlIGFyZSByZWNvbmZpZ3VyZWQsIGJlY2F1
c2UgaW50ZXJydXB0cyBmcm9tIHRoYXQKZGV2aWNlIHNob3VsZG4ndCBlbmQgdXAgc2lnbmFsZWQg
aW4gUElSUiBiZWNhdXNlIFZULWQgcG9zdGVkCmludGVycnVwdHMgaXMgbm90IGJlaW5nIHVzZWQu
CgpEbyBpbnRlcnJ1cHRzIGZyb20gcGFzc3Rocm91Z2ggZGV2aWNlcyBlbmQgdXAgc2lnbmFsZWQg
aW4gdGhlIHBvc3RlZAppbnRlcnJ1cHQgZGVzY3JpcHRvciBQSVJSIGZpZWxkIHdoZW4gbm90IHVz
aW5nIFZULWQgcG9zdGVkCmludGVycnVwdHMgYnV0IHVzaW5nIENQVSBwb3N0ZWQgaW50ZXJydXB0
cz8KCkZyb20gbXkgcmVhZGluZyBvZiB5b3VyIGRlc2NyaXB0aW9uIGFib3ZlIHdoZW4gdXNpbmcg
Q1BVIHBvc3RlZAppbnRlcnJ1cHRzIG9ubHkgdGhlIHZlY3RvcnMgc2lnbmFsZWQgaW4gdGhlIFBJ
UlIgZmllbGQgc2hvdWxkIGJlbG9uZwp0byBJUElzIGZyb20gb3RoZXIgdkNQVXM/CgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
