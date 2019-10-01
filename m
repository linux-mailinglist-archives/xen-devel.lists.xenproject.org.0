Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943EFC2F28
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 10:48:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFDnU-00018k-9k; Tue, 01 Oct 2019 08:46:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFDnS-00018f-9g
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 08:46:14 +0000
X-Inumbo-ID: ec3b949c-e427-11e9-96f5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ec3b949c-e427-11e9-96f5-12813bfff9fa;
 Tue, 01 Oct 2019 08:46:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 80F43AC31;
 Tue,  1 Oct 2019 08:46:12 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
Date: Tue, 1 Oct 2019 10:46:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001082818.34233-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxMDoyOCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE5vdyB0aGF0IHhsLmNm
ZyBoYXMgYW4gb3B0aW9uIHRvIGV4cGxpY2l0bHkgZW5hYmxlIElPTU1VIG1hcHBpbmdzIGZvciBh
Cj4gZG9tYWluLCBtaWdyYXRpb24gbWF5IGJlIG5lZWRsZXNzbHkgdmV0b2VkIGR1ZSB0byB0aGUg
Y2hlY2sgb2YKPiBpc19pb21tdV9lbmFibGVkKCkgaW4gcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUo
KS4KPiBUaGVyZSBpcyBhY3R1YWxseSBubyBuZWVkIHRvIHByZXZlbnQgbG9nZGlydHkgZnJvbSBi
ZWluZyBlbmFibGVkIHVubGVzcwo+IGRldmljZXMgYXJlIGFzc2lnbmVkIHRvIGEgZG9tYWluIGFu
ZCB0aGF0IGRvbWFpbiBpcyBzaGFyaW5nIEhBUCBtYXBwaW5ncwo+IHdpdGggdGhlIElPTU1VIChp
biB3aGljaCBjYXNlIGRpc2FibGluZyB3cml0ZSBwZXJtaXNzaW9ucyBpbiB0aGUgUDJNIG1heQo+
IGNhdXNlIERNQSBmYXVsdHMpLgoKQnV0IHRoYXQncyB0YWtpbmcgaW50byBhY2NvdW50IG9ubHkg
aGFsZiBvZiB0aGUgcmVhc29uIG9mIHRoZQpleGNsdXNpb24uIFRoZSBvdGhlciBoYWxmIGlzIHRo
YXQgYXNzaWduZWQgZGV2aWNlcyBtYXkgY2F1c2UgcGFnZXMKdG8gYmUgZGlydGllZCBiZWhpbmQg
dGhlIGJhY2sgb2YgdGhlIGxvZy1kaXJ0eSBsb2dpYy4gVGhlcmVmb3JlIC4uLgoKPiAtLS0gYS94
ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMK
PiBAQCAtMjA5LDE1ICsyMDksMTUgQEAgc3RhdGljIGludCBwYWdpbmdfZnJlZV9sb2dfZGlydHlf
Yml0bWFwKHN0cnVjdCBkb21haW4gKmQsIGludCByYykKPiAgICAgIHJldHVybiByYzsKPiAgfQo+
ICAKPiAtaW50IHBhZ2luZ19sb2dfZGlydHlfZW5hYmxlKHN0cnVjdCBkb21haW4gKmQsIGJvb2xf
dCBsb2dfZ2xvYmFsKQo+ICtpbnQgcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoc3RydWN0IGRvbWFp
biAqZCwgYm9vbCBsb2dfZ2xvYmFsKQo+ICB7Cj4gICAgICBpbnQgcmV0Owo+ICAKPiAtICAgIGlm
ICggaXNfaW9tbXVfZW5hYmxlZChkKSAmJiBsb2dfZ2xvYmFsICkKPiArICAgIGlmICggaGFzX2Fy
Y2hfcGRldnMoZCkgJiYgaW9tbXVfdXNlX2hhcF9wdChkKSAmJiBsb2dfZ2xvYmFsICkKCi4uLiB0
aGUgaW9tbXVfdXNlX2hhcF9wdChkKSBuZWVkcyB0byBiZSBkcm9wcGVkIGFnYWluLCBJIHRoaW5r
LgoKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwo+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gQEAgLTE0ODYsMTEgKzE0ODYsMTUgQEAgc3RhdGljIGlu
dCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2
Zm4sIHUzMiBmbGFnKQo+ICAgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApCj4gICAgICAg
ICAgcmV0dXJuIDA7Cj4gIAo+IC0gICAgLyogUHJldmVudCBkZXZpY2UgYXNzaWduIGlmIG1lbSBw
YWdpbmcgb3IgbWVtIHNoYXJpbmcgaGF2ZSBiZWVuIAo+IC0gICAgICogZW5hYmxlZCBmb3IgdGhp
cyBkb21haW4gKi8KPiArICAgIC8qCj4gKyAgICAgKiBQcmV2ZW50IGRldmljZSBhc3NpZ24gaWYg
bWVtIHBhZ2luZyBvciBtZW0gc2hhcmluZyBoYXZlIGJlZW4KPiArICAgICAqIGVuYWJsZWQgZm9y
IHRoaXMgZG9tYWluLCBvciBsb2dkaXJ0eSBpcyBlbmFibGVkIGFuZCB0aGUgUDJNIGlzCj4gKyAg
ICAgKiBzaGFyZWQgd2l0aCB0aGUgSU9NTVUuCj4gKyAgICAgKi8KPiAgICAgIGlmICggdW5saWtl
bHkoZC0+YXJjaC5odm0ubWVtX3NoYXJpbmdfZW5hYmxlZCB8fAo+ICAgICAgICAgICAgICAgICAg
ICB2bV9ldmVudF9jaGVja19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykgfHwKPiAtICAgICAgICAg
ICAgICAgICAgcDJtX2dldF9ob3N0cDJtKGQpLT5nbG9iYWxfbG9nZGlydHkpICkKPiArICAgICAg
ICAgICAgICAgICAgKHAybV9nZXRfaG9zdHAybShkKS0+Z2xvYmFsX2xvZ2RpcnR5ICYmCj4gKyAg
ICAgICAgICAgICAgICAgICBpb21tdV91c2VfaGFwX3B0KGQpKSkgKQoKVGhpcyBjaGFuZ2Ugd2Fu
dHMgZHJvcHBpbmcgYWx0b2dldGhlciB0aGVuLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
