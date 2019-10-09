Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C4ED10B7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 16:00:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iICSX-0004r8-Kd; Wed, 09 Oct 2019 13:56:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LyQK=YC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iICSV-0004r3-N7
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 13:56:55 +0000
X-Inumbo-ID: a63d70de-ea9c-11e9-8c93-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a63d70de-ea9c-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570629414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iVLNnj85OIjaYl8TLjZfqs2/w/6at66OAFjz/cEK4+o=;
 b=AxoJDO5BAmMwfutPjBgWzrkwNcW6sXGO/z6N1/uGFRd8XPACNG2pOeah
 84uRjQr9JLs91k0E2eUIj4v3nvwLbhMeJKqs2m1dRzgVzZTXtMCITwTFd
 9cVSxdXb1AlCr62W2+OIYAdjo5cp2yErwxkQP7NYqDizKr4Q6FTBt6A+y Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UsnsPuvgevKqgzgJ9SoOThUv5XR7hPU5jwDw8jxzCUAelOo2TK5nrJcnJcWFoew4LpgBm8e4nx
 znuS4JC5W04f9enXxdsTKono0DJzBZcP/vE7ga2k2Ymu4WHmE/wBGAP5CbLMlW55NZrv3w7cPc
 o+xWLE0fDgieqISovpRON6M83ILyPNpcArbHldNtIXJIg9YdIz3B8DqIMn0+4zUIde1HU0w756
 IH4vKH5Pz/FeszXwsYWeZC5tgcqIA08UtnTQPxxsMgwVTXd2hXVLsZCmBhLvhNBzgzX67DSUB+
 Kec=
X-SBRS: 2.7
X-MesageID: 7044454
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,276,1566878400"; 
   d="scan'208";a="7044454"
