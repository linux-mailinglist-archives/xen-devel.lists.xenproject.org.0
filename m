Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825628B7EE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 14:05:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxVUT-00045G-Hw; Tue, 13 Aug 2019 12:01:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxVUR-00044y-W2
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 12:01:24 +0000
X-Inumbo-ID: 106c956e-bdc2-11e9-a7ad-afdb04ed2b71
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 106c956e-bdc2-11e9-a7ad-afdb04ed2b71;
 Tue, 13 Aug 2019 12:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565697682;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qr0bRkGN+EgzDwVian4any+2EppgtZJDXAK9TJtaaao=;
 b=XwFtMqT1hSMSuJQoqXhjqyf6XO6fkH6/btl6qhVVQiZgslmzGcTmoAmW
 9oEn/drf5cc+5KHLsX5/f/ONF2AP8AqZjfiLShXJqfgIieTqM/C4vC8W2
 3PrTo2ga32JhMdyy8o16mDGiR6g/xHtqdVDGMcPYTf+yaPnXQryn2vyJk Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gOb0rFYKmhRBpSEoqGn2adWlb31A1DplCt76fLpKxAvSnkVgilz8tfKTukNymegDENiG8p7DnF
 KTmT5jSp1KOQueIc0N1KHbbFD0G0OYx8Vn7qEZMvDyxzfAuf/QrhTXgnwLmxTSeq+n8LY2ejWx
 C9OGFFtb0YDrbFGAh+wiF2joOke3kMf5RAprkbPj497rVRRcMloMt7GIexFa46Wom8Wwwu63Gt
 MXh4LJmtrbdkVMF8RJS1ZazsZgZXDvgI6qA0kEdQc5eljItO5rUFrWQ6wRWqqDp0uEkFlb90OH
 PaU=
X-SBRS: 2.7
X-MesageID: 4242438
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4242438"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 13 Aug 2019 13:01:17 +0100
Message-ID: <20190813120117.22528-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/tss: Fix clang build following c/s
 7888440625
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

Q2xhbmctMy41IGZyb20gRGViaWFuIEplc3NpZSBmYWlscyB3aXRoOgoKICBzbXBib290LmM6ODI5
OjI5OiBlcnJvcjogc3RhdGVtZW50IGV4cHJlc3Npb24gbm90IGFsbG93ZWQgYXQgZmlsZSBzY29w
ZQogICAgICAgICAgQlVJTERfQlVHX09OKHNpemVvZih0aGlzX2NwdSh0c3NfcGFnZSkpICE9IFBB
R0VfU0laRSk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICAvbG9jYWwveGVuLmdp
dC94ZW4vaW5jbHVkZS9hc20vcGVyY3B1Lmg6MTQ6Nzogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNy
bwogICAgICAgICAgJ3RoaXNfY3B1JwogICAgICAoKlJFTE9DX0hJREUoJnBlcl9jcHVfXyMjdmFy
LCBnZXRfY3B1X2luZm8oKS0+cGVyX2NwdV9vZmZzZXQpKQogICAgICAgIF4KICAvbG9jYWwveGVu
LmdpdC94ZW4vaW5jbHVkZS94ZW4vY29tcGlsZXIuaDo5ODozOiBub3RlOiBleHBhbmRlZCBmcm9t
IG1hY3JvCiAgICAgICAgICAnUkVMT0NfSElERScKICAgICh7IHVuc2lnbmVkIGxvbmcgX19wdHI7
ICAgICAgICAgICAgICAgICAgICAgICBcCiAgICBeCiAgL2xvY2FsL3hlbi5naXQveGVuL2luY2x1
ZGUveGVuL2xpYi5oOjI2OjUzOiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvCiAgICAgICAgICAn
QlVJTERfQlVHX09OJwogICNkZWZpbmUgQlVJTERfQlVHX09OKGNvbmQpICgodm9pZClCVUlMRF9C
VUdfT05fWkVSTyhjb25kKSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXgogIC9sb2NhbC94ZW4uZ2l0L3hlbi9pbmNsdWRlL3hlbi9saWIuaDoy
NTo1Nzogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybwogICAgICAgICAgJ0JVSUxEX0JVR19PTl9a
RVJPJwogICNkZWZpbmUgQlVJTERfQlVHX09OX1pFUk8oY29uZCkgc2l6ZW9mKHN0cnVjdCB7IGlu
dDotISEoY29uZCk7IH0pCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeCiAgMSBlcnJvciBnZW5lcmF0ZWQuCiAgL2xvY2FsL3hlbi5naXQv
eGVuL1J1bGVzLm1rOjIwMjogcmVjaXBlIGZvciB0YXJnZXQgJ3NtcGJvb3QubycgZmFpbGVkCgpU
aGlzIGlzIG9idmlvdXNseSBhIGNvbXBpbGVyIGJ1ZyBiZWNhdXNlIHRoZSBCVUlMRF9CVUdfT04o
KSBpcyBub3QgYXQgZmlsZQpzY29wZS4gIEhvd2V2ZXIsIGl0IGNhbiBiZSB3b3JrZWQgYXJvdW5k
IGJ5IHVzaW5nIGEgbG9jYWwgdmFyaWFibGUuCgpTcG90dGVkIGJ5IEdpdGxhYiBDSS4KClNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpD
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9h
cmNoL3g4Ni9zbXBib290LmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5j
IGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwppbmRleCA1MDU3MTA5YTc3Li44NWM4MWMyNDdlIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBi
b290LmMKQEAgLTgyNiw5ICs4MjYsMTEgQEAgc3RhdGljIGludCBzZXR1cF9jcHVfcm9vdF9wZ3Qo
dW5zaWduZWQgaW50IGNwdSkKICAgICAgICAgcmMgPSBjbG9uZV9tYXBwaW5nKGlkdF90YWJsZXNb
Y3B1XSwgcnB0KTsKICAgICBpZiAoICFyYyApCiAgICAgewotICAgICAgICBCVUlMRF9CVUdfT04o
c2l6ZW9mKHRoaXNfY3B1KHRzc19wYWdlKSkgIT0gUEFHRV9TSVpFKTsKKyAgICAgICAgc3RydWN0
IHRzc19wYWdlICp0aGlzX3RzcyA9ICZwZXJfY3B1KHRzc19wYWdlLCBjcHUpOwogCi0gICAgICAg
IHJjID0gY2xvbmVfbWFwcGluZygmcGVyX2NwdSh0c3NfcGFnZSwgY3B1KS50c3MsIHJwdCk7Cisg
ICAgICAgIEJVSUxEX0JVR19PTihzaXplb2YoKnRoaXNfdHNzKSAhPSBQQUdFX1NJWkUpOworCisg
ICAgICAgIHJjID0gY2xvbmVfbWFwcGluZygmdGhpc190c3MtPnRzcywgcnB0KTsKICAgICB9CiAg
ICAgaWYgKCAhcmMgKQogICAgICAgICByYyA9IGNsb25lX21hcHBpbmcoKHZvaWQgKilwZXJfY3B1
KHN0dWJzLmFkZHIsIGNwdSksIHJwdCk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
