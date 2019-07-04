Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D295FA74
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:00:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3CL-0006zz-H8; Thu, 04 Jul 2019 14:58:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3CJ-0006yF-SU
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:55 +0000
X-Inumbo-ID: 3d0eecd6-9e6c-11e9-8b97-afbfad47e279
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d0eecd6-9e6c-11e9-8b97-afbfad47e279;
 Thu, 04 Jul 2019 14:58:53 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +XbzjX2jvpqVFu6In37KMpKPCDogyFCMsyBkQ/VH7FcjCZ3FZ6hqeNe6Z83iuuTLLclsPBuEza
 PJsM1kOPheRP60ao3r5+mEJs54E2jRWZJ0ktcHGef5aCCL6Y+cvFH+qXXBG8PtFNdqEGeR+wH3
 ynPMrxoCDz8DphbKR6I09f60q5hstOf4DY068RB3LqR/eR+M0qiavMxOEEsiZGMGV77sZqZc4l
 LWoAGbali+LWNh4XzCVHbpQeZmJqF2PkrhfAdKm8G9RZUu+YpcaDOs0N0/mbb9NUtFkApGa3rU
 keA=
X-SBRS: 2.7
X-MesageID: 2626073
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2626073"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:20 +0100
Message-ID: <20190704144233.27968-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 22/35] OvmfPkg: Import XENMEM_memory_map
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
IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
