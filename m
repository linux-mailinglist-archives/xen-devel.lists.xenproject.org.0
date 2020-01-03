Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394C012FBA2
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 18:32:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inQlt-0005VF-Bk; Fri, 03 Jan 2020 17:30:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tb7v=2Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1inQlr-0005VA-Rg
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 17:29:59 +0000
X-Inumbo-ID: a580ac10-2e4e-11ea-88e7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a580ac10-2e4e-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 17:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578072591;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U5d0SPYzel0AwRKDpxp6wjhvszK6fsyp7tPq/rtKPJQ=;
 b=S8F41lp+hUB2ruySrHoecN/PU47yyp5Fti2svoVBUY1r+mwGIn1xJMdw
 fjM7dqg9RJov75dsy/13il3CKN8Gs+Y9DbuEtzJ6XVZyUICHuyP1K2e9d
 zV1jgsnYM+wnj8dY4sV1VfSrzjafNZ8It6WKWlh1eCZnmZCiZiI+wGxTY Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IaLQSt9RImIozNB9QW4ZE4v9z68u4PtzaGc925fnfCSF5jNUER9viQAIcYT5cGd3iTRZsfEVdd
 i9yrcdMod9/rs2mplL2VAWWHb5zEUd0heyKjlLEVNNLJv2gsOKH3OwQginYpSwGeR8u1rE2/NH
 1uW4moCvptuOzoIdiC/3U0pUpBkpx2UCvwQ1zaXmufJ1mDMuQPUBoWbqdrRENXQ9zfj3D7oM/f
 3yS3+rwasVSrgfnq3/f57d4OyIg6GaxnfaPh+fg7abtkGQa7pih0AL58lv2PjemyPXqmtV+92k
 6dc=
X-SBRS: 2.7
X-MesageID: 10791318
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,391,1571716800"; d="scan'208";a="10791318"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 3 Jan 2020 18:29:35 +0100
Message-ID: <20200103172935.66137-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/libxc: disable x2APIC when using nested
 virtualization
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIGlzc3VlcyAoYXMgcmVwb3J0ZWQgYnkgb3NzdGVzdCBbMF0pIHdoZW4gWGVuIGlz
IHJ1bm5pbmcKbmVzdGVkIG9uIGl0c2VsZiBhbmQgdGhlIEwxIFhlbiBpcyB1c2luZyB4MkFQSUMu
IFdoaWxlIHRob3NlIGFyZSBiZWluZwppbnZlc3RpZ2F0ZWQsIGRpc2FibGUgYW5ub3VuY2luZyB0
aGUgeDJBUElDIGZlYXR1cmUgaW4gQ1BVSUQgd2hlbgpuZXN0ZWQgSFZNIG1vZGUgaXMgZW5hYmxl
ZC4KClswXSBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3Mv
MTQ1NTA5LwoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQogdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgfCAxMSArKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4
Yy94Y19jcHVpZF94ODYuYyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCmluZGV4IDI1NDBh
YTFlMWMuLmFjMzhjMTQwNmUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5j
CisrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCkBAIC02NTMsNiArNjUzLDE3IEBAIGlu
dCB4Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90IGRvbWlk
LAogICAgICAgICBwLT5leHRkLml0c2MgPSB0cnVlOwogICAgICAgICBwLT5iYXNpYy52bXggPSB0
cnVlOwogICAgICAgICBwLT5leHRkLnN2bSA9IHRydWU7CisKKyAgICAgICAgLyoKKyAgICAgICAg
ICogQk9ER0U6IGRvbid0IGFubm91bmNlIHgyQVBJQyBtb2RlIHdoZW4gdXNpbmcgbmVzdGVkIHZp
cnR1YWxpemF0aW9uLAorICAgICAgICAgKiBhcyBpdCBkb2Vzbid0IHdvcmsgcHJvcGVybHkuIFRo
aXMgc2hvdWxkIGJlIHJlbW92ZWQgb25jZSB0aGUKKyAgICAgICAgICogdW5kZXJseWluZyBidWco
cykgYXJlIGZpeGVkLgorICAgICAgICAgKi8KKyAgICAgICAgcmMgPSB4Y19odm1fcGFyYW1fZ2V0
KHhjaCwgZG9taWQsIEhWTV9QQVJBTV9ORVNURURIVk0sICZ2YWwpOworICAgICAgICBpZiAoIHJj
ICkKKyAgICAgICAgICAgIGdvdG8gb3V0OworICAgICAgICBpZiAoIHZhbCApCisgICAgICAgICAg
ICBwLT5iYXNpYy54MmFwaWMgPSBmYWxzZTsKICAgICB9CiAKICAgICByYyA9IHg4Nl9jcHVpZF9j
b3B5X3RvX2J1ZmZlcihwLCBsZWF2ZXMsICZucl9sZWF2ZXMpOwotLSAKMi4yNC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
