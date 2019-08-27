Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964C39E989
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 15:36:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2baz-0004Lu-6c; Tue, 27 Aug 2019 13:33:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8wY6=WX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i2bay-0004Lp-7F
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 13:33:12 +0000
X-Inumbo-ID: 3692d9a2-c8cf-11e9-ac23-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3692d9a2-c8cf-11e9-ac23-bc764e2007e4;
 Tue, 27 Aug 2019 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566912791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E7lWg8VZF/1XKaFjN4EjgBKL9WTiyqP571uFJ5cbJcI=;
 b=bVtjEr8BDh5d9J82drP2movKiseXr5NnBeV2OLt+FMYdQ1xzUkKyVCcC
 tBsfMCDgaco4/t+GmQWi+nYQ4x+s9Sjb+XqKCPGNlJa8Ps92kvBc+Wd8W
 9U/1cIeiEQvqhNFCxhb9bU3Ae4SSge9Ypxsf3YyBensRGEYaZyuTcd1aI g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: emSXTKiNX2gORp3QuaplSz8KP+U+6F+AP0AX9vjAyXYS9qsG22RdAtqZD3oy/Ore8jVf8QVPUI
 drhUX4MNGTm9jPwnd0kSqZYWUOBNxzjaVvHUkOg2k9C+b9amuOMwX0/JV0NkfPe8IS+CWKMAnR
 QtWwhUdvmJWNDH1oM8bf1ur/T4HszN9c+Vn3dbNDRSACh75GUNUdlFVGqzd5mBHmBRtdRkLnx5
 WQ0PxWBkgnRyubR6QzO5pncwYT14IfMDAWyHj20e6JIQ2g67FzECX4Z99XGBLY+/TKMoDFRwJt
 JfU=
X-SBRS: 2.7
X-MesageID: 4987739
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,437,1559534400"; 
   d="scan'208";a="4987739"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 27 Aug 2019 14:32:55 +0100
Message-ID: <20190827133259.32084-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 0/4] xen queue 2019-08-27
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBkYWMwM2FmNWQ1NDgyZWM3ZWU5YzIz
ZGI0NjdiYjcyMzBiMzNjMGQ5OgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL3J0aC90YWdzL3B1bGwtYXhwLTIwMTkwODI1JyBpbnRvIHN0YWdpbmcgKDIwMTktMDgtMjcg
MTA6MDA6NTEgKzAxMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
CiAgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0LWh0dHAvcGVvcGxlL2FwZXJhcmQvcWVtdS1k
bS5naXQgdGFncy9wdWxsLXhlbi0yMDE5MDgyNwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIDcwNWJlNTcwOTQxYjM4Y2QxY2JlYmM2OGY3ZjY3MWNlNzUzMmVjYjA6CgogIHhlbi1idXM6
IEF2b2lkIHJld3JpdGluZyBpZGVudGljYWwgdmFsdWVzIHRvIHhlbnN0b3JlICgyMDE5LTA4LTI3
IDE0OjE4OjI4ICswMTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpYZW4gcXVldWUKCiogRml4ZXMgZm9yIHhlbi1idXMg
YW5kIGV4aXQgY2xlYW51cC4KKiBCdWlsZCBmaXguCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFudGhvbnkgUEVSQVJEICgz
KToKICAgICAgeGVuOiBGaXggcmluZy5oIGhlYWRlcgogICAgICB4ZW4tYnVzOiBGaXggYmFja2Vu
ZCBzdGF0ZSB0cmFuc2l0aW9uIG9uIGRldmljZSByZXNldAogICAgICB4ZW4tYnVzOiBBdm9pZCBy
ZXdyaXRpbmcgaWRlbnRpY2FsIHZhbHVlcyB0byB4ZW5zdG9yZQoKSWdvciBEcnV6aGluaW4gKDEp
OgogICAgICB4ZW46IGNsZWFudXAgSU9SRVEgc2VydmVyIG9uIGV4aXQKCiBody9pMzg2L3hlbi94
ZW4taHZtLmMgICAgICAgICAgICAgIHwgIDIgKysKIGh3L3hlbi94ZW4tYnVzLmMgICAgICAgICAg
ICAgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiBpbmNsdWRl
L2h3L3hlbi9pbnRlcmZhY2UvaW8vcmluZy5oIHwgMTMgKysrKysrKy0tLS0tLQogMyBmaWxlcyBj
aGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
