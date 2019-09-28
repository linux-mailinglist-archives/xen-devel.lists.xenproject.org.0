Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69C2C1038
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 10:29:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iE84M-0002ke-A2; Sat, 28 Sep 2019 08:27:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yug=XX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iE84K-0002kZ-JF
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2019 08:27:08 +0000
X-Inumbo-ID: c19ab3ae-e1c9-11e9-9691-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id c19ab3ae-e1c9-11e9-9691-12813bfff9fa;
 Sat, 28 Sep 2019 08:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569659227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZBsWlkv5AGW1UZHjNoo30tEnBKB9tboApyQWLvMaT3c=;
 b=NkHN0lUFdYR1yr0jsjT4dzKEVFgr+H9pwfMt+16XyKumG5B2TOfdFSfl
 ZTmFgQFkn9zyAxxqjGi/vPa/+1x+cMwEjeawCGj6+fISRe5ohod0LB+S9
 lqDt5EbLRyF49DHhgsymBfrEHwBkAYqbLJx5D9xVrwjJsRj1C7I1drz2U o=;
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
IronPort-SDR: xNhjv9b16diC+HxxlQXE2D/485XCfNYCwf2SBVwN4PcLwHgr5XbrlvyIEB53vOWc8lP/ivAkFt
 Y7vB/LntKXNCi5VNftS/8GD3tR7VGjf3r3zN8LlvIN7uV8ivz3iirxWWiYqelLzoUQ4C/2kiZW
 NZG9meRo6p/bgj5ONtIIY7OissbDl1aXYQkSXTkNbe7YbJCBfaTWgsv06JoDIAsRCRhT7IilV5
 jGeapEzTyVlTrKRODl+g4mpoU5NaU5TfbZfRqJZoUmEnReyphanicbfBBufop3fznFF2m4z47/
 rT4=
X-SBRS: 2.7
X-MesageID: 6204110
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,558,1559534400"; 
   d="scan'208";a="6204110"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Sat, 28 Sep 2019 10:26:59 +0200
Message-ID: <20190928082659.45482-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/iommu: fix hwdom iommu requirements check
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
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qm90aCBhIHNoYWRvdyBhbmQgYSBIQVAgaHdkb20gcmVxdWlyZSBhbiBpb21tdSBhbmQgbXVzdCBi
ZSBydW4gaW4Kc3RyaWN0IG1vZGUuIENoYW5nZSB0aGUgSEFQIGNoZWNrIGludG8gYSBodm0gZG9t
YWluIGNoZWNrLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9pb21tdS5jCmluZGV4IDhiNTUwZjkwOWIuLjllZjVmMzc2YzUgMTAwNjQ0Ci0tLSBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
aW9tbXUuYwpAQCAtMTU0LDcgKzE1NCw3IEBAIGN1c3RvbV9wYXJhbSgiZG9tMC1pb21tdSIsIHBh
cnNlX2RvbTBfaW9tbXVfcGFyYW0pOwogCiBzdGF0aWMgdm9pZCBfX2h3ZG9tX2luaXQgY2hlY2tf
aHdkb21fcmVxcyhzdHJ1Y3QgZG9tYWluICpkKQogewotICAgIGlmICggaW9tbXVfaHdkb21fbm9u
ZSB8fCAhaGFwX2VuYWJsZWQoZCkgKQorICAgIGlmICggaW9tbXVfaHdkb21fbm9uZSB8fCAhaXNf
aHZtX2RvbWFpbihkKSApCiAgICAgICAgIHJldHVybjsKIAogICAgIGlvbW11X2h3ZG9tX3Bhc3N0
aHJvdWdoID0gZmFsc2U7Ci0tIAoyLjIzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
