Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE011870B4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 17:57:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDszZ-0002wK-Tt; Mon, 16 Mar 2020 16:53:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+XhT=5B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jDszY-0002wF-3V
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 16:53:28 +0000
X-Inumbo-ID: a70dcd1b-67a6-11ea-b868-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a70dcd1b-67a6-11ea-b868-12813bfff9fa;
 Mon, 16 Mar 2020 16:53:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2B1FCAE78;
 Mon, 16 Mar 2020 16:53:25 +0000 (UTC)
To: paul@xen.org
References: <20200310174917.1514-1-paul@xen.org>
 <20200310174917.1514-3-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7ab5e54-6ce1-4e3f-0014-9ecebf90d6fa@suse.com>
Date: Mon, 16 Mar 2020 17:53:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310174917.1514-3-paul@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxODo0OSwgcGF1bEB4ZW4ub3JnIHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+IEBAIC0yNTcsNiAr
MjU3LDEzIEBAIHZvaWQgZHVtcF9wYWdlZnJhbWVfaW5mbyhzdHJ1Y3QgZG9tYWluICpkKQo+ICAg
ICAgICAgICAgICAgICBfcChtZm5feChwYWdlX3RvX21mbihwYWdlKSkpLAo+ICAgICAgICAgICAg
ICAgICBwYWdlLT5jb3VudF9pbmZvLCBwYWdlLT51LmludXNlLnR5cGVfaW5mbyk7Cj4gICAgICB9
Cj4gKwo+ICsgICAgcGFnZV9saXN0X2Zvcl9lYWNoICggcGFnZSwgJmQtPmV4dHJhX3BhZ2VfbGlz
dCApCj4gKyAgICB7Cj4gKyAgICAgICAgcHJpbnRrKCIgICAgRXh0cmFQYWdlICVwOiBjYWY9JTA4
bHgsIHRhZj0lIiBQUnR5cGVfaW5mbyAiXG4iLAo+ICsgICAgICAgICAgICAgICBfcChtZm5feChw
YWdlX3RvX21mbihwYWdlKSkpLAo+ICsgICAgICAgICAgICAgICBwYWdlLT5jb3VudF9pbmZvLCBw
YWdlLT51LmludXNlLnR5cGVfaW5mbyk7Cj4gKyAgICB9Cj4gICAgICBzcGluX3VubG9jaygmZC0+
cGFnZV9hbGxvY19sb2NrKTsKCkFub3RoZXIgYmxhbmsgbGluZSBhYm92ZSBoZXJlIHdvdWxkIGhh
dmUgYmVlbiBuaWNlLgoKPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+ICsrKyBiL3hl
bi9jb21tb24vcGFnZV9hbGxvYy5jCj4gQEAgLTIzMTQsNyArMjMxNCw3IEBAIGludCBhc3NpZ25f
cGFnZXMoCj4gICAgICAgICAgc21wX3dtYigpOyAvKiBEb21haW4gcG9pbnRlciBtdXN0IGJlIHZp
c2libGUgYmVmb3JlIHVwZGF0aW5nIHJlZmNudC4gKi8KPiAgICAgICAgICBwZ1tpXS5jb3VudF9p
bmZvID0KPiAgICAgICAgICAgICAgKHBnW2ldLmNvdW50X2luZm8gJiBQR0NfZXh0cmEpIHwgUEdD
X2FsbG9jYXRlZCB8IDE7Cj4gLSAgICAgICAgcGFnZV9saXN0X2FkZF90YWlsKCZwZ1tpXSwgJmQt
PnBhZ2VfbGlzdCk7Cj4gKyAgICAgICAgcGFnZV9saXN0X2FkZF90YWlsKCZwZ1tpXSwgcGFnZV90
b19saXN0KGQsICZwZ1tpXSkpOwo+ICAgICAgfQoKVGhpcyBtb3ZlcyB0aGUgb25lIGV4dHJhIHBh
Z2Ugd2UgY3VycmVudGx5IGhhdmUgKFZNWCdlcyBBUElDIGFjY2VzcwpwYWdlKSB0byBhIGRpZmZl
cmVudCBsaXN0LiBXaXRob3V0IGFkanVzdG1lbnQgdG8gZG9tYWluIGNsZWFudXAsCmhvdyBpcyB0
aGlzIHBhZ2Ugbm93IGdvaW5nIHRvIGdldCBmcmVlZD8gKFRoaXMgb2YgY291cnNlIHRoZW4gc2hv
dWxkCmJlIGV4dGVuZGVkIHRvIEFybSwgZXZlbiBpZiByaWdodCBub3cgdGhlcmUncyBubyAiZXh0
cmEiIHBhZ2UgdGhlcmUuKQoKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPiArKysg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPiBAQCAtNjI5LDEwICs2MjksOCBAQCB0eXBlZGVm
IHN0cnVjdCBtbV9yd2xvY2sgewo+ICAgICAgY29uc3QgY2hhciAgICAgICAgKmxvY2tlcl9mdW5j
dGlvbjsgLyogZnVuYyB0aGF0IHRvb2sgaXQgKi8KPiAgfSBtbV9yd2xvY2tfdDsKPiAgCj4gLSNk
ZWZpbmUgYXJjaF9mcmVlX2hlYXBfcGFnZShkLCBwZykgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiAtICAgIHBhZ2VfbGlzdF9kZWwyKHBnLCBpc194ZW5faGVhcF9wYWdl
KHBnKSA/ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICYoZCktPnhlbnBhZ2VfbGlzdCA6ICYoZCktPnBhZ2VfbGlzdCwgICAgICAgICAgICBcCj4g
LSAgICAgICAgICAgICAgICAgICAmKGQpLT5hcmNoLnJlbG1lbV9saXN0KQo+ICsjZGVmaW5lIGFy
Y2hfZnJlZV9oZWFwX3BhZ2UoZCwgcGcpIFwKPiArICAgIHBhZ2VfbGlzdF9kZWwyKHBnLCBwYWdl
X3RvX2xpc3QoKGQpLCAocGcpKSwgJihkKS0+YXJjaC5yZWxtZW1fbGlzdCkKCkFyZ3VtZW50cyBw
YXNzZWQgb24gYXMgaXMgKGkuZS4gbm90IGFzIHBhcnQgb2YgYW4gZXhwcmVzc2lvbikgZG9uJ3QK
bmVlZCBwYXJlbnRoZXNlcy4KCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL21tLmgKPiArKysgYi94
ZW4vaW5jbHVkZS94ZW4vbW0uaAo+IEBAIC01ODMsOSArNTgzLDggQEAgc3RhdGljIGlubGluZSB1
bnNpZ25lZCBpbnQgZ2V0X29yZGVyX2Zyb21fcGFnZXModW5zaWduZWQgbG9uZyBucl9wYWdlcykK
PiAgdm9pZCBzY3J1Yl9vbmVfcGFnZShzdHJ1Y3QgcGFnZV9pbmZvICopOwo+ICAKPiAgI2lmbmRl
ZiBhcmNoX2ZyZWVfaGVhcF9wYWdlCj4gLSNkZWZpbmUgYXJjaF9mcmVlX2hlYXBfcGFnZShkLCBw
ZykgICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgcGFnZV9saXN0X2RlbChwZywgaXNfeGVu
X2hlYXBfcGFnZShwZykgPyAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAgICAgICAgICYo
ZCktPnhlbnBhZ2VfbGlzdCA6ICYoZCktPnBhZ2VfbGlzdCkKPiArI2RlZmluZSBhcmNoX2ZyZWVf
aGVhcF9wYWdlKGQsIHBnKSBcCj4gKyAgICBwYWdlX2xpc3RfZGVsKHBnLCBwYWdlX3RvX2xpc3Qo
KGQpLCAocGcpKSkKClNhbWUgaGVyZSB0aGVuLgoKPiBAQCAtNTM4LDYgKzUzOSwxNyBAQCBzdHJ1
Y3QgZG9tYWluCj4gICNlbmRpZgo+ICB9Owo+ICAKPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFn
ZV9saXN0X2hlYWQgKnBhZ2VfdG9fbGlzdCgKPiArICAgIHN0cnVjdCBkb21haW4gKmQsIGNvbnN0
IHN0cnVjdCBwYWdlX2luZm8gKnBnKQo+ICt7Cj4gKyAgICBpZiAoIGlzX3hlbl9oZWFwX3BhZ2Uo
cGcpICkKPiArICAgICAgICByZXR1cm4gJmQtPnhlbnBhZ2VfbGlzdDsKPiArICAgIGVsc2UgaWYg
KCBwZy0+Y291bnRfaW5mbyAmIFBHQ19leHRyYSApCgpVbm5lY2Vzc2FyeSAiZWxzZSIuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
