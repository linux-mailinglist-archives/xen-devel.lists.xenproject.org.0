Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD80B18BB1E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:28:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEx4e-0003ai-1P; Thu, 19 Mar 2020 15:27:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jEx4c-0003Zx-1w
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:27:06 +0000
X-Inumbo-ID: 1432ba08-69f6-11ea-a6c1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1432ba08-69f6-11ea-a6c1-bc764e2007e4;
 Thu, 19 Mar 2020 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584631621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UTwDfuoEAGglX9Z3bbi6oCiNVKIROQ9af6EpmvNbZDI=;
 b=EKwa5UOB5KFR30xlnHmRKTRvEuLIL9WcxMiztEK+vpsPSotTM0OZ7AyT
 QSdNc0IZ+NLql2vvF9yaKsyqy3FueCRssM8d37UJHebqMEhJY7KtjRYp1
 jSf3RQdx0VQjbrfS3CGy/J+6n9o60NAIe5eOnLgk/Bi3NJo/W0U+vfMx1 M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JwXHt9kz0O/F1rJ4WaQmAmRF5/3GDjsvs8nFEURLyCQafLiXAi+LE9MmkKjmM6otd/d1jEICL6
 b5gXgPt++JMKrSZmYupX685KcHpy9ZLPYJczxALHTYYanBG5PIWIFDj6RtuTfY7qPmzn/7OYDO
 905/5xvOZKJIZLWvkgucbyUvxL4Ds0DGB/2vJctPnwWyk34Xv8K0QiMlIaPFF6xsJiof0WVmaX
 K9Og3qgJ0SuhtrfT0pQn1XzNV1S5qHwb/fKqSkafNr4jRXmG2vdlfcN/HCLHyIpdl/p57KYnx5
 pik=
X-SBRS: 2.7
X-MesageID: 14703419
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14703419"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 19 Mar 2020 15:26:22 +0000
Message-ID: <20200319152622.31758-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200319152622.31758-1-andrew.cooper3@citrix.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 6/6] x86/ucode: Make struct microcode_patch
 opaque
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3aWxsIGVuZm9yY2UgcHJvcGVyIGludGVyZmFjZSBkaXNjaXBsaW5lIGluIGNvcmUuYywg
YW5kIGFsbG93IGVhY2ggZHJpdmVyCnRvIGNob29zZSBpdHMgb3duIChiZXR0ZXIpIGRhdGEgbGF5
b3V0LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGlj
aEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9h
bWQuYyAgICAgfCA0ICsrKysKIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMgICB8
IDQgKysrKwogeGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvcHJpdmF0ZS5oIHwgOCArLS0tLS0t
LQogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvYW1kLmMgYi94ZW4vYXJjaC94ODYv
Y3B1L21pY3JvY29kZS9hbWQuYwppbmRleCA3N2U1ODJjOGUxLi45OWUyNDQ5ZWVlIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYworKysgYi94ZW4vYXJjaC94ODYv
Y3B1L21pY3JvY29kZS9hbWQuYwpAQCAtNzMsNiArNzMsMTAgQEAgc3RydWN0IG1wYmhkciB7CiAg
ICAgdWludDhfdCBkYXRhW107CiB9OwogCitzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoIHsKKyAgICBz
dHJ1Y3QgbWljcm9jb2RlX2FtZCAqbWNfYW1kOworfTsKKwogLyogU2VlIGNvbW1lbnQgaW4gc3Rh
cnRfdXBkYXRlKCkgZm9yIGNhc2VzIHdoZW4gdGhpcyByb3V0aW5lIGZhaWxzICovCiBzdGF0aWMg
aW50IGNvbGxlY3RfY3B1X2luZm8oc3RydWN0IGNwdV9zaWduYXR1cmUgKmNzaWcpCiB7CmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jIGIveGVuL2FyY2gveDg2
L2NwdS9taWNyb2NvZGUvaW50ZWwuYwppbmRleCAwZTZiYTUwMDQ4Li41ZTljMmE5YzdmIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMKQEAgLTcxLDYgKzcxLDEwIEBAIHN0cnVjdCBleHRl
bmRlZF9zaWd0YWJsZSB7CiAgICAgc3RydWN0IGV4dGVuZGVkX3NpZ25hdHVyZSBzaWdzWzBdOwog
fTsKIAorc3RydWN0IG1pY3JvY29kZV9wYXRjaCB7CisgICAgc3RydWN0IG1pY3JvY29kZV9pbnRl
bCAqbWNfaW50ZWw7Cit9OworCiAjZGVmaW5lIERFRkFVTFRfVUNPREVfREFUQVNJWkUgICgyMDAw
KQogI2RlZmluZSBNQ19IRUFERVJfU0laRSAgICAgICAgICAoc2l6ZW9mKHN0cnVjdCBtaWNyb2Nv
ZGVfaGVhZGVyX2ludGVsKSkKICNkZWZpbmUgREVGQVVMVF9VQ09ERV9UT1RBTFNJWkUgKERFRkFV
TFRfVUNPREVfREFUQVNJWkUgKyBNQ19IRUFERVJfU0laRSkKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9jcHUvbWljcm9jb2RlL3ByaXZhdGUuaCBiL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2Rl
L3ByaXZhdGUuaAppbmRleCA4OTdkMzJhOGU5Li5lNjQxNjhhNTAyIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvY3B1L21pY3JvY29kZS9wcml2YXRlLmgKKysrIGIveGVuL2FyY2gveDg2L2NwdS9t
aWNyb2NvZGUvcHJpdmF0ZS5oCkBAIC0xMSwxMyArMTEsNyBAQCBlbnVtIG1pY3JvY29kZV9tYXRj
aF9yZXN1bHQgewogICAgIE1JU19VQ09ERSwgLyogc2lnbmF0dXJlIG1pc21hdGNoZWQgKi8KIH07
CiAKLXN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggewotICAgIHVuaW9uIHsKLSAgICAgICAgc3RydWN0
IG1pY3JvY29kZV9pbnRlbCAqbWNfaW50ZWw7Ci0gICAgICAgIHN0cnVjdCBtaWNyb2NvZGVfYW1k
ICptY19hbWQ7Ci0gICAgICAgIHZvaWQgKm1jOwotICAgIH07Ci19Oworc3RydWN0IG1pY3JvY29k
ZV9wYXRjaDsgLyogT3BhcXVlICovCiAKIHN0cnVjdCBtaWNyb2NvZGVfb3BzIHsKICAgICBzdHJ1
Y3QgbWljcm9jb2RlX3BhdGNoICooKmNwdV9yZXF1ZXN0X21pY3JvY29kZSkoY29uc3Qgdm9pZCAq
YnVmLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
