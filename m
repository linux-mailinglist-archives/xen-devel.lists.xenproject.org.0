Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDABE1D8E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:01:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNH9d-0004hh-RY; Wed, 23 Oct 2019 13:58:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xo40=YQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iNH9c-0004hS-NS
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:58:24 +0000
X-Inumbo-ID: 2904bbac-f59d-11e9-947f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2904bbac-f59d-11e9-947f-12813bfff9fa;
 Wed, 23 Oct 2019 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571839096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QgowaU70OMGbBSgKxE84vTRNFPVymAfTLybUq46wins=;
 b=Vo28INURm5wk/jHD0xeLfJLNUQJWkGygj9Ok/iuQ0F+e9T5g9/eSE8tp
 MidQ0WzPhCi2BQqQPVcj1vgfgZ6VfJpQVQsdu4E5Q1EkBFy38JJjhV+G5
 ZYl+IbXqCRb7xbPsx4Mqk8GxQl4nGDgiUl637yjscPnQavR41BzXt93aT w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EvKMVNRyQe7oiqd2mybdtaLzBzGGWI+jcyXuVrJyLNFPrV7FIqvnTvaucpWqGkG1VaH/dwmyo9
 QYvLeyZIVbwnmypoXRUGDCLjBZrnxLz2NFJWePkAlzZ3HYPVuxg3B39F4UEFctA36IXnRrFoug
 KfNPhSc4Q6sjveT1G7tuRkrApIsADWQAWh4Am8gQQH73yfSG+90wU413e/YpkwVS52X15UHHke
 yHWaak5mctdgpEQf5Ef30wwHhE69UWz3/bxVo3tv7QPmJmeyiHTWTMYj/quMyWCjHO1TnJZWvf
 znU=
X-SBRS: 2.7
X-MesageID: 7322257
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7322257"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:58:05 +0100
Message-ID: <20191023135812.21348-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v3 0/7] Unbreak evaluate_nospec() and
 livepatching
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZXNvbHZlcyBhbiBvdXN0YW5kaW5nIGJsb2NrZXIgZm9yIDQuMTMsIGZpeGluZyBib3Ro
IHRoZSBjb2RlIGdlbmVyYXRpb24KZm9yIGV2YXVsYXRlX25vc3BlYygpLCBhbmQgbWFraW5nIHRo
ZSByZXN1bHRpbmcgaHlwZXJ2aXNvciBhYmxlIHRvIGJlCmxpdmVwYXRjaGVkLgoKQW5kcmV3IENv
b3BlciAoNik6CiAgeDg2L25vc3BlYzogVHdvIHRyaXZpYWwgZml4ZXMKICB4ZW4vbm9zcGVjOiBV
c2UgYWx3YXlzX2lubGluZSB0byBmaXggY29kZSBnZW4gZm9yIGV2YWx1YXRlX25vc3BlYwogIHhl
bi9ub3NwZWM6IEludHJvZHVjZSBDT05GSUdfU1BFQ1VMQVRJVkVfSEFSREVOX0JSQU5DSAogIHg4
Ni9ub3NwZWM6IFJlbmFtZSBhbmQgcmV3b3JrIGwxdGYtYmFycmllciBhcyBicmFuY2gtaGFyZGVu
CiAgeDg2L25vc3BlYzogTW92ZSBhcnJheV9pbmRleF9tYXNrX25vc3BlYygpIGludG8gbm9zcGVj
LmgKICB4ODYvbm9zcGVjOiBPcHRpbWlzZSBhcnJheV9pbmRleF9tYXNrX25vc3BlYygpIGZvciBw
b3dlci1vZi0yIGFycmF5cwoKUm9zcyBMYWdlcndhbGwgKDEpOgogIHg4Ni9saXZlcGF0Y2g6IEZh
aWwgdGhlIGJ1aWxkIGlmIGR1cGxpY2F0ZSBzeW1ib2xzIGV4aXN0CgogZG9jcy9taXNjL3hlbi1j
b21tYW5kLWxpbmUucGFuZG9jICAgfCAxMSArKysrKy0tLS0tCiB4ZW4vYXJjaC94ODYvTWFrZWZp
bGUgICAgICAgICAgICAgICB8ICAxICsKIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAg
ICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9wdi9tbS5oICAgICAgICAgICAgICAgIHwgMTIgKysr
KystLS0tLS0KIHhlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYyAgICAgICAgICAgIHwgMTggKysrKysr
Ky0tLS0tLS0tLQogeGVuL2NvbW1vbi9LY29uZmlnICAgICAgICAgICAgICAgICAgfCA0MSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2Nw
dWZlYXR1cmVzLmggICB8ICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2V2ZW50LmggICAgICAg
ICB8ICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0X3B0LmggICAgICB8IDI4ICsrKysr
KysrKysrKysrLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL25lc3RlZGh2bS5o
IHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbm9zcGVjLmggICAgICAgIHwgNDEgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdp
bmcuaCAgICAgICAgfCAgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9zcGVjX2N0cmwuaCAgICAg
fCAgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9zeXN0ZW0uaCAgICAgICAgfCAyNCAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmggICAgICAgICAgICB8ICAx
ICsKIHhlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaCAgICAgICAgICAgIHwgIDYgKysrKy0tCiB4ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICAgICAgICB8IDIwICsrKysrKysrKy0tLS0tLS0tLQog
eGVuL3Rvb2xzL2tjb25maWcvYWxscmFuZG9tLmNvbmZpZyAgfCAgMSArCiB4ZW4vdG9vbHMvc3lt
Ym9scy5jICAgICAgICAgICAgICAgICB8IDExICsrKysrKysrLS0KIDE5IGZpbGVzIGNoYW5nZWQs
IDE0MyBpbnNlcnRpb25zKCspLCA4NCBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
