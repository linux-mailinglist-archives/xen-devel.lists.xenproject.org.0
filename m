Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1EB97DF9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 17:02:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0S5K-00007Q-IF; Wed, 21 Aug 2019 14:59:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZvr=WR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0S5J-00007L-5r
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 14:59:37 +0000
X-Inumbo-ID: 4a53e92c-c424-11e9-b95f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a53e92c-c424-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566399576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jfrm7P1uSFPGn/BnajpGvRnL4WEoI68X5NrCqeeJ/b8=;
 b=TpLdtbR/THrOnYT/H2CePRFhqcXNKn28JiEOt7kvwbqMskt3XiWnZ+ok
 edZz2F5AETrP2BobHxiGah5kRHN1UPAhB9cW4si/NX1Ec58D2Ru9fksoy
 poLg+zBPEACCNwW2J8TF+ojvgV9gRbD5GZvn4BxgiEAbKVtbKP+x81g15 Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: R1VVtMNFoZOb42hJE6J45f3WtQx++29mF4UIXerHXvKQytdWZZ2KyAokbUBibvcTo4ZkfXMcK7
 /u8IUP4BwKRaqQ+5o34pB5Ha0u2r/b8rCQ3mYXFO2uJlFYH67ex3gC50isdfz+zAlxwDypO+wm
 5ZYzdLZ0AJcSEuAiWOM2Rrm/ZCog7QMvgsYnPY6ps6WA5NQr8gE/4znYPaZbAH7nDj5Hwy7W+z
 a/E+Dh1WNA5sXiz06PWiW0CjZziX+TOaEMikcnylxKUSTeAqUjec1as45/H+SibeZTrG7+UqeY
 880=
