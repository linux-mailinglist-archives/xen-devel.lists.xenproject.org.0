Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B974C2FD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 23:30:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdi8R-0000iz-Hf; Wed, 19 Jun 2019 21:28:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdi8P-0000iS-U8
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 21:28:49 +0000
X-Inumbo-ID: 39c27527-92d9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 39c27527-92d9-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 21:28:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79373344;
 Wed, 19 Jun 2019 14:28:48 -0700 (PDT)
Received: from [10.37.8.153] (unknown [10.37.8.153])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 211913F738;
 Wed, 19 Jun 2019 14:28:46 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-4-git-send-email-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3e5cb174-d83f-e1a1-1d6e-4e0073fa9956@arm.com>
Date: Wed, 19 Jun 2019 22:28:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560975087-25632-4-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] xen/link: Fold .data.read_mostly into
 .data
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA2LzE5LzE5IDk6MTEgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gLmRhdGEucmVhZF9t
b3N0bHkgb25seSBuZWVkcyBzZXBhcmF0aW5nIGZyb20gYWRqYWNlbnQgZGF0YSBieSBvbmUgY2Fj
aGUgbGluZQo+IHRvIGJlIGVmZmVjdGl2ZSwgYW5kIHBsYWNpbmcgaXQgYWRqYWNlbnQgdG8gLmRh
dGEucGFnZV9hbGlnbmVkIGZ1bGZpbGxzIHRoaXMKPiByZXF1aXJlbWVudC4KPiAKPiBGb3IgQVJN
LCAuZXhfdGFibGUgYXBwZWFycyB0byBiZSBhIHZlc3RpZ2lhbCByZW1uYW50LiAgTm90aGluZyBp
biB0aGUKPiByZXN1bHRpbmcgYnVpbGQgZXZlciBpbnNwZWN0cyBvciBhY3RzIG9uIHRoZSBjb250
ZW50cyBvZiB0aGUgdGFibGUuICBUaGUgYXJtMzIKPiBidWlsZCBkb2VzIGhvd2V2ZXIgaGF2ZSBz
b21lIGFzc2VtYmx5IHJvdXRpbmVzIHdoaWNoIGZpbGwgLmV4X3RhYmxlLgo+IAo+IERyb3AgYWxs
IG9mIEFSTSdzIC5leF90YWJsZSBpbmZyYXN0cnVjdHVyZSwgdG8gcmVkdWNlIHRoZSBzaXplIG9m
IHRoZSBjb21waWxlZAo+IGJpbmFyeSwgYW5kIGF2b2lkIGdpdmluZyB0aGUgaWxsdXNpb24gb2Yg
ZXhjZXB0aW9uIGhhbmRsaW5nIHdvcmtpbmcuCgpJIGFtIG5vdCBpbiBmYXZvciBvZiB0aGlzIGNo
YW5nZS4gYXNzZW1ibGVyLmggaXMgbWVhbnQgdG8gYmUgYSB2ZXJiYXRpbSAKY29weSBvZiB0aGUg
TGludXggY291bnRlcnBhcnQuCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3hl
bi5sZHMuUyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKPiBpbmRleCAyYjQ0ZTVkLi4zZGM1MTE3
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKPiArKysgYi94ZW4vYXJjaC9h
cm0veGVuLmxkcy5TCj4gQEAgLTk0LDI3ICs5NCwxMyBAQCBTRUNUSU9OUwo+ICAgICBfZXJvZGF0
YSA9IC47ICAgICAgICAgICAgICAgIC8qIEVuZCBvZiByZWFkLW9ubHkgZGF0YSAqLwo+ICAgCj4g
ICAgIC5kYXRhIDogeyAgICAgICAgICAgICAgICAgICAgLyogRGF0YSAqLwo+ICsgICAgICAgKigu
ZGF0YS5yZWFkX21vc3RseSkKCkJlZm9yZSwgLmRhdGEucmVhZF9tb3N0bHkgd2FzIFNNUF9DQUNI
RV9CWVRFUyBhbGlnbmVkLiBOb3csIGl0IHNlZW1zIAp0aGVyZSBhcmUgbm8gYWxpZ25tZW50LgoK
VGhpcyBtYXkgZW5kIHVwIHRvIGhhdmUgX2Vyb2RhdGEgYW5kIC5kYXRhLnJlYWRfbW9zdGx5IHRv
IGJlIHBhcnQgb2YgdGhlIApzYW1lIHBhZ2UuIEFzIEFybSBlbmZvcmNlIHJlYWQtb25seSwgeW91
IG1heSBjcmFzaCBvbiBhY2Nlc3MgdG8gCi5kYXRhLnJlYWRfbW9zdGx5LgoKU28gSSB0aGluayB5
b3UgaGF2ZQouID0gQUxJR04oUEFHRV9TSVpFKQoqKC5kYXRhLnJlYWRfbW9zdGx5KQouYWxpZ24o
U01QX0NBQ0hFX0JZVEVTKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
