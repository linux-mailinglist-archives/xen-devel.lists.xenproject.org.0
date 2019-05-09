Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6E6193AC
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 22:42:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOppq-0003gG-Ck; Thu, 09 May 2019 20:40:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UEDQ=TJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOppp-0003gB-Ho
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 20:40:09 +0000
X-Inumbo-ID: a200f718-729a-11e9-822a-b30e49bee5d8
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a200f718-729a-11e9-822a-b30e49bee5d8;
 Thu, 09 May 2019 20:40:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EA6A217D6;
 Thu,  9 May 2019 20:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557434407;
 bh=vrUl1Aifz8+tiiBdO68OOnPT/2U7ceTWLa88WeMD4so=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZZxvVJafbFli593FiEbNlzLSdJH5K4fb1dlrrx/6mtahCWk3ouhKaT1r/3x/A/O10
 WCXnoPnq3+JxE7ZYwC1nAnaj0vZWJUfUEzk4W08rAP9pQKi3+atjpDoRcpDtXzd8WP
 wb8XpevD+Uy0JswsLTbJHKJfRPqory2OSAilr5U0=
Date: Thu, 9 May 2019 13:40:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190508161603.21964-8-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905091340000.25766@sstabellini-ThinkPad-T480s>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-8-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 7/7] xen/arm: mm: Flush the TLBs even if
 a mapping failed in create_xen_entries
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA4IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQXQgdGhlIG1vbWVudCwg
Y3JlYXRlX3hlbl9lbnRyaWVzIHdpbGwgb25seSBmbHVzaCB0aGUgVExCcyBpZiB0aGUgZnVsbAo+
IHJhbmdlIGhhcyBzdWNjZXNzZnVsbHkgYmVlbiB1cGRhdGVkLiBUaGlzIG1heSBsZWFkIHRvIGxl
YXZlIHVud2FudGVkCj4gZW50cmllcyBpbiB0aGUgVExCcyBpZiB3ZSBmYWlsIHRvIHVwZGF0ZSBz
b21lIGVudHJpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBl
cGFtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CgoKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gQWRkIEFu
ZHJpaSdzIHJldmlld2VkLWJ5Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS9tbS5jIHwgMjAgKysrKysr
KysrKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gv
YXJtL21tLmMKPiBpbmRleCA4ZWU4MjhkNDQ1Li45ZDU4NGU0Y2JmIDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL2FybS9tbS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMKPiBAQCAtOTg0LDcgKzk4
NCw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl9lbnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlv
biBvcCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBucl9t
Zm5zLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3Mp
Cj4gIHsKPiAtICAgIGludCByYzsKPiArICAgIGludCByYyA9IDA7Cj4gICAgICB1bnNpZ25lZCBs
b25nIGFkZHIgPSB2aXJ0LCBhZGRyX2VuZCA9IGFkZHIgKyBucl9tZm5zICogUEFHRV9TSVpFOwo+
ICAgICAgbHBhZV90IHB0ZSwgKmVudHJ5Owo+ICAgICAgbHBhZV90ICp0aGlyZCA9IE5VTEw7Cj4g
QEAgLTEwMTMsNyArMTAxMyw4IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl9lbnRyaWVzKGVudW0g
eGVubWFwX29wZXJhdGlvbiBvcCwKPiAgICAgICAgICAgICAgICAgIHsKPiAgICAgICAgICAgICAg
ICAgICAgICBwcmludGsoIiVzOiB0cnlpbmcgdG8gcmVwbGFjZSBhbiBleGlzdGluZyBtYXBwaW5n
IGFkZHI9JWx4IG1mbj0lIlBSSV9tZm4iXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX2Z1bmNfXywgYWRkciwgbWZuX3gobWZuKSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwo+ICsgICAg
ICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAg
ICAgICAgICAgaWYgKCBvcCA9PSBSRVNFUlZFICkKPiAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiBAQCAtMTAzMCw3ICsxMDMxLDggQEAgc3RhdGljIGludCBjcmVhdGVfeGVuX2VudHJpZXMo
ZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLAo+ICAgICAgICAgICAgICAgICAgewo+ICAgICAgICAg
ICAgICAgICAgICAgIHByaW50aygiJXM6IHRyeWluZyB0byAlcyBhIG5vbi1leGlzdGluZyBtYXBw
aW5nIGFkZHI9JWx4XG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywg
b3AgPT0gUkVNT1ZFID8gInJlbW92ZSIgOiAibW9kaWZ5IiwgYWRkcik7Cj4gLSAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgICAgICAgcmMgPSAtRUlO
VkFMOwo+ICsgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgICAgICAgICAgaWYgKCBvcCA9PSBSRU1PVkUgKQo+ICAgICAgICAgICAgICAg
ICAgICAgIHB0ZS5iaXRzID0gMDsKPiBAQCAtMTA0Myw3ICsxMDQ1LDggQEAgc3RhdGljIGludCBj
cmVhdGVfeGVuX2VudHJpZXMoZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLAo+ICAgICAgICAgICAg
ICAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRrKCIlczogSW5jb3Jy
ZWN0IGNvbWJpbmF0aW9uIGZvciBhZGRyPSVseFxuIiwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF9fZnVuY19fLCBhZGRyKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gICAgICAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICAgd3JpdGVfcHRlKGVudHJ5
LCBwdGUpOwo+IEBAIC0xMDUyLDExICsxMDU1LDE0IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl9l
bnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKPiAgICAgICAgICAgICAgICAgIEJVRygp
Owo+ICAgICAgICAgIH0KPiAgICAgIH0KPiArb3V0Ogo+ICsgICAgLyoKPiArICAgICAqIEZsdXNo
IHRoZSBUTEJzIGV2ZW4gaW4gY2FzZSBvZiBmYWlsdXJlIGJlY2F1c2Ugd2UgbWF5IGhhdmUKPiAr
ICAgICAqIHBhcnRpYWxseSBtb2RpZmllZCB0aGUgUFQuIFRoaXMgd2lsbCBwcmV2ZW50IGFueSB1
bmV4cGVjdGVkCj4gKyAgICAgKiBiZWhhdmlvciBhZnRlcndhcmRzLgo+ICsgICAgICovCj4gICAg
ICBmbHVzaF94ZW5fdGxiX3JhbmdlX3ZhKHZpcnQsIFBBR0VfU0laRSAqIG5yX21mbnMpOwo+ICAK
PiAtICAgIHJjID0gMDsKPiAtCj4gLW91dDoKPiAgICAgIHJldHVybiByYzsKPiAgfQo+ICAKPiAt
LSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
