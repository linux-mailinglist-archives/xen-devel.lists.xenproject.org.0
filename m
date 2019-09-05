Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAB3AA491
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 15:35:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5rrq-0006Fr-Q1; Thu, 05 Sep 2019 13:32:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QhBR=XA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5rro-0006Fg-Mg
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 13:32:04 +0000
X-Inumbo-ID: 8bf749f0-cfe1-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bf749f0-cfe1-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567690324;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Lcc3gqMGanTbkPh44XjaZd0+ZvHIJNfmbgJ9V1Rp25Y=;
 b=FYw6si0KDNa6D6IYZHbmm7OuGJlE0nBTPzhCfDrW/0rccGQ0w/7TvIij
 GEXeDLGveae0GkQ/2yj4SAMLXzYBpVNrsWceJKo0oeW6X4G/vJ8bwubWG
 KUW/rf3rhq1/L+dek4w3YG6OG6gYDTk5fbeG6IUVbGz6UcO4nNb3b/np9 M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0D7GfDJ/REcuiVsBhabK41pNkxL1cYKmQ8/36VcGrGd04fchw6/HgkxGlH6JSpgVMS4H1hH72J
 6X4cLS4N6MHNTg8ATLLwK/Z6sfW4Y1wf57N+QGfcnXaJsoMX6FD/5s51jY3pB6CRnxNkAK5w9c
 LGk0NYkKO4fzdzccLlZCbHLjsGHevABq9/ZDUPCLHbcIVkEF9iQ9rpFywyuvj+zpuGyjqgxmik
 /HAnyCzuv4PBND1pMnSAqMH+HcqciI7aFtLVBiOudnIkSY9jkihWkyjp1Gp2lJV8m4ZQ9nbbMw
 sC4=
X-SBRS: 2.7
X-MesageID: 5230845
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5230845"
To: Masami Hiramatsu <mhiramat@kernel.org>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
 <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
 <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
 <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
 <20190905203224.e41d7f3dfbf918c5031f9766@kernel.org>
 <20190905220958.d0189e1e253f9e553b880675@kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1d868c99-58c5-1bbd-e6a4-2003dd319b5b@citrix.com>
Date: Thu, 5 Sep 2019 14:31:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905220958.d0189e1e253f9e553b880675@kernel.org>
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

