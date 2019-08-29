Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A26A1D96
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 16:49:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Lgc-0003G1-NQ; Thu, 29 Aug 2019 14:46:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mvu2=WZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i3Lga-0003Fw-U7
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 14:46:04 +0000
X-Inumbo-ID: b958a2f2-ca6b-11e9-ae69-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b958a2f2-ca6b-11e9-ae69-12813bfff9fa;
 Thu, 29 Aug 2019 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567089963;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gxVrRyoo05gUbHIayzqepXqwV9cXfuTn7NojShaqiYs=;
 b=J20Ze+p/OHwJvbPViYUB2OasxsWbENy6oaKo53qLxzLnfMdptoz5PGYp
 DawlMxxviSUZFlCIk8NPCGSPgp1YC5sDvtXMgw6qurQZIFILVBF+tuTeZ
 Dr4JjDSPHPkVkKWIhwXQZat7cgJz57wOJhOMCmIHE3cq9/DBoFMSa8Jm6 Y=;
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
IronPort-SDR: 1FkgktT9JYxfD2A2LGg3vs52KTn85pQmH9LNa1NhIHYrgS2adjwvX19aM0VMXJF8vf3iMV+FbD
 lafJUPe6eAECpk1vVwNG4iQ6bZw9jvTumGrs3TP1JyJ0tzSxdy87fAQs0bmMdn/xLrLeLK1aTe
 K3szqJybbRhgPARgFMEMa1eroLO/wg64ecgqtVJFlVSH6LffuTDGLzfInv6YtD4dP4ORPRo0G5
 YR8b++K3ihvT5lOymHU5BpMrMgRZk19uvWdD+NQ2UTiAwB0JGqCahMe1z12zuiRkkWgH+krZC/
 RII=
X-SBRS: 2.7
X-MesageID: 5109066
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,443,1559534400"; 
   d="scan'208";a="5109066"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5D03853F0200007800238448@prv1-mh.provo.novell.com>
 <5D03870E0200007800238473@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8c1cbd92-f5b2-122d-c95b-11c96398692b@citrix.com>
