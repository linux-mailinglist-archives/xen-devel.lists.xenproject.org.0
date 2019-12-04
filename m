Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6AE112FE8
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:24:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icXOO-0006py-RB; Wed, 04 Dec 2019 16:20:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icXOO-0006ps-3t
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 16:20:44 +0000
X-Inumbo-ID: 04e6e818-16b2-11ea-8206-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04e6e818-16b2-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575476443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0HD+BtXeJTNyjiwhNgbrLYjDLFxaMwuZxgS/PtWYtro=;
 b=Qsjraeb1zidW+s7emzWUghPsIXohMU/hX30qDhI/zt23bTyolVMRUIcY
 Ft5vDm2noTDXIcJEUMqwXZfFyq6o3upFpsl0JtULz0DbdSo6CjH7Q4H6v
 afFPHqVdkdFLdfHFR5+nXQlYC+T09c01tLwDTQ1fqiwb40CmIGq1qaGSj w=;
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
IronPort-SDR: jmgTkoGqVwGL+/YU91cHCurCTjzsHfsvKcIMy+ben4Ocu6Os1iMcfkcQA5JZN3zytYZi7rPt70
 EU6tyFEP9mXvSzhNEO11Xhl0oB3mVR4e5wy1qYVywpBYO1465yD3hQqix9qnxqaYNXEE+q9Kvf
 ZZlDlio7D6TFQRmKydnwlEhTMNBsCmuohOz9UOVBZ9vcv+rAMxGKJGXLt7RFEuPYGwXINvPJey
 cfiAkIJg6TGj+OpGyQlSeOztlVSEa31zF+lhv91ymnSihwUFlBctvJSBAM77ynXDv77cp/1iJu
 uDQ=
X-SBRS: 2.7
X-MesageID: 9745830
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9745830"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:20:21 +0100
Message-ID: <20191204162025.37510-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/4] x86: enable x2APIC mode regardless of
 interrupt remapping support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhaW1zIHRvIGFsbG93IGVuYWJsaW5nIHgyQVBJ
QyBtb2RlIHdpdGhvdXQKaW50ZXJydXB0IHJlbWFwcGluZyBzdXBwb3J0LiBUaGUgbWFpbiB1c2Fn
ZSBvZiB0aGlzIHdvdWxkIGJlIGluCnZpcnR1YWxpemVkIGVudmlyb25tZW50cywgdGhhdCB1c3Vh
bGx5IHByb3ZpZGUgeDJBUElDIHN1cHBvcnQgYnV0IG5vdAppbnRlcnJ1cHQgcmVtYXBwaW5nLgoK
U2VlIHRoZSBsYXN0IHBhdGNoIGZvciBzb21lIHBlcmZvcm1hbmNlIG51bWJlcnMgb2YgdXNpbmcg
eDJBUElDIG92ZXIKeEFQSUMgd2hlbiBydW5uaW5nIFhlbiBpbiBwdnNoaW0gbW9kZS4KClRoYW5r
cywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDQpOgogIHg4Ni9pb2FwaWM6IG9ubHkgdXNlIGRl
c3QzMiB3aXRoIHgyYXBpYyBhbmQgaW50ZXJydXB0IHJlbWFwcGluZwogICAgZW5hYmxlZAogIHg4
Ni9hcGljOiBmb3JjZSBwaHlzIG1vZGUgaWYgaW50ZXJydXB0IHJlbWFwcGluZyBpcyBkaXNhYmxl
ZAogIHg4Ni9zbXA6IGNoZWNrIEFQSUMgSUQgb24gQVAgYnJpbmd1cAogIHg4Ni9hcGljOiBhbGxv
dyBlbmFibGluZyB4MkFQSUMgbW9kZSByZWdhcmRsZXNzIG9mIGludGVycnVwdCByZW1hcHBpbmcK
CiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgfCAgMyArLQogeGVuL2FyY2gveDg2
L2FwaWMuYyAgICAgICAgICAgICAgIHwgOTQgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LQogeGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMgICAgIHwgMTggKysrKystCiB4ZW4vYXJj
aC94ODYvaW9fYXBpYy5jICAgICAgICAgICAgfCAxNCArKy0tLQogeGVuL2FyY2gveDg2L3NtcGJv
b3QuYyAgICAgICAgICAgIHwgIDcgKysrCiA1IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMo
KyksIDU4IGRlbGV0aW9ucygtKQoKLS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
