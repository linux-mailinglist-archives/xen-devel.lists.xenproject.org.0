Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9088E507C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 17:51:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO1pG-0000XI-Ij; Fri, 25 Oct 2019 15:48:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Phy=YS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iO1pF-0000XD-DK
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 15:48:29 +0000
X-Inumbo-ID: e29e36cc-f73e-11e9-8aca-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e29e36cc-f73e-11e9-8aca-bc764e2007e4;
 Fri, 25 Oct 2019 15:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572018508;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=5Z9Rg+9DW25A8Lsd1gVrSb8xdcEurfG6Z5IOqj60xLg=;
 b=Kc6EIS2oZpL6Y/jhgVIOqMQH26drJBZGM3TrPCrBusdUIgY7DdsylKjK
 aEKdMlhEt17ySLoAhhqJ/iCuE6CHnUhYUgyehU1pGP32rOd5HRL5Hq/cs
 DTgmCYTGDYykpRu5yQBJdsMAl/bKL0ZoMXEbSQgkb0/qXRShiZcq7I+P1 c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HPTYJ4sjmQ/VLPJHMUGv1FQLqEX0vXwP256KRd0BqWAXxRec67m9IuRhkHBw14DEa/ENO4IBBy
 p+GIeQgvtNpHOVu7FUGvS3ZLbMPksDDyLW4N7NsIkVesefaQhyiinx0HYFmhWNPDnLEoVHyvNJ
 sa3zSvU+iS323t/IC+hovP++CRagzD7lfCcHI1oJ1eOpM2ZdjbnT3N51w3qylK7AVuSQ89i6VW
 TiOhJwZZYuW8YrL65zgxjrqcZXXwMAfdxuKJDL60HQOBYQRil/1J5mvRjeNQ3R51G7HLJ5XiBv
 Y/o=
X-SBRS: 2.7
X-MesageID: 7439064
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7439064"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 16:48:15 +0100
Message-ID: <20191025154819.26593-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/5] make-flight: Rework
 arch_branch_filter_callback slightly
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm93IHdlIGhhdmUgdHdvIGxpc3RzIG9mIHRoaW5ncyBub3Qgc3VwcG9ydGVkIG9uIEFSTTogb25l
IG9mIGJyYW5jaGVzCndoZXJlIHRoYXQncyBpbmhlcmVudCBpbiB0aGUgYnJhbmNoIHNvbWVob3cs
IGFuZCBvbmUgZm9yIHRob3NlIHdoZXJlCnRoZSBrZXJuZWwgaXMgc2ltcGx5IHRvbyBvbGQuICBU
aGUgbGF0dGVyIGFyZSBnb2luZyB0byBkaWZmZXIgYmV0d2Vlbgphcm1oZiBhbmQgYXJtNjQuCgpO
byBmdW5jdGlvbmFsIGNoYW5nZS4KKFZlcmlmaWVkIHdpdGggc3RhbmRhbG9uZS1nZW5lcmF0ZS1k
dW1wLWZsaWdodC1ydW52YXJzLikKClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1ha2UtZmxpZ2h0IHwgNyArKysrKystCiBtZmktY29t
bW9uICB8IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWFrZS1mbGlnaHQgYi9tYWtlLWZsaWdodAppbmRleCAwMjBh
ZDVmMS4uZjkwZmU3N2MgMTAwNzU1Ci0tLSBhL21ha2UtZmxpZ2h0CisrKyBiL21ha2UtZmxpZ2h0
CkBAIC0xODksOCArMTg5LDEzIEBAIGFyY2hfYnJhbmNoX2ZpbHRlcl9jYWxsYmFjayAoKSB7CiAg
ICAgICAgIGxpbnV4LTMuNCkgcmV0dXJuIDE7OwogICAgICAgICBsaW51eC0zLjEwKSByZXR1cm4g
MTs7CiAgICAgICAgIGxpbnV4LTMuMTQpIHJldHVybiAxOzsKKyAgICAgICAgZXNhYworICAgICAg
ICA7OworICBlc2FjCisgIGNhc2UgIiRhcmNoIiBpbgorICBhcm0qKQorICAgICAgICBjYXNlICIk
YnJhbmNoIiBpbgogICAgICAgICBsaW51eC1taW5nby10aXAtbWFzdGVyKSByZXR1cm4gMTs7Ci0g
ICAgICAgIGxpbnV4LSopIDs7CiAgICAgICAgIHFlbXUtdXBzdHJlYW0tNC4yLXRlc3RpbmcpIHJl
dHVybiAxOzsKICAgICAgICAgcWVtdS11cHN0cmVhbS00LjMtdGVzdGluZykgcmV0dXJuIDE7Owog
ICAgICAgICBxZW11LXVwc3RyZWFtLTQuNC10ZXN0aW5nKSByZXR1cm4gMTs7CmRpZmYgLS1naXQg
YS9tZmktY29tbW9uIGIvbWZpLWNvbW1vbgppbmRleCA3YzAzZmZkNC4uYjQwZjA1N2UgMTAwNjQ0
Ci0tLSBhL21maS1jb21tb24KKysrIGIvbWZpLWNvbW1vbgpAQCAtMjg4LDYgKzI4OCwxMCBAQCBj
cmVhdGVfYnVpbGRfam9icyAoKSB7CiAgICAgICAiCiAgICAgICA7OwogICAgIGFybTY0KQorICAg
ICAgY2FzZSAiJGJyYW5jaCIgaW4KKyAgICAgIGxpbnV4LTMuKi10ZXN0aW5nKSBjb250aW51ZTs7
CisgICAgICBsaW51eC00LlswLTRdLXRlc3RpbmcpIGNvbnRpbnVlOzsKKyAgICAgIGVzYWMKICAg
ICAgIGNhc2UgIiR4ZW5icmFuY2giIGluCiAgICAgICB4ZW4tMy4qLXRlc3RpbmcpIGNvbnRpbnVl
OzsKICAgICAgIHhlbi00LlswLTZdLXRlc3RpbmcpIGNvbnRpbnVlOzsKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
