Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF812D309
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 19:02:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilzK6-00043l-Jk; Mon, 30 Dec 2019 17:59:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jPdN=2U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ilzK4-00043f-N7
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 17:59:20 +0000
X-Inumbo-ID: 149d3bb4-2b2e-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 149d3bb4-2b2e-11ea-88e7-bc764e2007e4;
 Mon, 30 Dec 2019 17:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577728750;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9pjElk2qxh84uss9Fc7IJrJCnFf676HxtOqqaoXFzRY=;
 b=LgMypLev+Ix3b2h5/xWyahxkI23RAMONRwR8iHKVf00RT+hcw2q8jTDu
 T9i53vZ7tetZqVGwU3XXSUuJxUqZQ7LAnrb/5WFRfpzjslUseP6TJhvHs
 36AM5UNJ9KpYsNTCxQzyfPuoEJgtx4E4p4ZLA2MItU7yc5zpGakD7BD99 s=;
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
IronPort-SDR: d7uuQS56pRWHZ9w+U6hLrrrhwzod/d/WXvwLHpJY2ZJCqvUQVdpdTjf/SHO6H6RhYQewQJ1lb8
 tlXKpyYyd0LU1q09JTizPtMltyTt6OhkHqtXktJWMbIpEdv45GFTLKIsIX361AXjmbrZNWoksX
 uaPlFt1eyFUL6d8adglkyweZKN029zDOiC5JI+Tb4gC99IGHaJthZCzSypKc3SZdcmrpJjrUyq
 j03dHqDTIIti9EvgpGiMTjpwKIep/dhGWUCXNlY7imxQjiM1tlBtWWFkmOQnrOlpO9U9iNP6j6
 8Ww=
