Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA1109097
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 16:02:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZFpn-0004va-FA; Mon, 25 Nov 2019 14:59:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tOGM=ZR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iZFpl-0004vR-Os
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 14:59:25 +0000
X-Inumbo-ID: 291fe920-0f94-11ea-b4d1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 291fe920-0f94-11ea-b4d1-bc764e2007e4;
 Mon, 25 Nov 2019 14:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574693961;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=31toGOIu1C0n6DBNKFoxp7xVO12vWjU9h5YlxY1X7yk=;
 b=D4PvCYYwXn8FLdNctm7leLPmUStvpwxYVi4Kmwcde0jrnn4KrC03KQ4C
 ZxHHBZ9KNPu5QNjYLh5T4q7LrNx1erYCdYxhBUWlf3YkE0krqo0520x31
 tYoRiRL+xmL+tzuAgi6eHIRvcdvVVF2EYd0+etLublXNgMQ7npjd9aSQ/ 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YKjdRmTwaLRd2PnGnrQvzxo7/KnS9xdfNQAUYwDnN2tS1ySi6MO7jJAYBQmgY8vh2p0huybenf
 t8g7DsCx4zmgHBKZ6Hc++yEcnwO1fKVZSvj2Rf83wYjfiEyycGPI1UzCWv5CQnzormHHUtPGIT
 xjF4uZqEBMpDhcRHIJ4v/xe70nEA+nFkMR/Zdg73If4TrwkM4PnWwF1UHYncf8a2uqOY5YWJg8
 LwZ/37bX+KOi9M4eQLsBgCewfejUmQ6qQRxw6RIijiJ4UNk1PMr/BFOdJNw7ivwBbsf6+8FqCd
 E3A=
X-SBRS: 2.7
X-MesageID: 8914850
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,241,1571716800"; 
   d="scan'208";a="8914850"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 25 Nov 2019 14:59:15 +0000
Message-ID: <20191125145915.106589-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2] x86/domctl: have
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
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
ICBDaGFuZ2VzIGluIHYyOgogICAgLSBmaXggY29kaW5nIHN0eWxlLgogICAgLSBjaGVjayBmb3Ig
dHJhbnNsYXRlZCBndWVzdHMuCiAgICAtIGF2b2lkIHByZWVtcHRpb24gb24gdGhlIGxhc3QgaXRl
cmF0aW9uLgogICAgLSBhZGQgYSBjb21tZW50IGluIHRoZSBwdWJsaWMgaGVhZGVyLgogICAgCiAg
ICBGdXJ0aGVyIHBvc3NpYmxlIGltcHJvdmVtZW50IHRvIHRoZSBoeXBlcmNhbGw6CiAgICAtIHBy
b2Nlc3Mgc2V2ZXJhbCBHRk5zIGFmdGVyIGdyYWJiaW5nIHRoZSBob3N0cDJtIGxvY2sKICAgIC0g
UmVtb3ZlIHRoZSBsaW1pdAoKIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICB8IDIwICsrKysr
KysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggfCAgNCArKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvZG9tY3RsLmMgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKaW5kZXggNDNlMzY4ZDYzYmI5Li5i
NDYxYWFkYmQ2NDAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYworKysgYi94ZW4v
YXJjaC94ODYvZG9tY3RsLmMKQEAgLTQyNSw2ICs0MjUsMjYgQEAgbG9uZyBhcmNoX2RvX2RvbWN0
bCgKICAgICAgICAgICAgICAgICByZXQgPSAtRUZBVUxUOwogICAgICAgICAgICAgICAgIGJyZWFr
OwogICAgICAgICAgICAgfQorCisgICAgICAgICAgICAvKgorICAgICAgICAgICAgICogQXZvaWQg
Y2hlY2tpbmcgZm9yIHByZWVtcHRpb24gd2hlbiB0aGUgYGhvc3RwMm0nIGxvY2sgaXNuJ3QKKyAg
ICAgICAgICAgICAqIGludm9sdmUsIGkuZS4gbm9uLXRyYW5zbGF0ZWQgZ3Vlc3QsIGFuZCBhdm9p
ZCBwcmVlbXB0aW9uIG9uCisgICAgICAgICAgICAgKiB0aGUgbGFzdCBpdGVyYXRpb24uCisgICAg
ICAgICAgICAgKi8KKyAgICAgICAgICAgIGlmICggcGFnaW5nX21vZGVfdHJhbnNsYXRlKGQpICYm
CisgICAgICAgICAgICAgICAgIGxpa2VseSgoaSArIDEpIDwgbnVtKSAmJiBoeXBlcmNhbGxfcHJl
ZW1wdF9jaGVjaygpICkKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICBkb21jdGwtPnUu
Z2V0cGFnZWZyYW1laW5mbzMubnVtID0gbnVtIC0gaSAtIDE7CisgICAgICAgICAgICAgICAgZG9t
Y3RsLT51LmdldHBhZ2VmcmFtZWluZm8zLmFycmF5LnAgPQorICAgICAgICAgICAgICAgICAgICBn
dWVzdF9oYW5kbGUgKyAoKGkgKyAxKSAqIHdpZHRoKTsKKyAgICAgICAgICAgICAgICBpZiAoIF9f
Y29weV90b19ndWVzdCh1X2RvbWN0bCwgZG9tY3RsLCAxKSApCisgICAgICAgICAgICAgICAgewor
ICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUZBVUxUOworICAgICAgICAgICAgICAgICAgICBi
cmVhazsKKyAgICAgICAgICAgICAgICB9CisgICAgICAgICAgICAgICAgcmV0dXJuIGh5cGVyY2Fs
bF9jcmVhdGVfY29udGludWF0aW9uKF9fSFlQRVJWSVNPUl9kb21jdGwsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJoIiwgdV9kb21jdGwpOwor
ICAgICAgICAgICAgfQogICAgICAgICB9CiAKICAgICAgICAgYnJlYWs7CmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgK
aW5kZXggYTAzZTgwZTU5ODRhLi4xYjY5ZWI3NWNiMjAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9kb21jdGwuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKQEAgLTE2
Myw2ICsxNjMsMTAgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX2RvbWN0bF9nZXRkb21h
aW5pbmZvX3QpOwogI2RlZmluZSBYRU5fRE9NQ1RMX1BGSU5GT19MVEFCX01BU0sgKDB4ZlU8PDI4
KQogCiAvKiBYRU5fRE9NQ1RMX2dldHBhZ2VmcmFtZWluZm8zICovCisvKgorICogQm90aCB2YWx1
ZSBgbnVtJyBhbmQgYGFycmF5JyBhcmUgbW9kaWZpZWQgYnkgdGhlIGh5cGVyY2FsbCB0byBhbGxv
dworICogcHJlZW1wdGlvbi4KKyAqLwogc3RydWN0IHhlbl9kb21jdGxfZ2V0cGFnZWZyYW1laW5m
bzMgewogICAgIC8qIElOIHZhcmlhYmxlcy4gKi8KICAgICB1aW50NjRfYWxpZ25lZF90IG51bTsK
LS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
