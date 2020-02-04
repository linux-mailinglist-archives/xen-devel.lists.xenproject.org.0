Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E592151D03
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:17:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyzt2-0007V3-F5; Tue, 04 Feb 2020 15:13:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyzt0-0007Uy-8d
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:13:10 +0000
X-Inumbo-ID: d9cc4f27-4760-11ea-8f7d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9cc4f27-4760-11ea-8f7d-12813bfff9fa;
 Tue, 04 Feb 2020 15:13:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89881AC79;
 Tue,  4 Feb 2020 15:13:07 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200204133357.32101-1-julien@xen.org>
 <c24750e9-427b-1208-d220-f5c06e543966@suse.com>
 <3199dd4d-1b3e-4ba8-9f76-6a6ed0c7c067@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93abbe1a-d6f5-1322-f1a2-5f0fa3393de8@suse.com>
Date: Tue, 4 Feb 2020 16:13:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <3199dd4d-1b3e-4ba8-9f76-6a6ed0c7c067@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/mm: Avoid assuming PG_state_inuse == 0
 in assign_pages()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxNDo1MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDA0LzAy
LzIwMjAgMTM6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwNC4wMi4yMDIwIDE0OjMzLCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBBdCB0aGUgbW9tZW50LCBhc3NpZ25fcGFnZXMoKSByZWxp
ZXMgb24gUEdfc3RhdGVfaW51c2UgdG8gYmUgMC4gVGhpcwo+Pj4gbWFrZXMgdGhlIGNvZGUgc2xp
Z2h0bHkgbW9yZSBkaWZmaWN1bHQgdG8gdW5kZXJzdGFuZC4KPj4KPj4gSSBjYW4gY2VydGFpbmx5
IHNlZSB3aGVyZSB5b3UncmUgY29taW5nIGZyb20sIGJ1dCAuLi4KPj4KPj4+IC0tLSBhL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jCj4+PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+Pj4g
QEAgLTIyODYsMTAgKzIyODYsMTEgQEAgaW50IGFzc2lnbl9wYWdlcygKPj4+ICAgICAgIGZvciAo
IGkgPSAwOyBpIDwgKDEgPDwgb3JkZXIpOyBpKysgKQo+Pj4gICAgICAgewo+Pj4gICAgICAgICAg
IEFTU0VSVChwYWdlX2dldF9vd25lcigmcGdbaV0pID09IE5VTEwpOwo+Pj4gLSAgICAgICAgQVNT
RVJUKCFwZ1tpXS5jb3VudF9pbmZvKTsKPj4+ICsgICAgICAgIEFTU0VSVChwYWdlX3N0YXRlX2lz
KCZwZ1tpXSwgaW51c2UpKTsKPj4+ICsgICAgICAgIEFTU0VSVCghKHBnW2ldLmNvdW50X2luZm8g
JiAoflBHQ19zdGF0ZSkpKTsKPj4KPj4gLi4uIEkgdGhpbmsgdGhpcyBvbmUgaXMgYmV0dGVyIGlu
IGl0cyBvcmlnaW5hbCBmb3JtLiBBbiBvcHRpb24KPj4gbWlnaHQgYmUgdG8gcHV0IGEgQlVJTERf
QlVHX09OKCkgbmV4dCB0byBpdC4KPiAKPiBJIHdhbnQgdG8gYXZvaWQgYSBCVUlMRF9CVUdfT04o
KSBpZiBwb3NzaWJsZS4gSSBqdXN0IHJlYWxpemVkLCBJIGNvdWxkIAo+IHNpbXBsaWZ5IHRvICIo
cGdbaV0uY291bnRfaW5mbyAhPSBQR0Nfc3RhdGVfaW51c2UpIi4KPiAKPiBXb3VsZCB0aGF0IGJl
IG1vcmUgc3VpdGFibGU/CgpZZXMsIGNlcnRhaW5seS4KCkhvd2V2ZXIsIGlzbid0IHRoZSBBU1NF
UlQoKSBpdHNlbGYgd3Jvbmc/IFdlIGRvbid0IGhvbGQgdGhlIGhlYXAgbG9jawpoZXJlLCBzbyBt
YXJrX3BhZ2Vfb2ZmbGluZSgpIGNvdWxkIHRyYW5zaXRpb24gdGhlIHBhZ2UgZnJvbSBpbnVzZSB0
bwpvZmZsaW5pbmcgKGFuZCBwb3NzaWJseSBhbHNvIHNldCBQR0NfYnJva2VuIG9uIGl0KSBhdCBh
bnkgcG9pbnQgaW4KdGltZS4gVGhpcyB3YXNuJ3Qgb2J2aW91cyB3aXRob3V0IHRoZSB0d28gUEdD
X2ludXNlIHVzZXMgeW91IGFkZCwgYnV0CmJlY29tZXMgcHJldHR5IGFwcGFyZW50IHdpdGggdGhl
bS4gT2YgY291cnNlIHRoZSBzaW1wbGUgYXNzaWdubWVudAp0aGF0IHlvdSBhZGp1c3QgZnVydGhl
ciBkb3duIHRoZW4gYWxzbyBjYW4ndCBiZSBhIHNpbXBsZSBhc3NpZ25tZW50CmFueW1vcmUuCgpT
aW5jZSB0aGlzIHdvdWxkIG1vdmUgeW91IHF1aXRlIGZhciBhd2F5IGZyb20gc2ltcGx5IGEgY29z
bWV0aWMKcGF0Y2ggKHRoZSBwcm9ibGVtIGFzIGEgd2hvbGUgbG9va3MgdG8gYmUgd2lkZXIgdGhh
biBqdXN0IHRoZSBvbmUKY2FzZSBhYm92ZSksIEkgY291bGQgdW5kZXJzdGFuZCBpZiB5b3UgZGlk
bid0IHdhbnQgdG8gZml4IHRoaXMgYXQKdGhpcyBvY2Nhc2lvbi4gWWV0IHRoZW4gSSB0aGluayB0
aGUgcGF0Y2ggZGVzY3JpcHRpb24gc2hvdWxkbid0IGdpdmUKdGhlIGltcHJlc3Npb24gdGhhdCBh
bGwgZWxzZSBpcyB3ZWxsLCBidXQgaW5zdGVhZCBhdCBsZWFzdCBvdXRsaW5lCnRoZSBpc3N1ZSAo
Zm9yIHNvbWVvbmUgZWxzZSB0byBwaWNrIHVwLCBwb3NzaWJseSBtZSkuCgo+PiAoSW4gbm8gY2Fz
ZSwgaW1vLAo+PiB0aGVyZSBzaG91bGQgYmUgcGFyZW50aGVzZXMgYXJvdW5kIGEgbmVnYXRpb24g
ZXhwcmVzc2lvbi4pCj4gCj4gV2hpbGUgSSB1bmRlcnN0YW5kIHRoaXMgd291bGQgYmUgdmFsaWQs
IEkgZmluZCBpdCBhIGJpdCBlYXNpZXIgdG8gcmVhZC4KClF1aXRlIHRoZSBvcHBvc2l0ZSBmb3Ig
bWUsIEknbSBhZnJhaWQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
