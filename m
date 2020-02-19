Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56173164EF1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 20:32:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4V2u-0004Py-2V; Wed, 19 Feb 2020 19:30:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8+/=4H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j4V2s-0004Fo-H8
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 19:30:06 +0000
X-Inumbo-ID: 3aafb73a-534e-11ea-8436-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3aafb73a-534e-11ea-8436-12813bfff9fa;
 Wed, 19 Feb 2020 19:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582140604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Lxem7SCNjUoqQHLBf/X4lFv8VyNr+OyOpww/f+RtWag=;
 b=T+8srBq9SBzhBPOFKZyL37OuVeFrZMJyZQo054m/3AGuaBm5FRcj/Rkh
 P4/hY5d6p8C4Xk3PE3T8Vy7x0PlpqNsWpUGzModETDiio4586YbWgf1k+
 AxD0aJJkTIJeppQVeOLA+eBEIe0+axwT7nXMfwjip7CTcSTUKIQMRofNt 4=;
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
IronPort-SDR: tpgR33V1zxGrrZTSL+48kiZOfwvp1FTRhWzMp4ND9whLJS8wSiAdz7VF9duO4J7yZ9nJftIOlj
 cibpqYUAL/TSfdGTvn8utR84cIiqJ2sRinvBqC8ujwwfJVWpp9tD9EZA4ehPK2ZQ8bdxyndHhs
 m9pscZmqUN1tskImzZ5b+WiUyIj8KwyicZFAyqusM8Dl98ksEz2GFmjcrrjRY1LXgRjYSE7mYN
 IeOzrlhSjgSLIpKi1hkkP1odebbNEtp2IlICyt9EEUuBG7JhoTQ45hHA2y16yfHttIEeMdwyJr
 11Y=
