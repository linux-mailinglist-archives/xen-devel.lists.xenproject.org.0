Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D37031A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 17:06:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpZps-00077j-1Z; Mon, 22 Jul 2019 15:02:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+VRc=VT=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpZpq-00077e-Cy
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 15:02:42 +0000
X-Inumbo-ID: bf2c4f5a-ac91-11e9-93e8-cf914bf2b34f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf2c4f5a-ac91-11e9-93e8-cf914bf2b34f;
 Mon, 22 Jul 2019 15:02:39 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: y3QPIbHAUj6BDG3mqWde1D/xSJdU7RVLZSjNRr0FYjvktVZ0Vq/C97qr+xNL+zW6EmsaxRDDwv
 ixPAgL92ehxA6Gsm3ithAEhYy61rWRr+ZzxA9i3Dkaxm9cKiYTio5iYZe0+dayt66GURXyG7xK
 ZKhYnkdyYGPKjJ6JTXtB6uoenV6tS3jSKQdEZhI2Won2TEnnuIHGSLg4DBpCVXr9Bsz0By/ACl
 xlfy66pKMYGpZoeWVeZoN3JQj5s0ryodQoauF2f6ohWX6twnYYylF8CrdxyBnh+hB1gTFYwbPP
 Lm0=
X-SBRS: 2.7
X-MesageID: 3365527
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3365527"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVPmzkQranvSB3QkuFJWZsoolqxKbWTmUwgAAaH4CAACIW8P///zuAgAAjM0D//+s8gIAAJkZw
Date: Mon, 22 Jul 2019 15:02:35 +0000
Message-ID: <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <CAMmSBy8CcG08-+-F6fvwmH1oEKpsV8OGEco94g04dZcyyFWKbw@mail.gmail.com>
 <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
 <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
 <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
 <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
 <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
