Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AE3A9C6D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:58:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5mb3-0004FW-32; Thu, 05 Sep 2019 07:54:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QhBR=XA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5mb1-0004FR-KL
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:54:23 +0000
X-Inumbo-ID: 5f38dc78-cfb2-11e9-a337-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f38dc78-cfb2-11e9-a337-bc764e2007e4;
 Thu, 05 Sep 2019 07:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567670062;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zHa4rlMefRvZBoYB2fKvG+93jXn64q/WgZdx4LXEhEQ=;
 b=Ddijwzu/JSgt5IV2je/wHfj+nBEBHjjoCnqPWtm+vL8UoRcU7WHQxZ8q
 2VF5XoOX9DRVYe1tDQrw515Zfrd8Y3DOb7HKiLqsVdoaRkPgHUA1aRy5r
 l18UxcH1DMpY6lhDwWTzTM8EMpsWuGGG88EUNb/rQnzeP+wtDczCScax/ g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gejsiC1PA4DRdnlvVGomZJuRgFbQ41blCJ3AyjDxRYfbxqBcxBTZ8ZoJwbdBuK0khGVxLfHjSL
 PnzqarSfRT4z3IDX5TtzHJ4maAZ3JUY+W2ntlgPA6778kfrVc8FuRoVl2EffDsADYu0truXSdW
 rAgvTwJf0/ZryJxVOn3q6sqGM+68q3BC6H24H230ny+I1+Q2/HzMMjRHlLb0h7Sd1YVaVpuEsg
 7slXz3RPt36xaCBhSjDlzZMs8tL7Mc+pV33lmBbN3PxI2CHHH6wK+ZjjtiwI2zGse0ZY/8wzpW
 mic=
X-SBRS: 2.7
X-MesageID: 5167818
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,469,1559534400"; 
   d="scan'208";a="5167818"
To: Masami Hiramatsu <mhiramat@kernel.org>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
 <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
 <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
Date: Thu, 5 Sep 2019 08:54:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH -tip 0/2] x86: Prohibit kprobes on
 XEN_EMULATE_PREFIX
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Randy Dunlap <rdunlap@infradead.org>, Josh
 Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDkvMjAxOSAwMjo0OSwgTWFzYW1pIEhpcmFtYXRzdSB3cm90ZToKPiBPbiBXZWQsIDQg
U2VwIDIwMTkgMTI6NTQ6NTUgKzAxMDAKPiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPiB3cm90ZToKPgo+PiBPbiAwNC8wOS8yMDE5IDEyOjQ1LCBNYXNhbWkgSGlyYW1h
dHN1IHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gVGhlc2UgcGF0Y2hlcyBhbGxvdyB4ODYgaW5zdHJ1
Y3Rpb24gZGVjb2RlciB0byBkZWNvZGUKPj4+IHhlbi1jcHVpZCB3aGljaCBoYXMgWEVOX0VNVUxB
VEVfUFJFRklYLCBhbmQgcHJvaGliaXQKPj4+IGtwcm9iZXMgdG8gcHJvYmUgb24gaXQuCj4+Pgo+
Pj4gSm9zaCByZXBvcnRlZCB0aGF0IHRoZSBvYmp0b29sIGNhbiBub3QgZGVjb2RlIHN1Y2ggc3Bl
Y2lhbAo+Pj4gcHJlZml4ZWQgaW5zdHJ1Y3Rpb25zLCBhbmQgSSBmb3VuZCB0aGF0IHdlIGFsc28g
aGF2ZSB0bwo+Pj4gcHJvaGliaXQga3Byb2JlcyB0byBwcm9iZSBvbiBzdWNoIGluc3RydWN0aW9u
Lgo+Pj4KPj4+IFRoaXMgc2VyaWVzIGNhbiBiZSBhcHBsaWVkIG9uIC10aXAgbWFzdGVyIGJyYW5j
aCB3aGljaAo+Pj4gaGFzIG1lcmdlZCBKb3NoJ3Mgb2JqdG9vbC9wZXJmIHNoYXJpbmcgY29tbW9u
IHg4NiBpbnNuCj4+PiBkZWNvZGVyIHNlcmllcy4KPj4gVGhlIHBhcmF2aXJ0dWFsaXNlZCB4ZW4t
Y3B1aWQgaXMgd2VyZSB5b3UnbGwgc2VlIGl0IG1vc3QgaW4gYSByZWd1bGFyCj4+IGtlcm5lbCwg
YnV0IGJlIGF3YXJlIHRoYXQgaXQgaXMgYWxzbyB1c2VkIGZvciB0ZXN0aW5nIHB1cnBvc2VzIGlu
IG90aGVyCj4+IGNpcmN1bXN0YW5jZXMsIGFuZCB0aGVyZSBpcyBhbiBlcXVpdmFsZW50IEtWTSBw
cmVmaXggd2hpY2ggaXMgdXNlZCBmb3IKPj4gS1ZNIHRlc3RpbmcuCj4gR29vZCBjYXRjaCEgSSBk
aWRuJ3Qgbm90aWNlIHRoYXQuIElzIHRoYXQgcmVhbGx5IHNhbWUgc2VxdWFuY2Ugb3IgS1ZNIHVz
ZXMKPiBhbm90aGVyIHNlcXVlbmNlIG9mIGluc3RydWN0aW9ucyBmb3IgS1ZNIHByZWZpeD8KCkkg
ZG9uJ3Qga25vdyBpZiB5b3UndmUgc3BvdHRlZCwgYnV0IHRoZSBwcmVmaXggaXMgYSB1ZDJhIGlu
c3RydWN0aW9uCmZvbGxvd2VkIGJ5ICd4ZW4nIGluIGFzY2lpLgoKVGhlIEtWTSB2ZXJzaW9uIHdh
cyBhZGRlZCBpbiBjL3MgNmM4NmVlZGMyMDZkZDFmOWQzN2EyNzk2ZmFhOGU2ZjIyNzgyMTVkMgoK
Pgo+PiBJdCBtaWdodCBiZSBiZXR0ZXIgdG8gZ2VuZXJhbGlzZSB0aGUgZGVjb2RlIHN1cHBvcnQg
dG8gInZpcnR1YWxpc2F0aW9uCj4+IGVzY2FwZSBwcmVmaXgiIG9yIHNvbWV0aGluZyBzbGlnaHRs
eSBtb3JlIGdlbmVyaWMuCj4gQWdyZWVkLCBpdCBpcyBlYXN5IHRvIGV4cGFuZCBpdCwgd2UgY2Fu
IHN3aXRjaCB0aGUgcHJlZml4IHRlbXBsYXRlLgo+IENvdWxkIHlvdSB0ZWxsIG1lIHdoZXJlIEkg
c2hvdWxkIGxvb2s/IEkgd2lsbCBhZGQgaXQuCgpUaGVzZSBhcmUgdGhlIG9ubHkgdHdvIEknbSBh
d2FyZSBvZi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
