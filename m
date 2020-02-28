Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095E173DCF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 18:01:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7ixh-0001TJ-89; Fri, 28 Feb 2020 16:58:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7ixf-0001TE-UK
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 16:58:03 +0000
X-Inumbo-ID: 7b1462cc-5a4b-11ea-b472-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b1462cc-5a4b-11ea-b472-bc764e2007e4;
 Fri, 28 Feb 2020 16:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582909082;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vGNMrmAAyfug1JT3FbmKdHRJwUqBBGg+ZvT58INAc5g=;
 b=H3ChKPAwNWv2hpG/AtxQogblAfAgp8icWlFfECdPwgHHFbIsNYe+7YWT
 kAVBiDWRnoXg8Ok+6WgzLNzVFEH6NIrQWHumgFAXIuQi8AgXa680SH1e2
 R52JzMrwkVc52byMYa6lcnZx8dyl61v04PTJ3U0EWIJrDUwWM9JmZLEOq I=;
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
IronPort-SDR: Tr80WAfT9UP96l5YnHYyoOBtgUq2ppn7oyUReppptjFYk5H2D60I1iIcDOEu7PvvnrnEpuF8ov
 6sm+rrdrX21lCUfQmRlDTwht2f4wXK6Caq5qix3V/7n9N+CTGUlsxcCQOMl7QFsY8mlW0P7q4w
 TqABI65pPezgm8reMSBAZarLaXFxMEFnKVGWW2ENa0M1zt+Ds5nfHJ0R6rZz4eczQgqFFvdIra
 B8M6NH+/KJO3FEb2U9Ico9PGfgAjQ/jA2hJsyQNchtNiyJMO1SKJ319AiADBu90iCCrL/UGklT
 0HM=
