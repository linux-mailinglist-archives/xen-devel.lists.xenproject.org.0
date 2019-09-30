Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2BFC2211
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 15:35:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEvnl-0005RK-3P; Mon, 30 Sep 2019 13:33:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=znM2=XZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iEvnj-0005Qf-QR
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 13:33:19 +0000
X-Inumbo-ID: dc343989-e386-11e9-96d3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id dc343989-e386-11e9-96d3-12813bfff9fa;
 Mon, 30 Sep 2019 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569850399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kYTI4qE9ejCoyWrAGaX6Ul8JDVd6U0+fwKNPCPeurkY=;
 b=dGn5ksUmSDvrLxVEYENhnuCuw+3QnBpDztaxSnaChCBvQxhYMF5LA1EA
 KPpbzH7LBodKjmEf00zKLqzL7dYW8xdppFg1FIipHHWwBy6OecpGa5gDb
 BG4hE1aWegBrm5qZUV3rRtmACO7NkudmzesAUBSUAk1JHCtO3YGrzBHKG c=;
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
IronPort-SDR: HWGHOfWUL/uMuQCw/W/Se4LjlDcHfKHnkK/laupzBK3FMBx+C+ND/ywdXqC2fj3E02V18sk4dk
 kodGsOwtXIQgdr4knxJYnGsJbd+muEF33Hpz5RtuWlab8J5elUAKQl4YN5Q9I0mmU69WdE2fvJ
 ua9g5/CF/taeQMou010Qn75gmY/lGIznhTFw5LUnkx2+0jZ3avw3QKo06PHupMPXKk1JKFid6o
 AUJq3od5nnAlzl4Z+n3enfB12be1RQxmhlXITjNQ97ztmIvqx+BauPo4ngRAt9DKE+8oPKoQpI
 vIU=