In-Reply-To: <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 'Roman Shaposhnik' <roman@zededa.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogUm9nZXIgUGF1IE1vbm5lIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KPiBTZW50OiAyMiBKdWx5IDIwMTkgMTU6NDAKPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogJ1JvbWFuIFNoYXBvc2hu
aWsnIDxyb21hbkB6ZWRlZGEuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBq
Z3Jvc3NAc3VzZS5jb207IEFuZHJldwo+IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNv
bT47IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tOyBqYmV1bGljaEBzdXNlLmNvbQo+IFN1Ympl
Y3Q6IFJlOiBbWGVuLWRldmVsXSBbQlVHXSBBZnRlciB1cGdyYWRlIHRvIFhlbiA0LjEyLjAgaW9t
bXU9bm8taWdmeAo+IAo+IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDA0OjAzOjQ0UE0gKzAyMDAs
IFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+
IFtzbmlwXQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lv
bW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gPiA+ID4gPiBpbmRleCA3
OWVjNjcxOWY1Li45ZDkxZjBkNjMzIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvaW9tbXUuYwo+ID4gPiA+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvaW9tbXUuYwo+ID4gPiA+ID4gQEAgLTE4NSw3ICsxODUsNyBAQCB2b2lkIF9faHdkb21faW5p
dCBpb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4gPiA+ID4gPiAgICAgIHJlZ2lz
dGVyX2tleWhhbmRsZXIoJ28nLCAmaW9tbXVfZHVtcF9wMm1fdGFibGUsICJkdW1wIGlvbW11IHAy
bSB0YWJsZSIsIDApOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgaGQtPnN0YXR1cyA9IElPTU1V
X1NUQVRVU19pbml0aWFsaXppbmc7Cj4gPiA+ID4gPiAtICAgIGhkLT5uZWVkX3N5bmMgPSBpb21t
dV9od2RvbV9zdHJpY3QgJiYgIWlvbW11X3VzZV9oYXBfcHQoZCk7Cj4gPiA+ID4gPiArICAgIGhk
LT5uZWVkX3N5bmMgPSAhaW9tbXVfdXNlX2hhcF9wdChkKTsKPiA+ID4gPgo+ID4gPiA+IEJ1dCB0
aGlzIGlzIGdvaW5nIHRvIG1lYW4gdGhlIGlmKCkgYmVsb3cgaXMgdHJ1ZSBmb3Igbm9uLXN0cmlj
dCBkb20wLCB3aGljaCBtZWFucyBpdCBwb2ludGxlc3NseQo+ID4gPiBtYXBzIHRoZSBkb20wIHBh
Z2UgbGlzdCB3aGVuIGh3ZG9tX2lvbW11X21hcCgpIHNob3VsZCBoYXZlIGFscmVhZHkgbWFwcGVk
IGFsbCBjb252ZW50aW9uYWwgUkFNLgo+ID4gPgo+ID4gPiBSaWdodCwgdGhpcyBhbGwgc2VlbXMg
cXVpdGUgYnJva2VuLiBOb24tdHJhbnNsYXRlZCBndWVzdHMgKGllOiBQVikKPiA+ID4gd291bGQg
YWx3YXlzIG5lZWQgaW9tbXUgcGFnZS10YWJsZSBzeW5jLCBidXQgc2V0X2lkZW50aXR5X3AybV9l
bnRyeQo+ID4gPiBjb250YWlucyB0aGUgZm9sbG93aW5nOgo+ID4gPgo+ID4gPiBpZiAoICFwYWdp
bmdfbW9kZV90cmFuc2xhdGUocDJtLT5kb21haW4pICkKPiA+ID4gewo+ID4gPiAgICAgaWYgKCAh
bmVlZF9pb21tdV9wdF9zeW5jKGQpICkKPiA+ID4gICAgICAgICByZXR1cm4gMDsKPiA+ID4gICAg
IHJldHVybiBpb21tdV9sZWdhY3lfbWFwKGQsIF9kZm4oZ2ZuX2wpLCBfbWZuKGdmbl9sKSwgUEFH
RV9PUkRFUl80SywKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl9yZWFk
YWJsZSB8IElPTU1VRl93cml0YWJsZSk7Cj4gPiA+IH0KPiA+ID4KPiA+ID4gSSB3b25kZXIgd2hl
dGhlciB0aGUgdXNhZ2Ugb2YgbmVlZF9pb21tdV9wdF9zeW5jIGlzIHdyb25nIHRoZXJlLCBhbmQK
PiA+ID4gc2hvdWxkIGluc3RlYWQgYmUgIWhhc19pb21tdV9wdChkKSwgc2luY2Ugbm9uLXRyYW5z
bGF0ZWQgZG9tYWlucyB3b3VsZAo+ID4gPiBuZXZlciBzaGFyZSB0aGUgaW9tbXUgcGFnZS10YWJs
ZXMgYW55d2F5Lgo+ID4KPiA+IFlvdSB3YW50IHN5bmNpbmcgaWYgdGhlIGRvbWFpbiBoYXMgSU9N
TVUgcGFnZSB0YWJsZXMgYW5kIHNoYXJlZCBFUFQgaXMgbm90IGluIHVzZSwgc28gdGhpcyBsb2dp
Ywo+IGp1c3Qgc2VlbXMgd3JvbmcuCj4gCj4gUmlnaHQsIHNvIGZvciBhIFBWIGRvbWFpbiB0aGlz
IHdvdWxkIG1lYW4gc3luY2luZyBpZiB0aGUgaW9tbXUgaXMgaW4KPiB1c2VkLCBiZWNhdXNlIHRo
ZXJlJ3Mgbm8gc2hhcmluZyBhdCBhbGwuCj4gCj4gPiA+Cj4gPiA+IEluIGFueSBjYXNlLCBJIHRo
aW5rIG5lZWRfc3luYyBtdXN0IGJlIHNldCB3aGVuIHRoZSBpb21tdSBwYWdlIHRhYmxlcwo+ID4g
PiBhcmUgbm90IHNoYXJlZCwgYW5kIGdhdGluZyBpdCBvbiBpb21tdV9od2RvbV9zdHJpY3Qgc2Vl
bXMgd3JvbmcgdG8gbWUsCj4gPiA+IHRoZSBzdHJpY3RuZXNzIG9mIHRoZSBpb21tdSBkb2Vzbid0
IGFmZmVjdCB3aGV0aGVyIGEgc3luYyBpcyBuZWVkIG9yCj4gPiA+IG5vdC4KPiA+Cj4gPiBJIHRo
aW5rIG5lZWRfc3luYyBpcyBnYXRlZCBvbiBzdHJpY3QgbW9kZSBiZWNhdXNlLCBpbiAncmVsYXhl
ZCcgbW9kZSwgdGhlIG1hcHBpbmdzIHRoYXQgYXJlIHNldCB1cAo+IHdoZW4gZG9tMCBpcyBzdGFy
dGVkIGFyZSBzdXBwb3NlZCB0byBiZSBzdGF0aWMgKG1vZHVsbyBob3RwbHVnIFJBTSkuLi4gc28g
bW9kaWZpY2F0aW9ucyB0byB0aGUKPiBkb21haW4ncyBwYWdlIGxpc3QgYXJlIG5vdCBzdXBwb3Nl
ZCB0byBoYXZlIGFueSBlZmZlY3QsIGFuZCBzbyBubyBzeW5jaHJvbml6YXRpb24gbmVlZCBiZSBk
b25lLgo+IAo+IEhtLCByaWdodCwgaW4gcmVsYXhlZCBtb2RlIGRvbTAgaXMgc3VwcG9zZWQgdG8g
aGF2ZSBhbGwgUkFNIHJlZ2lvbnMKPiBtYXBwZWQgaW4gdGhlIGlvbW11IHBhZ2UtdGFibGVzLCBz
byB0aGVyZSdzIG5vIG5lZWQgdG8gbW9kaWZ5IHRoZQo+IGlvbW11IHBhZ2UgdGFibGVzIGF0IHJ1
biB0aW1lLgo+IAo+IFRoaXMgYXBwcm9hY2ggc2VlbXMgc2xpZ2h0bHkgYnJva2VuIGlmIGRtYSBv
cGVyYXRpb25zIGFnYWlucyBtbWlvCj4gcmVnaW9ucyBhcmUgYXR0ZW1wdGVkIGJ5IGRvbTAsIGJ1
dCBhbnl3YXksIHRoaXMgc2VlbXMgdG8gaGF2ZSB3b3JrZWQKPiBmaW5lIHNvIGZhci4KPiAKPiA+
ID4KPiA+ID4gSSd2ZSB1cGRhdGVkIHRoZSBwYXRjaCB0byBhdm9pZCB0aGUgcG9pbnRsZXNzIG1h
cHBpbmcgb2YgZG9tMCBwYWdlCj4gPiA+IGxpc3QsIGJ1dCBJIGhhdmVuJ3QgaW5jbHVkZWQgdGhl
IGNoYW5nZSB0byBzZXRfaWRlbnRpdHlfcDJtX2VudHJ5Lgo+ID4gPgo+ID4KPiA+IFNvLCBJIHRo
aW5rIHRoZSBhbGJlaXQgb2RkIGxvb2tpbmcgbG9naWMgaW4gaW9tbXVfaHdkb21faW5pdCgpIHdh
cyBhY3R1YWxseSBjb3JyZWN0LCBidXQgdGhlIGNvZGUgaW4KPiBzZXRfaWRlbnRpdHlfcDJtX2Vu
dHJ5KCkgaXMgd3JvbmcuCj4gCj4gQWNrLCBzZWUgdGhlIHBhdGNoIGJlbG93LiBJIHRoaW5rIGl0
IG1pZ2h0IGFsc28gYmUgaGVscGZ1bCB0byBhZGQgYQo+IGNvbW1lbnQgdG8gdGhlIHNldHRpbmcg
b2YgbmVlZF9zeW5jIGluIGlvbW11X2h3ZG9tX2luaXQgaW4gb3JkZXIgdG8KPiBtZW50aW9uIHRo
YXQgcmVsYXhlZCBkb21haW5zIGRvbid0IG5lZWQgc3luYyBiZWNhdXNlIGFsbCByYW0gaXMKPiBh
bHJlYWR5IG1hcHBlZCBpbiB0aGUgaW9tbXUgcGFnZSB0YWJsZXMuCgpBZ3JlZWQuCgo+IAo+IFRo
YW5rcywgUm9nZXIuCj4gLS0tODwtLS0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3Ay
bS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gaW5kZXggZmVmOTdjODJmNi4uODhhMjQzMGM4
YyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvbW0vcDJtLmMKPiBAQCAtODM2LDcgKzgzNiw3IEBAIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2Uo
c3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBtZm5fdCBtZm4sCj4gICAgICAgICAgICovCj4g
ICAgICAgICAgZm9yICggaSA9IDA7IGkgPCAoMVVMIDw8IHBhZ2Vfb3JkZXIpOyArK2ksICsrcGFn
ZSApCj4gICAgICAgICAgewo+IC0gICAgICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMo
ZCkgKQo+ICsgICAgICAgICAgICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQo+ICAgICAgICAgICAg
ICAgICAgLyogbm90aGluZyAqLzsKPiAgICAgICAgICAgICAgZWxzZSBpZiAoIGdldF9wYWdlX2Fu
ZF90eXBlKHBhZ2UsIGQsIFBHVF93cml0YWJsZV9wYWdlKSApCj4gICAgICAgICAgICAgICAgICBw
dXRfcGFnZV9hbmRfdHlwZShwYWdlKTsKPiBAQCAtMTM0MSw3ICsxMzQxLDcgQEAgaW50IHNldF9p
ZGVudGl0eV9wMm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm5fbCwK
PiAKPiAgICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShwMm0tPmRvbWFpbikgKQo+ICAg
ICAgewo+IC0gICAgICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCj4gKyAgICAgICAg
aWYgKCAhaGFzX2lvbW11X3B0KGQpICkKPiAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAg
ICAgcmV0dXJuIGlvbW11X2xlZ2FjeV9tYXAoZCwgX2RmbihnZm5fbCksIF9tZm4oZ2ZuX2wpLCBQ
QUdFX09SREVSXzRLLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl9y
ZWFkYWJsZSB8IElPTU1VRl93cml0YWJsZSk7Cj4gQEAgLTE0MzIsNyArMTQzMiw3IEBAIGludCBj
bGVhcl9pZGVudGl0eV9wMm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBn
Zm5fbCkKPiAKPiAgICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApCj4gICAgICB7
Cj4gLSAgICAgICAgaWYgKCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKPiArICAgICAgICBpZiAo
ICFoYXNfaW9tbXVfcHQoZCkgKQo+ICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgICBy
ZXR1cm4gaW9tbXVfbGVnYWN5X3VubWFwKGQsIF9kZm4oZ2ZuX2wpLCBQQUdFX09SREVSXzRLKTsK
PiAgICAgIH0KClllcywgdGhpcyBhbGwgbG9va3Mgb2sgdG8gbWUuLi4gYWx0aG91Z2ggSSBzdGls
bCBmaW5kIGl0IGNvdW50ZXJpbnR1aXRpdmUgdGhhdCB3ZSBtYWtlIHAybSBjYWxscyBmb3IgUFYg
ZG9tYWlucy4KCiAgUGF1bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
