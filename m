Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A17916FDEA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:37:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ux1-00012y-D7; Wed, 26 Feb 2020 11:34:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6ux0-00012p-0h
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:34:02 +0000
X-Inumbo-ID: e1290dc3-588b-11ea-93fd-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1290dc3-588b-11ea-93fd-12813bfff9fa;
 Wed, 26 Feb 2020 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582716839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a9MG5U8ONIYkYE2MY1OAvdMQ7fu0c28GAyT3/UXdFsc=;
 b=JxCQeC0Dh6B72LBKgUwDPwIjYRdVnKKv5MGGf6qmESXzavh3YcCDxEor
 SZHV9zeOSlXykvMlTfoIV+OMoOlKZTYxH0C325n5tdmz/uJF+Tqiz771B
 Qs3nxVZ7DBYIM3dURd3iL4CLDm4TgJ/7diId2/asuqImOIsdpFTgDFtCH 4=;
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
IronPort-SDR: 4oclCoZq/c3dMpWeduTwqw45vRhj3QWtXOwCvc7FvvGyf3Hn8YhRweCKG6ddLjuOyqB3ZtWrHe
 ZT/y/18K5GaqFYCg5iI17fPtVbPdgO68byeK3SiEbqWsuMvNXqkwSDmE/nImCbX/9bmgcnB3EN
 otXglvo3I0p+n3pexLaBFEpaM1jPF1h//Wfq/N19vBDV9idntYKjsCVoFL4ckb8Gp7wVPm+i4e
 21KsQa5weKYujSs/rGiVcNGlnpSVlnr9W60jCRx1xzqbG+Wa4Di6v9K567mOrclWS81cymcSeB
 /JM=
