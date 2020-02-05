Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F591535A3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 17:53:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izNtN-0000Pn-8I; Wed, 05 Feb 2020 16:51:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TaP3=3Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1izNtL-0000PZ-MT
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 16:51:07 +0000
X-Inumbo-ID: b17c133a-4837-11ea-8396-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b17c133a-4837-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580921463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=w7ytyD/TCLp1VDxBKjEYmlzN9beHNXWINcG+VlSltN0=;
 b=iNOM7RxGJyLYTQ3UMs+3yrWasZI5pbcsNgPWlQoRTOoTEytjNV5efQZi
 Rka6krRF0zKZxB48GTLi5qCVm62rlkr2HfTlOHhkpxqZJmhyyoafmeTAd
 hzhamFJw/uKQZFOY/8ymXeOHwqeE+t11aqzJBp/tvGknvppONl6Xy+NV3 E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eU4oycvXqixxpKEP6blaTpC76iUyO9TQajsL+z/+6ofiAQ/gAvaOq5bGEBR8Ylt9OJIUK76DXE
 vVXjD/rvg5oAZJbp6iNdOFcrDZBJd0R4lwzAoFxTqe3P+MQg0lMzNsPHw1ME0j1CWdX2jshYv8
 yGhJ1Q1dPDpSvFbLwZh6/y/w7et9OKO3ks6eEestgW+q5FAL8hJZgdnssGInqnA4CsmJ85RAZ7
 eKh6cHtdAZL8FTZGrJIbHwYkSBgsN50bZGkNE1jf7ajlfCVgbU1rkLgDsUXqhC3nFePwrHdLQH
 8fY=
