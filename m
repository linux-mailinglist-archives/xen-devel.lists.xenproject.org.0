Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0043C112C6F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 14:18:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icUVQ-0006Qk-V8; Wed, 04 Dec 2019 13:15:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icUVP-0006Qf-Lm
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 13:15:47 +0000
X-Inumbo-ID: 2e2b1971-1698-11ea-8204-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e2b1971-1698-11ea-8204-12813bfff9fa;
 Wed, 04 Dec 2019 13:15:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D64AAC12;
 Wed,  4 Dec 2019 13:15:45 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191204104420.34418-1-roger.pau@citrix.com>
 <a8827921-2d27-de07-8019-e99252dec703@suse.com>
 <20191204115243.GJ980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ecb09829-6ac0-b14b-cc07-2c040bb7c8b1@suse.com>
Date: Wed, 4 Dec 2019 14:15:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204115243.GJ980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86: do not enable global pages when
 virtualized on AMD hardware
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxMjo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIERl
YyAwNCwgMjAxOSBhdCAxMjowNTozNVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDQuMTIuMjAxOSAxMTo0NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3B2L2RvbWFpbi5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMKPj4+
IEBAIC0xMTgsMTEgKzExOCwxOCBAQCB1bnNpZ25lZCBsb25nIHB2X2ZpeHVwX2d1ZXN0X2NyNChj
b25zdCBzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgbG9uZyBjcjQpCj4+PiAgICAgICAgICAgICAg
KG1tdV9jcjRfZmVhdHVyZXMgJiBQVl9DUjRfR1VFU1RfVklTSUJMRV9NQVNLKSk7Cj4+PiAgfQo+
Pj4gIAo+Pj4gK3N0YXRpYyBpbnQgb3B0X2dsb2JhbF9wYWdlcyA9IC0xOwo+Pgo+PiBpbnQ4X3Qg
X19yZWFkX21vc3RseQo+Pgo+Pj4gK2Jvb2xlYW5fcnVudGltZV9wYXJhbSgiZ2xvYmFsLXBhZ2Vz
Iiwgb3B0X2dsb2JhbF9wYWdlcyk7Cj4+PiArCj4+PiAgdW5zaWduZWQgbG9uZyBwdl9tYWtlX2Ny
NChjb25zdCBzdHJ1Y3QgdmNwdSAqdikKPj4+ICB7Cj4+PiAgICAgIGNvbnN0IHN0cnVjdCBkb21h
aW4gKmQgPSB2LT5kb21haW47Cj4+PiAgICAgIHVuc2lnbmVkIGxvbmcgY3I0ID0gbW11X2NyNF9m
ZWF0dXJlcyAmCj4+PiAgICAgICAgICB+KFg4Nl9DUjRfUENJREUgfCBYODZfQ1I0X1BHRSB8IFg4
Nl9DUjRfVFNEKTsKPj4+ICsgICAgYm9vbCBwZ2UgPSBvcHRfZ2xvYmFsX3BhZ2VzID09IC0xID8g
KCFjcHVfaGFzX2h5cGVydmlzb3IgfHwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAhPQo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWDg2X1ZFTkRPUl9BTUQpCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICEhb3B0X2dsb2JhbF9wYWdlczsKPj4K
Pj4gTGV0J3MgYXZvaWQgcmUtZG9pbmcgdGhpcyBldmFsdWF0aW9uIGVhY2ggdGltZSB3ZSBjb21l
IGhlcmUuCj4+IFBvc3QgYm9vdCB0aGUgdmFsdWUgY2FuIG9ubHkgY2hhbmdlIHRvIDAgb3IgMS4g
SGVuY2UgaW4gc29tZQo+PiBfX2luaXQgZnVuY3Rpb24geW91IGNhbiBhcHBseSB0aGUgZGVmYXVs
dCBjYWxjdWxhdGlvbiBkb25lCj4+IGhlcmUuCj4gCj4gSSd2ZSBhc3N1bWVkIHRoYXQgYm9vbGVh
bl9ydW50aW1lX3BhcmFtIGNhbiBiZSBjaGFuZ2VkIGR1cmluZyBydW50aW1lCj4gYnkgdGhlIHVz
ZXIsIGFuZCBoZW5jZSB0aGUgdmFsdWUgY2FsY3VsYXRlZCBhdCBib290IHRpbWUgd291bGQgYmVj
b21lCj4gc3RhbGUgaWYgdGhlIHVzZXIgY2hhbmdlcyBpdCBhZnRlciBib290LCB3aGljaCBzaG91
bGQgYmUgZmluZSBmb3IgdGhpcwo+IG9wdGlvbi4KCkknbSBhZnJhaWQgSSBjYW4ndCBkZWNpZGUg
d2hldGhlciB5b3UgYWdyZWUgb3IgZGlzYWdyZWUgd2l0aCBteQpjb21tZW50LgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
