Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8C41170B1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 16:40:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieL5l-0006cQ-UI; Mon, 09 Dec 2019 15:36:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieL5k-0006cL-T6
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 15:36:56 +0000
X-Inumbo-ID: bad87ce6-1a99-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bad87ce6-1a99-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 15:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575905816;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=reqXD3hAZ9s7k/xJF4GqYXtaduo0H8apUscYFKDy/Ck=;
 b=cffjfO86GBGjV/LImG1Pus2bILtn+1vMW2ItUtGrXbDGqqF6TrDj9hDo
 GTd442zNlLR6Y+y0NlthnwWxTqyEuEiVklp8n5DVzLn80+Y6opig0ixVf
 2pElYLkIwme68EjUHr10DoyGRv8QQlsQ3/Nfvz9SChK1zIoc3wlodHi4S g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CABHzvJgdtbzOEjoBJ7rLDZjROJVwkpgIXPTVMG6HWFPrM3b1ht2czXpdRsxPgyFY/YR/kWBBm
 iGQ1/JgtJqeuGMAxufPVHLyuwvDdJ18PT9gx820+nOiCDC0ld/Hh9YHc5e9Kwbj92qty/ohFLe
 W2zJf6uHbDu1/Qjn/+c9UQf0gEGE1LeOdyb5Tpk/Ee62oXdJVAv2SgWI0ZaxfNS4Hoc6wlHBHD
 j08skOb6UztWhziJNNxyIx7vXFZJLRrHUbmmj6YCZQsw5aKfvW3H23VtE/Rc5XW6grM5V+rk3h
 7OQ=
X-SBRS: 2.7
X-MesageID: 9400162
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,296,1571716800"; 
   d="scan'208";a="9400162"
