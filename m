Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE68C25F6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 20:28:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF0Lk-0000bY-JT; Mon, 30 Sep 2019 18:24:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pKq3=XZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iF0Lj-0000bT-HL
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 18:24:43 +0000
X-Inumbo-ID: 9218b4ea-e3af-11e9-97fb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 9218b4ea-e3af-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 18:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569867882;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PVq5BNQHdiosR3euQFQB4Iz0GinU3E/T98l8+pJjaeM=;
 b=e53OSFukZw1iZz25fX6+obS6LVxMWvo8wuaZnZ8Nt5VYygu6sxZa+J5h
 KHeaAOG5ocm2FLLnUCv6GTgRa4ijBon39M+3HALUjI5IAWZ65EDIZ3uuc
 ya+gqILwkwGh8nsgI0apjJdeOtSe0hpfJpkt9ofhybHmYu0A9N+FEGqM8 o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SoTF5NiQaBlJ0uG3+6R6+P3Rtl8ePalBJtpZjynI/S7WAXV5TbpkVyymx+LSL+yJtGbE5KLjez
 auAZXZ7IXKLxshgmhuzZf1Ri0kMzFhNZRZ1qrWRjbvZzbLWFo3UxhVHqSga4iAnTyT9Haf/608
 VlIY9hNW1NuCA9++g5mBc23G8AeI8rsxbuTIBBqB9rpo+MwmN91KcmHxEI6naw2vFRJVzGTbAO
 VYCL39FUHvEgE7JhQsCbg4RVWW5BYkQdmT5kc4MCAzNV4byzg2rWxLdrW7nW/7V8nydKXPnk4Z
 WNc=
X-SBRS: 2.7
X-MesageID: 6621880
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,568,1559534400"; 
   d="scan'208";a="6621880"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 19:24:35 +0100
Message-ID: <20190930182437.25478-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 0/2] xen/nospec: Add Kconfig options
 for speculative hardening
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1haW4gcHVycG9zZSBpcyBwYXRjaCAyLiAgVGhlICJsMXRmLWJhcnJpZXIiIHdvcmsgY3Vy
cmVudGx5IGNhdXNlcyBhIHBlcmYKaGl0IGFuZCBnYWlucyBubyBzYWZldHksIGFuZCBpcyB0aGVy
ZWZvcmUgdW5maXQgZm9yIGluY2x1c2lvbiBpbnRvIFhlbiA0LjEzIGF0CnRoaXMgdGltZS4KCkFu
ZHJldyBDb29wZXIgKDIpOgogIHhlbi9ub3NwZWM6IEludHJvZHVjZSBDT05GSUdfU1BFQ1VMQVRJ
VkVfQVJSQVlfSEFSREVOCiAgeGVuL25vc3BlYzogSW50cm9kdWNlIENPTkZJR19TUEVDVUxBVElW
RV9CUkFOQ0hfSEFSREVOIGFuZCBkaXNhYmxlIGl0CgogZG9jcy9taXNjL3hlbi1jb21tYW5kLWxp
bmUucGFuZG9jIHwgIDggKy0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYyAgICAgICAg
ICB8IDE3ICsrLS0tLS0tLS0tLS0tLS0tCiB4ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAgICAg
ICAgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogeGVuL2luY2x1
ZGUvYXNtLXg4Ni9jcHVmZWF0dXJlcy5oIHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbm9z
cGVjLmggICAgICB8ICA0ICsrLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvc3BlY19jdHJsLmggICB8
ICAxIC0KIHhlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaCAgICAgICAgICB8IDEyICsrKysrKysrKysr
KwogNyBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
