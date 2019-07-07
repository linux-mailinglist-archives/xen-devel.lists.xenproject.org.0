Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54C661E38
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 14:15:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkSWV-0001Cw-Ad; Mon, 08 Jul 2019 12:13:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkSWT-0001CX-Tn
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 12:13:33 +0000
X-Inumbo-ID: cd08ee76-a179-11e9-9fc5-cf54b68c129f
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cd08ee76-a179-11e9-9fc5-cf54b68c129f;
 Mon, 08 Jul 2019 12:13:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A1DA360;
 Mon,  8 Jul 2019 05:13:31 -0700 (PDT)
Received: from [10.37.9.206] (unknown [10.37.9.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE2CA3F738;
 Mon,  8 Jul 2019 05:13:29 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
 <20190619175333.29938-5-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <66ff34b0-5431-3f02-5892-db645cfbc31c@arm.com>
Date: Sun, 7 Jul 2019 19:32:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619175333.29938-5-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 4/5] xen/arm: optee: check if OP-TEE is
 virtualization-aware
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gNi8xOS8xOSA2OjU0IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90
ZToKPiBUaGlzIGlzIHdvcmthcm91bmQgZm9yIE9QLVRFRSAzLjUuIFRoaXMgaXMgdGhlIGZpcnN0
IE9QLVRFRSByZWxlYXNlCj4gd2hpY2ggc3VwcG9ydHMgdmlydHVhbGl6YXRpb24sIGJ1dCB0aGVy
ZSBpcyBubyB3YXkgdG8gdGVsbCBpZgo+IE9QLVRFRSB3YXMgYnVpbHQgd2l0aCB0aGF0IHN1cHBv
cnQgZW5hYmxlZC4gV2UgY2FuIHByb2JlIGZvciBpdAo+IGJ5IGNhbGxpbmcgU01DIHRoYXQgaXMg
YXZhaWxhYmxlIG9ubHkgd2hlbiBPUC1URUUgaXMgYnVpbHQgd2l0aAo+IHZpcnR1YWxpemF0aW9u
IHN1cHBvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15
cl9iYWJjaHVrQGVwYW0uY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgpDaGVlcnMsCgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIHwg
MTAgKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIGIveGVuL2FyY2gvYXJtL3RlZS9v
cHRlZS5jCj4gaW5kZXggMjhkMzQzNjBmYy4uMTQzODFkNmIyZCAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC9hcm0vdGVlL29wdGVlLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMKPiBA
QCAtMTcyLDYgKzE3MiwxNiBAQCBzdGF0aWMgYm9vbCBvcHRlZV9wcm9iZSh2b2lkKQo+ICAgICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gICAgICAgfQo+ICAgCj4gKyAgICAvKgo+ICsgICAgICogV29y
a2Fyb3VuZDogT1AtVEVFIDMuNSBoYXZlIG5vIHdheSB0byB0ZWxsIGlmIGl0IGlzIGJ1aWxkIHdp
dGgKPiArICAgICAqIHZpcnR1YWxpemF0aW9uIHN1cHBvcnQuIEJ1dCB3ZSBjYW4gcHJvYmUgZm9y
IE9QVEVFX1NNQ19WTV9ERVNUUk9ZRUQKPiArICAgICAqIGNhbGwuIEl0IHdpbGwgcmV0dXJuIE9Q
VEVFX1NNQ19SRVRVUk5fVU5LTk9XTl9GVU5DVElPTiBpZgo+ICsgICAgICogT1AtVEVFIGhhdmUg
bm8gdmlydHVhbGl6YXRpb24gc3VwcG9ydCBlbmFibGVkLgo+ICsgICAgICovCj4gKyAgICBhcm1f
c21jY2Nfc21jKE9QVEVFX1NNQ19WTV9ERVNUUk9ZRUQsIDAsIDAsIDAsIDAsIDAsIDAsIDAsICZy
ZXNwKTsKPiArICAgIGlmICggcmVzcC5hMCA9PSBPUFRFRV9TTUNfUkVUVVJOX1VOS05PV05fRlVO
Q1RJT04gKQo+ICsgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4gICAgICAgcmV0dXJuIHRydWU7
Cj4gICB9Cj4gICAKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
