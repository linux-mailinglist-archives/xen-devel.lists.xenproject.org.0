Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E2C0101
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 10:20:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDlSZ-0007xi-7Q; Fri, 27 Sep 2019 08:18:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDlSX-0007xZ-EU
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 08:18:37 +0000
X-Inumbo-ID: 66dffe94-e0ff-11e9-9670-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 66dffe94-e0ff-11e9-9670-12813bfff9fa;
 Fri, 27 Sep 2019 08:18:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 78BBBAE40;
 Fri, 27 Sep 2019 08:18:35 +0000 (UTC)
To: Joe Jin <joe.jin@oracle.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <20190913103335.ijzx6tuy4iwb5dt5@Air-de-Roger>
 <89c9c9b5-a99f-bfdb-c42c-df64e308a98e@oracle.com>
 <20190924154242.nwhetdvkgmkhjgph@Air-de-Roger>
 <8a81e76c-b342-05b5-b592-c7e6912e6a9f@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <961459b6-521b-d87e-a2cb-2e7846ba2594@suse.com>
Date: Fri, 27 Sep 2019 10:18:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8a81e76c-b342-05b5-b592-c7e6912e6a9f@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAyMjozMywgSm9lIEppbiB3cm90ZToKPiBPbiA5LzI0LzE5IDg6NDIgQU0s
IFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IEFGQUlDVCB5b3UgYXJlIGRyYWluaW5nIGFueSBw
ZW5kaW5nIGRhdGEgZnJvbSB0aGUgcG9zdGVkIGludGVycnVwdAo+PiBQSVJSIGZpZWxkIGludG8g
dGhlIElSUiB2bGFwaWMgZmllbGQsIHNvIHRoYXQgbm8gc3RhbGUgaW50ZXJydXB0cyBhcmUKPj4g
bGVmdCBiZWhpbmQgYWZ0ZXIgdGhlIE1TSSBmaWVsZHMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgdGhl
IGd1ZXN0LiBJCj4+IHRoaW5rIHRoaXMgaXMgY29ycmVjdCwgSSB3b25kZXIgaG93ZXZlciB3aGV0
aGVyIHlvdSBhbHNvIG5lZWQgdG8KPj4gdHJpZ2dlciBhIHZjcHUgcmUtc2NoZWR1bGluZyAocGF1
c2UvdW5wYXVzZSB0aGUgdnBjdSksIHNvIHRoYXQgcGVuZGluZwo+PiBpbnRlcnJ1cHRzIGluIElS
UiBhcmUgaW5qZWN0ZWQgYnkgdm14X2ludHJfYXNzaXN0LgoKWW91IGRpZG4ndCBhZGRyZXNzIChw
ZXJoYXBzIGp1c3QgdmVyYmFsbHkpIHRoaXMgcmVtYXJrIGZyb20gUm9nZXIKYXQgYWxsLiBJJ20g
bm90IGNvbnZpbmNlZCB0aGF0IGEgcGF1c2UvdW5wYXVzZSBpcyBhbiBhcHByb3ByaWF0ZQphY3Rp
b24gaGVyZSAtIHRoZXJlIHN1cmVseSBzaG91bGQgYmUgYSBtb3JlIGRpcmVjdCB3YXkuCgo+PiBB
bHNvLCBJIHRoaW5rIHlvdSBzaG91bGQgZG8gdGhpcyBzeW5jaW5nIGFmdGVyIHRoZSBwaV91cGRh
dGVfaXJ0ZQo+PiBjYWxsLCBvciBlbHNlIHRoZXJlJ3Mgc3RpbGwgYSB3aW5kb3cgKGFsYmVpdCBz
bWFsbCkgd2hlcmUgeW91IGNhbgo+PiBzdGlsbCBnZXQgcG9zdGVkIGludGVycnVwdHMgZGVsaXZl
cmVkIHRvIHRoZSBvbGQgdmNwdS4KPiAKPiBJIGFncmVlIHdpdGggeW91IHRoYXQgd2UgbmVlZCB0
byB0YWtlIGNhcmUgb2YgdGhpcyBpc3N1ZSBhcyB3ZWxsLgo+IAo+IEkgY3JlYXRlZCBhbiBhZGRp
dGlvbmFsIHBhdGNoIGJ1dCBub3QgdGVzdGVkIHlldCBmb3IgdGhlIHRlc3QgZW52IHdhcwo+IGJy
b2tlbiwgcG9zdCBoZXJlIGZvciB5b3VyIGNvbW1lbnQgZmlyc3RseSwgSSdsbCB1cGRhdGUgbGF0
ZXIgb2YgdGVzdAo+IHJlc3VsdCB3aGVuIG15IHRlc3QgZW52IGJhY2s6CgpJdCB3b3VsZCBoYXZl
IGJlZW4gbmljZSBpZiB5b3UgaGFkIGF0IGxlYXN0IGJ1aWxkLXRlc3RlZCBpdC4gSW4KaXRzIGN1
cnJlbnQgc2hhcGUgaXQncyBoYXJkIHRvIHRlbGwgd2hhdCB2YWx1ZSBpdCBpcy4gQW55d2F5LCAu
Li4KCj4gQEAgLTIzLDYgKzIzLDcgQEAKPiAgI2luY2x1ZGUgPHhlbi9pcnEuaD4KPiAgI2luY2x1
ZGUgPGFzbS9odm0vaXJxLmg+Cj4gICNpbmNsdWRlIDxhc20vaHZtL3N1cHBvcnQuaD4KPiArI2lu
Y2x1ZGUgPGFzbS9odm0vdm14L3ZteC5oPgoKV2h5IGlzIHRoaXMgbmVlZGVkPyBJdCdzIG5vdCBh
IGdvb2QgaWRlYSB0byBpbmNsdWRlIGl0IGhlcmUuCgo+IEBAIC00NDMsOSArNDQ0LDIxIEBAIGlu
dCBwdF9pcnFfY3JlYXRlX2JpbmQoCj4gICAgICAgICAgICAgIGh2bV9taWdyYXRlX3BpcnEocGly
cV9kcGNpLCB2Y3B1KTsKPiAgCj4gICAgICAgICAgLyogVXNlIGludGVycnVwdCBwb3N0aW5nIGlm
IGl0IGlzIHN1cHBvcnRlZC4gKi8KPiAtICAgICAgICBpZiAoIGlvbW11X2ludHBvc3QgKQo+IC0g
ICAgICAgICAgICBwaV91cGRhdGVfaXJ0ZSh2Y3B1ID8gJnZjcHUtPmFyY2guaHZtLnZteC5waV9k
ZXNjIDogTlVMTCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5mbywgcGlycV9kcGNp
LT5nbXNpLmd2ZWMpOwo+ICsgICAgICAgIGlmICggaW9tbXVfaW50cG9zdCApIHsKPiArICAgICAg
ICAgICAgdW5zaWduZWQgaW50IG5kc3QgPSBBUElDX0lOVkFMSURfREVTVDsKPiArICAgICAgICAg
ICAgc3RydWN0IGlycV9kZXNjICpkZXNjOwo+ICsKPiArICAgICAgICAgICAgZGVzYyA9IHBpcnFf
c3Bpbl9sb2NrX2lycV9kZXNjKGluZm8sIE5VTEwpOwo+ICsgICAgICAgICAgICBpZiAoIGlycV9k
ZXNjICkgewo+ICsgICAgICAgICAgICAgICAgbmRzdCA9IGlycV9kZXNjLT5tc2lfZGVzYy0+cGlf
ZGVzYy0+bmRzdDsKPiArICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycSgmZGVzYy0+bG9j
ayk7Cj4gKyAgICAgICAgICAgIH0KClRoaXMgcmVkb2VzIChpbiBhIG11Y2ggbGVzcyBjYXJlZnVs
IHdheSwgaS5lLiBwcm9uZSB0byBhIGNyYXNoKQp3aGF0IHBpX3VwZGF0ZV9pcnRlKCkgZG9lcy4g
SXQgd291bGQgc2VlbSBmYXIgZWFzaWVyIGlmIHlvdQpzaW1wbHkgbWFkZSB0aGUgZnVuY3Rpb24g
cmV0dXJuIHRoZSB2YWx1ZSwgb3IgZXZlbiBtYWtlIGl0IGRvCnRoZSBjYWxsIHJpZ2h0IGF3YXkg
KHdoZW4gbmVlZGVkKS4KCj4gKyAgICAgICAgICAgIGlmICggcGlfdXBkYXRlX2lydGUodmNwdSA/
ICZ2Y3B1LT5hcmNoLmh2bS52bXgucGlfZGVzYyA6IE5VTEwsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGluZm8sIHBpcnFfZHBjaS0+Z21zaS5ndmVjKSA9PSAwCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmJiBuZHN0ICE9IEFQSUNfSU5WQUxJRF9ERVNUICkK
PiArICAgICAgICAgICAgICAgIHZsYXBpY19zeW5jX3Bpcl90b19pcnIoZC0+dmNwdVtuZHN0XSk7
CgpBaXVpICJuZHN0IiBpcyBhbiBBUElDIElEIGFuZCBoZW5jZSBjYW4ndCBiZSB1c2VkIHRvIGlu
ZGV4CmQtPnZjcHVbXS4gV2l0aG91dCBhIGRlc2NyaXB0aW9uIGl0J3Mgbm90IHJlYWxseSBjbGVh
ciB0byBtZQp3aHkgeW91IGZvdW5kIGl0IG5lY2Vzc2FyeSB0byBnbyB2aWEgQVBJQyBJRCBoZXJl
IC0gaW4geW91cgplYXJsaWVyIHBhdGNoIHZhcmlhbnQgdGhpcyB3YXNuJ3QgdGhlIGNhc2UgaWly
Yy4KCkJlZm9yZSB5b3UgYWN0dWFsbHkgKHJlKXBvc3QgdGhpcyBwYXRjaCB5b3UnbGwgYWxzbyB3
YW50IHRvCnRha2UgY2FyZSBvZiBudW1lcm91cyBzdHlsZSBpc3N1ZXMuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
