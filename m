Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4B6A9FC5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 12:36:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5p2l-0003Vr-MS; Thu, 05 Sep 2019 10:31:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5p2k-0003Vm-4c
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 10:31:10 +0000
X-Inumbo-ID: 4612c1f8-cfc8-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4612c1f8-cfc8-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 10:31:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 75541AC0C;
 Thu,  5 Sep 2019 10:31:08 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190904134608.18425-1-jgross@suse.com>
 <20190904134608.18425-4-jgross@suse.com>
 <5210e461-71f8-b8ba-0698-13019be9d77c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ec2b0c2c-4d80-1f52-ed6b-a634125f68e6@suse.com>
Date: Thu, 5 Sep 2019 12:31:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5210e461-71f8-b8ba-0698-13019be9d77c@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v4 3/4] xen: refactor debugtrace data
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMTkgMTI6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjA5LjIwMTkgMTU6
NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vZGVidWd0cmFjZS5j
Cj4+ICsrKyBiL3hlbi9jb21tb24vZGVidWd0cmFjZS5jCj4+IEBAIC0xNSwzNSArMTUsNDEgQEAK
Pj4gICAjaW5jbHVkZSA8eGVuL3dhdGNoZG9nLmg+Cj4+ICAgCj4+ICAgLyogU2VuZCBvdXRwdXQg
ZGlyZWN0IHRvIGNvbnNvbGUsIG9yIGJ1ZmZlciBpdD8gKi8KPj4gLXN0YXRpYyB2b2xhdGlsZSBp
bnQgZGVidWd0cmFjZV9zZW5kX3RvX2NvbnNvbGU7Cj4+ICtzdGF0aWMgdm9sYXRpbGUgYm9vbCBk
ZWJ1Z3RyYWNlX3NlbmRfdG9fY29uc29sZTsKPj4gICAKPj4gLXN0YXRpYyBjaGFyICAgICAgICAq
ZGVidWd0cmFjZV9idWY7IC8qIERlYnVnLXRyYWNlIGJ1ZmZlciAqLwo+PiAtc3RhdGljIHVuc2ln
bmVkIGludCBkZWJ1Z3RyYWNlX3ByZDsgLyogUHJvZHVjZXIgaW5kZXggICAgICovCj4+IC1zdGF0
aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2VfcHJkX2xhc3Q7Cj4+IC1zdGF0aWMgdW5zaWduZWQg
aW50IGRlYnVndHJhY2Vfa2lsb2J5dGVzID0gMTI4LCBkZWJ1Z3RyYWNlX2J5dGVzOwo+PiAtc3Rh
dGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX3VzZWQ7Cj4+ICtzdHJ1Y3QgZGVidWd0cmFjZV9k
YXRhIHsKPj4gKyAgICB1bnNpZ25lZCBsb25nIGJ5dGVzOyAvKiBTaXplIG9mIGJ1ZmZlci4gKi8K
Pj4gKyAgICB1bnNpZ25lZCBsb25nIHByZDsgICAvKiBQcm9kdWNlciBpbmRleC4gKi8KPj4gKyAg
ICB1bnNpZ25lZCBsb25nIHByZF9sYXN0Owo+IAo+IEknZCBzdGlsbCBsaWtlIHRoaXMgY2hhbmdl
IGZyb20gaW50IHRvIGxvbmcgbWVudGlvbmVkIC8ganVzdGlmaWVkCj4gaW4gdGhlIGRlc2NyaXB0
aW9uLiBXaXRoIHRoaXMKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKT2theSwgdGhhbmtzLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
