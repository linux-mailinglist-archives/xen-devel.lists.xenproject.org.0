Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D55AA2E7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:20:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qhq-0006Lz-RM; Thu, 05 Sep 2019 12:17:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5qhp-0006Ls-0D
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:17:41 +0000
X-Inumbo-ID: 26661e2d-cfd7-11e9-abc8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26661e2d-cfd7-11e9-abc8-12813bfff9fa;
 Thu, 05 Sep 2019 12:17:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 814E6AF84;
 Thu,  5 Sep 2019 12:17:38 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <45cd123c-f6b5-a687-469c-9cec9164adc4@suse.com>
Date: Thu, 5 Sep 2019 14:17:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905113955.24870-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/4] xen: fix debugtrace clearing
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

T24gMDUuMDkuMjAxOSAxMzozOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZnRlciBkdW1waW5n
IHRoZSBkZWJ1Z3RyYWNlIGJ1ZmZlciBpdCBpcyBjbGVhcmVkLiBUaGlzIHJlc3VsdHMgaW4gc29t
ZQo+IGVudHJpZXMgbm90IGJlaW5nIHByaW50ZWQgaW4gY2FzZSB0aGUgYnVmZmVyIGlzIGR1bXBl
ZCBhZ2FpbiBiZWZvcmUKPiBoYXZpbmcgd3JhcHBlZC4KPiAKPiBXaGlsZSBhdCBpdCByZW1vdmUg
dGhlIHRyYWlsaW5nIHplcm8gYnl0ZSBpbiB0aGUgYnVmZmVyIGFzIGl0IGlzIG5vCj4gbG9uZ2Vy
IG5lZWRlZC4gQ29tbWl0IGI1ZTZlMWVlOGRhNTlmIGludHJvZHVjZWQgcGFzc2luZyB0aGUgbnVt
YmVyIG9mCj4gY2hhcnMgdG8gYmUgcHJpbnRlZCBpbiB0aGUgcmVsYXRlZCBpbnRlcmZhY2VzLCBz
byB0aGUgdHJhaWxpbmcgMCBieXRlCj4gaXMgbm8gbG9uZ2VyIHJlcXVpcmVkLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClRlY2huaWNhbGx5IHRo
aXMgaXMgZmluZSwgc28gaXQgY2FuIGhhdmUgbXkKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KSG93ZXZlciwgLi4uCgo+IEBAIC0xMTczLDYgKzExNzUsNyBAQCBz
dGF0aWMgY2hhciAgICAgICAgKmRlYnVndHJhY2VfYnVmOyAvKiBEZWJ1Zy10cmFjZSBidWZmZXIg
Ki8KPiAgc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX3ByZDsgLyogUHJvZHVjZXIgaW5k
ZXggICAgICovCj4gIHN0YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV9raWxvYnl0ZXMgPSAx
MjgsIGRlYnVndHJhY2VfYnl0ZXM7Cj4gIHN0YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV91
c2VkOwo+ICtzdGF0aWMgY2hhciBkZWJ1Z3RyYWNlX2xhc3RfZW50cnlfYnVmW0RFQlVHX1RSQUNF
X0VOVFJZX1NJWkVdOwoKLi4uIHRoaXMgaXMgd2hhdCBJIHdhcyBhZnJhaWQgd291bGQgaGFwcGVu
LCBidXQgSSBhZG1pdCBJIGRpZG4ndApyZXBseSBpbiBhIHdheSBwcmV2aW91c2x5IGluZGljYXRp
bmcgdGhhdCBJIGRpc2xpa2Ugc3VjaCBhCnNvbHV0aW9uLiBUaGlzIGlzIGFsc28gd2h5LCB3aGVu
IG5vdGljaW5nIHRoZSBpc3N1ZSwgSSBkaWRuJ3QgcHV0CnRvZ2V0aGVyIGEgcGF0Y2ggbXlzZWxm
IHJpZ2h0IGF3YXkuIEluIHBhcnRpY3VsYXIgSSdtIG9mIHRoZQpvcGluaW9uIHRoYXQgdGhlIHRo
cmVlIGxhc3RfKiB2YWx1ZXMgd291bGQgYmV0dGVyIGFsbCBzdGF5CnRvZ2V0aGVyLCBhbmQgdGhl
biB3b3VsZCBiZXR0ZXIgc3RheSBpbnNpZGUgdGhlIG9ubHkgZnVuY3Rpb24KdXNpbmcgdGhlbS4K
Cj4gQEAgLTEyNzksMTEgKzEyODAsMTEgQEAgdm9pZCBkZWJ1Z3RyYWNlX3ByaW50ayhjb25zdCBj
aGFyICpmbXQsIC4uLikKPiAgICAgIH0KPiAgICAgIGVsc2UKPiAgICAgIHsKPiAtICAgICAgICBp
ZiAoIHN0cmNtcChidWYsIGxhc3RfYnVmKSApCj4gKyAgICAgICAgaWYgKCBzdHJjbXAoYnVmLCBk
ZWJ1Z3RyYWNlX2xhc3RfZW50cnlfYnVmKSApCgpXb3VsZG4ndCBtb3ZpbmcgY291bnQgdG8gZmls
ZSBzY29wZSBhbmQgbGF0Y2hpbmcgaXRzIHZhbHVlIGludG8KYSBuZXcgZHVtcF9jb3VudCB3aGVu
IGR1bXBpbmcgd29yazoKCiAgICAgICAgaWYgKCBjb3VudCA9PSBkdW1wX2NvdW50IHx8IHN0cmNt
cChidWYsIGxhc3RfYnVmKSApCgp3b3JrPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
