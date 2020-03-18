Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38F018A0FA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 17:55:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEbvI-00034O-Ql; Wed, 18 Mar 2020 16:52:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=93oG=5D=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jEbvG-00034J-Ip
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 16:52:03 +0000
X-Inumbo-ID: c8dea8ea-6938-11ea-bec1-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8dea8ea-6938-11ea-bec1-bc764e2007e4;
 Wed, 18 Mar 2020 16:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1584550319;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=xDgpVcbzapP21ijAN3+ec8LB3Fi9zhIlDcJVbBf3Tbs=;
 b=YaUeqYjl5vDdzcQsALnieImI385ZnOCxrkEJ6g4ng7qCqwA5tLXKx+0LchIEROUFPy
 e0xe41aKxamlhw/tLfUmFKpuZsSA8pLPQICx4LGSZGTS7S1s4JjeGl0YZBBcYoCIzWvO
 Ik+P3QvJXquXEafcFocKhFQYO2/iu7zJMMYawFoQE1GJEgxpTi6V/7FJtOy662HhNutD
 WqvphwPxV3per+fQu66xc6vw/HNW/lQUVjNmVTDZW+gjBlUaqwi2YLVZf0QUTJS+nkBu
 im+wtPHCLlBa06SzY+Iwq2shaTFdnOIKT9h+SLWe6QRYWZKqaC0Cl26tfxM06UwzMlbb
 pyDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS329Ojw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id u021a0w2IGpwIyV
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 18 Mar 2020 17:51:58 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 18 Mar 2020 17:51:51 +0100
Message-Id: <20200318165151.21443-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] libxl: Fix xl shutdown for HVM without PV
 drivers
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
Cc: Olaf Hering <olaf@aepfle.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSByZXR1cm4gdmFsdWUgb2YgemVybyBtZWFucyBubyBQViBkcml2ZXJzLiBSZXN0b3JlIGEgaHVu
ayB3aGljaCB3YXMgcmVtb3ZlZC4KCkZpeGVzIGNvbW1pdCBiMTgzZTE4MGJjZTkzMDM3ZDNlZjM4
NWE4YzIzMzhiYmZiN2YyM2Q5CgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBm
bGUuZGU+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgfCAzICsrKwogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2Rv
bWFpbi5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMKaW5kZXggNDFkMDgzOTRmMy4uZmVm
MmNkNGUxMyAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMKKysrIGIvdG9v
bHMvbGlieGwvbGlieGxfZG9tYWluLmMKQEAgLTc3NCw2ICs3NzQsOSBAQCBpbnQgbGlieGxfX2Rv
bWFpbl9wdmNvbnRyb2wobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9feHN3YWl0X3N0YXRlICpwdmNv
bnRyb2wsCiAgICAgaWYgKHJjIDwgMCkKICAgICAgICAgcmV0dXJuIHJjOwogCisgICAgaWYgKCFy
YykKKyAgICAgICAgcmV0dXJuIEVSUk9SX05PUEFSQVZJUlQ7CisKICAgICBzaHV0ZG93bl9wYXRo
ID0gbGlieGxfX2RvbWFpbl9wdmNvbnRyb2xfeHNwYXRoKGdjLCBkb21pZCk7CiAgICAgaWYgKCFz
aHV0ZG93bl9wYXRoKQogICAgICAgICByZXR1cm4gRVJST1JfRkFJTDsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
