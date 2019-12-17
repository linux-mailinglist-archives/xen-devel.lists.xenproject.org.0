Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DBB123717
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 21:18:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihJGA-0005L6-Hb; Tue, 17 Dec 2019 20:15:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UMsG=2H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihJG8-0005L1-GE
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 20:15:56 +0000
X-Inumbo-ID: 07c4b152-210a-11ea-8f95-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07c4b152-210a-11ea-8f95-12813bfff9fa;
 Tue, 17 Dec 2019 20:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576613755;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=SqVuq3WK2o+a50k1c3pjofbka4lGX7XJYKvhFRToDw0=;
 b=HKT4RYKmcugdMNyv9igoxwJQHp8craEBlNGj3pSDj2DbHSZxEfb+4SQL
 JZU+mMXGy2VRyMSsTSEp2fJgGfYM1iwp8bMr1gbMPVke/wFK26iEHJAkY
 4C2UegeMXoS/W2a3oTqNmRBvnWHGUC3zhkkjTr9TvTcZf7tDHCNCKtvbb I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vDt9FadEydwsACgE+mMySNFOklOOhdTIilJxFthh50QnRa3xPXdeBitGefh2rCE3YomUsrdUCM
 TSMB50KBxnjh9QWEtMykKMWYoKQYiH0YidpWpcRrFMJmoNZqkYDLURJZvLxwYr9PBmoQIM/tEO
 ufRfloub1mIEEcYlp6kZDwC0JXwsOVzZIDoKYM/K4C/2q8tAY7yOquDvVAxC0qkJYMqpuGQwph
 ZIwkNhiPnB1cqB827R6c1gbISIioNIDOyKIZxaMuKk3FaGW/LajOvmOWcQuI+3sp6fbjKtwhxa
 3Nc=
X-SBRS: 2.7
X-MesageID: 10199959
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,326,1571716800"; d="scan'208";a="10199959"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 17 Dec 2019 20:15:46 +0000
Message-ID: <20191217201550.15864-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] Don't allocate dom->p2m_host[] for
 translated domains
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Varad Gautam <vrd@amazon.de>, Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmFzdGx5IGRyb3AgeGwncyBtZW1vcnkgdXNhZ2UgZm9yIEhWTSAoeDg2IGFuZCBBUk0pIGd1ZXN0
IGNvbnN0cnVjdGlvbi4KClNlZQpodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMTU2
MjE1OTIwMi0xMTMxNi0xLWdpdC1zZW5kLWVtYWlsLXZyZEBhbWF6b24uZGUvVC8jdQpmb3IgdGhl
IG9yaWdpbnMgb2YgdGhpcyB3b3JrLCBidXQgdWx0aW1hdGVseSBJIHRoaW5rIHRoaXMgaXMgYSBm
YXIgY2xlYW5lcgpzb2x1dGlvbiB0byB0aGUgcHJvYmxlbS4KCkFuZHJldyBDb29wZXIgKDQpOgog
IHRvb2xzL2RvbWJ1aWxkZXI6IHhjX2RvbV94ODYgY2xlYW51cAogIHRvb2xzL2RvbWJ1aWxkZXI6
IFJlbW92ZSBQVi1vbmx5LCBtYW5kYXRvcnkgaG9va3MKICB0b29scy9kb21idWlsZGVyOiBSZW1v
dmUgcDJtX2d1ZXN0IGZyb20gdGhlIGNvbW1vbiBpbnRlcmZhY2UKICB0b29scy9kb21idWlsZGVy
OiBEb24ndCBhbGxvY2F0ZSBkb20tPnAybV9ob3N0W10gZm9yIHRyYW5zbGF0ZWQKICAgIGRvbWFp
bnMKCiBzdHViZG9tL2dydWIva2V4ZWMuYyAgICAgICAgIHwgIDM2ICsrKystLS0tLS0KIHRvb2xz
L2xpYnhjL2luY2x1ZGUveGNfZG9tLmggfCAgMjQgKysrLS0tLQogdG9vbHMvbGlieGMveGNfZG9t
X2FybS5jICAgICB8ICAzMCAtLS0tLS0tLQogdG9vbHMvbGlieGMveGNfZG9tX2Jvb3QuYyAgICB8
ICAgNiArLQogdG9vbHMvbGlieGMveGNfZG9tX2NvcmUuYyAgICB8ICA0MyArLS0tLS0tLS0tLQog
dG9vbHMvbGlieGMveGNfZG9tX3g4Ni5jICAgICB8IDE2NiArKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDExNCBpbnNlcnRpb25zKCsp
LCAxOTEgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
