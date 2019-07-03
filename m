Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B3F5ECF7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 21:50:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hilDw-0007x4-S6; Wed, 03 Jul 2019 19:47:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZJKH=VA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hilDv-0007wz-J5
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 19:47:23 +0000
X-Inumbo-ID: 5f5d0be8-9dcb-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5f5d0be8-9dcb-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 19:47:21 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8p1MfS0gRS8ivQKmNi61KgLHCZAuNLK24TLNuMEMmWfnGetzuU/J4qsxOzUVQsU/haJAZCz3Ql
 7hsXwEHROtdIZZHjaPZF7IOOa08YTh2b2OUAWB6wgB+KhrMAfgBUGntULsZy+g97/ToEFNGOon
 mi+fPpBFL6Uwt3NvdDQtW+2MCDOqMx0O6uXFXYgy60niTYn4xua2Ry0+g1hnTJY1vufPCpr7YP
 BE/TU/Pl1r3Jas4S1IObhTY+an05Ohuuba0EjmlOhzQPTj2HzJ59djKx5ZjJL24FkTyheb7b7l
 eBI=
X-SBRS: 2.7
X-MesageID: 2622020
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2622020"
To: Jan Beulich <JBeulich@suse.com>
References: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
 <5D074AE60200007800238B5E@prv1-mh.provo.novell.com>
 <5D074BA30200007800238B6C@prv1-mh.provo.novell.com>
 <eb44801a-1081-858d-4853-6dc574e0c6d6@citrix.com>
 <2e2a1d5d-f04e-5400-6817-86a7985b1c9b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <48d87646-5fa2-4cb7-e7a4-e83af1f372dd@citrix.com>
