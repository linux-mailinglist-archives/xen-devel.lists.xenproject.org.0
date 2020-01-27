Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1F614A98C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 19:15:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw8rE-0007sJ-Rq; Mon, 27 Jan 2020 18:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5P7q=3Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iw8rD-0007rM-3T
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 18:11:31 +0000
X-Inumbo-ID: 6f19f33a-4130-11ea-acc1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f19f33a-4130-11ea-acc1-bc764e2007e4;
 Mon, 27 Jan 2020 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580148687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ekoRqZlTNVkyNGUNMvG5TZ7RCPZWUmlqG8bHImgoqfQ=;
 b=eJhilze8xoKyRSEReWHep2phyosqgePORtXgT6N+Wpng1hRK85ay/HbB
 YNnGUiIrfs08IjZYfXngBc3e24VsU870yJq+ZC/sMDn/bVgWFgZ6CYAYd
 ES5XxtJKDERgh7EGmSFQUmOKy2h1xjoCVgqEsXD7LWJ21G5Nb3T5V1cab o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8SyS6LAH3Z5NZTv2LClXQXYH/FmeQd18IoLDyymMBisw3Fl0jazPDZmOwSzkueauYljDed+loD
 KQwlIlXH6Xz48yb39qFN0TsS8YknMtGkJP84kX3TKn2uGlH5ZH1F4BTv6yR9qF8bboSbZapgi3
 xkCkOMWYw0J8hZdGfkSAiTKXPfvakUz36Zwu7/GScl9+Jf3cmmGHX03V8m8wWqrFQawpgnUasF
 rGcSkuIlOM4YjeIzI6/+0APHxf1BMgzsYP86Wmg9gJ+pnxJFLiecycDKeD1Pa3ttK/GV60i5Hi
 ef0=
X-SBRS: 2.7
X-MesageID: 11945402
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11945402"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 19:11:09 +0100
Message-ID: <20200127181115.82709-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200127181115.82709-1-roger.pau@citrix.com>
References: <20200127181115.82709-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/7] x86/tlb: fix NEED_FLUSH return type
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHJldHVybmVkIHR5cGUgd2FudHMgdG8gYmUgYm9vbCBpbnN0ZWFkIG9mIGludC4KCk5vIGZ1
bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVzaHRs
Yi5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVzaHRsYi5oIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9mbHVzaHRsYi5oCmluZGV4IDQzNDgyMWFhZjMuLjJjZmU0ZTZlOTcgMTAwNjQ0
Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaAorKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L2ZsdXNodGxiLmgKQEAgLTQyLDcgKzQyLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHBh
Z2Vfc2V0X3RsYmZsdXNoX3RpbWVzdGFtcChzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogICogQGxh
c3R1c2Vfc3RhbXAgaXMgYSB0aW1lc3RhbXAgdGFrZW4gd2hlbiB0aGUgUEZOIHdlIGFyZSB0ZXN0
aW5nIHdhcyBsYXN0IAogICogdXNlZCBmb3IgYSBwdXJwb3NlIHRoYXQgbWF5IGhhdmUgY2F1c2Vk
IHRoZSBDUFUncyBUTEIgdG8gYmVjb21lIHRhaW50ZWQuCiAgKi8KLXN0YXRpYyBpbmxpbmUgaW50
IE5FRURfRkxVU0godTMyIGNwdV9zdGFtcCwgdTMyIGxhc3R1c2Vfc3RhbXApCitzdGF0aWMgaW5s
aW5lIGJvb2wgTkVFRF9GTFVTSCh1MzIgY3B1X3N0YW1wLCB1MzIgbGFzdHVzZV9zdGFtcCkKIHsK
ICAgICB1MzIgY3Vycl90aW1lID0gdGxiZmx1c2hfY3VycmVudF90aW1lKCk7CiAgICAgLyoKLS0g
CjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
