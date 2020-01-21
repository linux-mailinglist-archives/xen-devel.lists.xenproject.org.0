Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B251443A2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:53:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itxg4-0005Cf-Gr; Tue, 21 Jan 2020 17:51:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ThP3=3K=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1itxg2-0005BN-Bu
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 17:50:58 +0000
X-Inumbo-ID: 7bdf470c-3c76-11ea-bb21-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bdf470c-3c76-11ea-bb21-12813bfff9fa;
 Tue, 21 Jan 2020 17:50:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 09:50:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="228929232"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.23.127])
 by orsmga006.jf.intel.com with ESMTP; 21 Jan 2020 09:50:07 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 09:49:47 -0800
Message-Id: <1ccb1524a08c3db2f59b7dae4d8377e1c98903c9.1579628566.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1579628566.git.tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 14/18] x86/mem_sharing: use default_access in
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
IGNhbiBiZSBub24tc2Vuc2ljYWwsIGxlYWRpbmcgdG8Kc3B1cmlvdXMgdm1fZXZlbnRzIGJlaW5n
IHNlbnQgb3V0IGZvciBhY2Nlc3MgdmlvbGF0aW9ucyBhdCB1bmV4cGVjdGVkCmxvY2F0aW9ucy4g
TWFrZSB1c2Ugb2YgcDJtLT5kZWZhdWx0X2FjY2VzcyBpbnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9z
aGFyaW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCBlYWM4MDQ3YzA3
Li5lM2RkYjYzYjRmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwor
KysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpAQCAtMTA3MSwxMSArMTA3MSwxMCBA
QCBpbnQgYWRkX3RvX3BoeXNtYXAoc3RydWN0IGRvbWFpbiAqc2QsIHVuc2lnbmVkIGxvbmcgc2dm
biwgc2hyX2hhbmRsZV90IHNoLAogICAgIHAybV90eXBlX3Qgc21mbl90eXBlLCBjbWZuX3R5cGU7
CiAgICAgc3RydWN0IGdmbl9pbmZvICpnZm5faW5mbzsKICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAq
cDJtID0gcDJtX2dldF9ob3N0cDJtKGNkKTsKLSAgICBwMm1fYWNjZXNzX3QgYTsKICAgICBzdHJ1
Y3QgdHdvX2dmbnMgdGc7CiAKICAgICBnZXRfdHdvX2dmbnMoc2QsIF9nZm4oc2dmbiksICZzbWZu
X3R5cGUsIE5VTEwsICZzbWZuLAotICAgICAgICAgICAgICAgICBjZCwgX2dmbihjZ2ZuKSwgJmNt
Zm5fdHlwZSwgJmEsICZjbWZuLCAwLCAmdGcsIGxvY2spOworICAgICAgICAgICAgICAgICBjZCwg
X2dmbihjZ2ZuKSwgJmNtZm5fdHlwZSwgTlVMTCwgJmNtZm4sIDAsICZ0ZywgbG9jayk7CiAKICAg
ICAvKiBHZXQgdGhlIHNvdXJjZSBzaGFyZWQgcGFnZSwgY2hlY2sgYW5kIGxvY2sgKi8KICAgICBy
ZXQgPSBYRU5NRU1fU0hBUklOR19PUF9TX0hBTkRMRV9JTlZBTElEOwpAQCAtMTExMCw3ICsxMTA5
LDcgQEAgaW50IGFkZF90b19waHlzbWFwKHN0cnVjdCBkb21haW4gKnNkLCB1bnNpZ25lZCBsb25n
IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKICAgICB9CiAKICAgICByZXQgPSBwMm1fc2V0X2VudHJ5
KHAybSwgX2dmbihjZ2ZuKSwgc21mbiwgUEFHRV9PUkRFUl80SywKLSAgICAgICAgICAgICAgICAg
ICAgICAgIHAybV9yYW1fc2hhcmVkLCBhKTsKKyAgICAgICAgICAgICAgICAgICAgICAgIHAybV9y
YW1fc2hhcmVkLCBwMm0tPmRlZmF1bHRfYWNjZXNzKTsKIAogICAgIC8qIFRlbXB0ZWQgdG8gdHVy
biB0aGlzIGludG8gYW4gYXNzZXJ0ICovCiAgICAgaWYgKCByZXQgKQotLSAKMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
