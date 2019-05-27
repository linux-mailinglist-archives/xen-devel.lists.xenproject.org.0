Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE952B77F
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 16:28:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVGZ4-0001xp-81; Mon, 27 May 2019 14:25:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVGZ2-0001xk-TW
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 14:25:24 +0000
X-Inumbo-ID: 431a74fc-808b-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 431a74fc-808b-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 14:25:22 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 0qqMFtuiXFTFmDD9gCHMiJdaFV6Epe05anyWgEuqmbhLbpjgenHqTdexDBUXoJ1ZZ4CwQs7/q8
 pA2L4SJpX5wrtxTuC5nNJW/W9mLUhQq5N/LkiNcZH6BIY64k/5Ei1O0XE6lD6UbzT4fyMrTB6W
 uH4hFqSrpC/p5FG5y0wTrvRhILgZJfAyYkVNrRFPCeaFnIcbqjkXgFd0lQ+8hMqNVi+aZD+pN7
 k4Ju9bUUWBE2MR4FysUL30QcRLYZK2lWE9D0QOyrU3Oxmn7qv8zXcMZEzct8ey6kO5vdQHDmYl
 erg=
X-SBRS: 2.7
X-MesageID: 928906
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,519,1549947600"; 
   d="scan'208";a="928906"
Date: Mon, 27 May 2019 16:25:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190527142509.kjbilbhqkx5vwv7n@Air-de-Roger>
References: <20190522164530.33147-1-roger.pau@citrix.com>
 <5CE66AC302000078002319E6@prv1-mh.provo.novell.com>
 <20190527123941.nqzuyv6jqxk25hsj@Air-de-Roger>
 <5CEBE2EF0200007800232C94@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CEBE2EF0200007800232C94@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] x86: fix alternative_callN usage of
 ALTERNATIVE asm macro
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDc6MTU6MjdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI3LjA1LjE5IGF0IDE0OjM5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDM6NDE6MjNBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDIyLjA1LjE5IGF0IDE4OjQ1LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gYWx0ZXJuYXRpdmVfY2FsbE4gdXNpbmcgaW5saW5lIGFz
c2VtYmx5IHRvIGdlbmVyYXRlIHRoZSBhbHRlcm5hdGl2ZQo+ID4+ID4gcGF0Y2ggc2l0ZXMgc2hv
dWxkIGJlIHVzaW5nIHRoZSBBTFRFUk5BVElWRSBDIHByZXByb2Nlc3NvciBtYWNybwo+ID4+ID4g
cmF0aGVyIHRoYW4gdGhlIEFMVEVSTkFUSVZFIGFzc2VtYmx5IG1hY3JvLAo+ID4+IAo+ID4+IFdo
eT8gU2VlIElORElSRUNUX3tDQUxMLEpNUH0uIE15IGdvYWwsIGFzIHNhaWQgb24gaXJjLCB3b3Vs
ZCBiZQo+ID4+IHRvIGV2ZW50dWFsbHkgZWxpbWluYXRlIHRoZSByZWR1bmRhbnQgQyBtYWNyb3Ms
IGluIGZhdm9yIG9mIGp1c3QgdXNpbmcKPiA+PiB0aGUgYXNzZW1ibGVyIG9uZXMuCj4gPiAKPiA+
IFVzaW5nIHRoZSBjdXJyZW50IGFzc2VtYmx5IG1hY3JvcyBmb3IgaW5saW5lIGFzbSBhbHRlcm5h
dGl2ZXMgd291bGQKPiA+IHJlZ3Jlc3MgdGhlIGJ1aWxkIG9uIGxsdm0gYmFzZWQgdG9vbGNoYWlu
cy4gSWYgdGhhdCdzIGluZGVlZCB0aGUgcGF0aAo+ID4gZm9yd2FyZCBJIHdpbGwgaGF2ZSB0byBs
b29rIGludG8gbWFraW5nIHRob3NlIHdvcmsgaW4gaW5saW5lIGFzc2VtYmx5Cj4gPiBpbnN0YW5j
ZXMuCj4gCj4gV2VsbCwgSSdtIG9wZW4gdG8gYXJndW1lbnRzIHRvIHRoZSBjb250cmFyeSAoaS5l
LiBzdXBwb3J0aW5nIHRoZQo+IGN1cnJlbnQgcmVkdW5kYW5jeSkuCgpJSVJDIEFuZHJldyB0b2xk
IG1lIHRoZXJlIHdoZXJlIGFsc28gaXNzdWVzIHdpdGggdXNpbmcgdGhlIGN1cnJlbnQgYXNtCm1h
Y3JvcyB3aXRoIEdOVSBiYXNlZCB0b29sY2hhaW5zLCBhbGJlaXQgSSBkb24ndCBoYXZlIGFueSBz
cGVjaWZpYwpkYXRhIG9mIHdoYXQgdGhlIGlzc3VlcyBhY3R1YWxseSBhcmUuCgo+ID4+IFdpdGhv
dXQgY2xhbmcgZml4ZWQsIGFuZCB3aXRoIHVzIHdhbnRpbmcKPiA+PiB0byBiZSBhYmxlIHRvIGNv
bnRpbnVlIHRvIGJ1aWxkIHdpdGggY2xhbmcsIHRoaXMgdGhlbiB2b2lkcyB0aGUgZW50aXJlCj4g
Pj4gcHVycG9zZSBvZiBmODUwNjE5NjkyICgieDg2L2FsdGVybmF0aXZlczogYWxsb3cgdXNpbmcg
YXNzZW1ibGVyCj4gPj4gbWFjcm9zIGluIGZhdm9yIG9mIEMgb25lcyIpLCB3aGljaCBpcmMgd2Fz
IG9yaWdpbmFsbHkgcGFydCBvZiB0aGUKPiA+PiBzZXJpZXMsIGJ1dCB3ZW50IGluIG11Y2ggYWhl
YWQgb2YgaXQuCj4gPiAKPiA+IEkgY2FuIGxvb2sgaW50byB3b3JrYXJvdW5kcyB0byB0aGlzLCB0
aGUgb25lIHRoYXQgY29tZXMgdG8gbWluZCBpcwo+ID4gdXNpbmcgLmFsdG1hY3JvIGFuZCBMT0NB
TCBpbiBvcmRlciB0byBjcmVhdGUgdW5pcXVlIGxhYmVscyBpbiB0aGUKPiA+IG1hY3JvLiBJIGNh
biB0ZXN0IGlmIHN1Y2ggYXBwcm9hY2ggd291bGQgd29yayBpZiB0aGUgcGxhbiBpcyB0byBvbmx5
Cj4gPiByZWx5IG9uIHRoZSBhc3NlbWJseSBhbHRlcm5hdGl2ZSBjb2RlLgo+IAo+IEknbSBzdXJw
cmlzZWQgdGhleSBzdXBwb3J0IC5hbHRtYWNyby4KCi5hbHRtYWNybyBpcyBzdXBwb3J0ZWQgYnkg
bGx2bSwgYnV0IGl0J3Mgc3RpbGwgbWlzc2luZyB0aGUgTE9DQUwKZGlyZWN0aXZlLCBzbyBteSBz
dWdnZXN0aW9uIGluIHRoZSBwcmV2aW91cyBlbWFpbCBpcyBhIG5vLWdvLgoKPiBJIHdvbmRlciB3
aGV0aGVyLCBhcyBhbgo+IGFsdGVybmF0aXZlLCB0aGVyZSB3b3VsZG4ndCBiZSBhIHdheSB0byBz
dWJzdGl0dXRlIHRoZSAoYXNzc2VtYmxlcgo+IGV4cGFuZWQpIFxAIGZvciB0aGUgKGNvbXBpbGVy
IGV4cGFuZGVkKSAlPSB3aGVuIHVzaW5nIHRoZQo+IG1hY3JvcyBmcm9tIGFzbSgpLgoKTWF5YmUu
IFRCSCBJIGRvbid0IHNlZSBhbiBvYnZpb3VzIHdheSB0byBkbyB0aGlzIEFUTS4gVGhlIGFsdGVy
bmF0aXZlCmFzbSBtYWNyb3MgYXJlIGluY2x1ZGVkIHVzaW5nIGFuIGlubGluZSBhc3NlbWJseSAu
aW5jbHVkZSBkaXJlY3RpdmUsCndoaWNoIG1lYW5zIHRoZSBmaWxlIGRvZXNuJ3QgZ28gdGhyb3Vn
aCB0aGUgcHJlcHJvY2Vzc29yLCBsZWF2aW5nIGxlc3MKcm9vbSB0byBwZXJmb3JtIHN1Y2ggc3Vi
c3RpdHV0aW9ucy4KCj4gPj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2FsdGVybmF0aXZl
LmgKPiA+PiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYWx0ZXJuYXRpdmUuaAo+ID4+ID4g
QEAgLTIwMiw5ICsyMDIsOCBAQCBleHRlcm4gdm9pZCBhbHRlcm5hdGl2ZV9icmFuY2hlcyh2b2lk
KTsKPiA+PiA+ICAgICAgcmV0dHlwZSByZXRfOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ID4+ID4gICAgICByZWdpc3RlciB1bnNpZ25lZCBsb25n
IHIxMF8gYXNtKCJyMTAiKTsgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPj4gPiAgICAgIHJl
Z2lzdGVyIHVuc2lnbmVkIGxvbmcgcjExXyBhc20oInIxMSIpOyAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+PiA+IC0gICAgYXNtIHZvbGF0aWxlIChfX3N0cmluZ2lmeShBTFRFUk5BVElWRSAi
Y2FsbCAqJWNbYWRkcl0oJSVyaXApIiwgXAo+ID4+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJjYWxsIC4iLCAgICAgICAgICAgICAgICBcCj4gPj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWDg2X0ZFQVRVUkVfQUxXQVlT
KSAgICAgIFwKPiA+PiA+ICsgICAgYXNtIHZvbGF0aWxlIChBTFRFUk5BVElWRSgiY2FsbCAqJWNb
YWRkcl0oJSVyaXApIiwgImNhbGwgLiIsICAgXAo+ID4+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFg4Nl9GRUFUVVJFX0FMV0FZUykgICAgICAgICAgICAgICAgICBcCj4gPj4gPiAg
ICAgICAgICAgICAgICAgICAgOiBBTFRfQ0FMTCAjIyBuICMjIF9PVVQsICI9YSIgKHJldF8pLCAg
ICAgICAgICAgIFwKPiA+PiA+ICAgICAgICAgICAgICAgICAgICAgICI9ciIgKHIxMF8pLCAiPXIi
IChyMTFfKSBBU01fQ0FMTF9DT05TVFJBSU5UICAgXAo+ID4+ID4gICAgICAgICAgICAgICAgICAg
IDogW2FkZHJdICJpIiAoJihmdW5jKSksICJnIiAoZnVuYykgICAgICAgICAgICAgICBcCj4gPj4g
Cj4gPj4gT2theSwgbHVja2lseSB0aGUgY29kZSBjaGFuZ2UgaXRzZWxmIGlzIHNpbXBsZSBlbm91
Z2gsIHNvIGl0IHJlYWxseQo+ID4+IHdhc24ndCB0aGF0IEkgaGFkIHRvIHVzZSB0aGUgdmFyaWFu
dCB1c2VkIHRvIG1ha2UgdGhpbmdzIHdvcmsgYXQKPiA+PiBhbGwuCj4gPiAKPiA+IFNpbmNlIHRo
ZSBvbmx5IGNoYW5nZSByZXF1ZXN0ZWQgaXMgcmVsYXRlZCB0byB0aGUgY29tbWl0IG1lc3NhZ2Us
Cj4gPiB3b3VsZCB5b3UgYmUgT0sgdG8gdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSB0bzoKPiA+
IAo+ID4gLS0tODwtLS0KPiA+IHg4NjogcmVtb3ZlIGFsdGVybmF0aXZlX2NhbGxOIHVzYWdlIG9m
IEFMVEVSTkFUSVZFIGFzbSBtYWNybwo+ID4gCj4gPiBhbHRlcm5hdGl2ZV9jYWxsTiB1c2luZyBp
bmxpbmUgYXNzZW1ibHkgdG8gZ2VuZXJhdGUgdGhlIGFsdGVybmF0aXZlCj4gPiBwYXRjaCBzaXRl
cyBzaG91bGQgYmUgdXNpbmcgdGhlIEFMVEVSTkFUSVZFIEMgcHJlcHJvY2Vzc29yIG1hY3JvCj4g
PiByYXRoZXIgdGhhbiB0aGUgQUxURVJOQVRJVkUgYXNzZW1ibHkgbWFjcm8sIHRoZSBtb3JlIHRo
YXQgdXNpbmcgdGhlCj4gPiBhc3NlbWJseSBtYWNybyBpbiBhbiBpbmxpbmUgYXNzZW1ibHkgaW5z
dGFuY2UgdHJpZ2dlcnMgdGhlIGZvbGxvd2luZwo+ID4gYnVnIG9uIGxsdm0gYmFzZWQgdG9vbGNo
YWluczoKPiAKPiBXZWxsLCB0aGlzIHN0aWxsIG1ha2VzIGl0IHNvdW5kIGFzIGlmIHRoZSBpc3N1
ZSB3YXMgYSBzaG9ydGNvbWluZyBvZiB0aGUKPiBjb21taXQgaW4gcXVlc3Rpb24uIEhvdyBhYm91
dCBwdWxsaW5nIHVwIHRoZSBwYXJhZ3JhcGggZnVydGhlciBkb3duCj4gYWhlYWQgb2YgdGhlIHRl
eHQgYWJvdmUsIHNsaWdodGx5IGFkanVzdGVkIHRvCj4gCj4gIlRoZXJlIGlzIGEgYnVnIGluIGxs
dm0gdGhhdCBuZWVkcyB0byBiZSBmaXhlZCBiZWZvcmUgc3dpdGNoaW5nIHRvIHVzZQo+ICB0aGUg
YWx0ZXJuYXRpdmUgYXNzZW1ibHkgbWFjcm9zIGluIGlubGluZSBhc3NlbWJseSBjYWxsIHNpdGVz
LiBUaGVyZWZvcmUKPiAgLi4uIgo+IAo+IChwZXJoYXBzIGFsc28gcmVwbGFjaW5nICJ0aGUgbW9y
ZSIgdGhlbik/CgpZZXMsIEkgd291bGQgcy8sIHRoZSBtb3JlIHRoYXQgdS8uIFUvCgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
