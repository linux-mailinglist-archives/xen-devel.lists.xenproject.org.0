Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD2C1280A1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 17:28:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiL6Y-0002Mp-7O; Fri, 20 Dec 2019 16:26:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiL6W-0002Mk-Jf
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 16:26:16 +0000
X-Inumbo-ID: 6ccebdee-2345-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ccebdee-2345-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 16:26:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4E150AB9B;
 Fri, 20 Dec 2019 16:26:06 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <5c88239b-de0f-5f81-72c4-7fdb07524278@suse.com>
Message-ID: <91d9f45c-e0e1-a01c-d812-2dd3345fff48@suse.com>
Date: Fri, 20 Dec 2019 17:26:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5c88239b-de0f-5f81-72c4-7fdb07524278@suse.com>
Content-Language: en-US
Subject: [Xen-devel] Ping: [PATCH v2] dom0-build: fix build with clang5
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAwODo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2l0aCBub24tZW1wdHkg
Q09ORklHX0RPTTBfTUVNIGNsYW5nNSBwcm9kdWNlcwo+IAo+IGRvbTBfYnVpbGQuYzozNDQ6MjQ6
IGVycm9yOiB1c2Ugb2YgbG9naWNhbCAnJiYnIHdpdGggY29uc3RhbnQgb3BlcmFuZCBbLVdlcnJv
ciwtV2NvbnN0YW50LWxvZ2ljYWwtb3BlcmFuZF0KPiAgICAgIGlmICggIWRvbTBfbWVtX3NldCAm
JiBDT05GSUdfRE9NMF9NRU1bMF0gKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIF4gIH5+fn5+
fn5+fn5+fn5+fn5+fgo+IGRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHVzZSAnJicgZm9yIGEg
Yml0d2lzZSBvcGVyYXRpb24KPiAgICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9N
MF9NRU1bMF0gKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIF5+Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgJgo+IGRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHJlbW92ZSBjb25zdGFudCB0
byBzaWxlbmNlIHRoaXMgd2FybmluZwo+ICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJ
R19ET00wX01FTVswXSApCj4gICAgICAgICAgICAgICAgICAgICAgICB+Xn5+fn5+fn5+fn5+fn5+
fn5+fn5+Cj4gMSBlcnJvciBnZW5lcmF0ZWQuCj4gCj4gT2J2aW91c2x5IG5laXRoZXIgb2YgdGhl
IHR3byBzdWdnZXN0aW9ucyBhcmUgYW4gb3B0aW9uIGhlcmUuIE9kZGx5Cj4gZW5vdWdoIHN3YXBw
aW5nIHRoZSBvcGVyYW5kcyBvZiB0aGUgJiYgaGVscHMsIHdoaWxlIGUuZy4gY2FzdGluZyBvcgo+
IHBhcmVudGhlc2l6aW5nIGRvZXNuJ3QuIEFub3RoZXIgd29ya2FibGUgdmFyaWFudCBsb29rcyB0
byBiZSB0aGUgdXNlIG9mCj4gISEgb24gdGhlIGNvbnN0YW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiB2MjogQWxzbyBhZGp1c3Qg
dGhlIEFybSBpbmNhcm5hdGlvbiBvZiB0aGUgc2FtZSBjb25zdHJ1Y3QuCj4gLS0tCj4gSSdtIG9w
ZW4gdG8gZ29pbmcgdGhlICEhIG9yIHlldCBzb21lIGRpZmZlcmVudCByb3V0ZSAoYnV0IG5vdCBy
ZWFsbHkgdGhlCj4gc3VnZ2VzdGVkIHN0cmxlbigpIG9uZSkuIE5vIG1hdHRlciB3aGljaCBvbmUg
d2UgY2hvb3NlLCBJJ20gYWZyYWlkIGl0IGlzCj4gZ29pbmcgdG8gcmVtYWluIGd1ZXNzd29yayB3
aGF0IG5ld2VyIChhbmQgZnV0dXJlKSB2ZXJzaW9ucyBvZiBjbGFuZyB3aWxsCj4gY2hva2Ugb24u
CgpJIGd1ZXNzIHRoZSBkaXNhZ3JlZW1lbnQgb24gaG93IHRvIGV4YWN0bHkgYWRkcmVzcyB0aGUg
aXNzdWUgaGFzCnN0YWxsZWQgdGhpcy4gQnV0IEkgdGhpbmsgd2Ugc2hvdWxkIHJhdGhlciBoYXZl
IF9zb21lXyAoZS5nLgp0aGlzKSBzb2x1dGlvbiBpbiB0aGUgcmVwbywgdGhhbiBjb250aW51ZSB0
byBzaGlwIHZlcnNpb25zIHdoaWNoCmRvbid0IGJ1aWxkLiBQZW9wbGUgd2FudGluZyB0byBiZWF1
dGlmeSB0aGUgY29kZSBmdXJ0aGVyIGNvdWxkCnRoZW4gc3VibWl0IGluY3JlbWVudGFsIHBhdGNo
ZXMuCgpKYW4KCj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gKysrIGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gQEAgLTIxMjUsNyArMjEyNSw3IEBAIGludCBfX2lu
aXQgY29uc3RydWN0X2RvbTAoc3RydWN0IGRvbWFpbgo+ICAgCj4gICAgICAgcHJpbnRrKCIqKiog
TE9BRElORyBET01BSU4gMCAqKipcbiIpOwo+ICAgCj4gLSAgICBpZiAoICFkb20wX21lbV9zZXQg
JiYgQ09ORklHX0RPTTBfTUVNWzBdICkKPiArICAgIGlmICggQ09ORklHX0RPTTBfTUVNWzBdICYm
ICFkb20wX21lbV9zZXQgKQo+ICAgICAgICAgICBwYXJzZV9kb20wX21lbShDT05GSUdfRE9NMF9N
RU0pOwo+ICAgCj4gICAgICAgaWYgKCBkb20wX21lbSA8PSAwICkKPiAtLS0gYS94ZW4vYXJjaC94
ODYvZG9tMF9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwo+IEBAIC0z
NDEsNyArMzQxLDcgQEAgdW5zaWduZWQgbG9uZyBfX2luaXQgZG9tMF9jb21wdXRlX25yX3BhZwo+
ICAgICAgIHVuc2lnbmVkIGxvbmcgYXZhaWwgPSAwLCBucl9wYWdlcywgbWluX3BhZ2VzLCBtYXhf
cGFnZXM7Cj4gICAgICAgYm9vbCBuZWVkX3BhZ2luZzsKPiAgIAo+IC0gICAgaWYgKCAhZG9tMF9t
ZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApCj4gKyAgICBpZiAoIENPTkZJR19ET00wX01F
TVswXSAmJiAhZG9tMF9tZW1fc2V0ICkKPiAgICAgICAgICAgcGFyc2VfZG9tMF9tZW0oQ09ORklH
X0RPTTBfTUVNKTsKPiAgIAo+ICAgICAgIGZvcl9lYWNoX25vZGVfbWFzayAoIG5vZGUsIGRvbTBf
bm9kZXMgKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
