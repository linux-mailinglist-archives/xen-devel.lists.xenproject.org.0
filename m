Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C566188885
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 16:04:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEDjG-0000iQ-NK; Tue, 17 Mar 2020 15:02:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEDjF-0000iL-6M
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 15:02:01 +0000
X-Inumbo-ID: 4043fbc6-6860-11ea-b967-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4043fbc6-6860-11ea-b967-12813bfff9fa;
 Tue, 17 Mar 2020 15:01:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B0CF8AE35;
 Tue, 17 Mar 2020 15:01:58 +0000 (UTC)
To: paul@xen.org
References: <20200310174917.1514-1-paul@xen.org>
 <20200310174917.1514-5-paul@xen.org>
 <f0430298-0d18-5bad-4724-c0f2c941be35@suse.com>
 <004101d5fc6a$f0126d10$d0374730$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c6933c6a-a2b1-03df-8404-4532cab01a55@suse.com>
Date: Tue, 17 Mar 2020 16:01:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <004101d5fc6a$f0126d10$d0374730$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 4/5] mm: add 'is_special_page' inline
 function...
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
Cc: 'Tamas K Lengyel' <tamas@tklengyel.com>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDMuMjAyMCAxNTo0NywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDE3IE1hcmNoIDIwMjAgMTM6MDcKPj4KPj4gT24gMTAuMDMuMjAyMCAxODo0OSwgcGF1
bEB4ZW4ub3JnIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1wb2QuYwo+Pj4g
KysrIGIveGVuL2FyY2gveDg2L21tL3AybS1wb2QuYwo+Pj4gQEAgLTc0OSw4ICs3NDksOSBAQCBw
Mm1fcG9kX3plcm9fY2hlY2tfc3VwZXJwYWdlKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIGdmbl90
IGdmbikKPj4+Cj4+PiAgICAgICAgICBuID0gMVVMIDw8IG1pbihjdXJfb3JkZXIsIFNVUEVSUEFH
RV9PUkRFUiArIDBVKTsKPj4+ICAgICAgICAgIGZvciAoIGsgPSAwLCBwYWdlID0gbWZuX3RvX3Bh
Z2UobWZuKTsgayA8IG47ICsraywgKytwYWdlICkKPj4+IC0gICAgICAgICAgICBpZiAoICEocGFn
ZS0+Y291bnRfaW5mbyAmIFBHQ19hbGxvY2F0ZWQpIHx8Cj4+PiAtICAgICAgICAgICAgICAgICAo
cGFnZS0+Y291bnRfaW5mbyAmIChQR0NfcGFnZV90YWJsZSB8IFBHQ194ZW5faGVhcCkpIHx8Cj4+
PiArICAgICAgICAgICAgaWYgKCBpc19zcGVjaWFsX3BhZ2UocGFnZSkgfHwKPj4+ICsgICAgICAg
ICAgICAgICAgICEocGFnZS0+Y291bnRfaW5mbyAmIFBHQ19hbGxvY2F0ZWQpIHx8Cj4+PiArICAg
ICAgICAgICAgICAgICAocGFnZS0+Y291bnRfaW5mbyAmIFBHQ19wYWdlX3RhYmxlKSB8fAo+Pj4g
ICAgICAgICAgICAgICAgICAgKHBhZ2UtPmNvdW50X2luZm8gJiBQR0NfY291bnRfbWFzaykgPiBt
YXhfcmVmICkKPj4+ICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4+PiAgICAgIH0KPj4+IEBA
IC04ODYsOCArODg3LDkgQEAgcDJtX3BvZF96ZXJvX2NoZWNrKHN0cnVjdCBwMm1fZG9tYWluICpw
Mm0sIGNvbnN0IGdmbl90ICpnZm5zLCB1bnNpZ25lZCBpbnQgY291bnQKPj4+ICAgICAgICAgICAq
IElmIHRoaXMgaXMgcmFtLCBhbmQgbm90IGEgcGFnZXRhYmxlIG9yIGZyb20gdGhlIHhlbiBoZWFw
LCBhbmQKPj4+ICAgICAgICAgICAqIHByb2JhYmx5IG5vdCBtYXBwZWQgZWxzZXdoZXJlLCBtYXAg
aXQ7IG90aGVyd2lzZSwgc2tpcC4KPj4+ICAgICAgICAgICAqLwo+Pj4gLSAgICAgICAgaWYgKCBw
Mm1faXNfcmFtKHR5cGVzW2ldKSAmJiAocGctPmNvdW50X2luZm8gJiBQR0NfYWxsb2NhdGVkKSAm
Jgo+Pj4gLSAgICAgICAgICAgICAhKHBnLT5jb3VudF9pbmZvICYgKFBHQ19wYWdlX3RhYmxlIHwg
UEdDX3hlbl9oZWFwKSkgJiYKPj4+ICsgICAgICAgIGlmICggcDJtX2lzX3JhbSh0eXBlc1tpXSkg
JiYgIWlzX3NwZWNpYWxfcGFnZShwZykgJiYKPj4+ICsgICAgICAgICAgICAgKHBnLT5jb3VudF9p
bmZvICYgUEdDX2FsbG9jYXRlZCkgJiYKPj4+ICsgICAgICAgICAgICAgIShwZy0+Y291bnRfaW5m
byAmIFBHQ19wYWdlX3RhYmxlKSAmJgo+Pj4gICAgICAgICAgICAgICAoKHBnLT5jb3VudF9pbmZv
ICYgUEdDX2NvdW50X21hc2spIDw9IG1heF9yZWYpICkKPj4+ICAgICAgICAgICAgICBtYXBbaV0g
PSBtYXBfZG9tYWluX3BhZ2UobWZuc1tpXSk7Cj4+PiAgICAgICAgICBlbHNlCj4+Cj4+IEkgYXBw
cmVjaWF0ZSB5b3VyIGRlc2lyZSB0byB1c2UgdGhlIGlubGluZSBmdW5jdGlvbiB5b3UgYWRkLCBh
bmQKPj4gSSBhbHNvIGFwcHJlY2lhdGUgdGhhdCB5b3UgbGlrZWx5IHByZWZlciB0byBub3QgbWFr
ZSB0aGUgb3RoZXIKPj4gc3VnZ2VzdGVkIGNoYW5nZSAoYXQgbGVhc3Qgbm90IHJpZ2h0IGhlcmUp
LCBidXQgdGhlbiBJIHRoaW5rIHRoZQo+PiBjb21taXQgbWVzc2FnZSB3b3VsZCBiZXR0ZXIgZ2Fp
biBhIHJlbWFyayByZWdhcmRpbmcgdGhlCj4+IHN1c3BpY2lvdXMgdXNlcyBvZiBQR0NfcGFnZV90
YWJsZSBoZXJlLgo+IAo+IFdoYXQncyBzdXNwaWNpb3VzIGFib3V0IGl0PwoKSG1tLCBsb29rcyBs
aWtlIEkgd2FzIHdyb25nbHkgcmVtZW1iZXJpbmcgc2hhZG93IGNvZGUgdG8gYmUgc2V0dGluZwp0
aGlzIG9uIHRoZSBzaGFkb3dzIG9mIGd1ZXN0IHBhZ2UgdGFibGVzLCByYXRoZXIgdGhhbiBvbiB0
aGUgZ3Vlc3QKcGFnZSB0YWJsZXMgdGhlbXNlbHZlcy4gSSdtIHNvcnJ5IGZvciB0aGUgbm9pc2Uu
IChLZWVwaW5nIHRoZSBiaXQtCmlzLXNldCB0ZXN0cyB0b2dldGhlciBtYXkgc3RpbGwgYmUgYSBn
b29kIGlkZWEgdGhvdWdoIGNvZGUgZ2VuZXJhdGlvbgp3aXNlLCB1bmxlc3MgeW91IGtub3cgdGhh
dCBhbGwgaGFsZndheSByZWNlbnQgY29tcGlsZXIgdmVyc2lvbnMgY2FuCmZvbGQgdGhlIGNvZGUg
ZmluZSBpbiBpdHMgY3VycmVudCBzaGFwZS4pCgo+IEkgbm93IHJlYWxpc2UgdGhlIGFib3ZlIGNv
bW1lbnQgYWxzbyBuZWVkcyBmaXhpbmcuCgpPaCwgaW5kZWVkLgoKPj4gSSBjb250aW51ZSB0byB0
aGluayB0aGF0Cj4+IHRoZXkgc2hvdWxkIGJlIGRyb3BwZWQgYXMgYmVpbmcgcG9pbnRsZXNzLiBJ
biBhbnkgZXZlbnQgSSBmZWFyCj4+IHRoZSByZXN1bHRpbmcgY29kZSB3aWxsIGJlIGxlc3MgZWZm
aWNpZW50LCBhcyBJJ20gdW5jb252aW5jZWQKPj4gdGhhdCB0aGUgY29tcGlsZXIgd2lsbCBmb2xk
IHRoZSBub3cgc3BsaXQgYml0IGNoZWNrcy4KPiAKPiBJIGNvdWxkIGdvIGJhY2sgdG8gZGVmaW5p
bmcgaXNfc3BlY2lhbF9wYWdlKCkgYXMgYSBtYWNyby4KCkkgZG9uJ3QgdGhpbmsgdGhpcyB3b3Vs
ZCBtYWtlIGEgZGlmZmVyZW5jZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
