Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13DBE217D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 19:12:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNK9t-0002iy-8E; Wed, 23 Oct 2019 17:10:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNK9r-0002hy-In
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 17:10:51 +0000
X-Inumbo-ID: 0a0723dc-f5b8-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a0723dc-f5b8-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571850640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YbA9SI4dXaBhkfGcxHlkutqpTm/GLo57nNWGOBv7ixE=;
 b=O1sYz/uz9u0cRepLg++FbFXDC/d24B/rJDBkx1o6e43ROlII1kjoTcZB
 5AeUM4HvZ2JHwjkRwHPXDcIQODfimc30enM/z/GLMY8j2gwhdH/2vGdGW
 YK3dOSWOfwYi85AIZPTX3GUteP7vHO6SMJ3TRaAp2E14IrjY1xya95F6u o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +vtZqGqoUm+raEUwmCYorwR5lLkJvtnxHL6GOlH02ToyVPuhlp6CN/rMtAxm3EQq/Oh+dxF0Kg
 GlULQncaiYML4ewBQPHhFmw8vsrbrSSzXV8ZVbJm1hBWbnZvDaMdHULQBv24F63GjPl5sZM7qS
 5ZxtrtueXqH188ECo187yBJTqLsIrXYijcPicDz94AeUecTNmZ1XE0PppE0TJIwHPEqV3fXzSq
 hRwyenidytqVGa72OZRnY/CQpHA9HQyQB6CgKhxUbj2aSsjXs5SEk4gNhxgbtusp8+HWAgFYvP
 mx0=
X-SBRS: 2.7
X-MesageID: 7683600
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7683600"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:26 +0100
Message-ID: <20191023164837.2700240-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 12/23] Build guest_walk* in arch/x86/mm
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

