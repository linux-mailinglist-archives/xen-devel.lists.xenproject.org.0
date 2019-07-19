Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767A6E619
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:10:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoScW-0007tu-8h; Fri, 19 Jul 2019 13:08:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BD8j=VQ=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hoScU-0007tj-Tj
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:08:18 +0000
X-Inumbo-ID: 456bb9e8-aa26-11e9-97e8-afc52c91b028
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 456bb9e8-aa26-11e9-97e8-afc52c91b028;
 Fri, 19 Jul 2019 13:08:16 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0RQYjNoFlcvkczk0XGFi+hODCidiu/fYGSWqaDRdYFT1zrYgbzl1rQJzFrFUNVhgWbcyCPZp9N
 OpufiRm3Bwe8/qZPpVDYsV5v4WeAa8UtAhEuwxC4/4gbQNKpBYxbHaKRB9tnYpMmpkUK+PQnR5
 GHmyH3XdvZcU2XDAZXMjD8QXI9O8zs+OXgLuOCCQStBBRdMkRgl2OP/bROAcyNPEu0O5jiowSM
 BguVY5khVvSCY3W9EUNYYscJ/e2cAH7XNYdsqiCBWtjdzxP+k/lbN0vlkKDfA4jTnqXLFI7QVu
 w60=
X-SBRS: 2.7
X-MesageID: 3197137
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3197137"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 19 Jul 2019 14:07:48 +0100
Message-ID: <1563541668-6012-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/crash: fix kexec transition breakage
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9sbG93aW5nIDZmZjU2MGY3ZiAoIng4Ni9TTVA6IGRvbid0IHRyeSB0byBzdG9wIGFscmVhZHkg
c3RvcHBlZCBDUFVzIikKYW4gaW5jb3JyZWN0IGNvbmRpdGlvbiB3YXMgcGxhY2VkIGludG8ga2V4
ZWMgdHJhbnNpdGlvbiBwYXRoCmxlYXZpbmcgY3Jhc2hpbmcgQ1BVIGFsd2F5cyBvbmxpbmUgYnJl
YWtpbmcga2R1bXAga2VybmVsIGVudGVyaW5nLgpDb3JyZWN0IGl0IGJ5IHVuaWZ5aW5nIHRoZSBj
b25kaXRpb24gd2l0aCBzbXBfc2VuZF9zdG9wKCkuCgpTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpo
aW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvY3Jhc2gu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcmFzaC5jIGIveGVuL2FyY2gveDg2L2NyYXNoLmMK
aW5kZXggZjk3NzJkYy4uYTlmM2UxOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2NyYXNoLmMK
KysrIGIveGVuL2FyY2gveDg2L2NyYXNoLmMKQEAgLTE2OSw3ICsxNjksNyBAQCBzdGF0aWMgdm9p
ZCBubWlfc2hvb3Rkb3duX2NwdXModm9pZCkKICAgICAgKi8KICAgICBpb21tdV9jcmFzaF9zaHV0
ZG93bigpOwogCi0gICAgaWYgKCBudW1fb25saW5lX2NwdXMoKSA+IDEgKQorICAgIGlmICggY3B1
X29ubGluZShjcHUpICkKICAgICB7CiAgICAgICAgIF9fc3RvcF90aGlzX2NwdSgpOwogCi0tIAoy
LjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
