Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A9514B9A3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:34:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRtR-0003Yd-UO; Tue, 28 Jan 2020 14:31:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwRtQ-0003YV-AQ
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:31:04 +0000
X-Inumbo-ID: cef3b50c-41da-11ea-86e4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cef3b50c-41da-11ea-86e4-12813bfff9fa;
 Tue, 28 Jan 2020 14:31:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 98B9AAD27;
 Tue, 28 Jan 2020 14:31:01 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <93b4ae81-6bfb-f7bd-06be-62032fd9a445@suse.com>
 <fc1d01c9824b49fe963137de2df0794a@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b00f8eb-11c0-9342-e2ac-132d5d16cde7@suse.com>
Date: Tue, 28 Jan 2020 15:31:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <fc1d01c9824b49fe963137de2df0794a@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/HVM: relinquish resources also from
 hvm_domain_destroy()
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
 Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxNToxNCwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbgo+PiBCZXVsaWNoCj4+IFNlbnQ6IDI4
IEphbnVhcnkgMjAyMCAxMzoxNwo+Pgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2hwZXQuYwo+
PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2hwZXQuYwo+PiBAQCAtNzUxLDcgKzc1MSw3IEBAIHZv
aWQgaHBldF9kZWluaXQoc3RydWN0IGRvbWFpbiAqZCkKPj4gICAgICBpbnQgaTsKPj4gICAgICBI
UEVUU3RhdGUgKmggPSBkb21haW5fdmhwZXQoZCk7Cj4+Cj4+IC0gICAgaWYgKCAhaGFzX3ZocGV0
KGQpICkKPj4gKyAgICBpZiAoICFoYXNfdmhwZXQoZCkgfHwgIWQtPmFyY2guaHZtLnBsX3RpbWUg
fHwgIWgtPnN0aW1lX2ZyZXEgKQo+IAo+IFdoeSB0aGUgZXh0cmEgY2hlY2tzIGhlcmU/IEp1c3Qg
dG8gYXZvaWQgdGFraW5nIHRoZSB3cml0ZV9sb2NrKCkKPiBiZWZvcmUgaW5pdD8gSWYgc28sIHRo
ZW4gd291bGRuJ3QgYSBjaGVjayBvZiBzdGltZV9mcmVxIGFsb25lIHN1ZmZpY2U/CgpUaGlzIGFu
ZCB0aGUgb3RoZXIgZnVuY3Rpb25zIG1heSBub3cgYmUgY2FsbGVkIHdpdGgKZC0+YXJjaC5odm0u
cGxfdGltZSBiZWluZyBOVUxMLiBkb21haW5fdmhwZXQoKSB3b3VsZCB5aWVsZCBhCnBvaW50ZXIg
c2xpZ2h0bHkgb2Zmc2V0IGZyb20gTlVMTCBpbiB0aGlzIGNhc2UuIEhlbmNlIHdlIGhhdmUKdG8g
ZG8gdGhpcyBjaGVjayBiZWZvcmUgd2UgbWF5IGRlcmVmIGguCgo+PiAtLS0gYS94ZW4vYXJjaC94
ODYvaHZtL2h2bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4gQEAgLTY5Niwy
NCArNjk2LDI0IEBAIGludCBodm1fZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbgo+PiAg
ICAgIHJldHVybiAwOwo+Pgo+PiAgIGZhaWwyOgo+PiAtICAgIHJ0Y19kZWluaXQoZCk7Cj4gCj4g
SSB1bmRlcnN0YW5kIHRoYXQgdGhpcyByZW1vdmFsIGlzIGRvbmUgYmVjYXVzZQo+IGh2bV9kb21h
aW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSB3aWxsIG5vdyBkZWFsIHdpdGggaXQsCj4gYnV0IEkg
bm90aWNlIGl0IGlzIGFsc28gY2FsbGVkIGZyb20gaHZtX2RvbWFpbl9kZXN0cm95KCksCj4gd2hp
Y2ggc2VlbXMgc3VwZXJmbHVvdXMuCgpPaCwgaW5kZWVkLCB0aGF0IG9uZSBjb3VsZCBnbyBhd2F5
IGFzIHdlbGwgbm93LgoKPj4gICAgICBzdGR2Z2FfZGVpbml0KGQpOwo+PiAgICAgIHZpb2FwaWNf
ZGVpbml0KGQpOwo+PiAgIGZhaWwxOgo+PiAgICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQp
ICkKPj4gICAgICAgICAgeGZyZWUoZC0+YXJjaC5odm0uaW9fYml0bWFwKTsKPj4gLSAgICB4ZnJl
ZShkLT5hcmNoLmh2bS5pb19oYW5kbGVyKTsKPj4gLSAgICB4ZnJlZShkLT5hcmNoLmh2bS5wYXJh
bXMpOwo+PiAtICAgIHhmcmVlKGQtPmFyY2guaHZtLnBsX3RpbWUpOwo+PiAtICAgIHhmcmVlKGQt
PmFyY2guaHZtLmlycSk7Cj4+ICsgICAgWEZSRUUoZC0+YXJjaC5odm0uaW9faGFuZGxlcik7Cj4+
ICsgICAgWEZSRUUoZC0+YXJjaC5odm0ucGFyYW1zKTsKPj4gKyAgICBYRlJFRShkLT5hcmNoLmh2
bS5wbF90aW1lKTsKPj4gKyAgICBYRlJFRShkLT5hcmNoLmh2bS5pcnEpOwo+IAo+IFNob3VsZCB0
aGVzZSBYRlJFRXMgbm90IG5vdyBiZSByZW1vdmVkIGZyb20gaHZtX2RvbWFpbl9kZXN0cm95KCkg
dG9vPwoKSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQ6IFRoaXMgaXMgaW4gaHZtX2RvbWFp
bl9pbml0aWFsaXNlKCkuCmFyY2hfZG9tYWluX2Rlc3Ryb3koKSAoYW5kIGhlbmNlIGh2bV9kb21h
aW5fZGVzdHJveSgpKSB3b24ndCBnZXQKY2FsbGVkIGlmIGh2bV9kb21haW5faW5pdGlhbGlzZSgp
IChhbmQgaGVuY2UgYXJjaF9kb21haW5fZGVzdHJveSgpKQpmYWlscyAoZG9pbmcgc28gaXMsIEkg
dGhpbmssIGEgZnV0dXJlIHBsYW4gb2YgQW5kcmV3J3MpLgoKPj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS9wbXRpbWVyLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9wbXRpbWVyLmMKPj4gQEAg
LTM3Myw3ICszNzMsNyBAQCB2b2lkIHBtdGltZXJfZGVpbml0KHN0cnVjdCBkb21haW4gKmQpCj4+
ICB7Cj4+ICAgICAgUE1UU3RhdGUgKnMgPSAmZC0+YXJjaC5odm0ucGxfdGltZS0+dnBtdDsKPj4K
Pj4gLSAgICBpZiAoICFoYXNfdnBtKGQpICkKPj4gKyAgICBpZiAoICFoYXNfdnBtKGQpIHx8ICFk
LT5hcmNoLmh2bS5wbF90aW1lIHx8ICFzLT52Y3B1ICkKPj4gICAgICAgICAgcmV0dXJuOwo+IAo+
IElzbid0IGEgdGVzdCBvZiBzLT52Y3B1IHN1ZmZpY2llbnQ/CgpObywgZm9yIHRoZSBzYW1lIHJl
YXNvbiBhIHRoYXQgZXhwbGFpbmVkIGZvciBocGV0LmMuCgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL3J0Yy5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vcnRjLmMKPj4gQEAgLTg0NCw3ICs4
NDQsOCBAQCB2b2lkIHJ0Y19kZWluaXQoc3RydWN0IGRvbWFpbiAqZCkKPj4gIHsKPj4gICAgICBS
VENTdGF0ZSAqcyA9IGRvbWFpbl92cnRjKGQpOwo+Pgo+PiAtICAgIGlmICggIWhhc192cnRjKGQp
ICkKPj4gKyAgICBpZiAoICFoYXNfdnJ0YyhkKSB8fCAhZC0+YXJjaC5odm0ucGxfdGltZSB8fAo+
PiArICAgICAgICAgcy0+dXBkYXRlX3RpbWVyLnN0YXR1cyA9PSBUSU1FUl9TVEFUVVNfaW52YWxp
ZCApCj4+ICAgICAgICAgIHJldHVybjsKPiAKPiBUZXN0aW5nIHMtPnB0LnNvdXJjZSBmb3IgYSB6
ZXJvIHZhbHVlIHdvdWxkIGJlIHN1ZmZpY2llbnQgYW5kIGNoZWFwZXIsIEkgdGhpbmsuCgpJdCdz
IG5vdCBvYnZpb3VzIHRvIG1lIHdoZXJlIGluIHJ0Y19pbml0KCkgcy0+cHQuc291cmNlIHdvdWxk
CmdldCBzZXQgdG8gYSBub24temVybyB2YWx1ZS4gSSdkIHByZWZlciB0aGUgY2hlY2sgaGVyZSB0
byBiZQpvYnZpb3VzbHkgY29ubmVjdGVkIHRvIHdoYXQgcnRjX2luaXQoKSBkb2VzLiBJJ20gYWxz
byB1bmNsZWFyCndoeSB5b3UgdGhpbmsgaXQgd291bGQgYmUgY2hlYXBlci4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
