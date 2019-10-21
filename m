Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E307DF117
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:18:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZQ0-0003v7-CM; Mon, 21 Oct 2019 15:16:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=25w6=YO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iMZPy-0003v2-Bw
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:16:22 +0000
X-Inumbo-ID: bcc40fa2-f415-11e9-8aca-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcc40fa2-f415-11e9-8aca-bc764e2007e4;
 Mon, 21 Oct 2019 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571670981;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Gsg+KCj0YXAZWAQMqQ+2pg+Jo8qba2gwkJySj+iz+hM=;
 b=LuLW4CdAYrflCDRNKiZyR3lcbChNdnxnuYr4UWPdtiYfMDelKNp09XKr
 pyF2U9jVRQsv49IsTPpeUtxqL0Cavt7kHHHDW1eQXi/N0o8wkKBXMyi00
 p/j5DcJpmK+vssXQa36P4nCAp4XoztO7K4bsEYy9ogiI1mSACKDwzRl2/ Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DR7DT9+pKKOPfiGGEXLZIaFJoOZ4TjrDxyWVBJ6wwyZ213A0w/lXV0uhUEiuDRb/FjwGs3SXPR
 I5eHKhJWOPaBtGjZWGfDnLBuPW7rb1CAMJO8R6gv22cMJuHMiSaNHVVGpGb/tIAgFQ9mkVDUCN
 dQOhe+piEAfDEc3mWsBxhdm1BHiviBS0bbsoDOLjditJw2AmjE85jbbZIe9S3aH4UzJ3+iNYCJ
 4GYq8fpyNoYRjGGcihfjqkWd9ZHrx82xUcOZkAL6GEqMmxRBNP6cVFhJcG1tFTu28P53XNq0df
 gtQ=
X-SBRS: 2.7
X-MesageID: 7207329
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,324,1566878400"; 
   d="scan'208";a="7207329"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 16:16:13 +0100
