Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEF2BB7B9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 17:20:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCQ5E-0002uf-14; Mon, 23 Sep 2019 15:17:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=naYO=XS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iCQ5B-0002ua-VB
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 15:16:57 +0000
X-Inumbo-ID: 2e552b18-de15-11e9-9600-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 2e552b18-de15-11e9-9600-12813bfff9fa;
 Mon, 23 Sep 2019 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569251817;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eIRlwsU+K5OsBtFLOXno6pmLWhirKy2iKll8RKjYvi8=;
 b=WGV36bG1VxzC25Nflman58xyLLTRnfUZWTtr4JHXNN1PXyfEvL9oZNGH
 KJcrAqepVWAGUCHztfwmyeESDKtc2xdKX3y2DTCA2FTAdtZHdOV+ic7ip
 QSGYLgtjWBOSc1zYoSyCLo+E219eHS19qaOw4QDjB1kjb4BE/GLPkm+1Z E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vpHnzzho+7x1z7KeA6YWvG1DbCiTn8fUa6ZkiUTysspHstggxKktxzDQBKQ4Om4DsF0kqugVVn
 ibDwUV5jp1ut+Mxq7ydurWl7KVkHU2JaZqL3wtnZVCGIOQWj3K5RKP+7VzZFsnwHVG6ciAyQ7Z
 xO3MBxULougfXWpdaysp4A/4XouYxk9L9L6QZg3YG7eGpO/qIkv9lxeGS2pUOPKJt5FI4x9wPG
 L+3SiGkxcOawJJPG5ckzEXfu9ruL4bSK5kvetvFxyv5u7g/umOb/RXvQwt3BNpbnxAgU0wargn
 9V8=
X-SBRS: 2.7
X-MesageID: 5941310
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,540,1559534400"; 
   d="scan'208";a="5941310"
