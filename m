Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34A2E5029
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 17:31:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO1VV-00077p-Bu; Fri, 25 Oct 2019 15:28:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uj8v=YS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iO1VT-00077k-8n
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 15:28:03 +0000
X-Inumbo-ID: 0785ed98-f73c-11e9-94ca-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0785ed98-f73c-11e9-94ca-12813bfff9fa;
 Fri, 25 Oct 2019 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572017282;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8y3a1JkCbN0EQvBZZZFye0STB9Z4SuSKgG6/PH9GBvo=;
 b=YaLm+WkHClfR+LyTjmbXq3qKARFeZkMU4qLFwDHOXXVhIV2bzhlzfm6i
 RuPU8kgG4Grt+rWNK3UQKBKmG4cbowzd+O6bRjz8el5FcS1hfWD7aAMup
 Re4YJaYB5Z0q2lyvhy/5JCTmkSFZ0KJM65rfSsLrPHBbXazFk2+5qhab1 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3cu3mg1Ucup9OxXN//W3FTSa+YPQxCO4kbw98wJqbb0/KCJNUr6gNRHkm8MdZ+1E/lNqwiQIuq
 bjTjE0kUZmkOttdB4IoZ7ZFUpw+OMC2dROZGwsXOXDH5eR5Uh5mqZF8blF99fQwnYBp5+TFnMU
 POG7/3offK9GQyANOrwLNQUmpw8vIPLCD+L7vZQ+Ml3SZzSEA/0QIh7WU+iMrzj0fmnz9+mRt+
 lZl+MSaG1hMDg1/oBXNXbGPCRUEA9WPYAoCiyZMsJuJJJZf50JSuJfOb+JMnwAtFnRday2CO75
 CVo=
X-SBRS: 2.7
X-MesageID: 7535396
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7535396"
To: Jan Beulich <jbeulich@suse.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
 <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
 <782089aa-7994-f471-3c52-2afb30f95812@citrix.com>
 <c12afdd1-c561-bc79-5c36-22ac2e994953@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6d7c899e-81ab-bc61-a589-043b327b3137@citrix.com>
Date: Fri, 25 Oct 2019 16:27:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c12afdd1-c561-bc79-5c36-22ac2e994953@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

