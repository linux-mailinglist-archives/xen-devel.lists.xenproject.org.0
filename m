Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA97E9E38E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 11:02:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2XJr-0005qZ-Gb; Tue, 27 Aug 2019 08:59:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2XJp-0005qU-Lk
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 08:59:13 +0000
X-Inumbo-ID: f036d682-c8a8-11e9-ae2f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f036d682-c8a8-11e9-ae2f-12813bfff9fa;
 Tue, 27 Aug 2019 08:59:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D8B7ABF1;
 Tue, 27 Aug 2019 08:59:11 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
 <14720122f97667082d27153edd0e50aa6bc29e96.camel@infradead.org>
 <6487c442-d134-756a-e29d-81fae360a504@suse.com>
 <32bc72da5d499125a1b3c620e1438b2e8c31f772.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5d0d640-ed92-e97e-d94b-38fe0b05835d@suse.com>
Date: Tue, 27 Aug 2019 10:59:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <32bc72da5d499125a1b3c620e1438b2e8c31f772.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/boot: Copy 16-bit boot variables
 back up to Xen image
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAxNzoyNSwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIE1vbiwgMjAx
OS0wOC0xMiBhdCAxMjoyNCArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIw
MTkgMTc6MDIsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+IEBAIC0yMjcsNyArMjMxLDcgQEAg
c3RhcnQ2NDoKPj4+ICAgICAgICAgICAud29yZCAgIDAKPj4+ICAgaWR0XzQ4OiAud29yZCAgIDAs
IDAsIDAgIyBiYXNlID0gbGltaXQgPSAwCj4+PiAgICAgICAgICAgLndvcmQgICAwCj4+PiAtZ2R0
XzQ4OiAud29yZCAgIDYqOC0xCj4+PiArZ2R0XzQ4OiAud29yZCAgIDcqOC0xCj4+PiAgICAgICAg
ICAgLmxvbmcgICB0cmFtcDMyc3ltX3JlbCh0cmFtcG9saW5lX2dkdCw0KQo+Pgo+PiBZb3UgZG9u
J3QgZ3JvdyB0cmFtcG9saW5lX2dkdCBoZXJlLCBzbyBJIHRoaW5rIHRoaXMgY2hhbmdlIGlzCj4+
IHdyb25nLiBBbmQgaWYgYSBjaGFuZ2Ugd2FzIG5lZWRlZCBhdCBhbGwgKHBlcmhhcHMgaW4gdGhl
IG5leHQKPj4gcGF0Y2gpLCB0aGVuIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIHJlcGxh
Y2UgdGhlIHVzZSBvZgo+PiBsaXRlcmFsIG51bWJlcnMsIHVzaW5nIHRoZSBkaWZmZXJlbmNlIG9m
IHR3byBsYWJlbHMgaW5zdGVhZAo+PiAodGhlICJlbmQiIGxhYmxlIHByZWZlcmFibHkgYmVpbmcg
YSAuTC1wcmVmaXhlZCBvbmUpLgo+IAo+IEkgZG9uJ3QgZ3JvdyBpdCBidXQuLi4gY291bnQgaXQg
4pi6Lgo+IAo+IEkgZG8gc3RhcnQgdXNpbmcgc3ltX2ZzKCkgaGVyZSBpbiBwbGFjZXMgdGhhdCBp
dCB3YXNuJ3QgYmVmb3JlLCBzbyB0aGUKPiBpbmNvcnJlY3Qgc2l6ZSBzdGFydGVkIHRvICptYXR0
ZXIqIGJlY2F1c2UgdGhlIEJPT1RfRlMgc2VsZWN0b3Igd2Fzbid0Cj4gaW5jbHVkZWQgaW4gdGhl
IGxpbWl0LgoKT2gsIEkgc2VlIC0gYSAobGF0ZW50KSBidWcgaW50cm9kdWNlZCBieSBiMjgwNDQy
MjZlLiBTaG91bGQgcGVyaGFwcwpiZSBhIHNlcGFyYXRlIHBhdGNoIHRvIGZpeCB0aGlzIHRoZW4g
KGJ5LCBhcyBzdWdnZXN0ZWQsIHVzaW5nIGFuCiJlbmQiIGxhYmVsIHJhdGhlciB0aGFuIGhhcmQg
Y29kZWQgbnVtYmVycykuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
