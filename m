Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8335EAC3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 19:47:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hijIZ-000562-2a; Wed, 03 Jul 2019 17:44:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZJKH=VA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hijIX-00055x-KF
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 17:44:01 +0000
X-Inumbo-ID: 2306c5b2-9dba-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2306c5b2-9dba-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 17:43:59 +0000 (UTC)
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
IronPort-SDR: rE1PPiUYLx+553PsS26Oksn7RexOFKwbp8ae46DhGB/64c3y1B8aHgZXiE5SGq0Sa9UxFpVlt+
 ZL/6ZbYqHeMlMEgoRzBmrALe/TKpJWXvXTpxmgqCCESMqSpp5w0X44Cf0OwaVFjqLZYNLA0Jbq
 2NKHealGMif/ysgufrg943fsEX4QlejwJ6OyjEhnJtOjUKjrtL1bJAPtzWo28FZOG8LkOlynZh
 77t6DNBpk49LLY7g5mUU8wqd+T8ymlTKYnuD76xnUKLBc0yn+8s/WYsfT6bJ633QmHXWm6xBm/
 mPw=
X-SBRS: 2.7
X-MesageID: 2556619
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2556619"
To: Nadav Amit <namit@vmware.com>, Juergen Gross <jgross@suse.com>
References: <20190702235151.4377-1-namit@vmware.com>
 <20190702235151.4377-5-namit@vmware.com>
 <d89e2b57-8682-153e-33d8-98084e9983d6@suse.com>
 <A4BC0EDE-71F0-455D-964A-7250D005FB56@vmware.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6038042c-917f-d361-5d79-f0205152fe00@citrix.com>
