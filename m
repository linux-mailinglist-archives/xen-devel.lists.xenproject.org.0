Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8639F12651C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 15:45:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihx0V-0007U4-Qf; Thu, 19 Dec 2019 14:42:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ynai=2J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ihx0V-0007Tz-1S
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 14:42:27 +0000
X-Inumbo-ID: c3c5ee34-226d-11ea-91cf-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3c5ee34-226d-11ea-91cf-12813bfff9fa;
 Thu, 19 Dec 2019 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576766543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3l9t9cQAmhU2fPxYL8qfEiIXNeCfCRbtnDPqWRrhiQY=;
 b=d920oNS88jvVNvAnGTeCHqbdMJSZ2JAV1sCpN56/NJiWjrMJ5B9NTUDQ
 EA6zFfrzFqyK0PXhrsRRdvJRO8k/SXhaOQgNvrTiOs/A8mRXPJQcmToub
 O5m1GqpcRDyks8Cl/6ko5juYzyGE3TaiU60WlvcV7B0ceiDiah0AbfdYB 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +hNBe8+XZlAepiPYhysvAU9xXrJ7MpO34COy+N0v1N4uvbmCJN+0G59fG7K7bJnd1psLj/HcKt
 sZgxn6JTOixTKNav+hx2/XnerOPup/AfQd/6Y6Ph9D7w5hOOk+bhjnBXuastFoQm7MpaDf7ZFe
 8vnThePmrPRFLAp+Cnk2kXSYM5MNPcEJl4HsBsb+xNB5uU/mxNqv1E4yN/XJiIeq7q6WkJ9n+G
 3jA/tYKUc98g7qzNO0oGz0Os320WetwnneXbrX8mnRb7+W2c41lOTqK8gYIVODoQLXyYi8KglO
 nwA=
X-SBRS: 2.7
X-MesageID: 9949393
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,332,1571716800"; 
   d="scan'208";a="9949393"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Dec 2019 14:42:16 +0000
Message-ID: <20191219144217.305851-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219144217.305851-1-anthony.perard@citrix.com>
References: <20191219144217.305851-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 1/2] tools: Allow to make *-dir-force-update
 without ./configure
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBhbHNvIGFsbG93cyB0byBydW4gYG1ha2Ugc3JjLXRhcmJhbGxgIHdpdGhvdXQgZmlyc3Qg
aGF2aW5nIHRvIHJ1bgpgLi9jb25maWd1cmVgLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvUnVsZXMubWsgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL1J1bGVzLm1rIGIvdG9vbHMvUnVsZXMubWsKaW5kZXggY2Y4OTM1ZDZhM2Vh
Li4zMWNmNDE5ZWY0ZjUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL1J1bGVzLm1rCisrKyBiL3Rvb2xzL1J1
bGVzLm1rCkBAIC0yMzksNyArMjM5LDggQEAgc3ViZGlyLWFsbC0lIHN1YmRpci1jbGVhbi0lIHN1
YmRpci1pbnN0YWxsLSUgc3ViZGlyLXVuaW5zdGFsbC0lOiAucGhvbnkKIHN1YmRpci1kaXN0Y2xl
YW4tJTogLnBob255CiAJJChNQUtFKSAtQyAkKiBkaXN0Y2xlYW4KIAotaWZlcSAoLCQoZmluZHN0
cmluZyBjbGVhbiwkKE1BS0VDTURHT0FMUykpKQorbm8tY29uZmlndXJlLXRhcmdldHMgOj0gY2xl
YW4gc3VidHJlZS1mb3JjZS11cGRhdGUtYWxsICUtZGlyLWZvcmNlLXVwZGF0ZQoraWZlcSAoLCQo
ZmlsdGVyICQobm8tY29uZmlndXJlLXRhcmdldHMpLCQoTUFLRUNNREdPQUxTKSkpCiAkKFhFTl9S
T09UKS9jb25maWcvVG9vbHMubWs6CiAJJChlcnJvciBZb3UgaGF2ZSB0byBydW4gLi9jb25maWd1
cmUgYmVmb3JlIGJ1aWxkaW5nIG9yIGluc3RhbGxpbmcgdGhlIHRvb2xzKQogZW5kaWYKLS0gCkFu
dGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
