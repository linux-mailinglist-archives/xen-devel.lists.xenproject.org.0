Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE97789925
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 11:00:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx68h-0003Zo-P7; Mon, 12 Aug 2019 08:57:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2okp=WI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hx68g-0003Zj-5g
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 08:57:14 +0000
X-Inumbo-ID: 2c233f5f-bcdf-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2c233f5f-bcdf-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565600232;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4M049k2/Q/LHzsGFJBU2lEMr2WiZebIovMEkV4i5zNI=;
 b=I2TR2JYdf3yJFOYjNA9xGuBxGBPEiFp+pK8S4VV0OiSanJUuH43rr/zE
 aXkNFVw92nfpfR+qung8A2CSkV015rtJm/Iszj9P/KvMP70z6uORrc+w7
 EouK6fBZRADhBORw7psFTkh4eIP1ZA0wpCHwGCSXFZUHIk4mBDNOjCgV2 M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZjOx80OITjWLFG5GiiX5Xom5Ci+Vpc30nwz+5zVfkEEVWs4e/CIvrAMxzRVq3z/F3TMm6FgLF4
 tPVn1UngX3YXDrzCk16YjjZRIeDdH+rElnRFjrfUxMWNdQVt2jkKZP7EGrjqfDqy2v6mURcKgW
 0wQ6JYD19z84O1CrG2NrkusNDiedcwxy3Gdv1+VEEQ6TOrJa0n8cJDgyy8RYnB0SoO8IWkKWkC
 j4WElQYjEuaaMQlJ26mASTxK1E1ndC6pwdcVJVGpSzIfhjVqVMiL/A7pJ1fgt0VHbxUr5TdGYp
 /hE=
X-SBRS: 2.7
X-MesageID: 4142880
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,376,1559534400"; 
   d="scan'208";a="4142880"
Date: Mon, 12 Aug 2019 10:57:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190812085703.363a2xsypnacdpes@Air-de-Roger>
References: <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
 <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
 <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
 <CAMmSBy9ZiEU95yAK1ry_41GR0ttWTX9EEJ0bMStZaK=PrzCH7w@mail.gmail.com>
 <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
 <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
 <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
 <20190807073534.7uoqo7q7gno2ljyl@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807073534.7uoqo7q7gno2ljyl@Air-de-Roger>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZz8KCkkga25vdyBJJ3ZlIHBvc3RlZCB0aGlzIHF1aXRlIHJlY2VudGx5LCBidXQgaGF2ZSB5
