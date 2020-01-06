Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6372131581
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 16:56:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioUiK-0003og-Ci; Mon, 06 Jan 2020 15:54:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioUiI-0003o9-Tm
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 15:54:42 +0000
X-Inumbo-ID: d1c08b1b-309c-11ea-ab26-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1c08b1b-309c-11ea-ab26-12813bfff9fa;
 Mon, 06 Jan 2020 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578326069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qZVPVwir7bLZw5ZKa9vwUz0eJJ+dk54YhfDW7I8fu8c=;
 b=P8iF7fZWV5fqFkJ8uCeJU0JKLBWvR51g+AdHMubhjPhUpvzDjH6mNTlB
 m5isBURrKUkmJ5VaalxRbRzqjm5WzZhbwF813/BV+Wb7YS37gW0jXxEbI
 Z7L3Bc7jFCOU6pCaE8/GHmL/blEK/+X7R8KNqGd4qNaA97GuY05rGiUN7 k=;
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
IronPort-SDR: bDytRq5n+jQWqQQoa+RKowBU+pHrBaOavz7/6h9xPUot4tp8y7SYTTWA+jaqLk86NHi5mX4Dge
 VCZ3K3ka1Zu7IBim38f2oBs6w5aC1D74QZSmAnVv/+pUYEpdEStSM9UX1cA3kV7nk1nPQ8qXbf
 VHBuaH4zjAesh/k8xF38zxAeFp22whsgDkuS6k6/OmWvDD9cBG+TN44A7qiUWKuas3/UoJz2sL
 op3jAnrMLTxN1AdOTMdNcC/kMKKG9gTqg1FnyBLqpEs1WZZDdIulQJZI9kQKO/bMr9Scf5Ah1S
 /rY=
X-SBRS: 2.7
X-MesageID: 11092611
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,403,1571716800"; d="scan'208";a="11092611"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 6 Jan 2020 15:54:22 +0000
Message-ID: <20200106155423.9508-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200106155423.9508-1-andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/6] x86/boot: Don't map 0 during boot
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

