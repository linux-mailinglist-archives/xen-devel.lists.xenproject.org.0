Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C97A43205
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 02:34:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbDea-0007RW-Fd; Thu, 13 Jun 2019 00:31:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1FLL=UM=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hbDeY-0007RR-F6
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 00:31:42 +0000
X-Inumbo-ID: 9b67c08b-8d72-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9b67c08b-8d72-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 00:31:40 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 13 Jun
 2019 08:28:29 +0800
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <a7c44d926cbe4a0e6447c4aaf8d9862e@sslemail.net>
 <af3fe48d-afaa-3184-e142-9a1e2b8574f4@arm.com>
 <2ed30cde-e2ab-745e-94f5-0cf6155c9122@mxnavi.com>
 <7c645dfb-72f5-5fc2-b559-0a4d09ba8801@arm.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <36531850-15de-2642-6f28-c752a360959c@mxnavi.com>
Date: Thu, 13 Jun 2019 08:31:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7c645dfb-72f5-5fc2-b559-0a4d09ba8801@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMTIvMTkgMjA6MjEsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPgo+IE9uIDEyLzA2
LzIwMTkgMTE6MDgsIGNoZW5iYW9kb25nIHdyb3RlOgo+Pgo+PiBPbiA2LzEyLzE5IDE3OjA4LCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiA2LzEyLzE5IDY6NDIgQU0sIEJh
b2RvbmcgQ2hlbiB3cm90ZToKPj4+PiBTd2FwIGZ1bmN0aW9uIGNhbiBiZSB1c2VkIHdoZW4gY2Fs
bGluZyBzb3J0KCkuCj4+Pj4gb3IgZWxzZSwgdGhlIGRlZmF1bHQgc3dhcCBmdW5jdGlvbiBnZW5l
cmljX3N3YXAoKSBpcyB1c2VkLAo+Pj4+IHdoaWNoIGlzIGEgbGl0dGxlIGluZWZmaWNpZW50Lgo+
Pj4KPj4+IEkgYW0gbm90IGVudGlyZWx5IGNvbnZpbmNlIHRoaXMgd2lsbCBiZSBtb3JlIGVmZmlj
aWVudC4gbW1pb19oYW5kbGVyIAo+Pj4gZG9lcyBub3QgZml0IGluIDY0IGJpdCwgc28gdGhlIGNv
bXBpbGVyIG1heSBkZWNpZGUgdG8gZG8gZWl0aGVyIAo+Pj4gbXVsdGlwbGUgbG9hZCBvciByZXBs
YWNlIHdpdGggYSBtZW1jcHkuCj4+Cj4+IEhlbGxvIEp1bGllbiwKPj4KPj4gSSBoYXZlIGNoZWNr
ZWQgdGhlIGRpc2Fzc2VtYmxlIHJlc3VsdCwKPj4KPj4gYW5kIElJVUMgZ2VuZXJpY19zd2FwIGhh
cyBhIGxvb3Agc28gaXQgc2hvdWxkIGJlIGEgbGl0dGxlIAo+PiBpbmVmZmljaWVudC4gSSdtIG5v
dCBleHBlcnQgYWJvdXQgaGFyZHdhcmUsIHBsZWFzZSBjb3JyZWN0IG1lIGlmIGknbSAKPj4gd3Jv
bmcuCj4KPiBJIGFtIG5vdCBhbiBoYXJkd2FyZSBleHBlcnQgdG9vLi4uIEJ1dCBhcyBJIHBvaW50
ZWQgb3V0IGJlbG93IHRoaXMgaXMgCj4gYSBtaWNyby1vcHRpbWl6YXRpb24uIEluIG90aGVyIHdv
cmRzLCB5b3UgYXJlIHRhaWxvcmluZyBhIHNwZWNpZmljIAo+IGZ1bmN0aW9uIHRoYXQgbWF5IHJ1
biBmYXN0ZXIgbm93LCBidXQgdGhpcyBpcyBpbXByb3ZlbWVudCBpcyBnb2luZyB0byAKPiBiZSBs
b3N0IGFzIHRoaXMgaXMganVzdCBhIHZlcnkgdGlueSBwYXJ0IG9mIHRoZSBkb21haW4gY3JlYXRp
b24uCj4KPiBbLi4uXQo+Cj4+Pgo+Pj4gU28gYXQgYmVzdCB0aGlzIGZlZWxzIHNvbWUgbWljcm8t
b3B0aW1pemF0aW9uLiBCdXQgdGhlbiwgdGhpcyBpcyAKPj4+IG9ubHkgY2FsbCBhIGxpbWl0ZWQg
bnVtYmVyIG9mIHRpbWUgYXQgZWFjaCBkb21haW4gYnVpbGQuIElzIGl0IAo+Pj4gcmVhbGx5IHdv
cnRoIGl0Pwo+Pgo+PiBJdCdzIG5vdCBob3QgcGF0aCBoZXJlLgo+Pgo+PiBOb3Qgc3VyZSBhYm91
dCB3b3J0aC4KPj4KPj4gUGVyc29uYWxsecKgIGkgd2lsbCB0cnkgbXkgYmVzdCB0byBkbyB0aGlu
Z3Mgd2VsbCBhY2NvcmRpbmcgdG8gbXkgCj4+IHVuZGVyc3RhbmRpbmcuCj4KPiBNaWNyby1vcHRp
bWl6YXRpb24gYXJlIGFsd2F5cyBnb29kLCBidXQgeW91IGFsc28gaGF2ZSB0byBmYWN0b3IgdGhl
IAo+IGNvc3Qgb2YgbWFpbnRhaW5pbmcgYW5kIHdoZXRoZXIgdGhpcyB3aWxsIGltcHJvdmUgc2ln
bmlmaWNhbnRseSBYZW4uCj4KPj4KPj4+Cj4+PiBPbiBhIHNpZGUgbm90ZSwgSSBoYXZlIG5vdGlj
ZWQgeW91IGFyZSBzZW5kaW5nIGEgbG90IG9mIAo+Pj4gb3B0aW1pemF0aW9uL2NsZWFuLXVwIHBh
dGNoLiBXaGF0IGlzIHlvdXIgZW5kIGdvYWwgaGVyZT8KPj4KPj4gTXkgZ29hbCBpcyB0byB1bmRl
cnN0YW5kIGhvdyB4ZW4gd29ya3Mgd2VsbC4KPj4KPj4+Cj4+PiBJZiBpdCBpcyB0byBpbXByb3Zl
IHRoZSBwZXJmb3JtYW5jZSwgdGhlbiB0aGVyZSBhcmUgbXVjaCBiaWdnZXIgZmlzaCAKPj4+IHRv
IGZyeSB3aXRoaW4gWGVuIGNvZGUgYmFzZS4gSSBhbSBoYXBweSB0byBwb2ludCBzb21lIG9mIHRo
ZW0gYmFzZWQgCj4+PiBvbiB3aGVyZSB5b3UgYXJlIGxvb2tpbmcgdG8gaW1wcm92ZS4KPj4KPj4g
U3VybHkgaSB3YW50IHRvIGltcHJvdmUgcGVyZm9ybWFuY2UuCj4+Cj4+IEZlYXR1cmVzIGxpa2Ug
RmFzdCBTdGFydHVwICggSSBsZWFybmVkIGZyb20geGVuIHN1bW1pdCAyMDE4LCBzYW1zdW5nIAo+
PiBhdXRvbW90aXZlIHByZXNlbnRhdGlvbikuCj4+Cj4+IEJ1dCBjdXJyZW50bHkgaSBkb24ndCB1
bmRlcnN0YW5kIHhlbiB3ZWxsLCBvbmx5IGEgZmV3IHdlZWtzIGV4cGVyaWVuY2UuCj4KPiBXZSBk
byBoYXZlIHNtYWxsIHRhc2sgZm9yIG5ld2NvbWVycyB0aGF0IHdvdWxkIGltcHJvdmUgWGVuIGNv
ZGUgYmFzZSAKPiBhbmQgYWxzbyBhbGxvdyB5b3VyIHRvIHVuZGVyc3RhbmQgbW9yZSBzb21lIHBh
cnQgb2YgdGhlIGNvZGUuCj4KPiBJZiB5b3UgaGF2ZSBhIHNwZWNpZmljIGFyZWEgb2YgaW50ZXJl
c3QsIEkgY2FuIHNlZSBpZiBJIGhhdmUgc29tZSAKPiBzbWFsbCB0YXNrcyB0aGVyZS4KCkknbSBo
YXBweSB3aXRoIHRoaXMuCgpJbnRlcmVzdGVkIGluIGFybSBwbGF0Zm9ybSBmb3IgZW1iZWRkZWQg
YW5kIGF1dG9tb3RpdmUgdXNlIGNhc2UuCgp0aGluZ3MgbGlrZSBpbiB0aGlzIGxpbms6IApodHRw
czovL3hlbnByb2plY3Qub3JnL2RldmVsb3BlcnMvdGVhbXMvZW1iZWRkZWQtYW5kLWF1dG9tb3Rp
dmUvCgoKPgo+IENoZWVycywKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
