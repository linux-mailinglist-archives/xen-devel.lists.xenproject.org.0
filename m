Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E1AE7759
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 18:09:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP8Ss-0002IP-Pc; Mon, 28 Oct 2019 17:05:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qotU=YV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iP8Sr-0002IK-7p
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 17:05:57 +0000
X-Inumbo-ID: 34437b32-f9a5-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34437b32-f9a5-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 17:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572282355;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2WEncTApIEFiFxhgo+WxlYgZ2JDanIOkuMlA5VtHZ6k=;
 b=b2It9kBV6YowU1QPwzsxAOEzoT/pTDqR2sOuLDUtGyLJHHD+XGJZVifH
 CHhsAHYrxPpqpv50XVw8tAWsEv6iR4YKg1fU/Eh0adQ7N/bl95Wp2Fb3q
 MDc3csX7Bk5fGdEjuxWunGmlhFOBj86tz9ediPgB5rxePo/7Z6EI2gYyy 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KF4tCh3x/yCRlRUVjAXwbNH3zNTJGg7o22K9crfn2hDgAaUjGKuVt45+l919zLSNvjZOiBz49p
 OUXWbaobtOcgZD6qAJutheE7Jn1o4MrhXByhDIn2+8JKa8/fFp4HsEFYaN8Hs/RV5VA7bYh8Zl
 LKIeOu8cGQI/JWPbeuPDfJagmq9VlY5qVBo/ZZ1mo0Jo8CPmkWcfH68KL8BZPoRNXME8bswHgm
 HHEqpxZKrhYahSDlzZntV20k+gQdUAVXEnAfayI5C9j6RNumm8xdTW1HxejrPi2Q+lU1zw7G3C
 npY=
X-SBRS: 2.7
X-MesageID: 7878086
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7878086"
To: Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <jbeulich@suse.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
 <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
 <782089aa-7994-f471-3c52-2afb30f95812@citrix.com>
 <c12afdd1-c561-bc79-5c36-22ac2e994953@suse.com>
 <6d7c899e-81ab-bc61-a589-043b327b3137@citrix.com>
 <477a6513-0caf-fc4a-21cf-a3a101b6c5ca@suse.com>
 <5b6b2cd3-b8a5-7697-e6f4-f7c337242276@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5d075fd9-acbe-0fcd-8f22-9f49c61f657f@citrix.com>
