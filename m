Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801EC12B4BA
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 14:06:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikpHA-00087A-PW; Fri, 27 Dec 2019 13:03:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F8X0=2R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ikpH8-000875-V7
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 13:03:30 +0000
X-Inumbo-ID: 3dc71c58-28a9-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dc71c58-28a9-11ea-b6f1-bc764e2007e4;
 Fri, 27 Dec 2019 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577451794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nz0iRwCBhvbOCNjhmIG2ueCEfbkuzaWxmNn4LiId/wM=;
 b=MwlK+bpVUp6y+YW0NfQensbNySMiKfAAdJvq7wiliq5Imfbsms+t0j59
 I7/B6jAI3wgCx6hTaU7OiJBTXvVm9dwW7minA+WN0WFTVuE+Qj+ITe6Vx
 qEldS7RAQyVb//srHOhr/E/T7abSNWswdU8F3k4Hs1vPHAb3immpqJVnh Y=;
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
IronPort-SDR: qfaZ0RqxZmeQcxt1yJBjRsUdMts8smtbgppL/N9i1wUd65UfZFwBkM1SkUqdBW/9ESOGIhtP8i
 HSYjn+Zwb+pXOdiQUYcHDH8M5w+sHtdn+M/k6JvY+wOLBEBBpMsS/zbHGpdmjSUkr6d6oaYAQo
 aH2wSrcTOt3URtPbK9EV9iNE5772KI709HgmxEgVkieUECzuM7yANPu9BjoN7Knu0QYT/4mh0k
 tDX6XXcyuBmRjV3xrveW5nD8KqP6LXdlS8I7/RpPsVEa7TFla8HAz8h4UVXI7l4rIMuqG4bBgK
 cHM=
X-SBRS: 2.7
X-MesageID: 10617811
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10617811"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Dec 2019 13:03:10 +0000
Message-ID: <20191227130310.27887-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Fold gdt_48 into the bottom of
 trampoline_gdt
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2F2ZXMgOCBieXRlcyBpbiB0aGUgdHJhbXBvbGluZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ib290L3RyYW1w
b2xpbmUuUyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUu
UyBiL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUwppbmRleCBlZjViYWEzMWUwLi40Yjlh
OTY5N2U5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKKysrIGIv
eGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCkBAIC0xMzksMTIgKzEzOSwxMyBAQCBzdGFy
dDY0OgogICAgICAgICAuYmFsaWduIDgKICAgICAgICAgLndvcmQgICAwCiBpZHRfNDg6IC53b3Jk
ICAgMCwgMCwgMCAjIGJhc2UgPSBsaW1pdCA9IDAKLSAgICAgICAgLndvcmQgICAwCi1nZHRfNDg6
IC53b3JkICAgLkx0cmFtcG9saW5lX2dkdF9lbmQgLSB0cmFtcG9saW5lX2dkdCAtIDEKLSAgICAg
ICAgLmxvbmcgICBib290c3ltX3JlbCh0cmFtcG9saW5lX2dkdCw0KQogCiB0cmFtcG9saW5lX2dk
dDoKLSAgICAgICAgLnF1YWQgICAweDAwMDAwMDAwMDAwMDAwMDAgLyogMHgwMDAwOiB1bnVzZWQg
Ki8KKyAgICAgICAgLndvcmQgICAwICAgICAgICAgICAgICAgICAgLyogMHgwMDAwOiB1bnVzZWQg
KHJldXNlZCBmb3IgR0RUUikgKi8KK2dkdF80ODoKKyAgICAgICAgLndvcmQgICAuTHRyYW1wb2xp
bmVfZ2R0X2VuZCAtIHRyYW1wb2xpbmVfZ2R0IC0gMQorICAgICAgICAubG9uZyAgIGJvb3RzeW1f
cmVsKHRyYW1wb2xpbmVfZ2R0LCA0KQorCiAgICAgICAgIC5xdWFkICAgMHgwMGNmOWIwMDAwMDBm
ZmZmIC8qIDB4MDAwODogcmluZyAwIGNvZGUsIDMyLWJpdCBtb2RlICovCiAgICAgICAgIC5xdWFk
ICAgMHgwMGFmOWIwMDAwMDBmZmZmIC8qIDB4MDAxMDogcmluZyAwIGNvZGUsIDY0LWJpdCBtb2Rl
ICovCiAgICAgICAgIC5xdWFkICAgMHgwMGNmOTMwMDAwMDBmZmZmIC8qIDB4MDAxODogcmluZyAw
IGRhdGEgKi8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
