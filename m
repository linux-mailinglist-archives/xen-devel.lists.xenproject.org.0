Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D34016EA02
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 16:26:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6c3a-00032A-IG; Tue, 25 Feb 2020 15:23:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6c3Z-000321-Cb
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 15:23:33 +0000
X-Inumbo-ID: c6863dc3-57e2-11ea-9325-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6863dc3-57e2-11ea-9325-12813bfff9fa;
 Tue, 25 Feb 2020 15:23:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CA96BB1B3;
 Tue, 25 Feb 2020 15:23:28 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ed2d868-8a20-b119-2a0c-ef9a9f5e4498@suse.com>
Date: Tue, 25 Feb 2020 16:23:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224084400.94482-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAwOTo0NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC0yMCwyMSAr
MjEsMzAgQEAgdHlwZWRlZiBzdHJ1Y3Qgewo+ICAjZGVmaW5lIERFRklORV9SV0xPQ0sobCkgcnds
b2NrX3QgbCA9IFJXX0xPQ0tfVU5MT0NLRUQKPiAgI2RlZmluZSByd2xvY2tfaW5pdChsKSAoKihs
KSA9IChyd2xvY2tfdClSV19MT0NLX1VOTE9DS0VEKQo+ICAKPiAtLyoKPiAtICogV3JpdGVyIHN0
YXRlcyAmIHJlYWRlciBzaGlmdCBhbmQgYmlhcy4KPiAtICoKPiAtICogV3JpdGVyIGZpZWxkIGlz
IDggYml0IHRvIGFsbG93IGZvciBwb3RlbnRpYWwgb3B0aW1pc2F0aW9uLCBzZWUKPiAtICogX3dy
aXRlX3VubG9jaygpLgo+IC0gKi8KPiAtI2RlZmluZSAgICBfUVdfV0FJVElORyAgMSAgICAgICAg
ICAgICAgIC8qIEEgd3JpdGVyIGlzIHdhaXRpbmcgICAgICovCj4gLSNkZWZpbmUgICAgX1FXX0xP
Q0tFRCAgIDB4ZmYgICAgICAgICAgICAvKiBBIHdyaXRlciBob2xkcyB0aGUgbG9jayAqLwo+IC0j
ZGVmaW5lICAgIF9RV19XTUFTSyAgICAweGZmICAgICAgICAgICAgLyogV3JpdGVyIG1hc2suKi8K
PiAtI2RlZmluZSAgICBfUVJfU0hJRlQgICAgOCAgICAgICAgICAgICAgIC8qIFJlYWRlciBjb3Vu
dCBzaGlmdCAgICAgICovCj4gKy8qIFdyaXRlciBzdGF0ZXMgJiByZWFkZXIgc2hpZnQgYW5kIGJp
YXMuICovCj4gKyNkZWZpbmUgICAgX1FXX0NQVU1BU0sgIDB4ZmZmICAgICAgICAgICAgICAgLyog
V3JpdGVyIENQVSBtYXNrICovCj4gKyNkZWZpbmUgICAgX1FXX1NISUZUICAgIDEyICAgICAgICAg
ICAgICAgICAgLyogV3JpdGVyIGZsYWdzIHNoaWZ0ICovCj4gKyNkZWZpbmUgICAgX1FXX1dBSVRJ
TkcgICgxdSA8PCBfUVdfU0hJRlQpICAgLyogQSB3cml0ZXIgaXMgd2FpdGluZyAqLwo+ICsjZGVm
aW5lICAgIF9RV19MT0NLRUQgICAoM3UgPDwgX1FXX1NISUZUKSAgIC8qIEEgd3JpdGVyIGhvbGRz
IHRoZSBsb2NrICovCj4gKyNkZWZpbmUgICAgX1FXX1dNQVNLICAgICgzdSA8PCBfUVdfU0hJRlQp
ICAgLyogV3JpdGVyIG1hc2sgKi8KPiArI2RlZmluZSAgICBfUVJfU0hJRlQgICAgMTQgICAgICAg
ICAgICAgICAgICAvKiBSZWFkZXIgY291bnQgc2hpZnQgKi8KCkluIHBhcnRpY3VsYXIgd2l0aCB0
aGUgc3VnZ2VzdGVkIGNoYW5nZSBvZiBhdG9taWNfYW5kKCkncyBmaXJzdApwYXJhbWV0ZXIncyB0
eXBlLCBwZXJoYXBzIHRoZSB1IHN1ZmZpeGVzIHdhbnQgZHJvcHBpbmcgaGVyZT8KCj4gK3N0YXRp
YyBpbmxpbmUgYm9vbCBfaXNfd3JpdGVfbG9ja2VkX2J5X21lKHVpbnQzMl90IGNudHMpCgpCb3Ro
IGhlcmUgYW5kIC4uLgoKPiArewo+ICsgICAgQlVJTERfQlVHX09OKF9RV19DUFVNQVNLIDwgTlJf
Q1BVUyk7Cj4gKyAgICByZXR1cm4gKGNudHMgJiBfUVdfV01BU0spID09IF9RV19MT0NLRUQgJiYK
PiArICAgICAgICAgICAoY250cyAmIF9RV19DUFVNQVNLKSA9PSBzbXBfcHJvY2Vzc29yX2lkKCk7
Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBfY2FuX3JlYWRfbG9jayh1aW50MzJfdCBj
bnRzKQoKLi4uIGhlcmUsIGlzIGEgZml4ZWQgd2lkdGggdHlwZSByZWFsbHkgbmVlZGVkPyBJJ2Qg
cHJlZmVyIGlmCiJ1bnNpZ25lZCBpbnQiIHdhcyB1c2VkLCBhbmQgaWYgZXZlbnR1YWxseSB3ZSdk
IHRoZW4gYWxzbwpyZXBsYWNlIC4uLgoKPiBAQCAtNDUsMTAgKzU1LDEwIEBAIHN0YXRpYyBpbmxp
bmUgaW50IF9yZWFkX3RyeWxvY2socndsb2NrX3QgKmxvY2spCj4gICAgICB1MzIgY250czsKCi4u
LiB0aGlzIGFuZCAuLi4KCj4gQEAgLTY0LDcgKzc0LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIF9y
ZWFkX2xvY2socndsb2NrX3QgKmxvY2spCj4gICAgICB1MzIgY250czsKCi4uLiB0aGlzIChhbmQg
cG9zc2libGUgb3RoZXJzKS4KCj4gQEAgLTExNSw2ICsxMjUsMTEgQEAgc3RhdGljIGlubGluZSBp
bnQgX3J3X2lzX2xvY2tlZChyd2xvY2tfdCAqbG9jaykKPiAgICAgIHJldHVybiBhdG9taWNfcmVh
ZCgmbG9jay0+Y250cyk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbmxpbmUgdWludDMyX3QgX3dyaXRl
X2xvY2tfdmFsKHZvaWQpCgpTYW1lIGhlcmUgdGhlbi4KCldpdGggdGhlc2UgdGFrZW4gY2FyZSBv
ZiAoYXMgbG9uZyBhcyB5b3UgYWdyZWUsIGFuZCBsaWtlbHkgZG9hYmxlCmFnYWluIHdoaWxlIGNv
bW1pdHRpbmcpClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