Date: Mon, 9 Dec 2019 16:36:47 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191209153647.GA980@Air-de-Roger>
References: <20191204151208.37076-1-roger.pau@citrix.com>
 <77e8cd84-07ec-3219-a588-211c376d99bc@suse.com>
 <20191204161834.GM980@Air-de-Roger>
 <9b099b26-4a91-5db5-8d02-6cfe0a91a997@suse.com>
 <20191209102042.GN980@Air-de-Roger>
 <09acabd4-951b-faad-9e10-fa9c85b4ee1a@suse.com>
 <20191209144648.GX980@Air-de-Roger>
 <55e21ad8-2f15-f3ba-05a7-58166c9f2383@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55e21ad8-2f15-f3ba-05a7-58166c9f2383@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v3] x86: do not enable global pages when
 virtualized on AMD hardware
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMDksIDIwMTkgYXQgMDQ6MDQ6NTFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDkuMTIuMjAxOSAxNTo0NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgRGVjIDA5LCAyMDE5IGF0IDAzOjIxOjI4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDA5LjEyLjIwMTkgMTE6MjAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIFdlZCwgRGVjIDA0LCAyMDE5IGF0IDA2OjA1OjExUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4gT24gMDQuMTIuMjAxOSAxNzoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
PiA+Pj4+PiBPbiBXZWQsIERlYyAwNCwgMjAxOSBhdCAwNToxMTo0MlBNICswMTAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+Pj4+Pj4gT24gMDQuMTIuMjAxOSAxNjoxMiwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+ID4+Pj4+Pj4gQEAgLTEzMCw3ICsxNDMsNyBAQCB1bnNpZ25lZCBsb25nIHB2X21h
a2VfY3I0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+ID4+Pj4+Pj4gICAgICAgKi8KPiA+Pj4+Pj4+
ICAgICAgaWYgKCBkLT5hcmNoLnB2LnBjaWQgKQo+ID4+Pj4+Pj4gICAgICAgICAgY3I0IHw9IFg4
Nl9DUjRfUENJREU7Cj4gPj4+Pj4+PiAtICAgIGVsc2UgaWYgKCAhZC0+YXJjaC5wdi54cHRpICkK
PiA+Pj4+Pj4+ICsgICAgZWxzZSBpZiAoICFkLT5hcmNoLnB2LnhwdGkgJiYgb3B0X2dsb2JhbF9w
YWdlcyApCj4gPj4+Pj4+PiAgICAgICAgICBjcjQgfD0gWDg2X0NSNF9QR0U7Cj4gPj4+Pj4+Cj4g
Pj4+Pj4+IEknbSBzb3JyeSBmb3Igbm90aWNpbmcgdGhpcyBvbmx5IG5vdywgYnV0IHdoYXQgYWJv
dXQgWEVOX01JTklNQUxfQ1I0LAo+ID4+Pj4+PiB3aGljaCBpbmNsdWRlcyBYODZfQ1I0X1BHRT8K
PiA+Pj4+Pgo+ID4+Pj4+IEkndmUgdHJpZWQgcmVtb3ZpbmcgUEdFIGZyb20gWEVOX01JTklNQUxf
Q1I0IGJ1dCBpdCBtYWRlIG5vIG5vdGljZWFibGUKPiA+Pj4+PiBwZXJmb3JtYW5jZSBkaWZmZXJl
bmNlLCBzbyBJIGxlZnQgaXQgYXMtaXMuCj4gPj4+Pgo+ID4+Pj4gTXkgY29uY2VybiBpc24ndCBh
Ym91dCBwZXJmb3JtYW5jZSwgYnV0IGNvcnJlY3RuZXNzLiBJIGFkbWl0IEkKPiA+Pj4+IGZvcmdv
dCBmb3IgYSBtb21lbnQgdGhhdCB3ZSBub3cgYWx3YXlzIHdyaXRlIENSNCAodW5sZXNzIHRoZQo+
ID4+Pj4gY2FjaGVkIHZhbHVlIG1hdGNoZXMgdGhlIGludGVuZGVkIG5ldyBvbmUpLiBZZXQKPiA+
Pj4+IG1tdV9jcjRfZmVhdHVyZXMgKHN0YXJ0aW5nIG91dCBhcyBYRU5fTUlOSU1BTF9DUjQpIGlz
IHN0aWxsIG9mCj4gPj4+PiBjb25jZXJuLgo+ID4+Pj4KPiA+Pj4+IEkgdGhpbmsgdGhpcyBhdCBs
ZWFzdCByZXF1aXJlcyBleHRlbmRpbmcgdGhlIGRlc2NyaXB0aW9uIHRvCj4gPj4+PiBkaXNjdXNz
IHRoZSBjb3JyZWN0bmVzcy4KPiA+Pj4KPiA+Pj4gV291bGQgeW91IGJlIGZpbmUgd2l0aCBhZGRp
bmcgdGhlIGZvbGxvd2luZyBhdCB0aGUgZW5kIG9mIHRoZSBjb21taXQKPiA+Pj4gbWVzc2FnZS4K
PiA+Pj4KPiA+Pj4gIk5vdGUgdGhhdCBYRU5fTUlOSU1BTF9DUjQgaXMgbm90IG1vZGlmaWVkLCBh
bmQgdGh1cyBnbG9iYWwgcGFnZXMgYXJlCj4gPj4+IGxlZnQgZW5hYmxlZCBmb3IgdGhlIGh5cGVy
dmlzb3IuIFRoaXMgaXMgbm90IGFuIGlzc3VlIGJlY2F1c2UgdGhlIGNvZGUKPiA+Pj4gdG8gc3dp
dGNoIHRoZSBjb250cm9sIHJlZ2lzdGVycyAoY3IzIGFuZCBjcjQpIGFscmVhZHkgdGFrZXMgaW50
bwo+ID4+PiBhY2NvdW50IHN1Y2ggc2l0dWF0aW9uIGFuZCBwZXJmb3JtcyB0aGUgbmVjZXNzYXJ5
IGZsdXNoZXMuIFRoZSBzYW1lCj4gPj4+IGFscmVhZHkgaGFwcGVucyB3aGVuIHVzaW5nIFhQVEkg
b3IgUENJREUsIGFzIHRoZSBndWVzdCBjcjQgZG9lc24ndAo+ID4+PiBoYXZlIGdsb2JhbCBwYWdl
cyBlbmFibGVkIGluIHRoYXQgY2FzZSBlaXRoZXIuIgo+ID4+Cj4gPj4gWWVzLCB0aGlzIGlzIGdv
b2QgZm9yIFhFTl9NSU5JTUFMX0NSNC4gQnV0IEkgdGhpbmsgbW11X2NyNF9mZWF0dXJlcwo+ID4+
IG5lZWRzIGRpc2N1c3NpbmcgKG9yIGF0IGxlYXN0IG1lbnRpb25pbmcsIGlmIHRoZSBzYW1lIGFy
Z3VtZW50cwo+ID4+IGFwcGx5KSBhcyB3ZWxsLgo+ID4gCj4gPiBUaGUgc2FtZSBhcHBsaWVzIHRv
IG1tdV9jcjRfZmVhdHVyZXMsIGl0J3MgZmluZSBmb3IgdGhlIGh5cGVydmlzb3IgdG8KPiA+IHVz
ZSBhIGRpZmZlcmVudCBzZXQgb2YgY3I0IGZlYXR1cmVzIChlc3BlY2lhbGx5IFBHRSkgdGhhbiBQ
ViBndWVzdHM6Cj4gPiB0aGlzIGlzIGFscmVhZHkgdGhlIGNhc2Ugd2hlbiB1c2luZyBYUFRJIG9y
IFBDSURFIHdoZW4gWGVuIGNyNCB3aWxsCj4gPiBoYXZlIFBHRSBhbmQgZ3Vlc3RzIGNyNCB3b24n
dCwgYW5kIHN3aXRjaF9jcjNfY3I0IERUUlQuCj4gPiAKPiA+IFNvIEkgd291bGQgcy9YRU5fTUlO
SU1BTF9DUjQvWEVOX01JTklNQUxfQ1I0IGFuZCBtbXVfY3I0X2ZlYXR1cmVzLyBpbgo+ID4gdGhl
IGFib3ZlIHByb3Bvc2VkIHBhcmFncmFwaC4KPiAKPiBJJ20gYWZyYWlkIGl0J3MgbW9yZSBjb21w
bGljYXRlZCwgdXAgdG8gYW5kIGluY2x1ZGluZyB5b3UgbWFraW5nIGEKPiBwb3NzaWJsZSBwcmUt
ZXhpc3RpbmcgYnVnIHdvcnNlOiBUaGUgUzMgcmVzdW1lIHBhdGggbG9hZHMgQ1I0IGZyb20KPiBt
bXVfY3I0X2ZlYXR1cmVzLCBidXQgZG9lc24ndCB1cGRhdGUgdGhlIGluLW1lbW9yeSBjYWNoZSBv
ZiB0aGUKPiByZWdpc3Rlci4KCkFsbCBkb21haW5zIGFyZSBwYXVzZWQgYW5kIHRoZSBzY2hlZHVs
ZXIgaXMgZGlzYWJsZWQgd2hlbiBkb2luZyBTMwpzdXNwZW5kL3Jlc3VtZSwgYW5kIHRoZSBhY3R1
YWwgc3VzcGVuZCBhbmQgcmVzdW1lIGNvZGUgaXMgcnVuIGJ5IGEKdGFza2xldCB3aGljaCBpcyBl
eGVjdXRlZCBpbiB0aGUgaWRsZSB2Q1BVIGNvbnRleHQgKHNpbmNlIGFsbCBkb21haW5zCmFyZSBw
YXVzZWQpLCBhbmQgaGVuY2UgdGhlIHdyaXRlIG9mIENSNCB3aXRoIG1tdV9jcjRfZmVhdHVyZXMg
aXMgZmluZQphcyBlbnRlcmluZyBndWVzdCBjb250ZXh0IGFmdGVyIHJlc3VtZSBpcyBnb2luZyB0
byBpbnZvbHZlIGEgY2FsbCB0bwpzd2l0Y2hfY3IzX2NyNCBpbiBvcmRlciB0byBzd2l0Y2ggb3V0
IG9mIHRoZSBpZGxlIHZDUFUuCgpJdCBtaWdodCBiZSBjbGVhcmVyIHRvIGp1c3Qgc2F2ZSBjcjQg
aW4gZG9fc3VzcGVuZF9sb3dsZXZlbCBsaWtlIGl0J3MKZG9uZSB3aXRoIHRoZSByZXN0IG9mIHRo
ZSBjb250cm9sIHJlZ2lzdGVycy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
