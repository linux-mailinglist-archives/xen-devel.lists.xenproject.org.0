Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EEA175752
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 10:39:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8hWD-0004WG-79; Mon, 02 Mar 2020 09:37:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xlOq=4T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j8hWB-0004WB-Nt
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 09:37:43 +0000
X-Inumbo-ID: 7704f05a-5c69-11ea-9f13-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7704f05a-5c69-11ea-9f13-12813bfff9fa;
 Mon, 02 Mar 2020 09:37:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53FB1B01D;
 Mon,  2 Mar 2020 09:37:42 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200228171348.21864-1-jgross@suse.com>
 <50a31456-80f3-8308-479f-2a0d522ad518@citrix.com>
 <9b2088ef-8545-9b93-e3d7-bec41ed56407@suse.com>
 <944f4772-02cb-d5ad-cfbd-884c25341380@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c6f73d60-b437-93f8-926a-920804d026bf@suse.com>
Date: Mon, 2 Mar 2020 10:37:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <944f4772-02cb-d5ad-cfbd-884c25341380@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: make sure stop_machine_run() is
 always called in a tasklet
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDMuMjAgMTA6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI5LjAyLjIwMjAgMDY6
NDcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDI4LjAyLjIwIDIwOjA2LCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+Pj4gT24gMjgvMDIvMjAyMCAxNzoxMywgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiBAQCAtNzAwLDYgKzY4OCwzMiBAQCBpbnQgbWljcm9jb2RlX3VwZGF0ZShYRU5fR1VFU1Rf
SEFORExFX1BBUkFNKGNvbnN0X3ZvaWQpIGJ1ZiwgdW5zaWduZWQgbG9uZyBsZW4pCj4+Pj4gICAg
ICAgIHJldHVybiByZXQ7Cj4+Pj4gICAgfQo+Pj4+ICAgIAo+Pj4+ICtpbnQgbWljcm9jb2RlX3Vw
ZGF0ZShYRU5fR1VFU1RfSEFORExFX1BBUkFNKGNvbnN0X3ZvaWQpIGJ1ZiwgdW5zaWduZWQgbG9u
ZyBsZW4pCj4+Pj4gK3sKPj4+PiArICAgIGludCByZXQ7Cj4+Pj4gKyAgICBzdHJ1Y3QgdWNvZGVf
YnVmICpidWZmZXI7Cj4+Pj4gKwo+Pj4+ICsgICAgaWYgKCBsZW4gIT0gKHVpbnQzMl90KWxlbiAp
Cj4+Pj4gKyAgICAgICAgcmV0dXJuIC1FMkJJRzsKPj4+PiArCj4+Pj4gKyAgICBpZiAoIG1pY3Jv
Y29kZV9vcHMgPT0gTlVMTCApCj4+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4gKwo+
Pj4+ICsgICAgYnVmZmVyID0geG1hbGxvY19mbGV4X3N0cnVjdChzdHJ1Y3QgdWNvZGVfYnVmLCBi
dWZmZXIsIGxlbik7Cj4+Pj4gKyAgICBpZiAoICFidWZmZXIgKQo+Pj4+ICsgICAgICAgIHJldHVy
biAtRU5PTUVNOwo+Pj4+ICsKPj4+PiArICAgIHJldCA9IGNvcHlfZnJvbV9ndWVzdChidWZmZXIt
PmJ1ZmZlciwgYnVmLCBsZW4pOwo+Pj4+ICsgICAgaWYgKCByZXQgKQo+Pj4+ICsgICAgewo+Pj4+
ICsgICAgICAgIHhmcmVlKGJ1ZmZlcik7Cj4+Pj4gKyAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4+
Pj4gKyAgICB9Cj4+Pj4gKyAgICBidWZmZXItPmxlbiA9IGxlbjsKPj4+PiArCj4+Pj4gKyAgICBy
ZXR1cm4gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgwLCBtaWNyb2NvZGVfdXBkYXRlX2hlbHBl
ciwgYnVmZmVyKTsKPj4+Cj4+PiBBbnkgcmVhc29uIHdoeSBjcHUgMCBoZXJlP8KgIFRoZXJlIGlz
IG5vIHJlc3RyaWN0aW9uIGF0IHRoZSBtb21lbnQsIGFuZAo+Pj4gcnVubmluZyB0aGUgdGFza2xl
dCBvbiB0aGUgY3VycmVudCBDUFUgaXMgc3VyZWx5IGJldHRlciB0aGFuIHBva2luZwo+Pj4gQ1BV
MCdzIHRhc2tsZXQgcXVldWUgcmVtb3RlbHksIHRoZW4gaW50ZXJydXB0aW5nIGl0Lgo+Pgo+PiBB
cyBzdG9wX21hY2hpbmVfcnVuKCkgaXMgc2NoZWR1bGluZyBhIHRhc2tsZXQgb24gYWxsIG90aGVy
IGNwdXMgaXQKPj4gZG9lc24ndCByZWFsbHkgbWF0dGVyLiBJbiB0aGUgZW5kIEkgZG9uJ3QgcmVh
bGx5IG1pbmQgZWl0aGVyIHdheS4KPiAKPiBJIHRoaW5rIGFueSBjYXNlIHdoZXJlIHdlIGNhbiBh
dm9pZCBhc3NpZ25pbmcgc3BlY2lhbCBtZWFuaW5nCj4gdG8gQ1BVIDAgaXMgaGVscGZ1bC4gV2hp
bGUgd2Ugd29uJ3QgZ2V0IHRvIGJlaW5nIGFibGUgdG8gb2ZmbGluZQo+IHRoZSBCU1AgYW55IHRp
bWUgc29vbiwgd2Ugc2hvdWxkbid0IHB1dCBtb3JlIHJvYWQgYmxvY2tzIG9uIHRoZQo+IHBhdGgg
dGhlcmUuCgpBcyBJIHNhaWQ6IGZpbmUgd2l0aCBtZS4gU2hhbGwgSSByZXNlbmQgb3IgY2FuIHRo
aXMgYmUgZG9uZSB3aGlsZQpjb21taXR0aW5nPwoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
