Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DB4D2814
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 13:39:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIWhr-0001bF-Dq; Thu, 10 Oct 2019 11:34:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5VA=YD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iIWhq-0001bA-BB
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 11:34:06 +0000
X-Inumbo-ID: dd1e1e4a-eb51-11e9-8c93-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd1e1e4a-eb51-11e9-8c93-bc764e2007e4;
 Thu, 10 Oct 2019 11:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570707244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=far0MmFAODjWXtEw+BTYzIZzJMA+U9sUhkaF04Syf7A=;
 b=W4gGc1AQasL2axqj3EG9k51h7496QSrI8kxFWb6yGJBQeWmDz0PNYQPE
 RY+g1m0ItbRgkVjd3qoBpkkCt9vsJkALn/7tW6XEvJJVOC15RCecOqXyT
 kZR2f7orI6GHTookW5nWvT2x4BrDuG1SAto8UbFJYTNHvG+wtlvuP0X87 U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gmbEWvhzVGmNRjkxJihc8wLNH+jx1c9menS+WsKMJWfKdL6wNFecgLm8CV5328irjKhZMBdnH0
 oDo2zzSsv3huwYreIXh6/hHLZc5FJUcXSWOJ8B7Rc/KOkzxbm0jge9WuNc70sWA+Ixqg3SSbY4
 TRs9qDIyDsdRv1ZlZXFKc+ygdCCMqnN/2kGkOSenwYB9LefEO3EsbeA19quBoCfui9Gvtp8yvg
 1xX3Oh9x0qjVL7RlTzVK0vaq9tPBPeuTN57vkqnXLo9cgtkNvNWea6GQxNvQlLZwZPqKAU1JCB
 3jA=
X-SBRS: 2.7
X-MesageID: 6973867
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="6973867"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 10 Oct 2019 13:33:43 +0200
Message-ID: <20191010113345.6867-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] iommu: fixes for interrupt remapping
 enabling
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
Cc: Juergen
 Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBjb250YWluIHR3byBmaXhlcyBmb3IgaXNzdWVz
IGZvdW5kIHdoZW4gZW5hYmxpbmcKaW50ZXJydXB0IHJlbWFwcGluZyBhbmQgdGhlIElPLUFQSUMg
YWxyZWFkeSBoYXMgdW5tYXNrZWQgcGlucy4gV2hpbGUgSSdtCm5vdCBhd2FyZSBvZiBhbnkgc3lz
dGVtIG1hbGZ1bmN0aW9uaW5nIChhcGFydCBmcm9tIHJlcG9ydGluZyBJT01NVQppbnRlcnJ1cHQg
cmVtYXBwaW5nIGZhdWx0cykgSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgdGhvc2Ug
aW4KNC4xMy4KClRoZSBzZXJpZXMgY2FuIGFsc28gYmUgZm91bmQgYXQ6CgpnaXQ6Ly94ZW5iaXRz
Lnhlbi5vcmcvcGVvcGxlL3JveWdlci94ZW4uZ2l0IGlvbW11X2ludHJfdjIKClRoYW5rcywgUm9n
ZXIuCgpSb2dlciBQYXUgTW9ubmUgKDIpOgogIHgyQVBJQzogdHJhbnNsYXRlIElPLUFQSUMgZW50
cmllcyB3aGVuIGVuYWJsaW5nIHRoZSBJT01NVQogIGlvbW11OiB0cmFuc2xhdGUgSU8tQVBJQyBw
aW5zIHdoZW4gZW5hYmxpbmcgaW50ZXJydXB0IHJlbWFwcGluZwoKIHhlbi9hcmNoL3g4Ni9hcGlj
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA5ICstCiB4ZW4vYXJjaC94ODYvaW9fYXBp
Yy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYW1kL2lvbW11X2luaXQuYyAgICAgIHwgMTEgKystCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hbWQvaW9tbXVfaW50ci5jICAgICAgfCA5MCArLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYyAgICAgICAgICAgfCAzNCArKysrKystCiB4ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmggfCAgMSArCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2lvX2FwaWMuaCAgICAgICAgICAgICAgICAgfCAgMyArLQogNyBmaWxlcyBj
aGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCAxMDEgZGVsZXRpb25zKC0pCgotLSAKMi4yMy4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
