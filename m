Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFA2A5C44
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 20:30:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4r2o-0000zz-1l; Mon, 02 Sep 2019 18:27:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hhAT=W5=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1i4r2m-0000zp-HY
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 18:27:12 +0000
X-Inumbo-ID: 46fce2c6-cdaf-11e9-aea6-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46fce2c6-cdaf-11e9-aea6-12813bfff9fa;
 Mon, 02 Sep 2019 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567448831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BNbJDeL7n3GUij8kmCerF8nHYnoM5Ik1SO8rhN54eTA=;
 b=XgaxxpBJdZ7RomJDxVRwMOziNTFmvcWQzwjN3jdHiD2f/LDFP0yJQPiQ
 qjvJgr6szIKVbntrsqxjWgmw4TPEAYAgv6yD1Nry+ln1x7HCjsPdyzThv
 uOqSklLaxfaA0pNz6SPFXwRV8DzmsatO1dASk5OW9R7EagvV/vdU2wPgh g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=edvin.torok@citrix.com;
 spf=Pass smtp.mailfrom=edvin.torok@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 edvin.torok@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="edvin.torok@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 edvin.torok@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="edvin.torok@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CY+jcC1NA8tcoSLcGcjEDPFklu3NeiSMmsxTGX1VNuqINar7kF8UQ4ifml9DzzDKV4chcfo/22
 xoLcDg5wui6PMBiKodYqTLrMEdYfMC/VTrT0YrybPqeQofrfufL5iK4JOy3ydPdSNyuZkHy6DJ
 dqdMg70V+KKXXhk63D4T9oWBoo2J+RG4/L8cK6IWCJqpxbELw4/sqzYk/bKM+VEcjbnsdpHD21
 9EoWsQmFUpfiCSMDVwXKEIdJ50KSpL/dMzL1D0yDFqAFVKLFw95X2zqoRBW/mz48CtOuyK7cqk
 hZM=
X-SBRS: 2.7
X-MesageID: 5212107
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,460,1559534400"; 
   d="scan'208";a="5212107"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 19:27:06 +0100
Message-ID: <cover.1567448405.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/1] Avoiding RDTSC emulation due to host clock
 drift
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBub3RpY2VkIHRoYXQgUkRUU0MgZW11bGF0aW9uIGdvdCB0dXJuZWQgb24gZm9yIGEgVk0gYWZ0
ZXIgYQpzdXNwZW5kL2hvc3QtcmVib290L3Jlc3VtZSBjeWNsZS4KWGVuIGN1cnJlbnRseSBleHBl
Y3RzIGFuIGV4YWN0IG1hdGNoIGJldHdlZW4gaG9zdCBDUFUgYW5kIHNhdmVkIGd1ZXN0IENQVQpm
cmVxdWVuY3kgaW4gS0h6LCBvdGhlcndpc2UgaXQgdHVybnMgb24gUkRUU0MgZW11bGF0aW9uIGlm
IHRoZSBDUFUgZG9lc24ndApzdXBwb3J0IFRTQyBzY2FsaW5nLgoKQW4gZXhhY3QgbWF0Y2ggd291
bGQgcmVxdWlyZSB+MC40IHBwbSBhY2N1cmFjeSwgYW5kIGV2ZW4gb24gcGh5c2ljYWwgaGFyZHdh
cmUKdGhlIHBsYXRmb3JtIHRpbWVyIHVzZWQgZm9yIGNhbGlicmF0aW9uIGlzIG5vdCB0aGF0IGFj
Y3VyYXRlLiAgVGhlIGJlc3QKYWNjdXJhY3kgSSBjb3VsZCBmaW5kIHRoYXQgZGF0YXNoZWV0cy9z
cGVjaWZpY2F0aW9ucyByZXF1aXJlIGlzIDEwMCBwcG0sIHNvIGxldApYZW4gYWNjZXB0IGEgMTAw
IHBwbSBkaWZmZXJlbmNlIGluIGNsb2NrIGZyZXF1ZW5jeSBhcyAidGhlIHNhbWUiIGFuZCBkbyBu
b3QKdHVybiBvbiBSRFRTQyBlbXVsYXRpb24gZHVlIHRvIHRoYXQuCgpTbyBmYXIgSSBoYXZlIG1h
bnVhbGx5IHRlc3RlZCB0aGlzIG9uIEludGVsKFIpIFhlb24oUikgQ1BVIEU1LTI2OTcgdjMgYW5k
IGEKRGViaWFuIDkgZ3Vlc3QsIG1vcmUgdGVzdHMgcGVuZGluZy4KClNlZSB0aGUgY29tbWl0IGZv
ciBtb3JlIGRldGFpbHMuCgpFZHdpbiBUw7Zyw7ZrICgxKToKICB4ODYvYXJjaDogVk0gcmVzdW1l
OiBhdm9pZCBSRFRTQyBlbXVsYXRpb24gZHVlIHRvIGhvc3QgY2xvY2sgZHJpZnQKCiB4ZW4vYXJj
aC94ODYvdGltZS5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
