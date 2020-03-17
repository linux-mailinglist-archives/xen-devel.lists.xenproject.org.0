Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC07187E9C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 11:47:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE9ih-0002l6-0F; Tue, 17 Mar 2020 10:45:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jE9if-0002l1-1N
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 10:45:09 +0000
X-Inumbo-ID: 5e1477c6-683c-11ea-b907-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e1477c6-683c-11ea-b907-12813bfff9fa;
 Tue, 17 Mar 2020 10:45:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 72322AC5B;
 Tue, 17 Mar 2020 10:45:06 +0000 (UTC)
To: paul@xen.org
References: <20200310174917.1514-1-paul@xen.org>
 <20200310174917.1514-3-paul@xen.org>
 <a7ab5e54-6ce1-4e3f-0014-9ecebf90d6fa@suse.com>
 <003f01d5fbbe$64271aa0$2c754fe0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4918e84d-97bc-e816-829d-858cf1e6676d@suse.com>
Date: Tue, 17 Mar 2020 11:45:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <003f01d5fbbe$64271aa0$2c754fe0$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 2/5] mm: keep PGC_extra pages on a
 separate list
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDMuMjAyMCAxOToxMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDE2IE1hcmNoIDIwMjAgMTY6NTMKPj4KPj4gT24gMTAuMDMuMjAyMCAxODo0OSwgcGF1
bEB4ZW4ub3JnIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4+ICsr
KyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+PiBAQCAtMjMxNCw3ICsyMzE0LDcgQEAgaW50
IGFzc2lnbl9wYWdlcygKPj4+ICAgICAgICAgIHNtcF93bWIoKTsgLyogRG9tYWluIHBvaW50ZXIg
bXVzdCBiZSB2aXNpYmxlIGJlZm9yZSB1cGRhdGluZyByZWZjbnQuICovCj4+PiAgICAgICAgICBw
Z1tpXS5jb3VudF9pbmZvID0KPj4+ICAgICAgICAgICAgICAocGdbaV0uY291bnRfaW5mbyAmIFBH
Q19leHRyYSkgfCBQR0NfYWxsb2NhdGVkIHwgMTsKPj4+IC0gICAgICAgIHBhZ2VfbGlzdF9hZGRf
dGFpbCgmcGdbaV0sICZkLT5wYWdlX2xpc3QpOwo+Pj4gKyAgICAgICAgcGFnZV9saXN0X2FkZF90
YWlsKCZwZ1tpXSwgcGFnZV90b19saXN0KGQsICZwZ1tpXSkpOwo+Pj4gICAgICB9Cj4+Cj4+IFRo
aXMgbW92ZXMgdGhlIG9uZSBleHRyYSBwYWdlIHdlIGN1cnJlbnRseSBoYXZlIChWTVgnZXMgQVBJ
QyBhY2Nlc3MKPj4gcGFnZSkgdG8gYSBkaWZmZXJlbnQgbGlzdC4gV2l0aG91dCBhZGp1c3RtZW50
IHRvIGRvbWFpbiBjbGVhbnVwLAo+PiBob3cgaXMgdGhpcyBwYWdlIG5vdyBnb2luZyB0byBnZXQg
ZnJlZWQ/IChUaGlzIG9mIGNvdXJzZSB0aGVuIHNob3VsZAo+PiBiZSBleHRlbmRlZCB0byBBcm0s
IGV2ZW4gaWYgcmlnaHQgbm93IHRoZXJlJ3Mgbm8gImV4dHJhIiBwYWdlIHRoZXJlLikKPj4KPiAK
PiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGFueSBuZWVkIHRvIGFkanVzdCBhcyB0aGUgY3VycmVu
dCBjb2RlIGluIHdpbGwKPiBkcm9wIHRoZSBhbGxvY2F0aW9uIHJlZiBpbiB2bXhfZnJlZV92bGFw
aWNfbWFwcGluZygpLCBzbyBpdCBkb2Vzbid0Cj4gbWF0dGVyIHRoYXQgaXQgaXMgbWlzc2VkIGJ5
IHJlbGlucXVpc2hfbWVtb3J5KCkuCgpIbW0sIHllcy4gSXQgZmVlbHMgbGlrZSB0aGluIGljZSwg
YnV0IEkgdGhpbmsgeW91J3JlIHJpZ2h0LiBOZXZlcnRoZWxlc3MKdGhlIGZyZWVpbmcgb2YgZXh0
cmEgcGFnZXMgc2hvdWxkIGltbyB1bHRpbWF0ZWx5IG1vdmUgdG8gdGhlIGNlbnRyYWwKcGxhY2Us
IGkuZS4gaXQgd291bGQgc2VlbSBtb3JlIGNsZWFuIHRvIG1lIGlmIHRoZSBwdXRfcGFnZV9hbGxv
Y19yZWYoKQpjYWxsIHdhcyBkcm9wcGVkIGZyb20gdm14X2ZyZWVfdmxhcGljX21hcHBpbmcoKS4K
Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvbW0uaAo+Pj4gQEAgLTYyOSwxMCArNjI5LDggQEAgdHlwZWRlZiBzdHJ1Y3QgbW1f
cndsb2NrIHsKPj4+ICAgICAgY29uc3QgY2hhciAgICAgICAgKmxvY2tlcl9mdW5jdGlvbjsgLyog
ZnVuYyB0aGF0IHRvb2sgaXQgKi8KPj4+ICB9IG1tX3J3bG9ja190Owo+Pj4KPj4+IC0jZGVmaW5l
IGFyY2hfZnJlZV9oZWFwX3BhZ2UoZCwgcGcpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4+PiAtICAgIHBhZ2VfbGlzdF9kZWwyKHBnLCBpc194ZW5faGVhcF9wYWdlKHBn
KSA/ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgJihkKS0+eGVucGFnZV9saXN0IDogJihkKS0+cGFnZV9saXN0LCAgICAgICAgICAgIFwKPj4+
IC0gICAgICAgICAgICAgICAgICAgJihkKS0+YXJjaC5yZWxtZW1fbGlzdCkKPj4+ICsjZGVmaW5l
IGFyY2hfZnJlZV9oZWFwX3BhZ2UoZCwgcGcpIFwKPj4+ICsgICAgcGFnZV9saXN0X2RlbDIocGcs
IHBhZ2VfdG9fbGlzdCgoZCksIChwZykpLCAmKGQpLT5hcmNoLnJlbG1lbV9saXN0KQo+Pgo+PiBB
cmd1bWVudHMgcGFzc2VkIG9uIGFzIGlzIChpLmUuIG5vdCBhcyBwYXJ0IG9mIGFuIGV4cHJlc3Np
b24pIGRvbid0Cj4+IG5lZWQgcGFyZW50aGVzZXMuCj4+Cj4gCj4gQXJlIHlvdSBzYXlpbmcgaXQg
c2hvdWxkIGJlOgo+IAo+ICNkZWZpbmUgYXJjaF9mcmVlX2hlYXBfcGFnZShkLCBwZykgXAo+ICAg
ICBwYWdlX2xpc3RfZGVsMihwZywgcGFnZV90b19saXN0KGQsIHBnKSwgJihkKS0+YXJjaC5yZWxt
ZW1fbGlzdCkKClllcy4gQnV0IGlmIHRoaXMgYW5kIHRoZSBvdGhlciBjb3NtZXRpYyBjaGFuZ2Vz
IGFyZSB0aGUgb25seSBjaGFuZ2VzIHRvCm1ha2UsIEknZCBiZSBmaW5lIHRvIGRvIHNvIHdoaWxl
IGNvbW1pdHRpbmcgKGlmIG5vIG90aGVyIHJlYXNvbiBmb3IgYQp2NyBhcmlzZXMpOgpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