Date: Mon, 28 Oct 2019 17:05:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5b6b2cd3-b8a5-7697-e6f4-f7c337242276@amazon.de>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 2/7] xen/nospec: Use always_inline to fix
 code gen for evaluate_nospec
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMTAvMjAxOSAyMjo1NiwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IE9uIDEwLzI1LzE5
IDE3OjQwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjUuMTAuMjAxOSAxNzoyNywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDI1LzEwLzIwMTkgMTM6MzQsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDI1LjEwLjIwMTkgMTQ6MTAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IFRo
ZSB0d28gY2hvaWNlcyB0byB1bmJsb2NrIDQuMTMgYXJlIHRoaXMgcGF0Y2gsIG9yIHRoZSBwcmV2
aW91cyB2ZXJzaW9uCj4+Pj4+IHdoaWNoIG1hZGUgQ09ORklHX0hBUkRFTl9CUkFOQ0ggZGVwZW5k
IG9uIEJST0tFTiwgd2hpY2ggd2FzIGV2ZW4gbW9yZQo+Pj4+PiBkaXNsaWtlZC4KPj4+PiBPcHRp
b24gMyBpcyB0byBoYXZlIGp1c3QgdGhlIGNvbmZpZyBvcHRpb24sIGZvciBwZW9wbGUgdG8gdHVy
biB0aGlzCj4+Pj4gb2ZmIGlmIHRoZXkgZmVlbCBsaWtlIGRvaW5nIHNvLgo+Pj4gWWVzLCBidXQg
bm8uwqAgQSBmYWNhZGUgb2Ygc2VjdXJpdHkgaXMgd29yc2UgdGhhbiBubyBzZWN1cml0eSwgYW5k
IEkKPj4+IGRvbid0IGNvbnNpZGVyIGRvaW5nIHRoYXQgYW4gYWNjZXB0YWJsZSBzb2x1dGlvbiBp
biB0aGlzIGNhc2UuCj4+IEJ1dCBJIHRob3VnaHQgd2UgYWxsIGFncmVlIHRoYXQgdGhpcyBpcyBz
b21ldGhpbmcgdGhhdCdzIHByZXN1bWFibHkKPj4gZ29pbmcgdG8gcmVtYWluIGluY29tcGxldGUg
KGFzIGluIG5vdCBwcm92YWJseSBjb21wbGV0ZSkgYWx0b2dldGhlcgo+PiBhbnl3YXkuIEl0J3Mg
anVzdCB0aGF0IHdpdGhvdXQgdGhlIGNoYW5nZSBoZXJlIGl0J3MgZmFyIG1vcmUKPj4gaW5jb21w
bGV0ZSB0aGVuIHdpdGggaXQuCgpUaGlzIGlzIGluaGVyZW50bHkgYSBiZXN0LWVmZm9ydCBhcHBy
b2FjaCwgYnV0IHdpdGhvdXQgdGhlCmFsd2F5c19pbmxpbmUsIGl0IGlzIHRhbnRhbW91bnQgdG8g
dXNlbGVzcy4KCk9ubHkgdGhlIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMsIGFuZCBfX21mbl92YWxp
ZCgpIGFyZSBjb3JyZWN0bHkKcHJvdGVjdGVkIHdpdGggdGhlIGNvZGUgaW4gaXRzIGN1cnJlbnQg
Zm9ybSwgd2hlcmUgYXMgdGhlIGxhcmdlIGNoYW5nZXMKKGluIHRlcm1zIG9mIGFic29sdXRlIG51
bWJlciBvZiBwcm90ZWN0ZWQgcGF0aHMpIGNvbWVzIGZyb20gdGhlIHByZWRpY2F0ZXMuCgo+Pgo+
PiBJbiBhbnkgZXZlbnQgSSB0aGluayB3ZSBzaG91bGQgKGFsc28pIGhhdmUgYW4gb3BpbmlvbiBm
cm9tIHRoZSBwZW9wbGUKPj4gd2hvIGhhZCBvcmlnaW5hbGx5IGNvbnRyaWJ1dGVkIHRoaXMgbG9n
aWMuIFlvdSBkaWRuJ3QgQ2MgYW55b25lIG9mCj4+IHRoZW07IEkndmUgYWRkZWQgYXQgbGVhc3Qg
Tm9yYmVydCBub3cuCj4gVGhhbmtzIGZvciBhZGRpbmcgbWUuIEkgaGFkIGEgcXVpY2sgbG9vayBp
bnRvIHRoZSBkaXNjdXNzaW9uLiBPbmx5Cj4gbWFraW5nIGFkZGluZyBsZmVuY2Ugc3RhdGVtZW50
cyBhcm91bmQgY29uZGl0aW9uYWxzIGRlcGVuZGluZyBvbiBjb25maWcKPiBCUk9LRU4gZG9lcyBu
b3QgaGVscCwgYXMgaXQgd291bGQgc3RpbGwgbmVlZCB0byBiZSBhbHdheXNfaW5saW5lIHRvIHdv
cmsKPiBhcyBleHBlY3RlZCwgY29ycmVjdD8KCiJkZXBlbmRzIG9uIEJST0tFTiIgaXMgYSB3YXkg
dG8gdW5jb25kaXRpb25hbGx5IGNvbXBpbGUgb3V0CmZ1bmN0aW9uYWxpdHksIHdoaWNoIHdhcyBv
bmUgb3B0aW9uIGNvbnNpZGVyZWQgdG8gdGhpcyBwcm9ibGVtLgoKPiBIZW5jZSwgaW4gbXkgb3Bp
bmlvbiwgdGhpcyBwYXRjaCBkb2VzIHRoZSByaWdodAo+IHRoaW5nIHRvIGJlbmVmaXQgZnJvbSB0
aGUgbGZlbmNlcyB0aGF0IGFyZSBwbGFjZWQgYWZ0ZXIgZXZhbHVhdGlvbgo+IGNvbmRpdGlvbmFs
cy4KClRoaXMgcGF0Y2ggaXMgdGhlIGFsdGVybmF0aXZlIHRvIGNvbXBpbGluZyBldmVyeXRoaW5n
IG91dC4KCkknbSBzdGlsbCBob2xkaW5nIG91dCBob3BlIHRoYXQgd2UnbGwgZmluZCBhIGJldHRl
ciBjb21waWxlciBiYXNlZAptaXRpZ2F0aW9uIGluIHRoZSBsb25nZXIgdGVybSwgYmVjYXVzZSBJ
IGRvbid0IHNlZSBlaXRoZXIgb2YgdGhlc2UKb3B0aW9ucyBiZWluZyB2aWFibGUgc3RyYXRlZ2ll
cyBsb25ndGVybS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
