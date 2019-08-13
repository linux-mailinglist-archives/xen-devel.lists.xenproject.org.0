Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294538B7CE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 14:01:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxVRM-00018P-Te; Tue, 13 Aug 2019 11:58:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxVRK-00016B-Jp
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:58:10 +0000
X-Inumbo-ID: 968dde7e-bdc1-11e9-96d2-9b42df4b5054
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 968dde7e-bdc1-11e9-96d2-9b42df4b5054;
 Tue, 13 Aug 2019 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565697477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P3vIPTrpS4WmMWZ4BMkDvYJqY5kSnzXIWfLL64j3DtM=;
 b=M/XvsDdoM0H/goAzPOqvM4CExYf6InL20yD5NOz84P4ogiiCL2RKL+lr
 bpiO0R6lYF6MXbJcpQ1uxe6fAW0Vv1E9HklwmgbJoe7PRHUfITGSHjmxw
 SitW2fTwAlu1rmN0uZRbYOvz4ruwOoVFGg1o6jsOhBZHYelSV+3Yja7Xz g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JSGYgwJynx42Wg4ESZWLvES884rRtA4gT5D8G8NRpvwt2ThABOfDSzZeYNvczJPJrrWuWG3HnR
 mLCRJF+KoXkCMPBH1J2XHd6WioSUgijYYE9oSMnsKFJJ0Gba2U5BL9RDMJGCQvgnV6jmYIPzHJ
 2zsje8OmM5IrA6YBVQ/mq0BO/FQ3ZdnQZS9aTm8a7NDiR97venpYojahWVo4B0B0Pa61pQciBp
 SdtcdQnRnZanz1yDtN7Mnl9nBm7xc/6Lhb37R8r4RRhcsovJxxBlBAqSIwJwsafewLt5355JID
 dAY=
X-SBRS: 2.7
X-MesageID: 4210839
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4210839"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 13 Aug 2019 12:31:16 +0100
Message-ID: <20190813113119.14804-33-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813113119.14804-1-anthony.perard@citrix.com>
References: <20190813113119.14804-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 32/35] OvmfPkg: Introduce PcdXenGrantFrames
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

