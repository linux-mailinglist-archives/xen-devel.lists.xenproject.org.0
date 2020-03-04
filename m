Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E4A178AAD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 07:36:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9NZv-0001tA-Iz; Wed, 04 Mar 2020 06:32:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jt9l=4V=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9NZt-0001t0-Io
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 06:32:21 +0000
X-Inumbo-ID: e3c5b5c0-5de1-11ea-a321-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3c5b5c0-5de1-11ea-a321-12813bfff9fa;
 Wed, 04 Mar 2020 06:32:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DB7B9ADAA;
 Wed,  4 Mar 2020 06:32:14 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Mar 2020 07:32:06 +0100
Message-Id: <20200304063212.20843-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v3 0/6] xen/rcu: let rcu work better with core
 scheduling
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG9kYXkgdGhlIFJDVSBoYW5kbGluZyBpbiBYZW4gaXMgYWZmZWN0aW5nIHNjaGVkdWxpbmcgaW4g
c2V2ZXJhbCB3YXlzLgpJdCBpcyByYWlzaW5nIHNjaGVkIHNvZnRpcnFzIHdpdGhvdXQgYW55IHJl
YWwgbmVlZCBhbmQgaXQgcmVxdWlyZXMKdGFza2xldHMgZm9yIHJjdV9iYXJyaWVyKCksIHdoaWNo
IGludGVyYWN0cyBiYWRseSB3aXRoIGNvcmUgc2NoZWR1bGluZy4KClRoaXMgc21hbGwgc2VyaWVz
IHJlcGFpcnMgdGhvc2UgaXNzdWVzLgoKQWRkaXRpb25hbGx5IHNvbWUgQVNTRVJUKClzIGFyZSBh
ZGRlZCBmb3IgdmVyaWZpY2F0aW9uIG9mIHNhbmUgcmN1CmhhbmRsaW5nLiBJbiBvcmRlciB0byBh
dm9pZCB0aG9zZSB0cmlnZ2VyaW5nIHJpZ2h0IGF3YXkgdGhlIG9idmlvdXMKdmlvbGF0aW9ucyBh
cmUgZml4ZWQuIFRoaXMgaW5jbHVkZXMgbWFraW5nIHJjdSBsb2NraW5nIGZ1bmN0aW9ucyB0eXBl
CnNhZmUuCgpDaGFuZ2VzIGluIFYzOgotIHR5cGUgc2FmZSBsb2NraW5nIGZ1bmN0aW9ucyAoZnVu
Y3Rpb25zIGluc3RlYWQgb2YgbWFjcm9zKQotIHBlci1sb2NrIGRlYnVnIGFkZGl0aW9ucwotIG5l
dyBwYXRjaGVzIDQgYW5kIDYKLSBmaXhlZCByYWNlcwoKQ2hhbmdlcyBpbiBWMjoKLSB1c2UgZ2V0
X2NwdV9tYXBzKCkgaW4gcmN1X2JhcnJpZXIoKSBoYW5kbGluZwotIGF2b2lkIHJlY3Vyc2lvbiBp
biByY3VfYmFycmllcigpIGhhbmRsaW5nCi0gbmV3IHBhdGNoZXMgMyBhbmQgNAoKSnVlcmdlbiBH
cm9zcyAoNik6CiAgeGVuL3JjdTogdXNlIHJjdSBzb2Z0aXJxIGZvciBmb3JjaW5nIHF1aWVzY2Vu
dCBzdGF0ZQogIHhlbi9yY3U6IGRvbid0IHVzZSBzdG9wX21hY2hpbmVfcnVuKCkgZm9yIHJjdV9i
YXJyaWVyKCkKICB4ZW46IGFkZCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXNfbm9yY3UoKSBmb3Ig
a2V5aGFuZGxlcnMKICB4ZW4vcmN1OiBmaXggcmN1X2xvY2tfZG9tYWluKCkKICB4ZW4vcmN1OiBh
ZGQgYXNzZXJ0aW9ucyB0byBkZWJ1ZyBidWlsZAogIHhlbi9yY3U6IGFkZCBwZXItbG9jayBjb3Vu
dGVyIGluIGRlYnVnIGJ1aWxkcwoKIHhlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgICAgICAgICAg
ICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9udW1hLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDQgKy0KIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKwogeGVuL2NvbW1vbi9rZXloYW5kbGVyLmMgICAgICAgICAgICAgICAgICAgICB8
ICAgNiArLQogeGVuL2NvbW1vbi9tdWx0aWNhbGwuYyAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSArCiB4ZW4vY29tbW9uL3ByZWVtcHQuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICst
CiB4ZW4vY29tbW9uL3JjdXBkYXRlLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTA5ICsrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0KIHhlbi9jb21tb24vc29mdGlycS5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMTkgKysrKy0KIHhlbi9jb21tb24vd2FpdC5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDEgKwogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRf
aW9tbXUuYyB8ICAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgICAg
ICAgICB8ICAgMiArLQogeGVuL2RyaXZlcnMvdnBjaS9tc2kuYyAgICAgICAgICAgICAgICAgICAg
ICB8ICAgNCArLQogeGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmggICAgICAgICAgICAgICAgICB8
ICA3NSArKysrKysrKysrKysrKystLS0tCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICAg
ICAgICAgICAgICAgIHwgICA2ICstCiB4ZW4vaW5jbHVkZS94ZW4vc29mdGlycS5oICAgICAgICAg
ICAgICAgICAgIHwgICAyICsKIDE1IGZpbGVzIGNoYW5nZWQsIDE3OSBpbnNlcnRpb25zKCspLCA2
MCBkZWxldGlvbnMoLSkKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
