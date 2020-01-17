Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F7C140883
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 11:58:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPGa-0004tP-To; Fri, 17 Jan 2020 10:54:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isPGZ-0004sW-KH
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 10:54:15 +0000
X-Inumbo-ID: abe97ca2-3917-11ea-8e9a-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abe97ca2-3917-11ea-8e9a-bc764e2007e4;
 Fri, 17 Jan 2020 10:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579258442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jiF1/fUcVDrgXgau77P1H2MuBbFylED2F0KmBkGvr2s=;
 b=E6R4KR/ApF2wMJX9+6botW5c9lao/+cp1hEtAvOjb88ioLZkwLZ09fgl
 qss7NOp2GeB0FkLgXcYXNENOH4BJEgVKZKcRMLt59rX7fqNpS8fxBEILo
 NjpETxDBqCL9FyToqsyQVbhPNzyzGrWp8iwI0HzHuNyfyDpqqUUfzBy8z M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HPH7t11yLUKN87tdsVKkomuUZue4UJje9WK43aNJi9F3Jfgpm6M9J3qpLv1+zRXkJmKI6KxZmi
 D3vGB0Vuec4HyCJYfa1Lchr0iQvHqr7nCkI4un075A62qjCUJUy2AMa4/Q/f9UP4iFvOjb4LDD
 AiJ1NjTjbOP+m+HHPFpGWHz1Rqq/9r4Rcga1la7MBhymx8tL+AoRPj68nntVBAqwn3kMLNa4Tn
 DssVGAxaed+ODoMrMQgpF2t965Hs5LdA27jPrlOHp37QXmiPnPWmrA31z9QMfkvFKs5wTnxTgf
 lKs=
