Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C145166157
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 16:48:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4o1E-00032t-4g; Thu, 20 Feb 2020 15:45:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4o1C-00032o-5k
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:45:38 +0000
X-Inumbo-ID: 08bf2cce-53f8-11ea-855d-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08bf2cce-53f8-11ea-855d-12813bfff9fa;
 Thu, 20 Feb 2020 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582213536;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Hf2jfb9piSiHju6Ntp+FvddJlG4b1AFVZOCjx1jkZss=;
 b=Qmuf/Xrp4UXYymWQ2h/clPw8NoSfx150gmhKIT068jN/FTbRrbRPLx0x
 L8KpeFGsfNw8Jx4ghpbSvslWa+CFrIWXHaXD92PdzvnZmK9mZMFOwJqCb
 xDuyvDx3j0PklYQ/gx9Txo9Won0gY+TvnVZ1HGS0fLNiMIeBlc1/iJa8+ M=;
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
IronPort-SDR: ZHDdixRenlbATRuHBknsZwWZz7xs0v0NuFZmuADao7Vcj1Y3cpXV28Hpg3tWGHyzoPqbmMUbpn
 3RODTM7jZRSgjsyQkTF3P48v+0IReUEWZ/qXIH4g3s1pEH2JtscssVMtFiFSbpoQgfNeWqCMkb
 0q7nIJ3+Peu47qKTW6NylrFNYzp5kHsYcD7w38iuUDqhFLh6hPmlWZvuKSAUdEpuUKProKqZLy
 qQu+6xMWY0Wg+XDKCXpD16MdjYaSofKLq9wdY7VLTpLCCcAeTgGxcwP8wx9THTPwEkScIK6usq
 D9s=
X-SBRS: 2.7
X-MesageID: 12745476
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="12745476"
Date: Thu, 20 Feb 2020 16:45:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200220154507.GO4679@Air-de-Roger>
References: <cover.1581721799.git.anchalag@amazon.com>
 <890c404c585d7790514527f0c021056a7be6e748.1581721799.git.anchalag@amazon.com>
 <20200217100509.GE4679@Air-de-Roger>
 <20200217230553.GA8100@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200218091611.GN4679@Air-de-Roger>
 <20200219180424.GA17584@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200220083904.GI4679@Air-de-Roger>
 <f986b845491b47cc8469d88e2e65e2a7@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f986b845491b47cc8469d88e2e65e2a7@EX13D32EUC003.ant.amazon.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [RFC PATCH v3 06/12] xen-blkfront: add callbacks
 for PM suspend and hibernation
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
Cc: "Valentin, Eduardo" <eduval@amazon.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "x86@kernel.org" <x86@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "len.brown@intel.com" <len.brown@intel.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "Agarwal,
 Anchal" <anchalag@amazon.com>, "bp@alien8.de" <bp@alien8.de>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDg6NTQ6MzZBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBYZW4tZGV2ZWwg
PHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YKPiA+
IFJvZ2VyIFBhdSBNb25uw6kKPiA+IFNlbnQ6IDIwIEZlYnJ1YXJ5IDIwMjAgMDg6MzkKPiA+IFRv
OiBBZ2Fyd2FsLCBBbmNoYWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+Cj4gPiBDYzogVmFsZW50aW4s
IEVkdWFyZG8gPGVkdXZhbEBhbWF6b24uY29tPjsgbGVuLmJyb3duQGludGVsLmNvbTsKPiA+IHBl
dGVyekBpbmZyYWRlYWQub3JnOyBiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc7IHg4NkBrZXJuZWwu
b3JnOyBsaW51eC0KPiA+IG1tQGt2YWNrLm9yZzsgcGF2ZWxAdWN3LmN6OyBocGFAenl0b3IuY29t
OyB0Z2x4QGxpbnV0cm9uaXguZGU7Cj4gPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBmbGxpbmRl
bkBhbWFvem4uY29tOyBLYW1hdGEsIE11bmVoaXNhCj4gPiA8a2FtYXRhbUBhbWF6b24uY29tPjsg
bWluZ29AcmVkaGF0LmNvbTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOwo+ID4gU2lu
Z2gsIEJhbGJpciA8c2JsYmlyQGFtYXpvbi5jb20+OyBheGJvZUBrZXJuZWwuZGs7Cj4gPiBrb25y
YWQud2lsa0BvcmFjbGUuY29tOyBicEBhbGllbjguZGU7IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUu
Y29tOwo+ID4gamdyb3NzQHN1c2UuY29tOyBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1w
bUB2Z2VyLmtlcm5lbC5vcmc7Cj4gPiByandAcmp3eXNvY2tpLm5ldDsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgdmt1em5ldHNAcmVkaGF0LmNvbTsKPiA+IGRhdmVtQGRhdmVtbG9mdC5u
ZXQ7IFdvb2Rob3VzZSwgRGF2aWQgPGR3bXdAYW1hem9uLmNvLnVrPgo+ID4gU3ViamVjdDogUmU6
IFtYZW4tZGV2ZWxdIFtSRkMgUEFUQ0ggdjMgMDYvMTJdIHhlbi1ibGtmcm9udDogYWRkIGNhbGxi
YWNrcwo+ID4gZm9yIFBNIHN1c3BlbmQgYW5kIGhpYmVybmF0aW9uCj4gPiAKPiA+IFRoYW5rcyBm
b3IgdGhpcyB3b3JrLCBwbGVhc2Ugc2VlIGJlbG93Lgo+ID4gCj4gPiBPbiBXZWQsIEZlYiAxOSwg
MjAyMCBhdCAwNjowNDoyNFBNICswMDAwLCBBbmNoYWwgQWdhcndhbCB3cm90ZToKPiA+ID4gT24g
VHVlLCBGZWIgMTgsIDIwMjAgYXQgMTA6MTY6MTFBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToKPiA+ID4gPiBPbiBNb24sIEZlYiAxNywgMjAyMCBhdCAxMTowNTo1M1BNICswMDAwLCBB
bmNoYWwgQWdhcndhbCB3cm90ZToKPiA+ID4gPiA+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDEx
OjA1OjA5QU0gKzAxMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIEZy
aSwgRmViIDE0LCAyMDIwIGF0IDExOjI1OjM0UE0gKzAwMDAsIEFuY2hhbCBBZ2Fyd2FsIHdyb3Rl
Ogo+ID4gPiA+ID4gUXVpZXNjaW5nIHRoZSBxdWV1ZSBzZWVtZWQgYSBiZXR0ZXIgb3B0aW9uIGhl
cmUgYXMgd2Ugd2FudCB0byBtYWtlCj4gPiBzdXJlIG9uZ29pbmcKPiA+ID4gPiA+IHJlcXVlc3Rz
IGRpc3BhdGNoZXMgYXJlIHRvdGFsbHkgZHJhaW5lZC4KPiA+ID4gPiA+IEkgc2hvdWxkIGFjY2Vw
dCB0aGF0IHNvbWUgb2YgdGhlc2Ugbm90aW9uIGlzIGJvcnJvd2VkIGZyb20gaG93IG52bWUKPiA+
IGZyZWV6ZS91bmZyZWV6ZQo+ID4gPiA+ID4gaXMgZG9uZSBhbHRob3VnaCBpdHMgbm90IGFwcGxl
IHRvIGFwcGxlIGNvbXBhcmlzb24uCj4gPiA+ID4KPiA+ID4gPiBUaGF0J3MgZmluZSwgYnV0IEkg
d291bGQgc3RpbGwgbGlrZSB0byByZXF1ZXN0cyB0aGF0IHlvdSB1c2UgdGhlIHNhbWUKPiA+ID4g
PiBsb2dpYyAoYXMgbXVjaCBhcyBwb3NzaWJsZSkgZm9yIGJvdGggdGhlIFhlbiBhbmQgdGhlIFBN
IGluaXRpYXRlZAo+ID4gPiA+IHN1c3BlbnNpb24uCj4gPiA+ID4KPiA+ID4gPiBTbyB5b3UgZWl0
aGVyIGFwcGx5IHRoaXMgZnJlZXplL3VuZnJlZXplIHRvIHRoZSBYZW4gc3VzcGVuc2lvbiAoYW5k
Cj4gPiA+ID4gZHJvcCB0aGUgcmUtaXNzdWluZyBvZiByZXF1ZXN0cyBvbiByZXN1bWUpIG9yIGFk
YXB0IHRoZSBzYW1lIGFwcHJvYWNoCj4gPiA+ID4gYXMgdGhlIFhlbiBpbml0aWF0ZWQgc3VzcGVu
c2lvbi4gS2VlcGluZyB0d28gY29tcGxldGVseSBkaWZmZXJlbnQKPiA+ID4gPiBhcHByb2FjaGVz
IHRvIHN1c3BlbnNpb24gLyByZXN1bWUgb24gYmxrZnJvbnQgaXMgbm90IHN1aXRhYmxlIGxvbmcK
PiA+ID4gPiB0ZXJtLgo+ID4gPiA+Cj4gPiA+IEkgYWdyZWUgd2l0aCB5b3Ugb24gb3ZlcmhhdWwg
b2YgeGVuIHN1c3BlbmQvcmVzdW1lIHdydCBibGtmcm9udCBpcyBhCj4gPiBnb29kCj4gPiA+IGlk
ZWEgaG93ZXZlciwgSU1PIHRoYXQgaXMgYSB3b3JrIGZvciBmdXR1cmUgYW5kIHRoaXMgcGF0Y2gg
c2VyaWVzIHNob3VsZAo+ID4gPiBub3QgYmUgYmxvY2tlZCBmb3IgaXQuIFdoYXQgZG8geW91IHRo
aW5rPwo+ID4gCj4gPiBJdCdzIG5vdCBzbyBtdWNoIHRoYXQgSSB0aGluayBhbiBvdmVyaGF1bCBv
ZiBzdXNwZW5kL3Jlc3VtZSBpbgo+ID4gYmxrZnJvbnQgaXMgbmVlZGVkLCBpdCdzIGp1c3QgdGhh
dCBJIGRvbid0IHdhbnQgdG8gaGF2ZSB0d28gY29tcGxldGVseQo+ID4gZGlmZmVyZW50IHN1c3Bl
bmQvcmVzdW1lIHBhdGhzIGluc2lkZSBibGtmcm9udC4KPiA+IAo+ID4gU28gZnJvbSBteSBQb1Yg
SSB0aGluayB0aGUgcmlnaHQgc29sdXRpb24gaXMgdG8gZWl0aGVyIHVzZSB0aGUgc2FtZQo+ID4g
Y29kZSAoYXMgbXVjaCBhcyBwb3NzaWJsZSkgYXMgaXQncyBjdXJyZW50bHkgdXNlZCBieSBYZW4g
aW5pdGlhdGVkCj4gPiBzdXNwZW5kL3Jlc3VtZSwgb3IgdG8gYWxzbyBzd2l0Y2ggWGVuIGluaXRp
YXRlZCBzdXNwZW5zaW9uIHRvIHVzZSB0aGUKPiA+IG5ld2x5IGludHJvZHVjZWQgY29kZS4KPiA+
IAo+ID4gSGF2aW5nIHR3byBkaWZmZXJlbnQgYXBwcm9hY2hlcyB0byBzdXNwZW5kL3Jlc3VtZSBp
biB0aGUgc2FtZSBkcml2ZXIKPiA+IGlzIGEgcmVjaXBlIGZvciBkaXNhc3RlciBJTU86IGl0IGFk
ZHMgY29tcGxleGl0eSBieSBmb3JjaW5nIGRldmVsb3BlcnMKPiA+IHRvIHRha2UgaW50byBhY2Nv
dW50IHR3byBkaWZmZXJlbnQgc3VzcGVuZC9yZXN1bWUgYXBwcm9hY2hlcyB3aGVuCj4gPiB0aGVy
ZSdzIG5vIG5lZWQgZm9yIGl0Lgo+IAo+IEkgZGlzYWdyZWUuIFMzIG9yIFM0IHN1c3BlbmQvcmVz
dW1lIChvciBwZXJoYXBzIHdlIHNob3VsZCBjYWxsIHRoZW0gcG93ZXIgc3RhdGUgdHJhbnNpdGlv
bnMgdG8gYXZvaWQgY29uZnVzaW9uKSBhcmUgcXVpdGUgZGlmZmVyZW50IGZyb20gWGVuIHN1c3Bl
bmQvcmVzdW1lLgo+IFBvd2VyIHN0YXRlIHRyYW5zaXRpb25zIG91Z2h0IHRvIGJlLCBhbmQgaW5k
ZWVkIGFyZSwgdmlzaWJsZSB0byB0aGUgc29mdHdhcmUgcnVubmluZyBpbnNpZGUgdGhlIGd1ZXN0
LiBBcHBsaWNhdGlvbnMsIGFzIHdlbGwgYXMgZHJpdmVycywgY2FuIHJlY2VpdmUgbm90aWZpY2F0
aW9uIGFuZCB0YWtlIHdoYXRldmVyIGFjdGlvbiB0aGV5IGRlZW0gYXBwcm9wcmlhdGUuCj4gWGVu
IHN1c3BlbmQvcmVzdW1lIE9UT0ggaXMgdXNlZCB3aGVuIGEgZ3Vlc3QgaXMgbWlncmF0ZWQgYW5k
IHRoZSBjb2RlIHNob3VsZCBnbyB0byBhbGwgbGVuZ3RocyBwb3NzaWJsZSB0byBtYWtlIGFueSBz
b2Z0d2FyZSBydW5uaW5nIGluc2lkZSB0aGUgZ3Vlc3QgKG90aGVyIHRoYW4gWGVuIHNwZWNpZmlj
IGVubGlnaHRlbmVkIGNvZGUsIHN1Y2ggYXMgUFYgZHJpdmVycykgY29tcGxldGVseSB1bmF3YXJl
IHRoYXQgYW55dGhpbmcgaGFzIGFjdHVhbGx5IGhhcHBlbmVkLgoKU28gZnJvbSB3aGF0IHlvdSBz
YXkgYWJvdmUgUE0gc3RhdGUgdHJhbnNpdGlvbnMgYXJlIG5vdGlmaWVkIHRvIGFsbApkcml2ZXJz
LCBhbmQgWGVuIHN1c3BlbmQvcmVzdW1lIGlzIG9ubHkgbm90aWZpZWQgdG8gUFYgZHJpdmVycywg
YW5kCmhlcmUgd2UgYXJlIHNwZWFraW5nIGFib3V0IGJsa2Zyb250IHdoaWNoIGlzIGEgUFYgZHJp
dmVyLCBhbmQgc2hvdWxkCmdldCBub3RpZmllZCBpbiBib3RoIGNhc2VzLiBTbyBJJ20gdW5zdXJl
IHdoeSB0aGUgc2FtZSAob3IgYXQgbGVhc3QKdmVyeSBzaW1pbGFyKSBhcHByb2FjaCBjYW4ndCBi
ZSB1c2VkIGluIGJvdGggY2FzZXMuCgpUaGUgc3VzcGVuZC9yZXN1bWUgYXBwcm9hY2ggcHJvcG9z
ZWQgYnkgdGhpcyBwYXRjaCBpcyBjb21wbGV0ZWx5CmRpZmZlcmVudCB0aGFuIHRoZSBvbmUgdXNl
ZCBieSBhIHhlbmJ1cyBpbml0aWF0ZWQgc3VzcGVuZC9yZXN1bWUsIGFuZApJIGRvbid0IHNlZSBh
IHRlY2huaWNhbCByZWFzb24gdGhhdCB3YXJyYW50cyB0aGlzIGRpZmZlcmVuY2UuCgpJJ20gbm90
IHNheWluZyB0aGF0IHRoZSBhcHByb2FjaCB1c2VkIGhlcmUgaXMgd3JvbmcsIGl0J3MganVzdCB0
aGF0IEkKZG9uJ3Qgc2VlIHRoZSBwb2ludCBpbiBoYXZpbmcgdHdvIGRpZmZlcmVudCB3YXlzIHRv
IGRvIHN1c3BlbmQvcmVzdW1lCmluIHRoZSBzYW1lIGRyaXZlciwgdW5sZXNzIHRoZXJlJ3MgYSB0
ZWNobmljYWwgcmVhc29uIGZvciBpdCwgd2hpY2ggSQpkb24ndCB0aGluayBoYXMgYmVlbiBwcm92
aWRlZC4KCkkgd291bGQgYmUgZmluZSB3aXRoIHN3aXRjaGluZyB4ZW5idXMgaW5pdGlhdGVkIHN1
c3BlbmQvcmVzdW1lIHRvIGFsc28KdXNlIHRoZSBhcHByb2FjaCBwcm9wb3NlZCBoZXJlOiBmcmVl
emUgdGhlIHF1ZXVlcyBhbmQgZHJhaW4gdGhlIHNoYXJlZApyaW5ncyBiZWZvcmUgc3VzcGVuZGlu
Zy4KCj4gU28sIHdoaWxzdCBpdCBtYXkgYmUgcG9zc2libGUgdG8gdXNlIGNvbW1vbiByb3V0aW5l
cyB0bywgZm9yIGV4YW1wbGUsIHJlLWVzdGFibGlzaCBQViBmcm9udGVuZC9iYWNrZW5kIGNvbW11
bmljYXRpb24sIFBWIGZyb250ZW5kIGNvZGUgc2hvdWxkIGJlIGFjdXRlbHkgYXdhcmUgb2YgdGhl
IGNpcmN1bXN0YW5jZXMgdGhleSBhcmUgb3BlcmF0aW5nIGluLiBJIGNhbiBjaXRlIGV4YW1wbGUg
Y29kZSBpbiB0aGUgV2luZG93cyBQViBkcml2ZXIsIHdoaWNoIGhhdmUgc3VwcG9ydGVkIGd1ZXN0
IFMzL1M0IHBvd2VyIHN0YXRlIHRyYW5zaXRpb25zIHNpbmNlIGRheSAxLgoKSG0sIHBsZWFzZSBi
ZWFyIHdpdGggbWUsIGFzIEknbSBub3Qgc3VyZSBJIGZ1bGx5IHVuZGVyc3RhbmQuIFdoeSBpc24n
dAp0aGUgY3VycmVudCBzdXNwZW5kL3Jlc3VtZSBsb2dpYyBzdWl0YWJsZSBmb3IgUE0gdHJhbnNp
dGlvbnM/CgpBcyBzYWlkIGFib3ZlLCBJJ20gaGFwcHkgdG8gc3dpdGNoIHhlbmJ1cyBpbml0aWF0
ZWQgc3VzcGVuZC9yZXN1bWUgdG8KdXNlIHRoZSBsb2dpYyBpbiB0aGlzIHBhdGNoLCBidXQgdW5s
ZXNzIHRoZXJlJ3MgYSB0ZWNobmljYWwgcmVhc29uIGZvcgppdCBJIGRvbid0IHNlZSB3aHkgYmxr
ZnJvbnQgc2hvdWxkIGhhdmUgdHdvIGNvbXBsZXRlbHkgZGlmZmVyZW50CmFwcHJvYWNoZXMgdG8g
c3VzcGVuZC9yZXN1bWUgZGVwZW5kaW5nIG9uIHdoZXRoZXIgaXQncyBhIFBNIG9yIGEKeGVuYnVz
IHN0YXRlIGNoYW5nZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
