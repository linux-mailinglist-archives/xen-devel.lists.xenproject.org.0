Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E77EAA2CC
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:15:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qcR-00062u-SM; Thu, 05 Sep 2019 12:12:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5qcQ-00062p-VL
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:12:06 +0000
X-Inumbo-ID: 60184b82-cfd6-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60184b82-cfd6-11e9-a337-bc764e2007e4;
 Thu, 05 Sep 2019 12:12:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DFB5CAEAF;
 Thu,  5 Sep 2019 12:12:04 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
 <efd9f3e4-d2d3-8bf7-ba9a-6337f598191a@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <129b35af-da91-5811-ec3c-b37caeb1451e@suse.com>
Date: Thu, 5 Sep 2019 14:12:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <efd9f3e4-d2d3-8bf7-ba9a-6337f598191a@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMTkgMTQ6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA1LjA5LjIwMTkgMTM6
MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFzIGEgcHJlcGFyYXRpb24gZm9yIHBlci1jcHUg
YnVmZmVycyBkbyBhIGxpdHRsZSByZWZhY3RvcmluZyBvZiB0aGUKPj4gZGVidWd0cmFjZSBkYXRh
OiBwdXQgdGhlIG5lZWRlZCBidWZmZXIgYWRtaW4gZGF0YSBpbnRvIHRoZSBidWZmZXIgYXMKPj4g
aXQgd2lsbCBiZSBuZWVkZWQgZm9yIGVhY2ggYnVmZmVyLiBJbiBvcmRlciBub3QgdG8gbGltaXQg
YnVmZmVyIHNpemUKPj4gc3dpdGNoIHRoZSByZWxhdGVkIGZpZWxkcyBmcm9tIHVuc2lnbmVkIGlu
dCB0byB1bnNpZ25lZCBsb25nLCBhcyBvbgo+PiBodWdlIG1hY2hpbmVzIHdpdGggUkFNIGluIHRo
ZSBUQiByYW5nZSBpdCBtaWdodCBiZSBpbnRlcmVzdGluZyB0bwo+PiBzdXBwb3J0IGJ1ZmZlcnMg
PjRHQi4KPiAKPiBKdXN0IGFzIGEgZnVydGhlciByZW1hcmsgaW4gdGhpcyByZWdhcmQ6Cj4gCj4+
ICAgdm9pZCBkZWJ1Z3RyYWNlX3ByaW50ayhjb25zdCBjaGFyICpmbXQsIC4uLikKPj4gICB7Cj4+
ICAgICAgIHN0YXRpYyBjaGFyIGJ1ZltERUJVR19UUkFDRV9FTlRSWV9TSVpFXTsKPj4gLSAgICBz
dGF0aWMgdW5zaWduZWQgaW50IGNvdW50LCBsYXN0X2NvdW50LCBsYXN0X3ByZDsKPj4gKyAgICBz
dGF0aWMgdW5zaWduZWQgaW50IGNvdW50LCBsYXN0X2NvdW50Owo+IAo+IEhvdyBsb25nIGRvIHdl
IHRoaW5rIHdpbGwgaXQgdGFrZSB1bnRpbCB0aGVpciB3cmFwcGluZyB3aWxsIGJlY29tZQo+IGFu
IGlzc3VlIHdpdGggc3VjaCBodWdlIGJ1ZmZlcnM/CgpDb3VudCB3cmFwcGluZyB3aWxsIG5vdCBy
ZXN1bHQgaW4gYW55IG1pc2JlaGF2aW9yIG9mIHRyYWNpbmcuIFdpdGgKcGVyLWNwdSBidWZmZXJz
IGl0IG1pZ2h0IHJlc3VsdCBpbiBhbWJpZ3VpdHkgcmVnYXJkaW5nIHNvcnRpbmcgdGhlCmVudHJp
ZXMsIGJ1dCBJIGd1ZXNzIGNoYW5jZXMgYXJlIHJhdGhlciBsb3cgdGhpcyBiZWluZyBhIHJlYWwg
aXNzdWUuCgpCVFc6IHdyYXBwaW5nIG9mIGNvdW50IGlzIG5vdCByZWxhdGVkIHRvIGJ1ZmZlciBz
aXplLCBidXQgdG8gdGhlCmFtb3VudCBvZiB0cmFjZSBkYXRhIHdyaXR0ZW4uCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
