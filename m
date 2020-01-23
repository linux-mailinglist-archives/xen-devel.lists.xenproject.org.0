Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A023B146ED2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 17:59:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iufmy-0001p7-Da; Thu, 23 Jan 2020 16:57:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v8qs=3M=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iufmx-0001p1-Mq
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 16:57:03 +0000
X-Inumbo-ID: 5bd4406e-3e01-11ea-b833-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bd4406e-3e01-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579798615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AtfjXvfSDM1IWdlEIS7xtZPo7vY6NTr1Jown5zj6XR8=;
 b=dHOTmzVLWR58K5W8rs1Qr1QD2yvwlNoAhyEPh9H+1jZbVUst9dQthqQ+
 CN1CgNySYJ1LezFxBDEObnRuD9+dzmezAG6U5KxCJGFUISFRnuXXLPHvo
 0Nl4ss7ym/04U8bJay7CMVv2x2q2os3ALVP3JBiAUmA3gSI5Gqdpdudvk Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BfvwJKhLXgSBZ6Pb7ptSmjSK1NqkCd88P2DYOifO/v5K3tuFGxR6MrdNLkqE+Ee+BDd0OImOvn
 ARToMjc6IzQpixEqRvQ8nxpFYPRD0wO0IIQQ+ciH9vbgY7ZH3V0Ha5u0+MaY2MkkDBIn4IHCXs
 PrhKmqI3TH+bh04zUwpB3B2XaP5z+fVJbP1RzdH3NVPMYBrD1kStlLiOL6eZLmM59zBfBffgRq
 ta5xggJEsxzYBOIgTcMFTWjmy9XP1mM2CFQjrCU/27McVODejI1RStYQMcuTzO3BTErcLAv+cg
 LnA=
X-SBRS: 2.7
X-MesageID: 11515331
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11515331"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 23 Jan 2020 16:56:46 +0000
Message-ID: <20200123165646.1273172-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH] libxl: Fix comment about dcs.sdss
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

VGhlIGZpZWxkICdzZHNzJyB3YXMgbmFtZWQgJ2Rtc3MnIGJlZm9yZSwgY29tbWl0IDMxNDhiZWJi
ZjBhYiBkaWQgdGhlCnJlbmFtZWQgYnV0IGRpZG4ndCB1cGRhdGUgdGhlIGNvbW1lbnQuCgpGaXhl
czogMzE0OGJlYmJmMGFiICgibGlieGw6IHJlbmFtZSBhIGZpZWxkIGluIGxpYnhsX19kb21haW5f
Y3JlYXRlX3N0YXRlIikKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRl
cm5hbC5oCmluZGV4IGQ5MTlmOTE4ODI2ZC4uMzg3ZTdhNmE4NjBkIDEwMDY0NAotLS0gYS90b29s
cy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFs
LmgKQEAgLTQxNDQsNyArNDE0NCw3IEBAIHN0cnVjdCBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9zdGF0
ZSB7CiAgICAgbGlieGxfX2NoZWNrcG9pbnRfZGV2aWNlc19zdGF0ZSBjZHM7CiAgICAgbGlieGxf
X2Jvb3Rsb2FkZXJfc3RhdGUgYmw7CiAgICAgbGlieGxfX3N0dWJfZG1fc3Bhd25fc3RhdGUgc2Rz
czsKLSAgICAgICAgLyogSWYgd2UncmUgbm90IGRvaW5nIHN0dWJkb20sIHdlIHVzZSBvbmx5IGRt
c3MuZG0sCisgICAgICAgIC8qIElmIHdlJ3JlIG5vdCBkb2luZyBzdHViZG9tLCB3ZSB1c2Ugb25s
eSBzZHNzLmRtLAogICAgICAgICAgKiBmb3IgdGhlIG5vbi1zdHViZG9tIGRldmljZSBtb2RlbC4g
Ki8KICAgICBsaWJ4bF9fc3RyZWFtX3JlYWRfc3RhdGUgc3JzOwogICAgIC8qIG5lY2Vzc2FyeSBp
ZiB0aGUgZG9tYWluIGNyZWF0aW9uIGZhaWxlZCBhbmQgd2UgaGF2ZSB0byBkZXN0cm95IGl0ICov
Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
