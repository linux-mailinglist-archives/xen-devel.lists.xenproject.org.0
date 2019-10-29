Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF6E8480
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 10:32:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPNnQ-0007f2-Ir; Tue, 29 Oct 2019 09:28:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1x1s=YW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPNnO-0007ex-KF
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 09:28:10 +0000
X-Inumbo-ID: 6aca485a-fa2e-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aca485a-fa2e-11e9-beca-bc764e2007e4;
 Tue, 29 Oct 2019 09:28:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 657C0AD0B;
 Tue, 29 Oct 2019 09:28:07 +0000 (UTC)
To: Andy Lutomirski <luto@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4250bba0-1719-60ae-3d1f-350fb5d2021d@suse.com>
Date: Tue, 29 Oct 2019 10:28:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2] x86/stackframe/32: repair 32-bit Xen PV
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25jZSBhZ2FpbiBSUEwgY2hlY2tzIGhhdmUgYmVlbiBpbnRyb2R1Y2VkIHdoaWNoIGRvbid0IGFj
Y291bnQgZm9yIGEKMzItYml0IGtlcm5lbCBsaXZpbmcgaW4gcmluZyAxIHdoZW4gcnVubmluZyBp
biBhIFBWIFhlbiBkb21haW4uIFRoZQpjYXNlIGluIEZJWFVQX0ZSQU1FIGhhcyBiZWVuIHByZXZl
bnRpbmcgYm9vdDsgYWRqdXN0IEJVR19JRl9XUk9OR19DUjMKYXMgd2VsbCBqdXN0IGluIGNhc2Uu
CgpGaXhlczogM2M4OGM2OTJjMjg3ICgieDg2L3N0YWNrZnJhbWUvMzI6IFByb3ZpZGUgY29uc2lz
dGVudCBwdF9yZWdzIikKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgotLS0KdjI6IEF2b2lkICNpZmRlZiBhbmQgYWx0ZXIgY29tbWVudCBhbG9uZyB0aGUgbGlu
ZXMgb2YgQW5keSdzIHN1Z2dlc3Rpb24uCgotLS0gYS9hcmNoL3g4Ni9lbnRyeS9lbnRyeV8zMi5T
CisrKyBiL2FyY2gveDg2L2VudHJ5L2VudHJ5XzMyLlMKQEAgLTQ4LDYgKzQ4LDEzIEBACiAKICNp
bmNsdWRlICJjYWxsaW5nLmgiCiAKKy8qCisgKiBXaGVuIHJ1bm5pbmcgb24gWGVuIFBWLCB0aGUg
YWN0dWFsICVjcyByZWdpc3RlcidzIFJQTCBpbiB0aGUga2VybmVsIGlzIDEsCisgKiBub3QgMC4g
SWYgd2UgbmVlZCB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIGEgJWNzIGZyb20ga2VybmVsIG1vZGUg
YW5kIGEgJWNzCisgKiBmcm9tIHVzZXIgbW9kZSwgd2UgY2FuIGRvIHRlc3QgJDIgaW5zdGVhZCBv
ZiB0ZXN0ICQzLgorICovCisjZGVmaW5lIFVTRVJfU0VHTUVOVF9SUExfTUFTSyAyCisKIAkuc2Vj
dGlvbiAuZW50cnkudGV4dCwgImF4IgogCiAvKgpAQCAtMTcyLDcgKzE3OSw3IEBACiAJQUxURVJO
QVRJVkUgImptcCAuTGVuZF9cQCIsICIiLCBYODZfRkVBVFVSRV9QVEkKIAkuaWYgXG5vX3VzZXJf
Y2hlY2sgPT0gMAogCS8qIGNvbWluZyBmcm9tIHVzZXJtb2RlPyAqLwotCXRlc3RsCSRTRUdNRU5U
X1JQTF9NQVNLLCBQVF9DUyglZXNwKQorCXRlc3RsCSRVU0VSX1NFR01FTlRfUlBMX01BU0ssIFBU
X0NTKCVlc3ApCiAJanoJLkxlbmRfXEAKIAkuZW5kaWYKIAkvKiBPbiB1c2VyLWNyMz8gKi8KQEAg
LTIxNyw3ICsyMjQsNyBAQAogCXRlc3RsCSRYODZfRUZMQUdTX1ZNLCA0KjQoJWVzcCkKIAlqbnoJ
Lkxmcm9tX3VzZXJtb2RlX25vX2ZpeHVwX1xACiAjZW5kaWYKLQl0ZXN0bAkkU0VHTUVOVF9SUExf
TUFTSywgMyo0KCVlc3ApCisJdGVzdGwJJFVTRVJfU0VHTUVOVF9SUExfTUFTSywgMyo0KCVlc3Ap
CiAJam56CS5MZnJvbV91c2VybW9kZV9ub19maXh1cF9cQAogCiAJb3JsCSRDU19GUk9NX0tFUk5F
TCwgMyo0KCVlc3ApCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
