Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6A5168031
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:28:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59GQ-0000gx-Mr; Fri, 21 Feb 2020 14:26:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j59GO-0000gp-UU
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:26:44 +0000
X-Inumbo-ID: 2efc3148-54b6-11ea-aa99-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2efc3148-54b6-11ea-aa99-bc764e2007e4;
 Fri, 21 Feb 2020 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582295204;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=emEH6vAzYcFSZPpGUX7HS0C/AAyeP4PdwQ0OH5stPbc=;
 b=JyBmnfni9zDlKEJi9OMK90d42VbxB374yyPRYvmh6N/E2dr4k0+1C436
 68aml1vw2XAkzyLmEWJawglw4Dqb2b1nQsLzNLDu79zhjFnv9aV8EFkj7
 au7RDpPbFuGs4frCshkDfyzF1Qh1vbP22epcjJlxTqORUFXFur5UvI8lC U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ICMhF6iyL9gALPHnS3Rw9RFSFwTv1Rw/cBVdPkLvT6kjQiLYN2+Czd1y0C1jkKPUDtwmO/ojXD
 RqsQ/IND4ZqUzN2kKQGi13P/CNEcxtK+Ucfm1K0hfq8HLytL8NA0VAjHnoZT9+PiCCdsOwsjuv
 CNa8Z3ic+GlCvjbwr7mR+OX+spkuPczoiZjXX3q0gQZCBt70NZ+/LrlSb6eWFF57GsK5SQta8B
 Dir1wJDnbTac9IEKnON0UAQ8w8p9vlEHJyeBPKvcHlVV3IaB3AIzoDQb+CACExEKDFB/pQUMF0
 TNM=
