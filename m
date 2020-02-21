Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B252E168055
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:34:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59Lg-0001gG-H0; Fri, 21 Feb 2020 14:32:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j59Lf-0001gB-00
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:32:11 +0000
X-Inumbo-ID: f0fbbb9c-54b6-11ea-8688-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0fbbb9c-54b6-11ea-8688-12813bfff9fa;
 Fri, 21 Feb 2020 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582295530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=s8wEuDMjD4HPh3R83bK8IxGWuWV5tpoeeU6TGeaYRjI=;
 b=WKJiE6Vb34pKdET0PGJnV33wSwi4/62brcwJD4FiEA007DuU+TPcVoXj
 vAv3IhMjeLEKsyzegoNFY0Yy+jn5LO4sbKZfXNwzkzwoloHghlZJYAyEg
 8kThnSzf+N+zs56i914QbGbFklByYISBEuBFkXzdibvJ8tD+GClqcBRkL Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mS9wrc6ePHVP0ZKVbRP7+IfTO7zRBE9wIIRp0aX9g/qDYTFrJ+MStWfeJnVdNZN0EzaRG/8U5A
 NzHcMSXq68YRH8wHzSO2lii2Zpfp8MAYDKli3A9NWeq7B929TlWnT43LnupN/++vsyaPxm3RKF
 yPtE+x9SVFVO37CPOjY4xinVWbCNWLtoIzo9yxUnDL2RgzFDLAdv3eLL2VgjoYAn24gfcRdioA
 9kWfGnXh+3ze/Vw1HJaBgUGV9A6c1jjdDFroZRpJ1gSHfNk69sP2qPHSjkb0XyWtQ0HYEG5/jx
 1f8=