UmV3cml0ZSB0aGUgcnVsZXMgdG8gYnVpbGQgdGhlIGRpZmZlcmVudCBsZXZlbCBvZiBndWVzdCBw
YWdlIHdhbGsgc28KdGhlIHdvcmsgYW5kIHVzZSBLYnVpbGQgZnVuY3Rpb25zLgoKU2lnbmVkLW9m
Zi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L21tL01ha2VmaWxlICAgICAgICB8IDE0ICsrKysrKystLS0tLS0tCiB4ZW4vYXJj
aC94ODYvbW0vaGFwL01ha2VmaWxlICAgIHwgMTQgKysrKysrKy0tLS0tLS0KIHhlbi9hcmNoL3g4
Ni9tbS9zaGFkb3cvTWFrZWZpbGUgfCAxNCArKysrKysrLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2Vk
LCAyMSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbW0vTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUKaW5kZXggZDg3ZGMw
YWE2ZWViLi45YzZkMTRjMmZhYmIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9NYWtlZmls
ZQorKysgYi94ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUKQEAgLTExLDExICsxMSwxMSBAQCBvYmot
eSArPSBwMm0ubyBwMm0tcHQubwogb2JqLSQoQ09ORklHX0hWTSkgKz0gcDJtLWVwdC5vIHAybS1w
b2Qubwogb2JqLXkgKz0gcGFnaW5nLm8KIAotZ3Vlc3Rfd2Fsa18lLm86IGd1ZXN0X3dhbGsuYyBN
YWtlZmlsZQotCSQoQ0MpICQoQ0ZMQUdTKSAtREdVRVNUX1BBR0lOR19MRVZFTFM9JCogLWMgJDwg
LW8gJEAKKyQoZm9yZWFjaCBzZngsbyBpIHMsJChvYmopL2d1ZXN0X3dhbGtfJS4kKHNmeCkpOiBj
Y2ZsYWdzLXkgPSAtREdVRVNUX1BBR0lOR19MRVZFTFM9JCoKIAotZ3Vlc3Rfd2Fsa18lLmk6IGd1
ZXN0X3dhbGsuYyBNYWtlZmlsZQotCSQoQ1BQKSAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQo
Q0ZMQUdTKSkgLURHVUVTVF9QQUdJTkdfTEVWRUxTPSQqIC1jICQ8IC1vICRACi0KLWd1ZXN0X3dh
bGtfJS5zOiBndWVzdF93YWxrLmMgTWFrZWZpbGUKLQkkKENDKSAkKGZpbHRlci1vdXQgLVdhJChj
b21tYSklLCQoQ0ZMQUdTKSkgLURHVUVTVF9QQUdJTkdfTEVWRUxTPSQqIC1TICQ8IC1vICRACisk
KG9iaikvZ3Vlc3Rfd2Fsa18lLm86ICQoc3JjKS9ndWVzdF93YWxrLmMgRk9SQ0UKKwkkKGNhbGwg
aWZfY2hhbmdlZF9kZXAsY2Nfb19jKQorJChvYmopL2d1ZXN0X3dhbGtfJS5pOiAkKHNyYykvZ3Vl
c3Rfd2Fsay5jIEZPUkNFCisJJChjYWxsIGlmX2NoYW5nZWRfZGVwLGNwcF9pX2MpCiskKG9iaikv
Z3Vlc3Rfd2Fsa18lLnM6ICQoc3JjKS9ndWVzdF93YWxrLmMgRk9SQ0UKKwkkKGNhbGwgaWZfY2hh
bmdlZF9kZXAsY2Nfc19jKQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL2hhcC9NYWtlZmls
ZSBiL3hlbi9hcmNoL3g4Ni9tbS9oYXAvTWFrZWZpbGUKaW5kZXggYjE0YTlhZmY5M2QyLi5hMGRh
MmJmZTc3ZTYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvTWFrZWZpbGUKKysrIGIv
eGVuL2FyY2gveDg2L21tL2hhcC9NYWtlZmlsZQpAQCAtNSwxMSArNSwxMSBAQCBvYmoteSArPSBn
dWVzdF93YWxrXzRsZXZlbC5vCiBvYmoteSArPSBuZXN0ZWRfaGFwLm8KIG9iai15ICs9IG5lc3Rl
ZF9lcHQubwogCi1ndWVzdF93YWxrXyVsZXZlbC5vOiBndWVzdF93YWxrLmMgTWFrZWZpbGUKLQkk
KENDKSAkKENGTEFHUykgLURHVUVTVF9QQUdJTkdfTEVWRUxTPSQqIC1jICQ8IC1vICRACiskKGZv
cmVhY2ggc2Z4LG8gaSBzLCQob2JqKS9ndWVzdF93YWxrXyVsZXZlbC4kKHNmeCkpOiBjY2ZsYWdz
LXkgPSAtREdVRVNUX1BBR0lOR19MRVZFTFM9JCoKIAotZ3Vlc3Rfd2Fsa18lbGV2ZWwuaTogZ3Vl
c3Rfd2Fsay5jIE1ha2VmaWxlCi0JJChDUFApICQoZmlsdGVyLW91dCAtV2EkKGNvbW1hKSUsJChD
RkxBR1MpKSAtREdVRVNUX1BBR0lOR19MRVZFTFM9JCogLWMgJDwgLW8gJEAKLQotZ3Vlc3Rfd2Fs
a18lbGV2ZWwuczogZ3Vlc3Rfd2Fsay5jIE1ha2VmaWxlCi0JJChDQykgJChmaWx0ZXItb3V0IC1X
YSQoY29tbWEpJSwkKENGTEFHUykpIC1ER1VFU1RfUEFHSU5HX0xFVkVMUz0kKiAtUyAkPCAtbyAk
QAorJChvYmopL2d1ZXN0X3dhbGtfJWxldmVsLm86ICQoc3JjKS9ndWVzdF93YWxrLmMgRk9SQ0UK
KwkkKGNhbGwgaWZfY2hhbmdlZF9kZXAsY2Nfb19jKQorJChvYmopL2d1ZXN0X3dhbGtfJWxldmVs
Lmk6ICQoc3JjKS9ndWVzdF93YWxrLmMgRk9SQ0UKKwkkKGNhbGwgaWZfY2hhbmdlZF9kZXAsY3Bw
X2lfYykKKyQob2JqKS9ndWVzdF93YWxrXyVsZXZlbC5zOiAkKHNyYykvZ3Vlc3Rfd2Fsay5jIEZP
UkNFCisJJChjYWxsIGlmX2NoYW5nZWRfZGVwLGNjX3NfYykKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9tbS9zaGFkb3cvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L01ha2VmaWxl
CmluZGV4IGZmMDNhOTkzN2Y5Yi4uOGMyNjRmYWI3ZmRhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvbW0vc2hhZG93L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvTWFrZWZp
bGUKQEAgLTYsMTEgKzYsMTEgQEAgZWxzZQogb2JqLXkgKz0gbm9uZS5vCiBlbmRpZgogCi1ndWVz
dF8lLm86IG11bHRpLmMgTWFrZWZpbGUKLQkkKENDKSAkKENGTEFHUykgLURHVUVTVF9QQUdJTkdf
TEVWRUxTPSQqIC1jICQ8IC1vICRACiskKGZvcmVhY2ggc2Z4LG8gaSBzLCQob2JqKS9ndWVzdF8l
LiQoc2Z4KSk6IGNjZmxhZ3MteSA9IC1ER1VFU1RfUEFHSU5HX0xFVkVMUz0kKgogCi1ndWVzdF8l
Lmk6IG11bHRpLmMgTWFrZWZpbGUKLQkkKENQUCkgJChmaWx0ZXItb3V0IC1XYSQoY29tbWEpJSwk
KENGTEFHUykpIC1ER1VFU1RfUEFHSU5HX0xFVkVMUz0kKiAtYyAkPCAtbyAkQAotCi1ndWVzdF8l
LnM6IG11bHRpLmMgTWFrZWZpbGUKLQkkKENDKSAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQo
Q0ZMQUdTKSkgLURHVUVTVF9QQUdJTkdfTEVWRUxTPSQqIC1TICQ8IC1vICRACiskKG9iaikvZ3Vl
c3RfJS5vOiAkKHNyYykvbXVsdGkuYyBGT1JDRQorCSQoY2FsbCBpZl9jaGFuZ2VkX2RlcCxjY19v
X2MpCiskKG9iaikvZ3Vlc3RfJS5pOiAkKHNyYykvbXVsdGkuYyBGT1JDRQorCSQoY2FsbCBpZl9j
aGFuZ2VkX2RlcCxjcHBfaV9jKQorJChvYmopL2d1ZXN0XyUuczogJChzcmMpL211bHRpLmMgRk9S
Q0UKKwkkKGNhbGwgaWZfY2hhbmdlZF9kZXAsY2Nfc19jKQotLSAKQW50aG9ueSBQRVJBUkQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
