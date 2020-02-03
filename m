Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B00150A47
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 16:52:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iydz4-0004Qr-3r; Mon, 03 Feb 2020 15:49:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iydz3-0004Qh-82
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 15:49:57 +0000
X-Inumbo-ID: d306b092-469c-11ea-8e73-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d306b092-469c-11ea-8e73-12813bfff9fa;
 Mon, 03 Feb 2020 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580744996;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NJ/U6viTsi7+juQpObnqqRbSGb8CDLKuqdA6qp+WanI=;
 b=S0HmExwsBPU4Qe64RTBBUuqrGu1NXQMKJQm07AHXEYvRjrLSo9eXiIRx
 D0j3WMyqQNlIz8VomVrhfwZAyyT6E2yMFzu+dhp7/waIcxLywQV/wZ9PB
 6Zr+SK8EBEyyDdzSPSSfWe3Vhpi+L9089y/gn1ynpENZZD7YFWsUoqjVC 4=;
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
IronPort-SDR: 2Mobr5y60OdptwI43wfj5seXmIoGuIyDv+LIh56uz5Y428OncZ8VTW7OaMA7OzGhRW5p0Wuvkp
 LThxzU2RpHsc+Z3RG94CH3/xIsd2DpJUsLMeM6Xb6jYdiCN/xwpxl8at4N7a40hDEtuz51zDLI
 bQo3WJs9XSEKTh+Xn9WpfaGfo+hYUDvSvBlOfRtx/ZAjsbp0CxA3J++ORMLNMrmwWv0SoKn0pn
 mTGAnvhxKl31uXO15COmWECCNBBvcMw9zTuc8e9Nu0X+NjjeEwp2O1WoV1iw4FOMqM68cmL3SL
 0hk=
X-SBRS: 2.7
X-MesageID: 12029046
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12029046"
Date: Mon, 3 Feb 2020 16:49:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200203154948.GB4679@Air-de-Roger>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200203150154.GZ4679@Air-de-Roger>
 <20200203150724.bdnhkkyrntsdvxpl@debian>
 <20200203152106.GA4679@Air-de-Roger>
 <e64af101-1f13-c7e7-6ffe-6afd5db9393b@suse.com>
 <20200203154217.22yp2qqj4itbzbml@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200203154217.22yp2qqj4itbzbml@debian>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDM6NDI6MTdQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEZlYiAwMywgMjAyMCBhdCAwNDozMjo1MlBNICswMTAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+IE9uIDAzLjAyLjIwMjAgMTY6MjEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4g
