Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F111733B0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 10:20:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7bn9-00079l-26; Fri, 28 Feb 2020 09:18:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xa6/=4Q=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j7bn6-00079g-Lp
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 09:18:40 +0000
X-Inumbo-ID: 4e839808-5a0b-11ea-b7e8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e839808-5a0b-11ea-b7e8-bc764e2007e4;
 Fri, 28 Feb 2020 09:18:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3F7C3AC92;
 Fri, 28 Feb 2020 09:18:39 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200228071922.3983-1-jgross@suse.com>
 <e9dd548a-9a32-3d45-3daf-30f080df0b74@suse.com>
 <47ddfaf8-273c-ab52-866d-52d0ca5f3aee@suse.com>
 <dfd112a4-04fc-8beb-a74c-89db85057906@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <451bc44f-2bbf-d55f-00a1-825d78ac6a3a@suse.com>
Date: Fri, 28 Feb 2020 10:18:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dfd112a4-04fc-8beb-a74c-89db85057906@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen: make sure stop_machine_run() is
 always called in a tasklet
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAgMTA6MTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI4LjAyLjIwMjAgMDk6
NTgsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDI4LjAyLjIwIDA5OjI3LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDI4LjAyLjIwMjAgMDg6MTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gV2l0aCBjb3JlIHNjaGVkdWxpbmcgYWN0aXZlIGl0IGlzIG1hbmRhdG9yeSBmb3Igc3RvcF9t
YWNoaW5lX3J1bigpIHRvCj4+Pj4gYmUgY2FsbGVkIGluIGlkbGUgY29udGV4dCBvbmx5IChzbyBl
aXRoZXIgZHVyaW5nIGJvb3Qgb3IgaW4gYSB0YXNrbGV0KSwKPj4+PiBhcyBvdGhlcndpc2UgYSBz
Y2hlZHVsaW5nIGRlYWRsb2NrIHdvdWxkIG9jY3VyOiBzdG9wX21hY2hpbmVfcnVuKCkKPj4+PiBk
b2VzIGEgY3B1IHJlbmRlenZvdXMgYnkgYWN0aXZhdGluZyBhIHRhc2tsZXQgb24gYWxsIG90aGVy
IGNwdXMuIEluCj4+Pj4gY2FzZSBzdG9wX21hY2hpbmVfcnVuKCkgd2FzIG5vdCBjYWxsZWQgaW4g
YW4gaWRsZSB2Y3B1IGl0IHdvdWxkIGJsb2NrCj4+Pj4gc2NoZWR1bGluZyB0aGUgaWRsZSB2Y3B1
IG9uIGl0cyBzaWJsaW5ncyB3aXRoIGNvcmUgc2NoZWR1bGluZyBiZWluZwo+Pj4+IGFjdGl2ZSwg
cmVzdWx0aW5nIGluIGEgaGFuZy4KPj4+Pgo+Pj4+IFB1dCBhIEJVR19PTigpIGludG8gc3RvcF9t
YWNoaW5lX3J1bigpIHRvIHRlc3QgZm9yIGJlaW5nIGNhbGxlZCBpbiBhbgo+Pj4+IGlkbGUgdmNw
dSBvbmx5IGFuZCBhZGFwdCB0aGUgbWlzc2luZyBjYWxsIHNpdGUgKHVjb2RlIGxvYWRpbmcpIHRv
IHVzZSBhCj4+Pj4gdGFza2xldCBmb3IgY2FsbGluZyBzdG9wX21hY2hpbmVfcnVuKCkuCj4+Pj4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4g
LS0tCj4+Pj4gVjI6Cj4+Pj4gLSByZXBocmFzZSBjb21taXQgbWVzc2FnZSAoSnVsaWVuIEdyYWxs
KQo+Pj4+IC0tLQo+Pj4+ICAgIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyAgfCA1NCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+ICAgIHhlbi9jb21t
b24vc3RvcF9tYWNoaW5lLmMgfCAgMSArCj4+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNl
cnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBUaGVyZSdzIG5vIG1lbnRpb24gYW55
d2hlcmUgb2YgYSBjb25uZWN0aW9uIHRvIHlvdXIgUkNVIHNlcmllcywKPj4+IG5vciB0byByY3Vf
YmFycmllcigpLiBZZXQgdGhlIGNoYW5nZSBwdXRzIGEgbmV3IHJlc3RyaWN0aW9uIGFsc28KPj4+
IG9uIGl0cyB1c2UsIGFuZCBpaXJjIHRoaXMgd2FzIG1lbnRpb25lZCBpbiBwcmlvciBkaXNjdXNz
aW9uLiBEaWQKPj4+IEkgbWlzcyBhbnl0aGluZz8KPj4KPj4gQmFzaWNhbGx5IHRoaXMgcGF0Y2gg
bWFrZXMgdGhlIHJlc3RyaWN0aW9uIGV4cGxpY2l0LiBXaXRob3V0IHRoZSBwYXRjaAo+PiBzdG9w
X21hY2hpbmVfcnVuKCkgYmVpbmcgY2FsbGVkIG91dHNpZGUgb2YgYSB0YXNrbGV0IHdvdWxkIGp1
c3QgaGFuZwo+PiB3aXRoIGNvcmUgc2NoZWR1bGluZyBiZWluZyBhY3RpdmUuIE5vdyBpdCB3aWxs
IGNhdGNoIHRob3NlIHZpb2xhdGlvbnMKPj4gZWFybHkgZXZlbiB3aXRoIGNvcmUgc2NoZWR1bGlu
ZyBpbmFjdGl2ZS4KPj4KPj4gTm90ZSB0aGF0IGN1cnJlbnRseSB0aGVyZSBhcmUgbm8gdmlvbGF0
aW9ucyBvZiB0aGlzIHJlc3RyaWN0aW9uIGFueXdoZXJlCj4+IGluIHRoZSBoeXBlcnZpc29yIG90
aGVyIHRoYW4gdGhlIG9uZSBhZGRyZXNzZWQgYnkgdGhpcyBwYXRjaC4KPiAKPiBXZWxsLCB0aGVy
ZSBpcyBhIGNvbm5lY3Rpb24gdG8gY29yZSBzY2hlZHVsaW5nLiBXaXRob3V0IGl0LCBpLmUuCj4g
cHJpb3IgdG8gNC4xMywgdGhlcmUgd2FzIG5vIHJlc3RyaWN0aW9uIG9uIHRoZSBwbGFjZW1lbnQg
b2YKPiByY3VfYmFycmllcigpIGludm9jYXRpb25zLiBBY2NvcmRpbmcgdG8gd2hhdCB5b3Ugc2F5
IGFib3ZlLCB0aGUKPiByZXN0cmljdGlvbiB3YXMgaW1wbGljaXRseSBpbnRyb2R1Y2VkIHdpdGgg
Y29yZSBzY2hlZHVsaW5nLiBJdAo+IHNob3VsZCBpbW8gYmUgbWFkZSBleHBsaWNpdCBieSBhdHRh
Y2hpbmcgYSBjb21tZW50LCB3aGljaCB3b3VsZAo+IChhZ2FpbiBpbW8pIGJlc3QgYmUgZG9uZSBo
ZXJlIGJlY2F1c2Ugbm93IHlvdSBhbHNvIG1ha2UgdGhpcwo+IGNhc2UgY3Jhc2ggd2l0aG91dCBj
b3JlIHNjaGVkdWxpbmcgaW4gdXNlLgoKT2theSwgSSdsbCBhZGQgYSBjb21tZW50IHRvIHN0b3Bf
bWFjaGluZV9ydW4oKSBhbmQgdG8gcmN1X2JhcnJpZXIoKS4gVGhlCnJjdV9iYXJyaWVyKCkgY29t
bWVudCB3aWxsIGJlIHRoZW4gcmVtb3ZlZCBieSBteSByY3Ugc2VyaWVzIGFnYWluLgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
