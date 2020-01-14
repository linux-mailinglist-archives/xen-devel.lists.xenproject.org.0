Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5550B13AE90
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:10:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOjt-0001ed-Bs; Tue, 14 Jan 2020 16:08:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irOjr-0001eU-NO
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:08:19 +0000
X-Inumbo-ID: 0f2cf532-36e8-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f2cf532-36e8-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 16:08:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B0764AAC3;
 Tue, 14 Jan 2020 16:08:09 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200113213342.8206-1-julien@xen.org>
 <20200113213342.8206-5-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84e159cc-6615-aa1b-4d7e-3c284958d28a@suse.com>
Date: Tue, 14 Jan 2020 17:08:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200113213342.8206-5-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] xen/x86: Rework inclusion between
 struct pirq and struct hvm_pirq_dpci
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAyMjozMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vaXJxLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2lycS5jCj4gQEAgLTI5LDcg
KzI5LDggQEAKPiAgCj4gIGJvb2wgaHZtX2RvbWFpbl91c2VfcGlycShjb25zdCBzdHJ1Y3QgZG9t
YWluICpkLCBjb25zdCBzdHJ1Y3QgcGlycSAqcGlycSkKPiAgewo+IC0gICAgcmV0dXJuIGlzX2h2
bV9kb21haW4oZCkgJiYgcGlycSAmJiBwaXJxLT5hcmNoLmh2bS5lbXVpcnEgIT0gSVJRX1VOQk9V
TkQ7Cj4gKyAgICByZXR1cm4gaXNfaHZtX2RvbWFpbihkKSAmJiBwaXJxICYmCj4gKyAgICAgICAg
Y29uc3RfcGlycV9kcGNpKHBpcnEpLT5lbXVpcnEgIT0gSVJRX1VOQk9VTkQ7Cj4gIH0KPiAgCj4g
IC8qIE11c3QgYmUgY2FsbGVkIHdpdGggaHZtX2RvbWFpbi0+aXJxX2xvY2sgaG9sZCAqLwo+IEBA
IC0zOTYsNyArMzk3LDcgQEAgaW50IGh2bV9pbmplY3RfbXNpKHN0cnVjdCBkb21haW4gKmQsIHVp
bnQ2NF90IGFkZHIsIHVpbnQzMl90IGRhdGEpCj4gICAgICAgICAgICAgIHN0cnVjdCBwaXJxICpp
bmZvID0gcGlycV9pbmZvKGQsIHBpcnEpOwo+ICAKPiAgICAgICAgICAgICAgLyogaWYgaXQgaXMg
dGhlIGZpcnN0IHRpbWUsIGFsbG9jYXRlIHRoZSBwaXJxICovCj4gLSAgICAgICAgICAgIGlmICgg
IWluZm8gfHwgaW5mby0+YXJjaC5odm0uZW11aXJxID09IElSUV9VTkJPVU5EICkKPiArICAgICAg
ICAgICAgaWYgKCAhaW5mbyB8fCBwaXJxX2RwY2koaW5mbyktPmVtdWlycSA9PSBJUlFfVU5CT1VO
RCApCj4gICAgICAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgIGludCByYzsKPiAgCj4gQEAg
LTQwOSw3ICs0MTAsNyBAQCBpbnQgaHZtX2luamVjdF9tc2koc3RydWN0IGRvbWFpbiAqZCwgdWlu
dDY0X3QgYWRkciwgdWludDMyX3QgZGF0YSkKPiAgICAgICAgICAgICAgICAgIGlmICggIWluZm8g
KQo+ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gICAgICAgICAgICAgIH0K
PiAtICAgICAgICAgICAgZWxzZSBpZiAoIGluZm8tPmFyY2guaHZtLmVtdWlycSAhPSBJUlFfTVNJ
X0VNVSApCj4gKyAgICAgICAgICAgIGVsc2UgaWYgKCBwaXJxX2RwY2koaW5mbyktPmVtdWlycSAh
PSBJUlFfTVNJX0VNVSApCj4gICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgICAg
ICAgICAgICAgc2VuZF9ndWVzdF9waXJxKGQsIGluZm8pOwo+ICAgICAgICAgICAgICByZXR1cm4g
MDsKCkFsbCBvZiB0aGVzZSB1c2VzIChhbmQgb3RoZXJzIGZ1cnRoZXIgZG93bikgbWFrZSBwcmV0
dHkgY2xlYXIKdGhhdCB0aGUgZW11aXJxIGZpZWxkIGRvZXNuJ3QgYmVsb25nIGluIHRoZSBzdHJ1
Y3R1cmUgeW91IHB1dCBpdAppbiAtIHRoZSAnZCcgaW4gZHBjaSBzdGFuZHMgZm9yICJkaXJlY3Qi
IGFmYWlrLCBhbmQgdGhlIGZpZWxkIGlzCmZvciBhIGNlcnRhaW4gdmFyaWFudCBvZiBlbXVsYXRp
b24gb2YgaW50ZXJydXB0IGRlbGl2ZXJ5IGludG8KZ3Vlc3RzLCBpLmUuIG5vdCByZWFsbHkgcGFz
cy10aHJvdWdoIGZvY3VzZWQgYXQgYWxsLgoKPiBAQCAtMTcxLDggKzE3MiwyNiBAQCBzdHJ1Y3Qg
aHZtX3BpcnFfZHBjaSB7Cj4gICAgICBzdHJ1Y3QgaHZtX2dtc2lfaW5mbyBnbXNpOwo+ICAgICAg
c3RydWN0IHRpbWVyIHRpbWVyOwo+ICAgICAgc3RydWN0IGxpc3RfaGVhZCBzb2Z0aXJxX2xpc3Q7
Cj4gKyAgICBpbnQgZW11aXJxOwo+ICsgICAgc3RydWN0IHBpcnEgcGlycTsKPiAgfTsKPiAgCj4g
KyNkZWZpbmUgcGlycV9kcGNpKHApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiArICAgICgocCkgPyBjb250YWluZXJfb2YocCwgc3RydWN0IGh2
bV9waXJxX2RwY2ksIHBpcnEpIDogTlVMTCkKPiArI2RlZmluZSBjb25zdF9waXJxX2RwY2kocCkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgKChw
KSA/IGNvbnRhaW5lcl9vZihwLCBjb25zdCBzdHJ1Y3QgaHZtX3BpcnFfZHBjaSwgcGlycSkgOiBO
VUxMKQo+ICsKPiArI2RlZmluZSBkcGNpX3BpcnEocGQpICgmKHBkKS0+cGlycSkKPiArCj4gKyNk
ZWZpbmUgZG9tYWluX3BpcnFfdG9fZW11aXJxKGQsIHApICh7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiArICAgIHN0cnVjdCBwaXJxICpfX3BpID0gcGlycV9pbmZvKGQsIHAp
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgX19waSA/IHBpcnFfZHBj
aShfX3BpKS0+ZW11aXJxIDogSVJRX1VOQk9VTkQ7ICAgICAgICAgICAgICAgICAgICAgICBcCj4g
K30pCj4gKyNkZWZpbmUgZG9tYWluX2VtdWlycV90b19waXJxKGQsIGVtdWlycSkgKHsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgIHZvaWQgKl9fcmV0ID0gcmFkaXhfdHJlZV9s
b29rdXAoJihkKS0+YXJjaC5odm0uZW11aXJxX3BpcnEsIGVtdWlycSk7XAo+ICsgICAgX19yZXQg
PyByYWRpeF90cmVlX3B0cl90b19pbnQoX19yZXQpIDogSVJRX1VOQk9VTkQ7ICAgICAgICAgICAg
ICAgICBcCj4gK30pCgpXaGlsZSBmb3IgdGhlIGxhdHRlciB5b3UgbWVyZWx5IG1vdmUgdGhlIGJv
Z3VzIGRvdWJsZS1sZWFkaW5nLQp1bmRlcnNjb3JlIG1hY3JvIGxvY2FsIHZhcmlhYmxlICh3aGlj
aCBvbiB0aGlzIG9jY2FzaW9uIEknZApsaWtlIHRvIGFzayBhbnl3YXkgdG8gYmUgY2hhbmdlZCks
IHlvdSBhY3RpdmVseSBpbnRyb2R1Y2UgYQpuZXcgc2ltaWxhciBuYW1lIHNwYWNlIHZpb2xhdGlv
biBpbiB0aGUgZG9tYWluX3BpcnFfdG9fZW11aXJxKCkuCgo+IEBAIC0xMzMsMTcgKzEzMiwxMCBA
QCBERUNMQVJFX1BFUl9DUFUodW5zaWduZWQgaW50LCBpcnFfY291bnQpOwo+ICAKPiAgc3RydWN0
IGFyY2hfcGlycSB7Cj4gICAgICBpbnQgaXJxOwo+IC0gICAgdW5pb24gewo+IC0gICAgICAgIHN0
cnVjdCBodm1fcGlycSB7Cj4gLSAgICAgICAgICAgIGludCBlbXVpcnE7Cj4gLSAgICAgICAgICAg
IHN0cnVjdCBodm1fcGlycV9kcGNpIGRwY2k7Cj4gLSAgICAgICAgfSBodm07Cj4gLSAgICB9Owo+
ICsgICAgLyogSXMgdGhlIFBJUlEgYXNzb2NpYXRlZCB0byBhbiBIVk0gZG9tYWluPyAqLwo+ICsg
ICAgYm9vbCBodm07CgpJdCBsb29rcyBsaWtlIHRoaXMgZmllbGQgaXMgbmVlZGVkIGZvciBvbmx5
IGFyY2hfZnJlZV9waXJxX3N0cnVjdCgpLgpBcyBpdCdsbCBtYWtlIGEgZGlmZmVyZW5jZSB0byBz
dHJ1Y3QgcGlycSdzIHNpemUsIGNhbiB5b3Ugbm90IGdldAphd2F5IHdpdGhvdXQgaXQ/IEFsbCAo
cGVyaGFwcyBpbmRpcmVjdCkgY2FsbGVycyBvZiB0aGUgZnVuY3Rpb24Ka25vdyB0aGUgZG9tYWlu
LCBhZnRlciBhbGwuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
