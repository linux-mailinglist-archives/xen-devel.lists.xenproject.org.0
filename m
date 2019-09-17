Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7517B4748
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:19:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA6oE-0001PN-1J; Tue, 17 Sep 2019 06:17:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA6oC-0001P9-Ir
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 06:17:52 +0000
X-Inumbo-ID: e0c2f166-d912-11e9-9601-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0c2f166-d912-11e9-9601-12813bfff9fa;
 Tue, 17 Sep 2019 06:17:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3E29BAC93;
 Tue, 17 Sep 2019 06:17:51 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Message-ID: <b137af62-271a-d7ca-23a4-ff6d750ab0f9@suse.com>
Date: Tue, 17 Sep 2019 08:17:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 9/9] x86: PCID is unused when !PV
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBhbGxvd3MgaW4gcGFydGljdWxhciBzb21lIHN0cmVhbWxpbmluZyBvZiB0aGUgVExCIGZs
dXNoaW5nIGNvZGUKcGF0aHMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Ci0tLQp2MjogQXZvaWQgI2lmZGVmIGluIGNyM19wY2lkKCkuCgotLS0gYS94ZW4v
YXJjaC94ODYvZmx1c2h0bGIuYworKysgYi94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwpAQCAtMjQs
NiArMjQsMTEgQEAKICNkZWZpbmUgV1JBUF9NQVNLICgweDAwMDAwM0ZGVSkKICNlbmRpZgogCisj
aWZuZGVmIENPTkZJR19QVgorIyB1bmRlZiBYODZfQ1I0X1BDSURFCisjIGRlZmluZSBYODZfQ1I0
X1BDSURFIDAKKyNlbmRpZgorCiB1MzIgdGxiZmx1c2hfY2xvY2sgPSAxVTsKIERFRklORV9QRVJf
Q1BVKHUzMiwgdGxiZmx1c2hfdGltZSk7CiAKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9j
ZXNzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCkBAIC0yODksNyAr
Mjg5LDcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGNyM19wYSh1bnNpZwogCiBzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGludCBjcjNfcGNpZCh1bnNpZ25lZCBsb25nIGNyMykKIHsKLSAg
ICByZXR1cm4gY3IzICYgWDg2X0NSM19QQ0lEX01BU0s7CisgICAgcmV0dXJuIElTX0VOQUJMRUQo
Q09ORklHX1BWKSA/IGNyMyAmIFg4Nl9DUjNfUENJRF9NQVNLIDogMDsKIH0KIAogc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIHJlYWRfY3I0KHZvaWQpCkBAIC0zMDEsOCArMzAxLDEyIEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCB3cml0ZV9jcjQodW5zaWduZWQgbG8KIHsKICAgICBzdHJ1Y3QgY3B1
X2luZm8gKmluZm8gPSBnZXRfY3B1X2luZm8oKTsKIAorI2lmZGVmIENPTkZJR19QVgogICAgIC8q
IE5vIGdsb2JhbCBwYWdlcyBpbiBjYXNlIG9mIFBDSURzIGVuYWJsZWQhICovCiAgICAgQVNTRVJU
KCEodmFsICYgWDg2X0NSNF9QR0UpIHx8ICEodmFsICYgWDg2X0NSNF9QQ0lERSkpOworI2Vsc2UK
KyAgICBBU1NFUlQoISh2YWwgJiBYODZfQ1I0X1BDSURFKSk7CisjZW5kaWYKIAogICAgIC8qCiAg
ICAgICogT24gaGFyZHdhcmUgc3VwcG9ydGluZyBGU0dTQkFTRSwgdGhlIHZhbHVlIGluICVjcjQg
aXMgdGhlIGtlcm5lbCdzCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcHYvZG9tYWluLmgKKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wdi9kb21haW4uaApAQCAtNTAsOCArNTAsMTMgQEAKICAq
Lwogc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGdldF9wY2lkX2JpdHMoY29uc3Qgc3RydWN0
IHZjcHUgKnYsIGJvb2wgaXNfeHB0aSkKIHsKKyNpZmRlZiBDT05GSUdfUFYKICAgICByZXR1cm4g
WDg2X0NSM19OT0ZMVVNIIHwgKGlzX3hwdGkgPyBQQ0lEX1BWX1hQVEkgOiAwKSB8CiAgICAgICAg
ICAgICgodi0+YXJjaC5mbGFncyAmIFRGX2tlcm5lbF9tb2RlKSA/IFBDSURfUFZfUFJJViA6IFBD
SURfUFZfVVNFUik7CisjZWxzZQorICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOworICAgIHJldHVy
biAwOworI2VuZGlmCiB9CiAKICNpZmRlZiBDT05GSUdfUFYKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
