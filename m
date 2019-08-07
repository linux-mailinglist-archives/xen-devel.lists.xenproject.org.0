Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B4D84905
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:00:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvIhJ-0001P3-Km; Wed, 07 Aug 2019 09:57:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvIhH-0001Ow-U3
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 09:57:31 +0000
X-Inumbo-ID: c313a8ba-b8f9-11e9-91d9-9b73830fa6e6
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c313a8ba-b8f9-11e9-91d9-9b73830fa6e6;
 Wed, 07 Aug 2019 09:57:27 +0000 (UTC)
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
IronPort-SDR: dCANT7EAsL2Vp2vz0mPkFkkXzHsMpsU3vYtGM+tqU4aIvaC/HIVERcJNdjbZPeOrQFPe2KQQh1
 T+H9CWZ1moGVcCo7R5vaY3anoRV4m2f3BSYA2DE3/VryHKK7ABdAQsmNZmVxyLzYcxag/PPsC2
 f3y2sRjFxxk5f7qoLzTwmwB3/evVfxLadFZT+FbrafMA34sSwSWiGMQlams2aC1tsVcGJf7PyE
 ++7Yi2ZmWLC4E1+xGxNhbt056KBXxinPpTyjHxDV7jNNN5kjMvHatlvQUujXCDpJRMaVwJwid4
 +XY=
X-SBRS: 2.7
X-MesageID: 4125078
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4125078"
Date: Wed, 7 Aug 2019 11:57:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190807095701.exld4hnidz6hmgll@Air-de-Roger>
References: <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
 <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
 <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
 <CAMmSBy9ZiEU95yAK1ry_41GR0ttWTX9EEJ0bMStZaK=PrzCH7w@mail.gmail.com>
 <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
 <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
 <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
 <999aabe3-7406-9ad9-fb85-432c29352a77@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <999aabe3-7406-9ad9-fb85-432c29352a77@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roman Shaposhnik <roman@zededa.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDk6MDg6NThBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDYuMDguMjAxOSAyMzo0OCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiA+IE9u
