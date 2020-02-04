Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B8151F8B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 18:37:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz26K-0005R4-2L; Tue, 04 Feb 2020 17:35:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iz26I-0005Qz-Hb
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 17:35:02 +0000
X-Inumbo-ID: abed1d38-4774-11ea-b211-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abed1d38-4774-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 17:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580837701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h+anamrqT2q9UTZlpaYvIXOm1XfYwgcZqBSJsR8iSoU=;
 b=K2GHsmK92qDtw9IzOx6YnJ8hdOgp6PCUZZ14/gVd1i1+6q8rxr4PZ8GS
 AZq0GZj6xwo8neMBHMc9Mpc7nq8kf7rr5JO9FgLz6Kadz+NRUKca+IPQi
 4Aamy+O9/wA9WIr4/2gQwp4jrdsMxObNzQthIKl98PdN/+dy1TEXnSDRK E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uP8q+NHyULdso6vtTJAncNVqf2wwnOUt5J5sd0itN8WB7jPVchPxPcpVyKQNO2rQqPv7ToTOqI
 Z/uxk+i85uVtoypwyWpgDoOuaaDor4tWPPyjeGJ965axMsP4uzLAHNAhaMSg7d/oC4y/ljCPwx
 7XWkX7SE3Y1oy9d64F/4zE9sxYpYiDPDK9NSzJC9c4qTT7RudUpyEVZ93dGk6cqdsffIeMAyDj
 ozSR37IiH6bEOp+e/cMxWyb29a25tfx5eOr/zbXGnYq1l+oV2m5isshVEsij3+XxTdY44AdE7I
 aOE=
X-SBRS: 2.7
X-MesageID: 12549459
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12549459"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 18:34:52 +0100
Message-ID: <20200204173455.22020-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/3] nvmx: implement support for MSR bitmaps
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpDdXJyZW50IG5lc3RlZCBWTVggY29kZSBhZHZlcnRpc2VzIHN1cHBvcnQgZm9yIHRo
ZSBNU1IgYml0bWFwIGZlYXR1cmUsCnlldCB0aGUgaW1wbGVtZW50YXRpb24gaXNuJ3QgZG9uZS4g
UHJldmlvdXMgdG8gdGhpcyBzZXJpZXMgWGVuIGp1c3QgbWFwcwp0aGUgbmVzdGVkIGd1ZXN0IE1T
UiBiaXRtYXAgKGFzIHNldCBieSBMMSkgYW5kIHRoYXQncyBpdCwgdGhlIEwyIGd1ZXN0CmVuZHMg
dXAgdXNpbmcgdGhlIEwxIE1TUiBiaXRtYXAuCgpUaGlzIHNlcmllcyBhZGRzIGhhbmRsaW5nIG9m
IHRoZSBMMiBNU1IgYml0bWFwIGFuZCBtZXJnaW5nIHdpdGggdGhlIEwxCk1TUiBiaXRtYXAgYW5k
IGxvYWRpbmcgaXQgaW50byB0aGUgbmVzdGVkIGd1ZXN0IFZNQ1MuCgpQYXRjaCAjMyBtYWtlcyBz
dXJlIHRoZSB4MkFQSUMgTVNSIHJhbmdlIGlzIGFsd2F5cyB0cmFwcGVkLCBvciBlbHNlIGEKZ3Vl
c3Qgd2l0aCBuZXN0ZWQgdmlydHVhbGl6YXRpb24gZW5hYmxlZCBjb3VsZCBtYW5hZ2UgdG8gYWNj
ZXNzIHNvbWUgb2YKdGhlIHgyQVBJQyBNU1IgcmVnaXN0ZXJzIGZyb20gdGhlIGhvc3QuCgpUaGFu
a3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICgzKToKICBudm14OiBpbXBsZW1lbnQgc3VwcG9y
dCBmb3IgTVNSIGJpdG1hcHMKICBiaXRtYXA6IGltcG9ydCBiaXRtYXBfe3NldC9jbGVhcn0gZnJv
bSBMaW51eCA1LjUKICBudm14OiBhbHdheXMgdHJhcCBhY2Nlc3NlcyB0byB4MkFQSUMgTVNScwoK
IHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyAgICAgICAgfCA4MCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0KIHhlbi9jb21tb24vYml0bWFwLmMgICAgICAgICAgICAgICAgfCA0MSAr
KysrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92dm14LmggfCAgMyAr
LQogeGVuL2luY2x1ZGUveGVuL2JpdG1hcC5oICAgICAgICAgICB8IDM5ICsrKysrKysrKysrKysr
KwogNCBmaWxlcyBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCi0t
IAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
