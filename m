Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F4EC99B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 21:28:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQdTr-0000fm-Ho; Fri, 01 Nov 2019 20:25:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6PC9=YZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iQdTq-0000fh-Bk
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 20:25:10 +0000
X-Inumbo-ID: b2b049bc-fce5-11e9-b7a7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2b049bc-fce5-11e9-b7a7-bc764e2007e4;
 Fri, 01 Nov 2019 20:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572639908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XWtytgCiZuP4dIjxggkydGeBQRO3TgJbPyBBw4lTXoE=;
 b=V7WkDZ9mLqcAHtKSyac1myP3mYXgmgERNOe11JMl52Wl9d4ppy57QcCg
 ZjQwGl4srRJGv7vcw5YHuVYY/Gn5mw1YflOaO/g9MPgWfLJgS0rc97snQ
 S9RO2/kUtadaQyIkXml0F9Xos/0x/r/C7occ67FnrNLCtrNoUx1lm6ZoE Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rCrn8v6eXY7uUHWAfkkZxUlXTRI91i1ShpIlcA4ncQwBTpYzLgQCyXYCxWGZCz94XTKRppr3nX
 +0B8klPLMUJ2FSteRs7wcFTTN4Hr0rXH2S4+nGifeyAVc01BjvglXRnVTVT4YEhvltJUmRsLH7
 aMnaFrcQP/CdSEfF0BU+zTINFp2HPDiGsYmwMJR0epRvCBg2V+3TsD2Aq3NYJAZHvxUN5wzH97
 rl85oJmCRNvKRpg0WxCeGJpZm6Klf2pInL/aZvbVWJ84wqPdx5vMpBgoskxfMTIeEkuAd2x6qC
 EsI=
X-SBRS: 2.7
X-MesageID: 8128204
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,256,1569297600"; 
   d="scan'208";a="8128204"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 1 Nov 2019 20:24:59 +0000
Message-ID: <20191101202502.31750-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 0/3] Fix PV shim ballooning problems
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBkZWNpZGVkIHRvIGR1c3Qgb2ZmIG15IGVhcmx5IENQVUlEIGFkanVzdG1lbnRzIHdvcmsgaW4g
YW4gZWZmb3J0IHRvIGdldApwYXRjaCAzIGluIGEgc2Vuc2libGUgc3RhdGUgZm9yIDQuMTMuICBF
dmVyIHNvIHNsaWdodGx5IFJGQyBmb3IgNC4xMyBnaXZlbgp3aGVyZSB3ZSBhcmUgaW4gdGhlIHJl
bGVhc2UsIGJ1dCB0aGlzIGlzIGZhaXJseSBzZWxmIGNvbnRhaW5lZC4KCkFuZHJldyBDb29wZXIg
KDIpOgogIHg4Ni9ib290OiBSZW1vdmUgY2FjaGVkIENQVUlEIGRhdGEgZnJvbSB0aGUgdHJhbXBv
bGluZQogIHg4Ni9ib290OiBDYWNoZSBjcHVfaGFzX2h5cGVydmlzb3IgdmVyeSBlYXJseSBvbiBi
b290CgpTZXJnZXkgRHlhc2xpICgxKToKICB4ODYvZTgyMDogZml4IDY0MGsgLSAxTSByZWdpb24g
cmVzZXJ2YXRpb24gbG9naWMKCiB4ZW4vYXJjaC94ODYvYXBpYy5jICAgICAgICAgICAgIHwgIDIg
Ky0KIHhlbi9hcmNoL3g4Ni9ib290L2hlYWQuUyAgICAgICAgfCAxMyArKysrKysrKysrKy0tCiB4
ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMgIHwgMTMgKysrKystLS0tLS0tLQogeGVuL2Fy
Y2gveDg2L2Jvb3Qvd2FrZXVwLlMgICAgICB8IDEzICsrLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4
Ni9jcHUvY29tbW9uLmMgICAgICAgfCAgMyAtLS0KIHhlbi9hcmNoL3g4Ni9jcHUvaW50ZWwuYyAg
ICAgICAgfCAgMSArCiB4ZW4vYXJjaC94ODYvZTgyMC5jICAgICAgICAgICAgIHwgIDQgKystLQog
eGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oICAgICB8IDEyICsrKysrKysrLS0tLQogeGVuL2Fy
Y2gveDg2L2d1ZXN0L3hlbi5jICAgICAgICB8ICA2ICstLS0tLQogeGVuL2FyY2gveDg2L21tLmMg
ICAgICAgICAgICAgICB8ICAzICstLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaCB8
ICAyICstCiAxMSBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMo
LSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
