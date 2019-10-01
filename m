Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B6C2FD6
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:15:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFECj-0004FD-5g; Tue, 01 Oct 2019 09:12:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFECi-0004F6-7y
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:12:20 +0000
X-Inumbo-ID: 90fe7ffb-e42b-11e9-96f6-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id 90fe7ffb-e42b-11e9-96f6-12813bfff9fa;
 Tue, 01 Oct 2019 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569921140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fuqos8FL1CuT4r9A4knatA4mZaGfXspr1OwtKlMT21w=;
 b=afiIUeYwZxSU6cdC7nqeDNu2kkKXUCs9UZKa0sPauRtu15Zk4QBN2+Xz
 xCluIrv/9WmJHGqnJ1IhO4SIfDHkM8QSbh/EUShTWFhoWL1OaOq00N+F1
 ZXAz5ULAGLchGSd9xXAj+rPASG/PeWwJIA3Yx9knEGYLV2y98xELMGW1o o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fSQgL098U1Cd4QVGjSZQNOmFlrHot04JxdYnBYlvzvvUmcB7M2plJTntMMdhGSRj9VE56NZzY1
 ZMGd3ocFTpYfDH1lFxpIk76/AbUtUmKV2HUNaycrE9Vv+Iynz7D4zswJvVl2semhd3Zc8dEhy3
 yUZ5t/uFl5cmeKRDeCWMWBGpH5vddWoXQ+7JZJpUNBhuUIbmBL/cZUn9MiNNc6Ht7x8khOkqlB
 RyEgBNvnPPgao64LS/EKkH/tOzRwocKCU2+6DoApOZUZhJhRGu50D0LcQ/xel62vbxRkgFKTct
 pnU=
X-SBRS: 2.7
X-MesageID: 6295631
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6295631"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 1 Oct 2019 10:12:14 +0100
Message-ID: <20191001091214.3287-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH-for-4.13] libxl: choose an appropriate default
 for passthrough...
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uaWYgdGhlcmUgaXMgbm8gSU9NTVUgb3IgaXQgaXMgZ2xvYmFsbHkgZGlzYWJsZWQuCgpXaXRo
b3V0IHRoaXMgcGF0Y2gsIHRoZSBmb2xsb3dpbmcgYXNzZXJ0aW9uIG1heSBiZSBoaXQ6Cgp4bDog
bGlieGxfY3JlYXRlLmM6NTg5OiBsaWJ4bF9fZG9tYWluX21ha2U6IEFzc2VydGlvbiBgaW5mby0+
cGFzc3Rocm91Z2ggIT0gTElCWExfUEFTU1RIUk9VR0hfRU5BQkxFRCcgZmFpbGVkLgoKVGhpcyBp
cyBiZWNhdXNlIGxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdCgpIGN1cnJlbnRs
eSBvbmx5IHNldHMKYW4gYXBwcm9wcmlhdGUgdmFsdWUgZm9yICdwYXNzdGhyb3VnaCcgaW4gdGhl
IGNhc2UgdGhhdCAnY2FwX2h2bV9kaXJlY3RpbycKaXMgdHJ1ZSwgd2hpY2ggaXMgbm90IHRoZSBj
YXNlIHVubGVzcyBhbiBJT01NVSBpcyBwcmVzZW50IGFuZCBlbmFibGVkIGluCnRoZSBzeXN0ZW0u
IFRoaXMgaXMgbm9ybWFsbHkgbWFza2VkIGJ5IHhsIGNob29zaW5nIGEgZGVmYXVsdCB2YWx1ZSwg
YnV0CnRoYXQgd2lsbCBub3QgaGFwcGVuIGlmIHhsIGlzIG5vdCB1c2VkIChlLmcuIHdoZW4gdXNp
bmcgbGlidmlydCkgb3Igd2hlbgphIHN0dWIgZG9tYWluIGlzIGJlaW5nIGNyZWF0ZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpD
YzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhs
X2NyZWF0ZS5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCmluZGV4IGI1OGUwMzAzNzYuLjNiZGI2YzUxYjYgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2NyZWF0ZS5jCkBAIC02OCw3ICs2OCwxMSBAQCBpbnQgbGlieGxfX2RvbWFpbl9jcmVhdGVf
aW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCiAgICAgICAgIGNfaW5mby0+cGFzc3Rocm91
Z2ggPSAoKGNfaW5mby0+dHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9QVikgfHwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAhaW5mby5jYXBfaW9tbXVfaGFwX3B0X3NoYXJlKSA/CiAg
ICAgICAgICAgICBMSUJYTF9QQVNTVEhST1VHSF9TWU5DX1BUIDogTElCWExfUEFTU1RIUk9VR0hf
U0hBUkVfUFQ7Ci0gICAgfQorICAgIH0gZWxzZSBpZiAoIWluZm8uY2FwX2h2bV9kaXJlY3RpbykK
KyAgICAgICAgY19pbmZvLT5wYXNzdGhyb3VnaCA9IExJQlhMX1BBU1NUSFJPVUdIX0RJU0FCTEVE
OworCisgICAgLyogQW4gZXhwbGljaXQgc2V0dGluZyBzaG91bGQgbm93IGhhdmUgYmVlbiBjaG9z
ZW4gKi8KKyAgICBhc3NlcnQoY19pbmZvLT5wYXNzdGhyb3VnaCAhPSBMSUJYTF9QQVNTVEhST1VH
SF9FTkFCTEVEKTsKIAogICAgIHJldHVybiAwOwogfQotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
