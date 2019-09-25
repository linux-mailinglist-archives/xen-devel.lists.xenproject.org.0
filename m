Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB41ABE1EB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:05:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9kb-0004w9-Ug; Wed, 25 Sep 2019 16:02:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD9kb-0004w4-7u
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:02:45 +0000
X-Inumbo-ID: e8736fd5-dfad-11e9-9637-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e8736fd5-dfad-11e9-9637-12813bfff9fa;
 Wed, 25 Sep 2019 16:02:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0FDBAEEE;
 Wed, 25 Sep 2019 16:02:42 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-47-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <642b4196-d62d-a2b8-36ca-55a16da26764@suse.com>
Date: Wed, 25 Sep 2019 18:02:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-47-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 46/47] xen/sched: disable scheduling when
 entering ACPI deep sleep states
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBXaGVuIGVudGVyaW5n
IGRlZXAgc2xlZXAgc3RhdGVzIGFsbCBkb21haW5zIGFyZSBwYXVzZWQgcmVzdWx0aW5nIGluCj4g
YWxsIGNwdXMgb25seSBydW5uaW5nIGlkbGUgdmNwdXMuIFRoaXMgZW5hYmxlcyB1cyB0byBzdG9w
IHNjaGVkdWxpbmcKPiBjb21wbGV0ZWx5IGluIG9yZGVyIHRvIGF2b2lkIHN5bmNocm9uaXphdGlv
biBwcm9ibGVtcyB3aXRoIGNvcmUKPiBzY2hlZHVsaW5nIHdoZW4gaW5kaXZpZHVhbCBjcHVzIGFy
ZSBvZmZsaW5lZC4KPiAKPiBEaXNhYmxpbmcgdGhlIHNjaGVkdWxlciBpcyBkb25lIGJ5IHJlcGxh
Y2luZyB0aGUgc29mdGlycSBoYW5kbGVyCj4gd2l0aCBhIGR1bW15IHNjaGVkdWxpbmcgcm91dGlu
ZSBvbmx5IGVuYWJsaW5nIHRhc2tsZXRzIHRvIHJ1bi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gVjI6IG5ldyBwYXRjaAo+IC0tLQo+
ICB4ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jIHwgIDQgKysrKwoKVGhlIG1pbmltYWwgY2hhbmdl
cyBoZXJlCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgo+ICt2b2lk
IHNjaGVkdWxlcl9kaXNhYmxlKHZvaWQpCj4gK3sKPiArICAgIHNjaGVkdWxlcl9hY3RpdmUgPSBm
YWxzZTsKPiArICAgIG9wZW5fc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRLCBzY2hlZHVsZV9kdW1t
eSk7Cj4gKyAgICBvcGVuX3NvZnRpcnEoU0NIRURfU0xBVkVfU09GVElSUSwgc2NoZWR1bGVfZHVt
bXkpOwo+ICt9Cj4gKwo+ICt2b2lkIHNjaGVkdWxlcl9lbmFibGUodm9pZCkKPiArewo+ICsgICAg
b3Blbl9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEsIHNjaGVkdWxlKTsKPiArICAgIG9wZW5fc29m
dGlycShTQ0hFRF9TTEFWRV9TT0ZUSVJRLCBzY2hlZF9zbGF2ZSk7Cj4gKyAgICBzY2hlZHVsZXJf
YWN0aXZlID0gdHJ1ZTsKPiArfQoKSSBoYXZlIHRvIGFkbWl0IEkgZmluZCB0aGUgYmVoYXZpb3Ig
b2Ygb3Blbl9zb2Z0aXJxKCkgb2RkIHRoYXQKeW91IG1ha2UgdXNlIG9mIGhlcmUsIGkuZS4gSSdt
IG5vdCBjb252aW5jZWQgeW91IHNob3VsZCByZWx5IG9uCnRoZSBmdW5jdGlvbiBub3QgZ2Fpbmlu
ZyBhIGNoZWNrIHJlZnVzaW5nIHRoZSBvcGVyYXRpb24gaWYgYQpoYW5kbGVyIGlzIGFscmVhZHkg
aW4gcGxhY2UuIE90b2ggSSBzZWUgdGhhdCBldmVuIGluIHVwLXRvLWRhdGUKTGludXggdGhpcyB3
b3JrcyB0aGUgc2FtZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
