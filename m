Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2890DAA31C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:27:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qmi-0007RH-1U; Thu, 05 Sep 2019 12:22:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5qmg-0007QL-CL
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:22:42 +0000
X-Inumbo-ID: d68f19e8-cfd7-11e9-abc8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d68f19e8-cfd7-11e9-abc8-12813bfff9fa;
 Thu, 05 Sep 2019 12:22:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 55164AFE2;
 Thu,  5 Sep 2019 12:22:33 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
 <efd9f3e4-d2d3-8bf7-ba9a-6337f598191a@suse.com>
 <129b35af-da91-5811-ec3c-b37caeb1451e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8565aa67-9ef2-49cb-3a9b-06c14eda7d82@suse.com>
Date: Thu, 5 Sep 2019 14:22:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <129b35af-da91-5811-ec3c-b37caeb1451e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/4] xen: refactor debugtrace data
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

T24gMDUuMDkuMjAxOSAxNDoxMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNS4wOS4xOSAx
NDowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA1LjA5LjIwMTkgMTM6MzksIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBBcyBhIHByZXBhcmF0aW9uIGZvciBwZXItY3B1IGJ1ZmZlcnMgZG8g
YSBsaXR0bGUgcmVmYWN0b3Jpbmcgb2YgdGhlCj4+PiBkZWJ1Z3RyYWNlIGRhdGE6IHB1dCB0aGUg
bmVlZGVkIGJ1ZmZlciBhZG1pbiBkYXRhIGludG8gdGhlIGJ1ZmZlciBhcwo+Pj4gaXQgd2lsbCBi
ZSBuZWVkZWQgZm9yIGVhY2ggYnVmZmVyLiBJbiBvcmRlciBub3QgdG8gbGltaXQgYnVmZmVyIHNp
emUKPj4+IHN3aXRjaCB0aGUgcmVsYXRlZCBmaWVsZHMgZnJvbSB1bnNpZ25lZCBpbnQgdG8gdW5z
aWduZWQgbG9uZywgYXMgb24KPj4+IGh1Z2UgbWFjaGluZXMgd2l0aCBSQU0gaW4gdGhlIFRCIHJh
bmdlIGl0IG1pZ2h0IGJlIGludGVyZXN0aW5nIHRvCj4+PiBzdXBwb3J0IGJ1ZmZlcnMgPjRHQi4K
Pj4KPj4gSnVzdCBhcyBhIGZ1cnRoZXIgcmVtYXJrIGluIHRoaXMgcmVnYXJkOgo+Pgo+Pj4gICB2
b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+Pj4gICB7Cj4+PiAg
ICAgICBzdGF0aWMgY2hhciBidWZbREVCVUdfVFJBQ0VfRU5UUllfU0laRV07Cj4+PiAtICAgIHN0
YXRpYyB1bnNpZ25lZCBpbnQgY291bnQsIGxhc3RfY291bnQsIGxhc3RfcHJkOwo+Pj4gKyAgICBz
dGF0aWMgdW5zaWduZWQgaW50IGNvdW50LCBsYXN0X2NvdW50Owo+Pgo+PiBIb3cgbG9uZyBkbyB3
ZSB0aGluayB3aWxsIGl0IHRha2UgdW50aWwgdGhlaXIgd3JhcHBpbmcgd2lsbCBiZWNvbWUKPj4g
YW4gaXNzdWUgd2l0aCBzdWNoIGh1Z2UgYnVmZmVycz8KPiAKPiBDb3VudCB3cmFwcGluZyB3aWxs
IG5vdCByZXN1bHQgaW4gYW55IG1pc2JlaGF2aW9yIG9mIHRyYWNpbmcuIFdpdGgKPiBwZXItY3B1
IGJ1ZmZlcnMgaXQgbWlnaHQgcmVzdWx0IGluIGFtYmlndWl0eSByZWdhcmRpbmcgc29ydGluZyB0
aGUKPiBlbnRyaWVzLCBidXQgSSBndWVzcyBjaGFuY2VzIGFyZSByYXRoZXIgbG93IHRoaXMgYmVp
bmcgYSByZWFsIGlzc3VlLgo+IAo+IEJUVzogd3JhcHBpbmcgb2YgY291bnQgaXMgbm90IHJlbGF0
ZWQgdG8gYnVmZmVyIHNpemUsIGJ1dCB0byB0aGUKPiBhbW91bnQgb2YgdHJhY2UgZGF0YSB3cml0
dGVuLgoKU3VyZSwgYnV0IHRoZSBjaGFuY2Ugb2YgYW1iaWd1aXR5IGluY3JlYXNlcyB3aXRoIGxh
cmdlciBidWZmZXIgc2l6ZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
