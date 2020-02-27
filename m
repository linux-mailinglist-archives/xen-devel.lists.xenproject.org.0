Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5683C1716F8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 13:20:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7I6E-00063O-Rt; Thu, 27 Feb 2020 12:17:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGbP=4P=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j7I6D-000639-Gd
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 12:17:05 +0000
X-Inumbo-ID: 0eb1c390-595b-11ea-9c17-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0eb1c390-595b-11ea-9c17-bc764e2007e4;
 Thu, 27 Feb 2020 12:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582805822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z+JBE/qWSO5nUyB0osbzoDZoZzb91YmZWMVffW9rbmA=;
 b=FKlOzOI8bHazpWYT2YTHFd+EVrZHN7x+yuYg/CuEdYsGZEAJVO/30w2V
 GZT++/Ym87QpGvBBgCgNRvSgJIDxIz6HaM/I4DvJJXq+QnjqEsfDZs5OQ
 ngktA3//fzf1fEbhwGXTSRrxujdZtfC1V6Bs/D1Y/rWdt5SRJSAWIE4pX w=;
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
IronPort-SDR: 6HDLwN2y+PFLSalCjceQp0430N+RKVAXGxKaBmeZ9eoxZik/rbVEZ3jbYVAkz+fxyYFxuH7mJZ
 5axX9fqv83Pp1JoqMFHGPO3ll6pQ4OVxa8nPO58rylEZPX0BQyn0/EJLr2ZR2EkmbY6QwarEz/
 KLYnACqCe5Cimcim4u9y3n/4IHCvbXjv3KXlV/6PmPZT8mrItsMFa5ppWG6Sr/uULI//N0NX9O
 QfWP6GQwGz2pl0Bcl39YEIjql8T4IS8SDj8r1605Dx9gydT5AKZprEBoI443HnXDQu2MwLIjq1
 zpg=
X-SBRS: 2.7
X-MesageID: 13277764
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,492,1574139600"; d="scan'208";a="13277764"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 27 Feb 2020 12:16:45 +0000
Message-ID: <20200227121645.2601280-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227121645.2601280-1-anthony.perard@citrix.com>
References: <20200227121645.2601280-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 3/3] Memory: Only call ramblock_ptr when needed
 in qemu_ram_writeback
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
Cc: Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgcG9zc2libGUgdGhhdCBhIHJhbWJsb2NrIGRvZXNuJ3QgaGF2ZSBtZW1vcnkgdGhhdCBR
RU1VIGNhbgphY2Nlc3MsIHRoaXMgaXMgdGhlIGNhc2Ugd2l0aCB0aGUgWGVuIGh5cGVydmlzb3Iu
CgpJbiBvcmRlciB0byBhdm9pZCB0byB0cmlnZ2VyIGFuIGFzc2VydCwgb25seSBjYWxsIHJhbWJs
b2NrX3B0cigpIHdoZW4KbmVlZGVkIGluIHFlbXVfcmFtX3dyaXRlYmFjaygpLiBUaGlzIHNob3Vs
ZCBmaXggbWlncmF0aW9uIG9mIFhlbgpndWVzdHMgdGhhdCB3YXMgYnJva2VuIHdpdGggYmQxMDhh
NDRiYzI5ICgibWlncmF0aW9uOiByYW06IFN3aXRjaCB0bwpyYW0gYmxvY2sgd3JpdGViYWNrIiku
CgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KUmV2aWV3ZWQtYnk6IEp1YW4gUXVpbnRlbGEgPHF1aW50ZWxhQHJlZGhhdC5jb20+CkFja2Vk
LWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpNZXNzYWdlLUlkOiA8MjAx
OTEyMTkxNTQzMjMuMzI1MjU1LTEtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiBleGVj
LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZXhlYy5jIGIvZXhlYy5jCmluZGV4IDIzMWQ2ZTU2NDEwOS4uMGNj
NTAwZDUzYTIzIDEwMDY0NAotLS0gYS9leGVjLmMKKysrIGIvZXhlYy5jCkBAIC0yMTE2LDE0ICsy
MTE2LDEzIEBAIGludCBxZW11X3JhbV9yZXNpemUoUkFNQmxvY2sgKmJsb2NrLCByYW1fYWRkcl90
IG5ld3NpemUsIEVycm9yICoqZXJycCkKICAqLwogdm9pZCBxZW11X3JhbV93cml0ZWJhY2soUkFN
QmxvY2sgKmJsb2NrLCByYW1fYWRkcl90IHN0YXJ0LCByYW1fYWRkcl90IGxlbmd0aCkKIHsKLSAg
ICB2b2lkICphZGRyID0gcmFtYmxvY2tfcHRyKGJsb2NrLCBzdGFydCk7Ci0KICAgICAvKiBUaGUg
cmVxdWVzdGVkIHJhbmdlIHNob3VsZCBmaXQgaW4gd2l0aGluIHRoZSBibG9jayByYW5nZSAqLwog
ICAgIGdfYXNzZXJ0KChzdGFydCArIGxlbmd0aCkgPD0gYmxvY2stPnVzZWRfbGVuZ3RoKTsKIAog
I2lmZGVmIENPTkZJR19MSUJQTUVNCiAgICAgLyogVGhlIGxhY2sgb2Ygc3VwcG9ydCBmb3IgcG1l
bSBzaG91bGQgbm90IGJsb2NrIHRoZSBzeW5jICovCiAgICAgaWYgKHJhbWJsb2NrX2lzX3BtZW0o
YmxvY2spKSB7CisgICAgICAgIHZvaWQgKmFkZHIgPSByYW1ibG9ja19wdHIoYmxvY2ssIHN0YXJ0
KTsKICAgICAgICAgcG1lbV9wZXJzaXN0KGFkZHIsIGxlbmd0aCk7CiAgICAgICAgIHJldHVybjsK
ICAgICB9CkBAIC0yMTM0LDYgKzIxMzMsNyBAQCB2b2lkIHFlbXVfcmFtX3dyaXRlYmFjayhSQU1C
bG9jayAqYmxvY2ssIHJhbV9hZGRyX3Qgc3RhcnQsIHJhbV9hZGRyX3QgbGVuZ3RoKQogICAgICAg
ICAgKiBzcGVjaWZpZWQgYXMgcGVyc2lzdGVudCAob3IgaXMgbm90IG9uZSkgLSB1c2UgdGhlIG1z
eW5jLgogICAgICAgICAgKiBMZXNzIG9wdGltYWwgYnV0IHN0aWxsIGFjaGlldmVzIHRoZSBzYW1l
IGdvYWwKICAgICAgICAgICovCisgICAgICAgIHZvaWQgKmFkZHIgPSByYW1ibG9ja19wdHIoYmxv
Y2ssIHN0YXJ0KTsKICAgICAgICAgaWYgKHFlbXVfbXN5bmMoYWRkciwgbGVuZ3RoLCBibG9jay0+
ZmQpKSB7CiAgICAgICAgICAgICB3YXJuX3JlcG9ydCgiJXM6IGZhaWxlZCB0byBzeW5jIG1lbW9y
eSByYW5nZTogc3RhcnQ6ICIKICAgICAgICAgICAgICAgICAgICAgUkFNX0FERFJfRk1UICIgbGVu
Z3RoOiAiIFJBTV9BRERSX0ZNVCwKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
