Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3024A508A0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 12:21:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfM2Z-00026N-Q6; Mon, 24 Jun 2019 10:17:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TGna=UX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hfM2Y-00025w-4s
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 10:17:34 +0000
X-Inumbo-ID: 44c4bf7e-9669-11e9-810a-a7cb20a00708
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44c4bf7e-9669-11e9-810a-a7cb20a00708;
 Mon, 24 Jun 2019 10:17:28 +0000 (UTC)
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
IronPort-SDR: wtmDhrRMO1Q6BHPzeWSzkzW4ch6JB7GKPQRAvmrvdGd1l82J6vTOtCK3w9sivrVH0TR2AYjae2
 1XkQQOJ+4ZroBk8p5YbK1og2WpzcHk79PvkqUvRzoK+vQA8vm+Ri+Gt64Rrh0yo3P4vHDxWSOK
 P+s8itDmFknmjz5+nAb9quHa+DVUZ7p3ae55HWiALGaLneMpVXxB4/TIGz6zde5T7zniin3ccF
 6jxPMKwEM9NPkuvRW6VgwuslMsE1MSQQB6FJ+1Zxg71gx4gYzVuvgK+5lp7b3bWEaqig2fCKgI
 BLQ=
X-SBRS: 2.7
X-MesageID: 2143317
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,411,1557201600"; 
   d="scan'208";a="2143317"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 24 Jun 2019 11:17:23 +0100
Message-ID: <20190624101723.23291-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190624101723.23291-1-andrew.cooper3@citrix.com>
References: <20190624101723.23291-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] xen/ubsan: Support for -fsanitise=builtin
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmaXhlcyB0aGUgVUJTQU4gYnVpbGQgZm9yIEdDQyA4IGFuZCBsYXRlci4gIFRoZSBzYW5p
dGlzZXIgY2hlY2tzIGZvcgpwYXNzaW5nIDAgdG8gdGhlIGN0eigpL2NseigpIGJ1aWx0aW5zLgoK
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9jb21tb24vdWJzYW4vdWJzYW4uYyB8
IDIxICsrKysrKysrKysrKysrKysrKysrKwogeGVuL2NvbW1vbi91YnNhbi91YnNhbi5oIHwgIDkg
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3Vic2FuL3Vic2FuLmMgYi94ZW4vY29tbW9uL3Vic2FuL3Vic2FuLmMKaW5k
ZXggNTBhNGUxNGZhYy4uZTc1ZjYxNGZhNyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi91YnNhbi91
YnNhbi5jCisrKyBiL3hlbi9jb21tb24vdWJzYW4vdWJzYW4uYwpAQCAtNTE4LDMgKzUxOCwyNCBA
QCB2b2lkIF9fdWJzYW5faGFuZGxlX3BvaW50ZXJfb3ZlcmZsb3coc3RydWN0IHBvaW50ZXJfb3Zl
cmZsb3dfZGF0YSAqZGF0YSwKIAogCXVic2FuX2VwaWxvZ3VlKCZmbGFncyk7CiB9CisKK3ZvaWQg
X191YnNhbl9oYW5kbGVfaW52YWxpZF9idWlsdGluKHN0cnVjdCBpbnZhbGlkX2J1aWx0aW5fZGF0
YSAqZGF0YSkKK3sKKwl1bnNpZ25lZCBsb25nIGZsYWdzOworCWNvbnN0IGNoYXIgKmZuOworCisJ
aWYgKHN1cHByZXNzX3JlcG9ydCgmZGF0YS0+bG9jYXRpb24pKQorCQlyZXR1cm47CisKKwl1YnNh
bl9wcm9sb2d1ZSgmZGF0YS0+bG9jYXRpb24sICZmbGFncyk7CisKKwlzd2l0Y2ggKGRhdGEtPmtp
bmQpIHsKKwljYXNlIGtpbmRfY3R6OiBmbiA9ICJjdHoiOyBicmVhazsKKwljYXNlIGtpbmRfY2x6
OiBmbiA9ICJjbHoiOyBicmVhazsKKwlkZWZhdWx0OiBmbiA9ICI8VU5LTk9XTj4iOyBicmVhazsK
Kwl9CisKKwlwcl9lcnIoInBhc3NpbmcgemVybyB0byAlcygpLCB3aGljaCBpcyBub3QgYSB2YWxp
ZCBhcmd1bWVudFxuIiwgZm4pOworCisJdWJzYW5fZXBpbG9ndWUoJmZsYWdzKTsKK30KZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24vdWJzYW4vdWJzYW4uaCBiL3hlbi9jb21tb24vdWJzYW4vdWJzYW4u
aAppbmRleCAyNzEwY2Q0MjNlLi5hMzE1OTA0MGZlIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3Vi
c2FuL3Vic2FuLmgKKysrIGIveGVuL2NvbW1vbi91YnNhbi91YnNhbi5oCkBAIC04NCw2ICs4NCwx
NSBAQCBzdHJ1Y3QgcG9pbnRlcl9vdmVyZmxvd19kYXRhIHsKIAlzdHJ1Y3Qgc291cmNlX2xvY2F0
aW9uIGxvY2F0aW9uOwogfTsKIAorc3RydWN0IGludmFsaWRfYnVpbHRpbl9kYXRhIHsKKwlzdHJ1
Y3Qgc291cmNlX2xvY2F0aW9uIGxvY2F0aW9uOworCXVuc2lnbmVkIGNoYXIga2luZDsKK307Citl
bnVtIHsKKwlraW5kX2N0eiwKKwlraW5kX2NseiwKK307CisKICNpZiBkZWZpbmVkKENPTkZJR19B
UkNIX1NVUFBPUlRTX0lOVDEyOCkgJiYgZGVmaW5lZChfX1NJWkVPRl9JTlQxMjhfXykKIHR5cGVk
ZWYgX19pbnQxMjggc19tYXg7CiB0eXBlZGVmIHVuc2lnbmVkIF9faW50MTI4IHVfbWF4OwotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
