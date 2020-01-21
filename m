Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681CF1443A6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:53:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itxfj-0004uR-Qi; Tue, 21 Jan 2020 17:50:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ThP3=3K=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1itxfi-0004tY-Az
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 17:50:38 +0000
X-Inumbo-ID: 7ae41100-3c76-11ea-bb21-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ae41100-3c76-11ea-bb21-12813bfff9fa;
 Tue, 21 Jan 2020 17:50:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 09:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="228929181"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.23.127])
 by orsmga006.jf.intel.com with ESMTP; 21 Jan 2020 09:50:04 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 09:49:42 -0800
Message-Id: <efc770042243a1fde6fdcf9b4b469c49ee9afa15.1579628566.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1579628566.git.tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 09/18] x86/mem_sharing: Make add_to_physmap
 static and shorten name
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

SXQncyBub3QgYmVpbmcgY2FsbGVkIGZyb20gb3V0c2lkZSBtZW1fc2hhcmluZy5jCgpTaWduZWQt
b2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9t
bS9tZW1fc2hhcmluZy5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hh
cmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKaW5kZXggY2MzZmM5NzYxOC4u
NWQ4NDA1NTBmNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKKysr
IGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKQEAgLTEwNTcsOCArMTA1Nyw5IEBAIGVy
cl9vdXQ6CiAgICAgcmV0dXJuIHJldDsKIH0KIAotaW50IG1lbV9zaGFyaW5nX2FkZF90b19waHlz
bWFwKHN0cnVjdCBkb21haW4gKnNkLCB1bnNpZ25lZCBsb25nIHNnZm4sIHNocl9oYW5kbGVfdCBz
aCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZG9tYWluICpjZCwgdW5z
aWduZWQgbG9uZyBjZ2ZuLCBib29sIGxvY2spCitzdGF0aWMKK2ludCBhZGRfdG9fcGh5c21hcChz
dHJ1Y3QgZG9tYWluICpzZCwgdW5zaWduZWQgbG9uZyBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCisg
ICAgICAgICAgICAgICAgICAgc3RydWN0IGRvbWFpbiAqY2QsIHVuc2lnbmVkIGxvbmcgY2dmbiwg
Ym9vbCBsb2NrKQogewogICAgIHN0cnVjdCBwYWdlX2luZm8gKnNwYWdlOwogICAgIGludCByZXQg
PSAtRUlOVkFMOwpAQCAtMTU3MCw3ICsxNTcxLDcgQEAgaW50IG1lbV9zaGFyaW5nX21lbW9wKFhF
Tl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX21lbV9zaGFyaW5nX29wX3QpIGFyZykKICAgICAgICAg
c2ggICAgICA9IG1zby51LnNoYXJlLnNvdXJjZV9oYW5kbGU7CiAgICAgICAgIGNnZm4gICAgPSBt
c28udS5zaGFyZS5jbGllbnRfZ2ZuOwogCi0gICAgICAgIHJjID0gbWVtX3NoYXJpbmdfYWRkX3Rv
X3BoeXNtYXAoZCwgc2dmbiwgc2gsIGNkLCBjZ2ZuLCB0cnVlKTsKKyAgICAgICAgcmMgPSBhZGRf
dG9fcGh5c21hcChkLCBzZ2ZuLCBzaCwgY2QsIGNnZm4sIHRydWUpOwogCiAgICAgICAgIHJjdV91
bmxvY2tfZG9tYWluKGNkKTsKICAgICB9Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
