Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4795217A695
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 14:43:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9qjQ-0005pb-RE; Thu, 05 Mar 2020 13:40:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eGB2=4W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9qjP-0005pS-Pi
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 13:40:07 +0000
X-Inumbo-ID: d0d4a218-5ee6-11ea-a5b8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0d4a218-5ee6-11ea-a5b8-12813bfff9fa;
 Thu, 05 Mar 2020 13:40:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1DDADAFF0;
 Thu,  5 Mar 2020 13:40:02 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200305114044.20235-1-jgross@suse.com>
 <20200305124255.GW24458@Air-de-Roger.citrite.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c2c1573a-8c98-4a99-64fb-1346ee724d08@suse.com>
Date: Thu, 5 Mar 2020 14:40:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305124255.GW24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/blkfront: fix ring info addressing
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
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAgMTM6NDIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVGh1LCBNYXIg
MDUsIDIwMjAgYXQgMTI6NDA6NDRQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQ29t
bWl0IDAyNjVkNmU4ZGRiODkwICgieGVuL2Jsa2Zyb250OiBsaW1pdCBhbGxvY2F0ZWQgbWVtb3J5
IHNpemUgdG8KPj4gYWN0dWFsIHVzZSBjYXNlIikgbWFkZSBzdHJ1Y3QgYmxrZnJvbnRfcmluZ19p
bmZvIHNpemUgZHluYW1pYy4gVGhpcyBpcwo+PiBmaW5lIHdoZW4gcnVubmluZyB3aXRoIG9ubHkg
b25lIHF1ZXVlLCBidXQgd2l0aCBtdWx0aXBsZSBxdWV1ZXMgdGhlCj4+IGFkZHJlc3Npbmcgb2Yg
dGhlIHNpbmdsZSBxdWV1ZXMgaGFzIHRvIGJlIGFkYXB0ZWQgYXMgdGhlIHN0cnVjdHMgYXJlCj4+
IGFsbG9jYXRlZCBpbiBhbiBhcnJheS4KPj4KPj4gRml4ZXM6IDAyNjVkNmU4ZGRiODkwICgieGVu
L2Jsa2Zyb250OiBsaW1pdCBhbGxvY2F0ZWQgbWVtb3J5IHNpemUgdG8gYWN0dWFsIHVzZSBjYXNl
IikKPj4gUmVwb3J0ZWQtYnk6IFNhbmRlciBFaWtlbGVuYm9vbSA8bGludXhAZWlrZWxlbmJvb20u
aXQ+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4g
LS0tCj4+IFYyOgo+PiAtIGdldCByaWQgb2YgcmluZm9fcHRyKCkgaGVscGVyCj4+IC0gdXNlIHBy
b3BlciBwYXJlbnRoZXNpcyBpbiBmb3JfZWFjaF9yaW5mbygpCj4+IC0gcmVuYW1lIHJpbmZvIHBh
cmFtZXRlciBvZiBmb3JfZWFjaF9yaW5mbygpCj4+IC0tLQo+PiAgIGRyaXZlcnMvYmxvY2sveGVu
LWJsa2Zyb250LmMgfCA3OSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgYi9kcml2
ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4+IGluZGV4IGUyYWQ2YmJhMjI4MS4uOGU4NDRkYTgy
NmRiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4+ICsrKyBi
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPj4gQEAgLTIxMyw2ICsyMTMsNyBAQCBzdHJ1
Y3QgYmxrZnJvbnRfaW5mbwo+PiAgIAlzdHJ1Y3QgYmxrX21xX3RhZ19zZXQgdGFnX3NldDsKPj4g
ICAJc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm87Cj4+ICAgCXVuc2lnbmVkIGludCBu
cl9yaW5nczsKPj4gKwl1bnNpZ25lZCBpbnQgcmluZm9fc2l6ZTsKPj4gICAJLyogU2F2ZSB1bmNv
bXBsZXRlIHJlcXMgYW5kIGJpb3MgZm9yIG1pZ3JhdGlvbi4gKi8KPj4gICAJc3RydWN0IGxpc3Rf
aGVhZCByZXF1ZXN0czsKPj4gICAJc3RydWN0IGJpb19saXN0IGJpb19saXN0Owo+PiBAQCAtMjU5
LDYgKzI2MCwxOCBAQCBzdGF0aWMgaW50IGJsa2Zyb250X3NldHVwX2luZGlyZWN0KHN0cnVjdCBi
bGtmcm9udF9yaW5nX2luZm8gKnJpbmZvKTsKPj4gICBzdGF0aWMgdm9pZCBibGtmcm9udF9nYXRo
ZXJfYmFja2VuZF9mZWF0dXJlcyhzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbyk7Cj4+ICAgc3Rh
dGljIGludCBuZWdvdGlhdGVfbXEoc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8pOwo+PiAgIAo+
PiArI2RlZmluZSBmb3JfZWFjaF9yaW5mbyhpbmZvLCBwdHIsIGlkeCkJCQkJXAo+PiArCWZvciAo
KHB0cikgPSAoaW5mbyktPnJpbmZvLCAoaWR4KSA9IDA7CQkJXAo+PiArCSAgICAgKGlkeCkgPCAo
aW5mbyktPm5yX3JpbmdzOwkJCQlcCj4+ICsJICAgICAoaWR4KSsrLCAocHRyKSA9ICh2b2lkICop
KHB0cikgKyAoaW5mbyktPnJpbmZvX3NpemUpCj4+ICsKPj4gK3N0YXRpYyBzdHJ1Y3QgYmxrZnJv
bnRfcmluZ19pbmZvICpnZXRfcmluZm8oc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8sCj4gCj4g
SSBzdGlsbCB0aGluayBpbmxpbmUgc2hvdWxkIGJlIGFkZGVkIGhlcmUsIGJ1dCBJIGRvbid0IGhh
dmUgc3VjaCBhCj4gc3Ryb25nIG9waW5pb24gdG8gYmxvY2sgdGhlIHBhdGNoIG9uIGl0LgoKSSBj
YW4gYWRkIGl0IGlmIHlvdSBsaWtlIHRoYXQgYmV0dGVyLiBXb24ndCBtYWtlIG11Y2ggZGlmZmVy
ZW5jZSBpbiB0aGUKZW5kLgoKPiBBbHNvLCBpbmZvIHNob3VsZCBiZSBjb25zdGlmaWVkIEFGQUlD
VC4KClllcy4KCj4gCj4gV2l0aCBhdCBsZWFzdCBpbmZvIGNvbnN0aWZpZWQ6Cj4gCj4gQWNrZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IENhbiB5b3Ug
cXVldWUgdGhpcyB0aHJvdWdoIHRoZSBYZW4gdHJlZT8KClN1cmUuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
