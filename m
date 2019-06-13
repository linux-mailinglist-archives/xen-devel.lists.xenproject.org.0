Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A5E43683
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 15:27:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbPjr-0001gc-I5; Thu, 13 Jun 2019 13:25:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbPjq-0001gR-57
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 13:25:58 +0000
X-Inumbo-ID: c4ecd0ee-8dde-11e9-a150-b7579ef144e0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4ecd0ee-8dde-11e9-a150-b7579ef144e0;
 Thu, 13 Jun 2019 13:25:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 07:25:53 -0600
Message-Id: <5D024EDF0200007800237E2B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 07:25:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
In-Reply-To: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 6/9] AMD/IOMMU: allow enabling with IRQ not yet
 set up
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
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvaW9tbXVfaW5pdC5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9p
b21tdV9pbml0LmMKQEAgLTgxNCw3ICs4MTQsNiBAQCBzdGF0aWMgdm9pZCBhbWRfaW9tbXVfZXJy
YXR1bV83NDZfd29ya2FyCiBzdGF0aWMgdm9pZCBlbmFibGVfaW9tbXUoc3RydWN0IGFtZF9pb21t
dSAqaW9tbXUpCiB7CiAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKLSAgICBzdHJ1Y3QgaXJxX2Rl
c2MgKmRlc2M7CiAKICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW9tbXUtPmxvY2ssIGZsYWdzKTsK
IApAQCAtODM0LDE5ICs4MzMsMjcgQEAgc3RhdGljIHZvaWQgZW5hYmxlX2lvbW11KHN0cnVjdCBh
bWRfaW9tbQogICAgIGlmICggaW9tbXUtPmZlYXR1cmVzLmZsZHMucHByX3N1cCApCiAgICAgICAg
IHJlZ2lzdGVyX2lvbW11X3Bwcl9sb2dfaW5fbW1pb19zcGFjZShpb21tdSk7CiAKLSAgICBkZXNj
ID0gaXJxX3RvX2Rlc2MoaW9tbXUtPm1zaS5pcnEpOwotICAgIHNwaW5fbG9jaygmZGVzYy0+bG9j
ayk7Ci0gICAgc2V0X21zaV9hZmZpbml0eShkZXNjLCAmY3B1X29ubGluZV9tYXApOwotICAgIHNw
aW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsKKyAgICBpZiAoIGlvbW11LT5tc2kuaXJxID4gMCApCisg
ICAgeworICAgICAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MgPSBpcnFfdG9fZGVzYyhpb21tdS0+
bXNpLmlycSk7CisKKyAgICAgICAgc3Bpbl9sb2NrKCZkZXNjLT5sb2NrKTsKKyAgICAgICAgc2V0
X21zaV9hZmZpbml0eShkZXNjLCAmY3B1X29ubGluZV9tYXApOworICAgICAgICBzcGluX3VubG9j
aygmZGVzYy0+bG9jayk7CisgICAgfQogCiAgICAgYW1kX2lvbW11X21zaV9lbmFibGUoaW9tbXUs
IElPTU1VX0NPTlRST0xfRU5BQkxFRCk7CiAKICAgICBzZXRfaW9tbXVfaHRfZmxhZ3MoaW9tbXUp
OwogICAgIHNldF9pb21tdV9jb21tYW5kX2J1ZmZlcl9jb250cm9sKGlvbW11LCBJT01NVV9DT05U
Uk9MX0VOQUJMRUQpOwotICAgIHNldF9pb21tdV9ldmVudF9sb2dfY29udHJvbChpb21tdSwgSU9N
TVVfQ09OVFJPTF9FTkFCTEVEKTsKIAotICAgIGlmICggaW9tbXUtPmZlYXR1cmVzLmZsZHMucHBy
X3N1cCApCi0gICAgICAgIHNldF9pb21tdV9wcHJfbG9nX2NvbnRyb2woaW9tbXUsIElPTU1VX0NP
TlRST0xfRU5BQkxFRCk7CisgICAgaWYgKCBpb21tdS0+bXNpLmlycSA+IDAgKQorICAgIHsKKyAg
ICAgICAgc2V0X2lvbW11X2V2ZW50X2xvZ19jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0VO
QUJMRUQpOworCisgICAgICAgIGlmICggaW9tbXUtPmZlYXR1cmVzLmZsZHMucHByX3N1cCApCisg
ICAgICAgICAgICBzZXRfaW9tbXVfcHByX2xvZ19jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9M
X0VOQUJMRUQpOworICAgIH0KIAogICAgIGlmICggaW9tbXUtPmZlYXR1cmVzLmZsZHMuZ3Rfc3Vw
ICkKICAgICAgICAgc2V0X2lvbW11X2d1ZXN0X3RyYW5zbGF0aW9uX2NvbnRyb2woaW9tbXUsIElP
TU1VX0NPTlRST0xfRU5BQkxFRCk7CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