SW4gcGFydGljdWxhciwgaXQgY2F1c2VzIGFjY2lkZW50YWwgTlVMTCBwb2ludGVyIGRlcmVmZXJl
bmNlcyB0byBnbyB1bm5vdGljZWQuCgpUaGUgbWFqb3JpdHkgb2YgdGhlIGVhcmx5IG9wZXJhdGlv
biB0YWtlcyBwbGFjZSBlaXRoZXIgaW4gUmVhbCBtb2RlLCBvcgpQcm90ZWN0ZWQgVW5wYWdlZCBt
b2RlLiAgVGhlIG9ubHkgYml0IHdoaWNoIHJlcXVpcmVzIHBhZ2V0YWJsZSBtYXBwaW5ncyBpcyB0
aGUKdHJhbXBvbGluZSB0cmFuc2l0aW9uIGludG8gTG9uZyBtb2RlIGFuZCBqdW1wIHRvIHRoZSBo
aWdoZXIgbWFwcGluZ3MsIHNvIHRoZXJlCmlzIG5vIG5lZWQgZm9yIHRoZSB3aG9sZSBib3R0b20g
Mk0gdG8gYmUgbWFwcGVkLgoKSW50cm9kdWNlIGEgbmV3IGwxX2Jvb3RtYXAgaW4gLmluaXQuZGF0
YSwgYW5kIHVzZSBpdCBpbnN0ZWFkIG9mIGwxX2lkZW50bWFwLgpUaGUgRUZJIGJvb3QgcGF0aCBk
b2Vzbid0IHBhc3MgdGhyb3VnaCB0aGUgdHJhbXBvbGluZSwgc28gZG9lc24ndCBuZWVkIGFueQph
ZGp1c3RtZW50LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgfCAxNSArKysrKysrKystLS0t
LS0KIHhlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TIHwgIDQgKysrKwogMiBmaWxlcyBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9ib290L2hlYWQuUyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwppbmRleCBmN2QyNzNj
YTM2Li5iMzM4ZDRiYTVjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKKysr
IGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCkBAIC02ODksMTIgKzY4OSwxNSBAQCB0cmFtcG9s
aW5lX3NldHVwOgogICAgICAgICBzdWIgICAgICQoTDJfUEFHRVRBQkxFX0VOVFJJRVMqOCksJWVh
eAogICAgICAgICBsb29wICAgIDFiCiAKLSAgICAgICAgLyoKLSAgICAgICAgICogRHVyaW5nIGJv
b3QsIGhvb2sgNGtCIG1hcHBpbmdzIG9mIGZpcnN0IDJNQiBvZiBtZW1vcnkgaW50byBMMi4KLSAg
ICAgICAgICogVGhpcyBhdm9pZHMgbWl4aW5nIGNhY2hhYmlsaXR5IGZvciB0aGUgbGVnYWN5IFZH
QSByZWdpb24uCi0gICAgICAgICAqLwotICAgICAgICBsZWEgICAgIF9fUEFHRV9IWVBFUlZJU09S
K3N5bV9lc2kobDFfaWRlbnRtYXApLCVlZGkKLSAgICAgICAgbW92ICAgICAlZWRpLHN5bV9mcyhs
Ml9ib290bWFwKQorICAgICAgICAvKiBNYXAgdGhlIHBlcm1lbnRhbnQgdHJhbXBvbGluZSBwYWdl
IGludG8gbHsxLDJ9X2Jvb3RtYXBbXS4gKi8KKyAgICAgICAgbW92ICAgICBzeW1fZXNpKHRyYW1w
b2xpbmVfcGh5cyksICVlZHgKKyAgICAgICAgbW92ICAgICAlZWR4LCAlZWN4CisgICAgICAgIG9y
ICAgICAgJF9fUEFHRV9IWVBFUlZJU09SX1JYLCAlZWR4IC8qICVlZHggPSBQVEUgdG8gd3JpdGUg
ICovCisgICAgICAgIHNociAgICAgJFBBR0VfU0hJRlQsICVlY3ggICAgICAgICAgIC8qICVlY3gg
PSBTbG90IHRvIHdyaXRlICovCisgICAgICAgIG1vdiAgICAgJWVkeCwgc3ltX29mZnMobDFfYm9v
dG1hcCkoJWVzaSwgJWVjeCwgOCkKKworICAgICAgICBsZWEgICAgIF9fUEFHRV9IWVBFUlZJU09S
ICsgc3ltX2VzaShsMV9ib290bWFwKSwgJWVkeAorICAgICAgICBtb3YgICAgICVlZHgsIHN5bV9v
ZmZzKGwyX2Jvb3RtYXApKCVlc2kpCiAKICAgICAgICAgLyogQXBwbHkgcmVsb2NhdGlvbnMgdG8g
Ym9vdHN0cmFwIHRyYW1wb2xpbmUuICovCiAgICAgICAgIG1vdiAgICAgc3ltX2ZzKHRyYW1wb2xp
bmVfcGh5cyksJWVkeApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jvb3QveDg2XzY0LlMgYi94
ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwppbmRleCAzMGM4MmY5ZDVjLi5lMDc2M2E5MGUzIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUworKysgYi94ZW4vYXJjaC94ODYv
Ym9vdC94ODZfNjQuUwpAQCAtMTU2LDYgKzE1NiwxMCBAQCBHTE9CQUwoX19wYWdlX3RhYmxlc19l
bmQpCiAgICAgICAgIC5zZWN0aW9uIC5pbml0LmRhdGEsICJhdyIsIEBwcm9nYml0cwogICAgICAg
ICAuYWxpZ24gUEFHRV9TSVpFLCAwCiAKK2wxX2Jvb3RtYXA6CisgICAgICAgIC5maWxsIEwxX1BB
R0VUQUJMRV9FTlRSSUVTLCA4LCAwCisgICAgICAgIC5zaXplIGwxX2Jvb3RtYXAsIC4gLSBsMV9i
b290bWFwCisKIEdMT0JBTChsMl9ib290bWFwKQogICAgICAgICAuZmlsbCA0ICogTDJfUEFHRVRB
QkxFX0VOVFJJRVMsIDgsIDAKICAgICAgICAgLnNpemUgbDJfYm9vdG1hcCwgLiAtIGwyX2Jvb3Rt
YXAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
