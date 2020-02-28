Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D611736EE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:13:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7eTj-0007VW-FY; Fri, 28 Feb 2020 12:10:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7eTi-0007VP-K9
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:10:50 +0000
X-Inumbo-ID: 5b945006-5a23-11ea-9c17-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b945006-5a23-11ea-9c17-bc764e2007e4;
 Fri, 28 Feb 2020 12:10:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1D07BB402;
 Fri, 28 Feb 2020 12:10:49 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
Message-ID: <116e417c-f8bb-5eab-2356-7fa3532e219f@suse.com>
Date: Fri, 28 Feb 2020 13:10:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 1/2] AMD/IOMMU: correct handling when XT's
 prereq features are unavailable
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2Ugc2hvdWxkIG5laXRoZXIgY2F1c2UgSU9NTVUgaW5pdGlhbGl6YXRpb24gYXMgYSB3aG9sZSB0
byBmYWlsIGluIHRoaXMKY2FzZSAod2Ugc2hvdWxkIHN0aWxsIGJlIGFibGUgdG8gYnJpbmcgdXAg
dGhlIHN5c3RlbSBpbiBub24teDJBUElDIG9yCngyQVBJQyBwaHlzaWNhbCBtb2RlKSwgbm9yIHNo
b3VsZCB0aGUgcmVtYWluZGVyIG9mIHRoZSBmdW5jdGlvbiBiZQpza2lwcGVkIChhcyB0aGUgbWFp
biBwYXJ0IG9mIGl0IHdvbid0IGdldCBlbnRlcmVkIGEgMm5kIHRpbWUpIGluIHN1Y2ggYW4KZXZl
bnQuIEl0IGlzIG1lcmVseSBuZWNlc3NhcnkgZm9yIHRoZSBmdW5jdGlvbiB0byBpbmRpY2F0ZSB0
byB0aGUgY2FsbGVyCihpb3Zfc3VwcG9ydHNfeHQoKSkgdGhhdCBzZXR1cCBmYWlsZWQgYXMgZmFy
IGFzIHgyQVBJQyBpcyBjb25jZXJuZWQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Ci0tLQp2MjogQWxzbyBhZGp1c3QgdGhlIGxvb3AgY29uc3VtaW5nICJ4
dCIuIG5vX3h0IC0+IGhhc194dC4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9p
b21tdV9pbml0LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQu
YwpAQCAtMTM2NCw2ICsxMzY0LDcgQEAgc3RhdGljIGludCBfX2luaXQgYW1kX2lvbW11X3ByZXBh
cmVfb25lKAogaW50IF9faW5pdCBhbWRfaW9tbXVfcHJlcGFyZShib29sIHh0KQogewogICAgIHN0
cnVjdCBhbWRfaW9tbXUgKmlvbW11OworICAgIGJvb2wgaGFzX3h0ID0gdHJ1ZTsKICAgICBpbnQg
cmMgPSAtRU5PREVWOwogCiAgICAgQlVHX09OKCAhaW9tbXVfZm91bmQoKSApOwpAQCAtMTQwMCwx
NyArMTQwMSwxNiBAQCBpbnQgX19pbml0IGFtZF9pb21tdV9wcmVwYXJlKGJvb2wgeHQpCiAgICAg
ICAgIGlmICggcmMgKQogICAgICAgICAgICAgZ290byBlcnJvcl9vdXQ7CiAKLSAgICAgICAgcmMg
PSAtRU5PREVWOwotICAgICAgICBpZiAoIHh0ICYmICghaW9tbXUtPmZlYXR1cmVzLmZsZHMuZ2Ff
c3VwIHx8ICFpb21tdS0+ZmVhdHVyZXMuZmxkcy54dF9zdXApICkKLSAgICAgICAgICAgIGdvdG8g
ZXJyb3Jfb3V0OworICAgICAgICBpZiAoICFpb21tdS0+ZmVhdHVyZXMuZmxkcy5nYV9zdXAgfHwg
IWlvbW11LT5mZWF0dXJlcy5mbGRzLnh0X3N1cCApCisgICAgICAgICAgICBoYXNfeHQgPSBmYWxz
ZTsKICAgICB9CiAKICAgICBmb3JfZWFjaF9hbWRfaW9tbXUgKCBpb21tdSApCiAgICAgewogICAg
ICAgICAvKiBOQjogVGhlcmUncyBubyBuZWVkIHRvIGFjdHVhbGx5IHdyaXRlIHRoZXNlIG91dCBy
aWdodCBoZXJlLiAqLwotICAgICAgICBpb21tdS0+Y3RybC5nYV9lbiB8PSB4dDsKLSAgICAgICAg
aW9tbXUtPmN0cmwueHRfZW4gPSB4dDsKLSAgICAgICAgaW9tbXUtPmN0cmwuaW50X2NhcF94dF9l
biA9IHh0OworICAgICAgICBpb21tdS0+Y3RybC5nYV9lbiB8PSB4dCAmJiBoYXNfeHQ7CisgICAg
ICAgIGlvbW11LT5jdHJsLnh0X2VuID0geHQgJiYgaGFzX3h0OworICAgICAgICBpb21tdS0+Y3Ry
bC5pbnRfY2FwX3h0X2VuID0geHQgJiYgaGFzX3h0OwogICAgIH0KIAogICAgIHJjID0gYW1kX2lv
bW11X3VwZGF0ZV9pdnJzX21hcHBpbmdfYWNwaSgpOwpAQCAtMTQyMiw3ICsxNDIyLDcgQEAgaW50
IF9faW5pdCBhbWRfaW9tbXVfcHJlcGFyZShib29sIHh0KQogICAgICAgICBpdmhkX3R5cGUgPSAw
OwogICAgIH0KIAotICAgIHJldHVybiByYzsKKyAgICByZXR1cm4gcmMgPzogeHQgJiYgIWhhc194
dCA/IC1FTk9ERVYgOiAwOwogfQogCiBpbnQgX19pbml0IGFtZF9pb21tdV9pbml0KGJvb2wgeHQp
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
