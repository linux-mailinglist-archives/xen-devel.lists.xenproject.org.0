Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EBCC0494
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:49:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDohU-0000pe-8b; Fri, 27 Sep 2019 11:46:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R7hV=XW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iDohS-0000pQ-Bj
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:46:14 +0000
X-Inumbo-ID: 67ea7770-e11c-11e9-9676-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id 67ea7770-e11c-11e9-9676-12813bfff9fa;
 Fri, 27 Sep 2019 11:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569584773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r8aYpU7uwlgMG5SeexwbNPXBQ/FHaGSLa2qK8HXoZf4=;
 b=WwwLivBhbpM6zEJbSPrK4BfCWnSFuuc1mUKXnfp7xFXYXmD+Gc1QFUNW
 S8UqtvFvSsQcVQIvIzFzsj134LZcDIG6ckTgCTxZ6q0wxiRSgnlazS/uR
 Ng6HDTDSlurCteNMYwq8ouHBFdrIwzorBwAMoov5v6AkmC93r46iaBySH c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zjOlCGnM1p9Egilvr0q8h0VQDxoyTlcD/LRtLJQjoVkavb2Ucc8l0PfAEOMTj53GLjTCpByPjK
 UJGFThs1mK+tLhikaBQMUXXdDAjBOAXbK9+p//29f7fzrpTp6v9d8aM0V/733m4+Z8BqvmdjlW
 zH9NQDSm+i5z5+s6tgF3R+AD7u1bxOCfiqMBcTdWe/L7rn69AAv3eBrtaOtEMxv8LiBdUMN3FV
 K+SXU3PDZ5NNco2rd8RHmfqRDz9jGRo72AR4h/V0P51b59qHBvhgRZth3IYCqPmtPTE8Mj/Gaa
 APA=
X-SBRS: 2.7
X-MesageID: 6164558
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6164558"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Sep 2019 12:45:54 +0100
Message-ID: <20190927114554.11513-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] iommu: fix PVH dom0 settings
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
Cc: Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UFZIIGRvbTAgbXVzdCBvcGVyYXRlIHdpdGggdGhlIGlvbW11IHNldHRpbmdzIGluICdzdHJpY3Qn
IG1vZGUgaS5lLiBvbmx5IHRoZQpkb21haW4ncyBvd24gcGFnZXMgd2lsbCBiZSBtYXBwZWQgaW4g
dGhlIElPTU1VLiBUaGUgY2hlY2tfaHdkb21fcmVxcygpIGlzCnN1cHBvc2VkIHRvIGVuc3VyZSB0
aGlzLiBVbmZvcnR1bmF0ZWx5IHRoZSB0ZXN0IGZvciBhIFBWSCBkb20wIGlzIG1hZGUKdXNpbmcg
cGFnaW5nX21vZGVfdHJhbnNsYXRlKCkgYW5kLCB3aGVuIGNvbW1pdCBmODlmNTU1OCAicmVtb3Zl
IGxhdGUKKG9uLWRlbWFuZCkgY29uc3RydWN0aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzIiBtb3Zl
ZCB0aGUgY2FsbCBvZgpjaGVja19od2RvbV9yZXFzKCkgZnJvbSBpb21tdV9od2RvbV9pbml0KCkg
dG8gaW9tbXVfZG9tYWluX2luaXQoKSwgdGhhdAp0ZXN0IGJlY2FtZSBpbmVmZmVjdGl2ZSAoYmVj
YXVzZSBpb21tdV9kb21haW5faW5pdCgpIGlzIGNhbGxlZCBiZWZvcmUKcGFnaW5nX2VuYWJsZSgp
KS4KClRoaXMgcGF0Y2ggcmVwbGFjZXMgdGhlIHRlc3Qgb2YgcGFnaW5nX21vZGVfdHJhbnNsYXRl
KCkgd2l0aCBhIHRlc3Qgb2YKaGFwX2VuYWJsZWQoKSwgYW5kIGFsc28gdmVyaWZpZXMgJ3N0cmlj
dCcgbW9kZSBpcyB0dXJuZWQgb24gaW4KYXJjaF9pb21tdV9jaGVja19hdXRvdHJhbnNsYXRlZF9o
d2RvbSgpLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KUmVwb3J0ZWQtYnk6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2lvbW11LmMgICAgIHwgNiArKystLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3g4Ni9pb21tdS5jIHwgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lv
bW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCmluZGV4IDI3MzNiMzIwZWMu
LjhiNTUwZjkwOWIgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMK
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwpAQCAtMTU0LDEzICsxNTQsMTMg
QEAgY3VzdG9tX3BhcmFtKCJkb20wLWlvbW11IiwgcGFyc2VfZG9tMF9pb21tdV9wYXJhbSk7CiAK
IHN0YXRpYyB2b2lkIF9faHdkb21faW5pdCBjaGVja19od2RvbV9yZXFzKHN0cnVjdCBkb21haW4g
KmQpCiB7Ci0gICAgaWYgKCBpb21tdV9od2RvbV9ub25lIHx8ICFwYWdpbmdfbW9kZV90cmFuc2xh
dGUoZCkgKQorICAgIGlmICggaW9tbXVfaHdkb21fbm9uZSB8fCAhaGFwX2VuYWJsZWQoZCkgKQog
ICAgICAgICByZXR1cm47CiAKLSAgICBhcmNoX2lvbW11X2NoZWNrX2F1dG90cmFuc2xhdGVkX2h3
ZG9tKGQpOwotCiAgICAgaW9tbXVfaHdkb21fcGFzc3Rocm91Z2ggPSBmYWxzZTsKICAgICBpb21t
dV9od2RvbV9zdHJpY3QgPSB0cnVlOworCisgICAgYXJjaF9pb21tdV9jaGVja19hdXRvdHJhbnNs
YXRlZF9od2RvbShkKTsKIH0KIAogaW50IGlvbW11X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4g
KmQsIHVuc2lnbmVkIGludCBvcHRzKQpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gveDg2L2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYwppbmRl
eCA0N2EzZTU1MjEzLi5mNTQ4MDViYWJkIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC94ODYvaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUu
YwpAQCAtODUsNiArODUsOSBAQCB2b2lkIF9faHdkb21faW5pdCBhcmNoX2lvbW11X2NoZWNrX2F1
dG90cmFuc2xhdGVkX2h3ZG9tKHN0cnVjdCBkb21haW4gKmQpCiB7CiAgICAgaWYgKCAhaXNfaW9t
bXVfZW5hYmxlZChkKSApCiAgICAgICAgIHBhbmljKCJQcmVzZW50bHksIGlvbW11IG11c3QgYmUg
ZW5hYmxlZCBmb3IgUFZIIGhhcmR3YXJlIGRvbWFpblxuIik7CisKKyAgICBpZiAoICFpb21tdV9o
d2RvbV9zdHJpY3QgKQorICAgICAgICBwYW5pYygiUFZIIGhhcmR3YXJlIGRvbWFpbiBpb21tdSBt
dXN0IGJlIHNldCBpbiAnc3RyaWN0JyBtb2RlXG4iKTsKIH0KIAogaW50IGFyY2hfaW9tbXVfZG9t
YWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