X-SBRS: 2.7
X-MesageID: 4533606
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4533606"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 21 Aug 2019 16:58:57 +0200
Message-ID: <20190821145903.45934-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821145903.45934-1-roger.pau@citrix.com>
References: <20190821145903.45934-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/7] ioreq: add fields to allow internal ioreq
 servers
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50ZXJuYWwgaW9yZXEgc2VydmVycyBhcmUgcGxhaW4gZnVuY3Rpb24gaGFuZGxlcnMgaW1wbGVt
ZW50ZWQgaW5zaWRlCm9mIHRoZSBoeXBlcnZpc29yLiBOb3RlIHRoYXQgbW9zdCBmaWVsZHMgdXNl
ZCBieSBjdXJyZW50IChleHRlcm5hbCkKaW9yZXEgc2VydmVycyBhcmUgbm90IG5lZWRlZCBmb3Ig
aW50ZXJuYWwgb25lcywgYW5kIGhlbmNlIGhhdmUgYmVlbgpwbGFjZWQgaW5zaWRlIG9mIGEgc3Ry
dWN0IGFuZCBwYWNrZWQgaW4gYW4gdW5pb24gdG9nZXRoZXIgd2l0aCB0aGUKb25seSBpbnRlcm5h
bCBzcGVjaWZpYyBmaWVsZCwgYSBmdW5jdGlvbiBwb2ludGVyIHRvIGEgaGFuZGxlci4KClRoaXMg
aXMgcmVxdWlyZWQgaW4gb3JkZXIgdG8gaGF2ZSBQQ0kgY29uZmlnIGFjY2Vzc2VzIGZvcndhcmRl
ZCB0bwpleHRlcm5hbCBpb3JlcSBzZXJ2ZXJzIG9yIHRvIGludGVybmFsIG9uZXMgKGllOiBRRU1V
IGVtdWxhdGVkIGRldmljZXMKdnMgdlBDSSBwYXNzdGhyb3VnaCksIGFuZCBpcyB0aGUgZmlyc3Qg
c3RlcCBpbiBvcmRlciB0byBhbGxvdwp1bnByaXZpbGVnZWQgZG9tYWlucyB0byB1c2UgdlBDSS4K
ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgot
LS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oIHwgMzAgKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmgg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaAppbmRleCA2YzdjNGY1YWE2Li5mMGJl
MzAzNTE3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaAorKysg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaApAQCAtNTIsMjEgKzUyLDI5IEBAIHN0
cnVjdCBodm1faW9yZXFfdmNwdSB7CiAjZGVmaW5lIE1BWF9OUl9JT19SQU5HRVMgIDI1NgogCiBz
dHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciB7Ci0gICAgc3RydWN0IGRvbWFpbiAgICAgICAgICAqdGFy
Z2V0LCAqZW11bGF0b3I7Ci0KKyAgICBzdHJ1Y3QgZG9tYWluICAgICAgICAgICp0YXJnZXQ7CiAg
ICAgLyogTG9jayB0byBzZXJpYWxpemUgdG9vbHN0YWNrIG1vZGlmaWNhdGlvbnMgKi8KICAgICBz
cGlubG9ja190ICAgICAgICAgICAgIGxvY2s7Ci0KLSAgICBzdHJ1Y3QgaHZtX2lvcmVxX3BhZ2Ug
IGlvcmVxOwotICAgIHN0cnVjdCBsaXN0X2hlYWQgICAgICAgaW9yZXFfdmNwdV9saXN0OwotICAg
IHN0cnVjdCBodm1faW9yZXFfcGFnZSAgYnVmaW9yZXE7Ci0KLSAgICAvKiBMb2NrIHRvIHNlcmlh
bGl6ZSBhY2Nlc3MgdG8gYnVmZmVyZWQgaW9yZXEgcmluZyAqLwotICAgIHNwaW5sb2NrX3QgICAg
ICAgICAgICAgYnVmaW9yZXFfbG9jazsKLSAgICBldnRjaG5fcG9ydF90ICAgICAgICAgIGJ1Zmlv
cmVxX2V2dGNobjsKICAgICBzdHJ1Y3QgcmFuZ2VzZXQgICAgICAgICpyYW5nZVtOUl9JT19SQU5H
RV9UWVBFU107CiAgICAgYm9vbCAgICAgICAgICAgICAgICAgICBlbmFibGVkOwotICAgIHVpbnQ4
X3QgICAgICAgICAgICAgICAgYnVmaW9yZXFfaGFuZGxpbmc7CisgICAgYm9vbCAgICAgICAgICAg
ICAgICAgICBpbnRlcm5hbDsKKworICAgIHVuaW9uIHsKKyAgICAgICAgc3RydWN0IHsKKyAgICAg
ICAgICAgIHN0cnVjdCBkb21haW4gICAgICAgICAgKmVtdWxhdG9yOworICAgICAgICAgICAgc3Ry
dWN0IGh2bV9pb3JlcV9wYWdlICBpb3JlcTsKKyAgICAgICAgICAgIHN0cnVjdCBsaXN0X2hlYWQg
ICAgICAgaW9yZXFfdmNwdV9saXN0OworICAgICAgICAgICAgc3RydWN0IGh2bV9pb3JlcV9wYWdl
ICBidWZpb3JlcTsKKworICAgICAgICAgICAgLyogTG9jayB0byBzZXJpYWxpemUgYWNjZXNzIHRv
IGJ1ZmZlcmVkIGlvcmVxIHJpbmcgKi8KKyAgICAgICAgICAgIHNwaW5sb2NrX3QgICAgICAgICAg
ICAgYnVmaW9yZXFfbG9jazsKKyAgICAgICAgICAgIGV2dGNobl9wb3J0X3QgICAgICAgICAgYnVm
aW9yZXFfZXZ0Y2huOworICAgICAgICAgICAgdWludDhfdCAgICAgICAgICAgICAgICBidWZpb3Jl
cV9oYW5kbGluZzsKKyAgICAgICAgfTsKKyAgICAgICAgc3RydWN0IHsKKyAgICAgICAgICAgIGlu
dCAoKmhhbmRsZXIpKHN0cnVjdCB2Y3B1ICp2LCBpb3JlcV90ICopOworICAgICAgICB9OworICAg
IH07CiB9OwogCiAvKgotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
