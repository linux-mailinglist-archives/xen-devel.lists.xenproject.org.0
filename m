Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0772A125885
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 01:33:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihji2-0001Cv-Jf; Thu, 19 Dec 2019 00:30:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XgNm=2J=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1ihji1-0001Co-9D
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 00:30:29 +0000
X-Inumbo-ID: bec3371a-21f6-11ea-b6f1-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bec3371a-21f6-11ea-b6f1-bc764e2007e4;
 Thu, 19 Dec 2019 00:30:25 +0000 (UTC)
Received: from lamp.crc.id.au (lamp.crc.id.au [IPv6:2407:e400:b000:200::8e8e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 47ADB2000A2;
 Thu, 19 Dec 2019 11:30:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1576715422; bh=8lTUc/nnf80YZRi0BfQZeMefhU/srWu8Uwd708DPeSo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=mKQnnu7zCeaQqS2KxJ2KJL7/D+uH4MlMut21ySAnThDJlqVpOpi1IKLYNVLKKEMKE
 0OeLb6VUxGjj4Ln9qNs2FIBfgFFKsQx5RgyH2/tcvRAzOKohMsjcxsNQ+R8J1m9XZ+
 4g7HL3BkXiiyol0t6sCeFXgiAtQyDAl+1uCIV0k0=
MIME-Version: 1.0
Date: Thu, 19 Dec 2019 11:30:20 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: Ian Jackson <ian.jackson@citrix.com>
In-Reply-To: <24058.18686.905401.403506@mariner.uk.xensource.com>
References: <35b942031521f25b63e60634ee86f1b52f504eb3.1576631444.git.netwiz@crc.id.au>
 <24058.18686.905401.403506@mariner.uk.xensource.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <7706f07ae231d11c5f126d1161d5d9bc@crc.id.au>
X-Sender: netwiz@crc.id.au
Subject: Re: [Xen-devel] [PATCH] [tools/hotplug] Use ip on systems where
 brctl is not available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0xMi0xOSAwMjo0MiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gU3RldmVuIEhhaWdoIHdy
aXRlcyAoIltQQVRDSF0gW3Rvb2xzL2hvdHBsdWddIFVzZSBpcCBvbiBzeXN0ZW1zIHdoZXJlCj4g
YnJjdGwgaXMgbm90IGF2YWlsYWJsZSIpOgo+PiBOZXdlciBkaXN0cm9zIGxpa2UgQ2VudE9TIDgg
ZG8gbm90IGhhdmUgYnJjdGwgYXZhaWxhYmxlLiBBcyBzdWNoLCB3ZQo+PiBjYW4ndCB1c2UgaXQg
dG8gY29uZmlndXJlIG5ldHdvcmtpbmcgYW55bW9yZS4KPj4gCj4+IFRoaXMgcGF0Y2ggd2lsbCBm
YWxsIGJhY2sgdG8gJ2lwJyBvciAnYnJpZGdlJyBjb21tYW5kcyBpZiBicmN0bCBpcyBub3QKPj4g
YXZhaWxhYmxlIGluIHRoZSB3b3JraW5nIFBBVEguCj4gCj4gVGhpcyBsb29rcyBnb29kIHRvIG1l
IGF0IGxlYXN0IGluIHRoZSBicmN0bCBjYXNlLiAgSSBoYXZlIHR3byBtaW5vcgo+IGNvbW1lbnRz
Lgo+IAo+IEZvciB0aGUgYXZvaWRhbmNlIG9mIGRvdWJ0LCBJIGd1ZXNzIHlvdSBoYXZlIHRlc3Rl
ZCB0aGlzIGluIHRoZQo+IGBpcCcvYGJyaWRnZScgY2FzZSA/ICBIb3cgdGhvcm91Z2hseSA/IDot
KQoKSSBoYXZlIHRlc3RlZCBpdCB0byB0aGUgcG9pbnQgdGhhdCBpdCdzIGFsbW9zdCBhIHBvcnQg
b2YgdGhlIEZlZG9yYSAKcGF0Y2ggLSBob3dldmVyIHRoZSBGZWRvcmEgcGF0Y2ggcmVtb3ZlcyBi
cmN0bCBjb21wbGV0ZWx5IGluIGZhdm91ciBvZiAKdGhlIGlwIC8gYnJpZGdlIGNvbW1hbmRzLiBX
aGlsZSBJIGhhdmVuJ3Qgc3BlY2lmaWNhbGx5IGRlYnVnZ2VkIHRoZSAKcmVzdWx0IG9uIEZlZG9y
YSwgdGhlIG5ldHdvcmtpbmcgd29ya3Mgc3VjY2Vzc2Z1bGx5IHdoZW4gcnVubmluZyBhIApEb21h
aW4tMCBpbiBGZWRvcmEgMzEgLSB3aGljaCB3YXMgdGhlIHNvdXJjZSBvZiB0aGUgJ2lwJyBjb21t
YW5kcyB0byAKcnVuLgoKPiAKPj4gLWlmIFsgLXogIiRicmlkZ2UiIF0KPj4gLXRoZW4KPj4gLSAg
YnJpZGdlPSQoYnJjdGwgc2hvdyB8IGF3ayAnTlI9PTJ7cHJpbnQkMX0nKQo+PiAtCj4+ICtpZiBb
IC16ICIkYnJpZGdlIiBdOyB0aGVuCj4gCj4gVGhlIHByZXN1bWFibHktdW5pbnRlbnRpb25hbCBz
dHlsZSBjaGFuZ2UgbWFrZXMgdGhlIHJldmlldyBzbGlnaHRseQo+IGhhcmRlci4uLgoKSSdtIGlu
dGVuZGluZyB0byBzdWJtaXQgYSBuZXcgcGF0Y2ggc2VyaWVzIGFmdGVyIHRoaXMgKHRvIG1ha2Ug
CmJhY2twb3J0aW5nIHRoaXMgZWFzaWVyKSB0aGF0IGNsZWFucyB1cCBmb3JtYXR0aW5nIC8gd2hp
dGVzcGFjZSAvIHN5bnRheCAKYWNyb3NzIHRoZSBtYWpvcml0eSBvZiBzY3JpcHRzIGluIHRoZSBM
aW51eCBkaXJlY3RvcnkuIEl0J2xsIGxvb2sgbGlrZSBhIApob3QgbWVzcyB3aGVuIHN1Ym1pdHRp
bmcgdGhlIG5leHQgbG90IG9mIHBhdGNoZXMgLSBidXQgaXRzIGJldHRlciB0aGFuIApub3RoaW5n
LgoKPj4gLSAgICBicmlkZ2U9JChicmN0bCBzaG93IHwgY3V0IC1kICIKPj4gKyAgICBpZiB3aGlj
aCBicmN0bCA+Ji9kZXYvbnVsbDsgdGhlbgo+IAo+IE1heWJlIGludHJvZHVjZQo+ICAgIGhhdmVf
YnJjdGwgKCkgeyAuLi4gfQo+IHNvIHdlIGNhbiBzYXkKPiAgICBpZiBoYXZlX2JyY3RsOyB0aGVu
Cj4gPwoKSSBkb24ndCByZWFsbHkgaGF2ZSBhIHByZWZlcmVuY2UuIGJyY3RsIGlzIHVzZWQgdGhy
b3VnaCBxdWl0ZSBhIGZldyAKc2NyaXB0cyAtIG5vbmUgb2Ygd2hpY2ggcmVhbGx5IGhhdmUgYSBz
dGFuZGFyZCBtZXRob2Qgb2Ygb3BlcmF0aW9uIG9yIApjb21tb24gcHJlc2VudGF0aW9uLiBTb21l
IHNjcmlwdHMgY2FsbCB4ZW4tbmV0d29yay1jb21tb24uc2ggLSBzb21lIGRvIApub3QuCgpXb3Vs
ZCBJIGJlIGNvcnJlY3QgaW4gdGhpbmtpbmcgdGhhdCB5b3VyIHByb3Bvc2FsIHdvdWxkIGJlIHRv
IGVuc3VyZSBhbGwgCm5ldHdvcmsgc2NyaXB0cyBzb3VyY2UgeGVuLW5ldHdvcmstY29tbW9uLnNo
IC0gYnV0IHRoaXMgd291bGQgYmUgYSBtb3JlIAppbnZhc2l2ZSBjaGFuZ2UgZm9yIGJhY2twb3J0
aW5nIC0gaGVuY2UgSSd2ZSB0cmllZCB0byBrZWVwIGl0IGFzIHNpbXBsZSAKYXMgcG9zc2libGUg
Zm9yIG5vdy4KCldvdWxkIGEgcmVzdHJ1Y3R1cmUgb2YgdGhlc2UgdGhpbmdzIGJlIGJldHRlciBm
b3Igc29tZXRoaW5nIHRvIGJlIApjb21taXR0ZWQgYXMgeWV0IGFub3RoZXIgcGF0Y2ggc2V0IChh
ZnRlciBmb3JtYXR0aW5nL3N0eWxlIGNsZWFudXBzKSAKdGhhdCBtYWtlcyB0aGluZ3MgYSBsaXR0
bGUgbW9yZSBjb25zaXN0ZW50PwoKLS0gClN0ZXZlbiBIYWlnaAoKPyBuZXR3aXpAY3JjLmlkLmF1
ICAgICA/IGh0dHBzOi8vd3d3LmNyYy5pZC5hdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
