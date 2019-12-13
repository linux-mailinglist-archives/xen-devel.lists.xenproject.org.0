Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A44111E1D1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 11:20:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifi1a-0004pZ-Ad; Fri, 13 Dec 2019 10:18:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8pyZ=2D=amazon.com=prvs=24328bf02=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ifi1Y-0004pU-I4
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 10:18:16 +0000
X-Inumbo-ID: e070f21c-1d91-11ea-8ed0-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e070f21c-1d91-11ea-8ed0-12813bfff9fa;
 Fri, 13 Dec 2019 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576232296; x=1607768296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7zv2VGSpbGZKSR/YsccBpEM9LdE0rl0c7z3fPTpzpMQ=;
 b=HlTnMGppFIcLkgBZt+l3RO0Mty+kidktW8WvPVbh4UGhYZGyotJl4qsi
 /06UCBLIE4FQO6Wxo4Y1mkf5ne4WPaKAKOlEQXLkf7XqzfQDIo6FJwaL8
 ZtcJp2D1JVkCkxpkTSWQ95lvZGSyIpIwxsjUnS3g0RiTDgLZQAkgsGyfV 0=;
IronPort-SDR: wgYugDSQhhsr2B7f6XnQ+FLoy0+i9chuqyzOm5g97s1qYxDIDasCttw53REZPOcKKhpEVj7J+/
 QnJtbkK2RfHA==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; 
   d="scan'208";a="8338717"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 13 Dec 2019 10:18:15 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id E5123A1BB7; Fri, 13 Dec 2019 10:18:13 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 10:18:13 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 10:18:12 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 13 Dec 2019 10:18:10 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 10:18:09 +0000
Message-ID: <20191213101809.20784-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] public/io/ring.h: add FRONT/BACK_RING_ATTACH
 macros
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHZlcnNpb24gb2YgdGhpcyBoZWFkZXIgcHJlc2VudCBpbiB0aGUgTGludXggc291cmNlIHRy
ZWUgaGFzIGNvbnRhaW5lZApzdWNoIG1hY3JvcyBmb3Igc29tZSB0aW1lLiBUaGVzZSBtYWNyb3Ms
IGFzIHRoZSBuYW1lcyBpbXBseSwgYWxsb3cgZnJvbnQKb3IgYmFjayByaW5ncyB0byBiZSBzZXQg
dXAgZm9yIGV4aXN0ZW50IChyYXRoZXIgdGhhbiBmcmVzaGx5IGNyZWF0ZWQgYW5kCnplcm9lZCkg
c2hhcmVkIHJpbmdzLgoKVGhpcyBwYXRjaCBpcyB0byB1cGRhdGUgdGhpcywgdGhlIGNhbm9uaWNh
bCB2ZXJzaW9uIG9mIHRoZSBoZWFkZXIsIHRvCm1hdGNoIHRoZSBsYXRlc3QgZGVmaW5pdGlvbiBv
ZiB0aGVzZSBtYWNyb3MgaW4gdGhlIExpbnV4IHNvdXJjZS4KCk5PVEU6IFRoZSB3YXkgdGhlIG5l
dyBtYWNyb3MgYXJlIGRlZmluZWQgYWxsb3dzIHRoZSBGUk9OVC9CQUNLX1JJTkdfSU5JVAogICAg
ICBtYWNyb3MgdG8gYmUgcmUtZGVmaW5lZCBpbiB0ZXJtcyBvZiB0aGVtLCB0aGVyZWJ5IHJlZHVj
aW5nCiAgICAgIGR1cGxpY2F0aW9uLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVy
cmFudEBhbWF6b24uY29tPgotLS0KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4
ZW4vaW5jbHVkZS9wdWJsaWMvaW8vcmluZy5oIHwgMTYgKysrKysrKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvcHVibGljL2lvL3JpbmcuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9yaW5n
LmgKaW5kZXggYzVkNTNlMzEwMy4uZDY4NjE1YWUyZiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
cHVibGljL2lvL3JpbmcuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vcmluZy5oCkBAIC0x
NzUsMjAgKzE3NSwyNCBAQCB0eXBlZGVmIHN0cnVjdCBfX25hbWUjI19iYWNrX3JpbmcgX19uYW1l
IyNfYmFja19yaW5nX3QKICAgICAodm9pZCltZW1zZXQoKF9zKS0+X19wYWQsIDAsIHNpemVvZigo
X3MpLT5fX3BhZCkpOyAgICAgICAgICAgICAgICAgIFwKIH0gd2hpbGUoMCkKIAotI2RlZmluZSBG
Uk9OVF9SSU5HX0lOSVQoX3IsIF9zLCBfX3NpemUpIGRvIHsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAotICAgIChfciktPnJlcV9wcm9kX3B2dCA9IDA7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgIChfciktPnJzcF9jb25zID0gMDsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorI2RlZmluZSBGUk9O
VF9SSU5HX0FUVEFDSChfciwgX3MsIF9pLCBfX3NpemUpIGRvIHsgICAgICAgICAgICAgICAgICAg
ICAgXAorICAgIChfciktPnJlcV9wcm9kX3B2dCA9IChfaSk7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAorICAgIChfciktPnJzcF9jb25zID0gKF9pKTsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgIChfciktPm5yX2Vu
dHMgPSBfX1JJTkdfU0laRShfcywgX19zaXplKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAogICAgIChfciktPnNyaW5nID0gKF9zKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAogfSB3aGlsZSAoMCkKIAotI2RlZmluZSBCQUNLX1JJTkdfSU5J
VChfciwgX3MsIF9fc2l6ZSkgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAg
IChfciktPnJzcF9wcm9kX3B2dCA9IDA7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAotICAgIChfciktPnJlcV9jb25zID0gMDsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorI2RlZmluZSBGUk9OVF9SSU5HX0lOSVQo
X3IsIF9zLCBfX3NpemUpIEZST05UX1JJTkdfQVRUQUNIKF9yLCBfcywgMCwgX19zaXplKQorCisj
ZGVmaW5lIEJBQ0tfUklOR19BVFRBQ0goX3IsIF9zLCBfaSwgX19zaXplKSBkbyB7ICAgICAgICAg
ICAgICAgICAgICAgICBcCisgICAgKF9yKS0+cnNwX3Byb2RfcHZ0ID0gKF9pKTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgKF9yKS0+cmVxX2NvbnMgPSAo
X2kpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAg
KF9yKS0+bnJfZW50cyA9IF9fUklOR19TSVpFKF9zLCBfX3NpemUpOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCiAgICAgKF9yKS0+c3JpbmcgPSAoX3MpOyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiB9IHdoaWxlICgwKQogCisjZGVmaW5lIEJB
Q0tfUklOR19JTklUKF9yLCBfcywgX19zaXplKSBCQUNLX1JJTkdfQVRUQUNIKF9yLCBfcywgMCwg
X19zaXplKQorCiAvKiBIb3cgYmlnIGlzIHRoaXMgcmluZz8gKi8KICNkZWZpbmUgUklOR19TSVpF
KF9yKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
ICAgICAoKF9yKS0+bnJfZW50cykKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
