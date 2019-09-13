Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDACAB2323
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 17:13:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8nDX-0008GI-0W; Fri, 13 Sep 2019 15:10:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g+tJ=XI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i8nDV-0008G8-4V
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 15:10:33 +0000
X-Inumbo-ID: 9f57229d-d638-11e9-95ae-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f57229d-d638-11e9-95ae-12813bfff9fa;
 Fri, 13 Sep 2019 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568387430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ITFjy2x5OkCUAwDcBerVqJU99vxj+sJ3ZPgRNJRyHgA=;
 b=e0WzgLkxhsvTzVA1LIZc8PPhRHABtCRkpGcydQRmSKLoMGXxFKjDaxex
 alVkNPs9iTdV6cD9W+3awNu/xmO2LkWy4AgE5GsNEEVQLpGN2HAPsnmII
 jD637lHnPSMOh/Y9fc68CQ23mOhUk5Iav6l2ACTPA3XRj+0arMeMhCJwB M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PUnTOLPs7rYqw+c+YwXX8tZtyXnY5cBfdAscbIj91Eq/nzPnOuK1SD3HhKlSe6GNvBVJwNYVzZ
 WBjQh6+m1mpmXKa3xQ3Ys3Uw+MKjJpVzQIINYuTbIzTsnwzEZoLYB38EJK02c4+T4qFYVPGaBh
 uyX6Cck5/AsUjg1ANjuuOnvayEa6qVjZn9InIWCyxNbr7im2Fl8+toiBEWxLY0r393iNuF/Vrr
 HXqr1oeCJEswBs5476XmRCCdfLpGqiCerwnlaFZz+VKxfpb/eD5sEB5/HvRdMUoeuocu3/pwg7
 soc=
X-SBRS: 2.7
X-MesageID: 5740999
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5740999"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Fri, 13 Sep 2019 15:51:00 +0100
Message-ID: <20190913145100.303433-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913145100.303433-1-anthony.perard@citrix.com>
References: <20190913145100.303433-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 11/11] OvmfPkg/XenBusDxe: Fix
 XenStoreWaitForEvent use during EBS
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

