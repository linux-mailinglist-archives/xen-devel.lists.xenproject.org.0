Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A3E167AC3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 11:25:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j55TS-0007OE-Hd; Fri, 21 Feb 2020 10:23:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j55TR-0007O9-Ju
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 10:23:57 +0000
X-Inumbo-ID: 44088306-5494-11ea-b0fd-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44088306-5494-11ea-b0fd-bc764e2007e4;
 Fri, 21 Feb 2020 10:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582280637;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MJ8cvu68cCNaysT2x+fk74Txi0li0JDn+ry0cbxs5No=;
 b=ANHhcZQaECXslMcGc2DZbpZjIFCVo/CNrpMvyukovrJ4JqXDfYKdc0WL
 Fhf6Egce8ysqFcdFpajY08XKEbq7hHIOOeBp2nrYV/YxW8h0PYlyRMWtV
 USMwIwcz8+vrYgIlq9Imo7B3DnMZWqXY9IPrY792g6bXM/4T8PEL5qw1z Q=;
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
IronPort-SDR: vwVgiwg9p/LAuyfEr9RF/9bODSJuguKMcFBFQPaKcERjWiUM7+DifRQlP+Y14yiiErij6EDlO9
 09CWDLv02HqTKYxU4fcn0u1evnogs5vdrPrTEUB20qqr+L/fSn8Y2bnpBK1RmGFzAsKN6UIOuL
 3VAtebeBdLaZjfYkS6JeMdoArjxfpQKOBPy6eC+KeFkfZ9escIBXEDPJSpKs4wqsVdRAqiE3qK
 FX3xoc7H2d5Vk+Ej/pIdz11qqsw0iNchTvCO9X49SoGNhHLyi1nuWJnYNa/bkLT8K1IrpSryEz
 pgA=
