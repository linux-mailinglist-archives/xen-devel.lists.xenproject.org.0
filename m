Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7986E1BBB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:05:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGFj-0005zz-Ku; Wed, 23 Oct 2019 13:00:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l49O=YQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNGFh-0005zC-VI
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:00:37 +0000
X-Inumbo-ID: 13f303c0-f595-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13f303c0-f595-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571835624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=swnojc7p8tZlUMVSFiHA8JZpgY6zZQc/i4P8oEhC9ww=;
 b=KaaqeEg998Em+sT9fxy1qDTaQO1bSpdm1C8mA3Q9uxxN7MEQBEn0j73i
 R229KAeegzZEPECCRgXDkFItq2WA2JBOrdcr1fCbItj6SNTFR3Cm792fi
 P06BVddebvAjXSOuaPy8M+9isSt3SFEvDUEPqo6tW6nhCsR9US7EOh4fw g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HNdMwtFItnMdASZld7adWY1MVumpOF+bmhRLJC183NJLA4UPJDQSKCvQGTahXKwZJy6nn1eBpj
 gRbe48LPtM8WOHVI9vHGnBDLD+ycl0dKGWTGQpMp0PBQQM8aVncLsaFQmK+z5qKx2dddCHPSP9
 QgZanq5yQWgG/KYpUtoMriKHC49q2/WCk9Bzl7Rvx4apUdRyGwSOqDGfypCWZNXho4ZboM81bK
 87m1o+bqlt5vukDK+ysw8mNIx+7rxltEASWGgMWjYkp8UzB1EYpEzfjm4+vykWppxd9lSPbWoX
 LUM=
