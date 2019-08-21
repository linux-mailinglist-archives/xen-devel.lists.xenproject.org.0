Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AC197E01
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 17:03:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0S5k-0000XI-1v; Wed, 21 Aug 2019 15:00:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZvr=WR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0S5i-0000NF-77
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 15:00:02 +0000
X-Inumbo-ID: 564af23e-c424-11e9-b95f-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 564af23e-c424-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 14:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566399595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v3ayr7cSwt+nKou4nlbITu5aA2jVTt5P5LjCoxlSv8Q=;
 b=hcPmnkdmfu8XKOnBtGJQh50ZLY1V3L1/CsVDA/iB48bKruiTdRer5YTx
 TLE7twhryx7V1CVxEZD4vWj2zoDIuHTq5G7iEps2tHQalPuT0ivVzAG++
 yRV+yzoNZJV3cAQMaPLKQOvOBNWJvLq/bKin/PUKKHRdPdbOwtB7ILomi Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Vld7Dk3ZHvQzKMhTS0uhmKGoOlElbgZd4wdzWSg/lvbhs+wtlHO7nw+BMZX0MtHQW3M92sOO6J
 HGnhUFhHbPa7+5Hc8wBreV0ecOWDUHH9uhRa82WparDdTwd7yzWrODFG/Xa4TiW8Z17d+kP4Ab
 VJn1+/YSh/zjD+eP7kY6ZwgfZX3IO2VlDbx/4uS7RvxpY3X6ZkG9T+xp5D5sw/GhU+DgvaRLP/
 2xhzWKjJtivGspI4YP1rTKIiRwZkRElbUVASSH16A3AAeYv1euWpotYxPY104c3f/DYTHGtXdJ
 TX0=
X-SBRS: 2.7
X-MesageID: 4749758
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4749758"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 21 Aug 2019 16:59:00 +0200
Message-ID: <20190821145903.45934-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821145903.45934-1-roger.pau@citrix.com>
References: <20190821145903.45934-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/7] ioreq: allow registering internal ioreq
 server handler
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
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJvdmlkZSBhIHJvdXRpbmUgdG8gcmVnaXN0ZXIgdGhlIGhhbmRsZXIgZm9yIGFuIGludGVybmFs
IGlvcmVxCnNlcnZlci4gTm90ZSB0aGUgaGFuZGxlciBjYW4gb25seSBiZSBzZXQgb25jZS4KClNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0K
IHhlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyAgICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaW9yZXEuaCB8ICAzICsrKwog
MiBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS9pb3JlcS5jIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCmluZGV4IDNmYjZmZTk1
ODUuLmQ4ZmVhMTkxYWEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYworKysg
Yi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKQEAgLTQ4Niw2ICs0ODYsMzggQEAgc3RhdGljIGlu
dCBodm1fYWRkX2lvcmVxX2dmbihzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqcywgYm9vbCBidWYp
CiAgICAgcmV0dXJuIHJjOwogfQogCitpbnQgaHZtX2FkZF9pb3JlcV9oYW5kbGVyKHN0cnVjdCBk
b21haW4gKmQsIGlvc2VydmlkX3QgaWQsCisgICAgICAgICAgICAgICAgICAgICAgICAgIGludCAo
KmhhbmRsZXIpKHN0cnVjdCB2Y3B1ICp2LCBpb3JlcV90ICopKQoreworICAgIHN0cnVjdCBodm1f
aW9yZXFfc2VydmVyICpzOworICAgIGludCByYyA9IDA7CisKKyAgICBzcGluX2xvY2tfcmVjdXJz
aXZlKCZkLT5hcmNoLmh2bS5pb3JlcV9zZXJ2ZXIubG9jayk7CisgICAgcyA9IGdldF9pb3JlcV9z
ZXJ2ZXIoZCwgaWQpOworICAgIGlmICggIXMgKQorICAgIHsKKyAgICAgICAgcmMgPSAtRU5PRU5U
OworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisgICAgaWYgKCAhcy0+aW50ZXJuYWwgKQorICAg
IHsKKyAgICAgICAgcmMgPSAtRUlOVkFMOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisgICAg
aWYgKCBzLT5oYW5kbGVyICE9IE5VTEwgKQorICAgIHsKKyAgICAgICAgcmMgPSAtRUJVU1k7Cisg
ICAgICAgIGdvdG8gb3V0OworICAgIH0KKworICAgIHMtPmhhbmRsZXIgPSBoYW5kbGVyOworCisg
b3V0OgorICAgIHNwaW5fdW5sb2NrX3JlY3Vyc2l2ZSgmZC0+YXJjaC5odm0uaW9yZXFfc2VydmVy
LmxvY2spOworCisgICAgcmV0dXJuIHJjOworfQorCiBzdGF0aWMgdm9pZCBodm1fdXBkYXRlX2lv
cmVxX2V2dGNobihzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqcywKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBodm1faW9yZXFfdmNwdSAqc3YpCiB7CmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vaW9yZXEuaAppbmRleCBlODExOWIyNmE2Li4yMTMxYzk0NGQ0IDEwMDY0NAotLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL2lvcmVxLmgKQEAgLTU1LDYgKzU1LDkgQEAgdW5zaWduZWQgaW50IGh2bV9icm9hZGNhc3Rf
aW9yZXEoaW9yZXFfdCAqcCwgYm9vbCBidWZmZXJlZCk7CiAKIHZvaWQgaHZtX2lvcmVxX2luaXQo
c3RydWN0IGRvbWFpbiAqZCk7CiAKK2ludCBodm1fYWRkX2lvcmVxX2hhbmRsZXIoc3RydWN0IGRv
bWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICgq
aGFuZGxlcikoc3RydWN0IHZjcHUgKnYsIGlvcmVxX3QgKikpOworCiAjZW5kaWYgLyogX19BU01f
WDg2X0hWTV9JT1JFUV9IX18gKi8KIAogLyoKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
