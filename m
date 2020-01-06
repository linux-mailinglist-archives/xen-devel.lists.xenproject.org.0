Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478DF131630
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 17:38:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioVMi-00016i-Rh; Mon, 06 Jan 2020 16:36:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioVMh-00015n-Dw
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 16:36:27 +0000
X-Inumbo-ID: aa0e872e-30a2-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa0e872e-30a2-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 16:36:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C59EAD00;
 Mon,  6 Jan 2020 16:36:18 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
Message-ID: <6fe561a6-9fe0-49e7-f1f7-fe36f277052b@suse.com>
Date: Mon, 6 Jan 2020 17:37:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 5/8] x86/HVM: scale MPERF values reported to
 guests (on AMD)
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QU1EJ3MgUE0gc3BlY2lmaWVzIHRoYXQgTVBFUkYgKGFuZCBpdHMgci9vIGNvdW50ZXJwYXJ0KSBy
ZWFkcyBhcmUKYWZmZWN0ZWQgYnkgdGhlIFRTQyByYXRpby4gSGVuY2Ugd2hlbiBwcm9jZXNzaW5n
IHN1Y2ggcmVhZHMgaW4gc29mdHdhcmUKd2UgdG9vIHNob3VsZCBzY2FsZSB0aGUgdmFsdWVzLiBX
aGlsZSB3ZSBkb24ndCBjdXJyZW50bHkgKHlldCkgZXhwb3NlCnRoZSB1bmRlcmx5aW5nIGZlYXR1
cmUgZmxhZ3MsIGJlc2lkZXMgdXMgYWxsb3dpbmcgdGhlIE1TUnMgdG8gYmUgcmVhZApuZXZlcnRo
ZWxlc3MsIFJEUFJVIGlzIGdvaW5nIHRvIGV4cG9zZSB0aGUgdmFsdWVzIGV2ZW4gdG8gdXNlciBz
cGFjZS4KCkZ1cnRoZXJtb3JlLCBkdWUgdG8gdGhlIG5vdCBleHBvc2VkIGZlYXR1cmUgZmxhZ3Ms
IHRoaXMgY2hhbmdlIGhhcyB0aGUKZWZmZWN0IG9mIG1ha2luZyBwcm9wZXJseSBpbmFjY2Vzc2li
bGUgKGZvciByZWFkcykgdGhlIHR3byBNU1JzLgoKTm90ZSB0aGF0IHdyaXRlcyB0byBNUEVSRiAo
YW5kIEFQRVJGKSBjb250aW51ZSB0byBiZSB1bnN1cHBvcnRlZC4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYzOiBOZXcuCi0tLQpJIGRpZCBjb25z
aWRlciB3aGV0aGVyIHRvIHB1dCB0aGUgY29kZSBpbiBndWVzdF9yZG1zcigpIGluc3RlYWQsIGJ1
dApkZWNpZGVkIHRoYXQgaXQncyBiZXR0ZXIgdG8gaGF2ZSBpdCBuZXh0IHRvIFRTQyBoYW5kbGlu
Zy4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9o
dm0uYwpAQCAtMzQ0MCw2ICszNDQwLDIyIEBAIGludCBodm1fbXNyX3JlYWRfaW50ZXJjZXB0KHVu
c2lnbmVkIGludAogICAgICAgICAqbXNyX2NvbnRlbnQgPSB2LT5hcmNoLmh2bS5tc3JfdHNjX2Fk
anVzdDsKICAgICAgICAgYnJlYWs7CiAKKyAgICBjYXNlIE1TUl9NUEVSRl9SRF9PTkxZOgorICAg
ICAgICBpZiAoICFkLT5hcmNoLmNwdWlkLT5leHRkLmVmcm8gKQorICAgICAgICB7CisgICAgICAg
ICAgICBnb3RvIGdwX2ZhdWx0OworCisgICAgY2FzZSBNU1JfSUEzMl9NUEVSRjoKKyAgICAgICAg
ICAgIGlmICggIShkLT5hcmNoLmNwdWlkLT5iYXNpYy5yYXdbNl0uYyAmCisgICAgICAgICAgICAg
ICAgICAgQ1BVSUQ2X0VDWF9BUEVSRk1QRVJGX0NBUEFCSUxJVFkpICkKKyAgICAgICAgICAgICAg
ICBnb3RvIGdwX2ZhdWx0OworICAgICAgICB9CisgICAgICAgIGlmICggcmRtc3Jfc2FmZShtc3Is
ICptc3JfY29udGVudCkgKQorICAgICAgICAgICAgZ290byBncF9mYXVsdDsKKyAgICAgICAgaWYg
KCBkLT5hcmNoLmNwdWlkLT54ODZfdmVuZG9yICYgKFg4Nl9WRU5ET1JfQU1EIHwgWDg2X1ZFTkRP
Ul9IWUdPTikgKQorICAgICAgICAgICAgKm1zcl9jb250ZW50ID0gaHZtX2dldF9ndWVzdF90c2Nf
Zml4ZWQodiwgKm1zcl9jb250ZW50KTsKKyAgICAgICAgYnJlYWs7CisKICAgICBjYXNlIE1TUl9B
UElDX0JBU0U6CiAgICAgICAgICptc3JfY29udGVudCA9IHZjcHVfdmxhcGljKHYpLT5ody5hcGlj
X2Jhc2VfbXNyOwogICAgICAgICBicmVhazsKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3It
aW5kZXguaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21zci1pbmRleC5oCkBAIC0zNzcsNiAr
Mzc3LDkgQEAKICNkZWZpbmUgTVNSX0lBMzJfTVBFUkYJCQkweDAwMDAwMGU3CiAjZGVmaW5lIE1T
Ul9JQTMyX0FQRVJGCQkJMHgwMDAwMDBlOAogCisjZGVmaW5lIE1TUl9NUEVSRl9SRF9PTkxZCQkw
eGMwMDAwMGU3CisjZGVmaW5lIE1TUl9BUEVSRl9SRF9PTkxZCQkweGMwMDAwMGU4CisKICNkZWZp
bmUgTVNSX0lBMzJfVEhFUk1fQ09OVFJPTAkJMHgwMDAwMDE5YQogI2RlZmluZSBNU1JfSUEzMl9U
SEVSTV9JTlRFUlJVUFQJMHgwMDAwMDE5YgogI2RlZmluZSBNU1JfSUEzMl9USEVSTV9TVEFUVVMJ
CTB4MDAwMDAxOWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
