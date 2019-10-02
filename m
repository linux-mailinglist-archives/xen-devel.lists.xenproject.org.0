Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DD5C926A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 21:33:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFkLL-0004yh-NV; Wed, 02 Oct 2019 19:31:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G8yu=X3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFkLJ-0004yc-Uc
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 19:31:21 +0000
X-Inumbo-ID: 3621b6d0-e54b-11e9-bf31-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 3621b6d0-e54b-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 19:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570044680;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GvIq2WAEQ+i6iA2kANyEl77jRZtHC7jJfqWOLyMDeCw=;
 b=Ex5fl1uXkj0m5ABMYhh8mN3d4S8MdD8qO/agdXO2KPWG0LPJVKgb6XG4
 cu+g1tDOINNx2tjCzuKpyop7s5LHDs2k6B/Jh+Dj5ZJFfFGdiLoTHQJ1B
 3UiQc5urGWS0KOmys1y+vePNHAuhMFrgODt87ZYjAT8/ALqDvLMt5uCaT I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HtNdpAK2xQe9OoZGVTUBxxpLXdrzZsbbAVnMe75MKYHkBu/fLqkZ3QbqhNh6TmZM485Hik/1Lf
 Gy7VwwiwmBfIo+HnoeQMsxuyFV5RG4wnSwbxCorJuqTrIrQf2hzV+2gt/NbuaXgdkemGTm/ggS
 bonXS6JOoGptJyJhex/cFBJDs9KE84UI7O7AOY1LzUCZweyum82PDb0iQeY9xSwHDVa65b0TLA
 8MlZ7S83e/jX8RFaAp1Y6L3JEVxvTQhlanNJrMAzSSCIZiJUURsWLi1g2LA2BV1gEloxT3te36
 XzA=
X-SBRS: 2.7
X-MesageID: 6681965
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,249,1566878400"; 
   d="scan'208";a="6681965"
To: Jan Beulich <jbeulich@suse.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
 <46bcfde3-83c8-5a2c-9196-832e0ea144ea@suse.com>
 <d73687de-df73-2131-f8ca-4061dc6f0a24@citrix.com>
 <4410be2a-7061-e71d-0578-ebc48e506d7a@suse.com>
 <d7734a40-4ed7-6618-057f-c03e6ba074ff@citrix.com>
 <6e653a04-576e-1ebb-1419-30fd5c1b7f89@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1c0c5ec3-6de4-756f-2823-b97772a1d05a@citrix.com>
Date: Wed, 2 Oct 2019 20:31:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6e653a04-576e-1ebb-1419-30fd5c1b7f89@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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
Cc: Juergen
 Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Norbert Manthey <nmanthey@amazon.de>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMTAvMjAxOSAwOToyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDEuMTAuMjAxOSAx
NzozNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDEvMTAvMjAxOSAxNTozMiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwMS4xMC4yMDE5IDE0OjUxLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDAxLzEwLzIwMTkgMTM6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAz
MC4wOS4yMDE5IDIwOjI0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4gVGhlIGNvZGUgZ2Vu
ZXJhdGlvbiBmb3IgYmFycmllcl9ub3NwZWNfdHJ1ZSgpIGlzIG5vdCBjb3JyZWN0LiAgV2UgYXJl
IHRha2luZyBhCj4+Pj4+PiBwZXJmIGl0IGZyb20gdGhlIGFkZGVkIGZlbmNlcywgYnV0IG5vdCBn
YWluaW5nIGFueSBzcGVjdWxhdGl2ZSBzYWZldHkuCj4+Pj4+IFlvdSB3YW50IHRvIGJlIG1vcmUg
c3BlY2lmaWMgaGVyZSwgSSB0aGluazogSVNUUiB5b3Ugc2F5aW5nIHRoYXQgdGhlIExGRU5DRXMK
Pj4+Pj4gZ2V0IGluc2VydGVkIGF0IHRoZSB3cm9uZyBwbGFjZS4KPj4+PiBDb3JyZWN0Lgo+Pj4+
Cj4+Pj4+ICBJSVJDIHdlIHdhbnQgdGhlbSBvbiBlaXRoZXIgc2lkZSBvZiBhCj4+Pj4+IGNvbmRp
dGlvbmFsIGJyYW5jaCwgaS5lLiBpbW1lZGlhdGVseSBmb2xsb3dpbmcgYSBicmFuY2ggaW5zbiBh
cyB3ZWxsIGFzIHJpZ2h0Cj4+Pj4+IGF0IHRoZSBicmFuY2ggdGFyZ2V0Lgo+Pj4+IFNwZWNpZmlj
YWxseSwgdGhleSBtdXN0IGJlIGF0IHRoZSBoZWFkIG9mIGJvdGggYmFzaWMgYmxvY2tzIGZvbGxv
d2luZwo+Pj4+IHRoZSBjb25kaXRpb25hbCBqdW1wLgo+Pj4+Cj4+Pj4+IEkndmUgdGFrZW4sIGFz
IGEgc2ltcGxlIGV4YW1wbGUsCj4+Pj4+IHAybV9tZW1fYWNjZXNzX3Nhbml0eV9jaGVjaygpLCBh
bmQgdGhpcyBsb29rcyB0byBiZSB0aGUgd2F5IGdjYzkgaGFzIGdlbmVyYXRlZAo+Pj4+PiBjb2Rl
IChpbiBhIG5vbi1kZWJ1ZyBidWlsZCkuIEhlbmNlIGVpdGhlciBJJ20gbWlzLXJlbWVtYmVyaW5n
IHdoYXQgd2Ugd2FudAo+Pj4+PiB0aGluZ3MgdG8gbG9vayBsaWtlLCBvciB0aGVyZSdzIG1vcmUg
dG8gaXQgdGhhbiBjb2RlIGdlbmVyYXRpb24gc2ltcGx5IGJlaW5nCj4+Pj4+ICJub3QgY29ycmVj
dCIuCj4+Pj4gVGhpcyBleGFtcGxlIGRlbW9uc3RyYXRlcyB0aGUgcHJvYmxlbSwgYW5kIGFjdHVh
bGx5IHRocm93cyBhIGZ1cnRoZXIKPj4+PiBzcGFubmVyIGluIHRoZSB3b3JrcyBvZiBob3cgbWFr
ZSB0aGlzIHNhZmUsIHdoaWNoIGhhZG4ndCBvY2N1cnJlZCB0byBtZQo+Pj4+IGJlZm9yZS4KPj4+
Pgo+Pj4+IFRoZSBpbnN0cnVjdGlvbiBzdHJlYW0gZnJvbSBhIGNhbGxlciBvZiBwMm1fbWVtX2Fj
Y2Vzc19zYW5pdHlfY2hlY2soKQo+Pj4+IHdpbGwgbG9vayBzb21ldGhpbmcgbGlrZSB0aGlzOgo+
Pj4+Cj4+Pj4gY2FsbCBwMm1fbWVtX2FjY2Vzc19zYW5pdHlfY2hlY2sKPj4+PiDCoMKgwqAgLi4u
Cj4+Pj4gwqDCoMKgIGxmZW5jZQo+Pj4+IMKgwqDCoCAuLi4KPj4+PiDCoMKgwqAgcmV0wqDCoMKg
Cj4+Pj4gY21wICQwLCAlZWF4Cj4+Pj4gam5lIC4uLgo+Pj4+Cj4+Pj4gV2hpY2ggaXMgdW5zYWZl
LCBiZWNhdXNlIHRoZSBvbmx5IHNhZmUgd2F5IHRvIGFycmFuZ2UgdGhpcyBjb2RlIHdvdWxkIGJl
Ogo+Pj4+Cj4+Pj4gY2FsbCBwMm1fbWVtX2FjY2Vzc19zYW5pdHlfY2hlY2sKPj4+PiDCoMKgwqAg
Li4uCj4+Pj4gwqDCoMKgIHJldAo+Pj4+IGNtcCAkMCwgJWVheAo+Pj4+IGpuZSAxZgo+Pj4+IGxm
ZW5jZQo+Pj4+IC4uLgo+Pj4+IDE6IGxmZW5jZQo+Pj4+IC4uLgo+Pj4+Cj4+Pj4gVGhlcmUgaXMg
YWJzb2x1dGVseSBubyBwb3NzaWJsZSB3YXkgZm9yIGlubGluZSBhc3NlbWJseSB0byBiZSB1c2Vk
IHRvCj4+Pj4gcHJvcGFnYXRlIHRoaXMgc2FmZXR5IHByb3BlcnR5IGFjcm9zcyB0cmFuc2xhdGlv
biB1bml0cy7CoCBUaGlzIGlzIGdvaW5nCj4+Pj4gdG8gaGF2ZSB0byBiZSBhbiBhdHRyaWJ1dGUg
b2Ygc29tZSBmb3JtIG9yIGFub3RoZXIgaGFuZGxlZCBieSB0aGUgY29tcGlsZXIuCj4+PiBCdXQg
eW91IHJlYWxpemUgdGhhdCB0aGlzIHBhcnRpY3VsYXIgZXhhbXBsZSBpcyBiYXNpY2FsbHkgYSBt
b3JlCj4+PiBjb21wbGV4IGlzX1hZWigpIGNoZWNrLCB3aGljaCBjb3VsZCBiZSBkZWFsdCB3aXRo
IGJ5IGlubGluaW5nIHRoZQo+Pj4gZnVuY3Rpb24uIE9mIGNvdXJzZSB0aGVyZSBhcmUgZ29pbmcg
dG8gYmUgbGFyZ2VyIGZ1bmN0aW9ucyB3aGVyZQo+Pj4gdGhlIHJlc3VsdCB3YW50cyB0byBiZSBn
dWFyZGVkIGxpa2UgeW91IHNheS4gQnV0IGp1c3QgbGlrZSB0aGUKPj4+IGFkZGl0aW9uIG9mIHRo
ZSBub3NwZWMgbWFjcm9zIHRvIHZhcmlvdXMgaXNfWFlaKCkgZnVuY3Rpb25zIGlzIGEKPj4+IG1h
bnVhbCBvcGVyYXRpb24gKGFzIGxvbmcgdGhlIGNvbXBpbGVyIGRvZXNuJ3QgaGVscCksIGl0IHdv
dWxkIGluCj4+PiB0aGF0IGNhc2UgYmUgYSBtYXR0ZXIgb2YgbGF0Y2hpbmcgdGhlIHJldHVybiB2
YWx1ZSBpbnRvIGEgbG9jYWwKPj4+IHZhcmlhYmxlIGFuZCB1c2luZyBhbiBhcHByb3ByaWF0ZSBn
dWFyZGluZyBjb25zdHJ1Y3Qgd2hlbgo+Pj4gZXZhbHVhdGluZyBpdC4KPj4gQW5kIHRoaXMgcmVh
c29uaW5nIGRlbW9uc3RyYXRlcyB5ZXQgYW5vdGhlciBwcm9ibGVtICh0aGlzIG9uZSB3YXMgcmFp
c2VkCj4+IGF0IHRoZSBtZWV0aW5nIGluIENoaWNhZ28pLgo+Pgo+PiBldmFsdWF0ZV9ub3NwZWMo
KSBpcyBub3QgYSB1c2VmdWwgY29uc3RydWN0IGlmIGl0IG5lZWRzIGluc2VydGluZyBhdAo+PiBl
dmVyeSBoaWdoZXIgbGV2ZWwgcHJlZGljYXRlIHRvIHJlc3VsdCBpbiBzYWZlIGNvZGUuwqAgVGhp
cyBpcwo+PiBib2FyZGVybGluZS1pbXBvc3NpYmxlIHRvIHJldmlldyBmb3IsIGFuZCBleHRyZW1l
bHkgZWFzeSB0byBicmVhawo+PiBhY2NpZGVudGFsbHkuCj4gSSBhZ3JlZTsgc2luY2UgZXZhbHVh
dGVfbm9zcGVjKCkgaW5zZXJ0aW9uIG5lZWQgaXMgZ2VuZXJhbGx5IGEgaGFyZAo+IHRvIGludmVz
dGlnYXRlIC8gcmV2aWV3IGFjdGlvbiwgSSBkb24jdCBjb25zaWRlciB0aGlzIHVuZXhwZWN0ZWQu
Cj4KPj4+IFNvIEknbSBhZnJhaWQgZm9yIG5vdyBJIHN0aWxsIGNhbid0IGFncmVlIHdpdGggeW91
ciAibm90IGNvcnJlY3QiCj4+PiBhc3Nlc3NtZW50IC0gdGhlIGdlbmVyYXRlZCBjb2RlIGluIHRo
ZSBleGFtcGxlIGxvb2tzIGNvcnJlY3QgdG8KPj4+IG1lLCBhbmQgaWYgZnVydGhlciBndWFyZGlu
ZyB3YXMgbmVlZGVkIGluIHVzZXJzIG9mIHRoaXMgcGFydGljdWxhcgo+Pj4gZnVuY3Rpb24sIGl0
IHdvdWxkIGJlIHRob3NlIHVzZXJzIHdoaWNoIHdvdWxkIG5lZWQgZnVydGhlcgo+Pj4gbWFzc2Fn
aW5nLgo+PiBTYWZldHkgYWdhaW5zdCBzcGVjdHJlIHYxIGlzIG5vdCBhIG1hdHRlciBvZiBvcGlu
aW9uLgo+Pgo+PiBUbyBwcm90ZWN0IGFnYWluc3Qgc3BlY3VsYXRpdmVseSBleGVjdXRpbmcgdGhl
IHdyb25nIGJhc2ljIGJsb2NrLCB0aGUKPj4gcGlwZWxpbmUgbXVzdCBleGVjdXRlIHRoZSBjb25k
aXRpb25hbCBqdW1wIGZpcnN0LCAqdGhlbiogaGl0IGFuIGxmZW5jZQo+PiB0byBzZXJpYWxpc2Ug
dGhlIGluc3RydWN0aW9uIHN0cmVhbSBhbmQgcmV2ZWN0b3IgaW4gdGhlIGNhc2Ugb2YKPj4gaW5j
b3JyZWN0IHNwZWN1bGF0aW9uLgo+Pgo+PiBUaGUgb3RoZXIgd2F5IGFyb3VuZCBpcyBub3Qgc2Fm
ZS7CoCBTZXJpYWxpc2luZyB0aGUgaW5zdHJ1Y3Rpb24gc3RyZWFtCj4+IGRvZXNuJ3QgZG8gYW55
dGhpbmcgdG8gcHJvdGVjdCBhZ2FpbnN0IHRoZSBhdHRhY2tlciB0YWtpbmcgY29udHJvbCBvZiBh
Cj4+IGxhdGVyIGJyYW5jaC4KPj4KPj4gVGhlIGJpZ2dlciBwcm9ibGVtIGlzIHRvIGRvIHdpdGgg
Y2xhc3NpZnlpbmcgd2hhdCB3ZSBhcmUgcHJvdGVjdGluZwo+PiBhZ2FpbnN0LsKgIEluIHRoZSBj
YXNlIG9mIGlzX2NvbnRyb2xfZG9tYWluKCksIGl0IGlzIGFueSBhY3Rpb24gYmFzZWQgb24KPj4g
dGhlIHJlc3VsdCBvZiB0aGUgZGVjaXNpb24uwqAgRm9yIGlzX3twdixodm19X2RvbWFpbigpLCBp
cyBvbmx5ICh0byBhCj4+IGZpcnN0IGFwcHJveGltYXRpb24pIHNwZWN1bGF0aXZlIHR5cGUgY29u
ZnVzaW9uIGludG8gdGhlIHB2L2h2bSB1bmlvbnMKPj4gKHdoaWNoIGluIHByYWN0aWNlIGV4dGVu
ZHMgdG8gY2FsbGluZyBwdl8vaHZtXyBmdW5jdGlvbnMgYXMgd2VsbCkuCj4+Cj4+IEFzIGZvciB0
aGUgcmVhbCBjb25jcmV0ZSBicmVha2FnZXMuwqAgSW4gYSBzdGFnaW5nIGJ1aWxkIHdpdGggR0ND
IDYKPj4KPj4gJCBvYmpkdW1wIC1kIHhlbi1zeW1zIHwgZ3JlcCAnPGlzX2h2bV9kb21haW4+Oicg
fCB3YyAtbAo+PiAxOAo+PiAkIG9iamR1bXAgLWQgeGVuLXN5bXMgfCBncmVwICc8aXNfcHZfZG9t
YWluPjonIHwgd2MgLWwKPj4gOQo+Pgo+PiBBbGwgb2Ygd2hpY2ggaGF2ZSB0aGUgbGZlbmNlIHRv
byBlYXJseSB0byBwcm90ZWN0IGFnYWluc3Qgc3BlY3VsYXRpdmUKPj4gdHlwZSBjb25mdXNpb24u
Cj4gQW5kIGFsbCBvZiB3aGljaCBhcmUgYmVjYXVzZSwgb3RoZXIgdGhhbiBJIHRoaW5rIGl0IHdh
cyBvcmlnaW5hbGx5Cj4gaW50ZW5kZWQsIHRoZSBmdW5jdGlvbnMgc3RpbGwgYXJlbid0IGFsd2F5
c19pbmxpbmUuCgpSaWdodCwgYnV0IGlmIHdlIGZvcmNlIGlzX2h2bV9kb21haW4oKSB0byBiZSBh
bHdheXNfaW5saW5lLCB0aGVuCmlzX2h2bV92Y3B1KCkgZ2V0cyBvdXQtb2YtbGluZWQuCgpUaGlz
IHR1cm5zIGludG8gYSBnYW1lIG9mIHdoYWNrLWEtbW9sZSwgd2hlcmUgYW55IHByZWRpY2F0ZSB3
cmFwcGluZwpzb21ldGhpbmcgd2l0aCBhbiBlbWJlZGRlZCBldmFsdWF0ZV9ub3NwZWMoKSBicmVh
a3MgdGhlIHNhZmV0eS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
