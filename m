Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F36BFCCD0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 19:08:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVJVN-0004Y5-LR; Thu, 14 Nov 2019 18:06:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MiuJ=ZG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iVJVM-0004Xy-5g
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 18:06:04 +0000
X-Inumbo-ID: 6a3534b3-0709-11ea-a251-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a3534b3-0709-11ea-a251-12813bfff9fa;
 Thu, 14 Nov 2019 18:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573754762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b5l6kW3JJj33ifOcDExWuv5xBpN4MhJcX3sQQ9rwrWI=;
 b=YkNsG2TZHET2EKhk9yslNiX3qEh/iiFL4qr+ojE0xcW7qlWBf4Ecm8R+
 qBz0dNI0C23tJmwZ+00DJhbuwPh3IXlSJ1NNZ6VGA6iGZYwIO+ywxoEiR
 yaAC8F99TvG4yLWP5ZTVBMGNVjUcA5Lx5lXyZzqf9i1xpA03U3ZwoCxGP E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1JhQeh+/BOIP0pARLIONSsKLdLJtdaOsTylwN3hEei5VduvCZODef+tbiXt8KBG0z3HdEGxPiP
 ZaHI+rXeNMnFyntMnal06y9cqct6e2+xOt0l0JIXzs30eY5IBFayilbDEYGkKNNRxaue4s0wLL
 CYB/q2zhNqQ0UrD5BSGBidhvdVkL1pO/kvx6M5pqDK9JAfBWDcNHFbudogwpTSN9QrWN8loOZy
 xderdhnLlTKv8U8/1QP1wydiwhAGaaHCFibYEtNHpPKsystWfVC+r+1lbpU52BwuVD5hzACwXV
 jxA=
X-SBRS: 2.7
X-MesageID: 8342789
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,304,1569297600"; 
   d="scan'208";a="8342789"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 14 Nov 2019 18:05:42 +0000
Message-ID: <20191114180542.1016867-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13] xen: Fix race to build
 arch/x86/efi/relocs-dummy.o
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCAkKFRBUkdFVCkuZWZpIGRlcGVuZGluZyBvbiBlZmkvcmVsb2NzLWR1bW15Lm8sIGFyY2gv
eDg2L01ha2VmaWxlCndpbGwgYXR0ZW1wdCB0byBidWlsZCB0aGF0IG9iamVjdC4gVGhpcyByZXN1
bHQgaW4gdGhlIGRlcGVuZGVuY3kgZmlsZQpiZWVuIGdlbmVyYXRlZCB3aXRoIHJlbG9jcy1kdW1t
eS5vIGRlcGVuZGluZyBvbiBlZmkvcmVsb2NzLWR1bW15Lm8uCgpUaGVuLCB3aGVuIGFyY2gveDg2
L2VmaS9NYWtlZmlsZSB0cmllcyB0byBidWlsZCByZWxvY3MtZHVtbXkubywgd2VsbAplZmkvcmVs
b2NzLWR1bW15LlMgZG9lc24ndCBleGlzdC4KCkhhdmUgb25seSBvbmUgbWFrZWZpbGUgcmVzcG9u
c2libGUgZm9yIGJ1aWxkaW5nIHJlbG9jcy1kdW1teS5vLgoKU2lnbmVkLW9mZi1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L01h
a2VmaWxlIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4
Ni9NYWtlZmlsZQppbmRleCA1ZTZiOWQ3MDI4ZGIuLmE2ZGYxOWU5MDFiMyAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQpAQCAtMjE5
LDggKzIxOSw4IEBAICQoVEFSR0VUKS5lZmk6IHByZWxpbmstZWZpLm8gJChub3RlX2ZpbGUpIGVm
aS5sZHMgZWZpL3JlbG9jcy1kdW1teS5vIGVmaS9ta3JlbG9jCiAJCXwgJChCQVNFRElSKS90b29s
cy9zeW1ib2xzIC0teGVuc3ltcyAtLXN5c3YgLS1zb3J0ID4kKEBEKS8kKEBGKS5tYXA7IGZpCiAJ
cm0gLWYgJChARCkvLiQoQEYpLlswLTldKiAkKEBEKS8uLiQoQEYpLlswLTldKgogCi1lZmkvYm9v
dC5pbml0Lm8gZWZpL3J1bnRpbWUubyBlZmkvY29tcGF0Lm8gZWZpL2J1aWxkaWQubzogJChCQVNF
RElSKS9hcmNoL3g4Ni9lZmkvYnVpbHRfaW4ubwotZWZpL2Jvb3QuaW5pdC5vIGVmaS9ydW50aW1l
Lm8gZWZpL2NvbXBhdC5vIGVmaS9idWlsZGlkLm86IDsKK2VmaS9ib290LmluaXQubyBlZmkvcnVu
dGltZS5vIGVmaS9jb21wYXQubyBlZmkvYnVpbGRpZC5vIGVmaS9yZWxvY3MtZHVtbXkubzogJChC
QVNFRElSKS9hcmNoL3g4Ni9lZmkvYnVpbHRfaW4ubworZWZpL2Jvb3QuaW5pdC5vIGVmaS9ydW50
aW1lLm8gZWZpL2NvbXBhdC5vIGVmaS9idWlsZGlkLm8gZWZpL3JlbG9jcy1kdW1teS5vOiA7CiAK
IGFzbS1vZmZzZXRzLnM6ICQoVEFSR0VUX1NVQkFSQ0gpL2FzbS1vZmZzZXRzLmMgJChCQVNFRElS
KS9pbmNsdWRlL2FzbS14ODYvYXNtLW1hY3Jvcy5oCiAJJChDQykgJChmaWx0ZXItb3V0IC1XYSQo
Y29tbWEpJSAtZmx0bywkKENGTEFHUykpIC1TIC1vICRAICQ8Ci0tIApBbnRob255IFBFUkFSRAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
