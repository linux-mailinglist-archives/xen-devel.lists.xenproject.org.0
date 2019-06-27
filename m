Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3620758E94
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 01:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgdr7-0000mz-5t; Thu, 27 Jun 2019 23:31:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IHO3=U2=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hgdr6-0000mu-3I
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 23:31:04 +0000
X-Inumbo-ID: 9f0b7de0-9933-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9f0b7de0-9933-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 23:31:01 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 28 Jun
 2019 07:26:52 +0800
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini
 <sstabellini@kernel.org>
References: <a7c44d926cbe4a0e6447c4aaf8d9862e@sslemail.net>
 <af3fe48d-afaa-3184-e142-9a1e2b8574f4@arm.com>
 <2ed30cde-e2ab-745e-94f5-0cf6155c9122@mxnavi.com>
 <7c645dfb-72f5-5fc2-b559-0a4d09ba8801@arm.com>
 <36531850-15de-2642-6f28-c752a360959c@mxnavi.com>
 <alpine.DEB.2.21.1906241109440.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241121070.2468@sstabellini-ThinkPad-T480s>
 <bc042ae4-db0a-6b25-1e9c-d71a73a0315d@arm.com>
 <alpine.DEB.2.21.1906241313480.2468@sstabellini-ThinkPad-T480s>
 <c253cdaf-658d-01ce-9d32-273db4a84f17@arm.com>
 <alpine.DEB.2.21.1906241435510.2468@sstabellini-ThinkPad-T480s>
 <7975c4d5-310f-3041-a32c-128d9237616d@arm.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <e34d4f94-ac8f-b88f-267c-475fccc15a44@mxnavi.com>
Date: Fri, 28 Jun 2019 07:30:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7975c4d5-310f-3041-a32c-128d9237616d@arm.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen/arm: io: add function
 swap_mmio_handler()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMjUvMTkgMTY6NDYsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaVN0ZWZhbm8sCj4KPiBP
