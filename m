Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255627FDE6
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:59:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwO-0005qC-Cw; Fri, 02 Aug 2019 15:58:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwM-0005pU-P2
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:57:58 +0000
X-Inumbo-ID: 49ce068a-b53e-11e9-830f-1be5d4030396
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49ce068a-b53e-11e9-830f-1be5d4030396;
 Fri, 02 Aug 2019 15:57:54 +0000 (UTC)
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
IronPort-SDR: s+GR/ZGdbxONnQGtnwqHbjCzTSYLXHfRiRY2TOgIgyX9zDIRKeWEaqmsBQzkUyPedCLPStvY7K
 pCR6oKVF3U0C1Id48DgCN2SAh5BIj8gK3LEIg4LUf/HgfpXu6ZcfTpfFQzIqLp9WCmqt911tVo
 sMZvDAIlvCYkJJ2q+UW/LDWvltEo6yNjl9S37PPboBq3y1GH2rIpsE0oQuudbGKbsY7vtwpZLq
 Zsf58TG7tVy43EgPxC3ntCv4U/Sls7yogKeg22it+1eP4wmM4Jxji/bcRv/mrWtbgEXOi2arza
 Hj8=
X-SBRS: 2.7
X-MesageID: 3826756
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3826756"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:45 +0100
Message-ID: <20190802153606.32061-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 14/35] libxl_domain: Convert
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgfCAyNSArKysrKysrKysrKysrKysrKyst
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2RvbWFpbi5jCmluZGV4IDUyYThiZDc4OTUuLmYzYzM5ZmE4NmYgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5j
CkBAIC02OTEsMjAgKzY5MSwzMSBAQCBzdGF0aWMgdm9pZCBkb21haW5fdW5wYXVzZV9kb25lKGxp
YnhsX19lZ2MgKmVnYywKICAgICBkbXJzLT5jYWxsYmFjayhlZ2MsIGRtcnMsIHJjKTsKIH0KIAor
c3RhdGljIHZvaWQgZG9tYWluX3VucGF1c2VfYW9fZG9uZShsaWJ4bF9fZWdjICplZ2MsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19kbV9yZXN1bWVfc3RhdGUgKiwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKTsKKwogaW50IGxpYnhs
X2RvbWFpbl91bnBhdXNlKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9hc3luY29wX2hvdyAqYW9faG93KQogewogICAg
IEFPX0NSRUFURShjdHgsIGRvbWlkLCBhb19ob3cpOwotICAgIGludCByYyA9IDA7Ci0KLSAgICBy
YyA9IGxpYnhsX19kb21haW5fdW5wYXVzZV9kZXByZWNhdGVkKGdjLCBkb21pZCk7Ci0gICAgaWYg
KHJjKSBnb3RvIG91dDsKKyAgICBsaWJ4bF9fZG1fcmVzdW1lX3N0YXRlICpkbXJzOwogCi0gICAg
bGlieGxfX2FvX2NvbXBsZXRlKGVnYywgYW8sIHJjKTsKKyAgICBHQ05FVyhkbXJzKTsKKyAgICBk
bXJzLT5hbyA9IGFvOworICAgIGRtcnMtPmRvbWlkID0gZG9taWQ7CisgICAgZG1ycy0+Y2FsbGJh
Y2sgPSBkb21haW5fdW5wYXVzZV9hb19kb25lOworICAgIGxpYnhsX19kb21haW5fdW5wYXVzZShl
Z2MsIGRtcnMpOyAvKiBtdXN0IGJlIGxhc3QgKi8KICAgICByZXR1cm4gQU9fSU5QUk9HUkVTUzsK
K30KIAotIG91dDoKLSAgICByZXR1cm4gQU9fQ1JFQVRFX0ZBSUwocmMpOworc3RhdGljIHZvaWQg
ZG9tYWluX3VucGF1c2VfYW9fZG9uZShsaWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGxpYnhsX19kbV9yZXN1bWVfc3RhdGUgKmRtcnMsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCByYykKK3sKKyAgICBTVEFURV9BT19HQyhk
bXJzLT5hbyk7CisKKyAgICBsaWJ4bF9fYW9fY29tcGxldGUoZWdjLCBhbywgcmMpOwogfQogCiBp
bnQgbGlieGxfX2RvbWFpbl9wdmNvbnRyb2xfYXZhaWxhYmxlKGxpYnhsX19nYyAqZ2MsIHVpbnQz
Ml90IGRvbWlkKQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