Date: Mon, 23 Sep 2019 17:16:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190923151648.pmvf2ikwktiovbzx@Air-de-Roger>
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
 <819398f808613a1109bc06440268b8746e7540d4.1568475323.git-series.marmarek@invisiblethingslab.com>
 <fc4dcc0e-fd7a-a25d-0f6f-b722f6ba8122@suse.com>
 <20190920160250.GA8065@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920160250.GA8065@mail-itl>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 5/6] xen/x86: add
 PHYSDEVOP_interrupt_control
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDY6MDI6NTBQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIEZyaSwgU2VwIDIwLCAyMDE5IGF0IDEyOjEwOjA5UE0g
KzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gT24gMTQuMDkuMjAxOSAxNzozNywgTWFyZWsg
TWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToKPiA+ID4gQWxsb3cgZGV2aWNlIG1vZGVsIHJ1
bm5pbmcgaW4gc3R1YmRvbWFpbiB0byBlbmFibGUvZGlzYWJsZSBJTlR4L01TSSgtWCksCj4gPiA+
IGJ5cGFzc2luZyBwY2liYWNrLiBXaGlsZSBwY2liYWNrIGlzIHN0aWxsIHVzZWQgdG8gYWNjZXNz
IGNvbmZpZyBzcGFjZQo+ID4gPiBmcm9tIHdpdGhpbiBzdHViZG9tYWluLCBpdCByZWZ1c2UgdG8g
d3JpdGUgdG8KPiA+ID4gUENJX01TSV9GTEFHU19FTkFCTEUvUENJX01TSVhfRkxBR1NfRU5BQkxF
L1BDSV9DT01NQU5EX0lOVFhfRElTQUJMRQo+ID4gPiBpbiBub24tcGVybWlzc2l2ZSBtb2RlLiBX
aGljaCBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gZm9yIFBWIGRvbWFpbgo+ID4gPiAodGhlIG1h
aW4gdXNlIGNhc2UgZm9yIHBjaWJhY2spLCBhcyBQViBkb21haW4gc2hvdWxkIHVzZSBYRU5fUENJ
X09QXyoKPiA+ID4gY29tbWFuZHMgZm9yIHRoYXQuIFVuZm9ydHVuYXRlbHkgdGhvc2UgY29tbWFu
ZHMgYXJlIG5vdCBnb29kIGZvcgo+ID4gPiBzdHViZG9tYWluIHVzZSwgYXMgdGhleSBjb25maWd1
cmUgTVNJIGluIGRvbTAncyBrZXJuZWwgdG9vLCB3aGljaCBzaG91bGQKPiA+ID4gbm90IGhhcHBl
biBmb3IgSFZNIGRvbWFpbi4KPiA+IAo+ID4gV2h5IHRoZSAiZm9yIEhWTSBkb21haW4iIGhlcmU/
IEkuZS4gd2h5IHdvdWxkIHRoaXMgYmUgY29ycmVjdCBmb3IKPiA+IGEgUFYgZG9tYWluPyBCZXNp
ZGVzIG15IGRpc2xpa2UgZm9yIHN1Y2ggYSBieXBhc3MgKGltbyBhbGwgb2YgdGhlCj4gPiBoYW5k
bGluZyBzaG91bGQgZ28gdGhyb3VnaCBwY2liYWNrLCBvciBub25lIG9mIGl0KSBJIGNvbnRpbnVl
IHRvCj4gPiB3b25kZXIgd2hldGhlciB0aGUgcHJvYmxlbSBjYW4ndCBiZSBhZGRyZXNzZWQgYnkg
YSBwY2liYWNrIGNoYW5nZS4KPiA+IEFuZCBldmVuIGlmIG5vdCwgSSdkIHN0aWxsIHdvbmRlciB3
aGV0aGVyIHRoZSByZXF1ZXN0IHNob3VsZG4ndCBnbwo+ID4gdGhyb3VnaCBwY2liYWNrLCB0byBy
ZXRhaW4gcHJvcGVyIGxheWVyaW5nLiBVbHRpbWF0ZWx5IGl0IG1heSBiZQo+ID4gYmV0dGVyIHRv
IGhhdmUgZXZlbiB0aGUgbWFwL3VubWFwIGdvIHRocm91Z2ggcGNpYmFjayAoaXQncyBhdAo+ID4g
bGVhc3QgYW4gYXBwYXJlbnQgdmlvbGF0aW9uIG9mIHRoZSBvcmlnaW5hbCBwaHlzZGV2LW9wIG1v
ZGVsIHRoYXQKPiA+IHRoZXNlIHR3byBhcmUgWFNNX0RNX1BSSVYpLgo+IAo+IFRlY2huaWNhbGx5
IGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBtb3ZlIHRoaXMgcGFydCB0byBwY2liYWNrLCBhbmQg
aW4KPiBmYWN0IHRoaXMgaXMgd2hhdCBJJ3ZlIGNvbnNpZGVyZWQgaW4gdGhlIGZpcnN0IHZlcnNp
b24gb2YgdGhpcyBzZXJpZXMuCj4gQnV0IFJvZ2VyIHBvaW50cyBvdXQgb24gZWFjaCB2ZXJzaW9u
WzFdIG9mIHRoaXMgc2VyaWVzIHRoYXQgcGNpYmFjayBpcwo+IG1lYW50IHRvIHNlcnZlICpQViog
ZG9tYWlucywgd2hlcmUgYSBQQ0kgcGFzc3Rocm91Z2ggaXMgYSBjb21wbGV0ZWx5Cj4gZGlmZmVy
ZW50IGRpZmZlcmVudCBiZWFzdC4gSW4gZmFjdCwgSSBldmVuIGNvbnNpZGVyIHRoYXQgdXNpbmcg
cGNpZnJvbnQKPiBpbiBhIExpbnV4IHN0dWJkb21haW4gYXMgYSBwcm94eSBmb3IgcWVtdSB0aGVy
ZSBtYXkgYmUgYSBiYWQgaWRlYSAob25lCj4gbmVlZHMgdG8gYmUgY2FyZWZ1bCB0byBhdm9pZCBz
dHViZG9tYWluIGtlcm5lbCBmaWdodGluZyB3aXRoIHFlbXUgYWJvdXQKPiBkZXZpY2Ugc3RhdGUp
LgoKUmlnaHQsIGl0J3MgKGFzIHNob3cgYnkgdGhpcyBzZXJpZXMpIHRyaWNreSB0byBwcm94eSBI
Vk0gcGFzc3Rocm91Z2gKb3ZlciB0aGUgUFYgcGNpaWYgcHJvdG9jb2wgdXNlZCBieSBwY2lmcm9u
dCBhbmQgcGNpYmFjaywgYmVjYXVzZSB0aGF0CnByb3RvY29sIHdhcyBkZXNpZ25lZCBmb3IgUFYg
Z3Vlc3RzIHBjaS1wYXNzdGhyb3VnaC4KCldoaWxlIGl0J3MgaW5kZWVkIHBvc3NpYmxlIHRvIGV4
cGFuZCB0aGUgcGNpaWYgcHJvdG9jb2wgc28gaXQncyBhbHNvCnN1aXRhYmxlIHRvIHByb3h5IEhW
TSBwYXNzdGhyb3VnaCBieSBhIFFFTVUgc3R1YmRvbWFpbiB0aGF0IHdvdWxkCnJlcXVpcmUgY2hh
bmdlcyB0byBMaW51eCBwY2liYWNrIGF0IGxlYXN0IChhbmQgdG8gcGNpZnJvbnQgbWF5YmU/KSwK
YW5kIGl0J3MgdXNhZ2Ugd291bGQgbmVlZCB0byBiZSBsaW1pdGVkIHRvIHN0dWJkb21haW5zIG9u
bHkgdG8gbm90CnJpc2sgZXhwYW5kaW5nIHRoZSBhdHRhY2sgc3VyZmFjZSBvZiBwY2liYWNrLgoK
PiBSb2dlciwgd2hhdCBpcyB0aGUgc3RhdGUgb2YgWGVuIGludGVybmFsIHZQQ0k/IElmIGhhbmRs
aW5nIFBDSQo+IHBhc3N0aHJvdWdoIGluIFhlbiAob3IgbWF5YmUgc3RhbmRhbG9uZSBlbXVsYXRv
ciksIHdpdGhvdXQgcWVtdSBoZWxwIGlzCj4gZ29pbmcgdG8gaGFwcGVuIHNvb25lciB0aGFuIGxh
dGVyIChJIGd1ZXNzIG5vdCA0LjEzLCBidXQgbWF5YmUgNC4xND8pLAo+IHRoZW4gbWF5YmUgdGhp
cyB3aG9sZSBwYXRjaCBkb2Vzbid0IG1ha2Ugc2Vuc2UgYXMgYSB0ZW1wb3JhcnkgbWVhc3VyZT8K
CkkndmUgZ290IGFuIGluaXRpYWwgc2VyaWVzIHBvc3RlZCB0byBjb252ZXJ0IHZQQ0kgdG8gYW4g
aW50ZXJuYWwgaW9yZXEKc2VydmVyLCBzbyBpdCBjYW4gY28tZXhpc3Qgd2l0aCBvdGhlciBpb3Jl
cSBzZXJ2ZXJzIHRoYXQgYWxzbyB0cmFwCmFjY2Vzc2VzIHRvIHRoZSBwY2kgY29uZmlndXJhdGlv
biBzcGFjZS4gT25jZSB0aGF0J3MgZG9uZSB0aGUgbWFpbgp3b3JrIHdpbGwgYmUgdG8gbWFrZSB2
UENJIHNhZmUgZm9yIHVucHJpdmlsZWdlZCBkb21haW5zLiBSaWdodCBub3cKdlBDSSBpcyB0b28g
cGVybWlzc2l2ZSBzaW5jZSBpdCdzIGRlc2lnbmVkIGZvciBkb20wIG9ubHkuCgpJIGhvcGUgNC4x
NCB3aWxsIGhhdmUgYXQgbGVhc3QgZXhwZXJpbWVudGFsIGNvZGUgZm9yIHZQQ0kgZm9yIGRvbVVz
LApidXQgSSBjYW5ub3QgZ3VhcmFudGVlIGFueXRoaW5nIGF0IHRoaXMgcG9pbnQuCgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
