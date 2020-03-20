Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1074418DA22
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 22:29:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFP8h-0003uH-8t; Fri, 20 Mar 2020 21:25:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUly=5F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jFP8g-0003u3-8X
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 21:25:10 +0000
X-Inumbo-ID: 40a20f60-6af1-11ea-be18-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40a20f60-6af1-11ea-be18-12813bfff9fa;
 Fri, 20 Mar 2020 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584739500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RBQi4FtTtH8S07eLiEJoFsDh4jC3Cj57iZU7zh4E8vI=;
 b=WATd6HA3oxmlSZasq+bedkIMVhrQE3sBeMvzxDfy738S4mZoD1gZ+KUR
 kzLdsq5U4DhZytGcSCgE0EG7RtYjh3RtyyBJ+LGXUcVBfbGDLc62KGdFL
 IYiUrBbeN2D1sHZwx9lm3Rcdz+Pdr79YT6bbWNor6EHfxL29IBeRG9ASc w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3TRS0Zvbb6fY/iambXIdHVxTEMdcb+NYBHI4vF4oQYessG6RNQU00guQJv8x/Le9EQh2bMTOfI
 AZON4BbKT/CyD4QiVVFY4d3j0UtszU0W/KPz6W3Aal3ZtgxXCEgofoa1f5k3LKS3GK4VSwJ/ZB
 Z/mEO1MEsjPWfU2PNcBhlAHoR6kgxvSJCXAeIeyLZ/lA0SrpiDY4ATu0BziIIl1V+ANqzeQ84E
 EqtYbrOnmDWzJeyou5yikJTNPzVsCVg5HgpaboBQMCTU9xIN1TBe5qIippuvK+FQb7LU9WyMJy
 ghY=
