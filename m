Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA8FC3283
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 13:33:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFGME-0001nA-8i; Tue, 01 Oct 2019 11:30:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hWiX=X2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iFGMC-0001n5-P6
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 11:30:16 +0000
X-Inumbo-ID: d6da4776-e43e-11e9-97fb-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id d6da4776-e43e-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569929415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IJji6CvTHJATSJX/o//bsvT/umzeNm+dzL0HbUHiGhc=;
 b=FR9VFXYo8v9aDMxai53iiE01f8MIHHCppluAwhoKjtIy+sppJ4A+2GyS
 l4dbrE/9l7D6oCbHVsrhoX6b8CiCbijVu0vnzhjsU/sWCeM0GFaEb08/o
 4c35HQWedhhIfaohxyVNsKArrJIZLJY5D0ne7i0j3glDm4dhuTGkCTQrq Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HM8VpHfKPpU3/fEkdn49r04Wm95dRmCEyoySCGnfD7EhJZ7SS4mHVEBLd21Su8/tQ78LBYi+kH
 TDCMtfIITFOYkPPQjGPiQtmcFeMvk/cTlD/RnFCUuO7AS3aKc5mHcX9KtL6ivTvI8v3bXOsX+g
 565rE5j2mDq+zTEMkIax4ivoH1dd3fOaFO7ivgSrsHKNuaKzgoACqzZ9s6s2gW228NYK9xbkQu
 JWn2XRO18E20Q7vp/ZwLheRPb2X0OQzWlFUgzJrCSwgOS2NY+Ibyp7MjZsE0mo21d+LyUwxrUN
 e1g=
