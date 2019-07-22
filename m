Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D8703B5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 17:26:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpa8z-00008q-7j; Mon, 22 Jul 2019 15:22:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PbCh=VT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpa8y-00008l-ED
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 15:22:28 +0000
X-Inumbo-ID: 823d032a-ac94-11e9-b948-5f6bfc33892e
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 823d032a-ac94-11e9-b948-5f6bfc33892e;
 Mon, 22 Jul 2019 15:22:25 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YHsJ3Uy/7FhXS8Ef0S8JsE1sZFLLziT0w0F28VKIJjvPhWtikebzUFJFCJj/ow2bnYlFjhZUkH
 +1XKbh+4ucPiDGSTYXA8LD+R7s6BXbsTEdLw82sA3N09dOGIDaK9HUZxxqwItL7X55Cj6xS8KE
 ctL1qcAPVPzJJ1e6/fWzOuJ3sDlJ/cKoiA+BwJuvmhXCla0lw7LSm3Zz+PS016psxGuj7fIBGi
 1MZ0ZRtqBJhBmISL3OeUTZAfhOqzP5iWkb5SK882sbIpBmvMJXoZFTCCUDvVJzOe101GAiYzUr
 VWY=
X-SBRS: 2.7
X-MesageID: 3366934
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3366934"
Date: Mon, 22 Jul 2019 17:21:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <CAMmSBy8CcG08-+-F6fvwmH1oEKpsV8OGEco94g04dZcyyFWKbw@mail.gmail.com>
 <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
 <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
 <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
 <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
 <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 'Roman Shaposhnik' <roman@zededa.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDU6MDI6MzVQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAyMiBKdWx5IDIwMTkgMTU6NDAK
PiA+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+ID4gQ2M6ICdS
b21hbiBTaGFwb3NobmlrJyA8cm9tYW5AemVkZWRhLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgamdyb3NzQHN1c2UuY29tOyBBbmRyZXcKPiA+IENvb3BlciA8QW5kcmV3LkNv
b3BlcjNAY2l0cml4LmNvbT47IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tOyBqYmV1bGljaEBz
dXNlLmNvbQo+ID4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtCVUddIEFmdGVyIHVwZ3JhZGUg
dG8gWGVuIDQuMTIuMCBpb21tdT1uby1pZ2Z4Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L21tL3AybS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiBpbmRleCBmZWY5N2M4MmY2Li44
OGEyNDMwYzhjIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiArKysg
Yi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+IEBAIC04MzYsNyArODM2LDcgQEAgZ3Vlc3RfcGh5
c21hcF9hZGRfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIG1mbl90IG1mbiwKPiA+
ICAgICAgICAgICAqLwo+ID4gICAgICAgICAgZm9yICggaSA9IDA7IGkgPCAoMVVMIDw8IHBhZ2Vf
b3JkZXIpOyArK2ksICsrcGFnZSApCj4gPiAgICAgICAgICB7Cj4gPiAtICAgICAgICAgICAgaWYg
KCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKPiA+ICsgICAgICAgICAgICBpZiAoICFoYXNfaW9t
bXVfcHQoZCkgKQo+ID4gICAgICAgICAgICAgICAgICAvKiBub3RoaW5nICovOwo+ID4gICAgICAg
ICAgICAgIGVsc2UgaWYgKCBnZXRfcGFnZV9hbmRfdHlwZShwYWdlLCBkLCBQR1Rfd3JpdGFibGVf
cGFnZSkgKQo+ID4gICAgICAgICAgICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsKPiA+
IEBAIC0xMzQxLDcgKzEzNDEsNyBAQCBpbnQgc2V0X2lkZW50aXR5X3AybV9lbnRyeShzdHJ1Y3Qg
ZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbl9sLAo+ID4gCj4gPiAgICAgIGlmICggIXBhZ2lu
Z19tb2RlX3RyYW5zbGF0ZShwMm0tPmRvbWFpbikgKQo+ID4gICAgICB7Cj4gPiAtICAgICAgICBp
ZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQo+ID4gKyAgICAgICAgaWYgKCAhaGFzX2lvbW11
X3B0KGQpICkKPiA+ICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICAgICAgICAgIHJldHVybiBp
b21tdV9sZWdhY3lfbWFwKGQsIF9kZm4oZ2ZuX2wpLCBfbWZuKGdmbl9sKSwgUEFHRV9PUkRFUl80
SywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl9yZWFkYWJsZSB8
IElPTU1VRl93cml0YWJsZSk7Cj4gPiBAQCAtMTQzMiw3ICsxNDMyLDcgQEAgaW50IGNsZWFyX2lk
ZW50aXR5X3AybV9lbnRyeShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbl9sKQo+
ID4gCj4gPiAgICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApCj4gPiAgICAgIHsK
PiA+IC0gICAgICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCj4gPiArICAgICAgICBp
ZiAoICFoYXNfaW9tbXVfcHQoZCkgKQo+ID4gICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gICAg
ICAgICAgcmV0dXJuIGlvbW11X2xlZ2FjeV91bm1hcChkLCBfZGZuKGdmbl9sKSwgUEFHRV9PUkRF
Ul80Syk7Cj4gPiAgICAgIH0KPiAKPiBZZXMsIHRoaXMgYWxsIGxvb2tzIG9rIHRvIG1lLi4uIGFs
dGhvdWdoIEkgc3RpbGwgZmluZCBpdCBjb3VudGVyaW50dWl0aXZlIHRoYXQgd2UgbWFrZSBwMm0g
Y2FsbHMgZm9yIFBWIGRvbWFpbnMuCgpJIGFncmVlLCBhbGJlaXQgSSdtIG5vdCBzdXJlIG9mIGhv
dyB0byBnZXQgcmlkIG9mIHRob3NlLCB3aWxsIG5lZWQgdG8KbG9vayBhdCB0aGUgY2FsbGVycy4g
Rm9yIGlvbW11IGNhbGxlcnMgd2UgY291bGQgbGlrZWx5IGp1c3QgY2FsbAppb21tdV9sZWdhY3lf
e21hcC91bm1hcH0gZm9yIFBWLgoKSSdtIGdvaW5nIHRvIGZvcm1hbGx5IHN1Ym1pdCB0aGlzIHBh
dGNoIHRoZW4uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
