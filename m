Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52788A5AA2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 17:34:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4oIK-0002b6-OZ; Mon, 02 Sep 2019 15:31:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2SMQ=W5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i4oIJ-0002b1-IQ
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 15:31:03 +0000
X-Inumbo-ID: ab8a3694-cd96-11e9-aea3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab8a3694-cd96-11e9-aea3-12813bfff9fa;
 Mon, 02 Sep 2019 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567438262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PIpK+PFRgFlf4LlYd50OocyzLyQ4HFVKaPgE7ebnk1s=;
 b=KKInRl2oXS/F6zHiIyfz7xUs6IDblBMjD0x/OcHp8og0UK8uYnCZ64fA
 UM07tGT003h5IqF1Np/KMlP54H8DSqM5EfkpD1QX3c4yKgpG2Z3OZZK5N
 MSskuenXmKmznKeqkhaGJ4HhB/tTUT79Y1d9RO02q+3UyFtw/jET503Rc U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0lORir4D55fgaD907aAHDpsfTc4re7p41Y6u4SYSRKoeYDfVQQf6xyI1vsB3E1uej7sRP8LzHH
 Vqaz5nkz4d9RU6Yrz1TbEf/6geTzXHvRcvdl0O0KhCn7PRwwqtOiRwGfKLTs7naf+KecfK3bhv
 Mk1s4UID0vzclwwvOYBqq8NPYxuxtNOVdVvQqzNyIlp2rTAR1ziChbSRdV953YaCYZPXPetyE3
 5aIpwfoFM60YEUFpcmqrdQRBRdxfPyV5RLOlbgo8AMjphOjvf+ZnHDyFgONUuxsSPteqOUHLW7
 /zI=
X-SBRS: 2.7
X-MesageID: 5070876
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5070876"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 17:30:37 +0200
Message-ID: <20190902153037.99845-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] vpci: honor read-only devices
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgYWxsb3cgdGhlIGhhcmR3YXJlIGRvbWFpbiB3cml0ZSBhY2Nlc3MgdGhlIFBDSSBjb25m
aWcgc3BhY2Ugb2YKZGV2aWNlcyBtYXJrZWQgYXMgcmVhZC1vbmx5LgoKU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNl
IHYxOgogLSBDaGFuZ2UgdGhlIGFwcHJvYWNoIGFuZCBhbGxvdyBmdWxsIHJlYWQgYWNjZXNzLCB3
aGlsZSBsaW1pdGluZwogICB3cml0ZSBhY2Nlc3MgdG8gZGV2aWNlcyBtYXJrZWQgUk8uCi0tLQog
eGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgfCAxNiArKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
ZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCmluZGV4IDc1OGQ5
NDIwZTcuLmZjNWZlZWI2MjcgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCisr
KyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCkBAIC00MTgsMTMgKzQxOCwyMSBAQCB2b2lkIHZw
Y2lfd3JpdGUocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQg
c2l6ZSwKICAgICAgICAgcmV0dXJuOwogICAgIH0KIAotICAgIC8qCi0gICAgICogRmluZCB0aGUg
UENJIGRldiBtYXRjaGluZyB0aGUgYWRkcmVzcy4KLSAgICAgKiBQYXNzdGhyb3VnaCBldmVyeXRo
aW5nIHRoYXQncyBub3QgdHJhcHBlZC4KLSAgICAgKi8KKyAgICAvKiBGaW5kIHRoZSBQQ0kgZGV2
IG1hdGNoaW5nIHRoZSBhZGRyZXNzLiAqLwogICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXZfYnlfZG9t
YWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7CiAgICAgaWYgKCAhcGRldiAp
CiAgICAgeworICAgICAgICBjb25zdCB1bnNpZ25lZCBsb25nICpyb19tYXAgPSBwY2lfZ2V0X3Jv
X21hcChzYmRmLnNlZyk7CisKKyAgICAgICAgaWYgKCByb19tYXAgJiYgdGVzdF9iaXQoc2JkZi5i
ZGYsIHJvX21hcCkgKQorICAgICAgICAgICAgLyogSWdub3JlIHdyaXRlcyB0byByZWFkLW9ubHkg
ZGV2aWNlcy4gKi8KKyAgICAgICAgICAgIHJldHVybjsKKworICAgICAgICAvKgorICAgICAgICAg
KiBMZXQgdGhlIGhhcmR3YXJlIGRvbWFpbiBhY2Nlc3MgY29uZmlnIHNwYWNlIHJlZ2lvbnMgZm9y
IG5vbi1leGlzdGVudAorICAgICAgICAgKiBkZXZpY2VzLgorICAgICAgICAgKiBUT0RPOiByZXZp
c2l0IGZvciBkb21VIHN1cHBvcnQuCisgICAgICAgICAqLwogICAgICAgICB2cGNpX3dyaXRlX2h3
KHNiZGYsIHJlZywgc2l6ZSwgZGF0YSk7CiAgICAgICAgIHJldHVybjsKICAgICB9Ci0tIAoyLjIy
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