T24gMjUvMTAvMjAxOSAxMzozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjUuMTAuMjAxOSAx
NDoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjUvMTAvMjAxOSAxMzowMywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyMy4xMC4yMDE5IDE1OjU4LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IGV2YWx1YXRlX25vc3BlYygpIGlzIGluY3JlZGlibHkgZnJhZ2lsZSwgYW5kIHRoaXMg
aXMgb25lIGdpYW50IGJvZGdlLgo+Pj4+Cj4+Pj4gVG8gY29ycmVjdGx5IHByb3RlY3QganVtcHMs
IHRoZSBnZW5lcmF0ZWQgY29kZSBuZWVkcyB0byBiZSBvZiB0aGUgZm9ybToKPj4+Pgo+Pj4+ICAg
ICBjbXAvdGVzdCA8Y29uZD4KPj4+PiAgICAgamNjIDFmCj4+Pj4gICAgIGxmZW5jZQo+Pj4+ICAg
ICAuLi4KPj4+PiAgMTogbGZlbmNlCj4+Pj4gICAgIC4uLgo+Pj4+Cj4+Pj4gQ3JpdGljYWxseSwg
dGhlIGxmZW5jZSBtdXN0IGJlIGF0IHRoZSBoZWFkIG9mIGJvdGggYmFzaWMgYmxvY2tzLCBsYXRl
ciBpbiB0aGUKPj4+PiBpbnN0cnVjdGlvbiBzdHJlYW0gdGhhbiB0aGUgY29uZGl0aW9uYWwganVt
cCBpbiBuZWVkIG9mIHByb3RlY3Rpb24uCj4+Pj4KPj4+PiBXaGVuIGEgc3RhdGljIGlubGluZSBp
cyBpbnZvbHZlZCwgdGhlIG9wdGltaXNlciBkZWNpZGVzIHRvIGJlIGNsZXZlciBhbmQKPj4+PiBy
ZWFycmFuZ2VzIHRoZSBjb2RlIGFzOgo+Pj4+Cj4+Pj4gIHByZWQ6Cj4+Pj4gICAgIGxmZW5jZQo+
Pj4+ICAgICA8Y2FsY3VsYXRlIGNvbmQ+Cj4+Pj4gICAgIHJldAo+Pj4+Cj4+Pj4gICAgIGNhbGwg
cHJlZAo+Pj4+ICAgICBjbXAgJDAsICVlYXgKPj4+PiAgICAgamNjIDFmCj4+Pj4gICAgIC4uLgo+
Pj4+ICAxOiAuLi4KPj4+Pgo+Pj4+IHdoaWNoIGJyZWFrcyB0aGUgc3BlY3VsYXRpdmUgc2FmZXR5
Lgo+Pj4gQWl1aSAicHJlZCIgaXMgYSBub24taW5saW5lZCBzdGF0aWMgaW5saW5lIGhlcmUuCj4+
IENvcnJlY3QsIGFsdGhvdWdoIGl0IGFjdHVhbGx5IGFwcGxpZXMgdG8gYW55dGhpbmcgd2hpY2gg
dGhlIGNvbXBpbGVyCj4+IGNob3NlIHRvIG91dCBvZiBsaW5lLCBwZXJoYXBzIGV2ZW4gYXMgYSBz
aWRlIGVmZmVjdCBvZiBDU0UgcGFzcy4KPiBOb3Qgc3VyZSBpZiB5b3UncmUgYWxsdWRpbmcgdG8g
c3VjaCwgYnV0IEkndmUgbmV2ZXIgc2VlbiB0aGUgY29tcGlsZXIKPiBvdXQtb2YtbGluZSBzb21l
dGhpbmcgdGhhdCB3YXNuJ3QgYSBmdW5jdGlvbiAob3IgcGVyaGFwcyBhIHNwZWNpYWxpemF0aW9u
Cj4gb2Ygb25lKSBhdCB0aGUgc291cmNlIGxldmVsLgoKSSd2ZSBzZWVuIGl0IHdpdGggTFRPIGlu
IGJvdGggQ2xhbmcgYW5kIEdDQywgd2hlcmUgdGhlIGNvbXBpbGVycyBjYW4Kc2FmZWx5IHJlYXNv
biBhYm91dCB0aGUgbGFjayBvZiBzaWRlIGVmZmVjdHMgaW4gZnVuY3Rpb24gY2FsbHMuCgo+Cj4+
Pj4gVGhpcyBpcyB0aGUgdHJhbnNpdGl2ZSBzZXQgb2YgcHJlZGljYXRlcyB3aGljaCBJIGNhbiBz
cG90IHdoaWNoIG5lZWQKPj4+PiBwcm90ZWN0aW5nLiAgVGhlcmUgYXJlIHByb2JhYmx5IG9uZXMg
SSd2ZSBtaXNzZWQuICBQZXJzb25hbGx5LCBJJ20gLTEgZm9yIHRoaXMKPj4+PiBhcHByb2FjaCwg
YnV0IHRoZSBvbmx5IG90aGVyIG9wdGlvbiBmb3IgNC4xMyBpcyB0byByZXZlcnQgaXQgYWxsIHRv
IHVuYnJlYWsKPj4+PiBsaXZlcGF0Y2hpbmcuCj4+PiBUbyB1bmJyZWFrIGxpdmVwYXRjaGluZywg
YWl1aSB3aGF0IHlvdSBuZWVkIGlzIHN5bWJvbCBkaXNhbWJpZ3VhdGlvbiwKPj4+IGEgcGF0Y2gg
Zm9yIHdoaWNoIGhhcyBiZWVuIHNlbnQuCj4+IENvcnJlY3QsIGJ1dC4uCj4+Cj4+PiBXaXRoIHRo
aXMgSSB0aGluayB3ZSBzaG91bGQgZm9jdXMgb24KPj4+IGNvZGUgZ2VuZXJhdGlvbiBhc3BlY3Rz
IGhlcmUuIEknbSBmaW5lIGFjay1pbmcgdGhlIGNvZGUgY2hhbmdlcyB3aXRoCj4+PiBhIG1vZGlm
aWVkIGRlc2NyaXB0aW9uLiBCdXQgc2luY2UgeW91J3JlIC0xIGZvciB0aGlzLCBJJ20gbm90IHN1
cmUgaW4KPj4+IHRoZSBmaXJzdCBwbGFjZSB0aGF0IHdlIHdhbnQgdG8gZ28gdGhpcyByb3V0ZS4K
Pj4gLi4uIHdpdGhvdXQgdGhpcyBjaGFuZ2UsIGwxdGYtYmFycmllci9icmFuY2gtaGFyZGVuaW5n
IGlzIHN0aWxsIGJyb2tlbiwKPj4gYW5kIGEgcGVyZm9ybWFuY2Ugb3ZlcmhlYWQuCj4gV2VsbCwg
aXQgaGFzIGxlc3Mgb2YgYW4gZWZmZWN0LCBidXQgaXQncyBzdGlsbCBiZXR0ZXIgdGhhbiB3aXRo
b3V0IGFueQo+IG9mIHRoaXMgYWx0b2dldGhlci4KCkkgY2VydGFpbmx5IGRvbid0IGFncmVlIHdp
dGggdGhpcyBjb25jbHVzaW9uLgoKPiBJbiBzb21lIGNhc2VzIGNvZGUgZ2VuZXJhdGlvbiBpcyBj
b3JyZWN0LAoKSSBhZ3JlZSB3aXRoIHRoaXMsIGJ1dCAuLi4KCj4gYW5kIGluIHNvbWUgb3RoZXIg
Y2FzZXMgY29kZSBnZW5lcmF0aW9uIGlzIGF0IGxlYXN0IHN1Y2ggdGhhdCB0aGUgd2luZG93IHNp
emUKPiBnZXRzIHNocnVuay4KCi4uLiB0aGlzIGlzbid0IGFjY3VyYXRlLsKgIEluIHRoZSBjYXNl
IHRoYXQgb3V0LW9mLWxpbmluZyBoYXBwZW5zLCB5b3UKZ2V0IGFuIGxmZW5jZSBlYXJsaWVyIGlu
IHRoZSBpbnN0cnVjdGlvbiBzdHJlYW0sIHdoaWNoIHNlcmlhbGlzZXMgYW4KdW5yZWxhdGVkIGJp
dCBvZiBsb2dpYyAoaGVuY2UgdGhlIHBlcmYgaGl0KSwgYW5kIGRvZXMgbm90aGluZyBmb3IgdGhl
CnNwZWN1bGF0aW9uIHdpbmRvdyB3aGljaCB0aGUgZXZhbHVhdGVfbm9zcGVjKCkgd2FzIGludGVu
ZGluZyB0byBwcm90ZWN0LgoKPgo+PiBUaGUgdHdvIGNob2ljZXMgdG8gdW5ibG9jayA0LjEzIGFy
ZSB0aGlzIHBhdGNoLCBvciB0aGUgcHJldmlvdXMgdmVyc2lvbgo+PiB3aGljaCBtYWRlIENPTkZJ
R19IQVJERU5fQlJBTkNIIGRlcGVuZCBvbiBCUk9LRU4sIHdoaWNoIHdhcyBldmVuIG1vcmUKPj4g
ZGlzbGlrZWQuCj4gT3B0aW9uIDMgaXMgdG8gaGF2ZSBqdXN0IHRoZSBjb25maWcgb3B0aW9uLCBm
b3IgcGVvcGxlIHRvIHR1cm4gdGhpcwo+IG9mZiBpZiB0aGV5IGZlZWwgbGlrZSBkb2luZyBzby4K
ClllcywgYnV0IG5vLsKgIEEgZmFjYWRlIG9mIHNlY3VyaXR5IGlzIHdvcnNlIHRoYW4gbm8gc2Vj
dXJpdHksIGFuZCBJCmRvbid0IGNvbnNpZGVyIGRvaW5nIHRoYXQgYW4gYWNjZXB0YWJsZSBzb2x1
dGlvbiBpbiB0aGlzIGNhc2UuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