X-SBRS: 2.7
X-MesageID: 7660568
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7660568"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:00:10 +0100
Message-ID: <20191023130013.32382-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v7 08/11] libxl: create:
 setdefault: Move physinfo into config_setdefault
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuICBUaGlzIHdpbGwgbGV0IHVzIHJlZmVyIHRvIGl0IGluIGNv
ZGUgd2UgYXJlCmFib3V0IHRvIGFkZCB0byB0aGlzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkFja2VkLWJ5OiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgotLS0KdjI6IE5ldyBwYXRjaCBpbiB0aGlzIHZlcnNpb24gb2YgdGhlIHNl
cmllcy4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgIHwgMTcgKysrKysrKystLS0t
LS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgICAgICAgfCAgNyArKysrKystCiB0b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgIDMgKystCiAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKaW5kZXggZDY1ZGY3OTI0ZC4u
MDY3MGVmOTBlZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKKysrIGIv
dG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKQEAgLTI4LDE1ICsyOCw5IEBACiAjaW5jbHVkZSA8
eGVuLXhzbS9mbGFzay9mbGFzay5oPgogCiBpbnQgbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5mb19z
ZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGxpYnhsX2RvbWFpbl9jcmVhdGVfaW5mbyAqY19pbmZvKQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fY3JlYXRlX2luZm8gKmNf
aW5mbywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgbGli
eGxfcGh5c2luZm8gKmluZm8pCiB7Ci0gICAgbGlieGxfcGh5c2luZm8gaW5mb1sxXTsKLSAgICBp
bnQgcmM7Ci0KLSAgICByYyA9IGxpYnhsX2dldF9waHlzaW5mbyhDVFgsIGluZm8pOwotICAgIGlm
IChyYykKLSAgICAgICAgcmV0dXJuIHJjOwotCiAgICAgaWYgKCFjX2luZm8tPnR5cGUpIHsKICAg
ICAgICAgTE9HKEVSUk9SLCAiZG9tYWluIHR5cGUgdW5zcGVjaWZpZWQiKTsKICAgICAgICAgcmV0
dXJuIEVSUk9SX0lOVkFMOwpAQCAtOTE1LDYgKzkwOSwxMCBAQCBpbnQgbGlieGxfX2RvbWFpbl9j
b25maWdfc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAogICAgIGludCByZXQ7CiAgICAgYm9vbCBw
b2RfZW5hYmxlZCA9IGZhbHNlOwogCisgICAgbGlieGxfcGh5c2luZm8gcGh5c2luZm87CisgICAg
cmV0ID0gbGlieGxfZ2V0X3BoeXNpbmZvKENUWCwgJnBoeXNpbmZvKTsKKyAgICBpZiAocmV0KSBn
b3RvIGVycm9yX291dDsKKwogICAgIGlmIChkX2NvbmZpZy0+Y19pbmZvLnNzaWRfbGFiZWwpIHsK
ICAgICAgICAgY2hhciAqcyA9IGRfY29uZmlnLT5jX2luZm8uc3NpZF9sYWJlbDsKICAgICAgICAg
cmV0ID0gbGlieGxfZmxhc2tfY29udGV4dF90b19zaWQoY3R4LCBzLCBzdHJsZW4ocyksCkBAIC0x
MDEzLDcgKzEwMTEsOCBAQCBpbnQgbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdChsaWJ4
bF9fZ2MgKmdjLAogICAgICAgICBnb3RvIGVycm9yX291dDsKICAgICB9CiAKLSAgICByZXQgPSBs
aWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQoZ2MsICZkX2NvbmZpZy0+Y19pbmZv
KTsKKyAgICByZXQgPSBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQoZ2MsICZk
X2NvbmZpZy0+Y19pbmZvLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmcGh5c2luZm8pOwogICAgIGlmIChyZXQpIHsKICAgICAgICAgTE9HRChFUlJPUiwg
ZG9taWQsICJVbmFibGUgdG8gc2V0IGRvbWFpbiBjcmVhdGUgaW5mbyBkZWZhdWx0cyIpOwogICAg
ICAgICBnb3RvIGVycm9yX291dDsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMg
Yi90b29scy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IGMwMDM1NmEyZjEuLmU2YTQ4OTc0ZjggMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxf
ZG0uYwpAQCAtMjE2Nyw3ICsyMTY3LDEyIEBAIHZvaWQgbGlieGxfX3NwYXduX3N0dWJfZG0obGli
eGxfX2VnYyAqZWdjLCBsaWJ4bF9fc3R1Yl9kbV9zcGF3bl9zdGF0ZSAqc2RzcykKICAgICBkbV9j
b25maWctPmNfaW5mby5ydW5faG90cGx1Z19zY3JpcHRzID0KICAgICAgICAgZ3Vlc3RfY29uZmln
LT5jX2luZm8ucnVuX2hvdHBsdWdfc2NyaXB0czsKIAotICAgIHJldCA9IGxpYnhsX19kb21haW5f
Y3JlYXRlX2luZm9fc2V0ZGVmYXVsdChnYywgJmRtX2NvbmZpZy0+Y19pbmZvKTsKKyAgICBsaWJ4
bF9waHlzaW5mbyBwaHlzaW5mbzsKKyAgICByZXQgPSBsaWJ4bF9nZXRfcGh5c2luZm8oQ1RYLCAm
cGh5c2luZm8pOworICAgIGlmIChyZXQpIGdvdG8gb3V0OworCisgICAgcmV0ID0gbGlieGxfX2Rv
bWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KGdjLCAmZG1fY29uZmlnLT5jX2luZm8sCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwaHlzaW5mbyk7CiAg
ICAgaWYgKHJldCkgZ290byBvdXQ7CiAgICAgcmV0ID0gbGlieGxfX2RvbWFpbl9idWlsZF9pbmZv
X3NldGRlZmF1bHQoZ2MsICZkbV9jb25maWctPmJfaW5mbyk7CiAgICAgaWYgKHJldCkgZ290byBv
dXQ7CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGli
eGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCAwMTg1YjhmZjAxLi42YTYxNDY1OGMyIDEwMDY0NAot
LS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X2ludGVybmFsLmgKQEAgLTE0NDcsNyArMTQ0Nyw4IEBAIF9oaWRkZW4gaW50IGxpYnhsX19kb21h
aW5fY29uZmlnX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlk
IC8qIGxvZ2dpbmcgb25seSAqLyk7CiBfaGlkZGVuIGludCBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9p
bmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fY3JlYXRlX2luZm8gKmNfaW5mbyk7CisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NyZWF0ZV9pbmZv
ICpjX2luZm8sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
bGlieGxfcGh5c2luZm8gKmluZm8pOwogX2hpZGRlbiBpbnQgbGlieGxfX2RvbWFpbl9idWlsZF9p
bmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqYl9pbmZvKTsKIF9oaWRkZW4g
dm9pZCBsaWJ4bF9fcmRtX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
