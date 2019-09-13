Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85554B22AB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 16:54:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8muq-0005TM-6t; Fri, 13 Sep 2019 14:51:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g+tJ=XI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i8mup-0005TD-Dt
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 14:51:15 +0000
X-Inumbo-ID: e9569524-d635-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9569524-d635-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 14:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568386265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TMDZnDSkQb+NUTB+SGoIs+MGs//spkp8cNqNd9g8ssE=;
 b=KBaY5nnE2VgJzPyW9Zf8OCQ5ceOtoJiIhXeBfQ0lxzBrfY1M5POVkZTE
 4sWjy0Ks0MkVg5qYWqJzLDFODYPlMYPgWCCf+4fx1IOH77oJHkICDo1Ah
 s2BFHqVPnsOZbCI1noTUY0f33DEaVUDYv3srYa0MIC32dCX5nr+L8KxIc Q=;
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
IronPort-SDR: 4Hql/g6wgD0dtdgcSReno+60nynt9cq3NEgkzAMMz78rXu2yIKmZTaQYh9bhI3YX/qZLFZ9N9j
 hSDZl2dEMQcHhJZMZFlh7skOsLGeXg+Vu0/72xoOy90JpjJdYPQC319Sw8bI9EiOFkgWyHJi+4
 CyqHFhx1xVqwO7o9jBNKf7eV5JCoeP8Qfwpo0/e5Wd3CEL034QC1qfTWUDqibwx2q1hYzoCVQJ
 uB2WUECwlkAVSw9crC7dIInmVuXNoqctsxSeTZeCfxGMNGkGAONcDZNpQme9eFzn3J9g9qPPSW
 /oU=
