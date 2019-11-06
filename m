Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C6CF1BC0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 17:55:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSOXv-0004jF-0f; Wed, 06 Nov 2019 16:52:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZRLm=Y6=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iSOXt-0004jA-MD
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 16:52:37 +0000
X-Inumbo-ID: d5b07710-00b5-11ea-9631-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5b07710-00b5-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 16:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573059157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1zhj4s151kqjdhHc5UM2RuYGRngtrMngmkYpEm59SVo=;
 b=M68Ry0E1CboTtIn+378GY/5HLC3r2NB1h2terJQZJFDohfMDEQyweBav
 9mEL2JGgB9LfGb4i3j+S/hrAHRxEXcTk9Mc+G3m0VQ4cXNsEwx05I31it
 r9vyiJefiBFUC5024rr24IS9Pl48x/3xJ1IjcimCC2JdugMdv1r/Yfap3 w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mklsC0DupzVCsVpzF+x8wOKO1SbSDhhGsnoMYrY7K7TOI0p2XakpCq2wzZZ73g+HpY5L3oaT/z
 nBaPbT9IGyOmgDMb12cSaDpT3KvZJ4XX0moJt43rBedSbJFkvsaU22tpgq4eQl6PTPMbc5/IfB
 t85stLGjJOiYgsQQj2QrnJOMTV+GKGkQ7iXe+6s031QRJM31/SejMQER2fwY03WuKXNw49qBgk
 Uys//Cnwc2aSTSh1tGPhh1vATEWiVZyUfObqimCWZ04YhmEmuql5XBIUhSunoT6tOFIrou8ZrG
 6gw=
X-SBRS: 2.7
X-MesageID: 8056985
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,275,1569297600"; 
   d="scan'208";a="8056985"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 6 Nov 2019 16:52:31 +0000
Message-ID: <20191106165231.31589-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] sg-report-host-history: Reduce limit
 from 2000 to 200
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IHRoZSAic2ctcmVwb3J0LWhvc3QtaGlzdG9yeSIgcGFydCBvZiBtb3N0IGZsaWdo
dHMgaXMgdGFraW5nCmFuIGlub3JkaW5hdGUgYW1vdW50IG9mIHRpbWUuICBIb3Vycy4gIFRoZXNl
IGFyZSBzZXJpYWxpc2VkIGFuZCB0aGlzCmlzIGEgYmlnIHByb2JsZW0sIHNlcmlvdXNseSBpbXBl
ZGluZyB0aHJvdWdocHV0LgoKUmVkdWNpbmcgdGhpcyBsaW1pdCBieSBhIGZhY3RvciBvZiAxMCB3
aWxsIHJlZHVjZSB0aGUgYXZhaWxhYmxlCmhpc3Rvcnkgd2hlbiB3ZSBhcmUgbG9va2luZyBhdCBo
b3N0LXNwZWNpZmljIHByb2JsZW1zLiAgSXQgaXMgYW4KZW1lcmdlbmN5IGZpeC4KCkkgYW0gd29y
a2luZyBvbiBhbiBhcnJhbmdlbWVudCB3aGljaCB3aWxsIGF2b2lkIGhhdmluZyB0byByZXNjYW4g
YWxsCm9mIGhpc3RvcnkgZWFjaCB0aW1lIGFuZCB3aGljaCB3aWxsIGluc3RlYWQgcmV1c2UgcHJl
dmlvdXMgb3V0cHV0LgoKQ0M6IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KU2lnbmVk
LW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogc2ct
cmVwb3J0LWhvc3QtaGlzdG9yeSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkgYi9z
Zy1yZXBvcnQtaG9zdC1oaXN0b3J5CmluZGV4IDE4YjUzOGU5Li5iZDczOTFlMCAxMDA3NTUKLS0t
IGEvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeQorKysgYi9zZy1yZXBvcnQtaG9zdC1oaXN0b3J5CkBA
IC0yOCw3ICsyOCw3IEBAIHVzZSBQT1NJWDsKIAogdXNlIE9zc3Rlc3Q6OkV4ZWN1dGl2ZSBxdyg6
REVGQVVMVCA6Y29sb3Vycyk7CiAKLW91ciAkbGltaXQ9IDIwMDA7CitvdXIgJGxpbWl0PSAyMDA7
CiBvdXIgJGZsaWdodGxpbWl0Owogb3VyICRodG1sb3V0ID0gIi4iOwogb3VyIEBibGVzc2luZ3M7
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
