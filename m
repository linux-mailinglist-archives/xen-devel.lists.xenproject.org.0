Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A356E725
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 16:09:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoTXm-0006vx-Fo; Fri, 19 Jul 2019 14:07:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RcFV=VQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hoTXk-0006vp-RH
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 14:07:28 +0000
X-Inumbo-ID: 8a6767af-aa2e-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a6767af-aa2e-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 14:07:28 +0000 (UTC)
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
IronPort-SDR: L3TYv7tqp1VYMHLir6LYWAlNpIQEKVZ0ngmiZx0lBt0UfhekaOUM3v4V7qewJ2isIvj+YrYenb
 WU7SNizBw5wk4/yre5RXhgimXABiHdBD9BdQ+2AHIgN2hdKaUxYC/k8S01VJyNgpF8OyVoCqFa
 u7visGt88fAxmT26FM7vJg/iFpEx40ODK2mZ5TgqqX/k+e22SNPdPx3bFC4r7ESF5yq53REi4M
 aiWttOhvARh3r1aQonvQTlzgPB0U2nj8e9TtOdylMpy+SaeWXM/GIAJYx8ukWGgX3b8q1lPIA2
 t6k=
X-SBRS: 2.7
X-MesageID: 3275618
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3275618"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 19 Jul 2019 16:07:18 +0200
Message-ID: <20190719140724.69596-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/6] pci: expand usage of pci_sbdf_t
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

SGVsbG8sCgpUaGUgZm9sbG93aW5nIGFyZSB0aGUgcmVtYWluaW5nIHBhdGNoZXMgZnJvbSBteSAn
ZXhwYW5kIHVzYWdlIG9mCnBjaV9zYmRmX3QnIHByZXZpb3VzIHNlcmllcyBleGNlcHQgZm9yIHRo
ZSBvbmUgdGhhdCBpbnRyb2R1Y2VzIGEgY3VzdG9tCnByaW50ZiBmb3JtYXR0ZXIgZm9yIHBjaV9z
YmRmX3QuCgpJJ3ZlIGFsc28gcHVzaGVkIHRoZW0gdG8gbXkgZ2l0IHRyZWUgYXQ6CgpnaXQ6Ly94
ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL3JveWdlci94ZW4uZ2l0IHBjaV9zYmRmX3QKClRoYW5rcywg
Um9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDYpOgogIHBjaTogc3dpdGNoIHBjaV9jb25mX3JlYWQ4
IHRvIHVzZSBwY2lfc2JkZl90CiAgcGNpOiBzd2l0Y2ggcGNpX2NvbmZfcmVhZDE2IHRvIHVzZSBw
Y2lfc2JkZl90CiAgcGNpOiBzd2l0Y2ggcGNpX2NvbmZfcmVhZDMyIHRvIHVzZSBwY2lfc2JkZl90
CiAgcGNpOiBzd2l0Y2ggcGNpX2NvbmZfd3JpdGU4IHRvIHVzZSBwY2lfc2JkZl90CiAgcGNpOiBz
d2l0Y2ggcGNpX2NvbmZfd3JpdGUxNiB0byB1c2UgcGNpX3NiZGZfdAogIHBjaTogc3dpdGNoIHBj
aV9jb25mX3dyaXRlMzIgdG8gdXNlIHBjaV9zYmRmX3QKCiB4ZW4vYXJjaC94ODYvY3B1L2FtZC5j
ICAgICAgICAgICAgICAgICAgICAgfCAgMTUgKy0KIHhlbi9hcmNoL3g4Ni9kbWlfc2Nhbi5jICAg
ICAgICAgICAgICAgICAgICB8ICAgNiArLQogeGVuL2FyY2gveDg2L21tLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvbXNpLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxNzAgKysrKysrKysrLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvb3Byb2Zp
bGUvb3BfbW9kZWxfYXRobG9uLmMgICAgfCAgMTAgKy0KIHhlbi9hcmNoL3g4Ni94ODZfNjQvbW1j
b25mLWZhbTEwaC5jICAgICAgICB8ICAgOCArLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbWNvbmZp
Zy1zaGFyZWQuYyAgICAgIHwgIDE0ICstCiB4ZW4vYXJjaC94ODYveDg2XzY0L3BjaS5jICAgICAg
ICAgICAgICAgICAgfCAgOTggKysrKystLS0tLS0tCiB4ZW4vZHJpdmVycy9hY3BpL3JlYm9vdC5j
ICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIHhlbi9kcml2ZXJzL2NoYXIvZWhjaS1kYmdwLmMg
ICAgICAgICAgICAgICB8ICA0OSArKystLS0KIHhlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jICAg
ICAgICAgICAgICAgICB8ICA3MSArKysrKy0tLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9kZXRlY3QuYyB8ICAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X2luaXQuYyAgIHwgIDE3ICstLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXRzLmggICAg
ICAgICAgICAgIHwgICA0ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyAgICAgICAg
ICAgICAgfCAxMDIgKysrKystLS0tLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2Rt
YXIuYyAgICAgICAgIHwgICA2ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvcXVpcmtz
LmMgICAgICAgfCAgNjEgKysrKy0tLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9hdHMu
YyAgICAgICAgICB8ICAxNSArLQogeGVuL2RyaXZlcnMvcGNpL3BjaS5jICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIzICsrLQogeGVuL2RyaXZlcnMvdmlkZW8vdmdhLmMgICAgICAgICAgICAgICAg
ICAgIHwgIDExICstCiB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jICAgICAgICAgICAgICAgICAg
fCAgNDcgKysrLS0tCiB4ZW4vZHJpdmVycy92cGNpL21zaS5jICAgICAgICAgICAgICAgICAgICAg
fCAgIDcgKy0KIHhlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jICAgICAgICAgICAgICAgICAgICB8ICAx
MSArLQogeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgICAgICAgICAgICAgICAgICAgIHwgIDQyICsr
LS0tCiB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICAgICAgICAgICAgICAgfCAgMjQgKy0t
CiAyNSBmaWxlcyBjaGFuZ2VkLCAzNTMgaW5zZXJ0aW9ucygrKSwgNDY3IGRlbGV0aW9ucygtKQoK
LS0gCjIuMjAuMSAoQXBwbGUgR2l0LTExNykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
