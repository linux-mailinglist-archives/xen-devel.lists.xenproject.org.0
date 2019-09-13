Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BF1B2614
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 21:31:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8rEs-0006nL-81; Fri, 13 Sep 2019 19:28:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bj/4=XI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8rEq-0006n8-Ck
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 19:28:12 +0000
X-Inumbo-ID: 9ccc2f6c-d65c-11e9-a337-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ccc2f6c-d65c-11e9-a337-bc764e2007e4;
 Fri, 13 Sep 2019 19:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568402888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KxL0uF2fdDQlL0Z8KL8i80DFo81YGc/cGCmm6s1ebNU=;
 b=dOktXEOmTXmBv5tS/DWE+6o/VqerM7tWbGBXZlA+8Y6Qtey4PjACGIus
 C4MQRVRNw/a298xlNjdr7BgCbKGFr1Z4FtqTbk/U3nj7i088faS+4U/LI
 QqxfIbLdIaqql5zaNqrhQwG9Z/7Fra41GInh1pxzxqAOA4swRqK4jvc2p Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kONV0tIMmPtfzNhFdtJRIP8t8gpPESNuhXx3RYJ+BcSileBkqC+fI9yURoJJpvHkalyjHnXcPT
 oE2ONdPXpV5Qyk/IIkObJQv3zqE3kBW4dJBdmz7tGMBYc9XLQI60yNlaVjNKHY/gYdl2xgF2a3
 acdcQ8EcBl8mKZeLsigHDO13MYf5S57R8RQQVRdwlmLGSVqW8FfgSQO2bgB/cllu/HvC+ET+fh
 zuA9VbWxuHKKCltrw3XWZ8p545TDA7GaHkHSEEcOw1JM9AGkgsSi1h6wpYa7KYVIM0A/7WaoWk
 W1s=
