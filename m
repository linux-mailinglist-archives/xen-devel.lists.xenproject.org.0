Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3B6764BE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 13:44:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqycT-0004Mb-3c; Fri, 26 Jul 2019 11:42:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X75G=VX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hqycR-0004MV-P9
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 11:42:39 +0000
X-Inumbo-ID: 765cdff4-af9a-11e9-beb8-43599fe4737e
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 765cdff4-af9a-11e9-beb8-43599fe4737e;
 Fri, 26 Jul 2019 11:42:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2C3BCAF70;
 Fri, 26 Jul 2019 11:42:35 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190724112658.31495-1-jgross@suse.com>
 <20190724112658.31495-3-jgross@suse.com>
 <ff7462b4-f440-4fda-1a1c-5ff3e7352b3d@citrix.com>
 <4e74ddbe-f6f1-02e9-82f3-5f07e060ba19@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <1f382b48-c3ba-f427-85d7-3c88403d8deb@suse.com>
Date: Fri, 26 Jul 2019 13:42:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4e74ddbe-f6f1-02e9-82f3-5f07e060ba19@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMTkgMTM6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI2LjA3LjIwMTkgMTE6
NDYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDI0LzA3LzIwMTkgMTI6MjYsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBAQCAtMTgyLDMwICsxNzgsMjQgQEAgc3RhdGljIHZvaWQgX19wcmVw
YXJlX3RvX3dhaXQoc3RydWN0IHdhaXRxdWV1ZV92Y3B1ICp3cXYpCj4+PiAgICBzdGF0aWMgdm9p
ZCBfX2ZpbmlzaF93YWl0KHN0cnVjdCB3YWl0cXVldWVfdmNwdSAqd3F2KQo+Pj4gICAgewo+Pj4g
ICAgICAgIHdxdi0+ZXNwID0gTlVMTDsKPj4+IC0gICAgKHZvaWQpdmNwdV9zZXRfaGFyZF9hZmZp
bml0eShjdXJyZW50LCAmd3F2LT5zYXZlZF9hZmZpbml0eSk7Cj4+PiArICAgIHZjcHVfdGVtcG9y
YXJ5X2FmZmluaXR5KGN1cnJlbnQsIE5SX0NQVVMsIFZDUFVfQUZGSU5JVFlfV0FJVCk7Cj4+PiAg
ICB9Cj4+PiAgICAKPj4+ICAgIHZvaWQgY2hlY2tfd2FrZXVwX2Zyb21fd2FpdCh2b2lkKQo+Pj4g
ICAgewo+Pj4gLSAgICBzdHJ1Y3Qgd2FpdHF1ZXVlX3ZjcHUgKndxdiA9IGN1cnJlbnQtPndhaXRx
dWV1ZV92Y3B1Owo+Pj4gKyAgICBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJlbnQ7Cj4+PiArICAg
IHN0cnVjdCB3YWl0cXVldWVfdmNwdSAqd3F2ID0gY3Vyci0+d2FpdHF1ZXVlX3ZjcHU7Cj4+PiAg
ICAKPj4+ICAgICAgICBBU1NFUlQobGlzdF9lbXB0eSgmd3F2LT5saXN0KSk7Cj4+PiAgICAKPj4+
ICAgICAgICBpZiAoIGxpa2VseSh3cXYtPmVzcCA9PSBOVUxMKSApCj4+PiAgICAgICAgICAgIHJl
dHVybjsKPj4+ICAgIAo+Pj4gLSAgICAvKiBDaGVjayBpZiB3ZSB3b2tlIHVwIG9uIHRoZSB3cm9u
ZyBDUFUuICovCj4+PiAtICAgIGlmICggdW5saWtlbHkoc21wX3Byb2Nlc3Nvcl9pZCgpICE9IHdx
di0+d2FrZXVwX2NwdSkgKQo+Pj4gKyAgICAvKiBDaGVjayBpZiB3ZSBhcmUgc3RpbGwgcGlubmVk
LiAqLwo+Pj4gKyAgICBpZiAoIHVubGlrZWx5KCEoY3Vyci0+YWZmaW5pdHlfYnJva2VuICYgVkNQ
VV9BRkZJTklUWV9XQUlUKSkgKQo+Pj4gICAgICAgIHsKPj4+IC0gICAgICAgIC8qIFJlLXNldCBW
Q1BVIGFmZmluaXR5IGFuZCByZS1lbnRlciB0aGUgc2NoZWR1bGVyLiAqLwo+Pj4gLSAgICAgICAg
c3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Owo+Pj4gLSAgICAgICAgY3B1bWFza19jb3B5KCZ3
cXYtPnNhdmVkX2FmZmluaXR5LCBjdXJyLT5jcHVfaGFyZF9hZmZpbml0eSk7Cj4+PiAtICAgICAg
ICBpZiAoIHZjcHVfc2V0X2hhcmRfYWZmaW5pdHkoY3VyciwgY3B1bWFza19vZih3cXYtPndha2V1
cF9jcHUpKSApCj4+PiAtICAgICAgICB7Cj4+PiAtICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9H
X0VSUiwgIlVuYWJsZSB0byBzZXQgdmNwdSBhZmZpbml0eVxuIik7Cj4+PiAtICAgICAgICAgICAg
ZG9tYWluX2NyYXNoKGN1cnJlbnQtPmRvbWFpbik7Cj4+PiAtICAgICAgICB9Cj4+PiAtICAgICAg
ICB3YWl0KCk7IC8qIHRha2VzIHVzIGJhY2sgaW50byB0aGUgc2NoZWR1bGVyICovCj4+PiArICAg
ICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAidmNwdSBhZmZpbml0eSBsb3N0XG4iKTsKPj4+ICsg
ICAgICAgIGRvbWFpbl9jcmFzaChjdXJyLT5kb21haW4pOwo+Pj4gICAgICAgIH0KPj4KPj4gSSdt
IHNvcnJ5IHRvIHJldHJhY3QgbXkgUi1ieSBhZnRlciB0aGUgZmFjdCwgYnV0IEkndmUgb25seSBq
dXN0IG5vdGljZWQKPj4gKHdoaWxlIHJlYmFzaW5nIHNvbWUgb2YgbXkgcGVuZGluZyB3b3JrIG92
ZXIgdGhpcykgdGhhdCBpdCBpcyBidWdneS4KPj4KPj4gVGhlIHJlYXNvbiB3YWl0KCkgd2FzIGNh
bGxlZCBpcyBiZWNhdXNlIGl0IGlzIG5vdCBzYWZlIHRvIGxlYXZlIHRoYXQKPj4gaWYoKSBjbGF1
c2UuCj4+Cj4+IFdpdGggdGhpcyBjaGFuZ2UgaW4gcGxhY2UsIHdlJ2xsIGFycmFuZ2UgZm9yIHRo
ZSBWTSB0byBiZSBjcmFzaGVkLCB0aGVuCj4+IGxvbmdqdW1wIGJhY2sgaW50byB0aGUgc3RhY2sg
ZnJvbSBmcm9tIHRoZSB3YWl0aW5nIHZDUFUsIG9uIHRoZSB3cm9uZwo+PiBDUFUuwqAgQW55IGNh
bGxlciB3aXRoIHNtcF9wcm9jZXNzb3JfaWQoKSBvciB0aHJlYWQtbG9jYWwgdmFyaWFibGVzIGNh
Y2hlCj4+IGJ5IHBvaW50ZXIgb24gdGhlIHN0YWNrIHdpbGwgdGhlbiBjYXVzZSBtZW1vcnkgY29y
cnVwdGlvbi4KPj4KPj4gSXRzIG5vdCBpbW1lZGlhdGVseSBvYnZpb3VzIGhvdyB0byBmaXggdGhp
cywgYnV0IGJlYXIgaW4gbWluZCB0aGF0IGFzCj4+IHNvb24gYXMgdGhlIHZtLWV2ZW50IGludGVy
ZmFjZSBpcyBkb25lLCBJIHBsYW4gdG8gZGVsZXRlIHRoaXMgd2hvbGUKPj4gd2FpdHF1ZXVlIGlu
ZnJhc3RydWN0dXJlIGFueXdheS4KPiAKPiBJbiB3aGljaCBjYXNlIC0gc2hvdWxkIHdlIHJldmVy
dCB0aGUgY29tbWl0IHVudGlsIHRoaXMgaXMgcmVzb2x2ZWQ/CgpJbiBteSBvcGluaW9uIGl0IGlz
IG5vdCB0aGF0IHVyZ2VudC4gSSBkb24ndCB0aGluayBhbnkgb2Ygb3VyIE9TU3Rlc3RzCndpbGwg
ZXZlciBiZSBhYmxlIHRvIHRyaWdnZXIgdGhpcyBpc3N1ZSwgYXMgQUZBSUsgbm8gdGVzdCBpcyB1
c2luZyB0aGUKd2FpdF9ldmVudCgpIGludGVyZmFjZSBub3IgZG8gdGhleSB0ZXN0IHN1c3BlbmQv
cmVzdW1lLiBBbmQgYm90aCBuZWVkCnRvIGJlIHRydWUgKGF0IHRoZSBzYW1lIHRpbWUhKSBwbHVz
IGEgY3B1IG5lZWRzIHRvIGZhaWwgY29taW5nIHVwIHdoZW4KcmVzdW1pbmcgYWdhaW4uCgoKSnVl
cmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
