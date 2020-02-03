Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB001150A9B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 17:15:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyeKq-0007Wm-BF; Mon, 03 Feb 2020 16:12:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZuA2=3X=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1iyeKo-0007WX-P7
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 16:12:26 +0000
X-Inumbo-ID: f544603e-469f-11ea-8e75-12813bfff9fa
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f544603e-469f-11ea-8e75-12813bfff9fa;
 Mon, 03 Feb 2020 16:12:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 08:12:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="337726512"
Received: from kchen27-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.20.224])
 by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2020 08:12:19 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Feb 2020 08:12:06 -0800
Message-Id: <ae672a868ab7ac879a6809b6909422f996d58f60.1580746020.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1580746020.git.tamas.lengyel@intel.com>
References: <cover.1580746020.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 4/7] x86/mem_sharing: use default_access in
 add_to_physmap
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBwbHVnZ2luZyBhIGhvbGUgaW4gdGhlIHRhcmdldCBwaHlzbWFwIGRvbid0IHVzZSB0aGUg
YWNjZXNzIHBlcm1pc3Npb24KcmV0dXJuZWQgYnkgX19nZXRfZ2ZuX3R5cGVfYWNjZXNzIGFzIGl0
IGlzIG5vbi1zZW5zaWNhbCAocDJtX2FjY2Vzc19uKSBpbgp0aGUgdXNlLWNhc2UgYWRkX3RvX3Bo
eXNtYXAgd2FzIGludGVuZGVkIHRvIGJlIHVzZWQgaW4uIEl0IGxlYWRzIHRvIHZtX2V2ZW50cwpi
ZWluZyBzZW50IG91dCBmb3IgYWNjZXNzIHZpb2xhdGlvbnMgYXQgdW5leHBlY3RlZCBsb2NhdGlv
bnMuIE1ha2UgdXNlIG9mCnAybS0+ZGVmYXVsdF9hY2Nlc3MgaW5zdGVhZCBhbmQgZG9jdW1lbnQg
dGhlIGFtYmlndWl0eSBzdXJyb3VuZGluZyAiaG9sZSIKdHlwZXMgYW5kIGNvcm5lci1jYXNlcyB3
aXRoIGN1c3RvbSBtZW1fYWNjZXNzIGJlaW5nIHNldCBvbiBob2xlcy4KClNpZ25lZC1vZmYtYnk6
IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+Ci0tLQp2NzogYWRkIGRl
dGFpbGVkIGNvbW1lbnQgZXhwbGFpbmluZyB0aGUgaXNzdWUgYW5kIHdoeSB0aGlzIGZpeCBpcyBj
b3JyZWN0Ci0tLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgfCAyOCArKysrKysrKysr
KysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyBi
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCmluZGV4IDJiM2JlNWIxMjUuLjM4MzViYzky
OGYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCkBAIC0xMDYxLDYgKzEwNjEsMjkgQEAgZXJyX291dDoK
ICAgICByZXR1cm4gcmV0OwogfQogCisvKgorICogVGhpcyBmdW5jdGlvbiBpcyBpbnRlbmRlZCB0
byBiZSB1c2VkIGZvciBwbHVnZ2luZyBhICJob2xlIiBpbiB0aGUgY2xpZW50J3MKKyAqIHBoeXNt
YXAgd2l0aCBhIHNoYXJlZCBtZW1vcnkgZW50cnkuIFVuZm9ydHVuYXRlbHkgdGhlIGRlZmluaXRp
b24gb2YgYSAiaG9sZSIKKyAqIGlzIGN1cnJlbnRseSBhbWJpZ2lvdXMuIFRoZXJlIGFyZSB0d28g
Y2FzZXMgb25lIGNhbiBydW4gaW50byBhICJob2xlIjoKKyAqICAxKSB0aGVyZSBpcyBubyBwYWdl
dGFibGUgZW50cnkgYXQgYWxsCisgKiAgMikgdGhlcmUgaXMgYSBwYWdldGFibGUgZW50cnkgd2l0
aCBhIHR5cGUgdGhhdCBwYXNzZXMgcDJtX2lzX2hvbGUKKyAqCisgKiBUaGUgaW50ZW5kZWQgdXNl
LWNhc2UgZm9yIHRoaXMgZnVuY3Rpb24gaXMgY2FzZSAxLgorICoKKyAqIER1cmluZyAxKSB0aGUg
bWVtX2FjY2VzcyBiZWluZyByZXR1cm5lZCBpcyBwMm1fYWNjZXNzX24gYW5kIHRoYXQgaXMKKyAq
IGluY29ycmVjdCB0byBiZSBhcHBsaWVkIHRvIHRoZSBuZXcgZW50cnkgYmVpbmcgYWRkZWQgdGhl
IGNsaWVudCBwaHlzbWFwLAorICogdGh1cyB3ZSBtYWtlIHVzZSBvZiB0aGUgcDJtLT5kZWZhdWx0
X2FjY2VzcyBpbnN0ZWFkLgorICogV2hlbiAyKSBpcyB0cnVlIGl0IGlzIHBvc3NpYmxlIHRoYXQg
dGhlIGV4aXN0aW5nIHBhZ2V0YWJsZSBlbnRyeSBhbHNvIGhhcworICogYSBtZW1fYWNjZXNzIHBl
cm1pc3Npb24gc2V0LCB3aGljaCBjb3VsZCBiZSBwMm1fYWNjZXNzX24uIFNpbmNlIHdlIGNhbid0
CisgKiBkaWZmZXJlbnRpYXRlIHdoZXRoZXIgd2UgYXJlIGluIGNhc2UgMSkgb3IgMiksIHdlIGRl
ZmF1bHQgdG8gdXNpbmcgdGhlCisgKiBhY2Nlc3MgcGVybWlzc2lvbiBkZWZpbmVkIGFzIGRlZmF1
bHQgZm9yIHRoZSBwMm0sIHRodXMgaW4KKyAqIGNhc2UgMikgb3ZlcndyaXRpbmcgYW55IGN1c3Rv
bSBtZW1fYWNjZXNzIHBlcm1pc3Npb24gdGhlIHVzZXIgbWF5IGhhdmUgc2V0CisgKiBvbiBhIGhv
bGUgcGFnZS4gQ3VzdG9tIG1lbV9hY2Nlc3MgcGVybWlzc2lvbnMgYmVpbmcgc2V0IG9uIGEgaG9s
ZSBhcmUKKyAqIHVuaGVhcmQgb2YgYnV0IHRlY2huaWNhbGx5IHBvc3NpYmxlLgorICoKKyAqIFRP
RE86IHRvIHByb3Blcmx5IHJlc29sdmUgdGhpcyBpc3N1ZSBpbXBsZW1lbnQgZGlmZmVyZW50aWF0
aW9uIGJldHdlZW4gdGhlCisgKiB0d28gImhvbGUiIHR5cGVzLgorICovCiBzdGF0aWMKIGludCBh
ZGRfdG9fcGh5c21hcChzdHJ1Y3QgZG9tYWluICpzZCwgdW5zaWduZWQgbG9uZyBzZ2ZuLCBzaHJf
aGFuZGxlX3Qgc2gsCiAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRvbWFpbiAqY2QsIHVuc2ln
bmVkIGxvbmcgY2dmbiwgYm9vbCBsb2NrKQpAQCAtMTA3MSwxMSArMTA5NCwxMCBAQCBpbnQgYWRk
X3RvX3BoeXNtYXAoc3RydWN0IGRvbWFpbiAqc2QsIHVuc2lnbmVkIGxvbmcgc2dmbiwgc2hyX2hh
bmRsZV90IHNoLAogICAgIHAybV90eXBlX3Qgc21mbl90eXBlLCBjbWZuX3R5cGU7CiAgICAgc3Ry
dWN0IGdmbl9pbmZvICpnZm5faW5mbzsKICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0gcDJt
X2dldF9ob3N0cDJtKGNkKTsKLSAgICBwMm1fYWNjZXNzX3QgYTsKICAgICBzdHJ1Y3QgdHdvX2dm
bnMgdGc7CiAKICAgICBnZXRfdHdvX2dmbnMoc2QsIF9nZm4oc2dmbiksICZzbWZuX3R5cGUsIE5V
TEwsICZzbWZuLAotICAgICAgICAgICAgICAgICBjZCwgX2dmbihjZ2ZuKSwgJmNtZm5fdHlwZSwg
JmEsICZjbWZuLCAwLCAmdGcsIGxvY2spOworICAgICAgICAgICAgICAgICBjZCwgX2dmbihjZ2Zu
KSwgJmNtZm5fdHlwZSwgTlVMTCwgJmNtZm4sIDAsICZ0ZywgbG9jayk7CiAKICAgICAvKiBHZXQg
dGhlIHNvdXJjZSBzaGFyZWQgcGFnZSwgY2hlY2sgYW5kIGxvY2sgKi8KICAgICByZXQgPSBYRU5N
RU1fU0hBUklOR19PUF9TX0hBTkRMRV9JTlZBTElEOwpAQCAtMTExMCw3ICsxMTMyLDcgQEAgaW50
IGFkZF90b19waHlzbWFwKHN0cnVjdCBkb21haW4gKnNkLCB1bnNpZ25lZCBsb25nIHNnZm4sIHNo
cl9oYW5kbGVfdCBzaCwKICAgICB9CiAKICAgICByZXQgPSBwMm1fc2V0X2VudHJ5KHAybSwgX2dm
bihjZ2ZuKSwgc21mbiwgUEFHRV9PUkRFUl80SywKLSAgICAgICAgICAgICAgICAgICAgICAgIHAy
bV9yYW1fc2hhcmVkLCBhKTsKKyAgICAgICAgICAgICAgICAgICAgICAgIHAybV9yYW1fc2hhcmVk
LCBwMm0tPmRlZmF1bHRfYWNjZXNzKTsKIAogICAgIC8qIFRlbXB0ZWQgdG8gdHVybiB0aGlzIGlu
dG8gYW4gYXNzZXJ0ICovCiAgICAgaWYgKCByZXQgKQotLSAKMi4yMC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
