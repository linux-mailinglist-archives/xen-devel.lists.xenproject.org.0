Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF943C40DD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 21:18:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFNcz-0003PP-0U; Tue, 01 Oct 2019 19:16:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JO9a=X2=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iFNcy-0003PK-6X
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 19:16:04 +0000
X-Inumbo-ID: e84c0576-e47f-11e9-9707-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id e84c0576-e47f-11e9-9707-12813bfff9fa;
 Tue, 01 Oct 2019 19:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569957362;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=a2IUMnJku1CYcf8X9Skx3RU/jroqUS1+A9CIrrErbAA=;
 b=C6J4DBXk1x/dok1rzmjSr1PL1IFA7reDu9GZAu39wDJToCsBRDe0xHFh
 PvOG2tGjQ7osH8VOh8GhgeudVJiT3uvdo+bgKXrcO8Favd4rS1PmLNPEc
 6S24oFtk9HqVi1BpeAGAHQeeSqw4pLOYhJDB24CDlWs3/ZhbPkAt1U7CZ k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: h80v/L78EIMC/lKt5lop0JK0yKVhSW4e9PBHDVJ5shQM2BfqZqlVk9ZbCdVwIFrYts/9beNzIX
 H8Zk3umP9JqZWKs/dYDydsER4SOTt98Lqn0YE+dRDtmaZSfUa8QNPzzksDZ4nOJRj21iYM8guL
 YOVZKun98ylIL8z+pJUz/r66fFTb/wAPQqQeEBfD81sy+8Wwi3JldVE5hcXqRA9vMroIIAAuZ1
 8zfq9yyZi9hXOd/JO/Ms6aG0kQkVV1Rk0w4gJTr+oAvybq5OqrwqROJQa77bcbojgkfS6FX7l0
 nlE=
X-SBRS: 2.7
X-MesageID: 6625096
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6625096"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 1 Oct 2019 20:15:57 +0100
Message-ID: <1569957357-20803-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] x86/crash: force unlock console before
 printing on kexec crash
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgYSBzbWFsbCB3aW5kb3cgd2hlcmUgc2hvb3Rkb3duIE5NSSBtaWdodCBjb21lIHRv
IGEgQ1BVCihlLmcuIGluIHNlcmlhbCBpbnRlcnJ1cHQgaGFuZGxlcikgd2hlcmUgY29uc29sZSBs
b2NrIGlzIHRha2VuLiBJbiBvcmRlcgpub3QgdG8gbGVhdmUgZm9sbG93aW5nIGNvbnNvbGUgcHJp
bnRzIHdhaXRpbmcgaW5maW5pdGVseSBmb3Igc2hvdCBkb3duCkNQVXMgdG8gZnJlZSB0aGUgbG9j
ayAtIGZvcmNlIHVubG9jayB0aGUgY29uc29sZS4KClRoZSByYWNlIGhhcyBiZWVuIGZyZXF1ZW50
bHkgb2JzZXJ2ZWQgd2hpbGUgY3Jhc2hpbmcgbmVzdGVkIFhlbiBpbgphbiBIVk0gZG9tYWluLgoK
U2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L2NyYXNoLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NyYXNoLmMgYi94ZW4vYXJjaC94
ODYvY3Jhc2guYwppbmRleCA2ZTFkM2QzLi5hMjBlYzhhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvY3Jhc2guYworKysgYi94ZW4vYXJjaC94ODYvY3Jhc2guYwpAQCAtMjksNiArMjksNyBAQAog
I2luY2x1ZGUgPGFzbS9pb19hcGljLmg+CiAjaW5jbHVkZSA8eGVuL2lvbW11Lmg+CiAjaW5jbHVk
ZSA8YXNtL2hwZXQuaD4KKyNpbmNsdWRlIDx4ZW4vY29uc29sZS5oPgogCiBzdGF0aWMgY3B1bWFz
a190IHdhaXRpbmdfdG9fY3Jhc2g7CiBzdGF0aWMgdW5zaWduZWQgaW50IGNyYXNoaW5nX2NwdTsK
QEAgLTE1NSw2ICsxNTYsNyBAQCBzdGF0aWMgdm9pZCBubWlfc2hvb3Rkb3duX2NwdXModm9pZCkK
ICAgICB9CiAKICAgICAvKiBMZWF2ZSBhIGhpbnQgb2YgaG93IHdlbGwgd2UgZGlkIHRyeWluZyB0
byBzaG9vdCBkb3duIHRoZSBvdGhlciBjcHVzICovCisgICAgY29uc29sZV9mb3JjZV91bmxvY2so
KTsKICAgICBpZiAoIGNwdW1hc2tfZW1wdHkoJndhaXRpbmdfdG9fY3Jhc2gpICkKICAgICAgICAg
cHJpbnRrKCJTaG90IGRvd24gYWxsIENQVXNcbiIpOwogICAgIGVsc2UKLS0gCjIuNy40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
