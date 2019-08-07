Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C675A84615
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 09:38:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvGUB-0004Oc-4F; Wed, 07 Aug 2019 07:35:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvGU9-0004OX-D8
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 07:35:49 +0000
X-Inumbo-ID: f8d7b9f0-b8e5-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f8d7b9f0-b8e5-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 07:35:47 +0000 (UTC)
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
IronPort-SDR: isIgU9z/uxAYrY71uRnrnMD2FWMrHD3WwUN+4P2ZB4sSYxuuDJdQM97KE8rxagLqEP4qA4o1Or
 yuYKL94+08cJ4RQeYf/K7PqIau9KGfD3QqQQumXDiYj61+JxVzIrtZ4BeBSxXY7fMxBkG/G0DN
 ONBCuHty/vXoshAX9ncdlwbM5DDk4jQybJQ26PPNGACW50LO9+EVMLGtC4/5MOxsZ1eT5DPROu
 e1Sik61wdCSsxowm2vTw+0Ru2SrZKljor3cZJgpkDOFyuHmAgRKJSKDEfBUQffqFygfRzVRr4M
 mA4=
X-SBRS: 2.7
X-MesageID: 4094051
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,356,1559534400"; 
   d="scan'208";a="4094051"
Date: Wed, 7 Aug 2019 09:35:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190807073534.7uoqo7q7gno2ljyl@Air-de-Roger>
References: <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
 <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
 <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
 <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
 <CAMmSBy9ZiEU95yAK1ry_41GR0ttWTX9EEJ0bMStZaK=PrzCH7w@mail.gmail.com>
 <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
 <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
 <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDI6NDg6NTFQTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBPbiBUdWUsIEF1ZyA2LCAyMDE5IGF0IDk6MTggQU0gUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDEwOjA1OjQwQU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+IE9u