X-SBRS: 2.7
X-MesageID: 6542135
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6542135"
Date: Tue, 1 Oct 2019 13:30:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191001113008.dquc2jhxgjenst5a@Air-de-Roger>
References: <98fd2d35-30f6-961d-a03d-3354b77d49b0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98fd2d35-30f6-961d-a03d-3354b77d49b0@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMTE6MDc6NTVBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIHdyaXRlLWRpc2NhcmQgcHJvcGVydHkgb2YgdGhlIHR5cGUgY2FuJ3QgYmUgcmVw
cmVzZW50ZWQgaW4gSU9NTVUKPiBwYWdlIHRhYmxlIGVudHJpZXMuIE1ha2Ugc3VyZSB0aGUgcmVz
cGVjdGl2ZSBjaGVja3MgLyB0cmFja2luZyBjYW4ndAo+IHJhY2UsIGJ5IHV0aWxpemluZyB0aGUg
ZG9tYWluIGxvY2suIFRoZSBvdGhlciBzaWRlcyBvZiB0aGUgc2hhcmluZy8KPiBwYWdpbmcvbG9n
LWRpcnR5IGV4Y2x1c2lvbiBjaGVja3Mgc2hvdWxkIHN1YnNlcXVlbnRseSBwZXJoYXBzIGFsc28g
YmUKPiBwdXQgdW5kZXIgdGhhdCBsb2NrIHRoZW4uCj4gCj4gVGhpcyBhbHNvIGZpeGVzIGFuIHVu
Z3VhcmRlZCBkLT5hcmNoLmh2bSBhY2Nlc3MuCj4gCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5k
IGFsc28gY29udmVydCBuZWlnaGJvcmluZyBib29sX3QgdG8gYm9vbCBpbgo+IHN0cnVjdCBodm1f
ZG9tYWluLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4K
PiAtLS0KPiB2MzogUmUtYmFzZS4KPiB2MjogRG9uJ3Qgc2V0IHAybV9yYW1fcm9fdXNlZCB3aGVu
IGZhaWxpbmcgdGhlIHJlcXVlc3QuCj4gCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kbS5jCj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS9kbS5jCj4gQEAgLTI1NSwxNiArMjU1LDMzIEBAIHN0YXRp
YyBpbnQgc2V0X21lbV90eXBlKHN0cnVjdCBkb21haW4gKmQKPiAgCj4gICAgICBtZW1fdHlwZSA9
IGFycmF5X2luZGV4X25vc3BlYyhkYXRhLT5tZW1fdHlwZSwgQVJSQVlfU0laRShtZW10eXBlKSk7
Cj4gIAo+IC0gICAgaWYgKCBtZW1fdHlwZSA9PSBIVk1NRU1faW9yZXFfc2VydmVyICkKPiArICAg
IHN3aXRjaCAoIG1lbV90eXBlICkKPiAgICAgIHsKPiAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxh
Z3M7Cj4gIAo+ICsgICAgY2FzZSBIVk1NRU1faW9yZXFfc2VydmVyOgo+ICAgICAgICAgIGlmICgg
IWhhcF9lbmFibGVkKGQpICkKPiAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAK
PiAgICAgICAgICAvKiBEbyBub3QgY2hhbmdlIHRvIEhWTU1FTV9pb3JlcV9zZXJ2ZXIgaWYgbm8g
aW9yZXEgc2VydmVyIG1hcHBlZC4gKi8KPiAgICAgICAgICBpZiAoICFwMm1fZ2V0X2lvcmVxX3Nl
cnZlcihkLCAmZmxhZ3MpICkKPiAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsg
ICAgICAgIGJyZWFrOwo+ICsKPiArICAgIGNhc2UgSFZNTUVNX3JhbV9ybzoKPiArICAgICAgICAv
KiBwMm1fcmFtX3JvIGNhbid0IGJlIHJlcHJlc2VudGVkIGluIElPTU1VIG1hcHBpbmdzLiAqLwo+
ICsgICAgICAgIGRvbWFpbl9sb2NrKGQpOwo+ICsgICAgICAgIGlmICggaGFzX2FyY2hfcGRldnMo
ZCkgKQoKSSB3b3VsZCB1c2UgaXNfaW9tbXVfZW5hYmxlZCBiZWNhdXNlIEkgdGhpbmsgaXQncyBj
bGVhcmVyIGluIHRoaXMKY29udGV4dCAoZ2l2aW5nIHRoZSBjb21tZW50IGFib3ZlIGV4cGxpY2l0
bHkgcmVmZXJzIHRvIGhhdmluZyBpb21tdQptYXBwaW5ncykuCgo+ICsgICAgICAgICAgICByYyA9
IC1FWERFVjsKCkVPUE5PVFNVUFAgbWlnaHQgYmUgYmV0dGVyLCBzaW5jZSBpdCdzIHBvc3NpYmxl
IHRoYXQgZnV0dXJlIGlvbW11cwpzdXBwb3J0IHN1Y2ggcGFnZSB0eXBlPwoKPiArICAgICAgICBl
bHNlCj4gKyAgICAgICAgICAgIGQtPmFyY2guaHZtLnAybV9yYW1fcm9fdXNlZCA9IHRydWU7Cj4g
KyAgICAgICAgZG9tYWluX3VubG9jayhkKTsKPiArCj4gKyAgICAgICAgaWYgKCByYyApCj4gKyAg
ICAgICAgICAgIHJldHVybiByYzsKPiArCj4gKyAgICAgICAgYnJlYWs7Cj4gICAgICB9Cj4gIAo+
ICAgICAgd2hpbGUgKCBpdGVyIDwgZGF0YS0+bnIgKQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3BjaS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPiBAQCAt
MTQ4NiwxNSArMTQ4NiwzMyBAQCBzdGF0aWMgaW50IGFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFp
biAqCj4gICAgICBpZiAoICFpc19pb21tdV9lbmFibGVkKGQpICkKPiAgICAgICAgICByZXR1cm4g
MDsKPiAgCj4gLSAgICAvKiBQcmV2ZW50IGRldmljZSBhc3NpZ24gaWYgbWVtIHBhZ2luZyBvciBt
ZW0gc2hhcmluZyBoYXZlIGJlZW4gCj4gLSAgICAgKiBlbmFibGVkIGZvciB0aGlzIGRvbWFpbiAq
Lwo+IC0gICAgaWYgKCB1bmxpa2VseShkLT5hcmNoLmh2bS5tZW1fc2hhcmluZ19lbmFibGVkIHx8
Cj4gLSAgICAgICAgICAgICAgICAgIHZtX2V2ZW50X2NoZWNrX3JpbmcoZC0+dm1fZXZlbnRfcGFn
aW5nKSB8fAo+ICsgICAgZG9tYWluX2xvY2soZCk7Cj4gKwo+ICsgICAgLyoKPiArICAgICAqIFBy
ZXZlbnQgZGV2aWNlIGFzc2lnbm1lbnQgaWYgYW55IG9mCj4gKyAgICAgKiAtIG1lbSBwYWdpbmcK
PiArICAgICAqIC0gbWVtIHNoYXJpbmcKPiArICAgICAqIC0gdGhlIHAybV9yYW1fcm8gdHlwZQo+
ICsgICAgICogLSBnbG9iYWwgbG9nLWRpcnR5IG1vZGUKPiArICAgICAqIGFyZSBpbiB1c2UgYnkg
dGhpcyBkb21haW4uCj4gKyAgICAgKi8KPiArICAgIGlmICggdW5saWtlbHkodm1fZXZlbnRfY2hl
Y2tfcmluZyhkLT52bV9ldmVudF9wYWdpbmcpIHx8Cj4gKyNpZmRlZiBDT05GSUdfSFZNCj4gKyAg
ICAgICAgICAgICAgICAgIChpc19odm1fZG9tYWluKGQpICYmCj4gKyAgICAgICAgICAgICAgICAg
ICAoZC0+YXJjaC5odm0ubWVtX3NoYXJpbmdfZW5hYmxlZCB8fAo+ICsgICAgICAgICAgICAgICAg
ICAgIGQtPmFyY2guaHZtLnAybV9yYW1fcm9fdXNlZCkpIHx8Cj4gKyNlbmRpZgo+ICAgICAgICAg
ICAgICAgICAgICBwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkgKQoKSXMgc3Vj
aCBjaGVjayBuZWVkZWQgYW55bW9yZT8KCldpdGggdGhlIGVuYWJsaW5nIG9mIHRoZSBpb21tdSBy
aWdodCBhdCBkb21haW4gY3JlYXRpb24gaXQgc2hvdWxkbid0CmJlIHBvc3NpYmxlIHRvIGVuYWJs
ZSBhbnkgb2YgdGhlIGFib3ZlIGZlYXR1cmVzIGF0IGFsbCBhbnltb3JlLgoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
