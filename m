Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA0B9256B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 15:45:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzhvS-0003AG-3Y; Mon, 19 Aug 2019 13:42:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ecZk=WP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hzhvQ-0003A5-SP
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 13:42:20 +0000
X-Inumbo-ID: 2a15e76c-c287-11e9-813a-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a15e76c-c287-11e9-813a-bc764e2007e4;
 Mon, 19 Aug 2019 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566222140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vu9nOOVl9GhXutvla9P9PoIt01N5H2blZq19ocdshdQ=;
 b=FIEWY7UpkdKHn4mNcMhrvJ7vwGXw5800M94IIaszVGnDqsltibIHIB1M
 EEEGPWH81zjU3PbkbZIC2Xrd3XsnQI2xsNh3w2xzf7KUoTt9Q1hS0Ar5u
 bbty+goWzDO3kSl1p81q13UcfwBfX29zrNujw0iDYiBgFSVGGorNuaaBI I=;
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
IronPort-SDR: /HcgtG2hR/nAgeErSysqZLpM+kM8qcVSt2gf9e9ULH738FFNhraSwPi62m+jVG2noQ1mDNvpen
 YlswW1oAfci72oPwJoRxV1bvDzRb1BtCragn+8YTHIO3DYoaB2BR02tz/0agnJXIzeZA9KLpfw
 yO84cmApBm4lDppNL3wcB+RNvlU8H1KyYkGoxFjhP0RdHLh0jSsGXxFTuTW5UB+wYubApTkoZt
 7gkCRNHANl+PkUPxmyBNQ8RpLeOSHLXj5ODNd0FYo1U7x2rOj+otqdb3sn0/A6UDwZ44cZAajC
 WvA=
X-SBRS: 2.7
X-MesageID: 4439579
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4439579"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 19 Aug 2019 14:42:13 +0100
Message-ID: <20190819134213.1628-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190819134213.1628-1-andrew.cooper3@citrix.com>
References: <20190819134213.1628-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Drop all use of lmsw
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

bG1zdyBpcyBhbiBvYnNvbGV0ZSByZWxpYyBvZiB0aGUgMjg2IHByb2Nlc3NvciAtIHNvIG11Y2gg
c28gdGhhdCBpdCBldmVuIGxhY2tzCmludGVyY2VwdCBhc3Npc3RhbmNlIG9uIEFNRCBwcm9jZXNz
b3JzLgoKVXNlIGEgcGxhaW4gbW92IHRvICVjcjAgd2hpY2ggaXMgZWFzaWVyIHRvIGZvbGxvdywg
Y2VydGFpbmx5IGZhc3RlciB0bwp2aXJ0dWFsaXNlIG9uIEFNRCBoYXJkd2FyZSwgYW5kIGFsbW9z
dCBjZXJ0YWlubHkgYSBmYXN0ZXIgbWljcm9jb2RlIHBhdGggaW4KcmVhbCBoYXJkd2FyZS4KClNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0t
LQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhl
bi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUyB8IDEyICsrKysrKy0tLS0tLQogeGVuL2FyY2gv
eDg2L2Jvb3Qvd2FrZXVwLlMgICAgIHwgIDUgKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ib290
L3RyYW1wb2xpbmUuUyBiL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUwppbmRleCAxYjEx
YjQ3NTdhLi44OWY4NDEzMzFkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9s
aW5lLlMKKysrIGIveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCkBAIC01NCw5ICs1NCwx
MCBAQCBHTE9CQUwodHJhbXBvbGluZV9yZWFsbW9kZV9lbnRyeSkKICAgICAgICAgbGlkdCAgICBi
b290c3ltKGlkdF80OCkKICAgICAgICAgbGdkdCAgICBib290c3ltKGdkdF80OCkKICAgICAgICAg
bW92ICAgICAkMSwlYmwgICAgICAgICAgICAgICAgICAgICMgRUJYICE9IDAgaW5kaWNhdGVzIHdl
IGFyZSBhbiBBUAotICAgICAgICB4b3IgICAgICVheCwgJWF4Ci0gICAgICAgIGluYyAgICAgJWF4
Ci0gICAgICAgIGxtc3cgICAgJWF4ICAgICAgICAgICAgICAgICAgICAgICAjIENSMC5QRSA9IDEg
KGVudGVyIHByb3RlY3RlZCBtb2RlKQorCisgICAgICAgIG1vdiAgICAgJFg4Nl9DUjBfUEUsICVl
YXgKKyAgICAgICAgbW92ICAgICAlZWF4LCAlY3IwCisKICAgICAgICAgbGptcGwgICAkQk9PVF9D
UzMyLCRib290c3ltX3JlbCh0cmFtcG9saW5lX3Byb3Rtb2RlX2VudHJ5LDYpCiAKICAgICAgICAg
LmNvZGUzMgpAQCAtMjUyLDkgKzI1Myw4IEBAIHRyYW1wb2xpbmVfYm9vdF9jcHVfZW50cnk6CiAg
ICAgICAgIGxnZHQgICAgYm9vdHN5bShnZHRfNDgpCiAKICAgICAgICAgLyogRW50ZXIgcHJvdGVj
dGVkIG1vZGUsIGFuZCBmbHVzaCBpbnNuIHF1ZXVlLiAqLwotICAgICAgICB4b3IgICAgICVheCwl
YXgKLSAgICAgICAgaW5jICAgICAlYXgKLSAgICAgICAgbG1zdyAgICAlYXggICAgICAgICAgICAg
ICAgICAgICAgICMgQ1IwLlBFID0gMSAoZW50ZXIgcHJvdGVjdGVkIG1vZGUpCisgICAgICAgIG1v
diAgICAgJFg4Nl9DUjBfUEUsICVlYXgKKyAgICAgICAgbW92ICAgICAlZWF4LCAlY3IwCiAKICAg
ICAgICAgLyogTG9hZCBwcm9wZXIgcHJvdGVjdGVkLW1vZGUgdmFsdWVzIGludG8gYWxsIHNlZ21l
bnQgcmVnaXN0ZXJzLiAqLwogICAgICAgICBsam1wbCAgICRCT09UX0NTMzIsJGJvb3RzeW1fcmVs
KDFmLDYpCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC93YWtldXAuUyBiL3hlbi9hcmNo
L3g4Ni9ib290L3dha2V1cC5TCmluZGV4IGUzY2I5ZTAzM2EuLjJhZjZjNjAxN2MgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9ib290L3dha2V1cC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290L3dh
a2V1cC5TCkBAIC01MSw4ICs1MSw5IEBAIEVOVFJZKHdha2V1cF9zdGFydCkKICAgICAgICAgbGlk
dCAgICB3YWtlc3ltKGlkdF80OCkKICAgICAgICAgbGdkdCAgICB3YWtlc3ltKGdkdF80OCkKIAot
ICAgICAgICBtb3Z3ICAgICQxLCAlYXgKLSAgICAgICAgbG1zdyAgICAlYXggICAgICAgICAgICAg
IyBUdXJuIG9uIENSMC5QRSAKKyAgICAgICAgbW92ICAgICAkWDg2X0NSMF9QRSwgJWVheAorICAg
ICAgICBtb3YgICAgICVlYXgsICVjcjAKKwogICAgICAgICBsam1wbCAgICRCT09UX0NTMzIsICRi
b290c3ltX3JlbCh3YWtldXBfMzIsIDYpCiAKIC8qIFRoaXMgY29kZSB1c2VzIGFuIGV4dGVuZGVk
IHNldCBvZiB2aWRlbyBtb2RlIG51bWJlcnMuIFRoZXNlIGluY2x1ZGU6Ci0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
