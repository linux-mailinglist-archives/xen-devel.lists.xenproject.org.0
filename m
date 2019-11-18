Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAD3100812
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 16:23:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWiq5-0003oG-KM; Mon, 18 Nov 2019 15:21:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWiq4-0003oB-7P
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 15:21:16 +0000
X-Inumbo-ID: 0f1ea7be-0a17-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f1ea7be-0a17-11ea-b678-bc764e2007e4;
 Mon, 18 Nov 2019 15:21:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0F37AE55;
 Mon, 18 Nov 2019 15:21:13 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andy Lutomirski <luto@kernel.org>
Message-ID: <0fad341f-b7f5-f859-d55d-f0084ee7087e@suse.com>
Date: Mon, 18 Nov 2019 16:21:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3] x86/stackframe/32: repair 32-bit Xen PV
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
bnRpbmcgYm9vdC4gQWRqdXN0IEJVR19JRl9XUk9OR19DUjMKYXMgd2VsbCB0byBndWFyZCBhZ2Fp
bnN0IGZ1dHVyZSB1c2VzIG9mIHRoZSBtYWNybyBvbiBhIGNvZGUgcGF0aApyZWFjaGFibGUgd2hl
biBydW5uaW5nIGluIFBWIG1vZGUgdW5kZXIgWGVuOyBJIGhhdmUgdG8gYWRtaXQgdGhhdCBJCnN0
b3BwZWQgYXQgYSBjZXJ0YWluIHBvaW50IHRyeWluZyB0byBmaWd1cmUgb3V0IHdoZXRoZXIgdGhl
cmUgYXJlCnByZXNlbnQgb25lcy4KCkZpeGVzOiAzYzg4YzY5MmMyODcgKCJ4ODYvc3RhY2tmcmFt
ZS8zMjogUHJvdmlkZSBjb25zaXN0ZW50IHB0X3JlZ3MiKQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MzogTW92ZSBVU0VSX1NFR01FTlRfUlBMX01B
U0sgZGVmaW5pdGlvbiB0byBzZWdtZW50LmguIEZ1cnRoZXIgZXhwbGFpbgogICAgdGhlIEJVR19J
Rl9XUk9OR19DUjMgYWRqdXN0bWVudC4KdjI6IEF2b2lkICNpZmRlZiBhbmQgYWx0ZXIgY29tbWVu
dCBhbG9uZyB0aGUgbGluZXMgb2YgQW5keSdzIHN1Z2dlc3Rpb24uCgotLS0gYS9hcmNoL3g4Ni9l
bnRyeS9lbnRyeV8zMi5TCisrKyBiL2FyY2gveDg2L2VudHJ5L2VudHJ5XzMyLlMKQEAgLTE3Miw3
ICsxNzIsNyBAQAogCUFMVEVSTkFUSVZFICJqbXAgLkxlbmRfXEAiLCAiIiwgWDg2X0ZFQVRVUkVf
UFRJCiAJLmlmIFxub191c2VyX2NoZWNrID09IDAKIAkvKiBjb21pbmcgZnJvbSB1c2VybW9kZT8g
Ki8KLQl0ZXN0bAkkU0VHTUVOVF9SUExfTUFTSywgUFRfQ1MoJWVzcCkKKwl0ZXN0bAkkVVNFUl9T
RUdNRU5UX1JQTF9NQVNLLCBQVF9DUyglZXNwKQogCWp6CS5MZW5kX1xACiAJLmVuZGlmCiAJLyog
T24gdXNlci1jcjM/ICovCkBAIC0yMTcsNyArMjE3LDcgQEAKIAl0ZXN0bAkkWDg2X0VGTEFHU19W
TSwgNCo0KCVlc3ApCiAJam56CS5MZnJvbV91c2VybW9kZV9ub19maXh1cF9cQAogI2VuZGlmCi0J
dGVzdGwJJFNFR01FTlRfUlBMX01BU0ssIDMqNCglZXNwKQorCXRlc3RsCSRVU0VSX1NFR01FTlRf
UlBMX01BU0ssIDMqNCglZXNwKQogCWpuegkuTGZyb21fdXNlcm1vZGVfbm9fZml4dXBfXEAKIAog
CW9ybAkkQ1NfRlJPTV9LRVJORUwsIDMqNCglZXNwKQotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9zZWdtZW50LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vc2VnbWVudC5oCkBAIC0zMSw2
ICszMSwxOCBAQAogICovCiAjZGVmaW5lIFNFR01FTlRfUlBMX01BU0sJMHgzCiAKKy8qCisgKiBX
aGVuIHJ1bm5pbmcgb24gWGVuIFBWLCB0aGUgYWN0dWFsIHByaXZpbGVnZSBsZXZlbCBvZiB0aGUg
a2VybmVsIGlzIDEsCisgKiBub3QgMC4gVGVzdGluZyB0aGUgUmVxdWVzdGVkIFByaXZpbGVnZSBM
ZXZlbCBpbiBhIHNlZ21lbnQgc2VsZWN0b3IgdG8KKyAqIGRldGVybWluZSB3aGV0aGVyIHRoZSBj
b250ZXh0IGlzIHVzZXIgbW9kZSBvciBrZXJuZWwgbW9kZSB3aXRoCisgKiBTRUdNRU5UX1JQTF9N
QVNLIGlzIHdyb25nIGJlY2F1c2UgdGhlIFBWIGtlcm5lbCdzIHByaXZpbGVnZSBsZXZlbAorICog
bWF0Y2hlcyB0aGUgMHgzIG1hc2suCisgKgorICogVGVzdGluZyB3aXRoIFVTRVJfU0VHTUVOVF9S
UExfTUFTSyBpcyB2YWxpZCBmb3IgYm90aCBuYXRpdmUgYW5kIFhlbiBQVgorICoga2VybmVscyBi
ZWNhdXNlIHByaXZpbGVnZSBsZXZlbCAyIGlzIG5ldmVyIHVzZWQuCisgKi8KKyNkZWZpbmUgVVNF
Ul9TRUdNRU5UX1JQTF9NQVNLCTB4MgorCiAvKiBVc2VyIG1vZGUgaXMgcHJpdmlsZWdlIGxldmVs
IDM6ICovCiAjZGVmaW5lIFVTRVJfUlBMCQkweDMKIAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