Date: Wed, 9 Oct 2019 15:56:45 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191009135645.GD1389@Air-de-Roger.citrite.net>
References: <09d5e0bc-074e-90c5-f0a6-60e1be23d92f@citrix.com>
 <67e9bc2c-82dc-5fd7-9b8c-29d564a30ddb@suse.com>
 <20191009101116.GA1389@Air-de-Roger.citrite.net>
 <dd2b5da6-e1fc-a490-9276-8ad44721fa9e@suse.com>
 <20191009112927.GC1389@Air-de-Roger.citrite.net>
 <6a7fb887-84cf-cc1d-011d-f2adab4083fa@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a7fb887-84cf-cc1d-011d-f2adab4083fa@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] HPET interrupt remapping during boot
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMDI6MDM6MTJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDkuMTAuMjAxOSAxMzoyOSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBXZWQsIE9jdCAwOSwgMjAxOSBhdCAxMjo0MTowNVBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwOS4xMC4yMDE5IDEyOjExLCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+
Pj4gQW5kIGl0IGRvZXMgcHJpbnQgdGhlIGZvbGxvd2luZyB3aGVuIHNldHRpbmcgdXAgdGhlIGlv
bW11Ogo+ID4+Pgo+ID4+PiAoWEVOKSBpb2FwaWMgMCBwaW4gMCBub3QgbWFza2VkCj4gPj4+IChY
RU4pIHZlYz0wMCBkZWxpdmVyeT1FeElOVCBkZXN0PVAgc3RhdHVzPTAgcG9sYXJpdHk9MCBpcnI9
MCB0cmlnPUUgbWFzaz0wIGRlc3RfaWQ6MDAwMTAwMDAKPiA+Pj4KPiA+Pj4gSSB3b25kZXIsIHNo
b3VsZG4ndCBhbGwgcGlucyBvZiBhbGwgdGhlIGlvLWFwaWNzIGJlIG1hc2tlZCBhdCBib290Pwo+
ID4+Cj4gPj4gSSB0aGluayB5b3UgbWlnaHQgZ2V0IGRpZmZlcmVudCBhbnN3ZXJzIGhlcmUgZGVw
ZW5kaW5nIG9uIHdoZXRoZXIKPiA+PiB5b3UgYXNrIGZpcm13YXJlIG9yIE9TIHBlb3BsZS4gSW4g
ZmFjdCB0aGVyZSBhcmUgY2FzZXMgd2hlcmUgdGhlCj4gPj4gSU8tQVBJQyBuZWVkcyB0byBiZSBs
ZWZ0IGluIHRoaXMgc3RhdGUsIEkgdGhpbmssIGJ1dCBzdWNoIHdvdWxkCj4gPj4gbGlrZWx5IG5l
ZWQgcHJvcGVybHkgcmVmbGVjdGluZyBpbiBBQ1BJIHRhYmxlcyAoYWxiZWl0IEkgZG9uJ3QKPiA+
PiBrbm93L3JlY2FsbCBob3cgdGhpcyB3b3VsZCBiZSBkb25lOyBsb29raW5nIGF0IHRoZSBjb2Rl
ICkuIFRoaXMgZ29lcyBiYWNrIHRvIHRpbWVzCj4gPj4gd2hlbiBJTy1BUElDcyB3ZXJlIG5ldyBh
bmQgT1NlcyB3b3VsZCBub3QgZXZlbiBrbm93IGFib3V0IHRoZW0sCj4gPj4geWV0IHRoZXkgd291
bGRuJ3QgZ2V0IGFueSBpbnRlcnJ1cHRzIHRvIHdvcmsgaWYgZmlkZGxpbmcgd2l0aAo+ID4+IG9u
bHkgdGhlIFBJQyAoc2l0dGluZyBiZWhpbmQgSU8tQVBJQyBwaW4gMCkuCj4gPj4KPiA+PiBTZWUg
ZW5hYmxlX0lPX0FQSUMoKSwgd2hlcmUgd2UgYWN0dWFsbHkgdXNlIHRoaXMgcHJvcGVydHkgdG8K
PiA+PiBkZXRlcm1pbmUgdGhlIHBpbiBiZWhpbmQgd2hpY2ggdGhlIDgyNTkgc2l0cy4KPiA+Pgo+
ID4+IEkndmUgc2VlbiBxdWl0ZSBtYW55IHN5c3RlbXMgd2hlcmUgaW4gdGhlIEJJT1Mgc2V0dXAg
eW91IGhhdmUgYW4KPiA+PiBvcHRpb24gdG8gc2VsZWN0IHdoZXRoZXIgeW91IGhhdmUgYW4gIkFD
UEkgT1MiICh3b3JkaW5nIG9mIGNvdXJzZQo+ID4+IHZhcmllcykuIEkndmUgbmV2ZXIgY2hlY2tl
ZCB3aGV0aGVyIHRoaXMgbWF5IGUuZy4gcmVmbGVjdCBpdHNlbGYKPiA+PiBpbiB0aGUgaGFuZG92
ZXIgc3RhdGUgb2YgdGhlIEdTSSAwIFJURS4KPiA+Pgo+ID4+IEluIHlvdXIgdGVzdGluZyBwYXRj
aCwgY291bGQgeW91IGFsc28gbG9nIHRoZSBQSUMgbWFzayBieXRlcz8KPiA+PiBUaGVyZSBvdWdo
dCB0byBiZSBhdCBsZWFzdCBvbmUgdW5tYXNrZWQ7IG9yIHdhaXQgLSB0aGVyZSBhY3R1YWxseQo+
ID4+IGlzIGEgc3B1cmlvdXMgaW50ZXJydXB0IHRoZXJlIChyaWdodCBiZWZvcmUgSU9NTVUgaW5p
dGlhbGl6YXRpb24pOgo+ID4+Cj4gPj4gKFhFTikgc3B1cmlvdXMgODI1OUEgaW50ZXJydXB0OiBJ
UlE3Lgo+ID4gCj4gPiBTbyBJJ3ZlIGFkZGVkIGEgbG9nIG9mIHRoZSBQSUMgbWFza3MganVzdCBi
ZWZvcmUgY2hlY2tpbmcgdGhlIGlvYXBpYwo+ID4gbWFza3M6Cj4gPiAKPiA+IChYRU4pIDgyNTlB
LTEgbWFzazogZmUgODI1OUEtMiBtYXNrOiBmZgo+ID4gCj4gPiBBRkFJQ1QgSVJRNyBzZWVtcyB0
byBiZSB1bm1hc2tlZD8gU29ycnkgbXkga25vd2xlZGdlIG9mIFBJQ3MgaXMgcXVpdGUKPiA+IGxp
bWl0ZWQgc2luY2UgSSd2ZSBuZXZlciBoYWQgdG8gZGVhbCB3aXRoIHRoZW0uCj4gCj4gVGhhdCdz
IElSUTAgdGhlbiB3aGljaCBpcyB1bm1hc2tlZC4gQXMgc2FpZCB0aGUgc3B1cmlvdXMgb25lCj4g
KElSUTcpIGNhbid0IGJlIG1hc2tlZCAoYXQgdGhlIFBJQyk7IG9ubHkgdGhlICJub3JtYWwiIElS
UTcgY2FuCj4gYmUuCj4gCj4gPiBUaGUgbGluZSBJJ3ZlIGFkZGVkIGlzOgo+ID4gCj4gPiBwcmlu
dGsoIjgyNTlBLTEgbWFzazogJXggODI1OUEtMiBtYXNrOiAleFxuIiwgaW5iKDB4MjEpLCBpbmIo
MHhBMSkpOwo+ID4gCj4gPiBJIHdvbmRlciB3aHkgZG9lcyBYZW4gZXZlbiBoYXMgYW55IGNvZGUg
dG8gZGVhbCB3aXRoIHRoZSBQSUNzLAo+ID4gc2hvdWxkbid0IHdlIHJlbHkgb24gaW8tYXBpY3Mg
b25seSBmb3IgbGVnYWN5IGRlbGl2ZXJ5Pwo+IAo+IFRoZXJlIGFyZSAod2VyZT8pIHN5c3RlbXMg
d2hlcmUgdGhpbmdzIHdvdWxkbid0IHdvcmsgd2l0aG91dC4KPiAKPiA+PiBIZW5jZSBJIHdvbmRl
ciBpZiB0aGVyZSdzIG5vdCBwb3NzaWJseSBhIDJuZCBvbmUgb25jZSB0aGUgSU9NTVUKPiA+PiBo
YXMgYmVlbiBzZXQgdXAuCj4gPiAKPiA+IFJpZ2h0LCB0aGVuIEkgZ3Vlc3Mgd2UgZWl0aGVyIG1h
c2sgYWxsIHRoZSBpby1hcGljIHBpbnMgb3Igd2Ugc2V0dXAKPiA+IHByb3BlciByZW1hcHBpbmcg
ZW50cmllcyBmb3Igbm9uLW1hc2tlZCBwaW5zPyAoaW4gb3JkZXIgdG8gYXZvaWQgaW9tbXUKPiA+
IGZhdWx0cykKPiAKPiBNYWtpbmcgdGhlIEV4dEludCBlbnRyeSBpcyBhdCBsZWFzdCB3b3J0aCBh
biBleHBlcmltZW50LCB0bwo+IChob3BlZnVsbHkpIGNvbmZpcm0gdGhhdCB0aGlzIHdvdWxkIHRh
a2UgY2FyZSBvZiB0aGUgSU9NTVUKPiBmYXVsdC4gQnV0IEknbSBhZnJhaWQgKGFzIHBlciBhYm92
ZSkgaXQncyBub3QgYW4gb3B0aW9uIGluCj4gZ2VuZXJhbC4gV2hhdCBJIGNvdWxkIHNlZSB1cyBk
b2luZyBpcyBtYXNrIHRoZSBlbnRyeSBpZiBhbGwKPiBsZWdhY3kgSVJRcyBhcmUgaGFuZGxlZCB0
aHJvdWdoIHRoZSBJTy1BUElDLiBUaGlzIHdvdWxkIHRha2UKPiBjYXJlIG9mIHNwdXJpb3VzIGlu
dGVycnVwdHMsIGFzIHRoZXNlIGFyZSB0aGUgb25seSBvbmVzCj4gd2hpY2ggY2FuIG1ha2UgaXQg
dGhyb3VnaCB3aGVuIHRoZSBQSUMgbWFzayBiaXRzIGFyZSBhbGwgc2V0Lgo+IEhvd2V2ZXIsIG1h
eWJlIGl0IGlzIGxlZ2l0aW1hdGUgdG8gbWFzayB0aGUgRXh0SW50IGVudHJ5Cj4gd2hlbiBhbiBJ
T01NVSBjb21lcyBpbnRvIHBsYXkuCgpUaGF0IHdhcyBteSB0aGlua2luZywgaWU6IG1ha2Ugc3Vy
ZSBldmVyeSBpby1hcGljIHBpbiBpcyBtYXNrZWQgYmVmb3JlCmVuYWJsaW5nIGlvbW11IGludGVy
cnVwdCByZW1hcHBpbmcuIE5vdGhpbmcgdXNlZnVsIGNhbiBoYXBwZW4gb2YKaGF2aW5nIGlvLWFw
aWMgcGlucyB1bm1hc2tlZCwgYXMgdGhlIHJlbWFwcGluZyBpcyBub3Qgc2V0dXAgYW55d2F5LgpJ
Zi93aGVuIHRob3NlIHBpbnMgZ2V0IHVzZWQgYSBwcm9wZXIgcmVtYXBwaW5nIGVudHJ5IGlzIGdv
aW5nIHRvIGJlCnNldHVwLCBhbmQgdGhlIHBpbiB3b3VsZCB0aGVuIGJlIHVubWFza2VkLgoKPiBB
cyB0byAicHJvcGVyIiByZW1hcHBpbmcgZW50cmllczogSSdsbCBoYXZlIHRvIGxvb2sgYXQgdGhl
Cj4gc3BlYyB3aGF0IHRoZXkgc2F5IGFib3V0IHRoaXMuIFRoZXJlJ3Mgb25seSBvbmUgSVJUIGlu
ZGV4Cj4gdGhhdCB3ZSBjYW4gcHV0IGluIHRoZSBSVEUsIHlldCB0aGlzIHdvdWxkIG5lZWQgdG8g
c2VydmUgYWxsCj4gMTUgSVJRcyBwb3RlbnRpYWxseSBjb21pbmcgdGhyb3VnaCB0aGUgUElDLiBS
ZWNhbGwgdGhhdCB0aGUKPiB2ZWN0b3IgZ2V0cyBzdXBwbGllZCBieSB0aGUgUElDIGluIHRoZSBF
eHRJbnQgY2FzZSwgbm90IGJ5Cj4gdGhlIElPLUFQSUMgUlRFLgoKWW91IGNhbiBzZXQgdGhlIGRl
bGl2ZXJ5IG1vZGUgb2YgdGhlIElSVEUgdG8gRXh0SU5ULCBtdWNoIGxpa2UgaG93IHRoaXMKaXMg
ZG9uZSBvbiB0aGUgaW8tYXBpYywgYW5kIHRoZW4gcG9rZSB0aGUgUElDIHRvIGZpZ3VyZSBvdXQg
d2hpY2ggSVJRCnRyaWdnZXJlZD8KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