X-SBRS: 2.7
X-MesageID: 5553060
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5553060"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 20:27:56 +0100
Message-ID: <20190913192759.10795-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190913192759.10795-1-andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 07/10] tools/libxc: Rework xc_cpuid_set() to
 use {get, set}_cpu_policy()
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
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHB1cnBvc2Ugb2YgdGhpcyBjaGFuZ2UgaXMgdG8gc3RvcCB1c2luZyB4Y19jcHVpZF9kb19k
b21jdGwoKSwgYW5kIHRvIHN0b3AKYmFzaW5nIGRlY2lzaW9ucyBvbiBhIGxvY2FsIENQVUlEIGlu
c3RydWN0aW9uLiAgVGhpcyBpcyBub3QgYW4gYXBwcm9wcmlhdGUgd2F5CnRvIGNvbnN0cnVjdCBw
b2xpY3kgaW5mb3JtYXRpb24gZm9yIG90aGVyIGRvbWFpbnMuCgpPYnRhaW4gdGhlIGhvc3QgYW5k
IGRvbWFpbi1tYXggcG9saWNpZXMgZnJvbSBYZW4sIGFuZCBtaXggdGhlIHJlc3VsdHMgYXMKYmVm
b3JlLiAgUHJvdmlkZSByYXRoZXIgbW9yZSBlcnJvciBsb2dnaW5nIHRoYW4gYmVmb3JlLgoKTm8g
c2VtYW50aWNzIGNoYW5nZXMgdG8geGNfY3B1aWRfc2V0KCkuICBUaGVyZSBhcmUgY29uY2VwdHVh
bCBwcm9ibGVtcyB3aXRoCmhvdyB0aGUgZnVuY3Rpb24gd29ya3MsIHdoaWNoIHdpbGwgYmUgYWRk
cmVzc2VkIGluIGZ1dHVyZSB0b29sc3RhY2sgd29yay4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgpDQzogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+
Ci0tLQogdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgfCA5NSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgODQgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfY3B1aWRf
eDg2LmMgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwppbmRleCA4Nzg1Y2FlMzI5Li43N2Y5
NmE0ZWE2IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYworKysgYi90b29s
cy9saWJ4Yy94Y19jcHVpZF94ODYuYwpAQCAtOTAyLDIwICs5MDIsODAgQEAgaW50IHhjX2NwdWlk
X3NldCgKICAgICBjb25zdCBjaGFyICoqY29uZmlnLCBjaGFyICoqY29uZmlnX3RyYW5zZm9ybWVk
KQogewogICAgIGludCByYzsKLSAgICB1bnNpZ25lZCBpbnQgaSwgaiwgcmVnc1s0XSwgcG9scmVn
c1s0XTsKLSAgICBzdHJ1Y3QgY3B1aWRfZG9tYWluX2luZm8gaW5mbyA9IHt9OworICAgIHVuc2ln
bmVkIGludCBpLCBqLCByZWdzWzRdID0ge30sIHBvbHJlZ3NbNF0gPSB7fTsKKyAgICB4Y19kb21p
bmZvX3QgZGk7CisgICAgeGVuX2NwdWlkX2xlYWZfdCAqbGVhdmVzID0gTlVMTDsKKyAgICB1bnNp
Z25lZCBpbnQgbnJfbGVhdmVzLCBwb2xpY3lfbGVhdmVzLCBucl9tc3JzOworICAgIHVpbnQzMl90
IGVycl9sZWFmID0gLTEsIGVycl9zdWJsZWFmID0gLTEsIGVycl9tc3IgPSAtMTsKIAogICAgIGZv
ciAoIGkgPSAwOyBpIDwgNDsgKytpICkKICAgICAgICAgY29uZmlnX3RyYW5zZm9ybWVkW2ldID0g
TlVMTDsKIAotICAgIHJjID0gZ2V0X2NwdWlkX2RvbWFpbl9pbmZvKHhjaCwgZG9taWQsICZpbmZv
LCBOVUxMLCAwKTsKKyAgICBpZiAoIHhjX2RvbWFpbl9nZXRpbmZvKHhjaCwgZG9taWQsIDEsICZk
aSkgIT0gMSB8fAorICAgICAgICAgZGkuZG9taWQgIT0gZG9taWQgKQorICAgIHsKKyAgICAgICAg
RVJST1IoIkZhaWxlZCB0byBvYnRhaW4gZCVkIGluZm8iLCBkb21pZCk7CisgICAgICAgIHJjID0g
LUVTUkNIOworICAgICAgICBnb3RvIGZhaWw7CisgICAgfQorCisgICAgcmMgPSB4Y19nZXRfY3B1
X3BvbGljeV9zaXplKHhjaCwgJm5yX2xlYXZlcywgJm5yX21zcnMpOwogICAgIGlmICggcmMgKQot
ICAgICAgICBnb3RvIG91dDsKKyAgICB7CisgICAgICAgIFBFUlJPUigiRmFpbGVkIHRvIG9idGFp
biBwb2xpY3kgaW5mbyBzaXplIik7CisgICAgICAgIHJjID0gLWVycm5vOworICAgICAgICBnb3Rv
IGZhaWw7CisgICAgfQogCi0gICAgY3B1aWQoaW5wdXQsIHJlZ3MpOworICAgIHJjID0gLUVOT01F
TTsKKyAgICBpZiAoIChsZWF2ZXMgPSBjYWxsb2MobnJfbGVhdmVzLCBzaXplb2YoKmxlYXZlcykp
KSA9PSBOVUxMICkKKyAgICB7CisgICAgICAgIEVSUk9SKCJVbmFibGUgdG8gYWxsb2NhdGUgbWVt
b3J5IGZvciAldSBDUFVJRCBsZWF2ZXMiLCBucl9sZWF2ZXMpOworICAgICAgICBnb3RvIGZhaWw7
CisgICAgfQogCi0gICAgbWVtY3B5KHBvbHJlZ3MsIHJlZ3MsIHNpemVvZihyZWdzKSk7Ci0gICAg
eGNfY3B1aWRfcG9saWN5KCZpbmZvLCBpbnB1dCwgcG9scmVncyk7CisgICAgLyogR2V0IHRoZSBk
b21haW4ncyBtYXggcG9saWN5LiAqLworICAgIG5yX21zcnMgPSAwOworICAgIHBvbGljeV9sZWF2
ZXMgPSBucl9sZWF2ZXM7CisgICAgcmMgPSB4Y19nZXRfc3lzdGVtX2NwdV9wb2xpY3koeGNoLCBk
aS5odm0gPyBYRU5fU1lTQ1RMX2NwdV9wb2xpY3lfaHZtX21heAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogWEVOX1NZU0NUTF9jcHVfcG9saWN5X3B2X21h
eCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcG9saWN5X2xlYXZlcywgbGVh
dmVzLCAmbnJfbXNycywgTlVMTCk7CisgICAgaWYgKCByYyApCisgICAgeworICAgICAgICBQRVJS
T1IoIkZhaWxlZCB0byBvYnRhaW4gJXMgbWF4IHBvbGljeSIsIGRpLmh2bSA/ICJodm0iIDogInB2
Iik7CisgICAgICAgIHJjID0gLWVycm5vOworICAgICAgICBnb3RvIGZhaWw7CisgICAgfQorICAg
IGZvciAoIGkgPSAwOyBpIDwgcG9saWN5X2xlYXZlczsgKytpICkKKyAgICAgICAgaWYgKCBsZWF2
ZXNbaV0ubGVhZiA9PSBpbnB1dFswXSAmJiBsZWF2ZXNbaV0uc3VibGVhZiA9PSBpbnB1dFsxXSAp
CisgICAgICAgIHsKKyAgICAgICAgICAgIHBvbHJlZ3NbMF0gPSBsZWF2ZXNbaV0uYTsKKyAgICAg
ICAgICAgIHBvbHJlZ3NbMV0gPSBsZWF2ZXNbaV0uYjsKKyAgICAgICAgICAgIHBvbHJlZ3NbMl0g
PSBsZWF2ZXNbaV0uYzsKKyAgICAgICAgICAgIHBvbHJlZ3NbM10gPSBsZWF2ZXNbaV0uZDsKKyAg
ICAgICAgICAgIGJyZWFrOworICAgICAgICB9CisKKyAgICAvKiBHZXQgdGhlIGhvc3QgcG9saWN5
LiAqLworICAgIG5yX21zcnMgPSAwOworICAgIHBvbGljeV9sZWF2ZXMgPSBucl9sZWF2ZXM7Cisg
ICAgcmMgPSB4Y19nZXRfc3lzdGVtX2NwdV9wb2xpY3koeGNoLCBYRU5fU1lTQ1RMX2NwdV9wb2xp
Y3lfaG9zdCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcG9saWN5X2xlYXZl
cywgbGVhdmVzLCAmbnJfbXNycywgTlVMTCk7CisgICAgaWYgKCByYyApCisgICAgeworICAgICAg
ICBQRVJST1IoIkZhaWxlZCB0byBvYnRhaW4gaG9zdCBwb2xpY3kiKTsKKyAgICAgICAgcmMgPSAt
ZXJybm87CisgICAgICAgIGdvdG8gZmFpbDsKKyAgICB9CisgICAgZm9yICggaSA9IDA7IGkgPCBw
b2xpY3lfbGVhdmVzOyArK2kgKQorICAgICAgICBpZiAoIGxlYXZlc1tpXS5sZWFmID09IGlucHV0
WzBdICYmIGxlYXZlc1tpXS5zdWJsZWFmID09IGlucHV0WzFdICkKKyAgICAgICAgeworICAgICAg
ICAgICAgcmVnc1swXSA9IGxlYXZlc1tpXS5hOworICAgICAgICAgICAgcmVnc1sxXSA9IGxlYXZl
c1tpXS5iOworICAgICAgICAgICAgcmVnc1syXSA9IGxlYXZlc1tpXS5jOworICAgICAgICAgICAg
cmVnc1szXSA9IGxlYXZlc1tpXS5kOworICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIH0KIAog
ICAgIGZvciAoIGkgPSAwOyBpIDwgNDsgaSsrICkKICAgICB7CkBAIC05NjYsOSArMTAyNiwyMSBA
QCBpbnQgeGNfY3B1aWRfc2V0KAogICAgICAgICB9CiAgICAgfQogCi0gICAgcmMgPSB4Y19jcHVp
ZF9kb19kb21jdGwoeGNoLCBkb21pZCwgaW5wdXQsIHJlZ3MpOwotICAgIGlmICggcmMgPT0gMCAp
Ci0gICAgICAgIGdvdG8gb3V0OworICAgIC8qIEZlZWQgdGhlIHRyYW5zZm9ybWVkIGxlYWYgYmFj
ayB1cCB0byBYZW4uICovCisgICAgbGVhdmVzWzBdID0gKHhlbl9jcHVpZF9sZWFmX3QpeyBpbnB1
dFswXSwgaW5wdXRbMV0sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWdz
WzBdLCByZWdzWzFdLCByZWdzWzJdLCByZWdzWzNdIH07CisgICAgcmMgPSB4Y19zZXRfZG9tYWlu
X2NwdV9wb2xpY3koeGNoLCBkb21pZCwgMSwgbGVhdmVzLCAwLCBOVUxMLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICZlcnJfbGVhZiwgJmVycl9zdWJsZWFmLCAmZXJyX21zcik7
CisgICAgaWYgKCByYyApCisgICAgeworICAgICAgICBQRVJST1IoIkZhaWxlZCB0byBzZXQgZCVk
J3MgcG9saWN5IChlcnIgbGVhZiAlI3gsIHN1YmxlYWYgJSN4LCBtc3IgJSN4KSIsCisgICAgICAg
ICAgICAgICBkb21pZCwgZXJyX2xlYWYsIGVycl9zdWJsZWFmLCBlcnJfbXNyKTsKKyAgICAgICAg
cmMgPSAtZXJybm87CisgICAgICAgIGdvdG8gZmFpbDsKKyAgICB9CisKKyAgICAvKiBTdWNjZXNz
ISAqLworICAgIGdvdG8gb3V0OwogCiAgZmFpbDoKICAgICBmb3IgKCBpID0gMDsgaSA8IDQ7IGkr
KyApCkBAIC05NzgsNiArMTA1MCw3IEBAIGludCB4Y19jcHVpZF9zZXQoCiAgICAgfQogCiAgb3V0
OgotICAgIGZyZWVfY3B1aWRfZG9tYWluX2luZm8oJmluZm8pOworICAgIGZyZWUobGVhdmVzKTsK
KwogICAgIHJldHVybiByYzsKIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
