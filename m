Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC851357E9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 12:26:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipVvM-0006wA-Ne; Thu, 09 Jan 2020 11:24:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yNyl=26=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipVvK-0006w4-HN
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 11:24:22 +0000
X-Inumbo-ID: 9014e1d8-32d2-11ea-ac27-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9014e1d8-32d2-11ea-ac27-bc764e2007e4;
 Thu, 09 Jan 2020 11:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578569053;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6ES4Ts9ZvTOyIDhOm8rj31O1t8CwdRGa/De3i1ud/pM=;
 b=WSf02/9qgUJpeaO6y+EHVW9HYszSbv4ItPw0OENL6CnjscjPY8ch3U6l
 IfrHHChErTpDNZB2txAYeSLBTs3sXsbYZH7WHMPmt/pjB/wZITV98+Fgy
 X/eE39Bsd1fJybR6TNfI/5uqaWvr9dHUckTcQzCYtpQ/3cG3dnMeEvztT k=;
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
IronPort-SDR: rFVfMACi1DB6viumUg9oEGN9XgnZs9Nh4J0DTjNtuUZd4WHDjFjZ36Rx4lyoXjNk1Wg2ZHyT2p
 /Sng7OH8fh6PSsW++fMPUJiZc8Otm2uJoFTymlOf0PtWRVmrEyIAzNrbIKjMzWwEyVcJgCtGYr
 OkdqEA4tRqJuUcfju+XxbgScDrckNCMhsjJi6DtlgocJzXmgE6mRQQfXJavn64D8H0IelRoWoO
 rtm/nwy1GKSiZ7R4EBLg8Lg/ZTDZve3KX0QIwz7ZLzSnCtqYvPaCLjIHsiNYEg1HOPJw4kw5Ly
 A44=
