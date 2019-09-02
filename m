Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12619A55BB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 14:18:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4lEk-0007Z4-Dp; Mon, 02 Sep 2019 12:15:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jggy=W5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i4lEj-0007Yy-6r
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 12:15:09 +0000
X-Inumbo-ID: 4d8325d0-cd7b-11e9-aea1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d8325d0-cd7b-11e9-aea1-12813bfff9fa;
 Mon, 02 Sep 2019 12:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567426508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wLEkaV6ms5gU8RgRUu1/pZdh19+1yvzMwiM9139zOJY=;
 b=en6GdqFhMNLxRU1HJQwDA/af0ZKd/pCuaR2a2XLmqmf9Pk2WQTbth/E/
 P/HZhLkGlgZxeUMWA6DwucLTSNX4NWguiTQBonmbwKya0tbsiF4VfKehq
 pr/Xv2657eMH29Gu1ZkYDkmzBGHRhHXSQwy18qr6AmUQUdaOC79Jurtny A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G3S4Ha172P3YSv3GJY/H6Xf1GgEixxjKUP+9K9OsRu5HYsV7SiJNcmhCGLqTi63tHRo5H6vQar
 l30ozMdRTJ+I7KI8/OQc6mykcVU/kYHzaFh4DgUFRxyec9IBuk7Ps7HpXJJxkQqjA0kysNi1ee
 iWtBeunC3GRM/l247/JGLQkU0O3+Yd0YxN6ScvTyK3OoPp7cIsTtWPBmuKLOV/ldYnwTin/eTh
 mQdceijd52isqn/W66YNYGwdBhDlK90SB1tlcZUO009k/pduKQ+/1xZ+/jXHYJbJ1opA43k08m
 faQ=
X-SBRS: 2.7
X-MesageID: 5024762
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5024762"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 13:14:59 +0100
Message-ID: <20190902121459.11855-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190902121151.11384-1-andrew.cooper3@citrix.com>
References: <20190902121151.11384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] x86/apci: Adjust command line parsing for
 "acpi_sleep"
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

UGVyZm9ybSBwYXJzaW5nIGluIGEgY3VzdG9tX3BhcmFtLCByYXRoZXIgdGhhbiBzdGFzaGluZyB0
aGUgY29udGVudCBpbiBhCnN0cmluZyBhbmQgcGFyc2luZyBpbiBhbiBpbml0Y2FsbC4gIEFkanVz
dCB0aGUgcGFyc2luZyB0byBjb25mb3JtIHRvIGN1cnJlbnQKc3RhbmRhcmRzLgoKTm8gcHJhY3Rp
Y2FsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgoKVGhlIHJlYXNvbiB0aGF0IGZsYWdzIGlzIHB1bGxlZCBpbnRvIGEgbG9jYWwgdmFy
aWFibGUgaXMgdGhhdCB0aGUgY29kZWdlbiBmb3IKYWNwaV92aWRlb19mbGFncyBpcyBhdHRyb2Np
b3VzLCAyNjAgYnl0ZXMhLCBhbmQgZG91YmxlcyB1cCB3aGVuIHVzZWQgdHdpY2UuCi0tLQogeGVu
L2FyY2gveDg2L2FjcGkvcG93ZXIuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMjEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyBiL3hl
bi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKaW5kZXggNmFlOWUyOTIyOS4uNDE0YmRhMjA1ZCAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYworKysgYi94ZW4vYXJjaC94ODYvYWNw
aS9wb3dlci5jCkBAIC0zMyw4ICszMywzMiBAQAogCiB1aW50MzJfdCBzeXN0ZW1fcmVzZXRfY291
bnRlciA9IDE7CiAKLXN0YXRpYyBjaGFyIF9faW5pdGRhdGEgb3B0X2FjcGlfc2xlZXBbMjBdOwot
c3RyaW5nX3BhcmFtKCJhY3BpX3NsZWVwIiwgb3B0X2FjcGlfc2xlZXApOworc3RhdGljIGludCBf
X2luaXQgcGFyc2VfYWNwaV9zbGVlcChjb25zdCBjaGFyICpzKQoreworICAgIGNvbnN0IGNoYXIg
KnNzOworICAgIHVuc2lnbmVkIGludCBmbGFnID0gMDsKKyAgICBpbnQgcmMgPSAwOworCisgICAg
ZG8geworICAgICAgICBzcyA9IHN0cmNocihzLCAnLCcpOworICAgICAgICBpZiAoICFzcyApCisg
ICAgICAgICAgICBzcyA9IHN0cmNocihzLCAnXDAnKTsKKworICAgICAgICBpZiAoICFjbWRsaW5l
X3N0cmNtcChzLCAiczNfYmlvcyIpICkKKyAgICAgICAgICAgIGZsYWcgfD0gMTsKKyAgICAgICAg
ZWxzZSBpZiAoICFjbWRsaW5lX3N0cmNtcChzLCAiczNfbW9kZSIpICkKKyAgICAgICAgICAgIGZs
YWcgfD0gMjsKKyAgICAgICAgZWxzZQorICAgICAgICAgICAgcmMgPSAtRUlOVkFMOworCisgICAg
ICAgIHMgPSBzcyArIDE7CisgICAgfSB3aGlsZSAoICpzcyApOworCisgICAgYWNwaV92aWRlb19m
bGFncyA9IGZsYWc7CisKKyAgICByZXR1cm4gMDsKK30KK2N1c3RvbV9wYXJhbSgiYWNwaV9zbGVl
cCIsIHBhcnNlX2FjcGlfc2xlZXApOwogCiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKHBtX2xvY2sp
OwogCkBAIC00NTYsMjIgKzQ4MCwzIEBAIGFjcGlfc3RhdHVzIGFjcGlfZW50ZXJfc2xlZXBfc3Rh
dGUodTggc2xlZXBfc3RhdGUpCiAKICAgICByZXR1cm5fQUNQSV9TVEFUVVMoQUVfT0spOwogfQot
Ci1zdGF0aWMgaW50IF9faW5pdCBhY3BpX3NsZWVwX2luaXQodm9pZCkKLXsKLSAgICBjaGFyICpw
ID0gb3B0X2FjcGlfc2xlZXA7Ci0KLSAgICB3aGlsZSAoIChwICE9IE5VTEwpICYmICgqcCAhPSAn
XDAnKSApCi0gICAgewotICAgICAgICBpZiAoICFzdHJuY21wKHAsICJzM19iaW9zIiwgNykgKQot
ICAgICAgICAgICAgYWNwaV92aWRlb19mbGFncyB8PSAxOwotICAgICAgICBpZiAoICFzdHJuY21w
KHAsICJzM19tb2RlIiwgNykgKQotICAgICAgICAgICAgYWNwaV92aWRlb19mbGFncyB8PSAyOwot
ICAgICAgICBwID0gc3RyY2hyKHAsICcsJyk7Ci0gICAgICAgIGlmICggcCAhPSBOVUxMICkKLSAg
ICAgICAgICAgIHAgKz0gc3Ryc3BuKHAsICIsIFx0Iik7Ci0gICAgfQotCi0gICAgcmV0dXJuIDA7
Ci19Ci1fX2luaXRjYWxsKGFjcGlfc2xlZXBfaW5pdCk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
