Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6887E30F6E
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 15:59:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWi0s-0003XK-Ga; Fri, 31 May 2019 13:56:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q4nb=T7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hWi0q-0003XF-PP
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 13:56:04 +0000
X-Inumbo-ID: d19ee274-83ab-11e9-b920-cf0c7fd6158f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d19ee274-83ab-11e9-b920-cf0c7fd6158f;
 Fri, 31 May 2019 13:55:59 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: fNaus0QgWyMGn4d0x1Hf939f8TgzW/Is/Rpq9LwWYsoKjXi4Qr5LOFt4tBWHcDAvMaxTP5bfUu
 yIyA5SdVo6wPD+CRKLmpQ6l4d5u0Va7IyC5oqZdSF5fmG5soOrhufifis0rEkP+yJOBR1InPSU
 W2YasLlTJY1TwlZB9mU1BcWG7ll048SWcmD56zyFElsGDqXdiVhC5qY3KAhzxP5ulFXPPWIWOe
 RYXtIjaVjCl//EuGq1fysC0PTBjykV9pxYovh27B/cd2J4hHZPplYxy9S47qWy6aihg0Q4pn1h
 SR4=
X-SBRS: 2.7
X-MesageID: 1131228
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,535,1549947600"; 
   d="scan'208";a="1131228"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH 4/5] iommu: introduce iommu_groups
Thread-Index: AQHVBaFRy03LVQmKMkuPdTuUm46mjKZsJTQAgBk+p7A=
Date: Fri, 31 May 2019 13:55:55 +0000
Message-ID: <cb3fd070fa6748148dd4af032a7b6edc@AMSPEX02CL03.citrite.net>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-5-paul.durrant@citrix.com>
 <5CDC1F96020000780022F4BF@prv1-mh.provo.novell.com>
