Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FC812521E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 20:44:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihfCL-0007fG-W3; Wed, 18 Dec 2019 19:41:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wZRn=2I=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ihfCK-0007ee-6g
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 19:41:28 +0000
X-Inumbo-ID: 59282406-21ce-11ea-90f3-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59282406-21ce-11ea-90f3-12813bfff9fa;
 Wed, 18 Dec 2019 19:41:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 11:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="210196279"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.103.7])
 by orsmga008.jf.intel.com with ESMTP; 18 Dec 2019 11:41:10 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 11:40:39 -0800
Message-Id: <3b07eeab8b384b4abf5277f26ebb8178e9434427.1576697796.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576697796.git.tamas.lengyel@intel.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 02/20] xen/x86: Make hap_get_allocation
 accessible
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIFZNIGZvcmtpbmcgd2UnbGwgY29weSB0aGUgcGFyZW50IGRvbWFpbidzIHBhcmFtZXRl
cnMgdG8gdGhlIGNsaWVudCwKaW5jbHVkaW5nIHRoZSBIQVAgc2hhZG93IG1lbW9yeSBzZXR0aW5n
IHRoYXQgaXMgdXNlZCBmb3Igc3RvcmluZyB0aGUgZG9tYWluJ3MKRVBULiBXZSdsbCBjb3B5IHRo
aXMgaW4gdGhlIGh5cGVydmlzb3IgaW5zdGVhZCBkb2luZyBpdCBkdXJpbmcgdG9vbHN0YWNrIGxh
dW5jaAp0byBhbGxvdyB0aGUgZG9tYWluIHRvIHN0YXJ0IGV4ZWN1dGluZyBhbmQgdW5zaGFyaW5n
IG1lbW9yeSBiZWZvcmUgKG9yCmV2ZW4gY29tcGxldGVseSB3aXRob3V0KSB0aGUgdG9vbHN0YWNr
LgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNv
bT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jIHwgMyArLS0KIHhlbi9pbmNsdWRlL2Fz
bS14ODYvaGFwLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgYi94ZW4v
YXJjaC94ODYvbW0vaGFwL2hhcC5jCmluZGV4IDNkOTNmMzQ1MWMuLmM3YzdmZjZlOTkgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMKKysrIGIveGVuL2FyY2gveDg2L21tL2hh
cC9oYXAuYwpAQCAtMzIxLDggKzMyMSw3IEBAIHN0YXRpYyB2b2lkIGhhcF9mcmVlX3AybV9wYWdl
KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwYWdlX2luZm8gKnBnKQogfQogCiAvKiBSZXR1cm4g
dGhlIHNpemUgb2YgdGhlIHBvb2wsIHJvdW5kZWQgdXAgdG8gdGhlIG5lYXJlc3QgTUIgKi8KLXN0
YXRpYyB1bnNpZ25lZCBpbnQKLWhhcF9nZXRfYWxsb2NhdGlvbihzdHJ1Y3QgZG9tYWluICpkKQor
dW5zaWduZWQgaW50IGhhcF9nZXRfYWxsb2NhdGlvbihzdHJ1Y3QgZG9tYWluICpkKQogewogICAg
IHVuc2lnbmVkIGludCBwZyA9IGQtPmFyY2gucGFnaW5nLmhhcC50b3RhbF9wYWdlcwogICAgICAg
ICArIGQtPmFyY2gucGFnaW5nLmhhcC5wMm1fcGFnZXM7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2hhcC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXAuaAppbmRleCBiOTRiZmI0
ZWQwLi4xYmYwN2U0OWZlIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2hhcC5oCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaGFwLmgKQEAgLTQ1LDYgKzQ1LDcgQEAgaW50ICAgaGFw
X3RyYWNrX2RpcnR5X3ZyYW0oc3RydWN0IGRvbWFpbiAqZCwKIAogZXh0ZXJuIGNvbnN0IHN0cnVj
dCBwYWdpbmdfbW9kZSAqaGFwX3BhZ2luZ19nZXRfbW9kZShzdHJ1Y3QgdmNwdSAqKTsKIGludCBo
YXBfc2V0X2FsbG9jYXRpb24oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHBhZ2VzLCBi
b29sICpwcmVlbXB0ZWQpOwordW5zaWduZWQgaW50IGhhcF9nZXRfYWxsb2NhdGlvbihzdHJ1Y3Qg
ZG9tYWluICpkKTsKIAogI2VuZGlmIC8qIFhFTl9IQVBfSCAqLwogCi0tIAoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
