Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1394A0186
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 14:22:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2wuv-00053k-J2; Wed, 28 Aug 2019 12:19:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uWOn=WY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2wut-00053f-J0
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 12:19:11 +0000
X-Inumbo-ID: 08456afc-c98e-11e9-ae45-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08456afc-c98e-11e9-ae45-12813bfff9fa;
 Wed, 28 Aug 2019 12:19:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17B42AC2C;
 Wed, 28 Aug 2019 12:19:08 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <667bafda-b811-9864-9ad3-95447a7fb62f@suse.com>
 <a7f91e8d-a550-73f8-9abc-33173a5be5e2@citrix.com>
 <545c2be3-9641-d9ff-291d-a0bf85fb3dd3@suse.com>
 <a792b2ec-4316-5e3a-fca1-9fadb64e23b9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6028d4c-2ae4-c305-a903-88d6f8fd0b7f@suse.com>
Date: Wed, 28 Aug 2019 14:19:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a792b2ec-4316-5e3a-fca1-9fadb64e23b9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 6/6] x86emul: support MOVDIR{I,64B} insns
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
 PaulDurrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDguMjAxOSAxMzo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOC8wOC8yMDE5
IDA3OjI2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjcuMDguMjAxOSAxODowNCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDAxLzA3LzIwMTkgMTI6NTgsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IEBAIC05ODk2LDYgKzk5MDIsMzIgQEAgeDg2X2VtdWxhdGUoCj4+Pj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6ICIw
IiAoKHVpbnQzMl90KXNyYy52YWwpLCAicm0iCj4+Pj4gKF9yZWdzLmVkeCkgKTsKPj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4gIMKgwqAgK8KgwqDCoCBjYXNlIFg4NkVNVUxf
T1BDXzY2KDB4MGYzOCwgMHhmOCk6IC8qIG1vdmRpcjY0YiByLG01MTIgKi8KPj4+PiArwqDCoMKg
wqDCoMKgwqAgdmNwdV9tdXN0X2hhdmUobW92ZGlyNjRiKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAg
Z2VuZXJhdGVfZXhjZXB0aW9uX2lmKGVhLnR5cGUgIT0gT1BfTUVNLCBFWENfVUQpOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBzcmMudmFsID0gdHJ1bmNhdGVfZWEoKmRzdC5yZWcpOwo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBnZW5lcmF0ZV9leGNlcHRpb25faWYoIWlzX2FsaWduZWQoeDg2X3NlZ19lcywg
c3JjLnZhbCwgNjQsCj4+Pj4gY3R4dCwgb3BzKSwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBFWENfR1AsIDApOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCAvKiBJZ25vcmUgdGhlIG5vbi10ZW1wb3JhbCBiZWhhdmlvciBmb3Igbm93
LiAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBmYWlsX2lmKCFvcHMtPndyaXRlKTsKPj4+PiArwqDC
oMKgwqDCoMKgwqAgQlVJTERfQlVHX09OKHNpemVvZigqbW12YWxwKSA8IDY0KTsKPj4+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKCAocmMgPSBvcHMtPnJlYWQoZWEubWVtLnNlZywgZWEubWVtLm9mZiwg
bW12YWxwLCA2NCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY3R4dCkpICE9IFg4NkVNVUxfT0tBWSB8fAo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKHJjID0gb3BzLT53cml0ZSh4ODZfc2VnX2VzLCBzcmMudmFsLCBt
bXZhbHAsIDY0LAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGN0eHQpKSAhPSBYODZFTVVMX09LQVkgKQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gZG9uZTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgc3RhdGUtPnNp
bWRfc2l6ZSA9IHNpbWRfbm9uZTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgc2ZlbmNlID0gdHJ1ZTsK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgY2FzZSBYODZF
TVVMX09QQygweDBmMzgsIDB4ZjkpOiAvKiBtb3ZkaXJpIG1lbSxyICovCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHZjcHVfbXVzdF9oYXZlKG1vdmRpcmkpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBnZW5l
cmF0ZV9leGNlcHRpb25faWYoZHN0LnR5cGUgIT0gT1BfTUVNLCBFWENfVUQpOwo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCAvKiBJZ25vcmUgdGhlIG5vbi10ZW1wb3JhbCBiZWhhdmlvciBmb3Igbm93LiAq
Lwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkc3QudmFsID0gc3JjLnZhbDsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgc2ZlbmNlID0gdHJ1ZTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pgo+Pj4g
SSdtIG5vdCBjZXJ0YWluIHRoaXMgZ2l2ZXMgdGhlIHJlcXVpcmVkIGF0b21pY2l0eS7CoCBBRkFJ
Q1QsIGl0IGRlZ3JhZGVzCj4+PiBpbnRvIG9wcy0+d3JpdGUoKSwgd2hpY2ggY2FuIGVuZCB1cCB3
aXRoIGJ5dGV3aXNlIHdyaXRlcy4KPj4+Cj4+PiBJIHRoaW5rIHdlIG5lZWQgdG8gbWFwIHRoZSBk
ZXN0aW5hdGlvbiBhbmQgaXNzdWUgYW4gZXhwbGljaXQgbW92Cj4+PiBpbnN0cnVjdGlvbi4KPj4K
Pj4gSSBkb24ndCB0aGluayBzbywgbm8gLSBwbGFpbiBNT1YgaGFzIHRoZSBzYW1lIHByb3BlcnR5
IChpbiBwYXJ0aWN1bGFyCj4+IHdoZW4gbm90IGdvaW5nIHRocm91Z2ggdGhlIGNhY2hlKSwgYW5k
IGFsc28gdXNlcyB0aGUgLT53cml0ZSgpIGhvb2suCj4+IEl0J3MgdGhlIGhvb2sgZnVuY3Rpb24g
dGhhdCBuZWVkcyB0byBiZWhhdmUgcHJvcGVybHkgZm9yIGFsbCBvZiB0aGlzCj4+IHRvIGJlIGNv
cnJlY3QuCj4gCj4gSXQgb25seSBvY2N1cnJlZCB0byBtZSBhZnRlciBzZW5kaW5nIHRoaXMgZW1h
aWwgdGhhdCBwbGFpbiBNT1Ygd2FzCj4gYnJva2VuIGFzIHdlbGwuCgpXZWxsLCB0aGV5J3JlIGJv
dGggaW4gdGhlIHNhbWUgc3RhdGUsIGJ1dCBpdCBzaG91bGRuJ3QgYmUgdGhlIGNvcmUKZW11bGF0
b3IncyBqb2IgdG8gZXN0YWJsaXNoIGEgbWFwcGluZy4gSW4gZmFjdCBodm1lbXVsX3dyaXRlKCkg
YWxyZWFkeQpjYWxscyBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpLiBXaGF0J3Mgc3ViLW9wdGlt
YWwgaXMgaXRzIHJlbGlhbmNlIG9uCm1lbWNweSgpJ3MgaW1wbGVtZW50YXRpb24gKHdoZW4gdGhl
cmUncyBhIHZhbGlkIEdGTi0+TUZOIG1hcHBpbmcpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