T24gMDUvMDkvMjAxOSAxNDowOSwgTWFzYW1pIEhpcmFtYXRzdSB3cm90ZToKPiBPbiBUaHUsIDUg
U2VwIDIwMTkgMjA6MzI6MjQgKzA5MDAKPiBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+PiBPbiBUaHUsIDUgU2VwIDIwMTkgMDg6NTQ6MTcgKzAxMDAKPj4g
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Cj4+PiBP
biAwNS8wOS8yMDE5IDAyOjQ5LCBNYXNhbWkgSGlyYW1hdHN1IHdyb3RlOgo+Pj4+IE9uIFdlZCwg
NCBTZXAgMjAxOSAxMjo1NDo1NSArMDEwMAo+Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4+IE9uIDA0LzA5LzIwMTkgMTI6NDUsIE1h
c2FtaSBIaXJhbWF0c3Ugd3JvdGU6Cj4+Pj4+PiBIaSwKPj4+Pj4+Cj4+Pj4+PiBUaGVzZSBwYXRj
aGVzIGFsbG93IHg4NiBpbnN0cnVjdGlvbiBkZWNvZGVyIHRvIGRlY29kZQo+Pj4+Pj4geGVuLWNw
dWlkIHdoaWNoIGhhcyBYRU5fRU1VTEFURV9QUkVGSVgsIGFuZCBwcm9oaWJpdAo+Pj4+Pj4ga3By
b2JlcyB0byBwcm9iZSBvbiBpdC4KPj4+Pj4+Cj4+Pj4+PiBKb3NoIHJlcG9ydGVkIHRoYXQgdGhl
IG9ianRvb2wgY2FuIG5vdCBkZWNvZGUgc3VjaCBzcGVjaWFsCj4+Pj4+PiBwcmVmaXhlZCBpbnN0
cnVjdGlvbnMsIGFuZCBJIGZvdW5kIHRoYXQgd2UgYWxzbyBoYXZlIHRvCj4+Pj4+PiBwcm9oaWJp
dCBrcHJvYmVzIHRvIHByb2JlIG9uIHN1Y2ggaW5zdHJ1Y3Rpb24uCj4+Pj4+Pgo+Pj4+Pj4gVGhp
cyBzZXJpZXMgY2FuIGJlIGFwcGxpZWQgb24gLXRpcCBtYXN0ZXIgYnJhbmNoIHdoaWNoCj4+Pj4+
PiBoYXMgbWVyZ2VkIEpvc2gncyBvYmp0b29sL3BlcmYgc2hhcmluZyBjb21tb24geDg2IGluc24K
Pj4+Pj4+IGRlY29kZXIgc2VyaWVzLgo+Pj4+PiBUaGUgcGFyYXZpcnR1YWxpc2VkIHhlbi1jcHVp
ZCBpcyB3ZXJlIHlvdSdsbCBzZWUgaXQgbW9zdCBpbiBhIHJlZ3VsYXIKPj4+Pj4ga2VybmVsLCBi
dXQgYmUgYXdhcmUgdGhhdCBpdCBpcyBhbHNvIHVzZWQgZm9yIHRlc3RpbmcgcHVycG9zZXMgaW4g
b3RoZXIKPj4+Pj4gY2lyY3Vtc3RhbmNlcywgYW5kIHRoZXJlIGlzIGFuIGVxdWl2YWxlbnQgS1ZN
IHByZWZpeCB3aGljaCBpcyB1c2VkIGZvcgo+Pj4+PiBLVk0gdGVzdGluZy4KPj4+PiBHb29kIGNh
dGNoISBJIGRpZG4ndCBub3RpY2UgdGhhdC4gSXMgdGhhdCByZWFsbHkgc2FtZSBzZXF1YW5jZSBv
ciBLVk0gdXNlcwo+Pj4+IGFub3RoZXIgc2VxdWVuY2Ugb2YgaW5zdHJ1Y3Rpb25zIGZvciBLVk0g
cHJlZml4Pwo+Pj4gSSBkb24ndCBrbm93IGlmIHlvdSd2ZSBzcG90dGVkLCBidXQgdGhlIHByZWZp
eCBpcyBhIHVkMmEgaW5zdHJ1Y3Rpb24KPj4+IGZvbGxvd2VkIGJ5ICd4ZW4nIGluIGFzY2lpLgo+
Pj4KPj4+IFRoZSBLVk0gdmVyc2lvbiB3YXMgYWRkZWQgaW4gYy9zIDZjODZlZWRjMjA2ZGQxZjlk
MzdhMjc5NmZhYThlNmYyMjc4MjE1ZDIKPiBIbW0sIEkgdGhpbmsgSSBtaWdodCBtaXN1bmRlcnN0
YW5kIHdoYXQgdGhlICJlbXVsYXRlIHByZWZpeCIuLi4gdGhhdCBpcyBub3QKPiBhIHByZWZpeCB3
aGljaCByZXBsYWNlIGFjdHVhbCBwcmVmaXgsIGJ1dCBqdXN0IHdvcmtzIGxpa2UgYW4gZXNjYXBl
IHNlcXVlbmNlLgo+IFRodXMgdGhlIG5leHQgaW5zdHJ1Y3Rpb24gY2FuIGhhdmUgYW55IHg4NiBw
cmVmaXgsIGNvcnJlY3Q/CgpUaGVyZSBpcyBhIGJpdCBvZiBoaXN0b3J5IGhlcmUgOikKCk9yaWdp
bmFsbHksIDEzIHllYXJzIGFnbywgWGVuIGludmVudGVkIHRoZSAiRm9yY2UgRW11bGF0ZSBQcmVm
aXgiLCB3aGljaAp3YXMgdGhlIHNlcXVlbmNlOgoKdWQyYTsgLmFzY2lpICd4ZW4nOyBjcHVpZAoK
d2hpY2ggaGl0IHRoZSAjVUQgaGFuZGxlciBhbmQgd2FzIHJlY29nbmlzZWQgYXMgYSByZXF1ZXN0
IGZvcgp2aXJ0dWFsaXNlZCBDUFVJRCBpbmZvcm1hdGlvbi7CoCBUaGlzIHdhcyBmb3IgcmluZy1k
ZXByaXZpbGVnZWQKdmlydHVhbGlzYXRpb24sIGFuZCBpcyBuZWVkZWQgYmVjYXVzZSB0aGUgQ1BV
SUQgaW5zdHJ1Y3Rpb24gaXRzZWxmCmRvZXNuJ3QgdHJhcCB0byB0aGUgaHlwZXJ2aXNvci4KCkZv
bGxvd2luZyBzb21lIHNlY3VyaXR5IGlzc3VlcyBpbiBvdXIgaW5zdHJ1Y3Rpb24gZW11bGF0b3Is
IEkgcmV1c2VkCnRoaXMgcHJlZml4IHdpdGggVlQteC9TVk0gZ3Vlc3RzIGZvciB0ZXN0aW5nIHB1
cnBvc2VzLsKgIEl0IGJlaGF2ZXMgaW4gYQpzaW1pbGFyIG1hbm5lciAtIHdoZW4gZW5hYmxlZCwg
aXQgaXMgcmVjb2duaXNlZCBpbiAjVUQgZXhjZXB0aW9uCmludGVyY2VwdCwgYW5kIGNhdXNlcyBY
ZW4gdG8gYWRkIDUgdG8gdGhlIGluc3RydWN0aW9uIHBvaW50ZXIsIHRoZW4KZW11bGF0ZSB0aGUg
aW5zdHJ1Y3Rpb24gc3RhcnRpbmcgdGhlcmUuCgpUaGVuIHZhcmlvdXMgZm9sayB0aG91Z2h0IHRo
YXQgaGF2aW5nIHRoZSBzYW1lIGtpbmQgb2YgYWJpbGl0eSB0byB0ZXN0CktWTSdzIGluc3RydWN0
aW9uIGVtdWxhdG9yIHdvdWxkIGJlIGEgZ29vZCBpZGVhLCBzbyB0aGV5IGJvcnJvd2VkIHRoZSBp
ZGVhLgoKRnJvbSBhIGJlaGF2aW91ciBwb2ludCBvZiB2aWV3LCBpdCBpcyBhbiBvcGFxdWUgNSBi
eXRlcyB3aGljaCBtZWFucwoiYnJlYWsgaW50byB0aGUgaHlwZXJ2aXNvciwgdGhlbiBlbXVsYXRl
IHRoZSBmb2xsb3dpbmcgaW5zdHJ1Y3Rpb24iLgoKVGhlIG5hbWUgInByZWZpeCIgaXMgdW5mb3J0
dW5hdGUuwqAgSXQgd2FzIG5hbWVkIHRodXNseSBiZWNhdXNlIGZyb20gdGhlCnByb2dyYW1tZXJz
IHBvaW50IG9mIHZpZXcsIGl0IHdhcyBzb21ldGhpbmcgeW91IHB1dCBiZWZvcmUgdGhlIENQVUlE
Cmluc3RydWN0aW9uIHdoaWNoIHdhbnRlZCB0byBiZSBlbXVsYXRlZC7CoCBJdCBpcyBub3QgcmVs
YXRlZCB0byB4ODYKaW5zdHJ1Y3Rpb24gY29uY2VwdCBvZiBhIHByZWZpeC4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
