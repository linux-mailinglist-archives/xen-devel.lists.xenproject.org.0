Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6C5F53C9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:52:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9Kx-0007p5-DC; Fri, 08 Nov 2019 18:50:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9Kv-0007oS-Gs
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:21 +0000
X-Inumbo-ID: 982c7408-0258-11ea-adbe-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 982c7408-0258-11ea-adbe-bc764e2007e4;
 Fri, 08 Nov 2019 18:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=szQKg/Wf6Aq2GBX0kGjx+pa/nGjECUIuHHCeK+Q2KxE=;
 b=U2QFTiGZ4fXvocu9bCJZBhzTXtsv+9wceWksn+M+IVQQQaVoaxeiIgBF
 5yNmofmdfHIzEmUOcrpjUDJV+VFzrvInUZ7IaIuDTmeWwO6lHpN9nrPRQ
 GKb2MycI1TGuASM2eAXc/ehyn63m+Q/E0s24PHqe5MfelLRO4BNXrlM09 Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iuDOH+M18GYSD6pFx8G5usJ9uewfTLH8XRHI1iODnaEID7335XwoEowsI6b9ewBJbZsQ7OZkv0
 EOZYJNAWhg3jSwnCWWCmW2dFM3JjjZz5YuOI7CmZI8bC2LEQt7aYvN9+uPeqR8vg6sW98k2eQ4
 6N4rA4P9drKwSBqJZ09yxp/yF3LK30unKOgUlIeOn+aVmHHD08cLIqxbGBzdddueb7bEoGiwBE
 2hRuIJ94yp0D3WkOcSu85+AS7QSryJ6m3ng0dWi7+uwMP6s3Zfs3N7nD/7M4VYLww7vWMCudmi
 Du8=
X-SBRS: 2.7
X-MesageID: 8592080
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,283,1569297600"; 
   d="scan'208";a="8592080"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:57 +0000
Message-ID: <20191108185001.3319-10-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 09/13] sg-report-host-history: Write
 cache entries for tail, too
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bWFpbnF1ZXJ5IGZldGNoZXMgYSBudW1iZXIgb2Ygcm93cyBzdXBwb3NlZCB0byBiZSBsYXJnZXIg
dGhhbiBuZWVkZWQKZm9yIHRoZSBvdXRwdXQgbGltaXQgJGxpbWl0LiAgQW5kIHRoZW4gZm9yIGVh
Y2ggaG9zdCB3ZSBzb3J0IHRoZW0gYnkKdGltZSBvZiB0aGUgbGFzdCBzdGVwIC0gd2hpY2ggbWVh
bnMgd2UgbXVzdCBoYXZlIHRoZSBsYXN0IHN0ZXAsIHdoaWNoCmlzIGEgc2VwYXJhdGUgcXVlcnkg
Zm9yIGVhY2ggam9iLiAgV2Ugd2FudCB0byBjYWNoZSB0aGlzIGluZm9ybWF0aW9uCmV2ZW4gZm9y
IGpvYnMgd2UgZG8gbm90IGFjdHVhbGx5IHJlcG9ydCBpbiB0aGUgaHRtbCBvdXRwdXQuCgooVGhl
cmUgaXMgc3RpbGwgbm90aGluZyB3aGljaCBhY3R1YWxseSByZWFkcyB0aGlzIGNhY2hlIGRhdGEu
KQoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
Ci0tLQogc2ctcmVwb3J0LWhvc3QtaGlzdG9yeSB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NnLXJlcG9ydC1o
b3N0LWhpc3RvcnkgYi9zZy1yZXBvcnQtaG9zdC1oaXN0b3J5CmluZGV4IDMzNWVmYTFjLi43ZGNm
YWM5YSAxMDA3NTUKLS0tIGEvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeQorKysgYi9zZy1yZXBvcnQt
aG9zdC1oaXN0b3J5CkBAIC0yNjgsMTAgKzI2OCwxNSBAQCBFTkQKICAgICB9OwogCiAgICAgQHJv
d3MgPSBzb3J0IHsgJGItPntmaW5pc2hlZH0gPD0+ICRhLT57ZmluaXNoZWR9IH0gQHJvd3M7Ci0g
ICAgJCNyb3dzID0gJGxpbWl0LTEgaWYgQHJvd3MgPiAkbGltaXQ7CiAKICAgICBteSAkYWx0ZXJu
YXRlID0gMDsKKyAgICBteSAkd3JvdGUgPSAwOwogICAgIGZvcmVhY2ggbXkgJGpyIChAcm93cykg
eworCWlmICgkd3JvdGUrKyA+PSAkbGltaXQpIHsKKwkgICAgJHdyaXRlX2NhY2hlX2VudHJ5LT4o
JGpyKTsKKwkgICAgbmV4dDsKKwl9CisKICAgICAgICAgcHJpbnQgREVCVUcgIkpSICRqci0+e2Zs
aWdodH0uJGpyLT57am9ifVxuIjsKIAlteSAkaXIgPSBqb2JxdWVyeSgkaW5mb3EsICRqciwgJ2kn
KTsKIAlteSAkYXIgPSBqb2JxdWVyeSgkYWxsb2NkcSwgJGpyLCAnYScpOwotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
