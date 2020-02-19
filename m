Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E1616433C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 12:22:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4NNn-00019K-9i; Wed, 19 Feb 2020 11:19:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4NNm-00019F-01
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 11:19:10 +0000
X-Inumbo-ID: a5881a74-5309-11ea-ade5-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5881a74-5309-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582111148;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zCmKs9h2O/do2KEhX6tjsIUbwjr+ps54yuHOsAQjLME=;
 b=Mq2pHGYpwXTmvNoBFoR5EuuvV4OCePrckPsbPScOnGbk+O2yFofkhwte
 +MxE19ybbIt5ZyspbcsKIsv95YJBfc4o9zOw42UqJeTVeYyOWpxcn7waP
 eGvOTVEvL39mZK1ywwQ1ahmZFSibWVEOeO8eSqobaqezLBjgcW9wwll5V M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: o+xzUE+b2cn1zOnk0HiVy1FvWH37BAQBzaqStpUw6aGMNbRlaJ0On8dmxatp7wzW4MvwpZwlhJ
 evJji6bAaSUQafVI/mzLj1QrMiG42DEpcfu53TnTURLreJd3zScXMj2+FK1COjmhUvhPyUYjcU
 FHsWIIw8a9vgPDLYJlrs+8Kkfsxn9uim2icMxAV3IDsjhwxldIq6c4fQRtQKPp4rv4HPGUj3je
 RcztMy51pZgLT4o4CJNeXpyTpZP+QQma9Qm2NMtC7z2l6Lif3HHmfokE+DRDitzTSYe+pTxGN3
 bf8=
X-SBRS: 2.7
X-MesageID: 13113641
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,459,1574139600"; d="scan'208";a="13113641"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 12:19:04 +0100
Message-ID: <20200219111904.82092-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] amd/iommu: add missing unlock in iommu_read_log
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVwb3J0ZWQtYnk6IENvdmVyaXR5CkNJRDogMTQ1ODYzMgpGaXhlczogNzA5ZDNkZGVhMmQ1ZSAo
J0FNRC9JT01NVTogQ29tbW9uIHRoZSAjNzMyLyM3MzMgZXJyYXRhIGhhbmRsaW5nIGluIGlvbW11
X3JlYWRfbG9nKCknKQpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5j
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYW1kL2lvbW11X2luaXQuYwppbmRleCA0Yzg2ODQ4YzUyLi5lOTNhMDkwODMwIDEwMDY0
NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCisrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKQEAgLTMzOCw2ICszMzgsNyBA
QCBzdGF0aWMgaW50IGlvbW11X3JlYWRfbG9nKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LAogICAg
ICAgICAgICAgewogICAgICAgICAgICAgICAgIEFNRF9JT01NVV9ERUJVRygiQU1ELVZpOiBObyBl
bnRyeSB3cml0dGVuIHRvICVzIExvZ1xuIiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbG9nID09ICZpb21tdS0+ZXZlbnRfbG9nID8gIkV2ZW50IiA6ICJQUFIiKTsKKyAgICAgICAg
ICAgICAgICBzcGluX3VubG9jaygmbG9nLT5sb2NrKTsKICAgICAgICAgICAgICAgICByZXR1cm4g
MDsKICAgICAgICAgICAgIH0KICAgICAgICAgICAgIHVkZWxheSgxKTsKLS0gCjIuMjUuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
