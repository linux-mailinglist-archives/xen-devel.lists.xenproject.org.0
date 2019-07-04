Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3195FAC0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:18:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3T4-0001za-TB; Thu, 04 Jul 2019 15:16:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3T3-0001zV-Q8
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 15:16:13 +0000
X-Inumbo-ID: a6feb854-9e6e-11e9-b35d-4758c14e316e
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6feb854-9e6e-11e9-b35d-4758c14e316e;
 Thu, 04 Jul 2019 15:16:10 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sd8etbLGFuxGXVQ8lSvfYR4iERqJuvPk+nMdKI53EvT6z5rW4GU2nAykIkrEVq3JJWY9xw+u7J
 ByGAIAwL11IAdliD/ujZSmviMGB6CzxbWm7KsR62xO0YvXrKOg8dMlNXzoRqYXi9ZxUKtOqOCZ
 CtpZgg9DbezJkyuHSmcT/2tkbUkO627dCbN5TQ/UDEUWNbBsQ/j0oqSPP7xUbfG9Z1oTuMdnsa
 7k4jFD8ajPggYEBNdu25wSQpEYtkwkkyCMUAli9zy/qbtRflzbInrfU2u1Vhy0etVlWgTC9146
 q6w=
X-SBRS: 2.7
X-MesageID: 2651576
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2651576"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 4 Jul 2019 16:15:22 +0100
Message-ID: <20190704151522.32639-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] include/public/io/ring.h: Remove xen_mb, xen_rmb,
 xen_wmb macros
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhvc2UgbWFjcm9zIHdoZXJlIGludHJvZHVjZWQgd2hlbiBhIHByZWZpeCAieGVuXyIgd2FzIGFk
ZGVkIHRvCm1iLHJtYix3bWIuIFRoZXJlIGFyZSBnYXRlZCBvbiBfX1hFTl9JTlRFUkZBQ0VfVkVS
U0lPTl9fLCBidXQgdGhlcmUKYXJlIG5vdCBwYXJ0IG9mIHRoZSBYZW4gaW50ZXJmYWNlLiBVc2Vy
cyBvZiByaW5nLmggbmVlZHMgdG8gcHJvdmlkZQp4ZW5fW3J3XT9tYigpIGFueXdhaSBiZWNhdXNl
IFtyd10/bWIoKSBpc24ndCBsaWtlbHkgdG8gZXhpc3QuCgpTdWdnZXN0ZWQtYnk6IFBhdWwgRHVy
cmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy9p
by9yaW5nLmggfCAxNSArKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2lv
L3JpbmcuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9yaW5nLmgKaW5kZXggYzVkNTNlMzEwMy4u
NTYxMGFlMTRmOCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2lvL3JpbmcuaAorKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vcmluZy5oCkBAIC0zMyw2ICszMywxMyBAQAogICogLSBz
dGFuZGFyZCBpbnRlZ2VycyB0eXBlcyAodWludDhfdCwgdWludDE2X3QsIGV0YykKICAqIFRoZXkg
YXJlIHByb3ZpZGVkIGJ5IHN0ZGludC5oIG9mIHRoZSBzdGFuZGFyZCBoZWFkZXJzLgogICoKKyAq
IEJlZm9yZSB1c2luZyB0aGUgZGlmZmVyZW50IG1hY3JvcywgeW91IG5lZWQgdG8gcHJvdmlkZSB0
aGUgZm9sbG93aW5nCisgKiBtYWNyb3M6CisgKiAtIHhlbl9tYigpICBhIG1lbW9yeSBiYXJyaWVy
CisgKiAtIHhlbl9ybWIoKSBhIHJlYWQgbWVtb3J5IGJhcnJpZXIKKyAqIC0geGVuX3dtYigpIGEg
d3JpdGUgbWVtb3J5IGJhcnJpZXIKKyAqIEV4YW1wbGUgb2YgdGhvc2UgY2FuIGJlIGZvdW5kIGlu
IHhlbmN0cmwuaC4KKyAqCiAgKiBJbiBhZGRpdGlvbiwgaWYgeW91IGludGVuZCB0byB1c2UgdGhl
IEZMRVggbWFjcm9zLCB5b3UgYWxzbyBuZWVkIHRvCiAgKiBwcm92aWRlIHRoZSBmb2xsb3dpbmcs
IGJlZm9yZSBpbnZva2luZyB0aGUgRkxFWCBtYWNyb3M6CiAgKiAtIHNpemVfdApAQCAtNDIsMTQg
KzQ5LDYgQEAKICAqIGFuZCBncmFudF90YWJsZS5oIGZyb20gdGhlIFhlbiBwdWJsaWMgaGVhZGVy
cy4KICAqLwogCi0jaW5jbHVkZSAiLi4veGVuLWNvbXBhdC5oIgotCi0jaWYgX19YRU5fSU5URVJG
QUNFX1ZFUlNJT05fXyA8IDB4MDAwMzAyMDgKLSNkZWZpbmUgeGVuX21iKCkgIG1iKCkKLSNkZWZp
bmUgeGVuX3JtYigpIHJtYigpCi0jZGVmaW5lIHhlbl93bWIoKSB3bWIoKQotI2VuZGlmCi0KIHR5
cGVkZWYgdW5zaWduZWQgaW50IFJJTkdfSURYOwogCiAvKiBSb3VuZCBhIDMyLWJpdCB1bnNpZ25l
ZCBjb25zdGFudCBkb3duIHRvIHRoZSBuZWFyZXN0IHBvd2VyIG9mIHR3by4gKi8KLS0gCkFudGhv
bnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
