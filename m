Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E17108F46
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 14:52:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZEkQ-0005a7-6u; Mon, 25 Nov 2019 13:49:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZEkO-0005a2-Cx
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 13:49:48 +0000
X-Inumbo-ID: 70a87a3c-0f8a-11ea-b08b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70a87a3c-0f8a-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 13:49:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4EA07B29C;
 Mon, 25 Nov 2019 13:49:45 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3af9457-d905-3e94-06e9-3d346a5a5275@suse.com>
Date: Mon, 25 Nov 2019 14:49:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/p2m-pt: fix (latent) page table mapping
 leak on do_recalc() error paths
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIHR3byBtYXBwaW5ncyBhY3RpdmUgaW4gdGhlIG1pZGRsZSBvZiBkb19yZWNhbGMo
KSwgYW5kIGhlbmNlCmNvbW1pdCAwZDBmNGQ3OGU1ZDEgKCJwMm06IGNoYW5nZSB3cml0ZV9wMm1f
ZW50cnkgdG8gcmV0dXJuIGFuIGVycm9yCmNvZGUiKSBzaG91bGQgaGF2ZSBhZGRlZCAob3Igb3Ro
ZXJ3aXNlIGludm9rZWQpIHVubWFwcGluZyBjb2RlIGp1c3QKbGlrZSBpdCBkaWQgaW4gcDJtX25l
eHRfbGV2ZWwoKSwgZGVzcGl0ZSB1cyBub3QgZXhwZWN0aW5nIGFueSBlcnJvcnMKaGVyZS4gQXJy
YW5nZSBmb3IgdGhlIGV4aXN0aW5nIHVubWFwIGludm9jYXRpb24gdG8gdGFrZSBlZmZlY3QgaW4g
YWxsCmNhc2VzLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0tcHQuYwpAQCAtMzkxLDIxICszOTEsMjIgQEAgc3RhdGljIGludCBkb19yZWNhbGMoc3RydWN0
IHAybV9kb21haW4gKgogICAgICAgICAgICAgICAgICAgICBpZiAoIGVyciApCiAgICAgICAgICAg
ICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgp
OwotICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgICAgICAgICAgICAg
ICAgICBicmVhazsKICAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgIH0KICAg
ICAgICAgICAgICAgICByZW1haW5kZXIgLT0gMVVMIDw8ICgobGV2ZWwgLSAxKSAqIFBBR0VUQUJM
RV9PUkRFUik7CiAgICAgICAgICAgICB9CiAgICAgICAgICAgICBzbXBfd21iKCk7Ci0gICAgICAg
ICAgICBjbGVhcl9yZWNhbGMobDEsIGUpOwotICAgICAgICAgICAgZXJyID0gcDJtLT53cml0ZV9w
Mm1fZW50cnkocDJtLCBnZm4sIHBlbnQsIGUsIGxldmVsICsgMSk7Ci0gICAgICAgICAgICBpZiAo
IGVyciApCisgICAgICAgICAgICBpZiAoICFlcnIgKQogICAgICAgICAgICAgewotICAgICAgICAg
ICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwotICAgICAgICAgICAgICAgIGdvdG8gb3V0Owor
ICAgICAgICAgICAgICAgIGNsZWFyX3JlY2FsYyhsMSwgZSk7CisgICAgICAgICAgICAgICAgZXJy
ID0gcDJtLT53cml0ZV9wMm1fZW50cnkocDJtLCBnZm4sIHBlbnQsIGUsIGxldmVsICsgMSk7Cisg
ICAgICAgICAgICAgICAgQVNTRVJUKCFlcnIpOwogICAgICAgICAgICAgfQogICAgICAgICB9CiAg
ICAgICAgIHVubWFwX2RvbWFpbl9wYWdlKCh2b2lkICopKCh1bnNpZ25lZCBsb25nKXBlbnQgJiBQ
QUdFX01BU0spKTsKKyAgICAgICAgaWYgKCB1bmxpa2VseShlcnIpICkKKyAgICAgICAgICAgIGdv
dG8gb3V0OwogICAgIH0KIAogICAgIHBlbnQgPSBwMm1fZmluZF9lbnRyeSh0YWJsZSwgJmdmbl9y
ZW1haW5kZXIsIGdmbiwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
