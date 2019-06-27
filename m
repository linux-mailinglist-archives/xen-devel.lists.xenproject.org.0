Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB358579
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 17:23:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgWDk-00047P-0D; Thu, 27 Jun 2019 15:21:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgWDi-000477-A3
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 15:21:54 +0000
X-Inumbo-ID: 49322442-98ef-11e9-b39e-57debe6df649
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49322442-98ef-11e9-b39e-57debe6df649;
 Thu, 27 Jun 2019 15:21:51 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 27 Jun 2019 09:21:50 -0600
Message-Id: <5D14DF08020000780023B98A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 27 Jun 2019 09:21:44 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
In-Reply-To: <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 06/10] AMD/IOMMU: split amd_iommu_init_one()
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

TWFwcGluZyB0aGUgTU1JTyBzcGFjZSBhbmQgb2J0YWluaW5nIGZlYXR1cmUgaW5mb3JtYXRpb24g
bmVlZHMgdG8gaGFwcGVuCnNsaWdodGx5IGVhcmxpZXIsIHN1Y2ggdGhhdCBmb3IgeDJBUElDIHN1
cHBvcnQgd2UgY2FuIHNldCBYVEVuIHByaW9yIHRvCmNhbGxpbmcgYW1kX2lvbW11X3VwZGF0ZV9p
dnJzX21hcHBpbmdfYWNwaSgpIGFuZAphbWRfaW9tbXVfc2V0dXBfaW9hcGljX3JlbWFwcGluZygp
LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdl
ZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCi0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwpAQCAtOTcwLDE0ICs5NzAsNiBAQCBzdGF0aWMg
dm9pZCAqIF9faW5pdCBhbGxvY2F0ZV9wcHJfbG9nKHN0CiAKIHN0YXRpYyBpbnQgX19pbml0IGFt
ZF9pb21tdV9pbml0X29uZShzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSkKIHsKLSAgICBpZiAoIG1h
cF9pb21tdV9tbWlvX3JlZ2lvbihpb21tdSkgIT0gMCApCi0gICAgICAgIGdvdG8gZXJyb3Jfb3V0
OwotCi0gICAgZ2V0X2lvbW11X2ZlYXR1cmVzKGlvbW11KTsKLQotICAgIGlmICggaW9tbXUtPmZl
YXR1cmVzLnJhdyApCi0gICAgICAgIGlvbW11djJfZW5hYmxlZCA9IDE7Ci0KICAgICBpZiAoIGFs
bG9jYXRlX2NtZF9idWZmZXIoaW9tbXUpID09IE5VTEwgKQogICAgICAgICBnb3RvIGVycm9yX291
dDsKIApAQCAtMTE5Nyw2ICsxMTg5LDIzIEBAIHN0YXRpYyBib29sX3QgX19pbml0IGFtZF9zcDUx
MDBfZXJyYXR1bTIKICAgICByZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBfX2luaXQgYW1kX2lv
bW11X3ByZXBhcmVfb25lKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQoreworICAgIGludCByYyA9
IGFsbG9jX2l2cnNfbWFwcGluZ3MoaW9tbXUtPnNlZyk7CisKKyAgICBpZiAoICFyYyApCisgICAg
ICAgIHJjID0gbWFwX2lvbW11X21taW9fcmVnaW9uKGlvbW11KTsKKyAgICBpZiAoIHJjICkKKyAg
ICAgICAgcmV0dXJuIHJjOworCisgICAgZ2V0X2lvbW11X2ZlYXR1cmVzKGlvbW11KTsKKworICAg
IGlmICggaW9tbXUtPmZlYXR1cmVzLnJhdyApCisgICAgICAgIGlvbW11djJfZW5hYmxlZCA9IHRy
dWU7CisKKyAgICByZXR1cm4gMDsKK30KKwogaW50IF9faW5pdCBhbWRfaW9tbXVfaW5pdCh2b2lk
KQogewogICAgIHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11OwpAQCAtMTIyNyw3ICsxMjM2LDcgQEAg
aW50IF9faW5pdCBhbWRfaW9tbXVfaW5pdCh2b2lkKQogICAgIHJhZGl4X3RyZWVfaW5pdCgmaXZy
c19tYXBzKTsKICAgICBmb3JfZWFjaF9hbWRfaW9tbXUgKCBpb21tdSApCiAgICAgewotICAgICAg
ICByYyA9IGFsbG9jX2l2cnNfbWFwcGluZ3MoaW9tbXUtPnNlZyk7CisgICAgICAgIHJjID0gYW1k
X2lvbW11X3ByZXBhcmVfb25lKGlvbW11KTsKICAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAg
ICBnb3RvIGVycm9yX291dDsKICAgICB9CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
