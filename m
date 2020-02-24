Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A31716A846
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 15:25:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Ed7-0007sE-JA; Mon, 24 Feb 2020 14:22:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j6Ed6-0007s4-3t
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 14:22:40 +0000
X-Inumbo-ID: 1a61e61c-5711-11ea-8fc3-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a61e61c-5711-11ea-8fc3-bc764e2007e4;
 Mon, 24 Feb 2020 14:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582554159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PrTcGZjCfX4mw5/DeW/ZK38uM4L2M6blEk4voumThUc=;
 b=FyaAc0fB6Ayp8ljz+WS8YHVDXnMQcyy8GQ6KDJ4VgpbQmNL1OnAQhnFd
 Nj9LZSbaCe85Mg6ftgJQ0nFoXtwpAxaGcVMNB177fkYfSDNVh8UJlKSEo
 5RJGOAxhSGN2/wcW7NPyTXQIG/2Wd+bJE3pIZPNTj+ZUXGGVzLgpxHTna s=;
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
IronPort-SDR: a7inpJKr3okox+CK/vGhP/BoIQpaYDdFYxsjcyWkzXgGJOn2r7+29PtoQr7ri4hWqiLSYjZr3K
 MUkNha03yyZVTuJJo+4v7hW9DWDT3KQwHNhYxgSWOpyFYOUthDFZkG4Q4aYYNcPBW6wUzWz5xL
 tT7855oz0oj81KWt12YJQXxHl1kJHzdLI26+nGWCcEgZGcuH8zl+pOE7ZikLEMn/oWR6/0plGB
 9yO4v4mQDf/5NbR5V17BY7yRNQ3vkykQcgbT+R8jh1P2anufQ4gD/Yx72v+CJ4f9edAOx/rWIq
 HFY=
X-SBRS: 2.7
X-MesageID: 12890964
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="12890964"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 24 Feb 2020 14:22:31 +0000
Message-ID: <20200224142231.31097-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/msr: Drop {pv,hvm}_max_vcpu_msrs objects
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

SXQgdHVybnMgb3V0IHRoYXQgdGhlc2UgYXJlIHVudXNlZCwgYW5kIHdlIGR1cCBhIHR5cGUtZGVw
ZW5kZW50IGJsb2NrIG9mCnplcm9zLiAgVXNlIHh6YWxsb2MoKSBpbnN0ZWFkLgoKUmVhZC93cml0
ZSBNU1JzIGFyZSB0eXBpY2FsbHkgMCB0byBiZWluZyB3aXRoLCBhbmQgbm9uLXplcm8gZGVmYXVs
dHMgd291bGQKbmVlZCBkZWFsaW5nIHdpdGggYXQgc3VpdGFibGUgSU5JVC9SRVNFVCBwb2ludHMg
KGUuZy4gYXJjaF92Y3B1X3JlZ3NfaW5pdCkuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGlj
aEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbXNyLmMgfCA4ICstLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L21zci5jIGIveGVuL2FyY2gveDg2L21zci5jCmluZGV4IGRk
MjZjODc3NTguLjNlYmY3NzdjNTMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tc3IuYworKysg
Yi94ZW4vYXJjaC94ODYvbXNyLmMKQEAgLTM1LDkgKzM1LDYgQEAgc3RydWN0IG1zcl9wb2xpY3kg
X19yZWFkX21vc3RseSAgICAgcmF3X21zcl9wb2xpY3ksCiAgICAgICAgICAgICAgICAgICBfX3Jl
YWRfbW9zdGx5IGh2bV9tYXhfbXNyX3BvbGljeSwKICAgICAgICAgICAgICAgICAgIF9fcmVhZF9t
b3N0bHkgIHB2X21heF9tc3JfcG9saWN5OwogCi1zdHJ1Y3QgdmNwdV9tc3JzIF9fcmVhZF9tb3N0
bHkgaHZtX21heF92Y3B1X21zcnMsCi0gICAgICAgICAgICAgICAgIF9fcmVhZF9tb3N0bHkgIHB2
X21heF92Y3B1X21zcnM7Ci0KIHN0YXRpYyB2b2lkIF9faW5pdCBjYWxjdWxhdGVfcmF3X3BvbGlj
eSh2b2lkKQogewogICAgIC8qIDB4MDAwMDAwY2UgIE1TUl9JTlRFTF9QTEFURk9STV9JTkZPICov
CkBAIC0xMDMsMTAgKzEwMCw3IEBAIGludCBpbml0X2RvbWFpbl9tc3JfcG9saWN5KHN0cnVjdCBk
b21haW4gKmQpCiAKIGludCBpbml0X3ZjcHVfbXNyX3BvbGljeShzdHJ1Y3QgdmNwdSAqdikKIHsK
LSAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwotICAgIHN0cnVjdCB2Y3B1X21zcnMg
Km1zcnMgPQotICAgICAgICB4bWVtZHVwKGlzX3B2X2RvbWFpbihkKSA/ICAmcHZfbWF4X3ZjcHVf
bXNycwotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICZodm1fbWF4X3ZjcHVfbXNy
cyk7CisgICAgc3RydWN0IHZjcHVfbXNycyAqbXNycyA9IHh6YWxsb2MoKm1zcnMpOwogCiAgICAg
aWYgKCAhbXNycyApCiAgICAgICAgIHJldHVybiAtRU5PTUVNOwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
