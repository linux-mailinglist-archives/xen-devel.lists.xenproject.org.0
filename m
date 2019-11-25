Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F551094F0
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 22:09:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZLYG-0003s0-AI; Mon, 25 Nov 2019 21:05:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GfvL=ZR=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iZLYE-0003rv-VV
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 21:05:42 +0000
X-Inumbo-ID: 56cdb23e-0fc7-11ea-9455-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56cdb23e-0fc7-11ea-9455-bc764e2007e4;
 Mon, 25 Nov 2019 21:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574715942;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=FrUtKjNrr/KuvwgKBQOeigJeF9fe2NwhEz20coXm1L0=;
 b=guQzFXCAC3UBClZPZmc3KP9u4FxoyHM2RN66vRoHvAugiklaQ/4Kuip0
 UH13mpaNG6mAz/o5uWE+7X7ybiIRNNSQt07cozx3Gbzeh1wGZheabw9Ls
 NT/yl5Bg26CdAfe4W7rqfxYikW9NqUnWdcYrmJh2suRwowu2Xu2E7gXSu 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uyGA/UHmqT/1JN/+6ZxZ3rwZn9m8syxFFLphiodPqrvVzzNnBL/OdZZb2cJV6TfZ6vK7CKEizk
 x28oLEBL5rCxyfKHB7KZ6emOYU4G3T4GaUYpRwbxhUP4GUE706djJ5Fp9YYuYNLyrkOMxyIjdb
 aTFphZrT34a+VxDQ4fB1dKq/iFC7AsAQFpUY1FlAPJB+3rUXD8u0DgHbFtWMu7oRinWXdHLWPk
 ShPPnaI9rnHreb3EryEBXSXShDqGsHGYj183YvVmVoc/GHbl6HXUA9zxkTNo45RRvOF3exLkH2
 q7Q=
X-SBRS: 2.7
X-MesageID: 8813223
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,242,1571716800"; 
   d="scan'208";a="8813223"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 25 Nov 2019 21:05:37 +0000
Message-ID: <1574715937-13565-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] AMD/IOMMU: honour IR setting while
 pre-filling DTEs
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
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SVYgYml0IHNob3VsZG4ndCBiZSBzZXQgaW4gRFRFIGlmIGludGVycnVwdCByZW1hcHBpbmcgaXMg
bm90CmVuYWJsZWQuIFRoaXMgd2FzIHRyYWNlZCB0byBiZSBhIHJvb3QgY2F1c2UgYmVoaW5kIGFz
c2VydGlvbiBpbgppbnRlcnJ1cHQgaGFuZGxpbmcgY29kZSBvbiBMaXNib24uCgpTaWduZWQtb2Zm
LWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KLS0tCiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9pb21tdV9pbml0LmMKaW5kZXggMTZlODRkNC4uMmI4MWUzOCAxMDA2NDQKLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYworKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCkBAIC0xMjc5LDcgKzEyNzksNyBAQCBzdGF0aWMg
aW50IF9faW5pdCBhbWRfaW9tbXVfc2V0dXBfZGV2aWNlX3RhYmxlKAogICAgICAgICBmb3IgKCBi
ZGYgPSAwLCBzaXplIC89IHNpemVvZigqZHQpOyBiZGYgPCBzaXplOyArK2JkZiApCiAgICAgICAg
ICAgICBkdFtiZGZdID0gKHN0cnVjdCBhbWRfaW9tbXVfZHRlKXsKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLnYgPSB0cnVlLAotICAgICAgICAgICAgICAgICAgICAgICAgICAuaXYgPSB0cnVl
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAuaXYgPSBpb21tdV9pbnRyZW1hcCwKICAgICAg
ICAgICAgICAgICAgICAgICB9OwogICAgIH0KIAotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
