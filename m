Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A5013BD05
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 11:03:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irfTE-0000rp-Ok; Wed, 15 Jan 2020 10:00:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eK3x=3E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1irfTC-0000ri-Ss
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 10:00:14 +0000
X-Inumbo-ID: d0c337c0-377d-11ea-84fc-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0c337c0-377d-11ea-84fc-12813bfff9fa;
 Wed, 15 Jan 2020 10:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579082411;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gGWOnutseotgnkVjWttthHQUiWG1FItxs3I/FhghIWw=;
 b=Qe340SOj2pihy82KqZMr6X8GviD46q7e4P2cnuXE+iF4EWnyP5+LHzUK
 a4kCJIZaFa7uQPijPUp2dYz5ZvtNVCXfiHmvs2ShRx6IW07h8klg3pI4U
 i4aU5SWjcWBMdw0j3VRrMVxNNnJFGUVFudW8IiMO+tot0vNy/szaZxxgu s=;
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
IronPort-SDR: 3XZObXMOxjWKVoeKV2JjqDcZaZQVzHGNHCPYnXbDEQQvWatEz2QW8gDHoh6GjRDQkOgLkFEJSL
 LC4P1lErcMVw+0PjYA02KNduP+v0yJ5faaQgujn44mwL9rNN9G9zAmlas4LrVx/Lho6MorQBJy
 j++vi9IadcEsFTK+OPa+ej0p0qYV27v/OYEYqe9ytgFEBqvkAVc1PSTLYXies2uJpRiJ7jMe/7
 vVxCAdrWLbvQyJz8xn5qGu2ZTiAl2Nm89YXPied0MrxrfGFyQNcqPhErIQxPQKXNAGZUOW8x/J
 Btk=
