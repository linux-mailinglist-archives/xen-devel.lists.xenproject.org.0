Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CC38B7CD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 14:01:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxVRJ-00014A-4q; Tue, 13 Aug 2019 11:58:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxVRG-00013K-Rb
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:58:06 +0000
X-Inumbo-ID: 9bf6bc9b-bdc1-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9bf6bc9b-bdc1-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 11:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565697486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tmHDg5K7bOiN9GtoUKgEh4wTtnn+919wHq+5xrhioI0=;
 b=ZfDTPC/mvSe5/95dtAluETmTjPVc6jv1kw/y6LskxUR0iWJBRXQd9+8/
 6leIBq8uUZes0v3BaoLaInunwHsEhgDXYdkmSAHxDl1cakMgyuli7u5f2
 +SmThYN714n1ecu6TpiKZw1/fHMUbKQ5TJN8tlzheDU8XTXU35G+6Ys+O s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v/mVwBaGG/mQEs/xWzpqEWzCH58rjRfN8J84LjSayZ/RX3cxIug+Px/k+PvhRczyDrtLFhTmEA
 T/FQNz2cF39384NGV0y0hVlvqRQ7EVlCUkvhtsVLII8O6OiISZvKJwWbX9tCM3Sqx44eIR9JyJ
 vCFs7TuWFa/YIiXMO6XIAJOXKzgvz7R8MLm5AN3DNDvM2vB5mOGKucYLo7ZUkuH5q76DHW9eyi
 nBs5wxEV2a5aszVkDUZm24QySdGL+YsvUFBTaPH8wQJfJDDx8pinbKR/y0LRPyjxge+XTUlwvW
 B/c=
