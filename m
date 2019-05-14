Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E571C82E
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:07:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQW9w-00057r-IB; Tue, 14 May 2019 12:03:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQW9v-00057m-GB
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:03:51 +0000
X-Inumbo-ID: 5578b0ae-7640-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5578b0ae-7640-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:03:49 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 06:03:48 -0600
Message-Id: <5CDAAE9E020000780022E944@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 06:03:42 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] IOMMU: avoid NULL deref in iommu_lookup_page()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

THVja2lseSB0aGUgZnVuY3Rpb24gY3VycmVudGx5IGhhcyBubyBjYWxsZXJzIC0gaXQgd291bGQg
aGF2ZSBjYWxsZWQKdGhyb3VnaCBOVUxMIGZvciBib3RoIEFybSBhbmQgeDg2L0FNRC4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9t
bXUuYwpAQCAtNDA5LDcgKzQwOSw3IEBAIGludCBpb21tdV9sb29rdXBfcGFnZShzdHJ1Y3QgZG9t
YWluICpkLAogewogICAgIGNvbnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11
KGQpOwogCi0gICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29wcyApCisg
ICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29wcyB8fCAhaGQtPnBsYXRm
b3JtX29wcy0+bG9va3VwX3BhZ2UgKQogICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7CiAKICAg
ICByZXR1cm4gaGQtPnBsYXRmb3JtX29wcy0+bG9va3VwX3BhZ2UoZCwgZGZuLCBtZm4sIGZsYWdz
KTsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