X-SBRS: 2.7
X-MesageID: 13177402
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,468,1574139600"; d="scan'208";a="13177402"
Date: Fri, 21 Feb 2020 15:32:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200221143202.GB4679@Air-de-Roger>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <20200221142635.GA4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221142635.GA4679@Air-de-Roger>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDM6MjY6MzVQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEZlYiAyMSwgMjAyMCBhdCAwMjozNjo1MlBNICswMTAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+IE9uIDIxLjAyLjIwMjAgMTA6MTAsIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6Cj4gPiA+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1
bGllbiBHcmFsbCB3cm90ZToKPiA+ID4+IEhpLAo+ID4gPj4KPiA+ID4+IE9uIDIwLzAyLzIwMjAg
MTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+ID4+PiBBbGxvdyBhIENQVSBhbHJlYWR5
IGhvbGRpbmcgdGhlIGxvY2sgaW4gd3JpdGUgbW9kZSB0byBhbHNvIGxvY2sgaXQgaW4KPiA+ID4+
PiByZWFkIG1vZGUuIFRoZXJlJ3Mgbm8gaGFybSBpbiBhbGxvd2luZyByZWFkIGxvY2tpbmcgYSBy
d2xvY2sgdGhhdCdzCj4gPiA+Pj4gYWxyZWFkeSBvd25lZCBieSB0aGUgY2FsbGVyIChpZTogQ1BV
KSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4gPiA+Pj4gYWNjZXNzZXMgaXMgcmVxdWly
ZWQgYXQgbGVhc3QgZm9yIHRoZSBDUFUgbWFwcyB1c2UtY2FzZS4KPiA+ID4+Pgo+ID4gPj4+IElu
IG9yZGVyIHRvIGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dz
IHRvIHN1cHBvcnQKPiA+ID4+PiB1cCB0byAxNjM4NCBDUFVzLiBBbHNvIHJlZHVjZSB0aGUgd3Jp
dGUgbG9jayBtYXNrIHRvIDIgYml0czogb25lIHRvCj4gPiA+Pj4gc2lnbmFsIHRoZXJlIGFyZSBw
ZW5kaW5nIHdyaXRlcnMgd2FpdGluZyBvbiB0aGUgbG9jayBhbmQgdGhlIG90aGVyIHRvCj4gPiA+
Pj4gc2lnbmFsIHRoZSBsb2NrIGlzIG93bmVkIGluIHdyaXRlIG1vZGUuIE5vdGUgdGhlIHdyaXRl
IHJlbGF0ZWQgZGF0YQo+ID4gPj4+IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBpcyBkb25lIGluIG9y
ZGVyIHRvIGJlIGFibGUgdG8gY2xlYXIgaXQgKGFuZAo+ID4gPj4+IHRodXMgcmVsZWFzZSB0aGUg
bG9jaykgdXNpbmcgYSAxNmJpdCBhdG9taWMgd3JpdGUuCj4gPiA+Pj4KPiA+ID4+PiBUaGlzIHJl
ZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBmcm9tIDE2Nzc3
MjE2IHRvCj4gPiA+Pj4gNjU1MzYsIEkgdGhpbmsgdGhpcyBzaG91bGQgc3RpbGwgYmUgZW5vdWdo
LCBvciBlbHNlIHRoZSBsb2NrIGZpZWxkCj4gPiA+Pj4gY2FuIGJlIGV4cGFuZGVkIGZyb20gMzIg
dG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBvcnQgYXRvbWljCj4gPiA+Pj4gb3Bl
cmF0aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPiA+ID4+Cj4gPiA+PiBGV0lXLCBhcm0zMiBpcyBh
YmxlIHRvIHN1cHBvcnQgYXRvbWljIG9wZXJhdGlvbnMgb24gNjQtYml0IGludGVnZXJzLgo+ID4g
Pj4KPiA+ID4+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBfd3JpdGVfdW5sb2NrKHJ3bG9ja190ICps
b2NrKQo+ID4gPj4+ICAgewo+ID4gPj4+IC0gICAgLyoKPiA+ID4+PiAtICAgICAqIElmIHRoZSB3
cml0ZXIgZmllbGQgaXMgYXRvbWljLCBpdCBjYW4gYmUgY2xlYXJlZCBkaXJlY3RseS4KPiA+ID4+
PiAtICAgICAqIE90aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0
byBjbGVhciBpdC4KPiA+ID4+PiAtICAgICAqLwo+ID4gPj4+IC0gICAgYXRvbWljX3N1YihfUVdf
TE9DS0VELCAmbG9jay0+Y250cyk7Cj4gPiA+Pj4gKyAgICAvKiBTaW5jZSB0aGUgd3JpdGVyIGZp
ZWxkIGlzIGF0b21pYywgaXQgY2FuIGJlIGNsZWFyZWQgZGlyZWN0bHkuICovCj4gPiA+Pj4gKyAg
ICBBU1NFUlQoX2lzX3dyaXRlX2xvY2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+Y250cykp
KTsKPiA+ID4+PiArICAgIEJVSUxEX0JVR19PTihfUVJfU0hJRlQgIT0gMTYpOwo+ID4gPj4+ICsg
ICAgd3JpdGVfYXRvbWljKCh1aW50MTZfdCAqKSZsb2NrLT5jbnRzLCAwKTsKPiA+ID4+Cj4gPiA+
PiBJIHRoaW5rIHRoaXMgaXMgYW4gYWJ1c2UgdG8gY2FzdCBhbiBhdG9taWNfdCgpIGRpcmVjdGx5
IGludG8gYSB1aW50MTZfdC4gWW91Cj4gPiA+PiB3b3VsZCBhdCBsZWFzdCB3YW50IHRvIHVzZSAm
bG9jay0+Y250cy5jb3VudGVyIGhlcmUuCj4gPiA+IAo+ID4gPiBTdXJlLCBJIHdhcyB3b25kZXJp
bmcgYWJvdXQgdGhpcyBteXNlbGYuCj4gPiA+IAo+ID4gPiBXaWxsIHdhaXQgZm9yIG1vcmUgY29t
bWVudHMsIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBjYW4gYmUgZml4ZWQgdXBvbgo+ID4gPiBjb21t
aXQgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGlzc3Vlcy4KPiA+IAo+ID4gSXQncyBtb3JlIHRoYW4g
anVzdCBhZGRpbmcgYW5vdGhlciBmaWVsZCBzcGVjaWZpZXIgaGVyZS4gQSBjYXN0IGxpa2UKPiA+
IHRoaXMgb25lIGlzIGVuZGlhbm5lc3MtdW5zYWZlLCBhbmQgaGVuY2UgYSB0cmFwIHdhaXRpbmcg
Zm9yIGEgYmlnCj4gPiBlbmRpYW4gcG9ydCBhdHRlbXB0IHRvIGZhbGwgaW50by4gQXQgdGhlIHZl
cnkgbGVhc3QgdGhpcyBzaG91bGQgY2F1c2UKPiA+IGEgYnVpbGQgZmFpbHVyZSBvbiBiaWcgZW5k
aWFuIHN5c3RlbXMsIGV2ZW4gYmV0dGVyIHdvdWxkIGJlIGlmIGl0IHdhcwo+ID4gZW5kaWFubmVz
cy1zYWZlLgo+IAo+IFdoeSBkb24ndCB3ZSBsZWF2ZSB0aGUgYXRvbWljX2RlYyB0aGVuPwoKU29y
cnksIHRoYXQgc2hvdWxkIGJlIGF0b21pY19zdWIsIG5vdCBhdG9taWNfZGVjLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
