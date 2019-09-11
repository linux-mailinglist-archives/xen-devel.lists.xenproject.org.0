Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ADAAFBAC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 13:45:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i810X-0007hO-CC; Wed, 11 Sep 2019 11:41:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i810V-0007hJ-P0
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 11:41:55 +0000
X-Inumbo-ID: 26efcd96-d489-11e9-ac29-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26efcd96-d489-11e9-ac29-12813bfff9fa;
 Wed, 11 Sep 2019 11:41:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 89B6FAE92;
 Wed, 11 Sep 2019 11:41:53 +0000 (UTC)
To: Razvan Cojocaru <rcojocaru@bbu.bitdefender.biz>
References: <20190909153508.10847-1-aisaila@bitdefender.com>
 <4ae96ee9-192d-f790-b2cb-9d60a5aab292@suse.com>
 <e7330f19-9350-54f2-a066-730f1ab3c145@bitdefender.com>
 <607886a8-7eff-56e3-598c-85b3e4109d88@bbu.bitdefender.biz>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed6eb96e-2a8b-55b3-9728-a574d957ab36@suse.com>
Date: Wed, 11 Sep 2019 13:41:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <607886a8-7eff-56e3-598c-85b3e4109d88@bbu.bitdefender.biz>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9] x86/emulate: Send vm_event from emulate
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
Cc: PetreOvidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 rcojocaru@bitdefender.com,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAxMzoyMSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDkvMTEvMTkg
MTozOSBQTSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDExLjA5
LjIwMTkgMTI6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMDkuMDkuMjAxOSAxNzozNSwg
QWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+Pj4gKy8qCj4+Pj4gKyAqIFNlbmQgbWVt
b3J5IGFjY2VzcyB2bV9ldmVudHMgYmFzZWQgb24gcGZlYy4gUmV0dXJucyB0cnVlIGlmIHRoZSBl
dmVudCB3YXMKPj4+PiArICogc2VudCBhbmQgZmFsc2UgZm9yIHAybV9nZXRfbWVtX2FjY2Vzcygp
IGVycm9yLCBubyB2aW9sYXRpb24gYW5kIGV2ZW50IHNlbmQKPj4+PiArICogZXJyb3IuIEFzc3Vt
ZXMgdGhlIGNhbGxlciB3aWxsIGNoZWNrIGFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQuCj4+Pj4g
KyAqCj4+Pj4gKyAqIE5PVEU6IHAybV9nZXRfbWVtX2FjY2VzcygpIGNhbiBmYWlsIGlmIHRoZSBl
bnRyeSB3YXMgbm90IGZvdW5kIGluIHRoZSBFUFQKPj4+PiArICogKGluIHdoaWNoIGNhc2UgYWNj
ZXNzIHRvIGl0IGlzIHVucmVzdHJpY3RlZCwgc28gbm8gdmlvbGF0aW9ucyBjYW4gb2NjdXIpLgo+
Pj4+ICsgKiBJbiB0aGlzIGNhc2VzIGl0IGlzIGZpbmUgdG8gY29udGludWUgdGhlIGVtdWxhdGlv
bi4KPj4+PiArICovCj4+Pj4gK2Jvb2wgaHZtX21vbml0b3JfY2hlY2tfZXB0KHVuc2lnbmVkIGxv
bmcgZ2xhLCBnZm5fdCBnZm4sIHVpbnQzMl90IHBmZWMsCj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQxNl90IGtpbmQpCj4+Pgo+Pj4gV2h5IGRpZCB5b3UgY2hvb3NlIHRvIGhh
dmUgImVwdCIgaW4gdGhlIG5hbWUgYW5kIGFsc28gbWVudGlvbiBpdAo+Pj4gaW4gdGhlIGNvbW1p
dD8gSXMgdGhlcmUgYW55dGhpbmcgaW4gaGVyZSB3aGljaCBpc24ndCBnZW5lcmljIHAybT8KPj4K
Pj4gVGhlIG5hbWUgd2FzIHN1Z2dlc3RlZCBieSBSYXp2YW4gQ29qb2NhcnUuIEkgaGF2ZSBubyBw
cmVmZXJlbmNlIGluIHRoZQo+PiBuYW1lLiBNYXliZSBUYW1hcyBjYW4gc3VnZ2VzdCBhIGdvb2Qg
b25lLgo+IAo+IEkndmUgc3VnZ2VzdGVkICJlcHQiIGluIHRoZSBuYW1lIGJlY2F1c2UgInJlZ3Vs
YXIiIGVtdWxhdGlvbiBpZ25vcmVzIGl0LCAKPiBhbmQgdGhpcyBmdW5jdGlvbiB0YWtlcyBpdCBp
bnRvIGFjY291bnQsIGhlbmNlIHRoZSAiY2hlY2tfZXB0IiAod2hpY2ggSSAKPiB0aG91Z2h0IHdv
dWxkIGJlIHJlYWQgdG9nZXRoZXIpLiBJdCdzIGZpbmUgdG8gY2hhbmdlIGl0IHRvIHNvbWV0aGlu
ZyBlbHNlLgoKVGhlbiAiY2hlY2tfcDJtIiBwZXJoYXBzPwoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