X-SBRS: 2.7
X-MesageID: 11991643
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,406,1574139600"; d="scan'208";a="11991643"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 5 Feb 2020 16:50:54 +0000
Message-ID: <20200205165056.11734-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200205165056.11734-1-andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/6] tools/libxl: Combine legacy CPUID handling
 logic
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgd2UgYXJlIGluIHRoZSBwcm9jZXNzIG9mIG92ZXJoYXVsaW5nIGJvb3QgdGltZSBDUFVJ
RC9NU1IgaGFuZGxpbmcsIHRoZQpleGlzdGluZyBsb2dpYyBpcyBnb2luZyB0byBoYXZlIHRvIHJl
bWFpbiBpbiByb3VnaGx5IHRoaXMgZm9ybSBmb3IgYmFja3dhcmRzCmNvbXBhdGliaWxpdHkuCgpG
b2xkIGxpYnhsX19jcHVpZF9hcHBseV9wb2xpY3koKSBhbmQgbGlieGxfX2NwdWlkX3NldCgpIHRv
Z2V0aGVyIGludG8gYSBzaW5nbGUKbGlieGxfX2NwdWlkX2xlZ2FjeSgpIHRvIHJlZHVjZSB0aGUg
Y29tcGxleGl0eSBmb3IgY2FsbGVycy4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBJ
YW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+CkNDOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB0
b29scy9saWJ4bC9saWJ4bF9jcHVpZC5jICAgIHwgMTUgKysrKysrKystLS0tLS0tCiB0b29scy9s
aWJ4bC9saWJ4bF9kb20uYyAgICAgIHwgIDQgKy0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuaCB8ICA1ICsrLS0tCiB0b29scy9saWJ4bC9saWJ4bF9ub2NwdWlkLmMgIHwgIDggKystLS0t
LS0KIDQgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3B1aWQuYyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X2NwdWlkLmMKaW5kZXggNTA1ZWMxYjA0OC4uNDlkM2NhNWIyNiAxMDA2NDQKLS0tIGEvdG9vbHMv
bGlieGwvbGlieGxfY3B1aWQuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9jcHVpZC5jCkBAIC00
MTAsMTcgKzQxMCwxOCBAQCBpbnQgbGlieGxfY3B1aWRfcGFyc2VfY29uZmlnX3hlbmQobGlieGxf
Y3B1aWRfcG9saWN5X2xpc3QgKmNwdWlkLAogICAgIHJldHVybiAwOwogfQogCi12b2lkIGxpYnhs
X19jcHVpZF9hcHBseV9wb2xpY3kobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkKQotewot
ICAgIHhjX2NwdWlkX2FwcGx5X3BvbGljeShjdHgtPnhjaCwgZG9taWQsIE5VTEwsIDApOwotfQot
Ci12b2lkIGxpYnhsX19jcHVpZF9zZXQobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAot
ICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2NwdWlkX3BvbGljeV9saXN0IGNwdWlkKQordm9p
ZCBsaWJ4bF9fY3B1aWRfbGVnYWN5KGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqaW5mbykKIHsK
KyAgICBsaWJ4bF9jcHVpZF9wb2xpY3lfbGlzdCBjcHVpZCA9IGluZm8tPmNwdWlkOwogICAgIGlu
dCBpOwogICAgIGNoYXIgKmNwdWlkX3Jlc1s0XTsKIAorICAgIHhjX2NwdWlkX2FwcGx5X3BvbGlj
eShjdHgtPnhjaCwgZG9taWQsIE5VTEwsIDApOworCisgICAgaWYgKCFjcHVpZCkKKyAgICAgICAg
cmV0dXJuOworCiAgICAgZm9yIChpID0gMDsgY3B1aWRbaV0uaW5wdXRbMF0gIT0gWEVOX0NQVUlE
X0lOUFVUX1VOVVNFRDsgaSsrKQogICAgICAgICB4Y19jcHVpZF9zZXQoY3R4LT54Y2gsIGRvbWlk
LCBjcHVpZFtpXS5pbnB1dCwKICAgICAgICAgICAgICAgICAgICAgIChjb25zdCBjaGFyKiopKGNw
dWlkW2ldLnBvbGljeSksIGNwdWlkX3Jlcyk7CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4
bF9kb20uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jCmluZGV4IGJiYjFiZTc1YmEuLjcxY2I1
Nzg5MjMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jCisrKyBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2RvbS5jCkBAIC00NTQsOSArNDU0LDcgQEAgaW50IGxpYnhsX19idWlsZF9wb3N0
KGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAogICAgIGlmIChyYykKICAgICAgICAgcmV0
dXJuIHJjOwogCi0gICAgbGlieGxfX2NwdWlkX2FwcGx5X3BvbGljeShjdHgsIGRvbWlkKTsKLSAg
ICBpZiAoaW5mby0+Y3B1aWQgIT0gTlVMTCkKLSAgICAgICAgbGlieGxfX2NwdWlkX3NldChjdHgs
IGRvbWlkLCBpbmZvLT5jcHVpZCk7CisgICAgbGlieGxfX2NwdWlkX2xlZ2FjeShjdHgsIGRvbWlk
LCBpbmZvKTsKIAogICAgIGlmIChpbmZvLT50eXBlID09IExJQlhMX0RPTUFJTl9UWVBFX0hWTQog
ICAgICAgICAmJiAhbGlieGxfbXNfdm1fZ2VuaWRfaXNfemVybygmaW5mby0+dS5odm0ubXNfdm1f
Z2VuaWQpKSB7CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9v
bHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCAxNjRkOTNiODliLi40OTM2NDQ2MDY5IDEw
MDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX2ludGVybmFsLmgKQEAgLTIwNTYsOSArMjA1Niw4IEBAIHN0cnVjdCBsaWJ4bF9fY3B1
aWRfcG9saWN5IHsKICAgICBjaGFyICpwb2xpY3lbNF07CiB9OwogCi1faGlkZGVuIHZvaWQgbGli
eGxfX2NwdWlkX2FwcGx5X3BvbGljeShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQpOwot
X2hpZGRlbiB2b2lkIGxpYnhsX19jcHVpZF9zZXQobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRv
bWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfY3B1aWRfcG9saWN5X2xp
c3QgY3B1aWQpOworX2hpZGRlbiB2b2lkIGxpYnhsX19jcHVpZF9sZWdhY3kobGlieGxfY3R4ICpj
dHgsIHVpbnQzMl90IGRvbWlkLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGli
eGxfZG9tYWluX2J1aWxkX2luZm8gKmluZm8pOwogCiAvKiBDYWxscyBwb2xsKCkgYWdhaW4gLSB1
c2VmdWwgdG8gY2hlY2sgd2hldGhlciBhIHNpZ25hbGVkIGNvbmRpdGlvbgogICogaXMgc3RpbGwg
dHJ1ZS4gIENhbm5vdCBmYWlsLiAgUmV0dXJucyBjdXJyZW50bHktdHJ1ZSByZXZlbnRzLiAqLwpk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfbm9jcHVpZC5jIGIvdG9vbHMvbGlieGwvbGli
eGxfbm9jcHVpZC5jCmluZGV4IGEzOWJhYmU3NTQuLjc3NzY1NzRhMGMgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL2xpYnhsL2xpYnhsX25vY3B1aWQuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9ub2NwdWlk
LmMKQEAgLTM0LDEyICszNCw4IEBAIGludCBsaWJ4bF9jcHVpZF9wYXJzZV9jb25maWdfeGVuZChs
aWJ4bF9jcHVpZF9wb2xpY3lfbGlzdCAqY3B1aWQsCiAgICAgcmV0dXJuIDA7CiB9CiAKLXZvaWQg
bGlieGxfX2NwdWlkX2FwcGx5X3BvbGljeShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQp
Ci17Ci19Ci0KLXZvaWQgbGlieGxfX2NwdWlkX3NldChsaWJ4bF9jdHggKmN0eCwgdWludDMyX3Qg
ZG9taWQsCi0gICAgICAgICAgICAgICAgICAgICAgbGlieGxfY3B1aWRfcG9saWN5X2xpc3QgY3B1
aWQpCit2b2lkIGxpYnhsX19jcHVpZF9sZWdhY3kobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRv
bWlkLAorICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29u
ZmlnKQogewogfQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
