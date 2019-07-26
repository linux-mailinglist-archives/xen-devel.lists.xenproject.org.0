Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555AE767A8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:37:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0Lv-0006Yo-Qk; Fri, 26 Jul 2019 13:33:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+y56=VX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hr0Lu-0006Yi-Jh
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:33:42 +0000
X-Inumbo-ID: fb2162bf-afa9-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fb2162bf-afa9-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:33:41 +0000 (UTC)
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
IronPort-SDR: IDFRBpV3d1vqdI+qe3bxVFaOtIoucktRgXzXL7PkKg1lNGGBTH10Su9qtm8H7220bf3JaG0/rt
 otDBCur9gKzH7/qqwtEMsUTsSE65os/gMNq4HpLlUIAdQuqqsEjLW6zEANn3SZbq8D1ryhLMHl
 0Gs3JMYWPrO4a+jEV1y3AWKwjrwaF4L9CRJC69JWzP9zxSNlNJTlMJUBN0gc91j6yriyFuRmKk
 L4YAi6XDgi7yOVNTicnc9p3AgW99jOPVQB00RP53tF8K36QzGRfGocKW0hGsJ08uaMqdg2Dcp/
 WfQ=
X-SBRS: 2.7
X-MesageID: 3473447
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3473447"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 15:33:28 +0200
Message-ID: <20190726133331.91482-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] build: honor toolchain related environment
 vars
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
Cc: Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpDdXJyZW50IFhlbiBidWlsZCBzeXN0ZW0gd2lsbCBpZ25vcmUgYW55IHRvb2xjaGFp
biByZWxhdGVkIHZhcmlhYmxlcyBvbgp0aGUgZW52aXJvbm1lbnQgd2hlbiBidWlsZGluZyAoaWU6
IENDLCBMRCwgQ1hYLi4uKSwgYW5kIHRoZSBvbmx5IHdheSB0bwpzZXQgdGhvc2UgaXMgdG8gYXNz
aWduIHRoZW0gZGlyZWN0bHkgb24gdGhlIG1ha2UgY29tbWFuZCBsaW5lIChpZTogbWFrZQpDQz1m
b28gQ1hYPWJhciAuLi4pLgoKVGhlIGZvbGxvd2luZyBzZXJpZXMgYXR0ZW1wdHMgdG8gZml4IHRo
aXMsIGJ5IHJlbW92aW5nIHRoZSBoYXJkY29kaW5nIG9mCnRoZSB0b29sY2hhaW4gdmFyaWFibGVz
IHByZXZpb3VzbHkgZG9uZSBpbiBTdGRHTlUubWsuCgpOb3RlIHRoYXQgdGhpcyBoYXMgdGhlIHNp
ZGUgZWZmZWN0IHRoYXQgdGhlIGJ1aWxkIHN5c3RlbSB3aWxsIG5vIGxvbmdlcgpwcmVwZW5kIENS
T1NTX0NPTVBJTEUgdG8gdGhlIHRvb2xjaGFpbiB2YXJpYWJsZXMgaWYgdGhvc2UgYXJlIGFscmVh
ZHkKc2V0LiBTbyBpZiB5b3UgYXJlIGJ1aWxkaW5nIFhlbiBhbmQgc2V0dGluZyBDUk9TU19DT01Q
SUxFIG1ha2Ugc3VyZQp0b29sY2hhaW4gdmFyaWFibGVzIGFyZSB1bnNldCwgb3IgaWYgc2V0IHRo
ZXkgc2hvdWxkIGNvbnRhaW4KQ1JPU1NfQ09NUElMRS4gVGhlIFRyYXZpcyBDSSBzY3JpcHQgaXMg
dXBkYXRlZCBpbiBwYXRjaCAyLzMgaW4gb3JkZXIgdG8KY29tcGx5IHdpdGggdGhlIGFib3ZlLgoK
VGhlIHNlcmllcyBjYW4gYmUgZm91bmQgYXQ6CgpnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxl
L3JveWdlci94ZW4uZ2l0IGVudl90b29scy53aXAKClJlc3VsdHMgZnJvbSBUcmF2aXMgYW5kIGdp
dGxhYiBDSSBsb29wcyBhcmUgYXQ6CgpodHRwczovL3RyYXZpcy1jaS5vcmcvcm95Z2VyL3hlbi9i
dWlsZHMvNTYzOTcyODMyCmh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvcm95
Z2VyL3hlbi9waXBlbGluZXMvNzMxMzAzMzgKClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9u
bmUgKDMpOgogIGtjb25maWc6IGluY2x1ZGUgZGVmYXVsdCB0b29sY2hhaW4gdmFsdWVzCiAgYnVp
bGQ6IGFsbG93IHBpY2tpbmcgdGhlIGVudiB2YWx1ZXMgZm9yIGNvbXBpbGVyIHZhcmlhYmxlcwog
IGJ1aWxkOiBhbGxvdyBwaWNraW5nIHRoZSBlbnYgdmFsdWVzIGZvciB0b29sY2hhaW4gdXRpbGl0
aWVzCgogY29uZmlnL1N0ZEdOVS5tayAgICAgICAgICAgICAgICAgICB8IDU1ICsrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLQogc2NyaXB0cy90cmF2aXMtYnVpbGQgICAgICAgICAgICAgICB8
ICA4ICsrKysrCiB4ZW4vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKystLQog
eGVuL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyB8ICA3ICsrLS0KIDQgZmlsZXMgY2hh
bmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xIChBcHBs
ZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