IFRodSwgQXVnIDAxLCAyMDE5IGF0IDExOjI1OjA0QU0gLTA3MDAsIFJvbWFuIFNoYXBvc2huaWsg
d3JvdGU6Cj4gPiA+ID4gVGhpcyBwYXRjaCBjb21wbGV0ZWx5IGZpeGVzIHRoZSBwcm9ibGVtIGZv
ciBtZSEKPiA+ID4gPgo+ID4gPiA+IFRoYW5rcyBSb2dlciEgSSdkIGxvdmUgdG8gc2VlIHRoaXMg
aW4gWGVuIDQuMTMKPiA+ID4KPiA+ID4gVGhhbmtzIGZvciB0ZXN0aW5nIQo+ID4gPgo+ID4gPiBJ
dCdzIHN0aWxsIG5vdCBjbGVhciB0byBtZSB3aHkgdGhlIHByZXZpb3VzIGFwcHJvYWNoIGRpZG4n
dCB3b3JrLCBidXQKPiA+ID4gSSB0aGluayB0aGlzIHBhdGNoIGlzIGJldHRlciBiZWNhdXNlIGl0
IHJlbW92ZXMgdGhlIHVzYWdlIG9mCj4gPiA+IHtzZXQvY2xlYXJ9X2lkZW50aXR5X3AybV9lbnRy
eSBmcm9tIFBWIGRvbWFpbnMuIEkgd2lsbCBzdWJtaXQgdGhpcwo+ID4gPiBmb3JtYWxseSBub3cu
Cj4gPgo+ID4gU29ycnkgdG8gYm90aGVyIGFnYWluLCBidXQgc2luY2Ugd2Ugc3RpbGwgZG9uJ3Qg
dW5kZXJzdGFuZCB3aHkgdGhlCj4gPiBwcmV2aW91cyBmaXggZGlkbid0IHdvcmsgZm9yIHlvdSwg
YW5kIEkgY2FuJ3QgcmVwcm9kdWNlIHRoaXMgd2l0aCBteQo+ID4gaGFyZHdhcmUsIGNvdWxkIHlv
dSBnaXZlIHRoZSBhdHRhY2hlZCBwYXRjaCBhIHRyeT8KPiAKPiBObyB3b3JyaWVzIC0tIGFuZCB0
aGFua3MgZm9yIGhlbHBpbmcgdG8gZ2V0IGl0IG92ZXIgdGhlIGZpbmlzaCBsaW5lIC0tCj4gdGhp
cyBpcyBtdWNoIGFwcHJlY2lhdGVkIQo+IAo+IEknbSBoYXBweSB0byBzYXkgdGhhdCB0aGlzIGxh
dGVzdCBwYXRjaCBpcyBhbHNvIHdvcmtpbmcganVzdCBmaW5lLiBTbwo+IEkgZ3Vlc3MgdGhpcyBp
cyB0aGUgb25lIHRoYXQncyBnb2luZyB0byBsYW5kIGluIFhlbiA0LjEzPwoKTm8sIG5vdCByZWFs
bHksIHNvcnJ5IHRoaXMgd2FzIHN0aWxsIGEgZGVidWcgcGF0Y2guCgpTbyBJIHRoaW5rIHRoZSBi
ZWhhdmlvdXIgeW91IGFyZSBzZWVpbmcgY2FuIG9ubHkgYmUgZXhwbGFpbmVkIGlmIHRoZQpJT01N
VSBpcyBhbHJlYWR5IGVuYWJsZWQgYnkgdGhlIGZpcm13YXJlIHdoZW4gYm9vdGluZyBpbnRvIFhl
biwgY2FuCnRoaXMgYmUgdGhlIGNhc2U/CgpJIGhhdmUgYSBwYXRjaCBJIHdvdWxkIGxpa2UgeW91
IHRvIHRyeSB0byBjb25maXJtIHRoaXMsIGNhbiB5b3UgcGxlYXNlCmdpdmUgaXQgYSBzcGluIGFu
ZCByZXBvcnQgYmFjayAoaWRlYWxseSB3aXRoIHRoZSBYZW4gYm9vdCBsb2cpLgoKVGhhbmtzLCBS
b2dlci4KLS0tODwtLS0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9h
cmNoL3g4Ni9tbS9wMm0uYwppbmRleCBmZWY5N2M4MmY2Li4zNjA1NjE0YWFmIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC0x
MzQxLDcgKzEzNDEsNyBAQCBpbnQgc2V0X2lkZW50aXR5X3AybV9lbnRyeShzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBsb25nIGdmbl9sLAogCiAgICAgaWYgKCAhcGFnaW5nX21vZGVfdHJhbnNs
YXRlKHAybS0+ZG9tYWluKSApCiAgICAgewotICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5
bmMoZCkgKQorICAgICAgICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQogICAgICAgICAgICAgcmV0
dXJuIDA7CiAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfbWFwKGQsIF9kZm4oZ2ZuX2wpLCBf
bWZuKGdmbl9sKSwgUEFHRV9PUkRFUl80SywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgSU9NTVVGX3JlYWRhYmxlIHwgSU9NTVVGX3dyaXRhYmxlKTsKQEAgLTE0MzIsNyArMTQzMiw3
IEBAIGludCBjbGVhcl9pZGVudGl0eV9wMm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgbG9uZyBnZm5fbCkKIAogICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApCiAg
ICAgewotICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQorICAgICAgICBpZiAo
ICFoYXNfaW9tbXVfcHQoZCkgKQogICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgIHJldHVy
biBpb21tdV9sZWdhY3lfdW5tYXAoZCwgX2RmbihnZm5fbCksIFBBR0VfT1JERVJfNEspOwogICAg
IH0KZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKaW5kZXggNWQ3MjI3MGM1Yi4uOWRkMGVk
N2Y2MyAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKQEAgLTIzMTYsNiArMjMxNiw5
IEBAIHN0YXRpYyBpbnQgX19pbml0IHZ0ZF9zZXR1cCh2b2lkKQogICAgICAqLwogICAgIGZvcl9l
YWNoX2RyaGRfdW5pdCAoIGRyaGQgKQogICAgIHsKKyAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFn
czsKKyAgICAgICAgdWludDMyX3QgdmFsOworCiAgICAgICAgIGlvbW11ID0gZHJoZC0+aW9tbXU7
CiAKICAgICAgICAgcHJpbnRrKCJJbnRlbCBWVC1kIGlvbW11ICUiUFJJdTMyIiBzdXBwb3J0ZWQg
cGFnZSBzaXplczogNGtCIiwKQEAgLTIzNTEsNiArMjM1NCwyMiBAQCBzdGF0aWMgaW50IF9faW5p
dCB2dGRfc2V0dXAodm9pZCkKICAgICAgICAgaWYgKCAhdnRkX2VwdF9wYWdlX2NvbXBhdGlibGUo
aW9tbXUpICkKICAgICAgICAgICAgIGlvbW11X2hhcF9wdF9zaGFyZSA9IDA7CiAKKyAgICAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJmlvbW11LT5yZWdpc3Rlcl9sb2NrLCBmbGFncyk7CisgICAgICAg
IHZhbCA9IGRtYXJfcmVhZGwoaW9tbXUtPnJlZywgRE1BUl9HU1RTX1JFRyk7CisgICAgICAgIC8q
CisgICAgICAgICAqIFRPRE86IG5lZWRzIHRvIGJlIHJldmlzaXRlZCBvbmNlIFhlbiBzdXBwb3J0
cyBib290aW5nIHdpdGggYW4KKyAgICAgICAgICogYWxyZWFkeSBlbmFibGVkIElPTU1VLgorICAg
ICAgICAgKi8KKyAgICAgICAgaWYgKCB2YWwgJiBETUFfR1NUU19URVMgKQorICAgICAgICB7Cisg
ICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgVlREUFJFRklYCisgICAgICAgICAgICAg
ICAgICAgIklPTU1VOiBETUEgcmVtYXBwaW5nIGFscmVhZHkgZW5hYmxlZCwgZGlzYWJsaW5nIGl0
XG4iKTsKKyAgICAgICAgICAgIGRtYXJfd3JpdGVsKGlvbW11LT5yZWcsIERNQVJfR0NNRF9SRUcs
IHZhbCAmIH5ETUFfR0NNRF9URSk7CisgICAgICAgICAgICBJT01NVV9XQUlUX09QKGlvbW11LCBE
TUFSX0dTVFNfUkVHLCBkbWFyX3JlYWRsLAorICAgICAgICAgICAgICAgICAgICAgICAgICAhKHZh
bCAmIERNQV9HU1RTX1RFUyksIHZhbCk7CisgICAgICAgIH0KKyAgICAgICAgc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmaW9tbXUtPnJlZ2lzdGVyX2xvY2ssIGZsYWdzKTsKKwogICAgICAgICByZXQg
PSBpb21tdV9zZXRfaW50ZXJydXB0KGRyaGQpOwogICAgICAgICBpZiAoIHJldCApCiAgICAgICAg
IHsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
