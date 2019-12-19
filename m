Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137A126F14
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 21:45:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii2ca-0006d6-5P; Thu, 19 Dec 2019 20:42:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNyU=2J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ii2cZ-0006d1-Hv
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 20:42:07 +0000
X-Inumbo-ID: 04aa16b5-22a0-11ea-928e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04aa16b5-22a0-11ea-928e-12813bfff9fa;
 Thu, 19 Dec 2019 20:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576788127;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=SGTTCyeokICR763JcNweDrWX/3VqAMJnBGJvS3gn2Uw=;
 b=fZ/sh7EXQYQ8rXnzJOF3wqZVMsKFc1oJwECAitT/uPr+EbbspCVtScar
 0zEipR9UT++xuxLSBXBNfK2u+r4CPiq8YVVz14SYPCJSrPfif9rdY0aUf
 prcRUZT/rXYqXHtB67yErGhwVxjA3fqf4ixHKUFS6LW4voxDwwFSzAm3f I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ijdO8fjg1eZSHGKGBGoPwrmD8fNt5Pc1CG07O6JnWy91jDPqGtZOSZAHvDEbnM9WpwSI2Ee9y9
 580RwG55Kpf6zykgho8xYY1VGVdrDoA/B1cRz3VCOvP3fXVeeTgzOjYrpe7pxWCt9ZZXWRWX+x
 mqi3NEW0a0CoflbxtKguLaJwhdlXi27vOS0osbNtbn20k4eMSmHmp0BYe1i6OFlq8tr1tagmzs
 5XEFr6FINpxz/YmQ5s89a8UzBj7qkTNykipwI5YA6RcjftXgdMKpGgYrnoXMDtlbcnh6509Dvs
 /xQ=
X-SBRS: 2.7
X-MesageID: 9971390
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,333,1571716800"; 
   d="scan'208";a="9971390"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 19 Dec 2019 20:42:02 +0000
Message-ID: <20191219204202.27849-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxc/restore: Fix data auditing in
 handle_x86_pv_vcpu_blob()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgbG9naWMgb25seSB3b3JrcyBieSBjaGFuY2UsIGluIHRoYXQgWFNBVkUgcmVj
b3JkcyBhbHNvIHRlbmQgdG8gYmUKYSBtdWx0aXBsZSBvZiAxMjguICBJbXBsZW1lbnQgdGhlIG1p
c3NpbmcgbG9naWMgZm9yIFhTQVZFLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25A
Y2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogdG9vbHMvbGlieGMveGNf
c3JfcmVzdG9yZV94ODZfcHYuYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZfcHYu
YyBiL3Rvb2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmVfeDg2X3B2LmMKaW5kZXggMWEyNmYyMjA1Zi4u
MTE2YTAwNDcyNiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZfcHYu
YworKysgYi90b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9wdi5jCkBAIC04MjUsNiArODI1
LDE1IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3g4Nl9wdl92Y3B1X2Jsb2Ioc3RydWN0IHhjX3NyX2Nv
bnRleHQgKmN0eCwKICAgICAgICAgYnJlYWs7CiAKICAgICBjYXNlIFJFQ19UWVBFX1g4Nl9QVl9W
Q1BVX1hTQVZFOgorICAgICAgICBpZiAoIGJsb2JzeiA8IDEyOCApCisgICAgICAgIHsKKyAgICAg
ICAgICAgIEVSUk9SKCIlcyByZWNvcmQgdG9vIHNob3J0OiBtaW4gJXp1LCBnb3QgJXUiLAorICAg
ICAgICAgICAgICAgICAgcmVjX25hbWUsIHNpemVvZigqdmhkcikgKyAxMjgsIHJlYy0+bGVuZ3Ro
KTsKKyAgICAgICAgICAgIGdvdG8gb3V0OworICAgICAgICB9CisgICAgICAgIGJyZWFrOworCisg
ICAgY2FzZSBSRUNfVFlQRV9YODZfUFZfVkNQVV9NU1JTOgogICAgICAgICBpZiAoIGJsb2JzeiAl
IHNpemVvZih4ZW5fZG9tY3RsX3ZjcHVfbXNyX3QpICE9IDAgKQogICAgICAgICB7CiAgICAgICAg
ICAgICBFUlJPUigiJXMgcmVjb3JkIHBheWxvYWQgc2l6ZSAlenUgZXhwZWN0ZWQgdG8gYmUgYSBt
dWx0aXBsZSBvZiAlenUiLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