b3UgYmVlbiBhYmxlIHRvIHRlc3QKdGhlIHR3byBwcm9wb3NlZCBwYXRjaGVzPwoKaWU6IHRoZSBv
bmUgaGVyZSBhbmQ6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwv
eGVuLWRldmVsLzIwMTktMDgvbXNnMDA2NDMuaHRtbAoKSSB3b3VsZCBsaWtlIHRvIGZpZ3VyZSBv
dXQgZXhhY3RseSB3aGF0J3MgZ29pbmcgb24gYW5kIGZpeCB0aGlzCnByb3Blcmx5LgoKVGhhbmtz
LCBSb2dlci4KCk9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDA5OjM1OjM0QU0gKzAyMDAsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDI6NDg6NTFQTSAt
MDcwMCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiA+IE9uIFR1ZSwgQXVnIDYsIDIwMTkgYXQg
OToxOCBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDEwOjA1OjQwQU0gKzAyMDAsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMTE6MjU6
MDRBTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiA+ID4gPiA+IFRoaXMgcGF0Y2gg
Y29tcGxldGVseSBmaXhlcyB0aGUgcHJvYmxlbSBmb3IgbWUhCj4gPiA+ID4gPgo+ID4gPiA+ID4g
VGhhbmtzIFJvZ2VyISBJJ2QgbG92ZSB0byBzZWUgdGhpcyBpbiBYZW4gNC4xMwo+ID4gPiA+Cj4g
PiA+ID4gVGhhbmtzIGZvciB0ZXN0aW5nIQo+ID4gPiA+Cj4gPiA+ID4gSXQncyBzdGlsbCBub3Qg
Y2xlYXIgdG8gbWUgd2h5IHRoZSBwcmV2aW91cyBhcHByb2FjaCBkaWRuJ3Qgd29yaywgYnV0Cj4g
PiA+ID4gSSB0aGluayB0aGlzIHBhdGNoIGlzIGJldHRlciBiZWNhdXNlIGl0IHJlbW92ZXMgdGhl
IHVzYWdlIG9mCj4gPiA+ID4ge3NldC9jbGVhcn1faWRlbnRpdHlfcDJtX2VudHJ5IGZyb20gUFYg
ZG9tYWlucy4gSSB3aWxsIHN1Ym1pdCB0aGlzCj4gPiA+ID4gZm9ybWFsbHkgbm93Lgo+ID4gPgo+
ID4gPiBTb3JyeSB0byBib3RoZXIgYWdhaW4sIGJ1dCBzaW5jZSB3ZSBzdGlsbCBkb24ndCB1bmRl
cnN0YW5kIHdoeSB0aGUKPiA+ID4gcHJldmlvdXMgZml4IGRpZG4ndCB3b3JrIGZvciB5b3UsIGFu
ZCBJIGNhbid0IHJlcHJvZHVjZSB0aGlzIHdpdGggbXkKPiA+ID4gaGFyZHdhcmUsIGNvdWxkIHlv
dSBnaXZlIHRoZSBhdHRhY2hlZCBwYXRjaCBhIHRyeT8KPiA+IAo+ID4gTm8gd29ycmllcyAtLSBh
bmQgdGhhbmtzIGZvciBoZWxwaW5nIHRvIGdldCBpdCBvdmVyIHRoZSBmaW5pc2ggbGluZSAtLQo+
ID4gdGhpcyBpcyBtdWNoIGFwcHJlY2lhdGVkIQo+ID4gCj4gPiBJJ20gaGFwcHkgdG8gc2F5IHRo
YXQgdGhpcyBsYXRlc3QgcGF0Y2ggaXMgYWxzbyB3b3JraW5nIGp1c3QgZmluZS4gU28KPiA+IEkg
Z3Vlc3MgdGhpcyBpcyB0aGUgb25lIHRoYXQncyBnb2luZyB0byBsYW5kIGluIFhlbiA0LjEzPwo+
IAo+IE5vLCBub3QgcmVhbGx5LCBzb3JyeSB0aGlzIHdhcyBzdGlsbCBhIGRlYnVnIHBhdGNoLgo+
IAo+IFNvIEkgdGhpbmsgdGhlIGJlaGF2aW91ciB5b3UgYXJlIHNlZWluZyBjYW4gb25seSBiZSBl
eHBsYWluZWQgaWYgdGhlCj4gSU9NTVUgaXMgYWxyZWFkeSBlbmFibGVkIGJ5IHRoZSBmaXJtd2Fy
ZSB3aGVuIGJvb3RpbmcgaW50byBYZW4sIGNhbgo+IHRoaXMgYmUgdGhlIGNhc2U/Cj4gCj4gSSBo
YXZlIGEgcGF0Y2ggSSB3b3VsZCBsaWtlIHlvdSB0byB0cnkgdG8gY29uZmlybSB0aGlzLCBjYW4g
eW91IHBsZWFzZQo+IGdpdmUgaXQgYSBzcGluIGFuZCByZXBvcnQgYmFjayAoaWRlYWxseSB3aXRo
IHRoZSBYZW4gYm9vdCBsb2cpLgo+IAo+IFRoYW5rcywgUm9nZXIuCj4gLS0tODwtLS0KPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4g
aW5kZXggZmVmOTdjODJmNi4uMzYwNTYxNGFhZiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYv
bW0vcDJtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBAQCAtMTM0MSw3ICsxMzQx
LDcgQEAgaW50IHNldF9pZGVudGl0eV9wMm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgbG9uZyBnZm5fbCwKPiAgCj4gICAgICBpZiAoICFwYWdpbmdfbW9kZV90cmFuc2xhdGUocDJt
LT5kb21haW4pICkKPiAgICAgIHsKPiAtICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMo
ZCkgKQo+ICsgICAgICAgIGlmICggIWhhc19pb21tdV9wdChkKSApCj4gICAgICAgICAgICAgIHJl
dHVybiAwOwo+ICAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfbWFwKGQsIF9kZm4oZ2ZuX2wp
LCBfbWZuKGdmbl9sKSwgUEFHRV9PUkRFUl80SywKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBJT01NVUZfcmVhZGFibGUgfCBJT01NVUZfd3JpdGFibGUpOwo+IEBAIC0xNDMyLDcg
KzE0MzIsNyBAQCBpbnQgY2xlYXJfaWRlbnRpdHlfcDJtX2VudHJ5KHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGxvbmcgZ2ZuX2wpCj4gIAo+ICAgICAgaWYgKCAhcGFnaW5nX21vZGVfdHJhbnNs
YXRlKGQpICkKPiAgICAgIHsKPiAtICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkg
KQo+ICsgICAgICAgIGlmICggIWhhc19pb21tdV9wdChkKSApCj4gICAgICAgICAgICAgIHJldHVy
biAwOwo+ICAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfdW5tYXAoZCwgX2RmbihnZm5fbCks
IFBBR0VfT1JERVJfNEspOwo+ICAgICAgfQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5j
Cj4gaW5kZXggNWQ3MjI3MGM1Yi4uOWRkMGVkN2Y2MyAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3Z0ZC9pb21tdS5jCj4gQEAgLTIzMTYsNiArMjMxNiw5IEBAIHN0YXRpYyBpbnQgX19pbml0IHZ0
ZF9zZXR1cCh2b2lkKQo+ICAgICAgICovCj4gICAgICBmb3JfZWFjaF9kcmhkX3VuaXQgKCBkcmhk
ICkKPiAgICAgIHsKPiArICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICsgICAgICAgIHVp
bnQzMl90IHZhbDsKPiArCj4gICAgICAgICAgaW9tbXUgPSBkcmhkLT5pb21tdTsKPiAgCj4gICAg
ICAgICAgcHJpbnRrKCJJbnRlbCBWVC1kIGlvbW11ICUiUFJJdTMyIiBzdXBwb3J0ZWQgcGFnZSBz
aXplczogNGtCIiwKPiBAQCAtMjM1MSw2ICsyMzU0LDIyIEBAIHN0YXRpYyBpbnQgX19pbml0IHZ0
ZF9zZXR1cCh2b2lkKQo+ICAgICAgICAgIGlmICggIXZ0ZF9lcHRfcGFnZV9jb21wYXRpYmxlKGlv
bW11KSApCj4gICAgICAgICAgICAgIGlvbW11X2hhcF9wdF9zaGFyZSA9IDA7Cj4gIAo+ICsgICAg
ICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb21tdS0+cmVnaXN0ZXJfbG9jaywgZmxhZ3MpOwo+ICsg
ICAgICAgIHZhbCA9IGRtYXJfcmVhZGwoaW9tbXUtPnJlZywgRE1BUl9HU1RTX1JFRyk7Cj4gKyAg
ICAgICAgLyoKPiArICAgICAgICAgKiBUT0RPOiBuZWVkcyB0byBiZSByZXZpc2l0ZWQgb25jZSBY
ZW4gc3VwcG9ydHMgYm9vdGluZyB3aXRoIGFuCj4gKyAgICAgICAgICogYWxyZWFkeSBlbmFibGVk
IElPTU1VLgo+ICsgICAgICAgICAqLwo+ICsgICAgICAgIGlmICggdmFsICYgRE1BX0dTVFNfVEVT
ICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyBWVERQ
UkVGSVgKPiArICAgICAgICAgICAgICAgICAgICJJT01NVTogRE1BIHJlbWFwcGluZyBhbHJlYWR5
IGVuYWJsZWQsIGRpc2FibGluZyBpdFxuIik7Cj4gKyAgICAgICAgICAgIGRtYXJfd3JpdGVsKGlv
bW11LT5yZWcsIERNQVJfR0NNRF9SRUcsIHZhbCAmIH5ETUFfR0NNRF9URSk7Cj4gKyAgICAgICAg
ICAgIElPTU1VX1dBSVRfT1AoaW9tbXUsIERNQVJfR1NUU19SRUcsIGRtYXJfcmVhZGwsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgISh2YWwgJiBETUFfR1NUU19URVMpLCB2YWwpOwo+ICsg
ICAgICAgIH0KPiArICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpb21tdS0+cmVnaXN0
ZXJfbG9jaywgZmxhZ3MpOwo+ICsKPiAgICAgICAgICByZXQgPSBpb21tdV9zZXRfaW50ZXJydXB0
KGRyaGQpOwo+ICAgICAgICAgIGlmICggcmV0ICkKPiAgICAgICAgICB7Cj4gCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
