Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7806DABAEA
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:33:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6FGK-0001Yq-Mg; Fri, 06 Sep 2019 14:30:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6FGJ-0001Yd-Fj
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:30:55 +0000
X-Inumbo-ID: ee333e22-d0b2-11e9-abf6-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee333e22-d0b2-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 14:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567780254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N2TyVXDepvS+TgMtFoSTFDwVjdxgAHD4Cj55GFKi4Es=;
 b=NaeHyYAfAOPydYen+SMY7DhqoVYgw/h8FK6ZEGcI4FdbI3ybInw9ayv9
 goHt6SCp30Gx7uakXHIQTKZkCrCWSPN1WoB1/3DiuXJIYPEN8u/gK+edb
 S7FFq1JdG7cIujtVdbU8yQsn9IJfLWNRY2z5ugeY4VBUJFVX1SqN0lhYL I=;
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
IronPort-SDR: yrerI3+2rcqUVQpLB2aVatbPrerJfkLcarFFHQe4m0AcBizMxReqhh04wzqfWKMxxFWhJLWSrr
 Yj40VY1gm/bNd3cz5tXyRS/xCfdbJa/Jdg6kraPjkzZQr0Qioc+23/Gm19EKFyP7fWJK3AnV54
 gRV7oTNpJbJyinkh8jPVf+dAlc52i3dM1/DTZ9MV6INHtAiDgWRcH68PPGoGWB3925IRnAn+Bc
 1iXF1aKguIjEfhxjDTf32Wc30d3rHnsyrfpHnrEksj5pojsiBkNE/42z7BTc5mzOuvLEmGEJSd
 UJE=
X-SBRS: 2.7
X-MesageID: 5243033
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5243033"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 6 Sep 2019 16:30:19 +0200
Message-ID: <20190906143021.28261-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/2] libxl: choose a sane default for HAP
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
ZXIgdG8gdXNlIEhBUCBpZiB0aGUgdXNlciBoYXNuJ3QgbWFkZSBhCnNlbGVjdGlvbi4KClRoYW5r
cywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDIpOgogIHN5c2N0bDogcmVwb3J0IGV4aXN0aW5n
IHBoeXNjYXBzIG9uIEFSTQogIHN5c2N0bC9saWJ4bDogY2hvb3NlIGEgc2FuZSBkZWZhdWx0IGZv
ciBIQVAKCiB0b29scy9saWJ4bC9saWJ4bC5jICAgICAgICAgfCAgMSArCiB0b29scy9saWJ4bC9s
aWJ4bC5oICAgICAgICAgfCAgNyArKysrKysrCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAg
fCAgOCArKysrKysrLQogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwgIDEgKwogdG9vbHMv
eGwveGxfaW5mby5jICAgICAgICAgIHwgIDUgKysrLS0KIHhlbi9hcmNoL2FybS9zeXNjdGwuYyAg
ICAgICB8ICA1ICsrKystCiB4ZW4vYXJjaC94ODYvc3lzY3RsLmMgICAgICAgfCAgNCArKy0tCiB4
ZW4vY29tbW9uL3N5c2N0bC5jICAgICAgICAgfCAgMiArKwogeGVuL2luY2x1ZGUvcHVibGljL3N5
c2N0bC5oIHwgMTAgKysrKysrKy0tLQogOSBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQoKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
