Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA9AB803B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:43:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0Q3-00048H-Ps; Thu, 19 Sep 2019 17:40:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0Q2-000489-4N
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:40:38 +0000
X-Inumbo-ID: 9490b5fa-db04-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9490b5fa-db04-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=12rXzUnuMrp3VqeYzpxzKZOLkATDgfN/xp0wydxrYzE=;
 b=fkKzrNWA/EX/e4jKudrkBjrROqYAhDw7Ai8iGIVIDJ+vzHFA9C7Vcj3P
 CA6sNq42pI2uOfxerMgeYSMVVVx04bcbte7HHn+eFhtxDTdrfFvr6wEVF
 5cTIFs994I9LFqlpoW2gmqAjbT1o/ZTrNxXd7/w+p54rDdBOT9yCKjWLW k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qlCQRPSyt5TugAavAp58Sb6toaLnuq5AeiM7cEyAlPfQlvn3WJPHrywkmpdUB6rRcYI9HZP/QT
 Ptfq9Gay2urAwa2YqVHUsyO6vC/PmG48jEMFw+sVglu+Xyt2dBWKHf9hrHALNi0r6BgPMtcOmz
 J7OdwagHa/6JfkjrC8VWGwvSWGsZ1vxO3s8z79cokLBnUk0g73eddBP8H/O9L4whxfoGahBZzy
 OGiwLzs1sryLbKKGhKHdfW9ks9OcsaYx7m6YC87LYSk7zzAPOyUwyInAMr4WhRiOgPx8vvXKpt
 ERY=
X-SBRS: 2.7
X-MesageID: 5864876
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5864876"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:34 +0100
Message-ID: <20190919171656.899649-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 14/35] libxl_domain: Convert
 libxl_domain_unpause to use libxl__domain_unpause
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0
b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyB8IDI1ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG9t
YWluLmMKaW5kZXggNTJhOGJkNzg5NWNiLi5mM2MzOWZhODZmYzkgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2RvbWFpbi5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCkBA
IC02OTEsMjAgKzY5MSwzMSBAQCBzdGF0aWMgdm9pZCBkb21haW5fdW5wYXVzZV9kb25lKGxpYnhs
X19lZ2MgKmVnYywKICAgICBkbXJzLT5jYWxsYmFjayhlZ2MsIGRtcnMsIHJjKTsKIH0KIAorc3Rh
dGljIHZvaWQgZG9tYWluX3VucGF1c2VfYW9fZG9uZShsaWJ4bF9fZWdjICplZ2MsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19kbV9yZXN1bWVfc3RhdGUgKiwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKTsKKwogaW50IGxpYnhsX2Rv
bWFpbl91bnBhdXNlKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9hc3luY29wX2hvdyAqYW9faG93KQogewogICAgIEFP
X0NSRUFURShjdHgsIGRvbWlkLCBhb19ob3cpOwotICAgIGludCByYyA9IDA7Ci0KLSAgICByYyA9
IGxpYnhsX19kb21haW5fdW5wYXVzZV9kZXByZWNhdGVkKGdjLCBkb21pZCk7Ci0gICAgaWYgKHJj
KSBnb3RvIG91dDsKKyAgICBsaWJ4bF9fZG1fcmVzdW1lX3N0YXRlICpkbXJzOwogCi0gICAgbGli
eGxfX2FvX2NvbXBsZXRlKGVnYywgYW8sIHJjKTsKKyAgICBHQ05FVyhkbXJzKTsKKyAgICBkbXJz
LT5hbyA9IGFvOworICAgIGRtcnMtPmRvbWlkID0gZG9taWQ7CisgICAgZG1ycy0+Y2FsbGJhY2sg
PSBkb21haW5fdW5wYXVzZV9hb19kb25lOworICAgIGxpYnhsX19kb21haW5fdW5wYXVzZShlZ2Ms
IGRtcnMpOyAvKiBtdXN0IGJlIGxhc3QgKi8KICAgICByZXR1cm4gQU9fSU5QUk9HUkVTUzsKK30K
IAotIG91dDoKLSAgICByZXR1cm4gQU9fQ1JFQVRFX0ZBSUwocmMpOworc3RhdGljIHZvaWQgZG9t
YWluX3VucGF1c2VfYW9fZG9uZShsaWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxpYnhsX19kbV9yZXN1bWVfc3RhdGUgKmRtcnMsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGludCByYykKK3sKKyAgICBTVEFURV9BT19HQyhkbXJz
LT5hbyk7CisKKyAgICBsaWJ4bF9fYW9fY29tcGxldGUoZWdjLCBhbywgcmMpOwogfQogCiBpbnQg
bGlieGxfX2RvbWFpbl9wdmNvbnRyb2xfYXZhaWxhYmxlKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90
IGRvbWlkKQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