PiA+IE9uIE1vbiwgRmViIDAzLCAyMDIwIGF0IDAzOjA3OjI0UE0gKzAwMDAsIFdlaSBMaXUgd3Jv
dGU6Cj4gPiA+PiBPbiBNb24sIEZlYiAwMywgMjAyMCBhdCAwNDowMTo1NFBNICswMTAwLCBSb2dl
ciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPj4+IE9uIEZyaSwgSmFuIDMxLCAyMDIwIGF0IDA1OjQ5
OjI0UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPiA+Pj4+IEh5cGVyLVYgdXNlcyBhIHRlY2hu
aXF1ZSBjYWxsZWQgb3ZlcmxheSBwYWdlIGZvciBpdHMgaHlwZXJjYWxsIHBhZ2UuIEl0Cj4gPiA+
Pj4+IHdpbGwgaW5zZXJ0IGEgYmFja2luZyBwYWdlIHRvIHRoZSBndWVzdCB3aGVuIHRoZSBoeXBl
cmNhbGwgZnVuY3Rpb25hbGl0eQo+ID4gPj4+PiBpcyBlbmFibGVkLiBUaGF0IG1lYW5zIHdlIGNh
biB1c2UgYSBwYWdlIHRoYXQgaXMgbm90IGJhY2tlZCBieSByZWFsCj4gPiA+Pj4+IG1lbW9yeSBm
b3IgaHlwZXJjYWxsIHBhZ2UuCj4gPiA+Pj4+Cj4gPiA+Pj4+IFVzZSB0aGUgdG9wLW1vc3QgYWRk
cmVzc2FibGUgcGFnZSBmb3IgdGhhdCBwdXJwb3NlLiBBZGp1c3QgZTgyMCBtYXAKPiA+ID4+Pj4g
YWNjb3JkaW5nbHkuCj4gPiA+Pj4KPiA+ID4+PiBDYW4geW91IGFkZCB0aGlzIGlzIGRvbmUgdG8g
YXZvaWQgcGFnZSBzaGF0dGVyaW5nIGFuZCB0byBtYWtlIHN1cmUKPiA+ID4+PiBYZW4gaXNuJ3Qg
b3ZlcndyaXRpbmcgYW55IE1NSU8gYXJlYSB3aGljaCBtaWdodCBiZSBwcmVzZW50IGF0IGxvd2Vy
Cj4gPiA+Pj4gYWRkcmVzc2VzPwo+ID4gPj4KPiA+ID4+IE5QLgo+ID4gPj4KPiA+ID4+Pgo+ID4g
Pj4+PiArCj4gPiA+Pj4+ICtzdGF0aWMgdm9pZCBfX2luaXQgZTgyMF9maXh1cChzdHJ1Y3QgZTgy
MG1hcCAqZTgyMCkKPiA+ID4+Pj4gK3sKPiA+ID4+Pj4gKyAgICB1aW50NjRfdCBzID0gSFZfSENB
TExfTUZOIDw8IFBBR0VfU0hJRlQ7Cj4gPiA+Pj4+ICsKPiA+ID4+Pj4gKyAgICBpZiAoICFlODIw
X2FkZF9yYW5nZShlODIwLCBzLCBzICsgUEFHRV9TSVpFLCBFODIwX1JFU0VSVkVEKSApCj4gPiA+
Pj4KPiA+ID4+PiBJIHRoaW5rIGVuZCBzaG91bGQgYmUgcyArIFBBR0VfU0laRSAtIDEsIG9yIGVs
c2UgaXQgZXhwYW5kcyBhY3Jvc3MgdHdvCj4gPiA+Pj4gcGFnZXM/Cj4gPiA+Pgo+ID4gPj4gTm8s
IGl0IHNob3VsZG4ndC4KPiA+ID4+Cj4gPiA+PiBFODIwIGVudHJ5IHJlY29yZHMgdGhlIHNpemUg
b2YgdGhlIHJlZ2lvbiwgd2hpY2ggaXMgY2FsY3VsYXRlZCBhcwo+ID4gPj4gZW5kLXN0YXJ0LiBU
aGUgb25lIHVzYWdlIGluIHB2L3NoaW0uYyBmb2xsb3dzIHRoZSBzYW1lIHBhdHRlcm4gaGVyZS4K
PiA+ID4gCj4gPiA+IEhtLCBJIHNlZS4gSSdtIG5vdCBzdXJlIHRoaXMgaXMgY29ycmVjdCwgSSB0
aGluayB0aGUgZTgyMCBlbnRyeQo+ID4gPiBzaG91bGQgbG9vayBsaWtlOgo+ID4gPiAKPiA+ID4g
YWRkciA9IHM7Cj4gPiA+IHNpemUgPSBQQUdFX1NJWkUgLSAxOwo+ID4gPiAKPiA+ID4gQXMgcmFu
Z2VzIG9uIHRoZSBlODIwIGFyZSBpbmNsdXNpdmUsIHNvIGlmIHNpemUgZW5kcyB1cCBiZWluZwo+
ID4gPiBQQUdFX1NJWkUgdGhlbiB0aGUgZW50cnkgd291bGQgZXhwYW5kIGFjcm9zcyB0d28gcGFn
ZXMuCj4gPiAKPiA+IFJhbmdlcyBjYW4gc2Vuc2libHkgYmUgaW5jbHVzaXZlIG9ubHkgd2hlbiBz
cGVjaWZpZWQgYXMgW3N0YXJ0LGVuZF0KPiA+IHR1cGxlcy4gKHN0YXJ0LHNpemUpIHBhaXJzIG1h
a2Ugbm8gc2Vuc2UgZm9yIHJlcHJlc2VudGluZwo+ID4gW3N0YXJ0LHN0YXJ0K3NpemVdLCB0aGV5
IG9ubHkgbWFrZSBzZW5zZSBmb3IgW3N0YXJ0LHN0YXJ0K3NpemUpLgo+ID4gT3RoZXJ3aXNlLCBh
cyBpbiB5b3VyIGV4YW1wbGUgYWJvdmUsIHNpemUgdGFrZW4gb24gaXRzIG93biBpcyBvZmYKPiA+
IGJ5IG9uZSAoaS5lLiBpcyByYXRoZXIgImxhc3QgYnl0ZSIgdGhhbiAic2l6ZSIpLgo+ID4gCj4g
PiBNb2Rlcm4gTGludXgsIHdoZW4gbG9nZ2luZyB0aGUgbWVtb3J5IG1hcCwgaW5kZWVkIHN1YnRy
YWN0cyAxIGZyb20KPiA+IHRoZSBzdW0gb2YgYWRkciBhbmQgc2l6ZSwgdG8gc2hvdyBhbiBpbmNs
dXNpdmUgcmFuZ2UuCj4gCj4gV2Ugc2hvdWxkIHBlcmhhcHMgZG8gdGhlIHNhbWUgdGhlbi4KPiAK
PiBJZiBwZW9wbGUgYWdyZWUgdGhpcyBpcyB0aGUgd2F5IHRvIGdvLCBJIGNhbiB3cml0ZSBhIHBh
dGNoLgoKT2gsIHNvcnJ5LiBJIGdvdCBtZXNzZWQgdXAgYnkgdGhlIHdheSB3ZSBwcmludCB0aGUg
cmFuZ2VzLgoKSSB0aGluayBpdCB3b3VsZCBiZSBoZWxwZnVsIHRvIC0xIHdoZW4gcHJpbnRpbmcg
dGhlIHJhbmdlcywgYnV0CnRoZXJlJ3Mgbm8gbmVlZCB0byBkbyBpdCBpbiB0aGlzIHNlcmllcy4K
ClRoYW5rcywgUm9nZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
