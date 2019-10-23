Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9180E2103
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:51:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJom-0007Yp-8M; Wed, 23 Oct 2019 16:49:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNJok-0007Xe-Fu
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:49:02 +0000
X-Inumbo-ID: f8e41540-f5b4-11e9-8aca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8e41540-f5b4-11e9-8aca-bc764e2007e4;
 Wed, 23 Oct 2019 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571849322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GbCEadOnlibfgnGlreYrGVowE/llHZXoqLw3/6FnuoI=;
 b=MIc8l1CKHe6HzX+ujHFtyM4SABbVPye7rbFO4XGV+ErAdhOruAKP7EQB
 EhZ6FzKRYxNYNczZVvfRsozGavyz790VnA2wJY4PznKJ4yxmRgQynXuky
 vQm1FZ6/+ScnKOY8Iu0+J1A3GBnKEDPHj9+SiKQJ0ym1cDAv9kwMLNmXH 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Rw/3vui0w59tSTtdvEJx/Ji/nV5bBmAp9rh7dOjJ98W5AxS1XZJ4VbYAd2TijFOHaJVJR15b0p
 kfMJT0u3ln8ewny8Lt7kW9ibhNdXTjinxvL6A7ZzIqWQXNhejhJPmlDT9x6k9HEo0EHfo8nO4O
 48hBiaqVzmw35I3YrF17MLjgCO0Sq9ueBzllOQwLp+9YJRGO2wjLokTG++jDrAqlmqV6T55J1F
 Fzu/Rn1LXcDaMXOGpc4dpvGIZhrDApkNKQVlUfv2ovHYJxXGCuZB2A+ZlpPOyV+T+1iRfwAFej
 4DQ=
X-SBRS: 2.7
X-MesageID: 7778033
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7778033"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:23 +0100
Message-ID: <20191023164837.2700240-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 09/23] xen, Kbuild: Filter-out -Wa,
 in %.s:%.c rules
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

QXMgaXQgaXMgZG9uZSBpbiB0aGUgc2FtZSBydWxlIGluIFJ1bGVzLm1rLgoKU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogeGVuL3Nj
cmlwdHMvTWFrZWZpbGUuYnVpbGQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vc2NyaXB0cy9NYWtlZmlsZS5idWls
ZCBiL3hlbi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkCmluZGV4IDY4YjUwNGM5YmRjNS4uYzhlZjUy
MjIwYTYxIDEwMDY0NAotLS0gYS94ZW4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZAorKysgYi94ZW4v
c2NyaXB0cy9NYWtlZmlsZS5idWlsZApAQCAtMTA4LDcgKzEwOCw3IEBAIG1vZGtlcm5fY2ZsYWdz
ID0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiBxdWlldF9tb2R0
YWcgPSAkKGlmICQocGFydC1vZi1tb2R1bGUpLFtNXSwgICApCiAKIHF1aWV0X2NtZF9jY19zX2Mg
PSBDQyAkKHF1aWV0X21vZHRhZykgICRACi0gICAgICBjbWRfY2Nfc19jID0gJChDQykgJChmaWx0
ZXItb3V0ICQoREVCVUdfQ0ZMQUdTKSwgJChjX2ZsYWdzKSkgJChESVNBQkxFX0xUTykgLWZ2ZXJi
b3NlLWFzbSAtUyAtbyAkQCAkPAorICAgICAgY21kX2NjX3NfYyA9ICQoQ0MpICQoZmlsdGVyLW91
dCAkKERFQlVHX0NGTEFHUykgLVdhJChjb21tYSklLCAkKGNfZmxhZ3MpKSAkKERJU0FCTEVfTFRP
KSAtZnZlcmJvc2UtYXNtIC1TIC1vICRAICQ8CiAKICQob2JqKS8lLnM6ICQoc3JjKS8lLmMgRk9S
Q0UKIAkkKGNhbGwgaWZfY2hhbmdlZF9kZXAsY2Nfc19jKQotLSAKQW50aG9ueSBQRVJBUkQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