X-SBRS: 2.7
X-MesageID: 10661920
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,413,1571716800"; d="scan'208";a="10661920"
Date: Thu, 9 Jan 2020 12:24:05 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200109112405.GA11756@Air-de-Roger>
References: <20191224124453.47183-1-roger.pau@citrix.com>
 <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
 <20200103123409.GM11756@Air-de-Roger>
 <57fe475e-c102-19a0-c2dd-8382046f1907@suse.com>
 <20200108132819.GO11756@Air-de-Roger>
 <fc2390d0-b475-84c6-d76a-881f73cd288e@suse.com>
 <20200108181445.GV11756@Air-de-Roger>
 <eab75a49-da7b-c611-2eca-ea4a322dc1e1@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eab75a49-da7b-c611-2eca-ea4a322dc1e1@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/flush: use APIC ALLBUT destination
 shorthand when possible
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
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDksIDIwMjAgYXQgMTA6NDM6MDFBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDguMDEuMjAyMCAxOToxNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgSmFuIDA4LCAyMDIwIGF0IDAyOjU0OjU3UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDA4LjAxLjIwMjAgMTQ6MzAsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+ID4+
PiBPbiBGcmksIEphbiAwMywgMjAyMCBhdCAwMTo1NTo1MVBNICswMTAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+Pj4+IE9uIDAzLjAxLjIwMjAgMTM6MzQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4gPj4+Pj4gT24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDE6MDg6MjBQTSArMDEwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4+Pj4+IE9uIDI0LjEyLjIwMTkgMTM6NDQsIFJvZ2VyIFBhdSBNb25u
ZSB3cm90ZToKPiA+Pj4+Pj4gRnVydGhlciBhIHF1ZXN0aW9uIG9uIGxvY2sgbmVzdGluZzogU2lu
Y2UgdGhlIGNvbW1pdCBtZXNzYWdlCj4gPj4+Pj4+IGRvZXNuJ3Qgc2F5IGFueXRoaW5nIGluIHRo
aXMgcmVnYXJkLCBkaWQgeW91IGNoZWNrIHRoZXJlIGFyZSBubwo+ID4+Pj4+PiBUTEIgZmx1c2gg
aW52b2NhdGlvbnMgd2l0aCB0aGUgZ2V0X2NwdV9tYXBzKCkgbG9jayBoZWxkPwo+ID4+Pj4+Cj4g
Pj4+Pj4gVGhlIENQVSBtYXBzIGxvY2sgaXMgYSByZWN1cnNpdmUgb25lLCBzbyBpdCBzaG91bGQg
YmUgZmluZSB0byBhdHRlbXB0Cj4gPj4+Pj4gYSBUTEIgZmx1c2ggd2l0aCB0aGUgbG9jayBhbHJl
YWR5IGhlbGQuCj4gPj4+Pgo+ID4+Pj4gV2hlbiBhbHJlYWR5IGhlbGQgYnkgdGhlIHNhbWUgQ1BV
IC0gc3VyZS4gSXQgYmVpbmcgYSByZWN1cnNpdmUKPiA+Pj4+IG9uZSAod2hpY2ggSSBwYWlkIGF0
dGVudGlvbiB0byB3aGVuIHdyaXRpbmcgbXkgZWFybGllciByZXBseSkKPiA+Pj4+IGRvZXNuJ3Qg
bWFrZSBpdCAodG9nZXRoZXIgd2l0aCBhbnkgb3RoZXIgb25lKSBpbW11bmUgYWdhaW5zdAo+ID4+
Pj4gQUJCQSBkZWFkbG9ja3MsIHRob3VnaC4KPiA+Pj4KPiA+Pj4gVGhlcmUncyBubyBwb3NzaWJp
bGl0eSBvZiBhIGRlYWRsb2NrIGhlcmUgYmVjYXVzZSBnZXRfY3B1X21hcHMgZG9lcyBhCj4gPj4+
IHRyeWxvY2ssIHNvIGlmIGFub3RoZXIgY3B1IGlzIGhvbGRpbmcgdGhlIGxvY2sgdGhlIGZsdXNo
IHdpbGwganVzdAo+ID4+PiBmYWxsYmFjayB0byBub3QgdXNpbmcgdGhlIHNob3J0aGFuZC4KPiA+
Pgo+ID4+IFdlbGwsIHdpdGggdGhlIF9leGFjdF8gYXJyYW5nZW1lbnRzIChmbHVzaF9sb2NrIHVz
ZWQgb25seSBpbiBvbmUKPiA+PiBwbGFjZSwgYW5kIGNwdV9hZGRfcmVtb3ZlX2xvY2sgb25seSB1
c2VkIGluIHdheXMgc2ltaWxhciB0byBob3cgaXQKPiA+PiBpcyB1c2VkIG5vdyksIHRoZXJlJ3Mg
bm8gc3VjaCByaXNrLCBJIGFncmVlLiBCdXQgdGhlcmUncyBub3RoaW5nCj4gPj4gYXQgYWxsIG1h
a2luZyBzdXJlIHRoaXMgZG9lc24ndCBjaGFuZ2UuIEhlbmNlLCBhcyBzYWlkLCBhdCB0aGUgdmVy
eQo+ID4+IGxlYXN0IHRoaXMgbmVlZHMgcmVhc29uaW5nIGFib3V0IGluIHRoZSBkZXNjcmlwdGlv
biAob3IgYSBjb2RlCj4gPj4gY29tbWVudCkuCj4gPiAKPiA+IEknbSBhZnJhaWQgeW91IHdpbGwg
aGF2ZSB0byBiZWFyIHdpdGggbWUsIGJ1dCBJJ20gc3RpbGwgbm90IHN1cmUgaG93Cj4gPiB0aGUg
YWRkaXRpb24gb2YgZ2V0X2NwdV9tYXBzIGluIGZsdXNoX2FyZWFfbWFzayBjYW4gbGVhZCB0byBk
ZWFkbG9ja3MuCj4gPiBBcyBzYWlkIGFib3ZlIGdldF9jcHVfbWFwcyBkb2VzIGEgdHJ5bG9jaywg
d2hpY2ggbWVhbnMgdGhhdCBpdCB3aWxsCj4gPiBuZXZlciBkZWFkbG9jaywgYW5kIHRoYXQncyB0
aGUgb25seSB3YXkgdG8gbG9jayBjcHVfYWRkX3JlbW92ZV9sb2NrLgo+IAo+IFRoYXQncyB3aHkg
SSBzYWlkICJjcHVfYWRkX3JlbW92ZV9sb2NrIG9ubHkgdXNlZCBpbiB3YXlzIHNpbWlsYXIgdG8K
PiBob3cgaXQgaXMgdXNlZCBub3ciIC0gYW55IG5vbi10cnlsb2NrIGFkZGl0aW9uIHdvdWxkIGJy
ZWFrIHRoZQo+IGFzc3VtcHRpb25zIHlvdSBtYWtlIGFmYWljdC4gQW5kIHlvdSBjYW4ndCByZWFs
bHkgZXhwZWN0IHBlb3BsZQo+IGFkZGluZyBhbm90aGVyIChzbGlnaHRseSBkaWZmZXJlbnQpIHVz
ZSBvZiBhbiBleGlzdGluZyBsb2NrIHRvIGJlCj4gYXdhcmUgdGhleSBub3cgbmVlZCB0byBjaGVj
ayB3aGV0aGVyIHRoaXMgaW50cm9kdWNlcyBkZWFkbG9jawo+IHNjZW5hcmlvcyBvbiB1bnJlbGF0
ZWQgcHJlLWV4aXN0aW5nIGNvZGUgcGF0aHMuIEhlbmNlIG15IHJlcXVlc3QgdG8KPiBhdCBsZWFz
dCBkaXNjdXNzIHRoaXMgaW4gdGhlIGRlc2NyaXB0aW9uIChyYWlzaW5nIGF3YXJlbmVzcywgYW5k
Cj4gaGVuY2UgYWxsb3dpbmcgcmV2aWV3ZXJzIHRvIGp1ZGdlIHdoZXRoZXIgZnVydGhlciBwcmVj
YXV0aW9uYXJ5Cj4gbWVhc3VyZXMgc2hvdWxkIGJlIHRha2VuKS4KClRoYW5rcyBmb3IgdGhlIGNs
YXJpZmljYXRpb24sIEkgZGlkIGluZGVlZCBtaXN1bmRlcnN0b29kIHlvdXIKY29tcGxhaW4uCgpS
ZWdhcmRpbmcgdGhlIGdlbmVyYWxpemF0aW9uIG9mIHRoZSBzaG9ydGhhbmQgYW5kIGludGVncmF0
aW9uIGludG8Kc2VuZF9JUElfbWFzaywgSSd2ZSBmb3VuZCBhbiBpc3N1ZSByZWxhdGVkIHRvIGxv
Y2tpbmcuIHNlbmRfSVBJX21hc2sKaXMgY2FsbGVkIHdpdGggYm90aCBpbnRlcnJ1cHRzIGVuYWJs
ZWQgYW5kIGRpc2FibGVkLCBhbmQgc28KZ2V0X2NwdV9tYXBzIHBhbmljcyBiZWNhdXNlIG9mIHRo
ZSBsb2NrIGNoZWNraW5nLgoKSSBob3dldmVyIGRvbid0IHRoaW5rIHRoYXQgc3VjaCBwYW5pYyBp
cyBhY2N1cmF0ZTogdGhlIGxvZ2ljIGluCmNoZWNrX2xvY2sgc3BlY2lmaWNhbGx5IHJlbGF0ZXMg
dG8gdGhlIHNwaW5uaW5nIGRvbmUgd2hlbiBwaWNraW5nIGEKbG9jaywgYnV0IEkgd291bGQgc2F5
IHRoZSBjYWxsIHRvIGNoZWNrX2xvY2sgaW4KX3NwaW5fdHJ5bG9ja3tfcmVjdXJzaXZlfSBpcyBu
b3Qgc3RyaWN0bHkgbmVlZGVkLCB0aGUgc2NlbmFyaW8KZGVzY3JpYmVkIGluIGNoZWNrX2xvY2sg
ZG9lc24ndCBhcHBseSB3aGVuIHVzaW5nIHRyeWxvY2suCgpTbyBteSBxdWVzdGlvbiBpcyB3aGV0
aGVyIHlvdSB3b3VsZCBiZSBPSyB0byByZW1vdmUgdGhlIGNhbGxzIHRvCmNoZWNrX2xvY2sgaW4g
dGhlIHRyeWxvY2sgdmFyaWFudHMsIG9yIHdvdWxkIHlvdSByYXRoZXIga2VlcCB0aGUKc2hvcnRo
YW5kIHVzYWdlIGxpbWl0ZWQgdG8gZmx1c2hfYXJlYV9tYXNrLgoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