X-SBRS: 2.7
X-MesageID: 13529294
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13529294"
Date: Fri, 28 Feb 2020 17:57:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228165754.GG24458@Air-de-Roger.citrite.net>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-4-roger.pau@citrix.com>
 <50f937d7-dceb-e7a1-5e0d-9f239d49dd5c@suse.com>
 <20200228163135.GD24458@Air-de-Roger.citrite.net>
 <c390bcde-f0c6-fd53-ac17-2e2791b1087a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c390bcde-f0c6-fd53-ac17-2e2791b1087a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 3/7] x86/hap: improve hypervisor assisted
 guest TLB flush
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDU6NDQ6NTdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDIuMjAyMCAxNzozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRmViIDI4LCAyMDIwIGF0IDAyOjU4OjQyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDE5LjAyLjIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
LS0tIGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwo+ID4+PiArKysgYi94ZW4vYXJjaC94ODYv
bW0vaGFwL2hhcC5jCj4gPj4+IEBAIC02NjksMzIgKzY2OSwyOCBAQCBzdGF0aWMgdm9pZCBoYXBf
dXBkYXRlX2NyMyhzdHJ1Y3QgdmNwdSAqdiwgaW50IGRvX2xvY2tpbmcsIGJvb2wgbm9mbHVzaCkK
PiA+Pj4gICAgICBodm1fdXBkYXRlX2d1ZXN0X2NyMyh2LCBub2ZsdXNoKTsKPiA+Pj4gIH0KPiA+
Pj4gIAo+ID4+PiArLyoKPiA+Pj4gKyAqIE5COiBkb2Vzbid0IGFjdHVhbGx5IHBlcmZvcm0gYW55
IGZsdXNoLCB1c2VkIGp1c3QgdG8gY2xlYXIgdGhlIENQVSBmcm9tIHRoZQo+ID4+PiArICogbWFz
ayBhbmQgaGVuY2Ugc2lnbmFsIHRoYXQgdGhlIGd1ZXN0IFRMQiBmbHVzaCBoYXMgYmVlbiBkb25l
Lgo+ID4+PiArICovCj4gPj4KPiA+PiAiaGFzIGJlZW4gZG9uZSIgaXNuJ3QgY29ycmVjdCwgYXMg
dGhlIGZsdXNoIG1heSBoYXBwZW4gb25seSBsYXRlcgo+ID4+IG9uICh1cG9uIG5leHQgVk0gZW50
cnkpLiBJIHRoaW5rIHdvcmRpbmcgaGVyZSBuZWVkcyB0byBiZSBhcwo+ID4+IHByZWNpc2UgYXMg
cG9zc2libGUsIGhvd2V2ZXIgdGhlIGNvbW1lbnQgbWF5IHR1cm4gb3V0IHVubmVjZXNzYXJ5Cj4g
Pj4gYWx0b2dldGhlcjoKPiA+IAo+ID4gV2hhdCBhYm91dDoKPiA+IAo+ID4gLyoKPiA+ICAqIE5C
OiBEdW1teSBmdW5jdGlvbiBleGNsdXNpdmVseSB1c2VkIGFzIGEgd2F5IHRvIHRyaWdnZXIgYSB2
bWV4aXQsCj4gPiAgKiBhbmQgdGh1cyBmb3JjZSBhbiBBU0lEL1ZQSUQgdXBkYXRlIG9uIHZtZW50
cnkgKHRoYXQgd2lsbCBmbHVzaCB0aGUKPiA+ICAqIGNhY2hlKS4KPiA+ICAqLwo+IAo+IE9uY2Ug
aXQncyBlbXB0eSAtIHllcywgbG9va3Mgb2theSAod2l0aCBzL2NhY2hlL1RMQi8pLgoKQWNrLgoK
PiA+Pj4gQEAgLTcwNSwyMCArNzAxLDIyIEBAIGJvb2wgaGFwX2ZsdXNoX3RsYihib29sICgqZmx1
c2hfdmNwdSkodm9pZCAqY3R4dCwgc3RydWN0IHZjcHUgKnYpLAo+ID4+PiAgICAgICAgICBpZiAo
ICFmbHVzaF92Y3B1KGN0eHQsIHYpICkKPiA+Pj4gICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4+
PiAgCj4gPj4+IC0gICAgICAgIHBhZ2luZ191cGRhdGVfY3IzKHYsIGZhbHNlKTsKPiA+Pj4gKyAg
ICAgICAgaHZtX2FzaWRfZmx1c2hfdmNwdSh2KTsKPiA+Pj4gIAo+ID4+PiAgICAgICAgICBjcHUg
PSByZWFkX2F0b21pYygmdi0+ZGlydHlfY3B1KTsKPiA+Pj4gLSAgICAgICAgaWYgKCBpc192Y3B1
X2RpcnR5X2NwdShjcHUpICkKPiA+Pj4gKyAgICAgICAgaWYgKCBjcHUgIT0gdGhpc19jcHUgJiYg
aXNfdmNwdV9kaXJ0eV9jcHUoY3B1KSApCj4gPj4+ICAgICAgICAgICAgICBfX2NwdW1hc2tfc2V0
X2NwdShjcHUsIG1hc2spOwo+ID4+PiAgICAgIH0KPiA+Pj4gIAo+ID4+PiAtICAgIC8qIEZsdXNo
IFRMQnMgb24gYWxsIENQVXMgd2l0aCBkaXJ0eSB2Y3B1IHN0YXRlLiAqLwo+ID4+PiAtICAgIGZs
dXNoX3RsYl9tYXNrKG1hc2spOwo+ID4+PiAtCj4gPj4+IC0gICAgLyogRG9uZS4gKi8KPiA+Pj4g
LSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCj4gPj4+IC0gICAgICAgIGlmICggdiAhPSBjdXJy
ZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwgdikgKQo+ID4+PiAtICAgICAgICAgICAgdmNwdV91bnBh
dXNlKHYpOwo+ID4+PiArICAgIC8qCj4gPj4+ICsgICAgICogVHJpZ2dlciBhIHZtZXhpdCBvbiBh
bGwgcENQVXMgd2l0aCBkaXJ0eSB2Q1BVIHN0YXRlIGluIG9yZGVyIHRvIGZvcmNlIGFuCj4gPj4+
ICsgICAgICogQVNJRC9WUElEIGNoYW5nZSBhbmQgaGVuY2UgYWNjb21wbGlzaCBhIGd1ZXN0IFRM
QiBmbHVzaC4gTm90ZSB0aGF0IHZDUFVzCj4gPj4+ICsgICAgICogbm90IGN1cnJlbnRseSBydW5u
aW5nIHdpbGwgYWxyZWFkeSBiZSBmbHVzaGVkIHdoZW4gc2NoZWR1bGVkIGJlY2F1c2Ugb2YKPiA+
Pj4gKyAgICAgKiB0aGUgQVNJRCB0aWNrbGUgZG9uZSBpbiB0aGUgbG9vcCBhYm92ZS4KPiA+Pj4g
KyAgICAgKi8KPiA+Pj4gKyAgICBvbl9zZWxlY3RlZF9jcHVzKG1hc2ssIGhhbmRsZV9mbHVzaCwg
bWFzaywgMCk7Cj4gPj4+ICsgICAgd2hpbGUgKCAhY3B1bWFza19lbXB0eShtYXNrKSApCj4gPj4+
ICsgICAgICAgIGNwdV9yZWxheCgpOwo+ID4+Cj4gPj4gV2h5IGRvIHlvdSBwYXNzIDAgYXMgbGFz
dCBhcmd1bWVudD8gSWYgeW91IHBhc3NlZCAxLCB5b3Ugd291bGRuJ3QKPiA+PiBuZWVkIHRoZSB3
aGlsZSgpIGhlcmUsIGhhbmRsZV9mbHVzaCgpIGNvdWxkIGJlIGVtcHR5LCBhbmQgeW91J2QKPiA+
PiBzYXZlIGEgcGVyaGFwcyBsYXJnZSBhbW91bnQgb2YgQ1BVcyB0byBhbGwgdHJ5IHRvIG1vZGlm
eSB0d28KPiA+PiBjYWNoZSBsaW5lcyAodGhlIG9uZSB1c2VkIGJ5IG9uX3NlbGVjdGVkX2NwdXMo
KSBpdHNlbGYgYW5kIHRoZQo+ID4+IG9uZSBoZXJlKSBpbnN0ZWFkIG9mIGp1c3Qgb25lLiBZZXMs
IGxhdGVuY3kgZnJvbSB0aGUgbGFzdCBDUFUKPiA+PiBjbGVhcmluZyBpdHMgYml0IHRvIHlvdSBi
ZWluZyBhYmxlIHRvIGV4aXQgZnJvbSBoZXJlIG1heSBiZSBhCj4gPj4gbGl0dGxlIGxhcmdlciB0
aGlzIHdheSwgYnV0IG92ZXJhbGwgbGF0ZW5jeSBtYXkgc2hyaW5rIHdpdGggdGhlCj4gPj4gY3V0
IGJ5IGhhbGYgYW1vdW50IG9mIGF0b21pYyBvcHMgaXNzdWVkIHRvIHRoZSBidXMuCj4gPiAKPiA+
IEluIGZhY3QgSSB0aGluayBwYXNzaW5nIDAgYXMgdGhlIGxhc3QgYXJndW1lbnQgaXMgZmluZSwg
YW5kCj4gPiBoYW5kbGVfZmx1c2ggY2FuIGJlIGVtcHR5IGluIHRoYXQgY2FzZSBhbnl3YXkuIFdl
IGRvbid0IHJlYWxseSBjYXJlCj4gPiB3aGV0aGVyIG9uX3NlbGVjdGVkX2NwdXMgcmV0dXJucyBi
ZWZvcmUgYWxsIENQVXMgaGF2ZSBleGVjdXRlZCB0aGUKPiA+IGR1bW15IGZ1bmN0aW9uLCBhcyBs
b25nIGFzIGFsbCBvZiB0aGVtIGhhdmUgdGFrZW4gYSB2bWV4aXQuIFVzaW5nIDAKPiA+IGFscmVh
ZHkgZ3VhcmFudGVlcyB0aGF0IEFGQUlDVC4KPiAKPiBJc24ndCBpdCB0aGF0IHRoZSBjYWxsZXIg
YW50cyB0byBiZSBndWFyYW50ZWVkIHRoYXQgdGhlIGZsdXNoCj4gaGFzIGFjdHVhbGx5IG9jY3Vy
cmVkIChvciBhdCBsZWFzdCB0aGF0IG5vIGZ1cnRoZXIgaW5zbnMgY2FuCj4gYmUgZXhlY3V0ZWQg
cHJpb3IgdG8gdGhlIGZsdXNoIGhhcHBlbmluZywgaS5lLiBhdCBsZWFzdCB0aGUgVk0KPiBleGl0
IGhhdmluZyBvY2N1cnJlZCk/CgpZZXMsIGJ1dCB0aGF0IHdvdWxkIGhhcHBlbiB3aXRoIDAgYXMg
dGhlIGxhc3QgYXJndW1lbnQgYWxyZWFkeSwgc2VlCnRoZSBjb2RlIGluIHNtcF9jYWxsX2Z1bmN0
aW9uX2ludGVycnVwdDoKCiAgICBpZiAoIGNhbGxfZGF0YS53YWl0ICkKICAgIHsKICAgICAgICAo
KmZ1bmMpKGluZm8pOwogICAgICAgIHNtcF9tYigpOwogICAgICAgIGNwdW1hc2tfY2xlYXJfY3B1
KGNwdSwgJmNhbGxfZGF0YS5zZWxlY3RlZCk7CiAgICB9CiAgICBlbHNlCiAgICB7CiAgICAgICAg
c21wX21iKCk7CiAgICAgICAgY3B1bWFza19jbGVhcl9jcHUoY3B1LCAmY2FsbF9kYXRhLnNlbGVj
dGVkKTsKICAgICAgICAoKmZ1bmMpKGluZm8pOwogICAgfQoKVGhlIG9ubHkgZGlmZmVyZW5jZSBp
cyB3aGV0aGVyIG9uX3NlbGVjdGVkX2NwdXMgY2FuIHJldHVybiBiZWZvcmUgYWxsCnRoZSBmdW5j
dGlvbnMgaGF2ZSBiZWVuIGV4ZWN1dGVkIG9uIGFsbCBDUFVzLCBvciB3aGV0aGVyIGFsbCBDUFVz
IGhhdmUKdGFrZW4gYSB2bWV4aXQuIFRoZSBsYXRlciBpcyBmaW5lIGZvciBvdXIgdXNlLWNhc2Uu
Cgo+ID4+IChGb3JjaW5nIGFuIGVtcHR5IGZ1bmN0aW9uIHRvIGJlIGNhbGxlZCBtYXkgc2VlbSBv
ZGQsIGJ1dCBzZW5kaW5nCj4gPj4gIGp1c3Qgc29tZSBJUEkgW2xpa2UgdGhlIGV2ZW50IGNoZWNr
IG9uZV0gd291bGRuJ3QgYmUgZW5vdWdoLCBhcwo+ID4+ICB5b3Ugd2FudCB0byBiZSBzdXJlIHRo
ZSBvdGhlciBzaWRlIGhhcyBhY3R1YWxseSByZWNlaXZlZCB0aGUKPiA+PiAgcmVxdWVzdC4pCj4g
PiAKPiA+IEV4YWN0bHksIHRoYXQncyB0aGUgcmVhc29uIGZvciB0aGUgZW1wdHkgZnVuY3Rpb24u
Cj4gCj4gQnV0IHRoZSBmdW5jdGlvbiBpc24ndCBlbXB0eS4KCkl0IHdpbGwgYmUgbm93LCBzaW5j
ZSBvbl9zZWxlY3RlZF9jcHVzIGFscmVhZHkgZG9lcyB0aGUgbmVlZGVkCnN5bmNocm9uaXphdGlv
biBhcyB5b3UgcG9pbnRlZCBvdXQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
