Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D5C9FDE
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 15:52:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG1Tw-0003sF-HB; Thu, 03 Oct 2019 13:49:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mAUn=X4=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iG1Tu-0003s5-QA
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 13:49:22 +0000
X-Inumbo-ID: 9a0498ae-e5e4-11e9-8c93-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a0498ae-e5e4-11e9-8c93-bc764e2007e4;
 Thu, 03 Oct 2019 13:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570110561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=sDLg3nC2Cxwgagyn+ngntRnJFisJPBjQpfzwgcGSEKE=;
 b=DsBxYNYYz5HrxbqFXpoQ5U35d7IpMvv9VZMRVlSxtSlwg2A61CBiwmnq
 7pw1W47zyrV1DJ6vCECSZwyuTDnyv8QytM9Ia4NTkXGLQ7FbrfjJoGRwz
 5XAu9bL5qzD1v2/VMOwG/PIhXY2wmz5VbrogwdVLqZkchS/ESFsIpLmt5 A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P53fo1dl2zaLficFHfxcq4vQPjGrtRMUmNiuQ+b8NikfR+hpdvd5j39k65NhY6dfuU+ObV/cLj
 MtKqxjQZO3l4YUcp9lJZiKIYwEpQUu3d0CbJVVfsS1ul3oZV/PllaDMckR9AmRH5WNbCtkTRXy
 1DbqbsfHPu4xHi9rvO9OoXgYjc3/MG6raGfAcS/x9jNe0jER8qX/nkO83moYKN9YS5xS85rZ56
 oxmoaNqGuYTw8lUERimWeuogt+6LViDRzeLREh1/beiFOfHQPri066U8N7XI0c3aszp2oY/71c
 yY0=
X-SBRS: 2.7
X-MesageID: 6416752
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,252,1566878400"; 
   d="scan'208";a="6416752"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 3 Oct 2019 14:49:14 +0100
Message-ID: <1570110555-24287-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
References: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] efi/boot: fix set_color function
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, jbeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

LSAwIGlzIGEgcG9zc2libGUgYW5kIGFsbG93ZWQgdmFsdWUgZm9yIGEgY29sb3IgbWFzayBhY2Ny
b2RpbmcgdG8KICBVRUZJIFNwZWMgMi42ICgxMS45KSBlc3BlY2lhbGx5IGZvciByZXNlcnZlZCBt
YXNrCi0gYWRkIG1pc3NpbmcgcG9pbnRlciBkZXJlZmVyZW5jZQoKV2l0aG91dCB0aGVzZSBjaGFu
Z2VzIG5vbi1UcnVlQ29sb3IgbW9kZXMgd29uJ3Qgd29yayB3aGljaCB3aWxsIGNhdXNlCkdPUCBp
bml0IHRvIGZhaWwgLSBvYnNlcnZlZCB3aGlsZSB0cnlpbmcgdG8gYm9vdCBFRkkgWGVuIHdpdGgg
Q2lycnVzIFZHQS4KClNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5p
bkBjaXRyaXguY29tPgotLS0KIHhlbi9jb21tb24vZWZpL2Jvb3QuYyB8IDggKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9lZmkvYm9vdC5jIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCmluZGV4IDlh
ODk0MTQuLjkzM2RiODggMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYworKysgYi94
ZW4vY29tbW9uL2VmaS9ib290LmMKQEAgLTExMTMsMTAgKzExMTMsMTQgQEAgc3RhdGljIGludCBf
X2luaXQgX19tYXliZV91bnVzZWQgc2V0X2NvbG9yKHUzMiBtYXNrLCBpbnQgYnBwLCB1OCAqcG9z
LCB1OCAqc3opCiAgICBpZiAoIGJwcCA8IDAgKQogICAgICAgIHJldHVybiBicHA7CiAgICBpZiAo
ICFtYXNrICkKLSAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgIHsKKyAgICAgICAqcG9zID0gMDsK
KyAgICAgICAqc3ogPSAwOworICAgICAgIHJldHVybiBicHA7CisgICB9CiAgICBmb3IgKCAqcG9z
ID0gMDsgIShtYXNrICYgMSk7ICsrKnBvcyApCiAgICAgICAgbWFzayA+Pj0gMTsKLSAgIGZvciAo
ICpzeiA9IDA7IG1hc2sgJiAxOyArK3N6KQorICAgZm9yICggKnN6ID0gMDsgbWFzayAmIDE7ICsr
KnN6KQogICAgICAgIG1hc2sgPj49IDE7CiAgICBpZiAoIG1hc2sgKQogICAgICAgIHJldHVybiAt
RUlOVkFMOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