X-SBRS: 2.7
X-MesageID: 13461760
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13461760"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:40 +0000
Message-ID: <20200226113355.2532224-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 08/23] xen/build: use $(clean) shorthand
 for clean targets
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGdtYWlsLmNvbT4KCkNvbGxlY3Qg
YWxsIHRoZSBjbGVhbiB0YXJnZXRzIGFzIHdlIGFyZSBnb2luZyB0byBtb2RpZnkgaXQgc2hvcnRs
eS4KQWxzbywgdGhpcyBpcyBpbnNwaXJlZCBieSBMaW51eCdzIEtidWlsZC4KCiJLYnVpbGQuaW5j
bHVkZSIgaXNuJ3QgaW5jbHVkZWQgYnkgIk1ha2VmaWxlIiwgYnV0IHRoZSAiX2NsZWFuIiB0YXJn
ZXQKaXMgb25seSB1c2VkIGJ5IFJ1bGVzLm1rIHdoaWNoIGluY2x1ZGUgS2J1aWxkLmluY2x1ZGUu
CgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4v
TWFrZWZpbGUgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0KIHhlbi9SdWxlcy5t
ayAgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlIHwgIDUg
KysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vTWFrZWZpbGUgYi94ZW4vTWFrZWZpbGUKaW5kZXggNzJiYzg5OTI0
NjIyLi42NWJkOTEzY2QxMzMgMTAwNjQ0Ci0tLSBhL3hlbi9NYWtlZmlsZQorKysgYi94ZW4vTWFr
ZWZpbGUKQEAgLTEyMCwxNCArMTIwLDE0IEBAIF9kZWJ1ZzoKIC5QSE9OWTogX2NsZWFuCiBfY2xl
YW46IGRlbGV0ZS11bmZyZXNoLWZpbGVzCiAJJChNQUtFKSAtQyB0b29scyBjbGVhbgotCSQoTUFL
RSkgLWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyBpbmNsdWRlIGNsZWFuCi0JJChNQUtFKSAtZiAk
KEJBU0VESVIpL1J1bGVzLm1rIC1DIGNvbW1vbiBjbGVhbgotCSQoTUFLRSkgLWYgJChCQVNFRElS
KS9SdWxlcy5tayAtQyBkcml2ZXJzIGNsZWFuCi0JJChNQUtFKSAtZiAkKEJBU0VESVIpL1J1bGVz
Lm1rIC1DIHhzbSBjbGVhbgotCSQoTUFLRSkgLWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyBjcnlw
dG8gY2xlYW4KLQkkKE1BS0UpIC1mICQoQkFTRURJUikvUnVsZXMubWsgLUMgYXJjaC9hcm0gY2xl
YW4KLQkkKE1BS0UpIC1mICQoQkFTRURJUikvUnVsZXMubWsgLUMgYXJjaC94ODYgY2xlYW4KLQkk
KE1BS0UpIC1mICQoQkFTRURJUikvUnVsZXMubWsgLUMgdGVzdCBjbGVhbgorCSQoTUFLRSkgJChj
bGVhbikgaW5jbHVkZQorCSQoTUFLRSkgJChjbGVhbikgY29tbW9uCisJJChNQUtFKSAkKGNsZWFu
KSBkcml2ZXJzCisJJChNQUtFKSAkKGNsZWFuKSB4c20KKwkkKE1BS0UpICQoY2xlYW4pIGNyeXB0
bworCSQoTUFLRSkgJChjbGVhbikgYXJjaC9hcm0KKwkkKE1BS0UpICQoY2xlYW4pIGFyY2gveDg2
CisJJChNQUtFKSAkKGNsZWFuKSB0ZXN0CiAJJChNQUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tj
b25maWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJDSD0kKFNSQ0FSQ0gpIGNs
ZWFuCiAJZmluZCAuIFwoIC1uYW1lICIqLm8iIC1vIC1uYW1lICIuKi5kIiAtbyAtbmFtZSAiLiou
ZDIiIC1vIC1uYW1lICIqLmdjbm8iIFwpIC1leGVjIHJtIC1mIHt9IFw7CiAJcm0gLWYgaW5jbHVk
ZS9hc20gJChUQVJHRVQpICQoVEFSR0VUKS5neiAkKFRBUkdFVCkuZWZpICQoVEFSR0VUKS5lZmku
bWFwICQoVEFSR0VUKS1zeW1zICQoVEFSR0VUKS1zeW1zLm1hcCAqfiBjb3JlCmRpZmYgLS1naXQg
YS94ZW4vUnVsZXMubWsgYi94ZW4vUnVsZXMubWsKaW5kZXggY2M5YzcxYmIxMzI3Li5lM2IxOTMx
OWIxZjUgMTAwNjQ0Ci0tLSBhL3hlbi9SdWxlcy5taworKysgYi94ZW4vUnVsZXMubWsKQEAgLTE4
OSw3ICsxODksNyBAQCBGT1JDRToKIGNsZWFuOjogJChhZGRwcmVmaXggX2NsZWFuXywgJChzdWJk
aXItYWxsKSkKIAlybSAtZiAqLm8gLiouby50bXAgKn4gY29yZSAkKERFUFNfUk0pCiBfY2xlYW5f
JS86IEZPUkNFCi0JJChNQUtFKSAtZiAkKEJBU0VESVIpL1J1bGVzLm1rIC1DICQqIGNsZWFuCisJ
JChNQUtFKSAkKGNsZWFuKSAkKgogCiBTUkNQQVRIIDo9ICQocGF0c3Vic3QgJChCQVNFRElSKS8l
LCUsJChDVVJESVIpKQogCmRpZmYgLS1naXQgYS94ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZSBi
L3hlbi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlCmluZGV4IGE1YzQ2MmZkOTc3Ny4uMjQ2NWNjNDA2
MGMzIDEwMDY0NAotLS0gYS94ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZQorKysgYi94ZW4vc2Ny
aXB0cy9LYnVpbGQuaW5jbHVkZQpAQCAtNSwzICs1LDggQEAKICMgY2MtaWZ2ZXJzaW9uCiAjIFVz
YWdlOiAgRVhUUkFfQ0ZMQUdTICs9ICQoY2FsbCBjYy1pZnZlcnNpb24sIC1sdCwgMDQwMiwgLU8x
KQogY2MtaWZ2ZXJzaW9uID0gJChzaGVsbCBbICQoQ09ORklHX0dDQ19WRVJTSU9OKTAgJCgxKSAk
KDIpMDAwIF0gJiYgZWNobyAkKDMpIHx8IGVjaG8gJCg0KSkKKworIyBTaG9ydGhhbmQgZm9yICQo
TUFLRSkgY2xlYW4KKyMgVXNhZ2U6CisjICQoTUFLRSkgJChjbGVhbikgZGlyCitjbGVhbiA6PSAt
ZiAkKEJBU0VESVIpL1J1bGVzLm1rIGNsZWFuIC1DCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