X-SBRS: 2.7
X-MesageID: 11432447
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,329,1574139600"; d="scan'208";a="11432447"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 10:53:49 +0000
Message-ID: <20200117105358.607910-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 03/12] xen/build: use $(clean) shorthand
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
bT4KLS0tCiB4ZW4vTWFrZWZpbGUgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0K
IHhlbi9SdWxlcy5tayAgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9zY3JpcHRzL0tidWlsZC5p
bmNsdWRlIHwgIDUgKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vTWFrZWZpbGUgYi94ZW4vTWFrZWZpbGUKaW5k
ZXggYzMyNmZlZTU4ODBlLi44MTQwMTExNzVmZDggMTAwNjQ0Ci0tLSBhL3hlbi9NYWtlZmlsZQor
KysgYi94ZW4vTWFrZWZpbGUKQEAgLTExNywxNCArMTE3LDE0IEBAIF9kZWJ1ZzoKIC5QSE9OWTog
X2NsZWFuCiBfY2xlYW46IGRlbGV0ZS11bmZyZXNoLWZpbGVzCiAJJChNQUtFKSAtQyB0b29scyBj
bGVhbgotCSQoTUFLRSkgLWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyBpbmNsdWRlIGNsZWFuCi0J
JChNQUtFKSAtZiAkKEJBU0VESVIpL1J1bGVzLm1rIC1DIGNvbW1vbiBjbGVhbgotCSQoTUFLRSkg
LWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyBkcml2ZXJzIGNsZWFuCi0JJChNQUtFKSAtZiAkKEJB
U0VESVIpL1J1bGVzLm1rIC1DIHhzbSBjbGVhbgotCSQoTUFLRSkgLWYgJChCQVNFRElSKS9SdWxl
cy5tayAtQyBjcnlwdG8gY2xlYW4KLQkkKE1BS0UpIC1mICQoQkFTRURJUikvUnVsZXMubWsgLUMg
YXJjaC9hcm0gY2xlYW4KLQkkKE1BS0UpIC1mICQoQkFTRURJUikvUnVsZXMubWsgLUMgYXJjaC94
ODYgY2xlYW4KLQkkKE1BS0UpIC1mICQoQkFTRURJUikvUnVsZXMubWsgLUMgdGVzdCBjbGVhbgor
CSQoTUFLRSkgJChjbGVhbikgaW5jbHVkZQorCSQoTUFLRSkgJChjbGVhbikgY29tbW9uCisJJChN
QUtFKSAkKGNsZWFuKSBkcml2ZXJzCisJJChNQUtFKSAkKGNsZWFuKSB4c20KKwkkKE1BS0UpICQo
Y2xlYW4pIGNyeXB0bworCSQoTUFLRSkgJChjbGVhbikgYXJjaC9hcm0KKwkkKE1BS0UpICQoY2xl
YW4pIGFyY2gveDg2CisJJChNQUtFKSAkKGNsZWFuKSB0ZXN0CiAJJChNQUtFKSAtZiAkKEJBU0VE
SVIpL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJDSD0k
KFNSQ0FSQ0gpIGNsZWFuCiAJZmluZCAuIFwoIC1uYW1lICIqLm8iIC1vIC1uYW1lICIuKi5kIiAt
byAtbmFtZSAiLiouZDIiIC1vIC1uYW1lICIqLmdjbm8iIFwpIC1leGVjIHJtIC1mIHt9IFw7CiAJ
cm0gLWYgaW5jbHVkZS9hc20gJChUQVJHRVQpICQoVEFSR0VUKS5neiAkKFRBUkdFVCkuZWZpICQo
VEFSR0VUKS5lZmkubWFwICQoVEFSR0VUKS1zeW1zICQoVEFSR0VUKS1zeW1zLm1hcCAqfiBjb3Jl
CmRpZmYgLS1naXQgYS94ZW4vUnVsZXMubWsgYi94ZW4vUnVsZXMubWsKaW5kZXggOGIwNGNiZGQy
NGNhLi4xMjAzMjM3MTdkODcgMTAwNjQ0Ci0tLSBhL3hlbi9SdWxlcy5taworKysgYi94ZW4vUnVs
ZXMubWsKQEAgLTE4NSw3ICsxODUsNyBAQCBGT1JDRToKIGNsZWFuOjogJChhZGRwcmVmaXggX2Ns
ZWFuXywgJChzdWJkaXItYWxsKSkKIAlybSAtZiAqLm8gLiouby50bXAgKn4gY29yZSAkKERFUFNf
Uk0pCiBfY2xlYW5fJS86IEZPUkNFCi0JJChNQUtFKSAtZiAkKEJBU0VESVIpL1J1bGVzLm1rIC1D
ICQqIGNsZWFuCisJJChNQUtFKSAkKGNsZWFuKSAkKgogCiBTUkNQQVRIIDo9ICQocGF0c3Vic3Qg
JChCQVNFRElSKS8lLCUsJChDVVJESVIpKQogCmRpZmYgLS1naXQgYS94ZW4vc2NyaXB0cy9LYnVp
bGQuaW5jbHVkZSBiL3hlbi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlCmluZGV4IGE1YzQ2MmZkOTc3
Ny4uMjQ2NWNjNDA2MGMzIDEwMDY0NAotLS0gYS94ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZQor
KysgYi94ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZQpAQCAtNSwzICs1LDggQEAKICMgY2MtaWZ2
ZXJzaW9uCiAjIFVzYWdlOiAgRVhUUkFfQ0ZMQUdTICs9ICQoY2FsbCBjYy1pZnZlcnNpb24sIC1s
dCwgMDQwMiwgLU8xKQogY2MtaWZ2ZXJzaW9uID0gJChzaGVsbCBbICQoQ09ORklHX0dDQ19WRVJT
SU9OKTAgJCgxKSAkKDIpMDAwIF0gJiYgZWNobyAkKDMpIHx8IGVjaG8gJCg0KSkKKworIyBTaG9y
dGhhbmQgZm9yICQoTUFLRSkgY2xlYW4KKyMgVXNhZ2U6CisjICQoTUFLRSkgJChjbGVhbikgZGly
CitjbGVhbiA6PSAtZiAkKEJBU0VESVIpL1J1bGVzLm1rIGNsZWFuIC1DCi0tIApBbnRob255IFBF
UkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