X-SBRS: 2.7
X-MesageID: 6322255
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6322255"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 15:32:28 +0200
Message-ID: <20190930133238.49868-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 00/10] ioreq: add support for internal servers
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3VjaCBpbnRlcm5hbCBzZXJ2ZXJzIGFyZSBpbXBsZW1lbnRlZCBieSBhIHNpbmdsZSBmdW5jdGlv
biB0aGF0IGhhbmRsZXMKaW9yZXFzIGluc2lkZSB0aGUgaHlwZXJ2aXNvci4KClRoZSBtb3RpdmF0
aW9uIGJlaGluZCB0aGlzIGNoYW5nZSBpcyB0byBzd2l0Y2ggdlBDSSB0byBiZWNvbWUgYW4KaW50
ZXJuYWwgaW9yZXEgc2VydmVyLCBzbyB0aGF0IGFjY2Vzc2VzIHRvIHRoZSBQQ0kgY29uZmlnIHNw
YWNlIGNhbiBiZQptdWx0aXBsZXhlZCBiZXR3ZWVuIGRldmljZXMgaGFuZGxlZCBieSB2UENJIGFu
ZCBkZXZpY2VzIGhhbmRsZWQgYnkgb3RoZXIKaW9yZXEgc2VydmVycy4KClRoZSBpbXBsZW1lbnRh
dGlvbiBpcyBmYWlybHkgc2ltcGxlIGFuZCBsaW1pdGVkIHRvIHdoYXQncyBuZWVkZWQgYnkKdlBD
SSwgYnV0IGNhbiBiZSBleHBhbmRlZCBpbiB0aGUgZnV0dXJlIGlmIG90aGVyIG1vcmUgY29tcGxl
eCB1c2VycwphcHBlYXIuCgpUaGUgc2VyaWVzIGNhbiBhbHNvIGJlIGZvdW5kIGF0OgoKZ2l0Oi8v
eGVuYml0cy54ZW4ub3JnL3Blb3BsZS9yb3lnZXIveGVuLmdpdCBpb3JlcV92cGNpX3YzCgpUaGFu
a3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICgxMCk6CiAgaW9yZXE6IHRlcm1pbmF0ZSBjZjgg
aGFuZGxpbmcgYXQgaHlwZXJ2aXNvciBsZXZlbAogIGlvcmVxOiBzd2l0Y2ggc2VsZWN0aW9uIGFu
ZCBmb3J3YXJkaW5nIHRvIHVzZSBpb3NlcnZpZF90CiAgaW9yZXE6IGFkZCBmaWVsZHMgdG8gYWxs
b3cgaW50ZXJuYWwgaW9yZXEgc2VydmVycwogIGlvcmVxOiBhZGQgaW50ZXJuYWwgaW9yZXEgaW5p
dGlhbGl6YXRpb24gc3VwcG9ydAogIGlvcmVxOiBhbGxvdyBkaXNwYXRjaGluZyBpb3JlcXMgdG8g
aW50ZXJuYWwgc2VydmVycwogIGlvcmVxOiBhbGxvdyByZWdpc3RlcmluZyBpbnRlcm5hbCBpb3Jl
cSBzZXJ2ZXIgaGFuZGxlcgogIGlvcmVxOiBhbGxvdyBkZWNvZGluZyBhY2Nlc3NlcyB0byBNTUNG
RyByZWdpb25zCiAgdnBjaTogcmVnaXN0ZXIgYXMgYW4gaW50ZXJuYWwgaW9yZXEgc2VydmVyCiAg
aW9yZXE6IHNwbGl0IHRoZSBjb2RlIHRvIGRldGVjdCBQQ0kgY29uZmlnIHNwYWNlIGFjY2Vzc2Vz
CiAgaW9yZXE6IHByb3ZpZGUgc3VwcG9ydCBmb3IgbG9uZy1ydW5uaW5nIG9wZXJhdGlvbnMuLi4K
CiB0b29scy90ZXN0cy92cGNpL01ha2VmaWxlICAgICAgICAgICB8ICAgNSArLQogdG9vbHMvdGVz
dHMvdnBjaS9lbXVsLmggICAgICAgICAgICAgfCAgIDQgKwogeGVuL2FyY2gveDg2L2h2bS9kbS5j
ICAgICAgICAgICAgICAgfCAgMTkgKy0KIHhlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jICAg
ICAgIHwgICA5ICstCiB4ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYyAgICAgICAgICB8ICAxNCAr
LQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICAgICAgfCAgIDcgKy0KIHhlbi9hcmNo
L3g4Ni9odm0vaW8uYyAgICAgICAgICAgICAgIHwgMjQ4ICsrLS0tLS0tLS0tLS0tLS0tLS0tCiB4
ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgICAgICAgICAgICB8IDM0OCArKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3N0ZHZnYS5jICAgICAgICAgICB8ICAgOCAr
LQogeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICAgICAgICAgfCAgMjAgKy0KIHhlbi9hcmNo
L3g4Ni9waHlzZGV2LmMgICAgICAgICAgICAgIHwgICA1ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC94ODYvaW9tbXUuYyB8ICAgMiArLQogeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyAgICAg
ICAgICAgfCAgNjAgKystLS0KIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgICAgICAgICAgIHwg
IDcwICsrKysrLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmggICAgfCAgMzUgKyst
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pby5oICAgICAgICB8ICAyOSArKy0KIHhlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL2lvcmVxLmggICAgIHwgIDE3ICstCiB4ZW4vaW5jbHVkZS9hc20teDg2
L2h2bS92Y3B1LmggICAgICB8ICAgMyArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaCAgICAg
ICAgICAgfCAgIDkgKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9odm0vZG1fb3AuaCAgICAgIHwgICAx
ICsKIHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAgICAgICAgICAgIHwgIDI4ICstLQogMjEgZmls
ZXMgY2hhbmdlZCwgNDk1IGluc2VydGlvbnMoKyksIDQ0NiBkZWxldGlvbnMoLSkKCi0tIAoyLjIz
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
