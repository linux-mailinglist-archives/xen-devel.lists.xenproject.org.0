Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB75B16EC92
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 18:34:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6e3X-0006wR-Dn; Tue, 25 Feb 2020 17:31:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZMDu=4N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j6e3W-0006wE-I8
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 17:31:38 +0000
X-Inumbo-ID: acda6404-57f4-11ea-a490-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acda6404-57f4-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 17:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582651897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cNlO/PBRWz4sAvTFEtAoZ5fHdc7j8xdF8DKNOxjwkDc=;
 b=Cv2VxJbk+qwT9NfIbt+fLmi6vssfgmFyp8GagSp6T6e0M8lMiVCPjFTo
 FKNa1L+QIiSa9EQAaGUAOT5DDuutuAnP9KZ7TWMVSTyvHdjgdFH5nW7P7
 WNNGO95aIcwOGcf9TGYdfhJXIWcg7qRfrZanDvJBGcoMhsKLGzpo7r5KY I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 58j0mvkJ9QG9wy00ore+90V72X8y/PX4MzBCjuK2YolR52+jokV4hG2LYFc7yKQZT8+5Sf+GMC
 h2oqpWGRwPpmGkAZVOFLK7Q8x+nbcWGqI43n+cRucLx9fUxYzXGXhTxN1Bic/ApLGjamFHQpEJ
 bTOoOWuOWe3IKKy6XQfTbP14d8GhNA6E2QYcRaiJwxSd38sBCKWYNBfmUjAC7WY6Ug1z/7RAih
 z7VDBbGb8Wu9BzZzoKRVKdvYz/CcqOK1bo0g3viSaz0rb5sn9AYiuhGqkcEkfr8yv1YElyBEnq
 S/c=
X-SBRS: 2.7
X-MesageID: 13614986
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,484,1574139600"; d="scan'208";a="13614986"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 25 Feb 2020 17:31:33 +0000
Message-ID: <20200225173133.3632-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/sysctl: Don't return cpu policy data for
 compiled-out support
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