biAyNS8wNi8yMDE5IDAwOjU5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+IE9uIE1vbiwg
MjQgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDYvMjQv
MTkgOToxNyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+IE9uIE1vbiwgMjQgSnVu
IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4gSGkgU3RlZmFubywKPj4+Pj4KPj4+Pj4g
T24gMjQvMDYvMjAxOSAxOToyNywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+Pj4gT24g
TW9uLCAyNCBKdW4gMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+Pj4+IE9uIFRo
dSwgMTMgSnVuIDIwMTksIGNoZW5iYW9kb25nIHdyb3RlOgo+Pj4+Pj4gTGV0IG1lIGFkZCB0aGF0
IGlmIHlvdSBwcmVmZXIgdG8gZG9jdW1lbnQgb25lIG9mIHRoZSBvdGhlciAKPj4+Pj4+IGludGVy
ZmFjZXMKPj4+Pj4+IGxpc3RlZCBhYm92ZSBpbiBteSBlbWFpbCwgeW91IGFyZSB3ZWxjb21lIHRv
IHBpY2sgYW5vdGhlciBvbmUuIEZvcgo+Pj4+Pj4gZXhhbXBsZSwgd2UgYXJlIGFsc28gbWlzc2lu
ZyBhIGRvYyBhYm91dCB0aGUgRG9tVSBtZW1vcnkgbWFwLCAKPj4+Pj4+IGxpc3RpbmcKPj4+Pj4+
IGFsbCBtZW1vcnkgcmVnaW9ucyB3aXRoIGFkZHJlc3NlcyBhbmQgc2l6ZXMsIGJvdGggTU1JTyBh
bmQgbm9ybWFsCj4+Pj4+PiBtZW1vcnkuIEZvciB0aGF0LCBtb3N0IG9mIHRoZSBpbmZvcm1hdGlv
biBpczoKPj4+Pj4+Cj4+Pj4+PiB4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAo+Pj4+Pj4K
Pj4+Pj4+IEEgd2VsbCB3cml0dGVuIGluLWNvZGUgY29tbWVudCBpbiBhcmNoLWFybS5oIHdvdWxk
IGJlIE9LLCBvciBhbHNvIGEKPj4+Pj4+IGRvY3VtZW50IHVuZGVyIGRvY3MvbWlzYy9hcm0uCj4+
Pj4+Cj4+Pj4+IFBsZWFzZSBubyBkdXBsaWNhdGlvbiwgaXQgaXMgYWxyZWFkeSBxdWl0ZSBoYXJk
IHRvIG1haW50YWluIG9uZSAKPj4+Pj4gcGxhY2UuCj4+Pj4+IEluc3RlYWQsIHdlIHNob3VsZCBk
b2N1bWVudCBhbGwgdGhlIGhlYWRlcnMgaW4gYSBkb2N1bWVudGVkIGZvcm1hdCAKPj4+Pj4gdGhh
dAo+Pj4+PiBjYW4gYmUgZXh0cmFjdGVkIGF1dG9tYXRpY2FsbHkuCj4+Pj4KPj4+PiBBcyB3ZSBo
YXZlIG5vIHN1Y2ggdGhpbmcgdG9kYXkgKGFzIGZhciBhcyBJIGFtIGF3YXJlKSwgcGxlYXNlIG1h
a2UgYQo+Pj4+IHByb3Bvc2FsIHdpdGggYSBiaXQgbW9yZSBkZXRhaWxzLCBvdGhlcndpc2UgSSBk
b24ndCB0aGluayBCYW9kb25nIHdpbGwKPj4+PiBiZSBhYmxlIHRvIHRha2UgdGhlIG5leHQgc3Rl
cC4KPj4+Cj4+PiBJIGRvbid0IGhhdmUgYSBjb25jcmV0ZSBwcm9wb3NhbCBzbyBmYXIuIEV4Y2Vw
dCB0aGF0IGRvY3VtZW50YXRpb24gCj4+PiBvdXRzaWRlIG9mCj4+PiB0aGUgaGVhZGVycyBpcyBh
IG5vLWdvIGZyb20gbXkgc2lkZS4gVGhlIGdvYWwgb2YgZG9jdW1lbnRpbmcgd2l0aGluIHRoZQo+
Pj4gaGVhZGVycyByYXRoZXIgdGhhbiBvdXRzaWRlIGlzIHlvdSBhbHNvIGhlbHAgdGhlIGRldmVs
b3BlciBvZiBndWVzdCBPUy4KPj4+Cj4+PiBBIGZldyB3ZWVrcyBhZ28gSWFuIEphY2tzb24gcG9p
bnRlZCB0byBkb2NzL3hlbi1oZWFkZXJzIGZvciBhIHBvdGVudGlhbAo+Pj4gc3ludGF4LiBTYWRs
eSwgdGhlcmUgYXJlIG5vIGRvY3VtZW50YXRpb24gb2YgdGhlIHNjcmlwdCBzbyBmYXIuIEkgCj4+
PiBoYXZlbid0IGhhZAo+Pj4gdGltZSB0byBsb29rIGl0IHNvIGZhci4KPj4KPj4gSW4gdGhhdCBj
YXNlLCBJJ2Qgc3VnZ2VzdCBmb3IgQmFvZG9uZyB0byBlaXRoZXIgcGljayB0aGUgZGV2aWNlIHRy
ZWUKPj4gZG9jdW1lbnRhdGlvbiBpdGVtIChhc3N1bWluZyB5b3UgYXJlIE9LIHdpdGggdGhhdCBv
bmUgYmVpbmcgdW5kZXIKPj4gZG9jcy9taXNjL2FybSkgb3IganVzdCB3cml0ZSBhIG5vcm1hbCBp
bi1jb2RlIGNvbW1lbnQgaW4gYXJjaC1hcm0uaCBmb3IKPj4gdGhlIGRvbVUgbWVtb3J5IG1hcCBu
b3Qgd29ycnlpbmcgYWJvdXQgdGhlIGZvcm1hdCBvZiB0aGUgaW4tY29kZSBjb21tZW50Cj4+IGZv
ciBub3cuCj4KPiBJIGRvbid0IHRoaW5rIHdlIGhhdmUgc3BlY2lmaWMgcGxhY2UgZm9yIGRvY3Vt
ZW50aW5nIGRldmljZS10cmVlIHNvIAo+IGRvY3MvbWlzYy9hcm0gd291bGQgYmUgc3VpdGFibGUu
Cj4KPiBSZWdhcmRpbmcgaW4tY29kZSBjb21tZW50IGluIGFyY2gtYXJtLmggVGhpcyB3aWxsIGFs
d2F5cyBiZSBhbiAKPiBpbXByb3ZlbWVudCB0byB3aGF0IHdlIGhhdmUuIEhvd2V2ZXIsIGl0IHdv
dWxkIGJlIGdvb2QgaWYgc29tZW9uZSB0YWtlIAo+IGFuIGFjdGlvbiB0byBmb3JtYWxpemUgdGhl
IGRvY3VtZW50YXRpb24gZm9ybWF0LgoKSSB3aWxsIGxvb2sgaW50byB0aGlzLgoKQ3VycmVudGx5
IGludGVycnVwdGVkIGJ5IHNvbWUgb3RoZXIgd29yaywgd2lsbCBiZSBiYWNrIHNvb24uCgo+Cj4g
Q2hlZXJzLAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
