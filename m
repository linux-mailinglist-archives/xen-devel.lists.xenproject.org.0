Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA27CADDDF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 19:15:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7NDl-0007rz-7W; Mon, 09 Sep 2019 17:12:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiN8=XE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7NDk-0007rr-Fn
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 17:12:56 +0000
X-Inumbo-ID: 1064023c-d325-11e9-a337-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1064023c-d325-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568049175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=lCLITtXy5sNnF7LpRpR42YQtxBpfKfNIVGG7coBgFq0=;
 b=Ap7BGXVUGVVAFnkkZzpkD7pEXpqG5w9EsjcLYNwF0GD3dsReHNjzWBU4
 zhjGFzK+Yve8Erd6YYauQzBXM97ujGWGBB97W1GZNgP9QUSEk27KtTkOm
 MNUYXIkKHy0YToQdk5Yplx6b7d8DqdqQ1NksQIIc406FRKjU53zOv2pRV o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wCLvXhy6bOLKSzP9DShr02Qf3Edyz6gcUnMjBP2cqdr5UBNVm1vZm+yx/m/JxFSJuE9T2UpcD+
 hD64M3otiIYy7sEq3uX8gSUBRpC5IqtxcCn2J/6cYl279W22EWkE22emLoj6r5hRF0usuzmrzc
 6qKCk1eckYllYO3PFSkZBDWzl+ItAs8S63TSIpHpI/oBDTq/j2mriApF5yy7L6TJ0650cEpn56
 PvBMeRyZCK7a1UgFb8ZSnZFT77447En6JLz32Op9C510QW4yiHP/kvHu7vjl3TP2BL+VJwyPzM
 wd0=
X-SBRS: 2.7
X-MesageID: 5518160
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,486,1559534400"; 
   d="scan'208";a="5518160"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Sep 2019 18:12:05 +0100
Message-ID: <20190909171206.25585-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190909171206.25585-1-ian.jackson@eu.citrix.com>
References: <20190909171206.25585-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] tools/ocaml: Add missing CAP_PV
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCmMvcyBmMDg5
ZmRkZDk0MSBicm9rZSB0aGUgT2NhbWwgQUJJIGJ5IHJlbnVtZXJpbmcgWEVOX1NZU0NUTF9QSFlT
Q0FQX2RpcmVjdGlvCndpdGhvdXQgYWRqdXN0aW5nIHRoZSBPY2FtbCBwaHlzaW5mb19jYXBfZmxh
ZyBlbnVtZXJhdGlvbi4gIEZpeCB0aGlzIGJ5Cmluc2VydGluZyBDQVBfUFYgYmV0d2VlbiBDQVBf
SFZNIGFuZCBDQVBfRGlyZWN0SU8uCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCnYyOiBTcGxpdCB0aGlzIGludG8gaXRzIG93biBwYXRj
aC4KLS0tCiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgIHwgMSArCiB0b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmwubWxpIHwgNSArKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hj
L3hlbmN0cmwubWwgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwKaW5kZXggMzA1NjI1
Y2I2Yy4uMDk3ZjM5ZDVjZSAxMDA2NDQKLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJs
Lm1sCisrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbApAQCAtMTAwLDYgKzEwMCw3
IEBAIHR5cGUgc2NoZWRfY29udHJvbCA9CiAKIHR5cGUgcGh5c2luZm9fY2FwX2ZsYWcgPQogCXwg
Q0FQX0hWTQorCXwgQ0FQX1BWCiAJfCBDQVBfRGlyZWN0SU8KIAogdHlwZSBwaHlzaW5mbyA9CmRp
ZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpIGIvdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsLm1saQppbmRleCBkYTkzMTYwZWQzLi45NTdjOWZkYzJlIDEwMDY0NAot
LS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpCisrKyBiL3Rvb2xzL29jYW1sL2xp
YnMveGMveGVuY3RybC5tbGkKQEAgLTgzLDcgKzgzLDEwIEBAIHR5cGUgZG9tYWluaW5mbyA9IHsK
ICAgYXJjaF9jb25maWcgOiBhcmNoX2RvbWFpbmNvbmZpZzsKIH0KIHR5cGUgc2NoZWRfY29udHJv
bCA9IHsgd2VpZ2h0IDogaW50OyBjYXAgOiBpbnQ7IH0KLXR5cGUgcGh5c2luZm9fY2FwX2ZsYWcg
PSBDQVBfSFZNIHwgQ0FQX0RpcmVjdElPCit0eXBlIHBoeXNpbmZvX2NhcF9mbGFnID0KKyAgfCBD
QVBfSFZNCisgIHwgQ0FQX1BWCisgIHwgQ0FQX0RpcmVjdElPCiB0eXBlIHBoeXNpbmZvID0gewog
ICB0aHJlYWRzX3Blcl9jb3JlIDogaW50OwogICBjb3Jlc19wZXJfc29ja2V0IDogaW50OwotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