X-SBRS: 2.7
X-MesageID: 12824495
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,468,1574139600"; d="scan'208";a="12824495"
Date: Fri, 21 Feb 2020 15:26:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200221142635.GA4679@Air-de-Roger>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDI6MzY6NTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDIuMjAyMCAxMDoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90
ZToKPiA+PiBIaSwKPiA+Pgo+ID4+IE9uIDIwLzAyLzIwMjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25u
ZSB3cm90ZToKPiA+Pj4gQWxsb3cgYSBDUFUgYWxyZWFkeSBob2xkaW5nIHRoZSBsb2NrIGluIHdy
aXRlIG1vZGUgdG8gYWxzbyBsb2NrIGl0IGluCj4gPj4+IHJlYWQgbW9kZS4gVGhlcmUncyBubyBo
YXJtIGluIGFsbG93aW5nIHJlYWQgbG9ja2luZyBhIHJ3bG9jayB0aGF0J3MKPiA+Pj4gYWxyZWFk
eSBvd25lZCBieSB0aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBz
dWNoCj4gPj4+IGFjY2Vzc2VzIGlzIHJlcXVpcmVkIGF0IGxlYXN0IGZvciB0aGUgQ1BVIG1hcHMg
dXNlLWNhc2UuCj4gPj4+Cj4gPj4+IEluIG9yZGVyIHRvIGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMg
b2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvIHN1cHBvcnQKPiA+Pj4gdXAgdG8gMTYzODQgQ1BV
cy4gQWxzbyByZWR1Y2UgdGhlIHdyaXRlIGxvY2sgbWFzayB0byAyIGJpdHM6IG9uZSB0bwo+ID4+
PiBzaWduYWwgdGhlcmUgYXJlIHBlbmRpbmcgd3JpdGVycyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFu
ZCB0aGUgb3RoZXIgdG8KPiA+Pj4gc2lnbmFsIHRoZSBsb2NrIGlzIG93bmVkIGluIHdyaXRlIG1v
ZGUuIE5vdGUgdGhlIHdyaXRlIHJlbGF0ZWQgZGF0YQo+ID4+PiBpcyB1c2luZyAxNmJpdHMsIHRo
aXMgaXMgZG9uZSBpbiBvcmRlciB0byBiZSBhYmxlIHRvIGNsZWFyIGl0IChhbmQKPiA+Pj4gdGh1
cyByZWxlYXNlIHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0IGF0b21pYyB3cml0ZS4KPiA+Pj4KPiA+
Pj4gVGhpcyByZWR1Y2VzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBjb25jdXJyZW50IHJlYWRlcnMg
ZnJvbSAxNjc3NzIxNiB0bwo+ID4+PiA2NTUzNiwgSSB0aGluayB0aGlzIHNob3VsZCBzdGlsbCBi
ZSBlbm91Z2gsIG9yIGVsc2UgdGhlIGxvY2sgZmllbGQKPiA+Pj4gY2FuIGJlIGV4cGFuZGVkIGZy
b20gMzIgdG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBvcnQgYXRvbWljCj4gPj4+
IG9wZXJhdGlvbnMgb24gNjRiaXQgaW50ZWdlcnMuCj4gPj4KPiA+PiBGV0lXLCBhcm0zMiBpcyBh
YmxlIHRvIHN1cHBvcnQgYXRvbWljIG9wZXJhdGlvbnMgb24gNjQtYml0IGludGVnZXJzLgo+ID4+
Cj4gPj4+ICAgc3RhdGljIGlubGluZSB2b2lkIF93cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2sp
Cj4gPj4+ICAgewo+ID4+PiAtICAgIC8qCj4gPj4+IC0gICAgICogSWYgdGhlIHdyaXRlciBmaWVs
ZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+ID4+PiAtICAgICAqIE90
aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0byBjbGVhciBpdC4K
PiA+Pj4gLSAgICAgKi8KPiA+Pj4gLSAgICBhdG9taWNfc3ViKF9RV19MT0NLRUQsICZsb2NrLT5j
bnRzKTsKPiA+Pj4gKyAgICAvKiBTaW5jZSB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQg
Y2FuIGJlIGNsZWFyZWQgZGlyZWN0bHkuICovCj4gPj4+ICsgICAgQVNTRVJUKF9pc193cml0ZV9s
b2NrZWRfYnlfbWUoYXRvbWljX3JlYWQoJmxvY2stPmNudHMpKSk7Cj4gPj4+ICsgICAgQlVJTERf
QlVHX09OKF9RUl9TSElGVCAhPSAxNik7Cj4gPj4+ICsgICAgd3JpdGVfYXRvbWljKCh1aW50MTZf
dCAqKSZsb2NrLT5jbnRzLCAwKTsKPiA+Pgo+ID4+IEkgdGhpbmsgdGhpcyBpcyBhbiBhYnVzZSB0
byBjYXN0IGFuIGF0b21pY190KCkgZGlyZWN0bHkgaW50byBhIHVpbnQxNl90LiBZb3UKPiA+PiB3
b3VsZCBhdCBsZWFzdCB3YW50IHRvIHVzZSAmbG9jay0+Y250cy5jb3VudGVyIGhlcmUuCj4gPiAK
PiA+IFN1cmUsIEkgd2FzIHdvbmRlcmluZyBhYm91dCB0aGlzIG15c2VsZi4KPiA+IAo+ID4gV2ls
bCB3YWl0IGZvciBtb3JlIGNvbW1lbnRzLCBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgY2FuIGJlIGZp
eGVkIHVwb24KPiA+IGNvbW1pdCBpZiB0aGVyZSBhcmUgbm8gb3RoZXIgaXNzdWVzLgo+IAo+IEl0
J3MgbW9yZSB0aGFuIGp1c3QgYWRkaW5nIGFub3RoZXIgZmllbGQgc3BlY2lmaWVyIGhlcmUuIEEg
Y2FzdCBsaWtlCj4gdGhpcyBvbmUgaXMgZW5kaWFubmVzcy11bnNhZmUsIGFuZCBoZW5jZSBhIHRy
YXAgd2FpdGluZyBmb3IgYSBiaWcKPiBlbmRpYW4gcG9ydCBhdHRlbXB0IHRvIGZhbGwgaW50by4g
QXQgdGhlIHZlcnkgbGVhc3QgdGhpcyBzaG91bGQgY2F1c2UKPiBhIGJ1aWxkIGZhaWx1cmUgb24g
YmlnIGVuZGlhbiBzeXN0ZW1zLCBldmVuIGJldHRlciB3b3VsZCBiZSBpZiBpdCB3YXMKPiBlbmRp
YW5uZXNzLXNhZmUuCgpXaHkgZG9uJ3Qgd2UgbGVhdmUgdGhlIGF0b21pY19kZWMgdGhlbj8KClRo
ZSBBU1NFUlQgSSd2ZSBhZGRlZCBjYW4gYmUgdHVybmVkIGludG8gYSBCVUdfT04sIGFuZCB0aGF0
J3MgbGlrZWx5CmV2ZW4gc2FmZXIgdGhhbiB3aGF0IHdlIGN1cnJlbnRseSBoYXZlLgoKVGhhbmtz
LCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