X-SBRS: 2.7
X-MesageID: 10931235
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="10931235"
Date: Wed, 15 Jan 2020 11:00:03 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200115100003.GJ11756@Air-de-Roger>
References: <5c88239b-de0f-5f81-72c4-7fdb07524278@suse.com>
 <91d9f45c-e0e1-a01c-d812-2dd3345fff48@suse.com>
 <20200115095637.GI11756@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115095637.GI11756@Air-de-Roger>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Ping: [PATCH v2] dom0-build: fix build with clang5
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMTA6NTY6MzdBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIERlYyAyMCwgMjAxOSBhdCAwNToyNjozNFBNICswMTAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+IE9uIDE3LjA3LjIwMTkgMDg6NDcsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4gPiBXaXRoIG5vbi1lbXB0eSBDT05GSUdfRE9NMF9NRU0gY2xhbmc1IHByb2R1Y2VzCj4g
PiA+IAo+ID4gPiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBlcnJvcjogdXNlIG9mIGxvZ2ljYWwgJyYm
JyB3aXRoIGNvbnN0YW50IG9wZXJhbmQgWy1XZXJyb3IsLVdjb25zdGFudC1sb2dpY2FsLW9wZXJh
bmRdCj4gPiA+ICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSAp
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIF4gIH5+fn5+fn5+fn5+fn5+fn5+fgo+ID4g
PiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiB1c2UgJyYnIGZvciBhIGJpdHdpc2Ugb3BlcmF0
aW9uCj4gPiA+ICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSAp
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIF5+Cj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICYKPiA+ID4gZG9tMF9idWlsZC5jOjM0NDoyNDogbm90ZTogcmVtb3ZlIGNvbnN0YW50
IHRvIHNpbGVuY2UgdGhpcyB3YXJuaW5nCj4gPiA+ICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYm
IENPTkZJR19ET00wX01FTVswXSApCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgfl5+fn5+
fn5+fn5+fn5+fn5+fn5+fgo+ID4gPiAxIGVycm9yIGdlbmVyYXRlZC4KPiA+ID4gCj4gPiA+IE9i
dmlvdXNseSBuZWl0aGVyIG9mIHRoZSB0d28gc3VnZ2VzdGlvbnMgYXJlIGFuIG9wdGlvbiBoZXJl
LiBPZGRseQo+ID4gPiBlbm91Z2ggc3dhcHBpbmcgdGhlIG9wZXJhbmRzIG9mIHRoZSAmJiBoZWxw
cywgd2hpbGUgZS5nLiBjYXN0aW5nIG9yCj4gPiA+IHBhcmVudGhlc2l6aW5nIGRvZXNuJ3QuIEFu
b3RoZXIgd29ya2FibGUgdmFyaWFudCBsb29rcyB0byBiZSB0aGUgdXNlIG9mCj4gPiA+ICEhIG9u
IHRoZSBjb25zdGFudC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiA+ID4gLS0tCj4gPiA+IHYyOiBBbHNvIGFkanVzdCB0aGUgQXJt
IGluY2FybmF0aW9uIG9mIHRoZSBzYW1lIGNvbnN0cnVjdC4KPiA+ID4gLS0tCj4gPiA+IEknbSBv
cGVuIHRvIGdvaW5nIHRoZSAhISBvciB5ZXQgc29tZSBkaWZmZXJlbnQgcm91dGUgKGJ1dCBub3Qg
cmVhbGx5IHRoZQo+ID4gPiBzdWdnZXN0ZWQgc3RybGVuKCkgb25lKS4gTm8gbWF0dGVyIHdoaWNo
IG9uZSB3ZSBjaG9vc2UsIEknbSBhZnJhaWQgaXQgaXMKPiA+ID4gZ29pbmcgdG8gcmVtYWluIGd1
ZXNzd29yayB3aGF0IG5ld2VyIChhbmQgZnV0dXJlKSB2ZXJzaW9ucyBvZiBjbGFuZyB3aWxsCj4g
PiA+IGNob2tlIG9uLgo+ID4gCj4gPiBJIGd1ZXNzIHRoZSBkaXNhZ3JlZW1lbnQgb24gaG93IHRv
IGV4YWN0bHkgYWRkcmVzcyB0aGUgaXNzdWUgaGFzCj4gPiBzdGFsbGVkIHRoaXMuIEJ1dCBJIHRo
aW5rIHdlIHNob3VsZCByYXRoZXIgaGF2ZSBfc29tZV8gKGUuZy4KPiA+IHRoaXMpIHNvbHV0aW9u
IGluIHRoZSByZXBvLCB0aGFuIGNvbnRpbnVlIHRvIHNoaXAgdmVyc2lvbnMgd2hpY2gKPiA+IGRv
bid0IGJ1aWxkLiBQZW9wbGUgd2FudGluZyB0byBiZWF1dGlmeSB0aGUgY29kZSBmdXJ0aGVyIGNv
dWxkCj4gPiB0aGVuIHN1Ym1pdCBpbmNyZW1lbnRhbCBwYXRjaGVzLgo+IAo+IEFja2VkLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBJJ20gbm90IHByb3Zp
ZGluZyBhIFJCIGJlY2F1c2UgdGhpcyBpcyBhbGwgZ3Vlc3N3b3JrLCBzbyBpdCBkb2Vzbid0Cj4g
ZmVlbCBhcHByb3ByaWF0ZSB0byByZXZpZXcgc29tZXRoaW5nIHRoYXQncyBiYXNlZCBvbiB1bmRv
Y3VtZW50ZWQKPiBjb21waWxlciBiZWhhdmlvci4KPiAKPiBBbm90aGVyIG9wdGlvbiB3b3VsZCBi
ZSB0byBwYXNzIC1XY29uc3RhbnQtbG9naWNhbC1vcGVyYW5kIGJ1dCB0aGF0Cj4gd291bGQgcHJl
dmVudCBjYWNoaW5nIHNvbWUgbGljaXQgaXNzdWVzLgoKRm9yZ290IHRvIG1lbnRpb24sIGJ1dCBj
b3VsZCB5b3UgcGxlYXNlIGFkZCBhIGNvbW1lbnQgdG8gbm90ZSB0aGF0IHRoZQpjb25kaXRpb24g
aXMgb3JkZXJlZCB0aGlzIHdheSB0byBtYWtlIGNsYW5nNSBoYXBweT8KClJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