SW50cm9kdWNlIFBjZFhlbkdyYW50RnJhbWVzIHRvIHJlcGxhY2UgYSBkZWZpbmUgaW4gWGVuQnVz
RHhlIGFuZCBhbGxvdwp0aGUgc2FtZSB2YWx1ZSB0byBiZSB1c2VkIGluIGEgZGlmZmVyZW50IG1v
ZHVsZS4KClRoZSByZWFzb24gZm9yIHRoZSBudW1iZXIgb2YgcGFnZSB0byBiZSA0IGRvZXNuJ3Qg
ZXhpc3QgYW55bW9yZSwgc28Kc2ltcGx5IHJlbW92ZSB0aGUgY29tbWVudC4KClNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpSZXZpZXdlZC1i
eTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KLS0tCgpOb3RlczoKICAgIHY1Ogog
ICAgLSBhZGQgbWlzc2luZyBQY2RMaWIgdG8gW0xpYnJhcnlDbGFzc2VzXQogICAgCiAgICB2NDoK
ICAgIC0gbmV3IHBhdGNoCgogT3ZtZlBrZy9Pdm1mUGtnLmRlYyAgICAgICAgICAgICB8IDMgKysr
CiBPdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaW5mIHwgMyArKysKIE92bWZQa2cvWGVuQnVz
RHhlL1hlbkJ1c0R4ZS5oICAgfCAxICsKIE92bWZQa2cvWGVuQnVzRHhlL0dyYW50VGFibGUuYyAg
fCAzICstLQogNCBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9Pdm1mUGtnLmRlYyBiL092bWZQa2cvT3ZtZlBrZy5kZWMK
aW5kZXggMDRkNWUyOTI3Mi4uZDVmZWU4MDVlZiAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9Pdm1mUGtn
LmRlYworKysgYi9Pdm1mUGtnL092bWZQa2cuZGVjCkBAIC0yMjUsNiArMjI1LDkgQEAgW1BjZHNG
aXhlZEF0QnVpbGRdCiAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZFhlblB2aFN0YXJ0
T2ZEYXlTdHJ1Y3RQdHJ8MHgwfFVJTlQzMnwweDE3DQogICBnVWVmaU92bWZQa2dUb2tlblNwYWNl
R3VpZC5QY2RYZW5QdmhTdGFydE9mRGF5U3RydWN0UHRyU2l6ZXwweDB8VUlOVDMyfDB4MzINCiAN
CisgICMjIE51bWJlciBvZiBwYWdlIGZyYW1lcyB0byB1c2UgZm9yIHN0b3JpbmcgZ3JhbnQgdGFi
bGUgZW50cmllcy4NCisgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZFhlbkdyYW50RnJh
bWVzfDR8VUlOVDMyfDB4MzMNCisNCiBbUGNkc0R5bmFtaWMsIFBjZHNEeW5hbWljRXhdDQogICBn
VWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RFbXVWYXJpYWJsZUV2ZW50fDB8VUlOVDY0fDIN
CiAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZE92bWZGbGFzaFZhcmlhYmxlc0VuYWJs
ZXxGQUxTRXxCT09MRUFOfDB4MTANCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5C
dXNEeGUuaW5mIGIvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuQnVzRHhlLmluZgppbmRleCA4NmUwZmI4
MjI0Li41MzZiNDlmYThjIDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUu
aW5mCisrKyBiL092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5pbmYKQEAgLTUxLDYgKzUxLDcg
QEAgW0xpYnJhcnlDbGFzc2VzXQogICBYZW5IeXBlcmNhbGxMaWINCiAgIFN5bmNocm9uaXphdGlv
bkxpYg0KICAgUHJpbnRMaWINCisgIFBjZExpYg0KIA0KIFtQcm90b2NvbHNdDQogICBnRWZpRHJp
dmVyQmluZGluZ1Byb3RvY29sR3VpZA0KQEAgLTU5LDMgKzYwLDUgQEAgW1Byb3RvY29sc10KICAg
Z1hlbkJ1c1Byb3RvY29sR3VpZA0KICAgZ1hlbklvUHJvdG9jb2xHdWlkDQogDQorW0ZpeGVkUGNk
XQ0KKyAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkWGVuR3JhbnRGcmFtZXMNCmRpZmYg
LS1naXQgYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaCBiL092bWZQa2cvWGVuQnVzRHhl
L1hlbkJ1c0R4ZS5oCmluZGV4IDg1MTAzNjFiY2EuLmIxZGNjMzU0OWMgMTAwNjQ0Ci0tLSBhL092
bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5oCisrKyBiL092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1
c0R4ZS5oCkBAIC0yMiw2ICsyMiw3IEBACiAjaW5jbHVkZSA8TGlicmFyeS9VZWZpTGliLmg+DQog
I2luY2x1ZGUgPExpYnJhcnkvRGV2aWNlUGF0aExpYi5oPg0KICNpbmNsdWRlIDxMaWJyYXJ5L0Rl
YnVnTGliLmg+DQorI2luY2x1ZGUgPExpYnJhcnkvUGNkTGliLmg+DQogDQogDQogLy8NCmRpZmYg
LS1naXQgYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9HcmFudFRhYmxlLmMgYi9Pdm1mUGtnL1hlbkJ1c0R4
ZS9HcmFudFRhYmxlLmMKaW5kZXggNjU3NWU5Yjg4Yy4uMTEzMDQwNGNkMSAxMDA2NDQKLS0tIGEv
T3ZtZlBrZy9YZW5CdXNEeGUvR3JhbnRUYWJsZS5jCisrKyBiL092bWZQa2cvWGVuQnVzRHhlL0dy
YW50VGFibGUuYwpAQCAtMjIsOCArMjIsNyBAQAogDQogI2RlZmluZSBOUl9SRVNFUlZFRF9FTlRS
SUVTIDgNCiANCi0vKiBOUl9HUkFOVF9GUkFNRVMgbXVzdCBiZSBsZXNzIHRoYW4gb3IgZXF1YWwg
dG8gdGhhdCBjb25maWd1cmVkIGluIFhlbiAqLw0KLSNkZWZpbmUgTlJfR1JBTlRfRlJBTUVTIDQN
CisjZGVmaW5lIE5SX0dSQU5UX0ZSQU1FUyAoRml4ZWRQY2RHZXQzMiAoUGNkWGVuR3JhbnRGcmFt
ZXMpKQ0KICNkZWZpbmUgTlJfR1JBTlRfRU5UUklFUyAoTlJfR1JBTlRfRlJBTUVTICogRUZJX1BB
R0VfU0laRSAvIHNpemVvZihncmFudF9lbnRyeV92MV90KSkNCiANCiBTVEFUSUMgZ3JhbnRfZW50
cnlfdjFfdCAqR3JhbnRUYWJsZSA9IE5VTEw7DQotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
