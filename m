Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF0168408
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 17:49:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5BRw-0002Sf-Cy; Fri, 21 Feb 2020 16:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5BRu-0002SZ-Py
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 16:46:46 +0000
X-Inumbo-ID: becd5a50-54c9-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id becd5a50-54c9-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 16:46:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5AB2DACAE;
 Fri, 21 Feb 2020 16:46:44 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-5-dwmw2@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26266276-04cf-14dc-52f1-f3a5df525cc4@suse.com>
Date: Fri, 21 Feb 2020 17:46:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200201003303.2363081-5-dwmw2@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/8] xen/vmap: allow vmap() to be called
 during early boot
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDIuMjAyMCAwMTozMywgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IEZyb206IERhdmlk
IFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQg
V29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCkEgd29yZCBvbiB0aGUgIndoeSIgd291bGQg
YmUgbmljZSwganVzdCBsaWtlIFdlaSBoYXMgaW4gdGhlIHByZXZpb3VzCnBhdGNoLiBCZXNpZGVz
IHRoYXQganVzdCB0d28gY29zbWV0aWMgcmVxdWVzdHM6Cgo+IC0tLSBhL3hlbi9jb21tb24vdm1h
cC5jCj4gKysrIGIveGVuL2NvbW1vbi92bWFwLmMKPiBAQCAtNjgsNyArNjgsNyBAQCBzdGF0aWMg
dm9pZCAqdm1fYWxsb2ModW5zaWduZWQgaW50IG5yLCB1bnNpZ25lZCBpbnQgYWxpZ24sCj4gICAg
ICBzcGluX2xvY2soJnZtX2xvY2spOwo+ICAgICAgZm9yICggOyA7ICkKPiAgICAgIHsKPiAtICAg
ICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsKPiArICAgICAgICBtZm5fdCBtZm47Cj4gIAo+ICAg
ICAgICAgIEFTU0VSVCh2bV9sb3dbdF0gPT0gdm1fdG9wW3RdIHx8ICF0ZXN0X2JpdCh2bV9sb3db
dF0sIHZtX2JpdG1hcCh0KSkpOwo+ICAgICAgICAgIGZvciAoIHN0YXJ0ID0gdm1fbG93W3RdOyBz
dGFydCA8IHZtX3RvcFt0XTsgKQo+IEBAIC0xMDMsOSArMTAzLDE3IEBAIHN0YXRpYyB2b2lkICp2
bV9hbGxvYyh1bnNpZ25lZCBpbnQgbnIsIHVuc2lnbmVkIGludCBhbGlnbiwKPiAgICAgICAgICBp
ZiAoIHZtX3RvcFt0XSA+PSB2bV9lbmRbdF0gKQo+ICAgICAgICAgICAgICByZXR1cm4gTlVMTDsK
PiAgCj4gLSAgICAgICAgcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoTlVMTCwgMCk7Cj4gLSAgICAg
ICAgaWYgKCAhcGcgKQo+IC0gICAgICAgICAgICByZXR1cm4gTlVMTDsKPiArICAgICAgICBpZiAo
IHN5c3RlbV9zdGF0ZSA9PSBTWVNfU1RBVEVfZWFybHlfYm9vdCApCj4gKyAgICAgICAgewo+ICsg
ICAgICAgICAgICBtZm4gPSBhbGxvY19ib290X3BhZ2VzKDEsIDEpOwo+ICsgICAgICAgIH0KClBs
ZWFzZSBvbWl0IHRoZSBicmFjZXMgaW4gY2FzZXMgbGlrZSB0aGlzIG9uZS4KCj4gKyAgICAgICAg
ZWxzZQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGcgPSBh
bGxvY19kb21oZWFwX3BhZ2UoTlVMTCwgMCk7Cj4gKyAgICAgICAgICAgIGlmICggIXBnICkKClBs
ZWFzZSBoYXZlIGEgYmxhbmsgbGluZSBiZXR3ZWVuIGRlY2xhcmF0aW9uKHMpIGFuZCBzdGF0ZW1l
bnQocykuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
