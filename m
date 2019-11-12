Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A65F928E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 15:30:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUX9h-0000IA-9D; Tue, 12 Nov 2019 14:28:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CoZ6=ZE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUX9g-0000I5-Gx
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 14:28:28 +0000
X-Inumbo-ID: b1137964-0558-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1137964-0558-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 14:28:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0F4DAB92;
 Tue, 12 Nov 2019 14:28:26 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20191002112004.25793-1-jgross@suse.com>
 <20191002112004.25793-7-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <121e1f5f-cbfc-d3ce-d8ae-f5a6ac1a876f@suse.com>
Date: Tue, 12 Nov 2019 15:28:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191002112004.25793-7-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 6/6] xen: add runtime parameter reading
 support to hypfs
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxMzoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgc3VwcG9ydCB0
byByZWFkIHZhbHVlcyBvZiBoeXBlcnZpc29yIHJ1bnRpbWUgcGFyYW1ldGVycyB2aWEgdGhlCj4g
aHlwZXJ2aXNvciBmaWxlIHN5c3RlbSBmb3IgYWxsIHVuc2lnbmVkIGludGVnZXIgdHlwZSBydW50
aW1lIHBhcmFtZXRlcnMuCgpXaGF0IGFib3V0IHN0cmluZyBvbmVzICh3aGljaCB5b3Ugc2VlbSB0
byBoYW5kbGUgaW4gdGhlIGNvZGUsCmJ1dCBzZWUgYWxzbyB0aGVyZSk/Cgo+IEBAIC0zMjAsNiAr
MzIxLDQ0IEBAIGludCBjbWRsaW5lX3N0cmNtcChjb25zdCBjaGFyICpmcmFnLCBjb25zdCBjaGFy
ICpuYW1lKQo+ICAgICAgfQo+ICB9Cj4gIAo+ICtzdGF0aWMgc3RydWN0IGh5cGZzX2RpciBoeXBm
c19wYXJhbXMgPSB7Cj4gKyAgICAubGlzdCA9IExJU1RfSEVBRF9JTklUKGh5cGZzX3BhcmFtcy5s
aXN0KSwKPiArfTsKPiArCj4gK3N0YXRpYyBpbnQgX19pbml0IHJ1bnRpbWVfcGFyYW1faHlwZnNf
YWRkKHZvaWQpCj4gK3sKPiArICAgIGNvbnN0IHN0cnVjdCBrZXJuZWxfcGFyYW0gKnBhcmFtOwo+
ICsgICAgaW50IHJldDsKPiArCj4gKyAgICByZXQgPSBoeXBmc19uZXdfZGlyKCZoeXBmc19yb290
LCAicGFyYW1zIiwgJmh5cGZzX3BhcmFtcyk7Cj4gKyAgICBCVUdfT04ocmV0KTsKPiArCj4gKyAg
ICBmb3IgKCBwYXJhbSA9IF9fcGFyYW1fc3RhcnQ7IHBhcmFtIDwgX19wYXJhbV9lbmQ7IHBhcmFt
KysgKQo+ICsgICAgewo+ICsgICAgICAgIHN3aXRjaCAoIHBhcmFtLT50eXBlICkKPiArICAgICAg
ICB7Cj4gKyAgICAgICAgY2FzZSBPUFRfVUlOVDoKPiArICAgICAgICAgICAgaWYgKCBwYXJhbS0+
bGVuID09IHNpemVvZih1bnNpZ25lZCBpbnQpICkKPiArICAgICAgICAgICAgICAgIHJldCA9IGh5
cGZzX25ld19lbnRyeV91aW50KCZoeXBmc19wYXJhbXMsIHBhcmFtLT5uYW1lLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGludCAqKShwYXJh
bS0+cGFyLnZhcikpOwoKU3RyYXkgcGFpciBvciBwYXJlbnRoZXNlcy4gSSBhbHNvIGRvbid0IHNl
ZSB0aGUgbmVlZCBmb3IgdGhlIGNhc3QsCndpdGggdGhlICJ2YXIiIHVuaW9uIG1lbWJlciBiZWlu
ZyAidm9pZCAqIi4KCj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsKPiArICAgICAgICBjYXNlIE9Q
VF9TVFI6Cj4gKyAgICAgICAgICAgIHJldCA9IGh5cGZzX25ld19lbnRyeV91aW50KCZoeXBmc19w
YXJhbXMsIHBhcmFtLT5uYW1lLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYXJhbS0+cGFyLnZhcik7CgpoeXBmc19uZXdfZW50cnlfc3RyaW5nKCk/CgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