X-SBRS: 2.7
X-MesageID: 4198441
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4198441"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 13 Aug 2019 12:31:06 +0100
Message-ID: <20190813113119.14804-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813113119.14804-1-anthony.perard@citrix.com>
References: <20190813113119.14804-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 22/35] OvmfPkg/XenPlatformPei: no hvmloader:
 get the E820 table via hypercall
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB0aGUgWGVuIFBWSCBlbnRyeSBwb2ludCBoYXMgYmVlbiB1c2VkLCBodm1sb2FkZXIgaGFz
bid0IHJ1biBhbmQKaGFzbid0IHByZXBhcmVkIGFuIEU4MjAgdGFibGUuIFRoZSBvbmx5IHdheSBs
ZWZ0IHRvIGdldCBhbiBFODIwIHRhYmxlCmlzIHRvIGFzayBYZW4gdmlhIGFuIGh5cGVyY2FsbC4g
IFdlIGtlZXAgdGhlIHJlc3VsdCBjYWNoZWQgdG8gYXZvaWQKbWFraW5nIGEgc2Vjb25kIGh5cGVy
Y2FsbCB3aGljaCB3b3VsZCBnaXZlIHRoZSBzYW1lIHJlc3VsdC4KClJlZjogaHR0cHM6Ly9idWd6
aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5ClNpZ25lZC1vZmYtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpBY2tlZC1ieTogTGFzemxv
IEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KLS0tCgpOb3RlczoKICAgIHY1OgogICAgLSBmaXgg
Y29tbWl0IG1lc3NhZ2UsIHRoZSBoeXBlcmNhbGwgKmNhbiogYmUgbWFkZSBzZXZlcmFsIHRpbWUs
IGJ1dCB3ZQogICAgICBzdGlsbCBjYWNoZSB0aGUgcmVzdWx0LgogICAgCiAgICB2MzoKICAgIC0g
Zml4IGNvbW1pdCBtZXNzYWdlCiAgICAtIGFkZCAnbScgcHJlZml4IHRvIHRoZSBnbG9iYWwgdmFy
aWFibGVzCiAgICAgIGFuZCBtYWtlIHRoZW0gc3RhdGljCgogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBl
aS9YZW4uYyB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9P
dm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4u
YwppbmRleCBmMjZmMGU1NmRkLi43MmY2ZjM3YjQ2IDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblBs
YXRmb3JtUGVpL1hlbi5jCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKQEAgLTI3
LDYgKzI3LDcgQEAKICNpbmNsdWRlIDxMaWJyYXJ5L010cnJMaWIuaD4NCiAjaW5jbHVkZSA8SW5k
dXN0cnlTdGFuZGFyZC9YZW4vYXJjaC14ODYvaHZtL3N0YXJ0X2luZm8uaD4NCiAjaW5jbHVkZSA8
TGlicmFyeS9YZW5IeXBlcmNhbGxMaWIuaD4NCisjaW5jbHVkZSA8SW5kdXN0cnlTdGFuZGFyZC9Y
ZW4vbWVtb3J5Lmg+DQogDQogI2luY2x1ZGUgIlBsYXRmb3JtLmgiDQogI2luY2x1ZGUgIlhlbi5o
Ig0KQEAgLTQwLDYgKzQxLDggQEAgRUZJX1hFTl9JTkZPIG1YZW5JbmZvOwogLy8gT25seSB0aGUg
RTgyMCB0YWJsZSBpcyB1c2VkIGJ5IE9WTUYuDQogLy8NCiBFRklfWEVOX09WTUZfSU5GTyAqbVhl
bkh2bWxvYWRlckluZm87DQorU1RBVElDIEVGSV9FODIwX0VOVFJZNjQgbUU4MjBFbnRyaWVzWzEy
OF07DQorU1RBVElDIFVJTlQzMiBtRTgyMEVudHJpZXNDb3VudDsNCiANCiAvKioNCiAgIFJldHVy
bnMgRTgyMCBtYXAgcHJvdmlkZWQgYnkgWGVuDQpAQCAtNTUsNiArNTgsMTIgQEAgWGVuR2V0RTgy
ME1hcCAoCiAgIFVJTlQzMiAqQ291bnQNCiAgICkNCiB7DQorICBJTlROIFJldHVybkNvZGU7DQor
ICB4ZW5fbWVtb3J5X21hcF90IFBhcmFtZXRlcnM7DQorICBVSU5UTiBMb29wSW5kZXg7DQorICBV
SU5UTiBJbmRleDsNCisgIEVGSV9FODIwX0VOVFJZNjQgVG1wRW50cnk7DQorDQogICAvLw0KICAg
Ly8gR2V0IEU4MjAgcHJvZHVjZWQgYnkgaHZtbG9hZGVyDQogICAvLw0KQEAgLTY2LDcgKzc1LDQy
IEBAIFhlbkdldEU4MjBNYXAgKAogICAgIHJldHVybiBFRklfU1VDQ0VTUzsNCiAgIH0NCiANCi0g
IHJldHVybiBFRklfTk9UX0ZPVU5EOw0KKyAgLy8NCisgIC8vIE90aGVyd2lzZSwgZ2V0IHRoZSBF
ODIwIHRhYmxlIGZyb20gdGhlIFhlbiBoeXBlcnZpc29yDQorICAvLw0KKw0KKyAgaWYgKG1FODIw
RW50cmllc0NvdW50ID4gMCkgew0KKyAgICAqRW50cmllcyA9IG1FODIwRW50cmllczsNCisgICAg
KkNvdW50ID0gbUU4MjBFbnRyaWVzQ291bnQ7DQorICAgIHJldHVybiBFRklfU1VDQ0VTUzsNCisg
IH0NCisNCisgIFBhcmFtZXRlcnMubnJfZW50cmllcyA9IDEyODsNCisgIHNldF94ZW5fZ3Vlc3Rf
aGFuZGxlIChQYXJhbWV0ZXJzLmJ1ZmZlciwgbUU4MjBFbnRyaWVzKTsNCisNCisgIC8vIFJldHVy
bnMgYSBlcnJubw0KKyAgUmV0dXJuQ29kZSA9IFhlbkh5cGVyY2FsbE1lbW9yeU9wIChYRU5NRU1f
bWVtb3J5X21hcCwgJlBhcmFtZXRlcnMpOw0KKyAgQVNTRVJUIChSZXR1cm5Db2RlID09IDApOw0K
Kw0KKyAgbUU4MjBFbnRyaWVzQ291bnQgPSBQYXJhbWV0ZXJzLm5yX2VudHJpZXM7DQorDQorICAv
Lw0KKyAgLy8gU29ydCBFODIwIGVudHJpZXMNCisgIC8vDQorICBmb3IgKExvb3BJbmRleCA9IDE7
IExvb3BJbmRleCA8IG1FODIwRW50cmllc0NvdW50OyBMb29wSW5kZXgrKykgew0KKyAgICBmb3Ig
KEluZGV4ID0gTG9vcEluZGV4OyBJbmRleCA8IG1FODIwRW50cmllc0NvdW50OyBJbmRleCsrKSB7
DQorICAgICAgaWYgKG1FODIwRW50cmllc1tJbmRleCAtIDFdLkJhc2VBZGRyID4gbUU4MjBFbnRy
aWVzW0luZGV4XS5CYXNlQWRkcikgew0KKyAgICAgICAgVG1wRW50cnkgPSBtRTgyMEVudHJpZXNb
SW5kZXhdOw0KKyAgICAgICAgbUU4MjBFbnRyaWVzW0luZGV4XSA9IG1FODIwRW50cmllc1tJbmRl
eCAtIDFdOw0KKyAgICAgICAgbUU4MjBFbnRyaWVzW0luZGV4IC0gMV0gPSBUbXBFbnRyeTsNCisg
ICAgICB9DQorICAgIH0NCisgIH0NCisNCisgICpDb3VudCA9IG1FODIwRW50cmllc0NvdW50Ow0K
KyAgKkVudHJpZXMgPSBtRTgyMEVudHJpZXM7DQorDQorICByZXR1cm4gRUZJX1NVQ0NFU1M7DQog
fQ0KIA0KIC8qKg0KLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