UG9saWN5IG9iamVjdHMgYXJlbid0IHRpbnksIGFuZCB0aGUgZGVyaXZhdGlvbiBsb2dpYyBpc24n
dCB0cml2aWFsLiAgV2UgYXJlCmFib3V0IHRvIGluY3JlYXNlIHRoZSBudW1iZXIgb2YgcG9saWN5
IG9iamVjdHMsIHNvIHRha2UgdGhpcyBvcHBvcnR1bml0eSB0bwpkcm9wIGxvZ2ljIGFuZCBzdG9y
YWdlIHNwYWNlIGJhc2VkIG9uIENPTkZJR197UFYsSFZNfS4KClN0YXJ0IGJ5IGNhdXNpbmcgWEVO
X1NZU0NUTF9nZXRfY3B1X3BvbGljeSB0byBmYWlsIHdpdGggLUVPUE5PVFNVUFAgd2hlbgpyZXF1
ZXN0aW5nIGRhdGEgZm9yIGEgY29tcGlsZWQtb3V0IHN1YnN5c3RlbS4gIFVwZGF0ZSB4ZW4tY3B1
aWQgdG8gY29wZSBhbmQKY29udGludWUgdG8gZnVydGhlciBzeXN0ZW0gcG9saWNpZXMsIHNlZWlu
ZyBhcyB0aGUgaW5kaWNpZXMgYXJlIGludGVybGVhdmVkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8
SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbWlzYy94ZW4tY3B1aWQu
YyAgICAgIHwgIDkgKysrKysrKysrCiB4ZW4vYXJjaC94ODYvc3lzY3RsLmMgICAgICAgfCAyMCAr
KysrKysrKysrKysrKystLS0tLQogeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oIHwgIDIgKysK
IDMgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS90b29scy9taXNjL3hlbi1jcHVpZC5jIGIvdG9vbHMvbWlzYy94ZW4tY3B1aWQuYwpp
bmRleCA3NzI2YzRlZDNjLi5mNTViNjc2NDBhIDEwMDY0NAotLS0gYS90b29scy9taXNjL3hlbi1j
cHVpZC5jCisrKyBiL3Rvb2xzL21pc2MveGVuLWNwdWlkLmMKQEAgLTQ4MCw3ICs0ODAsMTYgQEAg
aW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCiAgICAgICAgICAgICAgICAgaWYgKCB4
Y19nZXRfc3lzdGVtX2NwdV9wb2xpY3koeGNoLCBpLCAmbnJfbGVhdmVzLCBsZWF2ZXMsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm5yX21zcnMsIG1zcnMp
ICkKKyAgICAgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgICAgIGlmICggZXJybm8gPT0g
RU9QTk9UU1VQUCApCisgICAgICAgICAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAgICAg
ICAgIHByaW50ZigiJXMgcG9saWN5IG5vdCBzdXBwb3J0ZWQgYnkgWGVuXG4iLAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN5c19wb2xpY2llc1tpXSk7CisgICAgICAgICAgICAgICAg
ICAgICAgICBjb250aW51ZTsKKyAgICAgICAgICAgICAgICAgICAgfQorCiAgICAgICAgICAgICAg
ICAgICAgIGVycigxLCAieGNfZ2V0X3N5c3RlbV9jcHVfcG9saWN5KCwgJXMsLCkiLCBzeXNfcG9s
aWNpZXNbaV0pOworICAgICAgICAgICAgICAgIH0KIAogICAgICAgICAgICAgICAgIHByaW50X3Bv
bGljeShzeXNfcG9saWNpZXNbaV0sIGxlYXZlcywgbnJfbGVhdmVzLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtc3JzLCBucl9tc3JzKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9z
eXNjdGwuYyBiL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwppbmRleCA0YTc2ZjBmNDdmLi41OWEzODQw
MjNiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc3lzY3RsLmMKKysrIGIveGVuL2FyY2gveDg2
L3N5c2N0bC5jCkBAIC0zMyw3ICszMyw3IEBACiAjaW5jbHVkZSA8YXNtL3Bzci5oPgogI2luY2x1
ZGUgPGFzbS9jcHVpZC5oPgogCi1jb25zdCBzdHJ1Y3QgY3B1X3BvbGljeSBzeXN0ZW1fcG9saWNp
ZXNbXSA9IHsKK2NvbnN0IHN0cnVjdCBjcHVfcG9saWN5IHN5c3RlbV9wb2xpY2llc1s2XSA9IHsK
ICAgICBbIFhFTl9TWVNDVExfY3B1X3BvbGljeV9yYXcgXSA9IHsKICAgICAgICAgJnJhd19jcHVp
ZF9wb2xpY3ksCiAgICAgICAgICZyYXdfbXNyX3BvbGljeSwKQEAgLTQyLDIyICs0MiwyNiBAQCBj
b25zdCBzdHJ1Y3QgY3B1X3BvbGljeSBzeXN0ZW1fcG9saWNpZXNbXSA9IHsKICAgICAgICAgJmhv
c3RfY3B1aWRfcG9saWN5LAogICAgICAgICAmaG9zdF9tc3JfcG9saWN5LAogICAgIH0sCisjaWZk
ZWYgQ09ORklHX1BWCiAgICAgWyBYRU5fU1lTQ1RMX2NwdV9wb2xpY3lfcHZfbWF4IF0gPSB7CiAg
ICAgICAgICZwdl9tYXhfY3B1aWRfcG9saWN5LAogICAgICAgICAmcHZfbWF4X21zcl9wb2xpY3ks
CiAgICAgfSwKLSAgICBbIFhFTl9TWVNDVExfY3B1X3BvbGljeV9odm1fbWF4IF0gPSB7Ci0gICAg
ICAgICZodm1fbWF4X2NwdWlkX3BvbGljeSwKLSAgICAgICAgJmh2bV9tYXhfbXNyX3BvbGljeSwK
LSAgICB9LAogICAgIFsgWEVOX1NZU0NUTF9jcHVfcG9saWN5X3B2X2RlZmF1bHQgXSA9IHsKICAg
ICAgICAgJnB2X21heF9jcHVpZF9wb2xpY3ksCiAgICAgICAgICZwdl9tYXhfbXNyX3BvbGljeSwK
ICAgICB9LAorI2VuZGlmCisjaWZkZWYgQ09ORklHX0hWTQorICAgIFsgWEVOX1NZU0NUTF9jcHVf
cG9saWN5X2h2bV9tYXggXSA9IHsKKyAgICAgICAgJmh2bV9tYXhfY3B1aWRfcG9saWN5LAorICAg
ICAgICAmaHZtX21heF9tc3JfcG9saWN5LAorICAgIH0sCiAgICAgWyBYRU5fU1lTQ1RMX2NwdV9w
b2xpY3lfaHZtX2RlZmF1bHQgXSA9IHsKICAgICAgICAgJmh2bV9tYXhfY3B1aWRfcG9saWN5LAog
ICAgICAgICAmaHZtX21heF9tc3JfcG9saWN5LAogICAgIH0sCisjZW5kaWYKIH07CiAKIHN0cnVj
dCBsM19jYWNoZV9pbmZvIHsKQEAgLTQyNiw2ICs0MzAsMTIgQEAgbG9uZyBhcmNoX2RvX3N5c2N0
bCgKICAgICAgICAgICAgIGFycmF5X2luZGV4X25vc3BlYyhzeXNjdGwtPnUuY3B1X3BvbGljeS5p
bmRleCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKHN5c3RlbV9w
b2xpY2llcykpXTsKIAorICAgICAgICBpZiAoICFwb2xpY3ktPmNwdWlkIHx8ICFwb2xpY3ktPm1z
ciApCisgICAgICAgIHsKKyAgICAgICAgICAgIHJldCA9IC1FT1BOT1RTVVBQOworICAgICAgICAg
ICAgYnJlYWs7CisgICAgICAgIH0KKwogICAgICAgICAvKiBQcm9jZXNzIHRoZSBDUFVJRCBsZWF2
ZXMuICovCiAgICAgICAgIGlmICggZ3Vlc3RfaGFuZGxlX2lzX251bGwoc3lzY3RsLT51LmNwdV9w
b2xpY3kuY3B1aWRfcG9saWN5KSApCiAgICAgICAgICAgICBzeXNjdGwtPnUuY3B1X3BvbGljeS5u
cl9sZWF2ZXMgPSBDUFVJRF9NQVhfU0VSSUFMSVNFRF9MRUFWRVM7CmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKaW5k
ZXggN2U0M2JmZTFiZC4uNGRmYmEzOWVkOCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGlj
L3N5c2N0bC5oCisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaApAQCAtMTA1MSw2ICsx
MDUxLDggQEAgc3RydWN0IHhlbl9zeXNjdGxfc2V0X3BhcmFtZXRlciB7CiAgKiAgICAgICAgICAg
ICAgIGV4cGVyaW1lbnRhbCBmZWF0dXJlcyBvdXRzaWRlIG9mIHNlY3VyaXR5IHN1cHBvcnQuCiAg
KiAgLSBEZWZhdWx0Xyo6IERlZmF1bHQgc2V0IG9mIGZlYXR1cmVzIGEgUFYgb3IgSFZNIGd1ZXN0
IGNhbiB1c2UuICBUaGlzIGlzCiAgKiAgICAgICAgICAgICAgIHRoZSBzZWN1cml0eSBzdXBwb3J0
ZWQgc2V0LgorICogTWF5IGZhaWwgd2l0aCAtRU9QTk9UU1VQUCBpZiBxdWVyeWluZyBmb3IgUFYg
b3IgSFZNIGRhdGEgd2hlbiBzdXBwb3J0IGlzCisgKiBjb21waWxlZCBvdXQgb2YgWGVuLgogICov
CiBzdHJ1Y3QgeGVuX3N5c2N0bF9jcHVfcG9saWN5IHsKICNkZWZpbmUgWEVOX1NZU0NUTF9jcHVf
cG9saWN5X3JhdyAgICAgICAgICAwCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
