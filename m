Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7C41023FB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 13:12:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX2Je-0003jj-EH; Tue, 19 Nov 2019 12:09:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QaT1=ZL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iX2Jc-0003je-V8
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 12:09:05 +0000
X-Inumbo-ID: 599a33cc-0ac5-11ea-a2f9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 599a33cc-0ac5-11ea-a2f9-12813bfff9fa;
 Tue, 19 Nov 2019 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574165331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0ZmOn2G3sznXMWFupB29G58F8HtaQfg2sCdZtBYjYas=;
 b=hvAGNjDuVlrjgW5fEDIqzKLo5rBycO7wEJtsNmcBAm79u/9lV62Q1Q/l
 sfzbOdboi0Z8NTfLjAjsA6xnoWU2cHwHt+MbKKzYla1bwhNoSaH4Bo2Vj
 Zy9F0hM8tfrPwy90X8w7oD6qIw+UVkEXlUbdyGKLnylakwpNs+Qqa6dLm w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cY9jv+g8HvDunovBhPKwoWBykgDSkAtmLwdqBXyidts/YxK92TM9GKgXhk9XC0Qv5iR5aSpEtJ
 0r+8NwqV79teo8UmUBLq4GdrP7N+ltLJt1zS/yRe9BVf4ioyfgnPHANJ07ElkyMTdbCS4AP895
 AKw/KPaXwQKtXJjMTnSUu54TTgkTmoYwgH+CvLUsZFN/4+q1MDpNg+Uges5TN98PGXCMokqYXz
 dmHsUYttWkW2NbF9Y39Ip+T0OhEekybltKCPxMyde3OnyuYOdan+opBDuITffqoZJrvmJlF99j
 A5c=
X-SBRS: 2.7
X-MesageID: 9056611
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,322,1569297600"; 
   d="scan'208";a="9056611"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 19 Nov 2019 12:08:49 +0000
Message-ID: <20191119120849.1547072-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH] x86/domctl: Have
 XEN_DOMCTL_getpageframeinfo3 preemptible
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBoeXBlcmNhbGwgY2FuIHRha2UgYSBsb25nIHRpbWUgdG8gZmluaXNoIGJlY2F1c2UgaXQg
YXR0ZW1wdHMgdG8KZ3JhYiB0aGUgYGhvc3RwMm0nIGxvY2sgdXAgdG8gMTAyNCB0aW1lcy4gVGhl
IGFjY3VtdWxhdGVkIHdhaXQgZm9yIHRoZQpsb2NrIGNhbiB0YWtlIHNldmVyYWwgc2Vjb25kcy4K
ClRoaXMgY2FuIGVhc2lseSBoYXBwZW4gd2l0aCBhIGd1ZXN0IHdpdGggMzIgdmNwdXMgYW5kIHBs
ZW50eSBvZiBSQU0sCmR1cmluZyBsb2NhbGhvc3QgbWlncmF0aW9uLgoKU2lnbmVkLW9mZi1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAg
ICBJIGRvbid0IGtub3cgaWYgaXQncyBhIGNvcnJlY3Qgd2F5IHRvIG1ha2UgdGhlIGh5cGVyY2Fs
bCBwcmVlbXB0aWJsZSwKICAgIHRoZSBwYXRjaCBraW5kIG9mIG1vZGlmeSB0aGUgcmVzcG9uc2Us
IGJ1dCBsaWJ4YyBkb2Vzbid0IHNlZW1zIHRvIGNhcmUuCiAgICAKICAgIElzIGl0IGZpbmUgdG8g
bW9kaWZ5IHRoZSBkb21jdGxfdCB0aGF0IHRoZSBkb21haW4gKGRvbTApIHByb3ZpZGVzPwogICAg
SWYgbm90LCB3aGVyZSBjb3VsZCB3ZSBzdG9yZSB0aGUgcHJvZ3Jlc3MgbWFkZT8KCiB4ZW4vYXJj
aC94ODYvZG9tY3RsLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWN0bC5jIGIveGVuL2FyY2gv
eDg2L2RvbWN0bC5jCmluZGV4IDQzZTM2OGQ2M2JiOS4uNWMwYTc0NjJlNjNiIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKKysrIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCkBAIC00
MjUsNiArNDI1LDE4IEBAIGxvbmcgYXJjaF9kb19kb21jdGwoCiAgICAgICAgICAgICAgICAgcmV0
ID0gLUVGQVVMVDsKICAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgICAgIH0KKworICAg
ICAgICAgICAgaWYgKCBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpICkgeworICAgICAgICAgICAg
ICAgIGRvbWN0bC0+dS5nZXRwYWdlZnJhbWVpbmZvMy5udW0gPSBudW0gLSBpIC0gMTsKKyAgICAg
ICAgICAgICAgICBkb21jdGwtPnUuZ2V0cGFnZWZyYW1laW5mbzMuYXJyYXkucCA9CisgICAgICAg
ICAgICAgICAgICAgIGd1ZXN0X2hhbmRsZSArICgoaSArIDEpICogd2lkdGgpOworICAgICAgICAg
ICAgICAgIGlmICggX19jb3B5X3RvX2d1ZXN0KHVfZG9tY3RsLCBkb21jdGwsIDEpICkgeworICAg
ICAgICAgICAgICAgICAgICByZXQgPSAtRUZBVUxUOworICAgICAgICAgICAgICAgICAgICBicmVh
azsKKyAgICAgICAgICAgICAgICB9CisgICAgICAgICAgICAgICAgcmV0dXJuIGh5cGVyY2FsbF9j
cmVhdGVfY29udGludWF0aW9uKF9fSFlQRVJWSVNPUl9kb21jdGwsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJoIiwgdV9kb21jdGwpOworICAg
ICAgICAgICAgfQogICAgICAgICB9CiAKICAgICAgICAgYnJlYWs7Ci0tIApBbnRob255IFBFUkFS
RAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