WGVuU3RvcmVXYWl0Rm9yRXZlbnQgaXMgZ29pbmcgdG8gYmUgY2FsbGVkIHdoZW4gdGhlIEV4aXRC
b290U2VydmljZXMKaXMgc2lnbmFsZWQsIGJ1dCBib3RoIENyZWF0ZUV2ZW50IGFuZCBXYWl0Rm9y
RXZlbnQgY2FuJ3QgYmUgdXNlZC4KQ3JlYXRlRXZlbnQgYWxsb2NhdGUgc29tZSBtZW1vcnkgYW5k
IFdhaXRGb3JFdmVudCBjYW4gb25seSBiZSB1c2VkCndoZW4gVFBMIGlzIFRQTF9BUFBMSUNBVElP
Ti4KCldoZW4gRXhpdEJvb3RTZXJ2aWNlcyBoYXMgYmVlbiBjYWxsZWQsIHNpbXBseSByZXR1cm4g
aW1tZWRpYXRlbHkgYW5kCmxldCBjYWxsZXIgb2YgWGVuU3RvcmVXYWl0Rm9yRXZlbnQgZG8gYSBi
dXN5IGxvb3AuCgpBbHNvIGNsZWFudXAgZXJyb3IgaGFuZGxpbmcgaW4gWGVuU3RvcmVXYWl0Rm9y
RXZlbnQsIFdhaXRGb3JFdmVudApzaG91bGRuJ3QgcmV0dXJuIEVGSV9VTlNVUFBPUlRFRCBhbnlt
b3JlLgoKUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lk
PTIxOTAKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+Ci0tLQogT3ZtZlBrZy9YZW5CdXNEeGUvWGVuQnVzRHhlLmMgfCAgMiArKwogT3ZtZlBr
Zy9YZW5CdXNEeGUvWGVuQnVzRHhlLmggfCAgMSArCiBPdm1mUGtnL1hlbkJ1c0R4ZS9YZW5TdG9y
ZS5jICB8IDEzICsrKysrKysrKy0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNE
eGUuYyBiL092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5jCmluZGV4IGM3MTk2NmE2NjYuLmVi
MTUwM2FkMmIgMTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5jCisrKyBi
L092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5jCkBAIC0yNjQsNiArMjY0LDggQEAgTm90aWZ5
RXhpdEJvb3QgKAogDQogICBEZXYgPSBDb250ZXh0Ow0KIA0KKyAgRGV2LT5FeGl0Qm9vdE5vdGlm
aWVkID0gVFJVRTsNCisNCiAgIC8vDQogICAvLyBGaXJzdCwgYXNrIGV2ZXJ5IGRyaXZlciB1c2lu
ZyB4ZW5idXMgdG8gZGlzY29ubmVjdCB3aXRob3V0DQogICAvLyBkZWFsbG9jYXRpbmcgbWVtb3J5
Lg0KZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5oIGIvT3ZtZlBrZy9Y
ZW5CdXNEeGUvWGVuQnVzRHhlLmgKaW5kZXggMGU5MWMyNDMzOC4uODAxNjJmYzNmZiAxMDA2NDQK
LS0tIGEvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuQnVzRHhlLmgKKysrIGIvT3ZtZlBrZy9YZW5CdXNE
eGUvWGVuQnVzRHhlLmgKQEAgLTc5LDYgKzc5LDcgQEAgc3RydWN0IF9YRU5CVVNfREVWSUNFIHsK
ICAgRUZJX0hBTkRMRSAgICAgICAgICAgICAgICAgICAgQ29udHJvbGxlckhhbmRsZTsNCiAgIFhF
TklPX1BST1RPQ09MICAgICAgICAgICAgICAgICpYZW5JbzsNCiAgIEVGSV9FVkVOVCAgICAgICAg
ICAgICAgICAgICAgIEV4aXRCb290RXZlbnQ7DQorICBCT09MRUFOICAgICAgICAgICAgICAgICAg
ICAgICBFeGl0Qm9vdE5vdGlmaWVkOw0KICAgRUZJX0RFVklDRV9QQVRIX1BST1RPQ09MICAgICAg
KkRldmljZVBhdGg7DQogICBMSVNUX0VOVFJZICAgICAgICAgICAgICAgICAgICBDaGlsZExpc3Q7
DQogDQpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYyBiL092bWZQa2cv
WGVuQnVzRHhlL1hlblN0b3JlLmMKaW5kZXggNDAyNmM4YTgyOS4uNGYxMjYxMDlkNCAxMDA2NDQK
LS0tIGEvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYworKysgYi9Pdm1mUGtnL1hlbkJ1c0R4
ZS9YZW5TdG9yZS5jCkBAIC00MDEsMTcgKzQwMSwyMiBAQCBYZW5TdG9yZVdhaXRGb3JFdmVudCAo
CiAgIEVGSV9FVkVOVCBUaW1lckV2ZW50Ow0KICAgRUZJX0VWRU5UIFdhaXRMaXN0WzJdOw0KIA0K
KyAgLy8NCisgIC8vIElmIHRoZSBFeGl0Qm9vdFNlcnZpY2VzIGV2ZW50IGhhdmUgYmVlbiBzaWdu
YWxlZCwgc2ltcGx5IGFsbG93IHRvIGhhdmUNCisgIC8vIGJ1c3kgbG9vcCBpbiB0aGUgY2FsbGVy
Lg0KKyAgLy8NCisgIGlmICh4cy5EZXYtPkV4aXRCb290Tm90aWZpZWQpIHsNCisgICAgcmV0dXJu
IEVGSV9TVUNDRVNTOw0KKyAgfQ0KKw0KICAgZ0JTLT5DcmVhdGVFdmVudCAoRVZUX1RJTUVSLCAw
LCBOVUxMLCBOVUxMLCAmVGltZXJFdmVudCk7DQogICBnQlMtPlNldFRpbWVyIChUaW1lckV2ZW50
LCBUaW1lclJlbGF0aXZlLCBUaW1lb3V0KTsNCiANCiAgIFdhaXRMaXN0WzBdID0geHMuRXZlbnRD
aGFubmVsRXZlbnQ7DQogICBXYWl0TGlzdFsxXSA9IFRpbWVyRXZlbnQ7DQogICBTdGF0dXMgPSBn
QlMtPldhaXRGb3JFdmVudCAoMiwgV2FpdExpc3QsICZJbmRleCk7DQotICBBU1NFUlQgKFN0YXR1
cyAhPSBFRklfSU5WQUxJRF9QQVJBTUVURVIpOw0KKyAgQVNTRVJUX0VGSV9FUlJPUiAoU3RhdHVz
KTsNCiAgIGdCUy0+Q2xvc2VFdmVudCAoVGltZXJFdmVudCk7DQotICBpZiAoU3RhdHVzID09IEVG
SV9VTlNVUFBPUlRFRCkgew0KLSAgICByZXR1cm4gRUZJX1NVQ0NFU1M7DQotICB9DQogICBpZiAo
SW5kZXggPT0gMSkgew0KICAgICByZXR1cm4gRUZJX1RJTUVPVVQ7DQogICB9IGVsc2Ugew0KLS0g
CkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
