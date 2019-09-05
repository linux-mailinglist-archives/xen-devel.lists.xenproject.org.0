Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E071AAA472
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 15:31:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5rn8-0005Ba-LC; Thu, 05 Sep 2019 13:27:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lv1E=XA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5rn8-0005BV-1n
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 13:27:14 +0000
X-Inumbo-ID: de53eba1-cfe0-11e9-abd1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de53eba1-cfe0-11e9-abd1-12813bfff9fa;
 Thu, 05 Sep 2019 13:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567690033;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nhp7scbkPdjqGeerQbPgyEi4aIk7IBjFLisTPEiHh6E=;
 b=EVSFmydn7PmnlHhjlZd/zz9Qd1c4kRbBjn4V4HgWROP3mL+PH2iRf23F
 Egb62j0GZOAklxYxQc8gVRnY9YNz/OeZJma7+Owgea3m8lTd7qoI3dGiJ
 myZkOzUavBlFvxSVDIBI8l3xKNao36epuo0egglqTCsbeo/PD8rrrpi6n A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /6Wd/fwtgHFXWp+aOOIhcOACo9mjkujMCWeHxDqym46O96WYOCc34hjttnxH9ojcuZ/MPaIKFk
 KgA2K8mqXoKPjoB1H3jfC2vNQLUjD2YJR9yEcW+7kDoMW4JvinY6CSQmB/5uP+tUnVUSGM8nX5
 4GqaNtp0Mgk+1wphmyPkQAkTsx9XWZaHXq8T829ivM5O+mr0FpRdWi0qCndOjZ+zP2Sf3Vb3Qy
 xigu3Gn9Tk5Hms8oTiaLLXgGU4JygWIlk7T981Tj949do8KyIhS6isYnXWXZYMeWYd+UhBEiR5
 WLM=
X-SBRS: 2.7
X-MesageID: 5182988
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5182988"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Sep 2019 15:27:01 +0200
Message-ID: <20190905132703.5554-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] libxl: choose a sane default for HAP
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
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpGaXJzdCBwYXRjaCBpcyBhIHByZXBhcmF0b3J5IGNoYW5nZSB0byBhbHNvIG1ha2Ug
dXNlIG9mIHRoZSBwaHlzY2FwcyBvbgpBUk0sIHNlY29uZCBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3
IHBoeXNjYXAgKEhBUCkgaW4gb3JkZXIgZm9yIHRoZQp0b29sc3RhY2sgdG8gZGVjaWRlIHdoZXRo
ZXIgdG8gdXNlIEhBUCBpZiB0aGUgdXNlciBoYXNuJ3QgbWFkZSBhCnNlbGVjdGlvbi4KClRoZSBz
ZXJpZXMgY2FuIGFsc28gYmUgZm91bmQgYXQ6CgpnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxl
L3JveWdlci94ZW4uZ2l0IGhhcF9pbmZvX3YyCgpUaGFua3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1v
bm5lICgyKToKICBzeXNjdGw6IHJlcG9ydCBleGlzdGluZyBwaHlzY2FwcyBvbiBBUk0KICBzeXNj
dGwvbGlieGw6IGNob29zZSBhIHNhbmUgZGVmYXVsdCBmb3IgSEFQCgogdG9vbHMvbGlieGwvbGli
eGwuYyAgICAgICAgIHwgIDEgKwogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgIHwgIDggKysr
KysrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCB8ICAxICsKIHRvb2xzL3hsL3hsX2lu
Zm8uYyAgICAgICAgICB8ICA1ICsrKy0tCiB4ZW4vYXJjaC9hcm0vc3lzY3RsLmMgICAgICAgfCAg
NSArKysrLQogeGVuL2FyY2gveDg2L3N5c2N0bC5jICAgICAgIHwgIDQgKystLQogeGVuL2NvbW1v
bi9zeXNjdGwuYyAgICAgICAgIHwgIDIgKysKIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCB8
IDEwICsrKysrKystLS0KIDggZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKCi0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