X-SBRS: 2.7
X-MesageID: 13143857
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="13143857"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 19:30:01 +0000
Message-ID: <20200219193001.28822-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200210184549.28707-1-andrew.cooper3@citrix.com>
References: <20200210184549.28707-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/arm: Restrict access to most HVM_PARAM's
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QVJNIGN1cnJlbnRseSBoYXMgbm8gcmVzdHJpY3Rpb25zIG9uIHRvb2xzdGFjayBhbmQgZ3Vlc3Qg
YWNjZXNzIHRvIHRoZSBlbnRpcmUKSFZNX1BBUkFNIGJsb2NrLiAgQXMgdGhlIG1vbml0b3IgZmVh
dHVyZSBpc24ndCB1bmRlciBzZWN1cml0eSBzdXBwb3J0LCB0aGlzCmRvZXNuJ3QgbmVlZCBhbiBY
U0EuCgpUaGUgQ0FMTEJBQ0tfSVJRIGFuZCB7U1RPUkUsQ09OU09MRX1fe1BGTixFVlRDSE59IGRl
dGFpbHMgYXJlIG9ubHkgZXhwb3NlZApyZWFkLW9ubHkgdG8gdGhlIGd1ZXN0LCB3aGlsZSBNT05J
VE9SX1JJTkdfUEZOIGlzIHJlc3RyaWN0ZWQgdG8gb25seSB0b29sc3RhY2sKYWNjZXNzLiAgTm8g
b3RoZXIgcGFyYW1ldGVycyBhcmUgdXNlZC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4K
Q0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KClRoaXMg
aXMgb25seSBjb21waWxlIHRlc3RlZCwgYW5kIGJhc2VkIG9uIG15IHJlYWRpbmcgb2YgdGhlIHNv
dXJjZS4gIFRoZXJlCm1pZ2h0IGJlIG90aGVyIFBBUkFNUyBuZWVkaW5nIGluY2x1ZGluZy4KCnYy
OgogKiBEcm9wIHBhZ2luZy9zaGFyaW5nCiAqIENsYXJpZnkgY29tbWVudCBhYm91dCB7U1RPUkUs
Q09OU09MRX1fRVZUQ0hOCi0tLQogeGVuL2FyY2gvYXJtL2h2bS5jIHwgNjIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vaHZtLmMgYi94ZW4vYXJjaC9hcm0vaHZtLmMKaW5kZXggNzZiMjdjOTE2OC4uODk1MWIz
NDA4NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2h2bS5jCisrKyBiL3hlbi9hcmNoL2FybS9o
dm0uYwpAQCAtMzEsNiArMzEsNTcgQEAKIAogI2luY2x1ZGUgPGFzbS9oeXBlcmNhbGwuaD4KIAor
c3RhdGljIGludCBodm1fYWxsb3dfc2V0X3BhcmFtKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHVu
c2lnbmVkIGludCBwYXJhbSkKK3sKKyAgICBzd2l0Y2ggKCBwYXJhbSApCisgICAgeworICAgICAg
ICAvKgorICAgICAgICAgKiBUaGUgZm9sbG93aW5nIHBhcmFtZXRlcnMgYXJlIGludGVuZGVkIGZv
ciB0b29sc3RhY2sgdXNhZ2Ugb25seS4KKyAgICAgICAgICogVGhleSBtYXkgbm90IGJlIHNldCBi
eSB0aGUgZG9tYWluLgorICAgICAgICAgKgorICAgICAgICAgKiBUaGUge1NUT1JFLENPTlNPTEV9
X0VWVENITiB2YWx1ZXMgd2lsbCBuZWVkIHRvIGJlY29tZSByZWFkL3dyaXRlIHRvCisgICAgICAg
ICAqIHRoZSBndWVzdCAobm90IGp1c3QgdGhlIHRvb2xzdGFjaykgaWYgYSBuZXcgQUJJIGhhc24n
dCBhcHBlYXJlZCBieQorICAgICAgICAgKiB0aGUgdGltZSBtaWdyYXRpb24gc3VwcG9ydCBpcyBh
ZGRlZC4KKyAgICAgICAgICovCisgICAgY2FzZSBIVk1fUEFSQU1fQ0FMTEJBQ0tfSVJROgorICAg
IGNhc2UgSFZNX1BBUkFNX1NUT1JFX1BGTjoKKyAgICBjYXNlIEhWTV9QQVJBTV9TVE9SRV9FVlRD
SE46CisgICAgY2FzZSBIVk1fUEFSQU1fQ09OU09MRV9QRk46CisgICAgY2FzZSBIVk1fUEFSQU1f
Q09OU09MRV9FVlRDSE46CisgICAgY2FzZSBIVk1fUEFSQU1fTU9OSVRPUl9SSU5HX1BGTjoKKyAg
ICAgICAgcmV0dXJuIGQgPT0gY3VycmVudC0+ZG9tYWluID8gLUVQRVJNIDogMDsKKworICAgICAg
ICAvKiBXcml0ZWFibGUgb25seSBieSBYZW4sIGhvbGUsIGRlcHJlY2F0ZWQsIG9yIG91dC1vZi1y
YW5nZS4gKi8KKyAgICBkZWZhdWx0OgorICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICB9Cit9
CisKK3N0YXRpYyBpbnQgaHZtX2FsbG93X2dldF9wYXJhbShjb25zdCBzdHJ1Y3QgZG9tYWluICpk
LCB1bnNpZ25lZCBpbnQgcGFyYW0pCit7CisgICAgc3dpdGNoICggcGFyYW0gKQorICAgIHsKKyAg
ICAgICAgLyogVGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzIGNhbiBiZSByZWFkIGJ5IHRoZSBndWVz
dCBhbmQgdG9vbHN0YWNrLiAqLworICAgIGNhc2UgSFZNX1BBUkFNX0NBTExCQUNLX0lSUToKKyAg
ICBjYXNlIEhWTV9QQVJBTV9TVE9SRV9QRk46CisgICAgY2FzZSBIVk1fUEFSQU1fU1RPUkVfRVZU
Q0hOOgorICAgIGNhc2UgSFZNX1BBUkFNX0NPTlNPTEVfUEZOOgorICAgIGNhc2UgSFZNX1BBUkFN
X0NPTlNPTEVfRVZUQ0hOOgorICAgICAgICByZXR1cm4gMDsKKworICAgICAgICAvKgorICAgICAg
ICAgKiBUaGUgZm9sbG93aW5nIHBhcmFtZXRlcnMgYXJlIGludGVuZGVkIGZvciB0b29sc3RhY2sg
dXNhZ2Ugb25seS4KKyAgICAgICAgICogVGhleSBtYXkgbm90IGJlIHJlYWQgYnkgdGhlIGRvbWFp
bi4KKyAgICAgICAgICovCisgICAgY2FzZSBIVk1fUEFSQU1fTU9OSVRPUl9SSU5HX1BGTjoKKyAg
ICAgICAgcmV0dXJuIGQgPT0gY3VycmVudC0+ZG9tYWluID8gLUVQRVJNIDogMDsKKworICAgICAg
ICAvKiBIb2xlLCBkZXByZWNhdGVkLCBvciBvdXQtb2YtcmFuZ2UuICovCisgICAgZGVmYXVsdDoK
KyAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgfQorfQorCiBsb25nIGRvX2h2bV9vcCh1bnNp
Z25lZCBsb25nIG9wLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykKIHsKICAgICBs
b25nIHJjID0gMDsKQEAgLTQ2LDkgKzk3LDYgQEAgbG9uZyBkb19odm1fb3AodW5zaWduZWQgbG9u
ZyBvcCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCiAgICAgICAgIGlmICggY29w
eV9mcm9tX2d1ZXN0KCZhLCBhcmcsIDEpICkKICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwog
Ci0gICAgICAgIGlmICggYS5pbmRleCA+PSBIVk1fTlJfUEFSQU1TICkKLSAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwotCiAgICAgICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lkKGEu
ZG9taWQpOwogICAgICAgICBpZiAoIGQgPT0gTlVMTCApCiAgICAgICAgICAgICByZXR1cm4gLUVT
UkNIOwpAQCAtNTksMTAgKzEwNywxOCBAQCBsb25nIGRvX2h2bV9vcCh1bnNpZ25lZCBsb25nIG9w
LCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykKIAogICAgICAgICBpZiAoIG9wID09
IEhWTU9QX3NldF9wYXJhbSApCiAgICAgICAgIHsKKyAgICAgICAgICAgIHJjID0gaHZtX2FsbG93
X3NldF9wYXJhbShkLCBhLmluZGV4KTsKKyAgICAgICAgICAgIGlmICggcmMgKQorICAgICAgICAg
ICAgICAgIGdvdG8gcGFyYW1fZmFpbDsKKwogICAgICAgICAgICAgZC0+YXJjaC5odm0ucGFyYW1z
W2EuaW5kZXhdID0gYS52YWx1ZTsKICAgICAgICAgfQogICAgICAgICBlbHNlCiAgICAgICAgIHsK
KyAgICAgICAgICAgIHJjID0gaHZtX2FsbG93X2dldF9wYXJhbShkLCBhLmluZGV4KTsKKyAgICAg
ICAgICAgIGlmICggcmMgKQorICAgICAgICAgICAgICAgIGdvdG8gcGFyYW1fZmFpbDsKKwogICAg
ICAgICAgICAgYS52YWx1ZSA9IGQtPmFyY2guaHZtLnBhcmFtc1thLmluZGV4XTsKICAgICAgICAg
ICAgIHJjID0gY29weV90b19ndWVzdChhcmcsICZhLCAxKSA/IC1FRkFVTFQgOiAwOwogICAgICAg
ICB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