In-Reply-To: <5CDC1F96020000780022F4BF@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/5] iommu: introduce iommu_groups
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTUgTWF5IDIwMTkgMTU6MTgKPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5j
b20+OyBXZWkgTGl1Cj4gPHdlaS5saXUyQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNv
bT47Cj4gU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRl
dmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBLb25yYWQKPiBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3Jn
Pgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC81XSBpb21tdTogaW50cm9kdWNlIGlvbW11X2dyb3Vw
cwo+IAo+ID4+PiBPbiAwOC4wNS4xOSBhdCAxNToyNCwgPHBhdWwuZHVycmFudEBjaXRyaXguY29t
PiB3cm90ZToKPiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiA+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiA+IEBAIC02NTUsNiArNjU1LDgy
IEBAIHN0YXRpYyB2b2lkIGlvbW11X2R1bXBfcDJtX3RhYmxlKHVuc2lnbmVkIGNoYXIga2V5KQo+
ID4gICAgICB9Cj4gPiAgfQo+ID4KPiA+ICsjaWZkZWYgQ09ORklHX0hBU19QQ0kKPiA+ICsKPiA+
ICtzdHJ1Y3QgaW9tbXVfZ3JvdXAgewo+ID4gKyAgICB1bnNpZ25lZCBpbnQgaWQ7Cj4gPiArICAg
IHVuc2lnbmVkIGludCBpbmRleDsKPiA+ICsgICAgc3RydWN0IGxpc3RfaGVhZCBkZXZzX2xpc3Q7
Cj4gPiArfTsKPiAKPiBDb3VsZCB0aGVzZSBhZGRpdGlvbnMgYXMgYSB3aG9sZSBnbyBpbnRvIGEg
bmV3IGdyb3Vwcy5jPwoKU3VyZS4KCj4gCj4gPiAraW50IGlvbW11X2dyb3VwX2Fzc2lnbihzdHJ1
Y3QgcGNpX2RldiAqcGRldikKPiA+ICt7Cj4gPiArICAgIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMg
Km9wczsKPiA+ICsgICAgdW5zaWduZWQgaW50IGlkOwo+ID4gKyAgICBzdHJ1Y3QgaW9tbXVfZ3Jv
dXAgKmdycDsKPiA+ICsKPiA+ICsgICAgb3BzID0gaW9tbXVfZ2V0X29wcygpOwo+ID4gKyAgICBp
ZiAoICFvcHMgfHwgIW9wcy0+Z2V0X2RldmljZV9ncm91cF9pZCApCj4gCj4gVGhlIHdheSBpb21t
dV9nZXRfb3BzKCkgd29ya3MgdGhlIGxlZnQgc2lkZSBvZiB0aGUgfHwgaXMgcG9pbnRsZXNzLgoK
WWVzLCB0aGlzIHdhcyBhIGhhbmdvdmVyIGZyb20gYSBwcmV2aW91cyB2YXJpYW50IG9mIHBhdGNo
ICMzLCB3aGljaCBJJ20gZ29pbmcgdG8gZHJvcCBhbnl3YXkuCgo+IAo+ID4gKyAgICAgICAgcmV0
dXJuIDA7Cj4gPiArCj4gPiArICAgIGlkID0gb3BzLT5nZXRfZGV2aWNlX2dyb3VwX2lkKHBkZXYt
PnNlZywgcGRldi0+YnVzLCBwZGV2LT5kZXZmbik7Cj4gPiArICAgIGdycCA9IGdldF9pb21tdV9n
cm91cChpZCk7Cj4gCj4gSSBkb24ndCB0aGluayBzb2xpdGFyeSBkZXZpY2VzIHNob3VsZCBiZSBh
bGxvY2F0ZWQgYSBncm91cC4gQWxzbwo+IHlvdSBkb24ndCBoYW5kbGUgZmFpbHVyZSBvZiBvcHMt
PmdldF9kZXZpY2VfZ3JvdXBfaWQoKS4KClRydWUsIGl0IGNhbiBmYWlsIGluIHRoZSBWVC1kIGNh
c2UuIE5vdCBjbGVhciB3aGF0IHRvIGRvIGluIHRoYXQgY2FzZSB0aG91Z2g7IEkgZ3Vlc3MgYXNz
dW1lIC0gZm9yIG5vdyAtIHRoYXQgdGhlIGRldmljZSBnZXRzIGl0cyBvd24gZ3JvdXAuCkkgdGhp
bmsgYWxsIGRldmljZXMgc2hvdWxkIGdldCBhIGdyb3VwLiBUaGUgZ3JvdXAgd2lsbCB1bHRpbWF0
ZWx5IGJlIHRoZSB1bml0IG9mIGFzc2lnbm1lbnQgdG8gYSBWTSBhbmQsIGluIHRoZSBiZXN0IGNh
c2UsIHdlICpleHBlY3QqIGVhY2ggZGV2aWNlIHRvIGhhdmUgaXRzIG93biBncm91cC4uLiBpdCdz
IG9ubHkgd2hlbiB0aGVyZSBhcmUgcXVpcmtzLCBsZWdhY3kgYnJpZGdlcyBldGMuIHRoYXQgbXVs
dGlwbGUgZGV2aWNlcyBzaG91bGQgZW5kIHVwIGluIHRoZSBzYW1lIGdyb3VwLiBUaGlzIGlzIGNv
bnNpc3RlbnQgd2l0aCBMaW51eCdzIElPTU1VIGdyb3Vwcy4KCj4gCj4gPiArICAgIGlmICggISBn
cnAgKQo+IAo+IE5pdDogU3RyYXkgYmxhbmsuCgpPaCB5ZXMuCgo+IAo+ID4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL3BjaS5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKPiA+IEBAIC03
NSw2ICs3NSw5IEBAIHN0cnVjdCBwY2lfZGV2IHsKPiA+ICAgICAgc3RydWN0IGxpc3RfaGVhZCBh
bGxkZXZzX2xpc3Q7Cj4gPiAgICAgIHN0cnVjdCBsaXN0X2hlYWQgZG9tYWluX2xpc3Q7Cj4gPgo+
ID4gKyAgICBzdHJ1Y3QgbGlzdF9oZWFkIGdycGRldnNfbGlzdDsKPiAKPiBEb2VzIHRoaXMgc2Vw
YXJhdGUgbGlzdCBwcm92aWRlIG11Y2ggdmFsdWU/IFRoZSBkZXZpY2VzIGluIGEgZ3JvdXAKPiBh
cmUgZ29pbmcgdG8gbW92ZSBiZXR3ZWVuIHR3byBkb21haW5fbGlzdC1zIGFsbCBpbiBvbmUgZ28s
IHNvCj4gb25jZSB5b3Uga25vdyB0aGUgZG9tYWluIG9mIG9uZSB5b3UnbGwgYmUgYWJsZSB0byBm
aW5kIHRoZSByZXN0IGJ5Cj4gaXRlcmF0aW5nIHRoYXQgZG9tYWluJ3MgbGlzdC4gSXMgdGhlIGZl
YXIgdGhhdCBzdWNoIGFuIGl0ZXJhdGlvbiBtYXkKPiBiZSB0ZW5zIG9mIHRob3VzYW5kcyBvZiBl
bnRyaWVzIGxvbmcsIGFuZCBoZW5jZSBiZWNvbWUgYW4gaXNzdWUKPiB3aGVuIHRyYXZlcnNlZD8g
SSBoYXZlIG5vIGlkZWEgaG93IG1hbnkgUENJIGRldmljZXMgdGhlIGJpZ2dlc3QKPiBzeXN0ZW1z
IHRvZGF5IHdvdWxkIGhhdmUsIGJ1dCBpZiB0cmF2ZXJzYWwgd2FzIGFuIGlzc3VlLCB0aGVuIGl0
Cj4gd291bGQgYWxyZWFkeSBiZSB3aXRoIHRoZSBjb2RlIHdlJ3ZlIGdvdCBub3cuCgpJJ2QgcHJl
ZmVyIHRvIGtlZXAgaXQuLi4gSXQgbWFrZXMgdGhlIHJlLWltcGxlbWVudGF0aW9uIG9mIHRoZSBk
b21jdGwgaW4gdGhlIG5leHQgcGF0Y2ggbW9yZSBzdHJhaWdodGZvcndhcmQuCgogIFBhdWwKCj4g
Cj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
