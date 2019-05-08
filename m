Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7E117A95
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 15:27:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMYS-0000da-3n; Wed, 08 May 2019 13:24:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Ps6=TI=citrix.com=prvs=0248bffa7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hOMYQ-0000dL-M5
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:24:14 +0000
X-Inumbo-ID: 920e8179-7194-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 920e8179-7194-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 13:24:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,446,1549929600"; d="scan'208";a="85265435"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 8 May 2019 14:23:58 +0100
Message-ID: <20190508132403.1454-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/5] iommu groups + cleanup
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgaXMgYSBtaXh0dXJlIG9mIHRpZHlpbmcgYW5kIHNvbWUgcHJlcGFyYXRvcnkg
d29yayBmb3IgZ3JvdXBpbmcKUENJIGRldmljZXMgZm9yIHRoZSBwdXJwb3NlcyBvZiBhc3NpZ25t
ZW50LgoKUGF1bCBEdXJyYW50ICg1KToKICBpb21tdTogdHJpdmlhbCByZS1vcmdhbmlzYXRpb24g
dG8gYXZvaWQgdW5uZWNlc3NhcnkgdGVzdAogIGlvbW11IC8geDg2OiBtb3ZlIGNhbGwgdG8gc2Nh
bl9wY2lfZGV2aWNlcygpIG91dCBvZiB2ZW5kb3IgY29kZQogIGlvbW11OiBtb3ZlIGlvbW11X2dl
dF9vcHMoKSBpbnRvIGNvbW1vbiBjb2RlCiAgaW9tbXU6IGludHJvZHVjZSBpb21tdV9ncm91cHMK
ICBpb21tdSAvIHBjaTogcmUtaW1wbGVtZW50IFhFTl9ET01DVExfZ2V0X2RldmljZV9ncm91cC4u
LgoKIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgfCAgIDMgKy0K
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jICAgICAgICAgfCAgMTcgLS0tCiB4
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jICAgICAgICAgIHwgICAyICstCiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jICAgICAgICAgICAgIHwgMTYwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jICAgICAgICAg
ICAgICAgfCAgNTAgKy0tLS0tLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZXh0ZXJu
LmggICAgICAgIHwgICAxIC0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jICAg
ICAgICAgfCAgIDggKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jICAgICAg
ICAgfCAgMjUgKysrLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaCAgICAgICAgICAgICAg
ICAgfCAgIDMgLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oICAgICAgICAgICAgICAgICB8
ICAyMCArKy0tCiB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgICAgICAgICAgICAgIHwg
IDEyICsrKwogeGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MyArCiAxMiBmaWxlcyBjaGFuZ2VkLCAyMDQgaW5zZXJ0aW9ucygrKSwgMTAwIGRlbGV0aW9ucygt
KQotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBC
cmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3Jn
ZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFN1cmF2ZWUgU3V0
aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+CkNjOiBUaW0gRGVlZ2Fu
IDx0aW1AeGVuLm9yZz4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