X-SBRS: 2.7
X-MesageID: 10309276
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,376,1571716800"; d="scan'208";a="10309276"
Date: Mon, 30 Dec 2019 18:59:00 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20191230175900.GF11756@Air-de-Roger>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Julien Grall <julien@xen.org>, Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMDg6NTg6MDFBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIFRodSwgRGVjIDE5LCAyMDE5IGF0IDI6NDggQU0gUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgRGVjIDE4LCAy
MDE5IGF0IDExOjQwOjM3QU0gLTA4MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gVGhl
IGZvbGxvd2luZyBzZXJpZXMgaW1wbGVtZW50cyBWTSBmb3JraW5nIGZvciBJbnRlbCBIVk0gZ3Vl
c3RzIHRvIGFsbG93IGZvcgo+ID4gPiB0aGUgZmFzdCBjcmVhdGlvbiBvZiBpZGVudGljYWwgVk1z
IHdpdGhvdXQgdGhlIGFzc29zY2lhdGVkIGhpZ2ggc3RhcnR1cCBjb3N0cwo+ID4gPiBvZiBib290
aW5nIG9yIHJlc3RvcmluZyB0aGUgVk0gZnJvbSBhIHNhdmVmaWxlLgo+ID4gPgo+ID4gPiBKSVJB
IGlzc3VlOiBodHRwczovL3hlbnByb2plY3QuYXRsYXNzaWFuLm5ldC9icm93c2UvWEVOLTg5Cj4g
PiA+Cj4gPiA+IFRoZSBtYWluIGRlc2lnbiBnb2FsIHdpdGggdGhpcyBzZXJpZXMgaGFzIGJlZW4g
dG8gcmVkdWNlIHRoZSB0aW1lIG9mIGNyZWF0aW5nCj4gPiA+IHRoZSBWTSBmb3JrIGFzIG11Y2gg
YXMgcG9zc2libGUuIFRvIGFjaGlldmUgdGhpcyB0aGUgVk0gZm9ya2luZyBwcm9jZXNzIGlzCj4g
PiA+IHNwbGl0IGludG8gdHdvIHN0ZXBzOgo+ID4gPiAgICAgMSkgZm9ya2luZyB0aGUgVk0gb24g
dGhlIGh5cGVydmlzb3Igc2lkZTsKPiA+ID4gICAgIDIpIHN0YXJ0aW5nIFFFTVUgdG8gaGFuZGxl
IHRoZSBiYWNrZWQgZm9yIGVtdWxhdGVkIGRldmljZXMuCj4gPiA+Cj4gPiA+IFN0ZXAgMSkgaW52
b2x2ZXMgY3JlYXRpbmcgYSBWTSB1c2luZyB0aGUgbmV3ICJ4bCBmb3JrLXZtIiBjb21tYW5kLiBU
aGUKPiA+ID4gcGFyZW50IFZNIGlzIGV4cGVjdGVkIHRvIHJlbWFpbiBwYXVzZWQgYWZ0ZXIgZm9y
a3MgYXJlIGNyZWF0ZWQgZnJvbSBpdCAod2hpY2gKPiA+ID4gaXMgZGlmZmVyZW50IHRoZW4gd2hh
dCBwcm9jZXNzIGZvcmtpbmcgbm9ybWFsbHkgZW50YWlscykuIER1cmluZyB0aGlzIGZvcmtpbmcK
PiA+ICAgICAgICAgICAgICAgIF4gdGhhbgo+ID4gPiBvcGVyYXRpb24gdGhlIEhWTSBjb250ZXh0
IGFuZCBWTSBzZXR0aW5ncyBhcmUgY29waWVkIG92ZXIgdG8gdGhlIG5ldyBmb3JrZWQgVk0uCj4g
PiA+IFRoaXMgb3BlcmF0aW9uIGlzIGZhc3QgYW5kIGl0IGFsbG93cyB0aGUgZm9ya2VkIFZNIHRv
IGJlIHVucGF1c2VkIGFuZCB0byBiZQo+ID4gPiBtb25pdG9yZWQgYW5kIGFjY2Vzc2VkIHZpYSBW
TUkuIE5vdGUgaG93ZXZlciB0aGF0IHdpdGhvdXQgaXRzIGRldmljZSBtb2RlbAo+ID4gPiBydW5u
aW5nIChkZXBlbmRpbmcgb24gd2hhdCBpcyBleGVjdXRpbmcgaW4gdGhlIFZNKSBpdCBpcyBib3Vu
ZCB0bwo+ID4gPiBtaXNiZWhhdmUvY3Jhc2ggd2hlbiBpdHMgdHJ5aW5nIHRvIGFjY2VzcyBkZXZp
Y2VzIHRoYXQgd291bGQgYmUgZW11bGF0ZWQgYnkKPiA+ID4gUUVNVS4gV2UgYW50aWNpcGF0ZSB0
aGF0IGZvciBjZXJ0YWluIHVzZS1jYXNlcyB0aGlzIHdvdWxkIGJlIGFuIGFjY2VwdGFibGUKPiA+
ID4gc2l0dWF0aW9uLCBpbiBjYXNlIGZvciBleGFtcGxlIHdoZW4gZnV6emluZyBpcyBwZXJmb3Jt
ZWQgb2YgY29kZSBzZWdtZW50cyB0aGF0Cj4gPiA+IGRvbid0IGFjY2VzcyBzdWNoIGRldmljZXMu
Cj4gPiA+Cj4gPiA+IFN0ZXAgMikgaW52b2x2ZXMgbGF1bmNoaW5nIFFFTVUgdG8gc3VwcG9ydCB0
aGUgZm9ya2VkIFZNLCB3aGljaCByZXF1aXJlcyB0aGUKPiA+ID4gUUVNVSBYZW4gc2F2ZWZpbGUg
dG8gYmUgZ2VuZXJhdGVkIG1hbnVhbGx5IGZyb20gdGhlIHBhcmVudCBWTS4gVGhpcyBjYW4gYmUK
PiA+ID4gYWNjb21wbGlzaGVkIHNpbXBseSBieSBjb25uZWN0aW5nIHRvIGl0cyBRTVAgc29ja2V0
IGFuZCBpc3N1aW5nIHRoZQo+ID4gPiAieGVuLXNhdmUtZGV2aWNlcy1zdGF0ZSIgY29tbWFuZCBh
cyBkb2N1bWVudGVkIGJ5IFFFTVU6Cj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUv
YmxvYi9tYXN0ZXIvZG9jcy94ZW4tc2F2ZS1kZXZpY2VzLXN0YXRlLnR4dAo+ID4gPiBPbmNlIHRo
ZSBRRU1VIFhlbiBzYXZlZmlsZSBpcyBnZW5lcmF0ZWQgdGhlIG5ldyAieGwgZm9yay1sYXVuY2gt
ZG0iIGNvbW1hbmQgaXMKPiA+ID4gdXNlZCB0byBsYXVuY2ggUUVNVSBhbmQgbG9hZCB0aGUgc3Bl
Y2lmaWVkIHNhdmVmaWxlIGZvciBpdC4KPiA+Cj4gPiBJTU8gaGF2aW5nIHR3byBkaWZmZXJlbnQg
Y29tbWFuZHMgaXMgY29uZnVzaW5nIGZvciB0aGUgZW5kIHVzZXIsIEkKPiA+IHdvdWxkIHJhdGhl
ciBoYXZlIHNvbWV0aGluZyBsaWtlOgo+ID4KPiA+IHhsIGZvcmstdm0gWy1kXSAuLi4KPiA+Cj4g
PiBXaGVyZSAnLWQnIHdvdWxkIHByZXZlbnQgZm9ya2luZyBhbnkgdXNlci1zcGFjZSBlbXVsYXRv
cnMuIEkgZG9uJ3QKPiA+IHRoaW5rcyB0aGVyZSdzIGEgbmVlZCBmb3IgYSBzZXBhcmF0ZSBjb21t
YW5kIHRvIGZvcmsgdGhlIHVuZGVybHlpbmcKPiA+IHVzZXItc3BhY2UgZW11bGF0b3JzLgo+IAo+
IEtlZXBpbmcgaXQgYXMgdHdvIGNvbW1hbmRzIGFsbG93cyB5b3UgdG8gc3RhcnQgdXAgdGhlIGZv
cmsgYW5kIGxldCBpdAo+IHJ1biBpbW1lZGlhdGVseSBhbmQgb25seSBzdGFydCB1cCBRRU1VIHdo
ZW4geW91IG5vdGljZSBpdCBpcyBuZWVkZWQuCj4gVGhlIGlkZWEgYmVpbmcgdGhhdCB5b3UgY2Fu
IG1vbml0b3IgdGhlIGtlcm5lbCBhbmQgc2VlIHdoZW4gaXQgdHJpZXMKPiB0byBkbyBzb21lIEkv
TyB0aGF0IHdvdWxkIHJlcXVpcmUgdGhlIFFFTVUgYmFja2VuZC4gSWYgeW91IGNvbWJpbmUgdGhl
Cj4gY29tbWFuZHMgdGhhdCBvcHRpb24gZ29lcyBhd2F5LgoKSSdtIG5vdCBzdXJlIEkgc2VlIHdo
eSwgeW91IGNvdWxkIHN0aWxsIHByb3ZpZGUgYSBgeGwgZm9yay12bSBbLWNdCi4uLmAgdGhhdCB3
b3VsZCBqdXN0IGx1bmNoIGEgUUVNVSBpbnN0YW5jZS4gRW5kIHVzZXJzIHVzaW5nIHhsIGhhdmUK
QUZBSUNUIG5vIHdheSB0byB0ZWxsIHdoZXRoZXIgb3Igd2hlbiBhIFFFTVUgaXMgbmVlZGVkIG9y
IG5vdCwgYW5kCmhlbmNlIHRoZSBkZWZhdWx0IGJlaGF2aW9yIHNob3VsZCBiZSBhIGZ1bGx5IGZ1
bmN0aW9uYWwgb25lLgoKSU1PIEkgdGhpbmsgZm9yay12bSB3aXRob3V0IGFueSBvcHRpb25zIHNo
b3VsZCBkbyBhIGNvbXBsZXRlIGZvcmsgb2YgYQpWTSwgcmF0aGVyIHRoYW4gYSBwYXJ0aWFsIG9u
ZSB3aXRob3V0IGEgZGV2aWNlIG1vZGVsIGNsb25lLgoKPiBBbHNvLCBRRU1VIGl0c2VsZiBpc24n
dCBnZXR0aW5nIGZvcmtlZAo+IHJpZ2h0IG5vdywgd2UganVzdCBzdGFydCBhIG5ldyBRRU1VIHBy
b2Nlc3Mgd2l0aCB0aGUgc2F2ZWQtc3RhdGUKPiBnZXR0aW5nIGxvYWRlZCBpbnRvIGl0LiBJIGxv
b2tlZCBpbnRvIGltcGxlbWVudGluZyBhIFFFTVUgZm9yayBjb21tYW5kCj4gYnV0IGl0IHR1cm5z
IG91dCB0aGF0IGZvciB0aGUgdmFzdCBtYWpvcml0eSBvZiBvdXIgdXNlLWNhc2VzIFFFTVUKPiBp
c24ndCBuZWVkZWQgYXQgYWxsLCBzbyBkZXZlbG9waW5nIHRoYXQgYWRkaXRpb24gd2FzIHRhYmxl
ZC4KClN0YXJ0aW5nIGEgbmV3IHByb2Nlc3Mgd2l0aCB0aGUgc2F2ZWQtc3RhdGUgbG9va3MgZmlu
ZSB0byBtZSwgaXQgY2FuCmFsd2F5cyBiZSBpbXByb3ZlZCBhZnRlcndhcmRzIGlmIHRoZXJlJ3Mg
YSBuZWVkIGZvciBpdC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