X-SBRS: 2.7
X-MesageID: 12985114
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,467,1574139600"; d="scan'208";a="12985114"
Date: Fri, 21 Feb 2020 11:23:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200221102348.GX4679@Air-de-Roger>
References: <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
 <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
 <20200219144549.GD4679@Air-de-Roger>
 <3ae51529-1cfe-9872-68a4-ab57d634a1cd@suse.com>
 <63d07524-3e72-06e4-cc16-a0a1561a5c68@citrix.com>
 <20200219160825.GF4679@Air-de-Roger>
 <be0a78d2-f175-96fb-dccc-58088362ddd4@suse.com>
 <55e22641-7719-ea56-2961-4f38439c10b8@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55e22641-7719-ea56-2961-4f38439c10b8@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] smp: convert cpu_hotplug_begin into a
 blocking lock acquisition
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

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDk6MTY6NDhBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDIuMjAyMCAxODowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBPbiAxOS4w
Mi4yMDIwIDE3OjA4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+IE9uIFdlZCwgRmViIDE5
LCAyMDIwIGF0IDAzOjA3OjE0UE0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPj4+IE9u
IDE5LzAyLzIwMjAgMTQ6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4gT24gMTkuMDIuMjAy
MCAxNTo0NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+Pj4+PiBPbiBXZWQsIEZlYiAxOSwg
MjAyMCBhdCAwMjo0NDoxMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+Pj4gT24g
MTkuMDIuMjAyMCAxNDoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+Pj4+Pj4+IE9uIFdl
ZCwgRmViIDE5LCAyMDIwIGF0IDAxOjU5OjUxUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+
ID4+Pj4+Pj4+IE9uIDEzLjAyLjIwMjAgMTI6MzIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+
Pj4+Pj4+Pj4gRG9uJ3QgYWxsb3cgY3B1X2hvdHBsdWdfYmVnaW4gdG8gZmFpbCBieSBjb252ZXJ0
aW5nIHRoZSB0cnlsb2NrIGludG8gYQo+ID4+Pj4+Pj4+PiBibG9ja2luZyBsb2NrIGFjcXVpc2l0
aW9uLiBXcml0ZSB1c2VycyBvZiB0aGUgY3B1X2FkZF9yZW1vdmVfbG9jayBhcmUKPiA+Pj4+Pj4+
Pj4gbGltaXRlZCB0byBDUFUgcGx1Zy91bnBsdWcgb3BlcmF0aW9ucywgYW5kIGNhbm5vdCBkZWFk
bG9jayBiZXR3ZWVuCj4gPj4+Pj4+Pj4+IHRoZW1zZWx2ZXMgb3Igb3RoZXIgdXNlcnMgdGFraW5n
IHRoZSBsb2NrIGluIHJlYWQgbW9kZSBhcwo+ID4+Pj4+Pj4+PiBjcHVfYWRkX3JlbW92ZV9sb2Nr
IGlzIGFsd2F5cyBsb2NrZWQgd2l0aCBpbnRlcnJ1cHRzIGVuYWJsZWQuIFRoZXJlCj4gPj4+Pj4+
Pj4+IGFyZSBhbHNvIG5vIG90aGVyIGxvY2tzIHRha2VuIGR1cmluZyB0aGUgcGx1Zy91bnBsdWcg
b3BlcmF0aW9ucy4KPiA+Pj4+Pj4+PiBJIGRvbid0IHRoaW5rIHRoZSBnb2FsIHdhcyBkZWFkbG9j
ayBhdm9pZGFuY2UsIGJ1dCByYXRoZXIgbGltaXRpbmcKPiA+Pj4+Pj4+PiBvZiB0aGUgdGltZSBz
cGVudCBzcGlubmluZyB3aGlsZSB0cnlpbmcgdG8gYWNxdWlyZSB0aGUgbG9jaywgaW4KPiA+Pj4+
Pj4+PiBmYXZvciBvZiBoYXZpbmcgdGhlIGNhbGxlciByZXRyeS4KPiA+Pj4+Pj4+IE5vdyB0aGF0
IHRoZSBjb250ZW50aW9uIGJldHdlZW4gcmVhZC1vbmx5IHVzZXJzIGlzIHJlZHVjZWQgYXMgdGhv
c2UKPiA+Pj4+Pj4+IGNhbiB0YWtlIHRoZSBsb2NrIGluIHBhcmFsbGVsIEkgdGhpbmsgaXQncyBz
YWZlIHRvIHN3aXRjaCB3cml0ZXJzIHRvCj4gPj4+Pj4+PiBibG9ja2luZyBtb2RlLgo+ID4+Pj4+
PiBJJ2QgYWdyZWUgaWYgd3JpdGVycyBjb3VsZG4ndCBiZSBzdGFydmVkIGJ5IChtYW55KSByZWFk
ZXJzLgo+ID4+Pj4+IEFGQUlDVCBmcm9tIHRoZSBydyBsb2NrIGltcGxlbWVudGF0aW9uIHJlYWRl
cnMgd29uJ3QgYmUgYWJsZSB0byBwaWNrCj4gPj4+Pj4gdGhlIGxvY2sgYXMgc29vbiBhcyB0aGVy
ZSdzIGEgd3JpdGVyIHdhaXRpbmcsIHdoaWNoIHNob3VsZCBhdm9pZCB0aGlzCj4gPj4+Pj4gc3Rh
cnZhdGlvbj8KPiA+Pj4+Pgo+ID4+Pj4+IFlvdSBzdGlsbCBuZWVkIHRvIHdhaXQgZm9yIGN1cnJl
bnQgcmVhZGVycyB0byBkcm9wIHRoZSBsb2NrLCBidXQgbm8KPiA+Pj4+PiBuZXcgcmVhZGVycyB3
b3VsZCBiZSBhYmxlIHRvIGxvY2sgaXQsIHdoaWNoIEkgdGhpbmsgc2hvdWxkIGdpdmJlIHVzCj4g
Pj4+Pj4gZW5vdWdoIGZhaXJuZXNzLgo+ID4+Pj4gQWgsIHJpZ2h0LCBpdCB3YXMgcmF0aGVyIHRo
ZSBvdGhlciB3YXkgYXJvdW5kIC0gYmFjay10by1iYWNrCj4gPj4+PiB3cml0ZXJzIGNhbiBzdGFy
dmUgcmVhZGVycyB3aXRoIG91ciBjdXJyZW50IGltcGxlbWVudGF0aW9uLgo+ID4+Pj4KPiA+Pj4+
PiBPVE9IIHdoZW4gdXNpbmcgX3RyeWxvY2sgbmV3IHJlYWRlcnMgY2FuIHN0aWxsIHBpY2sKPiA+
Pj4+PiB0aGUgbG9jayBpbiByZWFkIG1vZGUsIGFuZCBoZW5jZSBJIHRoaW5rIHVzaW5nIGJsb2Nr
aW5nIG1vZGUgZm9yCj4gPj4+Pj4gd3JpdGVycyBpcyBhY3R1YWxseSBiZXR0ZXIsIGFzIHlvdSBj
YW4gYXNzdXJlIHRoYXQgcmVhZGVycyB3b24ndCBiZQo+ID4+Pj4+IGFibGUgdG8gc3RhcnZlIHdy
aXRlcnMuCj4gPj4+PiBUaGlzIGlzIGEgZ29vZCBwb2ludC4gTmV2ZXJ0aGVsZXNzIEkgcmVtYWlu
IHVuY29udmluY2VkIHRoYXQKPiA+Pj4+IHRoZSBjaGFuZ2UgaXMgd2FycmFudGVkIGdpdmVuIHRo
ZSBvcmlnaW5hbCBpbnRlbnRpb25zIChhcyBmYXIKPiA+Pj4+IGFzIHdlJ3JlIGFibGUgdG8gcmVj
b25zdHJ1Y3QgdGhlbSkuIElmIHRoZSBjdXJyZW50IGJlaGF2aW9yCj4gPj4+PiBnZXRzIGluIHRo
ZSB3YXkgb2Ygc2Vuc2libGUgc2hpbSBvcGVyYXRpb24sIHBlcmhhcHMgdGhlCj4gPj4+PiBiZWhh
dmlvciBzaG91bGQgYmUgbWFkZSBkZXBlbmRlbnQgdXBvbiBydW5uaW5nIGluIHNoaW0gbW9kZT8K
PiA+Pj4KPiA+Pj4gSG90cGx1ZyBpc24ndCBnZW5lcmFsbHkgdXNlZCBhdCBhbGwsIHNvIHRoZXJl
IGlzIDAgd3JpdGUgcHJlc3N1cmUgb24gdGhlCj4gPj4+IGxvY2suCj4gPj4+Cj4gPj4+IFdoZW4g
aXQgaXMgdXNlZCwgaXQgaXMgYWxsIGF0IGV4cGxpY2l0IHJlcXVlc3QgZnJvbSB0aGUgY29udHJv
bGxpbmcKPiA+Pj4gZW50aXR5IGluIHRoZSBzeXN0ZW0gKGhhcmR3YXJlIGRvbWFpbiwgb3Igc2lu
Z2xldG9uIHNoaW0gZG9tYWluKS4KPiA+Pj4KPiA+Pj4gSWYgdGhhdCBlbnRpdHkgaXMgdHJ5aW5n
IHRvIERvUyB5b3UsIHlvdSd2ZSBhbHJlYWR5IGxvc3QuCj4gPj4+Cj4gPj4+IFRoZXJlIG1pZ2h0
IGJlIGF0dGVtcHRzIHRvIGp1c3RpZnkgd2h5IHRoZSBsb2NraW5nIHdhcyBkb25lIGxpa2UgdGhh
dCBpbgo+ID4+PiB0aGUgZmlyc3QgcGxhY2UsIGJ1dCBpdCBkb2Vzbid0IG1lYW4gdGhleSB3ZXJl
IG5lY2Vzc2FyaWx5IGNvcnJlY3QgdG8KPiA+Pj4gYmVpbmcgd2l0aCwgYW5kIHRoZXkgZG9uJ3Qg
bWF0Y2ggdXAgd2l0aCB0aGUgcmVhbGlzdGljIHVzYWdlIG9mIHRoZSBsb2NrLgo+ID4+Cj4gPj4g
SSdtIGhhcHB5IHRvIHJld3JpdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGluIG9yZGVyIHRvIGluY2x1
ZGUgdGhlCj4gPj4gZGlzY3Vzc2lvbiBoZXJlLiBXaGF0IGFib3V0IGFkZGluZzoKPiA+Pgo+ID4+
IE5vdGUgdGhhdCB3aGVuIHVzaW5nIHJ3IGxvY2tzIGEgd3JpdGVyIHdhbnRpbmcgdG8gdGFrZSB0
aGUgbG9jayB3aWxsCj4gPj4gcHJldmVudCBmdXJ0aGVyIHJlYWRzIGZyb20gbG9ja2luZyBpdCwg
aGVuY2UgcHJldmVudGluZyByZWFkZXJzIGZyb20KPiA+PiBzdGFydmluZyB3cml0ZXJzLiBXcml0
ZXJzIE9UT0ggY291bGQgc3RhcnZlIHJlYWRlcnMsIGJ1dCBzaW5jZSB0aGUKPiA+PiBsb2NrIGlz
IG9ubHkgcGlja2VkIGluIHdyaXRlIG1vZGUgYnkgYWN0aW9ucyByZXF1ZXN0ZWQgYnkgcHJpdmls
ZWdlZAo+ID4+IGRvbWFpbnMgc3VjaCBlbnRpdGllcyBhbHJlYWR5IGhhdmUgdGhlIGFiaWxpdHkg
dG8gRG9TIHRoZSBoeXBlcnZpc29yCj4gPj4gaW4gbWFueSBvdGhlciB3YXlzLgo+ID4gCj4gPiBX
aGlsZSB0aGlzIHNvdW5kcyBmaW5lLCBteSBwcmltYXJ5IHJlcXVlc3Qgd2FzIG1vcmUgdG93YXJk
cyByZW1vdmluZwo+ID4gKG9yIGF0IGxlYXN0IG1ha2luZyBsZXNzIHNjYXJ5KSB0aGUgcGFydCBh
Ym91dCBkZWFkbG9ja3MuCj4gCj4gQWN0dWFsbHksIGhhdmluZyB0aG91Z2h0IGFib3V0IHRoaXMg
c29tZSBtb3JlIG92ZXIgbmlnaHQsIEknbSBmaW5lCj4gd2l0aCB0aGUgbWVudGlvbmluZyBvZiB0
aGUgZGVhZGxvY2sgc2NlbmFyaW8gYXMgeW91IGhhdmUgaXQgcmlnaHQgbm93Lgo+IEknbSBub3Qg
b3Zlcmx5IGZ1c3NlZCBhcyB0byB0aGUgYWRkaXRpb24gKG9yIG5vdCkgb2YgdGhlIGFib3ZlIGV4
dHJhCj4gcGFyYWdyYXBoLgoKVXAgdG8geW91LCBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3Bpbmlv
bi4KCkFGQUlDVCB0aGVyZSdzIG5vIG5lZWQgZm9yIG1lIHRvIHJlc2VuZCB0aGVuPwoKVGhhbmtz
LCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