Date: Wed, 3 Jul 2019 18:43:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <A4BC0EDE-71F0-455D-964A-7250D005FB56@vmware.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 4/9] x86/mm/tlb: Flush remote and local
 TLBs concurrently
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
Cc: Sasha Levin <sashal@kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, kvm list <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDcvMjAxOSAxODowMiwgTmFkYXYgQW1pdCB3cm90ZToKPj4gT24gSnVsIDMsIDIwMTks
IGF0IDc6MDQgQU0sIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+Cj4+
IE9uIDAzLjA3LjE5IDAxOjUxLCBOYWRhdiBBbWl0IHdyb3RlOgo+Pj4gVG8gaW1wcm92ZSBUTEIg
c2hvb3Rkb3duIHBlcmZvcm1hbmNlLCBmbHVzaCB0aGUgcmVtb3RlIGFuZCBsb2NhbCBUTEJzCj4+
PiBjb25jdXJyZW50bHkuIEludHJvZHVjZSBmbHVzaF90bGJfbXVsdGkoKSB0aGF0IGRvZXMgc28u
IEludHJvZHVjZQo+Pj4gcGFyYXZpcnR1YWwgdmVyc2lvbnMgb2YgZmx1c2hfdGxiX211bHRpKCkg
Zm9yIEtWTSwgWGVuIGFuZCBoeXBlci12IChYZW4KPj4+IGFuZCBoeXBlci12IGFyZSBvbmx5IGNv
bXBpbGUtdGVzdGVkKS4KPj4+IFdoaWxlIHRoZSB1cGRhdGVkIHNtcCBpbmZyYXN0cnVjdHVyZSBp
cyBjYXBhYmxlIG9mIHJ1bm5pbmcgYSBmdW5jdGlvbiBvbgo+Pj4gYSBzaW5nbGUgbG9jYWwgY29y
ZSwgaXQgaXMgbm90IG9wdGltaXplZCBmb3IgdGhpcyBjYXNlLiBUaGUgbXVsdGlwbGUKPj4+IGZ1
bmN0aW9uIGNhbGxzIGFuZCB0aGUgaW5kaXJlY3QgYnJhbmNoIGludHJvZHVjZSBzb21lIG92ZXJo
ZWFkLCBhbmQKPj4+IG1pZ2h0IG1ha2UgbG9jYWwgVExCIGZsdXNoZXMgc2xvd2VyIHRoYW4gdGhl
eSB3ZXJlIGJlZm9yZSB0aGUgcmVjZW50Cj4+PiBjaGFuZ2VzLgo+Pj4gQmVmb3JlIGNhbGxpbmcg
dGhlIFNNUCBpbmZyYXN0cnVjdHVyZSwgY2hlY2sgaWYgb25seSBhIGxvY2FsIFRMQiBmbHVzaAo+
Pj4gaXMgbmVlZGVkIHRvIHJlc3RvcmUgdGhlIGxvc3QgcGVyZm9ybWFuY2UgaW4gdGhpcyBjb21t
b24gY2FzZS4gVGhpcwo+Pj4gcmVxdWlyZXMgdG8gY2hlY2sgbW1fY3B1bWFzaygpIG9uZSBtb3Jl
IHRpbWUsIGJ1dCB1bmxlc3MgdGhpcyBtYXNrIGlzCj4+PiB1cGRhdGVkIHZlcnkgZnJlcXVlbnRs
eSwgdGhpcyBzaG91bGQgaW1wYWN0IHBlcmZvcm1hbmNlIG5lZ2F0aXZlbHkuCj4+PiBDYzogIksu
IFkuIFNyaW5pdmFzYW4iIDxreXNAbWljcm9zb2Z0LmNvbT4KPj4+IENjOiBIYWl5YW5nIFpoYW5n
IDxoYWl5YW5nekBtaWNyb3NvZnQuY29tPgo+Pj4gQ2M6IFN0ZXBoZW4gSGVtbWluZ2VyIDxzdGhl
bW1pbkBtaWNyb3NvZnQuY29tPgo+Pj4gQ2M6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9y
Zz4KPj4+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPj4+IENjOiBJ
bmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KPj4+IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJw
QGFsaWVuOC5kZT4KPj4+IENjOiB4ODZAa2VybmVsLm9yZwo+Pj4gQ2M6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPj4+IENjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQu
Y29tPgo+Pj4gQ2M6IERhdmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5jb20+Cj4+
PiBDYzogQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5vcmc+Cj4+PiBDYzogUGV0ZXIgWmlq
bHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+Pj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9y
aXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4+PiBDYzogbGludXgtaHlwZXJ2QHZnZXIua2VybmVs
Lm9yZwo+Pj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPj4+IENjOiB2aXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwo+Pj4gQ2M6IGt2bUB2Z2VyLmtlcm5l
bC5vcmcKPj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4+IFNpZ25lZC1v
ZmYtYnk6IE5hZGF2IEFtaXQgPG5hbWl0QHZtd2FyZS5jb20+Cj4+PiAtLS0KPj4+ICBhcmNoL3g4
Ni9oeXBlcnYvbW11LmMgICAgICAgICAgICAgICAgIHwgMTMgKysrLS0tCj4+PiAgYXJjaC94ODYv
aW5jbHVkZS9hc20vcGFyYXZpcnQuaCAgICAgICB8ICA2ICstLQo+Pj4gIGFyY2gveDg2L2luY2x1
ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmggfCAgNCArLQo+Pj4gIGFyY2gveDg2L2luY2x1ZGUvYXNt
L3RsYmZsdXNoLmggICAgICAgfCAgOSArKy0tCj4+PiAgYXJjaC94ODYvaW5jbHVkZS9hc20vdHJh
Y2UvaHlwZXJ2LmggICB8ICAyICstCj4+PiAgYXJjaC94ODYva2VybmVsL2t2bS5jICAgICAgICAg
ICAgICAgICB8IDExICsrKy0tCj4+PiAgYXJjaC94ODYva2VybmVsL3BhcmF2aXJ0LmMgICAgICAg
ICAgICB8ICAyICstCj4+PiAgYXJjaC94ODYvbW0vdGxiLmMgICAgICAgICAgICAgICAgICAgICB8
IDY1ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+Pj4gIGFyY2gveDg2L3hlbi9tbXVfcHYu
YyAgICAgICAgICAgICAgICAgfCAyMCArKysrKystLS0KPj4+ICBpbmNsdWRlL3RyYWNlL2V2ZW50
cy94ZW4uaCAgICAgICAgICAgIHwgIDIgKy0KPj4+ICAxMCBmaWxlcyBjaGFuZ2VkLCA5MSBpbnNl
cnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkKPj4gLi4uCj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYveGVuL21tdV9wdi5jIGIvYXJjaC94ODYveGVuL21tdV9wdi5jCj4+PiBpbmRleCBiZWI0
NGUyMmFmZGYuLjE5ZTQ4MWU2ZTkwNCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gveDg2L3hlbi9tbXVf
cHYuYwo+Pj4gKysrIGIvYXJjaC94ODYveGVuL21tdV9wdi5jCj4+PiBAQCAtMTM1NSw4ICsxMzU1
LDggQEAgc3RhdGljIHZvaWQgeGVuX2ZsdXNoX3RsYl9vbmVfdXNlcih1bnNpZ25lZCBsb25nIGFk
ZHIpCj4+PiAgCXByZWVtcHRfZW5hYmxlKCk7Cj4+PiAgfQo+Pj4gIC1zdGF0aWMgdm9pZCB4ZW5f
Zmx1c2hfdGxiX290aGVycyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywKPj4+IC0JCQkJIGNv
bnN0IHN0cnVjdCBmbHVzaF90bGJfaW5mbyAqaW5mbykKPj4+ICtzdGF0aWMgdm9pZCB4ZW5fZmx1
c2hfdGxiX211bHRpKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVzLAo+Pj4gKwkJCQljb25zdCBz
dHJ1Y3QgZmx1c2hfdGxiX2luZm8gKmluZm8pCj4+PiAgewo+Pj4gIAlzdHJ1Y3Qgewo+Pj4gIAkJ
c3RydWN0IG1tdWV4dF9vcCBvcDsKPj4+IEBAIC0xMzY2LDcgKzEzNjYsNyBAQCBzdGF0aWMgdm9p
ZCB4ZW5fZmx1c2hfdGxiX290aGVycyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywKPj4+ICAJ
Y29uc3Qgc2l6ZV90IG1jX2VudHJ5X3NpemUgPSBzaXplb2YoYXJncy0+b3ApICsKPj4+ICAJCXNp
emVvZihhcmdzLT5tYXNrWzBdKSAqIEJJVFNfVE9fTE9OR1MobnVtX3Bvc3NpYmxlX2NwdXMoKSk7
Cj4+PiAgLQl0cmFjZV94ZW5fbW11X2ZsdXNoX3RsYl9vdGhlcnMoY3B1cywgaW5mby0+bW0sIGlu
Zm8tPnN0YXJ0LCBpbmZvLT5lbmQpOwo+Pj4gKwl0cmFjZV94ZW5fbW11X2ZsdXNoX3RsYl9tdWx0
aShjcHVzLCBpbmZvLT5tbSwgaW5mby0+c3RhcnQsIGluZm8tPmVuZCk7Cj4+PiAgICAJaWYgKGNw
dW1hc2tfZW1wdHkoY3B1cykpCj4+PiAgCQlyZXR1cm47CQkvKiBub3RoaW5nIHRvIGRvICovCj4+
PiBAQCAtMTM3NSw5ICsxMzc1LDE3IEBAIHN0YXRpYyB2b2lkIHhlbl9mbHVzaF90bGJfb3RoZXJz
KGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVzLAo+Pj4gIAlhcmdzID0gbWNzLmFyZ3M7Cj4+PiAg
CWFyZ3MtPm9wLmFyZzIudmNwdW1hc2sgPSB0b19jcHVtYXNrKGFyZ3MtPm1hc2spOwo+Pj4gIC0J
LyogUmVtb3ZlIHVzLCBhbmQgYW55IG9mZmxpbmUgQ1BVUy4gKi8KPj4+ICsJLyogRmx1c2ggbG9j
YWxseSBpZiBuZWVkZWQgYW5kIHJlbW92ZSB1cyAqLwo+Pj4gKwlpZiAoY3B1bWFza190ZXN0X2Nw
dShzbXBfcHJvY2Vzc29yX2lkKCksIHRvX2NwdW1hc2soYXJncy0+bWFzaykpKSB7Cj4+PiArCQls
b2NhbF9pcnFfZGlzYWJsZSgpOwo+Pj4gKwkJZmx1c2hfdGxiX2Z1bmNfbG9jYWwoaW5mbyk7Cj4+
IEkgdGhpbmsgdGhpcyBpc24ndCB0aGUgY29ycmVjdCBmdW5jdGlvbiBmb3IgUFYgZ3Vlc3RzLgo+
Pgo+PiBJbiBmYWN0IGl0IHNob3VsZCBiZSBtdWNoIGVhc2llcjoganVzdCBkb24ndCBjbGVhciB0
aGUgb3duIGNwdSBmcm9tIHRoZQo+PiBtYXNrLCB0aGF0J3MgYWxsIHdoYXQncyBuZWVkZWQuIFRo
ZSBoeXBlcnZpc29yIGlzIGp1c3QgZmluZSBoYXZpbmcgdGhlCj4+IGN1cnJlbnQgY3B1IGluIHRo
ZSBtYXNrIGFuZCBpdCB3aWxsIGRvIHRoZSByaWdodCB0aGluZy4KPiBUaGFua3MuIEkgd2lsbCBk
byBzbyBpbiB2My4gSSBkb27igJl0IHRoaW5rIEh5cGVyLVYgcGVvcGxlIHdvdWxkIHdhbnQgdG8g
ZG8KPiB0aGUgc2FtZSwgdW5mb3J0dW5hdGVseSwgc2luY2UgaXQgd291bGQgaW5kdWNlIFZNLWV4
aXQgb24gVExCIGZsdXNoZXMuCgpXaHkgZG8geW91IGJlbGlldmUgdGhlIHZtZXhpdCBtYXR0ZXJz
P8KgIFlvdSdyZSB0YWxraW5nIG9uZSBhbnl3YXkgZm9yCnRoZSBJUEkuCgpJbnRlbCBvbmx5IGhh
dmUgdmlydHVhbGlzZWQgc2VsZi1JUEksIGFuZCB3aGlsZSBBTUQgZG8gaGF2ZSB3b3JraW5nCm5v
bi1zZWxmIElQSXMsIHlvdSBzdGlsbCB0YWtlIGEgdm1leGl0IGFueXdheSBpZiBhbnkgZGVzdGlu
YXRpb24gdmNwdQppc24ndCBjdXJyZW50bHkgcnVubmluZyBpbiBub24tcm9vdCBtb2RlIChJSVJD
KS4KCkF0IHRoYXQgcG9pbnQsIHlvdSBtaWdodCBhcyB3ZWxsIGhhdmUgdGhlIGh5cGVydmlzb3Ig
ZG8gYWxsIHRoZSBoYXJkCndvcmsgdmlhIGEgbXVsdGktY3B1IHNob290ZG93bi9mbHVzaCBoeXBl
cmNhbGwsIHJhdGhlciB0aGFuIHRyeWluZyB0bwphcnJhbmdlIGl0IGxvY2FsbHkuCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
