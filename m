Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B782B8B7C9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 14:01:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxVRR-0001GE-S7; Tue, 13 Aug 2019 11:58:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxVRP-0001CZ-JA
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:58:15 +0000
X-Inumbo-ID: a11f6962-bdc1-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a11f6962-bdc1-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 11:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565697495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ri6B6H9ACGRlH/dk2v31hhGkeyyFHgPRE7VTuR2uqCc=;
 b=OMyp1/0VmFez+zUAkq6gWTr8zpiCzshvSntUwXYDMPrONUWaJcJ803oc
 1kibtDwbxv0GIw40VqaD15UNUH+OwrCkjGUfOmTUktEbynev3ZJutyIdu
 v5DFIiT68Jpe8z9Xg9L2ku06ezxJ6rRNDr9yIcriQg7D/TsSIuTb6iVBQ g=;
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
IronPort-SDR: GMvXREy0Oo1jPkAYjbwAW1n3MU6nv7bCEX8gq/Uoz7xZQG152unI7QOhFTjZyn8P1gCjtToUQX
 rFaxPz4XKlbKdmKagB4eamy3XtbodfzQWGqFzVthem2FpLnwmLxWgQy5NgmIcUi6AeRBEQhqb5
 aacxE3MCHXfpJqrvBDRUxGPBjxKXcZE9MBqly4DUMgjE/NooHPo+M+hAlAj5d2YzptEBxZlS/z
 R4gAd8pkO5xkMRfTTWCgFVLbpbnRkzr10bfhEaUpekf6seJVDtQ2Ew1OD8zsLO2I4cTaaQmedr
 xwM=
X-SBRS: 2.7
X-MesageID: 4242249
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4242249"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 13 Aug 2019 12:31:05 +0100
Message-ID: <20190813113119.14804-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813113119.14804-1-anthony.perard@citrix.com>
References: <20190813113119.14804-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 21/35] OvmfPkg: Import XENMEM_memory_map
 hypercall to Xen/memory.h
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

VGhlIGluZm9ybWF0aW9ucyB0byBtYWtlIGEgWEVOTUVNX21lbW9yeV9tYXAgaHlwZXJjYWxsIGlz
IGNvcGllZCBvdmVyCmZyb20gdGhlIHB1YmxpYyBoZWFkZXIgb2YgdGhlIFhlbiBQcm9qZWN0LCB3
aXRoIHRoZSB0eXBlIG5hbWUgbW9kaWZpZWQKdG8gYnVpbGQgb24gT1ZNRi4KClJlZjogaHR0cHM6
Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5ClNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpBY2tlZC1ieTog
TGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KLS0tCgpOb3RlczoKICAgIHYzOgogICAg
LSBleHBhbmRlZCB0aGUgIlRoaXMiIHRoYXQgd2FzIHN0YXJ0aW5nIHRoZSBjb21taXQgbWVzc2Fn
ZSBib2R5LgoKIE92bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9tZW1vcnkuaCB8
IDIzICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL21lbW9y
eS5oIGIvT3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL21lbW9yeS5oCmluZGV4
IDgxZTk4MTMzMWEuLjRhMzNhMjZkNGUgMTAwNjQ0Ci0tLSBhL092bWZQa2cvSW5jbHVkZS9JbmR1
c3RyeVN0YW5kYXJkL1hlbi9tZW1vcnkuaAorKysgYi9Pdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlT
dGFuZGFyZC9YZW4vbWVtb3J5LmgKQEAgLTY1LDYgKzY1LDI5IEBAIHN0cnVjdCB4ZW5fcmVtb3Zl
X2Zyb21fcGh5c21hcCB7CiB0eXBlZGVmIHN0cnVjdCB4ZW5fcmVtb3ZlX2Zyb21fcGh5c21hcCB4
ZW5fcmVtb3ZlX2Zyb21fcGh5c21hcF90Ow0KIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9y
ZW1vdmVfZnJvbV9waHlzbWFwX3QpOw0KIA0KKy8qDQorICogUmV0dXJucyB0aGUgcHNldWRvLXBo
eXNpY2FsIG1lbW9yeSBtYXAgYXMgaXQgd2FzIHdoZW4gdGhlIGRvbWFpbg0KKyAqIHdhcyBzdGFy
dGVkIChzcGVjaWZpZWQgYnkgWEVOTUVNX3NldF9tZW1vcnlfbWFwKS4NCisgKiBhcmcgPT0gYWRk
ciBvZiB4ZW5fbWVtb3J5X21hcF90Lg0KKyAqLw0KKyNkZWZpbmUgWEVOTUVNX21lbW9yeV9tYXAg
ICAgICAgICAgIDkNCitzdHJ1Y3QgeGVuX21lbW9yeV9tYXAgew0KKyAgICAvKg0KKyAgICAgKiBP
biBjYWxsIHRoZSBudW1iZXIgb2YgZW50cmllcyB3aGljaCBjYW4gYmUgc3RvcmVkIGluIGJ1ZmZl
ci4gT24NCisgICAgICogcmV0dXJuIHRoZSBudW1iZXIgb2YgZW50cmllcyB3aGljaCBoYXZlIGJl
ZW4gc3RvcmVkIGluDQorICAgICAqIGJ1ZmZlci4NCisgICAgICovDQorICAgIFVJTlQzMiBucl9l
bnRyaWVzOw0KKw0KKyAgICAvKg0KKyAgICAgKiBFbnRyaWVzIGluIHRoZSBidWZmZXIgYXJlIGlu
IHRoZSBzYW1lIGZvcm1hdCBhcyByZXR1cm5lZCBieSB0aGUNCisgICAgICogQklPUyBJTlQgMHgx
NSBFQVg9MHhFODIwIGNhbGwuDQorICAgICAqLw0KKyAgICBYRU5fR1VFU1RfSEFORExFKHZvaWQp
IGJ1ZmZlcjsNCit9Ow0KK3R5cGVkZWYgc3RydWN0IHhlbl9tZW1vcnlfbWFwIHhlbl9tZW1vcnlf
bWFwX3Q7DQorREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX21lbW9yeV9tYXBfdCk7DQorDQog
I2VuZGlmIC8qIF9fWEVOX1BVQkxJQ19NRU1PUllfSF9fICovDQogDQogLyoNCi0tIApBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
