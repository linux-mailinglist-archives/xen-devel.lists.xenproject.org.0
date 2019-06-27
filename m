Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA70F5857F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 17:24:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgWE4-0004DO-HA; Thu, 27 Jun 2019 15:22:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgWE2-0004Cw-S0
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 15:22:14 +0000
X-Inumbo-ID: 5701adba-98ef-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5701adba-98ef-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 15:22:13 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 27 Jun 2019 09:22:13 -0600
Message-Id: <5D14DF23020000780023B98D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 27 Jun 2019 09:22:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
In-Reply-To: <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 07/10] AMD/IOMMU: allow enabling with IRQ not
 yet set up
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWFybHkgZW5hYmxpbmcgKHRvIGVudGVyIHgyQVBJQyBtb2RlKSByZXF1aXJlcyBkZWZlcnJpbmcg
b2YgdGhlIElSUQpzZXR1cC4gQ29kZSB0byBhY3R1YWxseSBkbyB0aGF0IHNldHVwIGluIHRoZSB4
MkFQSUMgY2FzZSB3aWxsIGdldCBhZGRlZApzdWJzZXF1ZW50bHkuCgpTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YW1kL2lvbW11X2luaXQuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
aW5pdC5jCkBAIC04MTQsNyArODE0LDYgQEAgc3RhdGljIHZvaWQgYW1kX2lvbW11X2VycmF0dW1f
NzQ2X3dvcmthcgogc3RhdGljIHZvaWQgZW5hYmxlX2lvbW11KHN0cnVjdCBhbWRfaW9tbXUgKmlv
bW11KQogewogICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Ci0gICAgc3RydWN0IGlycV9kZXNjICpk
ZXNjOwogCiAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmlvbW11LT5sb2NrLCBmbGFncyk7CiAKQEAg
LTgzNCwxOSArODMzLDI3IEBAIHN0YXRpYyB2b2lkIGVuYWJsZV9pb21tdShzdHJ1Y3QgYW1kX2lv
bW0KICAgICBpZiAoIGlvbW11LT5mZWF0dXJlcy5mbGRzLnBwcl9zdXAgKQogICAgICAgICByZWdp
c3Rlcl9pb21tdV9wcHJfbG9nX2luX21taW9fc3BhY2UoaW9tbXUpOwogCi0gICAgZGVzYyA9IGly
cV90b19kZXNjKGlvbW11LT5tc2kuaXJxKTsKLSAgICBzcGluX2xvY2soJmRlc2MtPmxvY2spOwot
ICAgIHNldF9tc2lfYWZmaW5pdHkoZGVzYywgJmNwdV9vbmxpbmVfbWFwKTsKLSAgICBzcGluX3Vu
bG9jaygmZGVzYy0+bG9jayk7CisgICAgaWYgKCBpb21tdS0+bXNpLmlycSA+IDAgKQorICAgIHsK
KyAgICAgICAgc3RydWN0IGlycV9kZXNjICpkZXNjID0gaXJxX3RvX2Rlc2MoaW9tbXUtPm1zaS5p
cnEpOworCisgICAgICAgIHNwaW5fbG9jaygmZGVzYy0+bG9jayk7CisgICAgICAgIHNldF9tc2lf
YWZmaW5pdHkoZGVzYywgJmNwdV9vbmxpbmVfbWFwKTsKKyAgICAgICAgc3Bpbl91bmxvY2soJmRl
c2MtPmxvY2spOworICAgIH0KIAogICAgIGFtZF9pb21tdV9tc2lfZW5hYmxlKGlvbW11LCBJT01N
VV9DT05UUk9MX0VOQUJMRUQpOwogCiAgICAgc2V0X2lvbW11X2h0X2ZsYWdzKGlvbW11KTsKICAg
ICBzZXRfaW9tbXVfY29tbWFuZF9idWZmZXJfY29udHJvbChpb21tdSwgSU9NTVVfQ09OVFJPTF9F
TkFCTEVEKTsKLSAgICBzZXRfaW9tbXVfZXZlbnRfbG9nX2NvbnRyb2woaW9tbXUsIElPTU1VX0NP
TlRST0xfRU5BQkxFRCk7CiAKLSAgICBpZiAoIGlvbW11LT5mZWF0dXJlcy5mbGRzLnBwcl9zdXAg
KQotICAgICAgICBzZXRfaW9tbXVfcHByX2xvZ19jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9M
X0VOQUJMRUQpOworICAgIGlmICggaW9tbXUtPm1zaS5pcnEgPiAwICkKKyAgICB7CisgICAgICAg
IHNldF9pb21tdV9ldmVudF9sb2dfY29udHJvbChpb21tdSwgSU9NTVVfQ09OVFJPTF9FTkFCTEVE
KTsKKworICAgICAgICBpZiAoIGlvbW11LT5mZWF0dXJlcy5mbGRzLnBwcl9zdXAgKQorICAgICAg
ICAgICAgc2V0X2lvbW11X3Bwcl9sb2dfY29udHJvbChpb21tdSwgSU9NTVVfQ09OVFJPTF9FTkFC
TEVEKTsKKyAgICB9CiAKICAgICBpZiAoIGlvbW11LT5mZWF0dXJlcy5mbGRzLmd0X3N1cCApCiAg
ICAgICAgIHNldF9pb21tdV9ndWVzdF90cmFuc2xhdGlvbl9jb250cm9sKGlvbW11LCBJT01NVV9D
T05UUk9MX0VOQUJMRUQpOwoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