Date: Thu, 29 Aug 2019 15:45:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5D03870E0200007800238473@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH RFC 2/3] x86/ACPI: restore VESA mode upon
 resume from S3
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDYvMjAxOSAxMjozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4gb3JkZXIgZm9yICJh
Y3BpX3NsZWVwPXMzX21vZGUiIHRvIGhhdmUgYW55IGVmZmVjdCwgd2Ugc2hvdWxkIHJlY29yZAo+
IHRoZSB2aWRlbyBtb2RlIHdlIHN3aXRjaGVkIHRvIGR1cmluZyBib290LiBTaW5jZSByaWdodCBu
b3cgdGhlcmUncyBtb2RlCj4gc2V0dGluZyBjb2RlIGZvciBWRVNBIG1vZGVzIG9ubHkgaW4gdGhl
IHJlc3VtZSBjYXNlLCByZWNvcmQgdGhlIG1vZGUKPiBqdXN0IGluIHRoYXQgb25lIGNhc2UuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4g
UkZDOiBPbiB0aGUgYm94IHRoYXQgSSd2ZSBiZWVuIHRyeWluZyB0byB0ZXN0IHRoaXMgb24gdGhp
cyBkaWRuJ3QgcmVhbGx5Cj4gICAgICBtYWtlIGEgZGlmZmVyZW5jZSAoaW4gdGhlIHJhbmRvbSBj
YXNlcyB3aGVyZSByZXN1bWUgd29ya3MgaW4gdGhlCj4gICAgICBmaXJzdCBwbGFjZSB0aGVyZSk6
IFRoZSBncmFwaGljcyBjYXJkIGxvb2tzIHRvIHJlbWFpbiBwb3dlcmVkIG9mZgo+ICAgICAgZXZl
biBhZnRlciB0aGUgRG9tMCBrZXJuZWwgaGFzIHJlc3VtZWQuIEFkZGl0aW9uYWxseSB1c2luZwo+
ICAgICAgImFjcGlfc2xlZXA9czNfYmlvcyIgZGlkbid0IG1ha2UgYSBkaWZmZXJlbmNlIGVpdGhl
ci4gRnVydGhlcm1vcmUKPiAgICAgIGl0IGxvb2tzIGxpa2UgdGhlIHNlcmlhbCBjb25zb2xlIChj
b25uZWN0ZWQgdmlhIFBDSSBjYXJkKSBkb2Vzbid0Cj4gICAgICB3b3JrICh5ZXQpIGltbWVkaWF0
ZWx5IGFmdGVyIHJlc3VtZSAoSSBzdXBwb3NlIGl0IHRvbyBpcyBwb3dlcmVkCj4gICAgICBkb3du
KSwgYW5kIHJlc3VtZSBoYW5ncyBhbHRvZ2V0aGVyIHdpdGggaXQgaW4gdXNlLiBIZW5jZSBpdCdz
IHNvcnQKPiAgICAgIG9mIGRpZmZpY3VsdCB0byBhY3R1YWxseSBkZWJ1ZyBhbnl0aGluZyBoZXJl
LgoKV2hpbGUgeW91IHdlcmUgYXdheSwgSSBoYWQgYW4gYXdmdWwgdGltZSBkZWJ1Z2dpbmcgYy9z
IDdhYWU5YzFjOTEsIGV2ZW4Kd2l0aCBDT00xLgoKSSB0aGluayB3ZSBzaG91bGQgdGFrZSBzb21l
IHByb2FjdGl2ZSBzdGVwcyB0byB0cnkgYW5kIG1ha2UgdGhlIHNlcmlhbApzZXR0aW5ncyBtb3Jl
IHJvYnVzdCwgc28gcHJpbnRrKCkgZG9lcyBjb250aW51ZSB0byBmdW5jdGlvbiBiZWZvcmUgdGhl
CmNvbnNvbGUgaXJxIGdldHMgcmVzdG9yZWQuCgpJbiB0aGUgY2FzZSBvZiBsZWdhY3kgQ09NMS9D
T00yLCB0aGlzIHNob3VsZCBiZSBmYWxsaW5nIGJhY2sgdG8gcG9sbGVkCm1vZGUgd2hpY2ggYXQg
bGVhc3QgbGV0cyB0aGUgY2hhcmFjdGVycyBnZXQgb3V0LCBhbmQgZm9yIFBDSSBzZXJpYWwKY2Fy
ZHMsIHdlIHNob3VsZCBwcm9iYWJseSBtYWtlIGFuIGF0dGVtcHQgdG8gYnJpbmcgaXQgb3V0IG9m
IEQzIGFoZWFkIG9mCnJlbHlpbmcgb24gZG9tMCB0byBkbyB0aGlzLgoKPiAtLS0KPiBJJ20gd29u
ZGVyaW5nIGFjdHVhbGx5IHdoZXRoZXIgdGhlIHVzZXIgaGF2aW5nIHRvIGV4cGxpY2l0bHkgcmVx
dWVzdCB0aGUKPiBtb2RlIHJlc3RvcmF0aW9uIGlzIGEgZ29vZCBtb2RlbDogV2h5IHdvdWxkIHdl
IF9ub3RfIHdhbnQgdG8gcmVzdG9yZSB0aGUKPiBtb2RlIHdlJ3ZlIHNldCBkdXJpbmcgYm9vdD8g
SW4gdGhlIHdvcnN0IGNhc2UgRG9tMCBrZXJuZWwgb3IgWCB3aWxsCj4gY2hhbmdlIHRoZSBtb2Rl
IGFub3RoZXIgdGltZS4KCkkgdGhpbmsgSSBhZ3JlZS7CoCBJIGNhbid0IHNlZSBhbnl0aGluZyBn
b29kIHdoaWNoIGNhbiBjb21lIGZyb20gb2ZmZXJpbmcKYSBjaG9pY2UgaGVyZSwgYW5kIEkgYW0g
YWxsIGZvciByZWR1Y2luZyB0aGUgcXVhbnRpdHkgb2YgMTZiaXQgVkdBIGNvZGUKd2UgaGF2ZS4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