IFR1ZSwgQXVnIDYsIDIwMTkgYXQgOToxOCBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+IAo+ID4gPiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAx
MDowNTo0MEFNICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwg
QXVnIDAxLCAyMDE5IGF0IDExOjI1OjA0QU0gLTA3MDAsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6
Cj4gPiA+ID4gPiBUaGlzIHBhdGNoIGNvbXBsZXRlbHkgZml4ZXMgdGhlIHByb2JsZW0gZm9yIG1l
IQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGFua3MgUm9nZXIhIEknZCBsb3ZlIHRvIHNlZSB0aGlz
IGluIFhlbiA0LjEzCj4gPiA+ID4gCj4gPiA+ID4gVGhhbmtzIGZvciB0ZXN0aW5nIQo+ID4gPiA+
IAo+ID4gPiA+IEl0J3Mgc3RpbGwgbm90IGNsZWFyIHRvIG1lIHdoeSB0aGUgcHJldmlvdXMgYXBw
cm9hY2ggZGlkbid0IHdvcmssIGJ1dAo+ID4gPiA+IEkgdGhpbmsgdGhpcyBwYXRjaCBpcyBiZXR0
ZXIgYmVjYXVzZSBpdCByZW1vdmVzIHRoZSB1c2FnZSBvZgo+ID4gPiA+IHtzZXQvY2xlYXJ9X2lk
ZW50aXR5X3AybV9lbnRyeSBmcm9tIFBWIGRvbWFpbnMuIEkgd2lsbCBzdWJtaXQgdGhpcwo+ID4g
PiA+IGZvcm1hbGx5IG5vdy4KPiA+ID4gCj4gPiA+IFNvcnJ5IHRvIGJvdGhlciBhZ2FpbiwgYnV0
IHNpbmNlIHdlIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoZQo+ID4gPiBwcmV2aW91cyBm
aXggZGlkbid0IHdvcmsgZm9yIHlvdSwgYW5kIEkgY2FuJ3QgcmVwcm9kdWNlIHRoaXMgd2l0aCBt
eQo+ID4gPiBoYXJkd2FyZSwgY291bGQgeW91IGdpdmUgdGhlIGF0dGFjaGVkIHBhdGNoIGEgdHJ5
Pwo+ID4gCj4gPiBObyB3b3JyaWVzIC0tIGFuZCB0aGFua3MgZm9yIGhlbHBpbmcgdG8gZ2V0IGl0
IG92ZXIgdGhlIGZpbmlzaCBsaW5lIC0tCj4gPiB0aGlzIGlzIG11Y2ggYXBwcmVjaWF0ZWQhCj4g
PiAKPiA+IEknbSBoYXBweSB0byBzYXkgdGhhdCB0aGlzIGxhdGVzdCBwYXRjaCBpcyBhbHNvIHdv
cmtpbmcganVzdCBmaW5lLiBTbwo+ID4gSSBndWVzcyB0aGlzIGlzIHRoZSBvbmUgdGhhdCdzIGdv
aW5nIHRvIGxhbmQgaW4gWGVuIDQuMTM/Cj4gCj4gTm90IG5lY2Vzc2FyaWx5IC0gdGhlIG90aGVy
IHBhdGNoIGlzIGFsc28gYSBjYW5kaWRhdGUsIGJ1dCBpdHMKPiBkZXNjcmlwdGlvbiB3b3VsZCBu
ZWVkIHRvIGV4cGxhaW4gd2hhdCB3YXMgYWN0dWFsbHkgd3JvbmcuCj4gCj4gPiA+IEFGQUlDVCB0
aGUgb25seSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG5vbi13b3JraW5nIHZlcnNpb24gYW5kIHRo
ZQo+ID4gPiB3b3JraW5nIHZlcnNpb24gaXMgdGhlIGZsdXNoLCBzbyBJJ3ZlIGFkZGVkIGl0IGhl
cmUuCj4gCj4gTm93IEknbSBhZnJhaWQgSSBzdGlsbCBjYW4ndCBkcmF3IGEgaGVscGZ1bCBjb25j
bHVzaW9uIGZyb20gUm9tYW4ncwo+IHN1Y2Nlc3NmdWwgdGVzdDogaW50ZWxfaW9tbXVfaHdkb21f
aW5pdCgpLCBhZnRlciBoYXZpbmcgY2FsbGVkCj4gc2V0dXBfaHdkb21fcm1ycigpLCBjYWxscyBp
b21tdV9mbHVzaF9hbGwoKSAod2l0aCBvbmUgb3RoZXIsCj4gc2VlbWluZ2x5IGlubm9jZW50IGNh
bGwgaW4gYmV0d2VlbikuIFRoZSBvbmx5IGNvbmNsdXNpb24gSSBfY291bGRfCj4gZHJhdyBpcyB0
aGF0IGlvbW11X2ZsdXNoX2FsbCgpIGRvZXNuJ3QgZG8gd2hhdCBpdHMgbmFtZSBzYXlzLiBXaGlj
aAo+IHdvdWxkIGJlIHF1aXRlIGJhZC4gQnV0Cj4gCj4gW29yaWddCj4gaW9tbXVfZmx1c2hfYWxs
KCkKPiAtPiBpb21tdV9mbHVzaF9pb3RsYl9nbG9iYWwoZmx1c2hfbm9uX3ByZXNlbnRfZW50cnk9
MCkKPiAtPiBmbHVzaC0+aW90bGIoRE1BX1RMQl9HTE9CQUxfRkxVU0gsIGZsdXNoX25vbl9wcmVz
ZW50X2VudHJ5PTApCj4gCj4gW3BhdGNoXQo+IGlvbW11X2ZsdXNoX2lvdGxiX2FsbCgpCj4gLT4g
aW9tbXVfZmx1c2hfaW90bGIoZG1hX29sZF9wdGVfcHJlc2VudD0wLCBwYWdlX2NvdW50PTApCj4g
LT4gaW9tbXVfZmx1c2hfaW90bGJfZHNpKGZsdXNoX25vbl9wcmVzZW50X2VudHJ5PTApCj4gLT4g
Zmx1c2gtPmlvdGxiKERNQV9UTEJfRFNJX0ZMVVNILCBmbHVzaF9ub25fcHJlc2VudF9lbnRyeT0w
KQo+IAo+IHN1Z2dlc3RzIHRvIG1lIHRoYXQgKGFzIG9uZSB3b3VsZCBpbmZlciBmcm9tIHRoZSBu
YW1lcykgaXMgdGhlCj4gbW9yZSB0aHJvdWdoIGZsdXNoLiBJIG11c3QgYmUgb3Zlcmxvb2tpbmcg
c29tZXRoaW5nIC4uLgoKSSB3ZW50IG92ZXIgdGhlIGlvdGxiIHF1ZXVlZCBpbnZhbGlkYXRpb24g
Y29kZSBhbmQgaXQgc2VlbXMgZmluZSB0bwptZSwgSSBoYXZlbid0IGJlZW4gYWJsZSB0byBzcG90
IGFueSBpc3N1ZXMgd2l0aCBpdCwgYW5kIGFzIHlvdSBzYXkKYWJvdmUgdGhlIG9ubHkgZGlmZmVy
ZW5jZSBpcyB0aGUgZmx1c2ggdHlwZSAoRFNJIHZzIEdMT0JBTCkuCgpBZ2FpbiBhbmQganVzdCB0
byBtYWtlIHN1cmUgaXQncyBhY3R1YWxseSB0aGUgZmx1c2ggdHlwZSAoYW5kIG5vdGhpbmcKaW4g
YmV0d2VlbikgdGhlIGZhY3RvciB0aGF0IG1ha2VzIHRoaXMgd29yayBvciBicmVhaywgY2FuIHlv
dSB0cnkgdGhlCmFib3ZlIHBhdGNoPwoKVGhhbmtzLCBSb2dlci4KLS0tODwtLS0KZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCBm
ZWY5N2M4MmY2Li4zNjA1NjE0YWFmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMK
KysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC0xMzQxLDcgKzEzNDEsNyBAQCBpbnQgc2V0
X2lkZW50aXR5X3AybV9lbnRyeShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbl9s
LAogCiAgICAgaWYgKCAhcGFnaW5nX21vZGVfdHJhbnNsYXRlKHAybS0+ZG9tYWluKSApCiAgICAg
ewotICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQorICAgICAgICBpZiAoICFo
YXNfaW9tbXVfcHQoZCkgKQogICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgIHJldHVybiBp
b21tdV9sZWdhY3lfbWFwKGQsIF9kZm4oZ2ZuX2wpLCBfbWZuKGdmbl9sKSwgUEFHRV9PUkRFUl80
SywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVGX3JlYWRhYmxlIHwgSU9N
TVVGX3dyaXRhYmxlKTsKQEAgLTE0MzIsNyArMTQzMiw3IEBAIGludCBjbGVhcl9pZGVudGl0eV9w
Mm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm5fbCkKIAogICAgIGlm
ICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApCiAgICAgewotICAgICAgICBpZiAoICFuZWVk
X2lvbW11X3B0X3N5bmMoZCkgKQorICAgICAgICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQogICAg
ICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfdW5tYXAoZCwg
X2RmbihnZm5fbCksIFBBR0VfT1JERVJfNEspOwogICAgIH0KZGlmZiAtLWdpdCBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2lvbW11LmMKaW5kZXggNWQ3MjI3MGM1Yi4uODg1MTg1YWQwOSAxMDA2NDQKLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmMKQEAgLTIwMjYsNyArMjAyNiw3IEBAIHN0YXRpYyBpbnQgcm1ycl9pZGVu
dGl0eV9tYXBwaW5nKHN0cnVjdCBkb21haW4gKmQsIGJvb2xfdCBtYXAsCiAgICAgbXJtcnItPmNv
dW50ID0gMTsKICAgICBsaXN0X2FkZF90YWlsKCZtcm1yci0+bGlzdCwgJmhkLT5hcmNoLm1hcHBl
ZF9ybXJycyk7CiAKLSAgICByZXR1cm4gMDsKKyAgICByZXR1cm4gaW9tbXVfZmx1c2hfYWxsKCk7
CiB9CiAKIHN0YXRpYyBpbnQgaW50ZWxfaW9tbXVfYWRkX2RldmljZSh1OCBkZXZmbiwgc3RydWN0
IHBjaV9kZXYgKnBkZXYpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
