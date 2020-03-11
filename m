Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE1018204C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 19:02:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC5ds-0006Mu-0I; Wed, 11 Mar 2020 17:59:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kY5a=44=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jC5dr-0006Mp-A8
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 17:59:39 +0000
X-Inumbo-ID: 12f1310e-63c2-11ea-bec1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12f1310e-63c2-11ea-bec1-bc764e2007e4;
 Wed, 11 Mar 2020 17:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583949578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iKjt09WCplqfiGEa8HyXm8pt6eoDbkC3BIkUN/SA+ug=;
 b=R4IsFviiRTFz+j0139BZp3whmTVZRWMm9Ao2GlaTzjV1khq+KIBseEXN
 UsDlFVjoSn+KPv5Ji9Smvck3rPGIsNlGePONCQm91b0Da5WlXXkYGNQrx
 +GW3CARoiq07HMzFyZkhDh5wTecSNLQztwubYamksFdf7eKnZhlIYnOQa M=;
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
IronPort-SDR: tb2awcH2P3tpiRcf0t4EhsacB2bvVURVSGSdqo+5wCQ4f7FpypGkW0rIXBR3OQZp8wxo2n5mSR
 ChKWjSl51M2JX1+Z5WrRg2ig+alWyHhZHnLF3v4uSOkrY8YNTiXisEiM1oRlDeqAmK6/QbcCTq
 PWroXD35D6h/eXcQ1+ZmDiku1rR6fba6w/8PzcOr5R1NN5fW8dMTF+77ErSN7e8yiVNiFbT5Ru
 w4ISk66ITESd2Hopkgz5ZEFtrCCedK6Og9xmMHDijui0pEVZvdiQrxYe1a7CHb5O66t4ZlYfrw
 4jM=
X-SBRS: 2.7
X-MesageID: 14131587
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14131587"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 17:59:32 +0000
Message-ID: <20200311175933.1362235-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311175933.1362235-1-anthony.perard@citrix.com>
References: <20200311175933.1362235-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 1/2] tools/python: Fix install-wrap
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBhbGxvd3MgdG8gdXNlIGluc3RhbGwtd3JhcCB3aGVuIHRoZSBzb3VyY2Ugc2NyaXB0cyBp
cyBpbiBhCnN1YmRpcmVjdG9yeS4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL3B5dGhvbi9pbnN0YWxsLXdyYXAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS90b29scy9weXRob24vaW5zdGFsbC13cmFwIGIvdG9vbHMvcHl0aG9uL2luc3RhbGwt
d3JhcAppbmRleCAwMGUyMDE0MDE2ZjkuLmZlZjI0ZTAxNzA4ZCAxMDA3NTUKLS0tIGEvdG9vbHMv
cHl0aG9uL2luc3RhbGwtd3JhcAorKysgYi90b29scy9weXRob24vaW5zdGFsbC13cmFwCkBAIC00
NCw3ICs0NCw3IEBAIHNoaWZ0CiBkZXN0Zj0iJGRlc3QiCiBmb3Igc3JjZiBpbiAke3NyY3N9OyBk
bwogCWlmIHRlc3QgLWQgIiRkZXN0IjsgdGhlbgotCQlkZXN0Zj0iJGRlc3QvJHtzcmNmJSUqL30i
CisJCWRlc3RmPSIkZGVzdC8ke3NyY2YjIyovfSIKIAlmaQogCW9yZz0iJChzZWQgLW4gJzJxOyAv
XiMhICpcL3VzclwvYmluXC9lbnYgcHl0aG9uICokL3AnICRzcmNmKSIKIAlpZiB0ZXN0ICJ4JG9y
ZyIgPSB4OyB0aGVuCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