X-SBRS: 2.7
X-MesageID: 5595139
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5595139"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Fri, 13 Sep 2019 15:50:50 +0100
Message-ID: <20190913145100.303433-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913145100.303433-1-anthony.perard@citrix.com>
References: <20190913145100.303433-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 01/11] OvmfPkg/XenBusDxe: Fix missing \n in
 DEBUG messages
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
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4IG1pc3NpbmcgXG4gaW4gREVCVUcgbWVzc2FnZXMgaW4gWGVuQnVzRHhlIGFuZCB1c2UgREVC
VUdfKi4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgotLS0KIE92bWZQa2cvWGVuQnVzRHhlL0V2ZW50Q2hhbm5lbC5jIHwgMyArKy0KIE92
bWZQa2cvWGVuQnVzRHhlL1hlblN0b3JlLmMgICAgIHwgNiArKystLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL092bWZQa2cv
WGVuQnVzRHhlL0V2ZW50Q2hhbm5lbC5jIGIvT3ZtZlBrZy9YZW5CdXNEeGUvRXZlbnRDaGFubmVs
LmMKaW5kZXggNjkwMDA3MTc4Mi4uYzZiMzg3MTc4MSAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5C
dXNEeGUvRXZlbnRDaGFubmVsLmMKKysrIGIvT3ZtZlBrZy9YZW5CdXNEeGUvRXZlbnRDaGFubmVs
LmMKQEAgLTQ0LDcgKzQ0LDggQEAgWGVuQnVzRXZlbnRDaGFubmVsQWxsb2NhdGUgKAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFVlRDSE5PUF9hbGxvY191bmJvdW5kLA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJlBhcmFtZXRlcik7DQogICBpZiAoUmV0
dXJuQ29kZSAhPSAwKSB7DQotICAgIERFQlVHICgoRUZJX0RfRVJST1IsICJFUlJPUjogYWxsb2Nf
dW5ib3VuZCBmYWlsZWQgd2l0aCByYz0lZCIsIFJldHVybkNvZGUpKTsNCisgICAgREVCVUcgKChE
RUJVR19FUlJPUiwgIkVSUk9SOiBhbGxvY191bmJvdW5kIGZhaWxlZCB3aXRoIHJjPSVkXG4iLA0K
KyAgICAgICAgUmV0dXJuQ29kZSkpOw0KICAgICByZXR1cm4gUmV0dXJuQ29kZTsNCiAgIH0NCiAg
ICpQb3J0ID0gUGFyYW1ldGVyLnBvcnQ7DQpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5CdXNEeGUv
WGVuU3RvcmUuYyBiL092bWZQa2cvWGVuQnVzRHhlL1hlblN0b3JlLmMKaW5kZXggMzQ4OTBhZTQw
Yi4uNzI1M2Q4YWUzNyAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYwor
KysgYi9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5TdG9yZS5jCkBAIC03MzgsNyArNzM4LDcgQEAgWGVu
U3RvcmVSZWFkUmVwbHkgKAogICAgIFhFTlNUT1JFX1NUQVRVUyBTdGF0dXM7DQogICAgIFN0YXR1
cyA9IFhlblN0b3JlUHJvY2Vzc01lc3NhZ2UgKCk7DQogICAgIGlmIChTdGF0dXMgIT0gWEVOU1RP
UkVfU1RBVFVTX1NVQ0NFU1MgJiYgU3RhdHVzICE9IFhFTlNUT1JFX1NUQVRVU19FQUdBSU4pIHsN
Ci0gICAgICBERUJVRyAoKEVGSV9EX0VSUk9SLCAiWGVuU3RvcmUsIGVycm9yIHdoaWxlIHJlYWRp
bmcgdGhlIHJpbmcgKCVkKS4iLA0KKyAgICAgIERFQlVHICgoREVCVUdfRVJST1IsICJYZW5TdG9y
ZSwgZXJyb3Igd2hpbGUgcmVhZGluZyB0aGUgcmluZyAoJWQpLlxuIiwNCiAgICAgICAgICAgICAg
IFN0YXR1cykpOw0KICAgICAgIHJldHVybiBTdGF0dXM7DQogICAgIH0NCkBAIC0xMDc2LDcgKzEw
NzYsNyBAQCBYZW5TdG9yZURlaW5pdCAoCiAgIGlmICghSXNMaXN0RW1wdHkgKCZ4cy5SZWdpc3Rl
cmVkV2F0Y2hlcykpIHsNCiAgICAgWEVOU1RPUkVfV0FUQ0ggKldhdGNoOw0KICAgICBMSVNUX0VO
VFJZICpFbnRyeTsNCi0gICAgREVCVUcgKChFRklfRF9XQVJOLCAiWGVuU3RvcmU6IFJlZ2lzdGVy
ZWRXYXRjaGVzIGlzIG5vdCBlbXB0eSwgY2xlYW5pbmcgdXAuLi4iKSk7DQorICAgIERFQlVHICgo
REVCVUdfV0FSTiwgIlhlblN0b3JlOiBSZWdpc3RlcmVkV2F0Y2hlcyBpcyBub3QgZW1wdHksIGNs
ZWFuaW5nIHVwLi4uXG4iKSk7DQogICAgIEVudHJ5ID0gR2V0Rmlyc3ROb2RlICgmeHMuUmVnaXN0
ZXJlZFdhdGNoZXMpOw0KICAgICB3aGlsZSAoIUlzTnVsbCAoJnhzLlJlZ2lzdGVyZWRXYXRjaGVz
LCBFbnRyeSkpIHsNCiAgICAgICBXYXRjaCA9IFhFTlNUT1JFX1dBVENIX0ZST01fTElOSyAoRW50
cnkpOw0KQEAgLTEwOTIsNyArMTA5Miw3IEBAIFhlblN0b3JlRGVpbml0ICgKICAgLy8NCiAgIGlm
ICghSXNMaXN0RW1wdHkgKCZ4cy5XYXRjaEV2ZW50cykpIHsNCiAgICAgTElTVF9FTlRSWSAqRW50
cnk7DQotICAgIERFQlVHICgoRUZJX0RfV0FSTiwgIlhlblN0b3JlOiBXYXRjaEV2ZW50cyBpcyBu
b3QgZW1wdHksIGNsZWFuaW5nIHVwLi4uIikpOw0KKyAgICBERUJVRyAoKERFQlVHX1dBUk4sICJY
ZW5TdG9yZTogV2F0Y2hFdmVudHMgaXMgbm90IGVtcHR5LCBjbGVhbmluZyB1cC4uLlxuIikpOw0K
ICAgICBFbnRyeSA9IEdldEZpcnN0Tm9kZSAoJnhzLldhdGNoRXZlbnRzKTsNCiAgICAgd2hpbGUg
KCFJc051bGwgKCZ4cy5XYXRjaEV2ZW50cywgRW50cnkpKSB7DQogICAgICAgWEVOU1RPUkVfTUVT
U0FHRSAqTWVzc2FnZSA9IFhFTlNUT1JFX01FU1NBR0VfRlJPTV9MSU5LIChFbnRyeSk7DQotLSAK
QW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
