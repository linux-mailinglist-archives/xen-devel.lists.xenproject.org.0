Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABADDAD66C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 12:08:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7GYW-0001Kp-Vm; Mon, 09 Sep 2019 10:05:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7GYU-0001Ka-PK
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 10:05:54 +0000
X-Inumbo-ID: 68af3466-d2e9-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68af3466-d2e9-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 10:05:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 672CCABF1;
 Mon,  9 Sep 2019 10:05:53 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190909092506.24792-1-jgross@suse.com>
 <20190909092506.24792-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1f4d76ea-d958-be1f-eaae-5e552ae9a7a0@suse.com>
Date: Mon, 9 Sep 2019 12:06:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909092506.24792-6-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 5/5] xen: add debugtrace entry when entry
 count is wrapping
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxMToyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUaGUgZGVidWd0cmFj
ZSBlbnRyeSBjb3VudCBpcyBhIDMyIGJpdCB2YXJpYWJsZSwgc28gaXQgY2FuIHdyYXAgd2hlbgo+
IGxvdHMgb2YgdHJhY2UgZW50cmllcyBhcmUgYmVpbmcgcHJvZHVjZWQuIE1ha2luZyBpdCB3aWRl
ciB3b3VsZCByZXN1bHQKPiBpbiBhIHdhc3RlIG9mIGJ1ZmZlciBzcGFjZSBhcyB0aGUgcHJpbnRl
ZCBjb3VudCB2YWx1ZSB3b3VsZCBjb25zdW1lCj4gbW9yZSBieXRlcyB3aGVuIG5vdCB3cmFwcGlu
Zy4KPiAKPiBTbyBpbnN0ZWFkIG9mIGxldHRpbmcgdGhlIGNvdW50IHZhbHVlIGdyb3cgdG8gaHVn
ZSB2YWx1ZXMgbGV0IGl0IHdyYXAKPiBhbmQgYWRkIGEgd3JhcCBjb3VudGVyIHByaW50ZWQgaW4g
dGhpcyBzaXR1YXRpb24uIFRoaXMgd2lsbCBrZWVwIHRoZQo+IG5lZWRlZCBidWZmZXIgc3BhY2Ug
YXQgdG9kYXkncyB2YWx1ZSB3aGlsZSBhdm9pZGluZyB0byBsb29zZSBhIHdheSB0bwo+IHNvcnQg
YWxsIGVudHJpZXMgaW4gY2FzZSBtdWx0aXBsZSB0cmFjZSBidWZmZXJzIGFyZSBpbnZvbHZlZC4K
PiAKPiBOb3RlIHRoYXQgdGhlIHdyYXAgbWVzc2FnZSB3aWxsIGJlIHByaW50ZWQgYmVmb3JlIHRo
ZSBmaXJzdCB0cmFjZQo+IGVudHJ5IGluIGNhc2Ugb3V0cHV0IGlzIHN3aXRjaGVkIHRvIGNvbnNv
bGUgZWFybHkuIFRoaXMgaXMgb24gcHVycG9zZQo+IGluIG9yZGVyIHRvIGVuYWJsZSBhIGZ1dHVy
ZSBzdXBwb3J0IG9mIGRlYnVndHJhY2UgdG8gY29uc29sZSB3aXRob3V0Cj4gYW55IGFsbG9jYXRl
ZCBidWZmZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
