Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E67EE20F6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:50:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJob-0007QC-TL; Wed, 23 Oct 2019 16:48:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNJoa-0007PW-Dv
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:48:52 +0000
X-Inumbo-ID: f7e0cd29-f5b4-11e9-9487-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7e0cd29-f5b4-11e9-9487-12813bfff9fa;
 Wed, 23 Oct 2019 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571849322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cW9QUA2andQL4O4HOUDeg7g0PmkMcoU7/GKPsef2zGA=;
 b=Z8WDYuRKVVHj9M8clRTcnx//iuwfKsjJ2RZbUQoHDtx7xzOIHKDjIpTa
 iJbtzhVwYAhCq2JJ9sCB16drBfT5leQ/6JgKSoO7rGKHIe/5NQDJULOa5
 oVgiXjXkcaxE+rn52Ms25aNcAOr9m4andaXZmYL5sGohfpmXRnHI7Zen2 Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c2ahbwj45OpwMOadhGbNZ84+8kOMCOPBapvxYAOASmEy98DV1PgFx7cj+QimQVOIyISqelgJ7Q
 92hcXNHu0MTBzg+YLvJh16q9uCAAF6pj9Wy7zxMQUnOeioogU0dbWDMzuU25AFInwAQ1I2uvDb
 gOS3MRPIwhy8mR91yMXu9ZkTnytdVbYELA+T5+yMSU6W6+siPXvQ3OrBexSLkEQXcO1dju7FmC
 hxETKjLrjruj2Xk4CVltwqCIlseAGLXbedEOuH3Ed5dYvMH2mpVOVZvZlgqjJG774ImT231Qw5
 oj4=
X-SBRS: 2.7
X-MesageID: 7427938
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7427938"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:16 +0100
Message-ID: <20191023164837.2700240-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 02/23] xen: Makefile: Remove outdated
 comment
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvbW1lbnQgY291bGQgaGF2ZSBiZWVuIHJlbW92ZWQgd2l0aAoxOGNkNDk5N2QyNmI5ZGY5
NWRkYTg3NTAzZTQxYzgyMzI3OWEwN2EwLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L01ha2VmaWxlIHwg
MSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQppbmRleCAyNDQzZmQyY2M1YmQu
LmFmNmM4M2RmYmFlNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlCisrKyBiL3hl
bi9hcmNoL3g4Ni9NYWtlZmlsZQpAQCAtMTc2LDcgKzE3Niw2IEBAIENGTEFHUy0kKFhFTl9CVUlM
RF9FRkkpICs9IC1EWEVOX0JVSUxEX0VGSQogCiAkKFRBUkdFVCkuZWZpOiBWSVJUX0JBU0UgPSAw
eCQoc2hlbGwgJChOTSkgZWZpL3JlbG9jcy1kdW1teS5vIHwgc2VkIC1uICdzLCBBIFZJUlRfU1RB
UlQkJCwscCcpCiAkKFRBUkdFVCkuZWZpOiBBTFRfQkFTRSA9IDB4JChzaGVsbCAkKE5NKSBlZmkv
cmVsb2NzLWR1bW15Lm8gfCBzZWQgLW4gJ3MsIEEgQUxUX1NUQVJUJCQsLHAnKQotIyBEb24ndCB1
c2UgJCh3aWxkY2FyZCAuLi4pIGhlcmUgLSBhdCBsZWFzdCBtYWtlIDMuODAgZXhwYW5kcyB0aGlz
IHRvbyBlYXJseSEKICQoVEFSR0VUKS5lZmk6IGd1YXJkID0gJChpZiAkKGZpbHRlciB5LCQoWEVO
X0JVSUxEX1BFKSksLDopCiAKIGlmbmVxICgkKGJ1aWxkX2lkX2xpbmtlciksKQotLSAKQW50aG9u
eSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
