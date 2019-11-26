Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB410A0F0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:05:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcL8-0004dk-MF; Tue, 26 Nov 2019 15:01:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/P3v=ZS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iZcL7-0004dd-Gm
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:01:17 +0000
X-Inumbo-ID: 987a02fa-105d-11ea-83b8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 987a02fa-105d-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574780476;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=LOy34b/ZOLZMEdjhXmZkgV2+c8v6suRD8VkBaKW6uP4=;
 b=cnREM5KT7l0h6KCmM5jy7uCZFNL4+KBv0mxLu5ZlY7UII/754WLlSj9E
 FH285PFAONDbTflBsqRPP/8fvdsl5gQkuFHq99um8v+Kxwl7VqHY3J5Pi
 EKUWXxVVNeMNHi+zR8sD2UmZvoazUAY1ZPxI+AxTF7CZpbmVFHIXIwQ2o A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 00uiuIchBw9dDrML5VAo0FWihMP0+qUXlAx1C4Jb8UTwUBePYC4vFeaU7AlCnlMo1Z9l/mBqKl
 ooS7dOhq15a9DHqAmMB+zgqnWSYs+DF4HMuBtRijttvmEBKkSrQO7zaBL5LqnrXM8Cf0TOdKaO
 bOY75692yjvEx/932enjIimwuhDqDkKMPd8QsBh+dsifLShrWNsxBusL38yqs7ivV79YTE5zP3
 dDqy84e9EhpxqZL9MIs+LUo4zRgFgGurYOmrBvLS+TN+Qm/ePzNvlJpIjX7tp/zFDyNYzLOuQ0
 xgs=
X-SBRS: 2.7
X-MesageID: 9211181
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9211181"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 15:01:10 +0000
Message-ID: <20191126150112.12704-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 0/2] Fixes to AMD IOMMU logging
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UkZDIGZvci00LjEzLiAgVGhlc2UgYXJlIGRpYWdub3N0aWMgaW1wcm92ZW1lbnRzL2NvcnJlY3Rp
b25zLCBzbyBhcmUgbG93IHJpc2sKYW5kIGhpZ2ggdXRpbGl0eS4KCkFuZHJldyBDb29wZXIgKDIp
OgogIEFNRC9JT01NVTogQWx3YXlzIHByaW50IElPTU1VIGVycm9ycwogIEFNRC9JT01NVTogUmVu
ZGVyIElPX1BBR0VfRkFVTFQgZXJyb3JzIGluIGEgbW9yZSB1c2VmdWwgbWFubmVyCgogeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYyAgICAgIHwgNDggKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LXBy
b3RvLmggfCAgMyAtLQogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyNCBkZWxl
dGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