Message-ID: <20191021151615.30367-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/3] cs-adjust-flight: Provide
 runvar-set-default
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
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gY2hhbmdlIHRvIGV4aXN0aW5nIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBjcy1hZGp1c3QtZmxpZ2h0IHwgMjcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2NzLWFkanVzdC1mbGlnaHQgYi9jcy1hZGp1c3QtZmxpZ2h0CmluZGV4
IGFlMzQyNTA2Li45OGQ0MDg5MSAxMDA3NTUKLS0tIGEvY3MtYWRqdXN0LWZsaWdodAorKysgYi9j
cy1hZGp1c3QtZmxpZ2h0CkBAIC0xMSw2ICsxMSw3IEBACiAjICAgam9icy1saXN0IDxqb2Itc3Bl
Yz4KICMgICBqb2JzLWRlbCA8am9iLXNwZWM+CiAjICAgcnVudmFyLXNldCA8am9iLXNwZWM+IDx2
YXItc3BlYz4gPHZhbHVlPgorIyAgIHJ1bnZhci1zZXQtZGVmYXVsdCA8am9iLXNwZWM+IDx2YXIt
c3BlYz4gPHZhbHVlPgogIyAgIHJ1bnZhci1kZWwgPGpvYi1zcGVjPiA8dmFyLXNwZWM+CiAjICAg
cnVudmFyLWNoYW5nZSA8am9iLXNwZWM+IDx2YXItc3BlYz4gPG9sZC12YWx1ZT4gPG5ldy12YWx1
ZT4KICMgICBydW52YXItcGVybG9wIDxqb2Itc3BlYz4gPHZhci1zcGVjPiA8cGVybC1leHByPgpA
QCAtMjYwLDYgKzI2MSwxMCBAQCBvdXIgJHJ1bnZhcl9ybV9xID0gZGJfcHJlcGFyZQogb3VyICRy
dW52YXJfaW5zZXJ0X3EgPSBkYl9wcmVwYXJlCiAgICAgKCJJTlNFUlQgSU5UTyBydW52YXJzIChm
bGlnaHQsIGpvYiwgbmFtZSwgdmFsLCBzeW50aCkiLgogICAgICAiIFZBTFVFUyAoPywgPywgPywg
PywgJ2YnKSIpOworb3VyICRydW52YXJfaW5zZXJ0X2RlZmF1bHRfcSA9IGRiX3ByZXBhcmUKKyAg
ICAoIklOU0VSVCBJTlRPIHJ1bnZhcnMgKGZsaWdodCwgam9iLCBuYW1lLCB2YWwsIHN5bnRoKSIu
CisgICAgICIgVkFMVUVTICg/LCA/LCA/LCA/LCAnZicpIi4KKyAgICAgIiBPTiBDT05GTElDVCBE
TyBOT1RISU5HIik7CiAKIHN1YiBydW52YXJfc2V0ICgkJCQ7JCkgewogICAgIG15ICgkam9iLCAk
bmFtZSwgJHZhbCwgJHh3aGF0KSA9IEBfOwpAQCAtMjcwLDYgKzI3NSwxNiBAQCBzdWIgcnVudmFy
X3NldCAoJCQkOyQpIHsKICAgICB2ZXJib3NlICJcbiI7CiB9CiAKK3N1YiBydW52YXJfc2V0X2Rl
ZmF1bHQgKCQkJDskKSB7CisgICAgbXkgKCRqb2IsICRuYW1lLCAkdmFsLCAkeHdoYXQpID0gQF87
CisgICAgbXkgJHkgPSAkcnVudmFyX2luc2VydF9kZWZhdWx0X3EtPmV4ZWN1dGUoJGRzdGZsaWdo
dCwgJGpvYiwgJG5hbWUsICR2YWwpOworICAgIGlmICgkeSkgeworCXZlcmJvc2UgIiRkc3RmbGln
aHQuJGpvYiAkbmFtZSA6PSBcYCR2YWwnIjsKKwl2ZXJib3NlICR4d2hhdCBpZiBkZWZpbmVkICR4
d2hhdDsKKwl2ZXJib3NlICJcbiI7CisgICAgfQorfQorCiBzdWIgZm9yX3J1bnZhcnMgKCQkJCQp
IHsKICAgICBteSAoJGpvYnNwZWMsICR2YXJzcGVjLCAkZm4sICRpZm5vbmUpID0gQF87CiAgICAg
IyBjYWxscyAkZm4tPigkam9ibmFtZSwgJHZhcm5hbWUsICR2YXJyb3cpCkBAIC0zMDYsNiArMzIx
LDE4IEBAIHN1YiBjaGFuZ2VfX3J1bnZhcl9zZXQgewogICAgIH0sICdBTllXQVknKTsKIH0KIAor
c3ViIGNoYW5nZV9fcnVudmFyX3NldF9kZWZhdWx0IHsKKyAgICBkaWUgdW5sZXNzIEBjaGFuZ2Vz
ID49IDM7CisgICAgbXkgJGpvYnMgPSBzaGlmdCBAY2hhbmdlczsKKyAgICBteSAkbmFtZSA9IHNo
aWZ0IEBjaGFuZ2VzOworICAgIG15ICR2YWwgPSBzaGlmdCBAY2hhbmdlczsKKworICAgIGZvcl9q
b2JzKCRkc3RmbGlnaHQsICRqb2JzLCBzdWIgeworICAgICAgICBteSAoJGpvYikgPSBAXzsKKyAg
ICAgICAgcnVudmFyX3NldF9kZWZhdWx0KCRqb2IsICRuYW1lLCAkdmFsKTsKKyAgICB9LCAnQU5Z
V0FZJyk7Cit9CisKIHN1YiBjaGFuZ2VfX3J1bnZhcl9kZWwgewogICAgIGRpZSB1bmxlc3MgQGNo
YW5nZXMgPj0gMjsKICAgICBteSAkam9icyA9IHNoaWZ0IEBjaGFuZ2VzOwotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