Date: Wed, 3 Jul 2019 20:47:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2e2a1d5d-f04e-5400-6817-86a7985b1c9b@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/traps: widen condition for
 logging top-of-stack
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDcvMjAxOSAxMTozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMDcuMjAxOSAx
MjoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTcvMDYvMjAxOSAwOToxMywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBEZXNwaXRlIC1mbm8tb21pdC1mcmFtZS1wb2ludGVyIHRoZSBjb21w
aWxlciBtYXkgb21pdCB0aGUgZnJhbWUgcG9pbnRlciwKPj4+IG9mdGVuIGZvciByZWxhdGl2ZWx5
IHNpbXBsZSBsZWFmIGZ1bmN0aW9ucy4KPj4gQWN0dWFsbHksIHRoZSBwcm9ibGVtIGlzIG1vcmUg
d2lkZXNwcmVhZCB0aGFuIHRoaXMuwqAgRm9yIGV2ZXJ5IGZ1bmN0aW9uLAo+PiB0aGVyZSBpcyBh
IG5vbi16ZXJvIHF1YW50aXR5IG9mIHRpbWUgYmV0d2VlbiB0aGUgZnVuY3Rpb24gc3RhcnRpbmcg
YW5kCj4+IHRoZSBmcmFtZSBwb2ludGVyIGJlaW5nIHNldCB1cC4KPj4KPj4gSG93ZXZlciwgaGFs
ZiBvZiB0aGlzIHRpbWUgaXMgc3BlbnQgd2l0aCB0aGUgb2xkICVyYnAgb24gdGhlIHRvcCBvZiB0
aGUKPj4gc3RhY2ssIHNvIHdvbid0IGJlbmVmaXQgZnJvbSB0aGVzZSBjaGFuZ2VzLgo+IEkgdGhp
bmsgdGhlIGNvbXBpbGVyIHR5cGljYWxseSBwYWlycyBwdXNoICVyYnAgYW5kIG1vdiAlcnNwLCAl
cmJwLAo+IGJ1dCB0aGlzIHBhaXIgbWF5IG5vdCBzaXQgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUg
ZnVuY3Rpb24uIEFuZCBpdCdzCj4gdGhhdCBvdGhlciBjb2RlIHRoYXQncyBwcm9uZSB0byBjcmFz
aC4gVGhlIHB1c2ggJXJicCBtYXkgYWxzbyBmYXVsdAo+IChtb3N0IG5vdGFibHkgZHVlIHRvIHN0
YWNrIG92ZXJydW4pLCBidXQgdGhhdCB3b3VsZCB0aGVuIHN0aWxsIGhhdmUKPiB0aGUgdG9wIG9m
IHN0YWNrIGNvdmVyZWQgYnkgdGhlIGNoYW5nZSBoZXJlLiBUaGUgbW92ICVyc3AsICVyYnAsCj4g
b3RvaCwgd29uJ3QgcGxhdXNpYmx5IGZhdWx0LiBJT1cgSSB0aGluayBpdCdzIGZhciBtb3JlIHRo
YW4gImhhbGYgb2YKPiB0aGUgdGltZSIgdGhhdCB0aGlzIGNoYW5nZSBoZWxwcy4KCk15IHN0YXRl
bWVudCB3YXNuJ3QgbWVhbnQgYXMgYSBjcml0aWNpc20sIGJ1dCBtb3JlIG9mIGFuIG9ic2VydmF0
aW9uLgoKPgo+Pj4gKFRvIGdpdmUgYSBzcGVjaWZpYyBleGFtcGxlLAo+Pj4gdGhlIGNhc2UgSSd2
ZSBydW4gaW50byB0aGlzIHdpdGggaXMgX3BjaV9oaWRlX2RldmljZSgpIGFuZCBnY2MgOC4KPj4+
IEludGVyZXN0aW5nbHkgdGhlIGV2ZW4gbW9yZSBzaW1wbGUgbmVpZ2hib3JpbmcgaW9tbXVfaGFz
X2ZlYXR1cmUoKSBkb2VzCj4+PiBnZXQgYSBmcmFtZSBwb2ludGVyIHNldCB1cCwgYXJvdW5kIGp1
c3QgYSBzaW5nbGUgaW5zdHJ1Y3Rpb24uIEJ1dCB0aGlzCj4+PiBtYXkgYmUgYSByZXN1bHQgb2Yg
dGhlIHNpemUtb2YtYXNtKCkgZWZmZWN0cyBkaXNjdXNzZWQgZWxzZXdoZXJlLikKPj4+Cj4+PiBM
b2cgdGhlIHRvcC1vZi1zdGFjayB2YWx1ZSBpZiBpdCBsb29rcyB2YWxpZCBfb3JfIGlmIFJJUCBs
b29rcyBpbnZhbGlkLgo+PiBUaGlzIGZhciwgSSdtIGhhcHB5IHdpdGguCj4+Cj4+PiBBbHNvIGFu
bm90YXRlIG5vbi1mcmFtZS1wb2ludGVyLWJhc2VkIHN0YWNrIHRyYWNlIGVudHJpZXMgd2l0aCBh
Cj4+PiBxdWVzdGlvbiBtYXJrLCB0byBzaWduYWwgY2xlYXJseSB0aGF0IGFueSBvbmUgb2YgdGhl
bSBtYXkgbm90IGFjdHVhbGx5Cj4+PiBiZSBwYXJ0IG9mIHRoZSBjYWxsIHN0YWNrLgo+PiBJJ20g
c3RpbGwgb3Bwb3NlZCB0byB0aGlzLsKgIFRoZSBpbnRyb2R1Y3Rpb24gb2YgPyBkb2VzIG1vcmUg
aGFybSB0aGFuCj4+IGdvb2QgSU1PLCBiZWNhdXNlIGl0IHNpbXBseSBjYW4ndCBiZSB0cnVzdGVk
Lgo+Pgo+PiBTdGFjayB0cmFjZXMgYXJlIG5vdCBndWFyYW50ZWVkLWFjY3VyYXRlLCBldmVuIHdp
dGggZnJhbWUgcG9pbnRlcnMKPj4gZW5hYmxlZC7CoCBUaGUgb25seSB0aGluZyB3ZSBjYW4gc2F5
IGZvciBjZXJ0YWluIGluIGFueSB0cmFjZSBpcyB3aGVyZQo+PiAlcmlwIHBvaW50cy4KPiBZZXMs
IEkgcmVhbGl6ZSB5b3Ugc3RpbGwgZG9uJ3QgbGlrZSB0aGlzLiBCdXQgc2ltaWxhcmx5IHRvIHRo
ZQo+IG90aGVyIHBhdGNoIHNldCAtIG9uIHRoZSB2MSBkaXNjdXNzaW9uIGhlcmUgSSB3YXMgbGFj
a2luZwo+IGZlZWRiYWNrLCBhbmQgaGVuY2UgSSBldmVudHVhbGx5IHRpbWVkIG91dCBhbmQgc2Vu
dCB2Mi4gVGhlCj4gcXVlc3Rpb24gaXMgLSB3aGF0IGlzIHlvdXIgYWx0ZXJuYXRpdmUgcHJvcG9z
YWwgdG8gZGlzdGluZ3Vpc2gKPiB0aGUgdHJ1bHkgZ3Vlc3NlZCBlbnRyeSBsb2dnZWQgaGVyZSBm
cm9tIHRoZSBtb3JlIHJlbGlhYmxlCj4gb25lcz8gQW5kIHRoZW4gc2ltaWxhcmx5IGhvdyB0byBk
aXN0aW5ndWlzaCB0aGUgbGVzcyByZWxpYWJsZQo+IG9uZXMgcHJvZHVjZWQgYnkgdGhlICFDT05G
SUdfRlJBTUVfUE9JTlRFUiB2YXJpYW50IG9mCj4gX3Nob3dfdHJhY2UoKSBmcm9tIHRoZWlyIG1v
cmUgcmVsaWFibGUgY291bnRlcnBhcnRzPwoKQSBjcmF6eSBpZGVhIEkndmUganVzdCBoYWQuwqAg
QW5ub3RhdGUgYWxsIHByaW50ZWQgbGluZXMgd2l0aCBhIGNoYXJhY3RlcgppZGVudGlmeWluZyB3
aGljaCBzb3VyY2Ugb2YgaW5mb3JtYXRpb24gd2UgdXNlZD8KCldlIGNvdWxkIGhhdmUgW3JdIGZv
ciByZWdpc3RlciBzdGF0ZSwgW2ZdIGZvciAiZnJvbSBmcmFtZSBwb2ludGVyIiwgYW5kCltzXSBm
b3IgImZyb20gc3RhY2sgcnViYmxlIi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