X-SBRS: 2.7
X-MesageID: 14716098
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,286,1580792400"; d="scan'208";a="14716098"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 20 Mar 2020 21:24:50 +0000
Message-ID: <20200320212453.21685-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200320212453.21685-1-andrew.cooper3@citrix.com>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] x86/ucode: Fix error paths in
 apply_microcode()
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
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gdGhlIHVubGlrbGV5IGNhc2UgdGhhdCBwYXRjaCBhcHBsaWNhdGlvbiBjb21wbGV0ZXMsIGJ1
dCB0aGUgcmVzdXRsaW5nCnJldmlzaW9uIGlzbid0IGV4cGVjdGVkLCBzaWctPnJldiBkb2Vzbid0
IGdldCB1cGRhdGVkIHRvIG1hdGNoIHJlYWxpdHkuCgpJdCB3aWxsIGdldCBhZGp1c3RlZCB0aGUg
bmV4dCB0aW1lIGNvbGxlY3RfY3B1X2luZm8oKSBnZXRzIGNhbGxlZCwgYnV0IGluIHRoZQptZWFu
dGltZSBYZW4gbWlnaHQgb3BlcmF0ZSBvbiBhIHN0YXRlIHZhbHVlLiAgTm90aGluZyBnb29kIHdp
bGwgY29tZSBvZiB0aGlzLgoKUmV3cml0ZSB0aGUgbG9naWMgdG8gYWx3YXlzIHVwZGF0ZSB0aGUg
c3Rhc2hlZCByZXZpc2lvbiwgYmVmb3JlIHdvcnJpbmcgYWJvdXQKd2hldGhlciB0aGUgYXR0ZW1w
dCB3YXMgYSBzdWNjZXNzIG9yIGZhaWx1cmUuCgpUYWtlIHRoZSBvcHBvcnR1bml0eSB0byBtYWtl
IHRoZSBwcmludGsoKSBtZXNzYWdlcyBhcyBjb25zaXN0ZW50IGFzIHBvc3NpYmxlLgoKU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCi1D
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9h
cmNoL3g4Ni9jcHUvbWljcm9jb2RlL2FtZC5jICAgfCAxNCArKysrKysrLS0tLS0tLQogeGVuL2Fy
Y2gveDg2L2NwdS9taWNyb2NvZGUvaW50ZWwuYyB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvYW1kLmMgYi94ZW4vYXJjaC94ODYv
Y3B1L21pY3JvY29kZS9hbWQuYwppbmRleCBkNGIyODc0ZGU2Li5hMDUzZTQzOTIzIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYworKysgYi94ZW4vYXJjaC94ODYv
Y3B1L21pY3JvY29kZS9hbWQuYwpAQCAtMjI5LDExICsyMjksMTEgQEAgc3RhdGljIGVudW0gbWlj
cm9jb2RlX21hdGNoX3Jlc3VsdCBjb21wYXJlX3BhdGNoKAogCiBzdGF0aWMgaW50IGFwcGx5X21p
Y3JvY29kZShjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkKIHsKLSAgICB1aW50
MzJfdCByZXY7CiAgICAgaW50IGh3X2VycjsKICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3By
b2Nlc3Nvcl9pZCgpOwogICAgIHN0cnVjdCBjcHVfc2lnbmF0dXJlICpzaWcgPSAmcGVyX2NwdShj
cHVfc2lnLCBjcHUpOwogICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2FtZCAqaGRy
OworICAgIHVpbnQzMl90IHJldiwgb2xkX3JldiA9IHNpZy0+cmV2OwogCiAgICAgaWYgKCAhcGF0
Y2ggKQogICAgICAgICByZXR1cm4gLUVOT0VOVDsKQEAgLTI0OSw2ICsyNDksNyBAQCBzdGF0aWMg
aW50IGFwcGx5X21pY3JvY29kZShjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkK
IAogICAgIC8qIGdldCBwYXRjaCBpZCBhZnRlciBwYXRjaGluZyAqLwogICAgIHJkbXNybChNU1Jf
QU1EX1BBVENITEVWRUwsIHJldik7CisgICAgc2lnLT5yZXYgPSByZXY7CiAKICAgICAvKgogICAg
ICAqIFNvbWUgcHJvY2Vzc29ycyBsZWF2ZSB0aGUgdWNvZGUgYmxvYiBtYXBwaW5nIGFzIFVDIGFm
dGVyIHRoZSB1cGRhdGUuCkBAIC0yNTksMTUgKzI2MCwxNCBAQCBzdGF0aWMgaW50IGFwcGx5X21p
Y3JvY29kZShjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkKICAgICAvKiBjaGVj
ayBjdXJyZW50IHBhdGNoIGlkIGFuZCBwYXRjaCdzIGlkIGZvciBtYXRjaCAqLwogICAgIGlmICgg
aHdfZXJyIHx8IChyZXYgIT0gaGRyLT5wYXRjaF9pZCkgKQogICAgIHsKLSAgICAgICAgcHJpbnRr
KEtFUk5fRVJSICJtaWNyb2NvZGU6IENQVSVkIHVwZGF0ZSBmcm9tIHJldmlzaW9uICIKLSAgICAg
ICAgICAgICAgICIlI3ggdG8gJSN4IGZhaWxlZFxuIiwgY3B1LCByZXYsIGhkci0+cGF0Y2hfaWQp
OworICAgICAgICBwcmludGsoWEVOTE9HX0VSUgorICAgICAgICAgICAgICAgIm1pY3JvY29kZTog
Q1BVJXUgdXBkYXRlIHJldiAlI3ggdG8gJSN4IGZhaWxlZCwgcmVzdWx0ICUjeFxuIiwKKyAgICAg
ICAgICAgICAgIGNwdSwgb2xkX3JldiwgaGRyLT5wYXRjaF9pZCwgcmV2KTsKICAgICAgICAgcmV0
dXJuIC1FSU87CiAgICAgfQogCi0gICAgcHJpbnRrKEtFUk5fV0FSTklORyAibWljcm9jb2RlOiBD
UFUlZCB1cGRhdGVkIGZyb20gcmV2aXNpb24gJSN4IHRvICUjeFxuIiwKLSAgICAgICAgICAgY3B1
LCBzaWctPnJldiwgaGRyLT5wYXRjaF9pZCk7Ci0KLSAgICBzaWctPnJldiA9IHJldjsKKyAgICBw
cmludGsoWEVOTE9HX1dBUk5JTkcgIm1pY3JvY29kZTogQ1BVJXUgdXBkYXRlZCBmcm9tIHJldmlz
aW9uICUjeCB0byAlI3hcbiIsCisgICAgICAgICAgIGNwdSwgb2xkX3JldiwgaGRyLT5wYXRjaF9p
ZCk7CiAKICAgICByZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvbWlj
cm9jb2RlL2ludGVsLmMgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jCmluZGV4
IDVlOWMyYTljN2YuLjZhYzVmOTg2OTQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWlj
cm9jb2RlL2ludGVsLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvaW50ZWwuYwpA
QCAtMjc4LDEwICsyNzgsMTAgQEAgc3RhdGljIGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCBj
b21wYXJlX3BhdGNoKAogc3RhdGljIGludCBhcHBseV9taWNyb2NvZGUoY29uc3Qgc3RydWN0IG1p
Y3JvY29kZV9wYXRjaCAqcGF0Y2gpCiB7CiAgICAgdWludDY0X3QgbXNyX2NvbnRlbnQ7Ci0gICAg
dW5zaWduZWQgaW50IHZhbFsyXTsKLSAgICB1bnNpZ25lZCBpbnQgY3B1X251bSA9IHJhd19zbXBf
cHJvY2Vzc29yX2lkKCk7CisgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQo
KTsKICAgICBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAqc2lnID0gJnRoaXNfY3B1KGNwdV9zaWcpOwog
ICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaW50ZWwgKm1jX2ludGVsOworICAgIHVpbnQzMl90
IHJldiwgb2xkX3JldiA9IHNpZy0+cmV2OwogCiAgICAgaWYgKCAhcGF0Y2ggKQogICAgICAgICBy
ZXR1cm4gLUVOT0VOVDsKQEAgLTMwMiwyMCArMzAyLDIwIEBAIHN0YXRpYyBpbnQgYXBwbHlfbWlj
cm9jb2RlKGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoKQogCiAgICAgLyogZ2V0
IHRoZSBjdXJyZW50IHJldmlzaW9uIGZyb20gTVNSIDB4OEIgKi8KICAgICByZG1zcmwoTVNSX0lB
MzJfVUNPREVfUkVWLCBtc3JfY29udGVudCk7Ci0gICAgdmFsWzFdID0gKHVpbnQzMl90KShtc3Jf
Y29udGVudCA+PiAzMik7CisgICAgc2lnLT5yZXYgPSByZXYgPSBtc3JfY29udGVudCA+PiAzMjsK
IAotICAgIGlmICggdmFsWzFdICE9IG1jX2ludGVsLT5oZHIucmV2ICkKKyAgICBpZiAoIHJldiAh
PSBtY19pbnRlbC0+aGRyLnJldiApCiAgICAgewotICAgICAgICBwcmludGsoS0VSTl9FUlIgIm1p
Y3JvY29kZTogQ1BVJWQgdXBkYXRlIGZyb20gcmV2aXNpb24gIgotICAgICAgICAgICAgICAgIiUj
eCB0byAlI3ggZmFpbGVkLiBSZXN1bHRpbmcgcmV2aXNpb24gaXMgJSN4LlxuIiwgY3B1X251bSwK
LSAgICAgICAgICAgICAgIHNpZy0+cmV2LCBtY19pbnRlbC0+aGRyLnJldiwgdmFsWzFdKTsKKyAg
ICAgICAgcHJpbnRrKFhFTkxPR19FUlIKKyAgICAgICAgICAgICAgICJtaWNyb2NvZGU6IENQVSV1
IHVwZGF0ZSByZXYgJSN4IHRvICUjeCBmYWlsZWQsIHJlc3VsdCAlI3hcbiIsCisgICAgICAgICAg
ICAgICBjcHUsIG9sZF9yZXYsIG1jX2ludGVsLT5oZHIucmV2LCByZXYpOwogICAgICAgICByZXR1
cm4gLUVJTzsKICAgICB9Ci0gICAgcHJpbnRrKEtFUk5fSU5GTyAibWljcm9jb2RlOiBDUFUlZCB1
cGRhdGVkIGZyb20gcmV2aXNpb24gIgotICAgICAgICAgICAiJSN4IHRvICUjeCwgZGF0ZSA9ICUw
NHgtJTAyeC0lMDJ4XG4iLAotICAgICAgICAgICBjcHVfbnVtLCBzaWctPnJldiwgdmFsWzFdLCBt
Y19pbnRlbC0+aGRyLnllYXIsCisKKyAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcKKyAgICAgICAg
ICAgIm1pY3JvY29kZTogQ1BVJXUgdXBkYXRlZCBmcm9tIHJldmlzaW9uICUjeCB0byAlI3gsIGRh
dGUgPSAlMDR4LSUwMngtJTAyeFxuIiwKKyAgICAgICAgICAgY3B1LCBvbGRfcmV2LCByZXYsIG1j
X2ludGVsLT5oZHIueWVhciwKICAgICAgICAgICAgbWNfaW50ZWwtPmhkci5tb250aCwgbWNfaW50
ZWwtPmhkci5kYXkpOwotICAgIHNpZy0+cmV2ID0gdmFsWzFdOwogCiAgICAgcmV0dXJuIDA7CiB9
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
