Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5FC12521F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 20:44:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihfCV-0007kA-Tv; Wed, 18 Dec 2019 19:41:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wZRn=2I=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ihfCU-0007jL-7W
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 19:41:38 +0000
X-Inumbo-ID: 592a0795-21ce-11ea-90f3-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 592a0795-21ce-11ea-90f3-12813bfff9fa;
 Wed, 18 Dec 2019 19:41:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 11:41:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="210196297"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.103.7])
 by orsmga008.jf.intel.com with ESMTP; 18 Dec 2019 11:41:12 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 11:40:42 -0800
Message-Id: <136e2a2aab7d7e9b40d83429dba1cf7d70650111.1576697796.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576697796.git.tamas.lengyel@intel.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 05/20] x86/mem_sharing: make get_two_gfns
 take locks conditionally
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIFZNIGZvcmtpbmcgdGhlIGNsaWVudCBsb2NrIHdpbGwgYWxyZWFkeSBiZSB0YWtlbi4K
ClNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgfCAxMSArKysrKystLS0tLQogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9wMm0uaCAgICAgfCAxMCArKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMK
aW5kZXggMzE5YWFmMzA3NC4uYzBlMzA1YWQ3MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21t
L21lbV9zaGFyaW5nLmMKKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKQEAgLTk1
NCw3ICs5NTQsNyBAQCBzdGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBn
Zm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCiAgICAgdW5zaWduZWQgbG9uZyBwdXRfY291bnQg
PSAwOwogCiAgICAgZ2V0X3R3b19nZm5zKHNkLCBzZ2ZuLCAmc21mbl90eXBlLCBOVUxMLCAmc21m
biwKLSAgICAgICAgICAgICAgICAgY2QsIGNnZm4sICZjbWZuX3R5cGUsIE5VTEwsICZjbWZuLCAw
LCAmdGcpOworICAgICAgICAgICAgICAgICBjZCwgY2dmbiwgJmNtZm5fdHlwZSwgTlVMTCwgJmNt
Zm4sIDAsICZ0ZywgdHJ1ZSk7CiAKICAgICAvKgogICAgICAqIFRoaXMgdHJpY2t5IGJ1c2luZXNz
IGlzIHRvIGF2b2lkIHR3byBjYWxsZXJzIGRlYWRsb2NraW5nIGlmCkBAIC0xMDY4LDcgKzEwNjgs
NyBAQCBlcnJfb3V0OgogfQogCiBpbnQgbWVtX3NoYXJpbmdfYWRkX3RvX3BoeXNtYXAoc3RydWN0
IGRvbWFpbiAqc2QsIHVuc2lnbmVkIGxvbmcgc2dmbiwgc2hyX2hhbmRsZV90IHNoLAotICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkb21haW4gKmNkLCB1bnNpZ25lZCBsb25n
IGNnZm4pCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRvbWFpbiAqY2Qs
IHVuc2lnbmVkIGxvbmcgY2dmbiwgYm9vbCBsb2NrKQogewogICAgIHN0cnVjdCBwYWdlX2luZm8g
KnNwYWdlOwogICAgIGludCByZXQgPSAtRUlOVkFMOwpAQCAtMTA4MCw3ICsxMDgwLDcgQEAgaW50
IG1lbV9zaGFyaW5nX2FkZF90b19waHlzbWFwKHN0cnVjdCBkb21haW4gKnNkLCB1bnNpZ25lZCBs
b25nIHNnZm4sIHNocl9oYW5kbGUKICAgICBzdHJ1Y3QgdHdvX2dmbnMgdGc7CiAKICAgICBnZXRf
dHdvX2dmbnMoc2QsIF9nZm4oc2dmbiksICZzbWZuX3R5cGUsIE5VTEwsICZzbWZuLAotICAgICAg
ICAgICAgICAgICBjZCwgX2dmbihjZ2ZuKSwgJmNtZm5fdHlwZSwgJmEsICZjbWZuLCAwLCAmdGcp
OworICAgICAgICAgICAgICAgICBjZCwgX2dmbihjZ2ZuKSwgJmNtZm5fdHlwZSwgJmEsICZjbWZu
LCAwLCAmdGcsIGxvY2spOwogCiAgICAgLyogR2V0IHRoZSBzb3VyY2Ugc2hhcmVkIHBhZ2UsIGNo
ZWNrIGFuZCBsb2NrICovCiAgICAgcmV0ID0gWEVOTUVNX1NIQVJJTkdfT1BfU19IQU5ETEVfSU5W
QUxJRDsKQEAgLTExNTUsNyArMTE1NSw4IEBAIGludCBtZW1fc2hhcmluZ19hZGRfdG9fcGh5c21h
cChzdHJ1Y3QgZG9tYWluICpzZCwgdW5zaWduZWQgbG9uZyBzZ2ZuLCBzaHJfaGFuZGxlCiBlcnJf
dW5sb2NrOgogICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKHNwYWdlKTsKIGVycl9vdXQ6Ci0g
ICAgcHV0X3R3b19nZm5zKCZ0Zyk7CisgICAgaWYgKCBsb2NrICkKKyAgICAgICAgcHV0X3R3b19n
Zm5zKCZ0Zyk7CiAgICAgcmV0dXJuIHJldDsKIH0KIApAQCAtMTU3NCw3ICsxNTc1LDcgQEAgaW50
IG1lbV9zaGFyaW5nX21lbW9wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX21lbV9zaGFyaW5n
X29wX3QpIGFyZykKICAgICAgICAgICAgIHNoICAgICAgPSBtc28udS5zaGFyZS5zb3VyY2VfaGFu
ZGxlOwogICAgICAgICAgICAgY2dmbiAgICA9IG1zby51LnNoYXJlLmNsaWVudF9nZm47CiAKLSAg
ICAgICAgICAgIHJjID0gbWVtX3NoYXJpbmdfYWRkX3RvX3BoeXNtYXAoZCwgc2dmbiwgc2gsIGNk
LCBjZ2ZuKTsKKyAgICAgICAgICAgIHJjID0gbWVtX3NoYXJpbmdfYWRkX3RvX3BoeXNtYXAoZCwg
c2dmbiwgc2gsIGNkLCBjZ2ZuLCB0cnVlKTsKIAogICAgICAgICAgICAgcmN1X3VubG9ja19kb21h
aW4oY2QpOwogICAgICAgICB9CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5o
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAppbmRleCA5NDI4NWRiMWI0Li43Mzk5YzRhODk3
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvcDJtLmgKQEAgLTUzOSw3ICs1MzksNyBAQCBzdHJ1Y3QgdHdvX2dmbnMgewogc3Rh
dGljIGlubGluZSB2b2lkIGdldF90d29fZ2ZucyhzdHJ1Y3QgZG9tYWluICpyZCwgZ2ZuX3Qgcmdm
biwKICAgICAgICAgcDJtX3R5cGVfdCAqcnQsIHAybV9hY2Nlc3NfdCAqcmEsIG1mbl90ICpybWZu
LCBzdHJ1Y3QgZG9tYWluICpsZCwKICAgICAgICAgZ2ZuX3QgbGdmbiwgcDJtX3R5cGVfdCAqbHQs
IHAybV9hY2Nlc3NfdCAqbGEsIG1mbl90ICpsbWZuLAotICAgICAgICBwMm1fcXVlcnlfdCBxLCBz
dHJ1Y3QgdHdvX2dmbnMgKnJ2YWwpCisgICAgICAgIHAybV9xdWVyeV90IHEsIHN0cnVjdCB0d29f
Z2ZucyAqcnZhbCwgYm9vbCBsb2NrKQogewogICAgIG1mbl90ICAgICAgICAgICAqZmlyc3RfbWZu
LCAqc2Vjb25kX21mbiwgc2NyYXRjaF9tZm47CiAgICAgcDJtX2FjY2Vzc190ICAgICpmaXJzdF9h
LCAqc2Vjb25kX2EsIHNjcmF0Y2hfYTsKQEAgLTU2OSwxMCArNTY5LDEwIEBAIGRvIHsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogI3VuZGVmIGFz
c2lnbl9wb2ludGVycwogCiAgICAgLyogTm93IGRvIHRoZSBnZXRzICovCi0gICAgKmZpcnN0X21m
biAgPSBnZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybV9nZXRfaG9zdHAybShydmFsLT5maXJzdF9kb21h
aW4pLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZm5feChydmFsLT5m
aXJzdF9nZm4pLCBmaXJzdF90LCBmaXJzdF9hLCBxLCBOVUxMKTsKLSAgICAqc2Vjb25kX21mbiA9
IGdldF9nZm5fdHlwZV9hY2Nlc3MocDJtX2dldF9ob3N0cDJtKHJ2YWwtPnNlY29uZF9kb21haW4p
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZm5feChydmFsLT5zZWNv
bmRfZ2ZuKSwgc2Vjb25kX3QsIHNlY29uZF9hLCBxLCBOVUxMKTsKKyAgICAqZmlyc3RfbWZuICA9
IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhwMm1fZ2V0X2hvc3RwMm0ocnZhbC0+Zmlyc3RfZG9tYWlu
KSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZm5feChydmFsLT5m
aXJzdF9nZm4pLCBmaXJzdF90LCBmaXJzdF9hLCBxLCBOVUxMLCBsb2NrKTsKKyAgICAqc2Vjb25k
X21mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhwMm1fZ2V0X2hvc3RwMm0ocnZhbC0+c2Vjb25k
X2RvbWFpbiksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3go
cnZhbC0+c2Vjb25kX2dmbiksIHNlY29uZF90LCBzZWNvbmRfYSwgcSwgTlVMTCwgbG9jayk7CiB9
CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBwdXRfdHdvX2dmbnMoc3RydWN0IHR3b19nZm5zICphcmcp
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
